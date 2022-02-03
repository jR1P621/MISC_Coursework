#pragma once
/*
 * Customer.h
 *
 *  Created on: Mar 24, 2020
 *      Author: Jon Rippe
 */

class Customer {
private:
	int arrivalTime, processTime;

public:
	Customer();
	Customer(int arrival, int process);
	~Customer();
	int getArrival(){return arrivalTime;};
	int getProcess(){return processTime;};
	void process();

	/*extra function*/
private:
	float aptitudeFrac;
public:
	float getAptitude();
};

