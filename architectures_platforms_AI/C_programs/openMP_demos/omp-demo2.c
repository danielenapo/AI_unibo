/****************************************************************************
 *
 * omp-demo2.c - "Hello world" with OpenMP
 *
 * Last updated in 2017 by Moreno Marzolla <moreno.marzolla(at)unibo.it>
 *
 * To the extent possible under law, the author(s) have dedicated all 
 * copyright and related and neighboring rights to this software to the 
 * public domain worldwide. This software is distributed without any warranty.
 *
 * You should have received a copy of the CC0 Public Domain Dedication
 * along with this software. If not, see 
 * <http://creativecommons.org/publicdomain/zero/1.0/>. 
 *
 * --------------------------------------------------------------------------
 *
 * Compile with:
 * gcc -fopenmp omp-demo2.c -o omp-demo2
 *
 * Run with:
 * OMP_NUM_THREADS=8 ./omp-demo2
 *
 ****************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

void say_hello( void )
{
    int my_rank = omp_get_thread_num();
    int thread_count = omp_get_num_threads();
    printf("Hello from thread %d of %d\n", my_rank, thread_count);
}

int main( int argc, char* argv[] )
{
    int thr = 2;

    if ( argc == 2 )
	thr = atoi( argv[1] );

#pragma omp parallel num_threads(thr)
    say_hello();

    return 0;
}
