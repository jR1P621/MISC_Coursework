/*
Bubble Sort

This program tests Bubble Sort & Optimized Bubble Sort on array of 10 elements,
then checks for mean runtime and std deviation of 30 randomized arrays of
100, 200, 400, 800, 1600, 3200, 6400, & 12800 elements

Optimized Bubble Sort shows lower performance on randomized arrays than the
non-optimized.  The cost of performing the extra boolean logic to exit early is
greater than the cost of running the outer loop extra times without the logic.

Optimized Bubble Sort may be beneficial on extremely small arrays or on arrays
that are already sorted to a certain degree.
 */

#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <chrono>
#include <cmath>

using namespace std;

int bubbleSort(int arr[], int n, bool printArray);
int bubbleSortOpt(int arr[], int n, bool printArray);
void swap(int &j, int &k);
void print(int arr[], int n);

int main(){
	srand(time(NULL));

	int a1[10], a2[10];
	for(int i = 0; i < 10; i++){
		a1[i] = rand()%1000;
		a2[i] = a1[i];
	}
	bubbleSort(a1,10, true);
	printf("\n");
	bubbleSortOpt(a2,10, true);


	for(int elem = 100; elem <= 12800; elem*=2){
		printf("\n%d Elements\n",elem);
		int n = elem, iter = 0;
		int arrReg[n], arrOpt[n];
		long arrResults[2][30], mean[2]={0,0}, stdDev[2]={0,0};
		//clock_t timer;
		chrono::high_resolution_clock::time_point tBeg, tEnd;
		for(int i = 0; i < 30; i++){
			for(int j = 0; j < n; j++){
				arrReg[j] = rand();
				arrOpt[j] = arrReg[j];
			}
			tBeg = chrono::high_resolution_clock::now();
			iter = bubbleSort(arrReg,n,false);
			tEnd = chrono::high_resolution_clock::now();
			arrResults[0][i] = (tEnd-tBeg).count();
			tBeg = chrono::high_resolution_clock::now();
			iter = bubbleSortOpt(arrOpt,n,false);
			tEnd = chrono::high_resolution_clock::now();
			arrResults[1][i] = (tEnd-tBeg).count();
			//printf("%d : %d - %d\n",(int)arrResults[i][0],(int)arrResults[i][1],iter);
			mean[0] += arrResults[0][i];
			mean[1] += arrResults[1][i];
		}
		mean[0] /= 30;
		mean[1] /= 30;
		for(int i = 0; i < 2; i++){
			for(int j = 0; j < 30; j++)
				stdDev[i] += pow(arrResults[i][j]-mean[i],2);
			stdDev[i] = sqrt(stdDev[i]/30);
		}
		printf("Mean: %d : %d\n", (int)mean[0],(int)mean[1]);
		printf("StdDev: %d : %d\n", (int)stdDev[0],(int)stdDev[1]);
	}
}

int bubbleSort(int arr[], int n, bool printArray){
	if(printArray)
		print(arr,n);
	int i;
	for(i = 0; i < n-1; i++){
		for(int j = 0; j<n-i-1;j++)
			if(arr[j]>arr[j+1]){
				swap(arr[j], arr[j+1]);
			}
		if(printArray)
			print(arr,n);
	}
	return i;
}

int bubbleSortOpt(int arr[], int n,bool printArray){
	if(printArray)
		print(arr,n);
	int i;
	bool sorted = false;
	for(i = 0; sorted==false && i<n-1; i++){
		sorted = true;
		for(int j = 0; j<n-i-1;j++){
			if(arr[j]>arr[j+1]){
				swap(arr[j], arr[j+1]);
				sorted = false;
			}
		}
		if(printArray)
			print(arr,n);
	}
	return i;
}

void swap(int &j, int &k){
	int temp = j;
	j = k;
	k = temp;
}

void print(int arr[], int n){
	for(int i = 0; i<n; i++)
		printf("%d ", arr[i]);
	printf("\n");
}
