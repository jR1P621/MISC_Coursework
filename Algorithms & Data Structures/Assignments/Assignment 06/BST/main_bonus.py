'''
Created on Apr 15, 2020

@author: Jon Rippe
'''

'''
Results:
Balanced AVL has runtimes similar to binary sort on a sorted array
Unsorted array and fully unbalanced BST have the same runtimes of O(n)
The unbalanced BST has runtimes only slightly worse than the balanced AVL

It seems that the average runtime for an unbalanced BST with random inputs is closer to lgn than it is is to n
'''
from AVLTree import AVLTree
from BinaryTree import BinaryTree
from random import randint
import pandas
from statistics import mean
import sys

#Increase limit to deal with fully unbalanced BST
sys.setrecursionlimit(2000)

#Some methods for testing the lists
def linear_search(key, l):
    counter = 0
    for n in range(len(l)):
        counter += 1
        if l[n] == key:
            return counter
    return counter

def binary_search(key, l, p, r, counter):
    counter += 1
    if p > r:
        return counter
    q = p + ((r-p)//2)
    if l[q] == key:
        return counter
    elif l[q] > key:
        return binary_search(key, l, p, q-1, counter)
    else:
        return binary_search(key, l, q+1, r, counter)

'''
Begin Main Code
'''
n = 1000
#Fill with unique random ints
l1 = [None] * n
for i in range(len(l1)):
    while True:
        j = randint(0,2000000000)
        if j not in l1:
            l1[i] = j
            break

#create tree using list (unbalanced)
t1 = BinaryTree(l1)

#Copy & sort list
#create tree using list (fully unbalanced)
l2 = sorted(l1)
t2 = BinaryTree(l2)

#create AVL Tree
t3 = AVLTree(l1)
# print(t3)

#Run Tests
results = [[None] * n for i in range(5)]
for i in range(len(l1)):
    #Unsorted Array
    results[0][i] = linear_search(l1[i], l1)
    #sorted Array
    results[1][i] = binary_search(l1[i], l2, 0, len(l2), 0)
    #Random BST
    results[2][i] = t1.find_count(l1[i])
    #Sorted BST
    results[3][i] = t2.find_count(l1[i])
    #AVL Tree
    results[4][i] = t3.find_count(l1[i])
    
#output data
data = {'':['Min','Mean','Max'],
    'UnsortedArr':[int(min(results[0])), format(mean(results[0]), '.1f'), int(max(results[0]))],
    'SortArr':[int(min(results[1])), format(mean(results[1]), '.1f'), int(max(results[1]))],
    'RandomBST':[int(min(results[2])), format(mean(results[2]), '.1f'), int(max(results[2]))],
    'SortedBST':[int(min(results[3])), format(mean(results[3]), '.1f'), int(max(results[3]))],
    'BalancedAVL':[int(min(results[4])), format(mean(results[4]), '.1f'), int(max(results[4]))]}

print("Comparisons Table")
df = pandas.DataFrame(data)
df = df[['','UnsortedArr','SortArr','RandomBST','SortedBST','BalancedAVL']]
print(df)
