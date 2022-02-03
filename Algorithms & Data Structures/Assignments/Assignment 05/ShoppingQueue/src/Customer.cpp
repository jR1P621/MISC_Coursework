/*
 * Customer.cpp
 *
 *  Created on: Mar 24, 2020
 *      Author: Jon Rippe
 */
#include "Customer.h"

/*extra function*/
#include <cstdlib>

Customer::Customer() : Customer(0,0){}

Customer::Customer(int arrival, int process){
	arrivalTime = arrival;
	processTime = process;

	/*extra function*/
	//-0.25 to 0.25
	aptitudeFrac = 1 - (((0.5 * rand()) / (float) RAND_MAX) - 0.25); // upto 25% offset
}

Customer::~Customer(){}


void Customer::process(){
	this->processTime--;
}

/*extra function*/
float Customer::getAptitude(){
	return aptitudeFrac;
}
