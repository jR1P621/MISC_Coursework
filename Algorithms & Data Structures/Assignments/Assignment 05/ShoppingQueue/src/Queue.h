#pragma once
#include "Node.cpp"

// TODO: add support for a private currentSize data member

// template Queue class built on template Node class
template<class T>
class Queue {
private:
	int currentSize;
 public:
  Queue();
  bool isEmpty();
  T peek();
  T dequeue();
  void enqueue(T data);
  int getCount();

 //private:
  Node<T> *front;		// head (dequeue)
  Node<T> *back;		// tail (enqueue)

  /*extra function*/
  T peekBack();
  T peekIndex(int index);
  void jumpTo(Queue<T>* other);
  void enqueue(Node<T>* node);
};
