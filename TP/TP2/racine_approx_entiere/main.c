#include <stdio.h>
#include<stdint.h>

extern int32_t racine_carree_entiere(int32_t a,int32_t b);

int main(void) {
	int32_t n = 15;
	int32_t iteration = 10;
	int32_t racine = racine_carree_entiere(n,iteration);
	printf("La racine carree entiere de %d = %d\n",n,racine);
	return 0;
}
