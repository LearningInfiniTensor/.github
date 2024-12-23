#include <cstdio>

__global__ void hello() {
    printf("Hello, this is thread[%d.%d].\n", blockIdx.x, threadIdx.x);
}

int main() {
    hello<<<2, 4>>>();
    return 0;
}
