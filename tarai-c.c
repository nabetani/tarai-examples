#include <stdio.h>
#include <stdlib.h>

static int tarai(int x, int y, int z){
   if (x > y){
      return tarai( tarai(x-1, y, z), tarai(y-1, z, x), tarai(z-1, x, y) );
   } else {
      return y;
   }
}

int main(int argc, char const * argv[]){
   int x = argc < 4 ? 14 : atoi(argv[1]);
   int y = argc < 4 ? 7 : atoi(argv[2]);
   int z = argc < 4 ? 0 : atoi(argv[3]);
   printf("tarai(%d, %d, %d) = %d\n", x, y, z, tarai(x, y, z));
   return 0;
}
