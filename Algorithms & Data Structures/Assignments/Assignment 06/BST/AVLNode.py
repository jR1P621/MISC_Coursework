'''
Created on Apr 13, 2020

@author: Jon Rippe
'''
class AVLNode:
    
    def __init__(self, key, left = None, right = None, p = None, h = 0):
        self.key = key
        self.left = left
        self.right = right
        self.p = p
        self.h = h