#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "papi.h"

#include "quicksort.h"

static int verify_command_line (int argc, char *argv[], int *m_size, int *version);
static int alloc_vector (float **m, int m_size);
static int ini_vector (float **m, int m_size);
static int free_vector (float **m);
static void print_usage (char *msg);
static float my_rand (void);
static int sort_OK (float *m, int N);


#define NUM_EVENTS 2
int Events[NUM_EVENTS] = { PAPI_TOT_CYC, PAPI_TOT_INS};

// PAPI counters' values
long long values[NUM_EVENTS], min_values[NUM_EVENTS];


int main (int argc, char *argv[]) {
  long long start_usec, end_usec, elapsed_usec;
  int total_elements, version, i;
  float *a;
  int num_hwcntrs = 0;

  if (!verify_command_line (argc, argv, &total_elements, &version)) {
	return 1;
  }

  fprintf (stdout, "Total of %d elements!\n", total_elements);

  fprintf (stdout, "\nSetting up PAPI...");
  // Initialize PAPI 
  PAPI_library_init (PAPI_VER_CURRENT);

  /* Get the number of hardware counters available */
  if ((num_hwcntrs = PAPI_num_counters()) <= PAPI_OK)  {
    fprintf (stderr, "PAPI error getting number of available hardware counters!\n");
    return 1;
  }
  fprintf(stdout, "done!\nThis system has %d available counters.\n\n", num_hwcntrs);

  // We will be using at most NUM_EVENTS counters
  if (num_hwcntrs >= NUM_EVENTS) {
    num_hwcntrs = NUM_EVENTS;
  } else {
    fprintf (stderr, "Error: there aren't enough counters to monitor %d events!\n", NUM_EVENTS);
    return 1;
  }

  // ini vector
  fprintf (stdout, "Initializing Vector...");
  if (!ini_vector (&a, total_elements)) return 1;
  fprintf (stdout, "done!\n");


   // use PAPI timer (usecs) - note that this is wall clock time
   // for process time running in user mode -> PAPI_get_virt_usec()
   // real and virtual clock cycles can also be read using the equivalent
   // PAPI_get[real|virt]_cyc()
   start_usec = PAPI_get_real_usec();

   /* Start counting events */
   if (PAPI_start_counters(Events, num_hwcntrs) != PAPI_OK) {
     fprintf (stderr, "PAPI error starting counters!\n");
     return 1;
   }

   quickSort(a, total_elements);

   /* Stop counting events */
   if (PAPI_stop_counters(values, NUM_EVENTS) != PAPI_OK) {
     fprintf (stderr, "PAPI error stoping counters!\n");
     return 1;
   }

   end_usec = PAPI_get_real_usec();
   fprintf (stderr, "done!\n");

   elapsed_usec = end_usec - start_usec;


  printf ("\nWall clock time: %f secs\n", (float)elapsed_usec/1000000.0);
 
  //Run 2 
  start_usec = PAPI_get_real_usec();
  quickSort(a, total_elements);
  end_usec = PAPI_get_real_usec();
  elapsed_usec = end_usec - start_usec;
  printf ("\nWall clock time run 2: %f secs\n", (float)elapsed_usec/1000000.0);



  // output PAPI counters' values
  for (i=0 ; i< NUM_EVENTS ; i++) {
	  char EventCodeStr[PAPI_MAX_STR_LEN];

	  if (PAPI_event_code_to_name(Events[i], EventCodeStr) == PAPI_OK) {
		fprintf (stdout, "%s = %lld\n", EventCodeStr, values[i]);
	  } else {
		fprintf (stdout, "PAPI UNKNOWN EVENT = %lld\n",values[i]);
	  }
  }

#if NUM_EVENTS >1
  // evaluate CPI and Texec here
  if ((Events[0] == PAPI_TOT_CYC) && (Events[1] == PAPI_TOT_INS)) {
    float CPI = ((float) values[0]) / ((float) values[1]);
    fprintf (stdout, "CPI = %.2f\n", CPI);
  }
#endif

   if(sort_OK(a, total_elements)) fprintf (stdout, "Vector is sort...Valid result.");
   else fprintf (stderr, "Sort function not correct.");

  free_vector (&a);

  printf ("\nThat's all, folks\n");
  return 0;
}

int verify_command_line (int argc, char *argv[], int *total_elements, int *version) {
	int val;

	if (argc!=2) {
		print_usage ((char *)"Exactly 1 arguments are required!");
		return 0;
	}

	val = atoi (argv[1]);

	if (val <= 0) {
		print_usage ((char *)"The vector size is the size of vector and must be a positive integer!");
		return 0;
	}
	else {
		*total_elements = val;
	}
				
	return 1;
}

void print_usage (char *msg) {
	fprintf (stderr, "Command Line Error! %s\n", msg);
	fprintf (stderr, "Usage:\tgemm <matrix size> <version>\n\n");
}

int sort_OK (float *m, int N) {
    int i;
	for (i=1 ; i<N ; i++ ) {
		if(m[i-1] > m[i]) return 0;
	}
	return 1;
}

int alloc_vector (float **m, int N) {

	*m = (float *) malloc (N*sizeof(float));
	if (!(*m)) {
		print_usage ((char *)"Could not allocate memory for matrix!");
		return 0;
	}
	return 1;
}

float my_rand (void) {
  double d;

  d = drand48 ();
  d *= 1.E10;
  d -= 0.5E10;
  return ((float)d);
}

int ini_vector (float **m, int N) {
 	int i;
	float *ptr;

	if (!alloc_vector (m, N)) return 0;
	for (i=0 , ptr = (*m) ; i<N ; i++ , ptr++) {
		*ptr = my_rand();
	}
	return 1;
} 


int free_vector (float **m) {
  free (*m);
  *m = NULL;
  return 1;
}



