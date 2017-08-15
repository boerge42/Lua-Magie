/*  
 * performance.c
 * ================
 * Uwe Berger; 2015
 * 
 * ...ein kleiner Performance-Test
 * 
 */


#include <stdio.h>
#include <time.h>

#define FACT 20
#define COUNT 1000

// ******************************************************
long long int factorial (unsigned int n) 
{
	if (n <= 1) {
		return n;
	} else {
		return n * factorial(n-1);
	}
}

// ******************************************************
// ******************************************************
// ******************************************************
int main() {
	clock_t prgstart, prgende;
	unsigned int i;
	
	printf("%d! = %lld\n", FACT, factorial(FACT));

	prgstart=clock();
	for (i=0; i<COUNT; i++) {
		factorial(FACT);
	}
	prgende=clock();

	printf("Laufzeit (%d x %d!): %.3fms\n",	COUNT, FACT,
		(float)(prgende-prgstart)/CLOCKS_PER_SEC*1000);

	return 0;
}
