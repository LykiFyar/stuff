#include <mpi.h> 
#include <stdio.h> 
int main( int argc, char *argv[]) { 
    int rank, send, receive, size; 
    MPI_Status status; 
    MPI_Init(&argc, &argv); 
    MPI_Comm_rank( MPI_COMM_WORLD, &rank ); // gets this process rank 
    MPI_Comm_size(MPI_COMM_WORLD, &size); // gets number of processes
    
    if (rank == 0) { 
        send = 123456; 
        for(int worker = 1; worker < size - 1; worker++)
            for(int i = 0; i < 10; i++) {
                MPI_Send( &send, 1, MPI_INT, worker, 0, MPI_COMM_WORLD); 
                MPI_Recv( &receive, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, &status );
            }         // (buf, count, datatype, dest, tag, comm)
    } 
    else {
        for(int i = 0; i < 10; i++) {
            MPI_Recv( &receive, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, &status ); printf( "Received %d\n", receive); 
            MPI_Send( &receive, 1, MPI_INT, 0, 0, MPI_COMM_WORLD); 
        }
    }
}