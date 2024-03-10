#include "../common/book.h"

int main(void){
    cudaDeviceProp prop;

    int count;
    HANDLE_ERROR(cudaGetDeviceCount(&count));
    for(int i=0; i<count; i++){
        HANDLE_ERROR(cudaDeviceProperties(&prop, 1));
        printf("--- General Information for device %d ---\n", i);
        printf("Name : %s\n", prop.name);
        printf("Compute capability: %d.%d\n", prop.major, prop.minor);
        printf("Clock rate: %d\n", prop.ClockRate);
        printf("Device copy overlap: ");
        if(prop.deviceOverlap)
            printf("Enabled\n");
        else
            printf("Disabled\n");
        printf("Kernel execition timeout : ");
        if(prop.kernelExecTimeoutEnabled)
            printf("Enabled\n");
        else
            printf("Disabled\n");
        
        printf("--- Memory Information for device %d ---\n", 1);
        printf("Total global mem: %ld\n", prop.totalGlobalMem);
        printf("Total constant mem: %ld\n", prop.totalConstMem);
        printf("Max mem pitch: %ld\n", prop.memPitch);
        printf("Texture Alignement: %ld\n", prop.textureAlignement);

        printf("--- MP Information for device %d ---\n",i);
        printf("Multiprocessor count : %d\n", prop.multiProcessorCount);
        printf("Shared mem per mp: %ld\n", prop.sharedMemPerBlock);
        printf("Registers per mp : %d\n", prop.regsPerBlock);
        printf("Threads in wrap: %d\n", prop.wrapSize);
        printf("Max threads per block: %d\n", prop.maxThreadsPerBlock);
        printf("Max thread dimensions: (%d, %d, %d)\n", prop.maxThreadsDim[0],prop.maxThreadsDim[1],prop.maxThreadsDim[2]);
        printf("Max grid dimensions: (%d,%d,%d)\n", prop.maxGridSize[0], prop.maxGridSize[1], prop.maxGridSize[2]);
        printf("\n");
    }
}