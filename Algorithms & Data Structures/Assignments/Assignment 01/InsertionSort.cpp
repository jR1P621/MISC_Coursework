/*
Jon Rippe
CSCE A311
Assignment #1
Due 24 Jan 2020
*/

#include<cstdio>
#include<cstdlib>
#include<ctime>

using std::printf;
using std::rand;
using std::srand;
using std::time;

void insertionSort(int arr[], int n);
void printArray(int arr[], int n);
void randFill(int arr[], int n);
void mySort(int arr[], int n);

int main() {
        srand(time(NULL));
        int a0[0], a10[10] = {5, 4, 6, 3, 7, 2, 8, 1, 9, 0}, a100[100], a1000[1000], a10000[10000];

        insertionSort(a0, 0);

        printArray(a10,10);
        insertionSort(a10, 10);
        printArray(a10,10);

        randFill(a100,100);
        randFill(a1000,1000);
        randFill(a10000,10000);

  //      insertionSort(a100, 100);
  //      insertionSort(a1000, 1000);
  //      insertionSort(a10000, 10000);

        mySort(a100, 100);
        mySort(a1000, 1000);
        mySort(a10000, 10000);
        mySort(a10000, 10000);
}

void insertionSort(int arr[], int n) {
        int c0 = 0, c1 = 0;
        for(int key, i, j = 1 ; j < n ; j++) {
                c0++;
                key = arr[j];
                i = j - 1;
                while(i >= 0 && arr[i] > key) {
                        c1++;
                        arr[i + 1] = arr[i];
                        i--;
                }
                arr[i + 1] = key;
        }
        printf("For an array of length %d, the outer loop ran %d times, and the inner loop ran %d times.\n",n,c0,c1);
}

void printArray(int arr[], int n) {
        for(int i = 0; i < n ; i++)
                printf("%d ",arr[i]);
        printf("\n");
}

void randFill(int arr[], int n) {
        for(int i = 0; i < n ; i++)
                arr[i] = rand();
}

void mySort(int arr[], int n) {
        int c0 = 0, c1 = 0, c2 = 0;
        for(int key, temp, j = 0 ; j < n-1 ; j++) {
                c0++;
                key = j;
                for(int i = j + 1; i < n ; i++){
                    c1++;
                    if(arr[i]<arr[key]){
                        c2++;
                        key = i;
                    }
                }
                temp = arr[j];
                arr[j] = arr[key];
                arr[key] = temp;
        }
        printf("For an array of length %d, the outer loop ran %d times, the inner loop ran %d times, and the key swap happened %d times.\n",n,c0,c1,c2);
}
