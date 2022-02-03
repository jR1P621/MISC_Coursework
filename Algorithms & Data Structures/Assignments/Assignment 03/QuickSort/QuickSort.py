'''
Created on Feb 20, 2020

@author: Jon Rippe

Random pivot
Hypothesis: No impact on runtime
Result: Runtime increased by up to about 30%.  This is likely NOT due to a decrease
in algorithm efficiency, but instead due to the added overhead of calling the
randint method.  Method calls seem to noticeably slow the algorithm.  For example,
I was able to increase speed by using A[i],A[j] = A[j],A[i] to swap elements rather
than using a Swap method.

Median pivot
Hypothesis: No impact on runtime (perhaps negligible decrease)
Result: Runtime decreased by about 10%.  Although the breadth of the recursion will
always be the same, it's possible that a more even partition could help decrease the
depth of the recursion.


'''

from random import randint
from time import perf_counter
from statistics import median

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
    #printArray(A)
    if p < r:
        q = Partition(A, p, r,m)
        QuickSort(A, p, q-1,m)
        QuickSort(A, q+1, r,m)
        
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

QuickSort(A, 1, n, 2)

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
        QuickSort(A, 1, nCount[i], 0)
        results[i][j] = perf_counter() - results[i][j]
        print((int)(results[i][j]*1000000), end =" ")

'''
fileOut = open("QuickSort.csv","w")
for i in range(len(results)):
    for j in range(len(results[i])):
        fileOut.write(str(results[i][j]))
        fileOut.write(",")
    fileOut.write("\n")
fileOut.close()
'''

