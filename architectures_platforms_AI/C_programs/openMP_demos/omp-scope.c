/* omp-scope.c */
#include <stdio.h>

int main( void )
{
	int a=1, b=1, c=1, d=1;	
	//we can explicetely define the scope (visibility) of variables with regards to subthreads
#pragma omp parallel num_threads(10)\ //with more threads it's likely to get non deterministic values for shared variables (due to conflicts when accessing memory)
	private(a) shared(b) firstprivate(c) //a is a private variable for each thread, b is shared, c is initialized with c's value but treated as private. d by default is shared
	{	
		printf("Hello World!\n");
		a++;	
		b++;	
		c++;	
		d++;	
	}	
	printf("a=%d\n", a);
	printf("b=%d\n", b);
	printf("c=%d\n", c);
	printf("d=%d\n", d);
	return 0;
}