'''
Created on Feb 19, 2020

@author: Jon Rippe
'''
from random import randint
from time import perf_counter

def Max_Heapify(A, i, heapSize):
    #printArray(A)
    l = 2*i
    r = l+1
    if l <= heapSize and A[l] > A[i]:
        largest = l
    else:
        largest = i
    if r <= heapSize and A[r] > A[largest]:
        largest = r
    if largest != i:
        A[i],A[largest] = A[largest],A[i]
        Max_Heapify(A, largest, heapSize)
        
def Build_Max_Heap(A):
    for i in range((len(A)-1)//2, 0, -1):
        Max_Heapify(A, i, len(A)-1)

def HeapSort(A):
    heapSize = len(A)-1
    Build_Max_Heap(A)
    for i in range((len(A)-1), 1, -1):
        A[1],A[i]=A[i],A[1]
        heapSize = heapSize-1
        Max_Heapify(A, 1, heapSize)
        
def printArray(A):
    for i in range(1, len(A)):
        print(A[i], end =" ")
    print()

###
'''
n = 10
A = [None] * (n+1)

for i in range(1, n+1):
    A[i] = randint(0, 100000)

HeapSort(A)
###
'''
nCount = [10000,20000,40000,80000,160000,320000,640000,1280000]
results = [None] * len(nCount)
for i in range(len(nCount)):
    print()
    print(nCount[i], end =": ")
    results[i] = [None] * 10
    A = [None] * (nCount[i]+1)
    for j in range(len(results[i])):
        for k in range(1, nCount[i]+1):
            A[k] = randint(0, 100000)
        results[i][j] = perf_counter()
        HeapSort(A)
        results[i][j] = perf_counter() - results[i][j]
        print(results[i][j], end =" ")
        
fileOut = open("HeapSort.csv","w")
for i in range(len(results)):
    for j in range(len(results[i])):
        fileOut.write(str(results[i][j]))
        fileOut.write(",")
    fileOut.write("\n")
fileOut.close()

