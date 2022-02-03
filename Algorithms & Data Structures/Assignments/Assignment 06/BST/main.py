'''
Created on Apr 13, 2020

@author: Jon Rippe

Program tests the BinaryTree class:
1) Creates list of random integers
2) Uses list to test tree Constructor and insert methods
3) Removes 2 elements from tree.
4) Verifies BST, corrupts, then reverifies

'''
from BinaryTree import BinaryTree
from random import randint

#Fill with unique random ints
l1 = [None] * 20
for i in range(len(l1)):
    while True:
        j = randint(0,100)
        if j not in l1:
            l1[i] = j
            break
print("Randomized List:")
print(l1)
print()

#create tree using list
t1 = BinaryTree(l1)
print("Binary Tree:")
t1.print()
# print(t1)

#remove 2 values
print("Removing", end=" ")
print(l1[0])
t1.remove(l1[0])
print("Removing", end=" ")
print(l1[1])
t1.remove(l1[1])
t1.print()
print()

#Verify BST
print("Verifying Binary Search Tree:")
t1.check()

#corrupt BST by swapping the left and right keys & Reverify
print("Corrupting Binary Tree")
t1.root.left.key, t1.root.right.key = t1.root.right.key, t1.root.left.key
t1.print()
t1.check()
