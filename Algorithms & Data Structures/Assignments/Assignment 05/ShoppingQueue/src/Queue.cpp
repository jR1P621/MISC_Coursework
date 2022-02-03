#pragma once
#include "Queue.h"

// TODO: add support for a private currentSize data member

// template Queue class built on template Node class
template<class T>
Queue<T>::Queue() {
	front = nullptr;
	back = nullptr;
	currentSize = 0;
}

template<class T>
bool Queue<T>::isEmpty() {
	return front == nullptr;
}

template<class T>
T Queue<T>::peek() {
	return front->getData();
}

template<class T>
T Queue<T>::dequeue() {
	T toDQ;
	toDQ = front->getData();
	front = front->getNext();
	currentSize--; //adjust size
	return toDQ;
}

template<class T>
void Queue<T>::enqueue(T data) {
	Node<T> *newNode;
	newNode = new Node<T>(data, nullptr);
	if(isEmpty())
		front = newNode;
	else
		back->setNext(newNode);
	back = newNode;
	currentSize++; //adjust size
}

template<class T>
int Queue<T>::getCount(){
	return currentSize;
}

/*extra function*/

template<class T>
T Queue<T>::peekBack() {
	return back->getData();
}

template<class T>
T Queue<T>::peekIndex(int index) {
	Node<T>* current = front;
	for(int i = 0; i < index; i++){
		current = current->getNext();
	}
	return current->getData();
}

template <class T>
void Queue<T>::jumpTo(Queue* other){
	Node<T> *temp;
	temp = back;
	other->enqueue(temp);
	back = front;
	while(back->getNext() != temp)
		back = back->getNext();
	back->setNext(nullptr);
	currentSize --;
}

template<class T>
void Queue<T>::enqueue(Node<T>* node) {
	if(isEmpty())
		front = node;
	else
		back->setNext(node);
	back = node;
	currentSize++; //adjust size
}
