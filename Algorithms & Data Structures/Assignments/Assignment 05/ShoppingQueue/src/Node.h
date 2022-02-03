#pragma once

template<class T>
class Node {
 public:
  T data;
  Node *next;

 public:
  Node();
  Node(T dt, Node *nxt);
  void setData(T dt);
  T getData();
  void setNext(Node *nxt);
  Node* getNext();
  ~Node();
};

