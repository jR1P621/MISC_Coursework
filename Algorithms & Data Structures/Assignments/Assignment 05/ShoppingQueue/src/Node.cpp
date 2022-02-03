#include "Node.h"
#include <cstdlib>

template<class T>
Node<T>::Node() {
  next = nullptr;
}

template<class T>
Node<T>::Node(T dt, Node *nxt) {
  data = dt;
  next = nxt;
}

template<class T>
void Node<T>::setData(T dt) {
  data = dt;
}

template<class T>
T Node<T>::getData() {
  return data;
}

template<class T>
void Node<T>::setNext(Node *nxt) {
  this->next = nxt;
}

template<class T>
Node<T>* Node<T>::getNext() {
  return next;
}

template<class T>
Node<T>::~Node() {
}
