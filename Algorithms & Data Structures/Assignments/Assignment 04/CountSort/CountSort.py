'''
Created on Mar 10, 2020

@author: Jon Rippe

Increasing k exponentially also increases CountSort runtime exponentially.
k size and runtime appear to have a positive, linear correlation.
The CountSort algorithm has a complexity of:
O(n) [lines 36-37]
O(k) [lines 38-39]
O(n) [lines 42-44]
= 2O(n) + O(k)
Thus, increasing k or n would create an expected linear increase in runtime.

HeapSort runtimes appear to level out regardless of k size.  Because of this,
there will be some value for k where CountSort runtime will surpass HeapSort
runtime.  Additionally, because CountSort runtimes are unaffected by sorted
or partially sorted arrays, HeapSort runtimes may be better if data has
already been sorted to some degree.
'''

from random import randint
from time import perf_counter

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

n = 25
k = 20
A = [None] * (n + 1)
for i in range(1, len(A)):
    A[i] = randint(1,k)
stableCountSort(A, n, k, True)

nCount = [10000,20000,40000,80000,160000,320000,640000,1280000]
results = [None] * len(nCount)
for i in range(len(nCount)):
    print()
    print(nCount[i], end =": ")
    results[i] = [None] * 10
    A = [None] * (nCount[i]+1)
    for j in range(len(results[i])):
        for k in range(1, nCount[i]+1):
            A[k] = randint(1, 100000)
        results[i][j] = perf_counter()
        stableCountSort(A, nCount[i], 100000, False)
        results[i][j] = perf_counter() - results[i][j]
        print((int)(results[i][j]*1000000), end =" ")
'''
fileOut = open("CountSort.csv","w")
for i in range(len(results)):
    for j in range(len(results[i])):
        fileOut.write(str(results[i][j]))
        fileOut.write(",")
    fileOut.write("\n")
fileOut.close()
'''