'''
Created on Apr 13, 2020

Child of BinaryTree.
Doesn't use Node parents

@author: Jon Rippe
'''
from BinaryTree import BinaryTree
from Node import Node

class AVLTree(BinaryTree):
        
    def __init__(self, start = []):
        super().__init__(start)
                
    #inserts Node into tree
    def _insert(self, key, t):
        if t == None:
            t = Node(key)
            if self.root == None:
                self.root = t
        elif key < t.key:
            t.left = self._insert(key, t.left)
            if t.left.h - self._height(t.right) > 1:
                if key > t.left.key:
                    t.left = self._rotate_with_right(t.left)
                t = self._rotate_with_left(t)
        else:
            t.right = self._insert(key, t.right)
            if t.right.h - self._height(t.left) > 1:
                if key < t.right.key:
                    t.right = self._rotate_with_left(t.right)
                t = self._rotate_with_right(t)
        t.h = max(self._height(t.left), self._height(t.right)) + 1
        return t

    #delete specified Node from tree
    def _tree_delete(self, z):
        print("AVLTree Node deletion not required for this assignment.")
#         if z.left == None:
#             self._transplant(z, z.right)
#         elif z.right == None:
#             self._transplant(z, z.left)
#         else:
#             y = self._tree_minimum(z.right)
#             if y.p != z:
#                 self._transplant(y, y.right)
#                 y.right = z.right
#                 y.right.p = y
#             self._transplant(z, y)
#             y.left = z.left
#             y.left.p = y

    def _rotate_with_left(self, x):
        y = x.left
        x.left = y.right
        y.right = x
        x.h = max(self._height(x.left), self._height(x.right)) + 1
        y.h = max(self._height(y.left), self._height(y.right)) + 1
        if x == self.root:
            self.root = y
        return y
        
    def _rotate_with_right(self, x):
        y = x.right
        x.right = y.left
        y.left = x
        x.h = max(self._height(x.left), self._height(x.right)) + 1
        y.h = max(self._height(y.left), self._height(y.right)) + 1
        if x == self.root:
            self.root = y
        return y
            
    def _height(self, x):
        if x == None:
            return -1
        return x.h
    
    # The following use keys instead of Nodes to interact with tree
    # Reduces need to interact with Nodes directly
    # Use these to interact with tree

    #Add specified key to tree
    def add(self, key):
        self._insert(key, self.root)
