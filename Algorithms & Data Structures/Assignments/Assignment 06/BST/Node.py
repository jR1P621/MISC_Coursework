'''
Created on Apr 13, 2020

@author: Jon Rippe
'''
class Node:
    
    def __init__(self, key):
        self.key = key
        self.left = None
        self.right = None
        self.p = None
        self.h = 0