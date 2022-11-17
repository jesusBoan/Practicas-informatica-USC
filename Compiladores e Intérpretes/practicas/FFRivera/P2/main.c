#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#define ITER 10000

int main(int argc, char** argv) {
    int i, j, k, N;
    if(argc == 2){
        N = atoi(argv[1]);
    }

    float x[2*N][2*N], z[2*N][2*N];
    struct timeval start, finish;
    double time;
    
    /*Inicializar matrices*/

    for(i = 0; i<2*N; i++){
        for(j = 0; j<2*N; j++){
            x[i][j] = ((float)rand()/(float)(RAND_MAX))*5.0;
            z[i][j] = ((float)rand()/(float)(RAND_MAX))*5.0;
        }
    }

    /*Versión no optimizada*/

    gettimeofday(&start, NULL);

        for(k=0; k<ITER; k++){
            for(j=-N; j<N; j++){
                for(i=-N; i<N; i++){
                    if(i*i+j*j != 0)
                    z[N+j][N+i] = x[N+j][N+i] / (i*i+j*j);
                    else
                    z[N+j][N+i] = 0.0;
                }
            }
        }

    gettimeofday(&finish, NULL);
    time = (finish.tv_sec-start.tv_sec+(finish.tv_usec-start.tv_usec)/1.e6);
    printf("Sin-Optimizar\t%d\t%d\t%f\t%f\n", N, ITER, time, time/ITER);

    /*Inicializar matrices*/

    for(i = 0; i<2*N; i++){
        for(j = 0; j<2*N; j++){
            x[i][j] = ((float)rand()/(float)(RAND_MAX))*5.0;
            z[i][j] = ((float)rand()/(float)(RAND_MAX))*5.0;
        }
    }
    
    /*Versión optimizada*/

    gettimeofday(&start, NULL);

        for(k=0; k<ITER; k++){
            for(j=-N; j<N; j++){
                for(i=-N; i<0; i++){
                    z[N+j][N+i] = x[N+j][N+i] / (i*i+j*j);
                }
                for(i=1; i<N; i++){
                    z[N+j][N+i] = x[N+j][N+i] / (i*i+j*j);
                }                
            }
            z[N][N] = 0.0; 
        }

    gettimeofday(&finish, NULL);
    time = (finish.tv_sec-start.tv_sec+(finish.tv_usec-start.tv_usec)/1.e6);
    printf("Optimizada\t%d\t%d\t%f\t%f\n", N, ITER, time, time/ITER);

    return 0;
}