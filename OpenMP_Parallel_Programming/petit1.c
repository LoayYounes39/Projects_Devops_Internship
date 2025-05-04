#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

#define MAX_NUM_OBJ 100

int num_obj = 0;
int capacity;
int weight[MAX_NUM_OBJ];
int utility[MAX_NUM_OBJ];

void read_problem(char *filename){
  char line[256];

  FILE *problem = fopen(filename,"r");
  if (problem == NULL){
    fprintf(stderr,"File %s not found.\n",filename);
    exit(-1);
  }

  while (fgets(line, 256, problem) != NULL){
    switch(line[0]){
      case 'c': // capacity
        if (sscanf(&(line[2]),"%d\n", &capacity) != 1){
          fprintf(stderr,"Error in file format in line:\n");
          fprintf(stderr, "%s", line);
          exit(-1);
        }
        break;

      case 'o': // graph size
        if (num_obj >= MAX_NUM_OBJ){
          fprintf(stderr,"Too many objects (%d): limit is %d\n", num_obj, MAX_NUM_OBJ);
          exit(-1);
        }
        if (sscanf(&(line[2]),"%d %d\n", &(weight[num_obj]), &(utility[num_obj])) != 2){
          fprintf(stderr,"Error in file format in line:\n");
          fprintf(stderr, "%s", line);
          exit(-1);
        }
        else
          num_obj++;
      break;

      default:
        break;
    }
  }
  if (num_obj == 0){
    fprintf(stderr,"Could not find any object in the problem file. Exiting.");
    exit(-1);
  }
}

int main(int argc, char * argv[]){
  if (argc != 2){
    fprintf(stdout, "Usage %s pbX.txt to generate benchmark \n py ./test_py to plot generated benchmark ", argv[0]);
    exit(1);
  }
  read_problem(argv[1]);
  int ** S = malloc(sizeof(int *) * num_obj);
  for (int i = 0; i < num_obj; i++){
    S[i] = malloc(sizeof(int) * (capacity + 1));
  }
  int J = capacity;
  FILE *fp = fopen("bench.txt", "wr");
  for (int n = 1; n <= 16; n ++){
   double debut = omp_get_wtime();
    #pragma omp parallel num_threads(n)
    {
      for (int i = 0; i < num_obj; i++){
        int partition = (capacity + 1) / n;
        if (partition < 1){
          partition = 1;
        }
        #pragma omp for schedule (static, partition )
        for (int j = 0; j < capacity + 1; j++){
          if (i == 0){
            if (weight[0] <= j){
              S[0][j] = utility[0];
            } else {
              S[0][j] = 0;
            }
          } else {
            if (weight[i] > j){
              S[i][j] = S[i-1][j];
            } else {
              int nouv_util = S[i-1][j-weight[i]] + utility[i];
              if (nouv_util > S[i-1][j]){
                S[i][j] = nouv_util;
              } else {
                S[i][j] = S[i-1][j];
              }
            }
          }
        }
      }
      }
    double fin = omp_get_wtime();
    printf("%f , %f \n", debut, fin );
    double res = fin - debut;
    fprintf(fp,"%f \n",res  );
  }

    printf("Meilleur Utilité = %d \n", S[num_obj - 1][capacity]);
    for (int I = num_obj - 1; I > 0; I--){
      //printf("Weight %d , J = %d ", weight[I], J );
      if (S[I][J] > S[I-1][J]){
         J -= weight[I];
         printf("Objet %d \n", I);
      }
    }
  // Free allocated memory
  free(S);
  fclose(fp);
  return EXIT_SUCCESS;
}
