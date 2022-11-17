#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#define ITER 1000

int main(int argc, char** argv) {
    int i, j, k, N, iterLocal = ITER;
    if(argc == 2){
        N = atoi(argv[1]);
        //valores asignados a iterLocal modificables en base a lo que queremos que nos tarde el programa
        if(N>=3000 && N<10000)  iterLocal = 100;
        else if(N>= 10000) iterLocal = 10;
    }

    float *x = (float *)malloc(2*N*2*N * sizeof(float));
    float *z = (float *)malloc(2*N*2*N * sizeof(float));
    struct timeval start, finish;
    double time;
    
    /*Inicializar matrices*/

    for(i = 0; i<2*N; i++){
        for(j = 0; j<2*N; j++){
            *(x +i*2*N + j) = ((float)rand()/(float)(RAND_MAX))*5.0;
            *(z +i*2*N + j) = ((float)rand()/(float)(RAND_MAX))*5.0;
        }
    }

    /*Versión no optimizada*/

    gettimeofday(&start, NULL);

        for(k=0; k<iterLocal; k++){
            for(j=-N; j<N; j++){
                for(i=-N; i<N; i++){
                    if(i*i+j*j != 0)
                    *(z +(j+N)*2*N + (i+N)) = *(x +(j+N)*2*N + (i+N)) / (i*i+j*j);
                    else
                    *(z +(j+N)*2*N + (i+N)) = 0.0;
                }
            }
        }

    gettimeofday(&finish, NULL);
    time = (finish.tv_sec-start.tv_sec+(finish.tv_usec-start.tv_usec)/1.e6);
    printf("Sin-Optimizar\t%d\t%d\t%f\t%f\n", N, iterLocal, time, time/iterLocal);
    free(x);
    free(z);

    x = (float *)malloc(2*N*2*N * sizeof(float));
    z = (float *)malloc(2*N*2*N * sizeof(float));
    /*Inicializar matrices*/

    for(i = 0; i<2*N; i++){
        for(j = 0; j<2*N; j++){
            *(x +i*2*N + j) = ((float)rand()/(float)(RAND_MAX))*5.0;
            *(z +i*2*N + j) = ((float)rand()/(float)(RAND_MAX))*5.0;
        }
    }
    
    /*Versión optimizada*/

    gettimeofday(&start, NULL);

        for(k=0; k<iterLocal; k++){
            for(j=-N; j<N; j++){
                for(i=-N; i<0; i++){
                    *(z +(j+N)*2*N + (i+N)) = *(x +(j+N)*2*N + (i+N)) / (i*i+j*j);
                }
                for(i=1; i<N; i++){
                    *(z +(j+N)*2*N + (i+N)) = *(x +(j+N)*2*N + (i+N)) / (i*i+j*j);
                }                
            }
            *(z +N*2*N + N) = 0.0; 
        }

    gettimeofday(&finish, NULL);
    time = (finish.tv_sec-start.tv_sec+(finish.tv_usec-start.tv_usec)/1.e6);
    printf("Optimizada\t%d\t%d\t%f\t%f\n", N, iterLocal, time, time/iterLocal);
    free(x);
    free(z);

    return 0;
}