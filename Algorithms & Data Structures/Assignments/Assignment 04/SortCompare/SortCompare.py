'''
Created on Mar 10, 2020

@author: Jon Rippe
'''

from random import randint
from time import perf_counter

def Max_Heapify(A, i, heapSize):
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
        
def Partition(A,p,r,m):
    if m==1:
        rInt = randint(p,r)
        A[r],A[rInt] = A[rInt],A[r]
    elif m==2:
        mid = p + (r-p)//2
        if A[p] > A[mid]:
            A[p],A[mid] = A[mid],A[p]
        if A[p] > A[r]:
            A[p],A[r] = A[r],A[p]
        if A[r] > A[mid]:
            A[r],A[mid] = A[mid],A[r]
    x = A[r]
    i = p-1
    for j in range(p,r):
        if A[j]<=x:
            i = i+1
            A[i],A[j] = A[j],A[i]
    A[i+1],A[r] = A[r],A[i+1]
    return i+1

def QuickSort(A,p,r,m):
    if p < r:
        q = Partition(A, p, r,m)
        QuickSort(A, p, q-1,m)
        QuickSort(A, q+1, r,m)
        
def printArray(A):
    for i in range(1, len(A)):
        print(A[i], end =" ")
    print()

def stableCountSort(A, n, k, p):
    B = [None] * (n + 1)
    C = [0] * (k + 1)
    
    if p: printArray(A)
    
    for j in range(1, len(A)):
        C[A[j]] += 1
    for i in range(2, len(C)):
        C[i] = C[i] + C[i-1]
    if p: printArray(C)
    
    for j in range (n, 0, -1):
        B[C[A[j]]] = A[j]
        C[A[j]] = C[A[j]] - 1
    if p: printArray(B)

nCount = [10000,20000,40000,80000,160000,320000,640000,1280000]
kCount = [100000,1000000,10000000]
sortType = ["HeapSort","QuickSort","CountSort"]
results = [None] * len(nCount)
for s in range(len(sortType)):
    for t in range(len(kCount)):
        print(sortType[s])
        for i in range(len(nCount)):
            print()
            print(nCount[i], end =": ")
            results[i] = [None] * 3
            A = [None] * (nCount[i]+1)
            for j in range(len(results[i])):
                for k in range(1, nCount[i]+1):
                    A[k] = randint(1, kCount[t])
                results[i][j] = perf_counter()
                if s == 0: HeapSort(A)
                if s == 1: QuickSort(A, 1, nCount[i], 2)
                if s == 2: stableCountSort(A, nCount[i], kCount[t], False)
                results[i][j] = perf_counter() - results[i][j]
                print((int)(results[i][j]*1000000), end =" ")
        '''
        fileOut = open(sortType[s] + str(t) + ".csv","w")
        for i in range(len(results)):
            for j in range(len(results[i])):
                fileOut.write(str(results[i][j]))
                fileOut.write(",")
            fileOut.write("\n")
        fileOut.close()
        '''
