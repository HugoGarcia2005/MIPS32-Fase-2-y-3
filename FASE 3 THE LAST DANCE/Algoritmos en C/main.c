//Algoritmos para obtener ensamblador
#include <stdio.h>
#include <stdlib.h>

#define C_0 0
#define C_1 1
#define TAMANIO_ARREGLO 5
#define FILA 2
#define COLUMNA 2
typedef enum {FALSO,VERDADERO}booleano;
enum {INV_ARREGLO=C_1,MULT_MATRIZ,NUM_PRIMOS,SALIR};

int main(){
    booleano continuarPrograma=VERDADERO;
    booleano es_primo_resultado=VERDADERO;
    int elegirOpcionMenu;
    int arregloSinInvertir[TAMANIO_ARREGLO],arregloInvertido[TAMANIO_ARREGLO],i,j;
    int matriz1[FILA][COLUMNA],matriz2[FILA][COLUMNA],matrizProducto[FILA][COLUMNA]={{}},k;
    int num_a_verificar;
    do{
        printf("Algoritmos para ensamblador\n\n");
        printf("Menu: \n");
        printf("1. Invertir arreglo\n");
        printf("2. Multiplicacion de matrices\n");
        printf("3. Saber si un numero es primo\n");
        printf("4. Salir\n\n");
        printf("Elegir algoritmo: ");
        scanf("%d",&elegirOpcionMenu);
        getchar();
        printf("\n");
        switch (elegirOpcionMenu){
        case INV_ARREGLO:
            for (i=C_0,j=C_1;i<TAMANIO_ARREGLO;i++,j++){
                printf("Ingresa el valor #%d del arreglo: ",j);
                scanf("%d",&arregloSinInvertir[i]);
            }
            getchar();
            for (i=C_0;i<TAMANIO_ARREGLO;i++){
                printf("%d ",arregloSinInvertir[i]);
            }
            for(j=C_0;j<TAMANIO_ARREGLO&&i>=C_0;j++){
                i--;
                arregloInvertido[j]=arregloSinInvertir[i];
            }
            printf("\n");
            for (i=C_0;i<TAMANIO_ARREGLO;i++){
                printf("%d ",arregloInvertido[i]);
            }
            printf("\n\n");
            break;
        case MULT_MATRIZ:
            printf("Matriz 1\n");
            for(i=C_0;i<FILA;i++){
                for(j=C_0;j<COLUMNA;j++){
                    printf("Ingrese un valor para matriz en la posición (%d,%d): ",i+1,j+1);
                    scanf("%d",&matriz1[i][j]);
                }
            }
            printf("\nMatriz 2\n");
            for(i=C_0;i<FILA;i++){
                for(j=C_0;j<COLUMNA;j++){
                    printf("Ingrese un valor para matriz en la posición (%d,%d): ",i+1,j+1);
                    scanf("%d",&matriz2[i][j]);
                }
            }
            getchar();
            for(i=C_0;i<FILA;i++){
                for(j=C_0;j<COLUMNA;j++){
                    for(k=C_0;k<COLUMNA;k++){
                        matrizProducto[i][j]+=matriz1[i][k]*matriz2[k][j];
                    }
                }
            }
            printf("\nMatriz producto:\n");
            for(i=C_0;i<FILA;i++){
                for(j=C_0;j<COLUMNA;j++){
                    printf("%-3d\t",matrizProducto[i][j]);
                }
                printf("\n\n");
            }
            break;
        case NUM_PRIMOS:
            printf("Saber si un numero es primo (1-100)\n");
            const int sqrt_lut[101] = {
                /*0*/0, /*1*/1, /*2*/1, /*3*/1, /*4*/2, /*5*/2, /*6*/2, /*7*/2, /*8*/2, /*9*/3,
                /*10*/3, /*11*/3, /*12*/3, /*13*/3, /*14*/3, /*15*/3, /*16*/4, /*17*/4, /*18*/4, /*19*/4,
                /*20*/4, /*21*/4, /*22*/4, /*23*/4, /*24*/4, /*25*/5, /*26*/5, /*27*/5, /*28*/5, /*29*/5,
                /*30*/5, /*31*/5, /*32*/5, /*33*/5, /*34*/5, /*35*/5, /*36*/6, /*37*/6, /*38*/6, /*39*/6,
                /*40*/6, /*41*/6, /*42*/6, /*43*/6, /*44*/6, /*45*/6, /*46*/6, /*47*/6, /*48*/6, /*49*/7,
                /*50*/7, /*51*/7, /*52*/7, /*53*/7, /*54*/7, /*55*/7, /*56*/7, /*57*/7, /*58*/7, /*59*/7,
                /*60*/7, /*61*/7, /*62*/7, /*63*/7, /*64*/8, /*65*/8, /*66*/8, /*67*/8, /*68*/8, /*69*/8,
                /*70*/8, /*71*/8, /*72*/8, /*73*/8, /*74*/8, /*75*/8, /*76*/8, /*77*/8, /*78*/8, /*79*/8,
                /*80*/8, /*81*/9, /*82*/9, /*83*/9, /*84*/9, /*85*/9, /*86*/9, /*87*/9, /*88*/9, /*89*/9,
                /*90*/9, /*91*/9, /*92*/9, /*93*/9, /*94*/9, /*95*/9, /*96*/9, /*97*/9, /*98*/9, /*99*/9,
                /*100*/10
            };
            printf("Ingrese un numero (1-100) para saber si es primo: ");
            if (scanf("%d", &num_a_verificar)!=1) {
                printf("Entrada invalida.\n");
                while(getchar()!='\n');
                break;
            }
            getchar();
            if (num_a_verificar<1||num_a_verificar>100) {
                printf("Numero fuera del rango permitido (1-100).\n");
            } else {
                if (num_a_verificar<=1) {
                    es_primo_resultado=FALSO;
                } else if (num_a_verificar==2) {
                    es_primo_resultado=VERDADERO;
                } else if (num_a_verificar%2==0) {
                    es_primo_resultado=FALSO;
                } else {
                    int limite_raiz=sqrt_lut[num_a_verificar];
                    es_primo_resultado=VERDADERO;
                    for (int divisor=3;divisor<=limite_raiz;divisor += 2){
                        if (num_a_verificar%divisor==0) {
                            es_primo_resultado=FALSO;
                            break;
                        }
                    }
                }
                if (es_primo_resultado==VERDADERO){
                    printf("%d es un numero primo.\n", num_a_verificar);
                }
                else{
                    printf("%d no es un numero primo.\n", num_a_verificar);
                }
            }
            printf("\n");
            break;
        case SALIR:
            continuarPrograma=FALSO;
            break;
        default:
            printf("Opcion no valida\n\n");
        }
        printf("Presione entrar para continuar...");
        getchar();
        printf("\n");
    }while(continuarPrograma);
    return 0;
}
