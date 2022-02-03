'''
Created on Apr 13, 2020

Doesn't use Node height

@author: Jon Rippe
'''
from Node import Node
from TreePrint import pretty_tree

class BinaryTree:
        
    def __init__(self, start = []):
        self.root = None
        for i in range(len(start)):
            self.add(start[i])
        
    #inserts Node into tree
    def _insert(self, z):
        y = None
        x = self.root
        while x != None:
            y = x
            if z.key < x.key:
                x = x.left
            else:
                x = x.right
        z.p = y
        if y == None:   #Empty Tree
            self.root = z
        elif z.key < y.key:
            y.left = z
        else:
            y.right = z
    
    #LVR iterate and print
    def _inorder_tree_walk(self, x):
        if x != None:
            self._inorder_tree_walk(x.left)
            print(x.key, end =" ")
            self._inorder_tree_walk(x.right)
        
    #search for k starting at Node x
    def _tree_search(self, x, k):
        if x == None or k == x.key:
            return x
        if k < x.key:
            return self._tree_search(x.left, k)
        else:
            return self._tree_search(x.right, k)
        
    def _tree_minimum(self, x):
        while x.left != None:
            x = x.left
        return x

    def _transplant(self, u, v):
        if u.p == None:
            self.root = v
        elif u == u.p.left:
            u.p.left = v
        else:
            u.p.right = v
        if v!= None:
            v.p = u.p
    
    #delete specified Node from tree
    def _tree_delete(self, z):
        if z.left == None:
            self._transplant(z, z.right)
        elif z.right == None:
            self._transplant(z, z.left)
        else:
            y = self._tree_minimum(z.right)
            if y.p != z:
                self._transplant(y, y.right)
                y.right = z.right
                y.right.p = y
            self._transplant(z, y)
            y.left = z.left
            y.left.p = y

    #Verifies BST structure starting at Node x
    def _is_binary_tree(self, x):
        isBST = True
        #Verify left Node
        if x.left != None:
            if x.key < x.left.key:
                isBST = False
                return isBST
            else:
                isBST = self._is_binary_tree(x.left)
        #Verify right Node if left is good
        if isBST == True and x.right != None:
            if x.key > x.right.key:
                isBST = False
                return isBST
            else:
                isBST = self._is_binary_tree(x.right)
        return isBST
    
    # The following use keys instead of Nodes to interact with tree
    # Reduces need to interact with Nodes directly
    # Use these to interact with tree

    #Add specified key to tree
    def add(self, key):
        self._insert(Node(key))
    
    #Prints BST in sorted order
    def print(self):
        self._inorder_tree_walk(self.root)
        print()

    #Removes value from tree
    def remove(self, key):
        self._tree_delete(self._tree_search(self.root, key))
    
    #Returns true if BST contains key
    def contains(self, key):
        return (self._tree_search(self.root, key) != None);
    
    #BST Integrity Check
    def check(self):
        if self._is_binary_tree(self.root):
            print("BST Check Passed")
        else:
            print("BST Check Failed")
    
    #Performance Testing
    #Methods are the same as above, but return counter numbers instead
    def _tree_search_count(self, x, k, counter):
        counter += 1
        if x == None or k == x.key:
            return counter
        if k < x.key:
            return self._tree_search_count(x.left, k, counter)
        else:
            return self._tree_search_count(x.right, k, counter)
        
    def find_count(self, key):
        return self._tree_search_count(self.root, key, 0)
    
    #Overload print method
    def __str__(self):
        return pretty_tree(self)