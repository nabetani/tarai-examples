#include <stdio.h>

static int tarai(const int x, const int y, const int z){
   if (x > y){
      return tarai( tarai(x-1, y, z), tarai(y-1, z, x), tarai(z-1, x, y) );
   } else {
      return y;
   }
}

int main(void){
   printf("%d\n", tarai(14, 7, 0));
   return 0;
}
