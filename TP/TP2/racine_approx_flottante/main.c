#include <stdio.h>
#include<stdint.h>

extern float racine_carre_flottante();

int main(void) {
	float racine = racine_carre_flottante();
	printf("La racine carree flottante de 12 = %f\n",racine);
	return 0;
}
