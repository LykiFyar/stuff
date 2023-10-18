# Lab Guide 5

## Exercise 1

### a.

No, due to scheduling.

### b.

Yes, in thread the output follows the order of the sequencial program.

### c.

Is distributed between threads randomly, depending on the scheduling.

## Exercise 2

### a.

2.1 - Thread 0 goes from 0-49 while thread 1 goes from 50-99 (work-sharing)

2.2 - Only the master thread works

2.3 - Only a single thread works, either thread 0 or 1

### b.

Yes.

### c. 

The order of the output is always the same.

Now both threads run the whole loop, without work-sharing.

## Exercise 3

### a.

No. One of the threads reaches the barrier and needs to wait for the other one to arrive at the barrier for both to proceed.

### b.

Yes. It prints the output in the order of the sequencial program while the for loop runs in parallel.

## Exercise 4

### a.

4.1 - Is distributed N interations per thread alternately in a static way (this case 10) until the end of the loop. 

4.2 - Is distributed N interations per thread alternately and dynamically (this case 10) until the end of the loop. 

4.3 - 

### b.

4.1 - Yes.

4.2 - No.

4.3 - No.
