//Algoritmos para obtener ensamblador
#include <stdio.h>
#include <stdlib.h>

int main(){
    int elegirOpcionMenu=1;
    int arregloSinInvertir[4],arregloInvertido[4],i,j;
    int matriz1[2][2],matriz2[2][2],matrizProducto[2][2]={{}},k;
    do{
        printf("Algoritmos para ensamblador\n\n");
        printf("Menu: \n");
        printf("1. Invertir arreglo\n");
        printf("2. Multiplicacion de matrices\n");
        printf("3. Teorema de Keeler\n");
        printf("4. Salir\n\n");
        printf("Elegir algoritmo: ");
        scanf("%d",&elegirOpcionMenu);
        getchar();
        printf("\n");
        switch (elegirOpcionMenu){
        case 1:
            for (i=0,j=1;i<4;i++,j++){
                printf("Ingresa el valor #%d del arreglo: ",j);
                scanf("%d",&arregloSinInvertir[i]);
            }
            getchar();
            for (i=0;i<4;i++){
                printf("%d ",arregloSinInvertir[i]);
            }
            for(j=0;j<4&&i>=0;j++){
                i--;
                arregloInvertido[j]=arregloSinInvertir[i];
            }
            printf("\n");
            for (i=0;i<4;i++){
                printf("%d ",arregloInvertido[i]);
            }
            printf("\n\n");
            break;
        case 2:
            printf("Matriz 1\n");
            for(i=0;i<2;i++){
                for(j=0;j<2;j++){
                    printf("Ingrese un valor para matriz en la posición (%d,%d): ",i+1,j+1);
                    scanf("%d",&matriz1[i][j]);
                }
            }
            printf("\nMatriz 2\n");
            for(i=0;i<2;i++){
                for(j=0;j<2;j++){
                    printf("Ingrese un valor para matriz en la posición (%d,%d): ",i+1,j+1);
                    scanf("%d",&matriz2[i][j]);
                }
            }
            getchar();
            for(i=0;i<2;i++){
                for(j=0;j<2;j++){
                    for(k=0;k<2;k++){
                        matrizProducto[i][j]+=matriz1[i][k]*matriz2[k][j];
                    }
                }
            }
            printf("\nMatriz producto:\n");
            for(i=0;i<2;i++){
                for(j=0;j<2;j++){
                    printf("%-3d\t",matrizProducto[i][j]);
                }
                printf("\n\n");
            }
            break;
        case 3:
            break;
        case 4:
            elegirOpcionMenu=0;
            break;
        default:
            printf("Opcion no valida");
        }
        printf("Presione entrar para continuar...");
        getchar();
        printf("\n");
    }while(elegirOpcionMenu);
    return 0;
}
