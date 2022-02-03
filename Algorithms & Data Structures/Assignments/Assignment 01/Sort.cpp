/*
Jon Rippe
CSCE A311
Assignment #1
Due 24 Jan 2020
*/

#include<cstdio>

using std::printf;

void printArray(int arr[], int n);
void mySort(int arr[], int n);

int main() {
        int a10[10] = {5, 4, 6, 3, 7, 2, 8, 1, 9, 0};

        mySort(a10, 10);
}

void printArray(int arr[], int n) {
        for(int i = 0; i < n ; i++)
                printf("%d ",arr[i]);
        printf("\n");
}

void mySort(int arr[], int n) {
        int c0 = 0, c1 = 0, c2 = 0;
        printArray(arr, n);
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
        printArray(arr, n);
        }
        printf("For an array of length %d, the outer loop ran %d times, the inner loop ran %d times, and the key swap happened %d times.\n",n,c0,c1,c2);
}
