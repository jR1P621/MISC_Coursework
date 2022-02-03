/*
 * ShoppingMain.cpp
 *
 *  Created on: Mar 24, 2020
 *      Author: Jon Rippe
 *
 *  Program creates K queues and processes customers from text files
 *  Extra functionality has been added to simulate customers jumping
 *  to shorter lines.
 */

/*
 * compilation command
 * g++ -std=c++11 shoppingMain.cpp Customer.cpp
 * OR
 * g++ shoppingMain.cpp Customer.cpp
 *
 * to run:
 * ./a/out <txt_file_name> <int> EXTRA(optional)
 * */

/*
 * Results:
 * Determining factor seems to the longest wait time during busy hours.
 *
 * 1000 customers (arrivals.txt)
 * With 4 open lanes, wait times are crazy (71min ave, 151min longest).
 * 5 lanes is more reasonable (9min ave, 26min longest).
 * Improvements start to flatten after 6 with ~2min increases on the longest wait for each added lane.
 *
 * 10000 customers (arrivals10000.txt)
 * similar to the 1000 file except on a *10 scale:
 * Results became reasonable at about 50 lanes and flattened out after 60.
 *
 *
 * With line jumping enabled, results were NOT much different.
 * Average wait time was the same or slightly longer.
 * Longest wait time dropped noticeably.
 * Total runtime dropped by a few minutes.
 * */

#include <iostream>
#include <fstream>
#include <cstdio>
#include <vector>

#include "Customer.h"
#include "Queue.h"
#include "Queue.cpp"

//for extra function
#include <ctime>
#include <cstdlib>

using namespace std;

Queue<Customer*>* getShortestQueue(Queue<Customer*> queue[], int K);
void printQueueLength(Queue<Customer*> queue[], int K);
int getTotalCustomers(Queue<Customer*> queue[], int K);
void jumpQueue(Queue<Customer*> queue[], int K);

int main(int argc, char* argv[]){
//int main() {
	/*extra function*/
	bool enableJump = false;
	if (argc > 3){
		//cout << endl << endl <<  "EXTRA FEATURES ENABLED" << endl;
		enableJump = true;
		srand(time(NULL));
	}
	/*END extra function*/

	/*BEGIN MAIN PROGRAM*/
	//make sure parameters were entered
	if (argc < 3) {
		cout << "Usage: " << argv[0] << " TXT_FILE " << " INT" << endl << endl;
		cout << "TXT_FILE is the path to a text file of customer information formatted as follows:" << endl <<
				"\"arrivalTime\",\"processTime\"" << endl <<
				"#,#" << endl << "#,#" << endl << "#,#" << endl << "..." << endl << endl;
		cout << "INT is the number of open counters in the simulation." << endl;
		return 1;
	}

	string arrivals = argv[1];
	int K = stoi(argv[2]);

	int maxTime = 600;
	string lineIn;

	//Open file stream and read customers into usable vector
	ifstream fileIn;
	fileIn.open(arrivals);
	if(!getline(fileIn, lineIn)){
		cout << "ERROR: Couldn't read from .txt file" << endl;
		return 1;
	}
	Queue<Customer*> queue[K];
	vector<Customer*> customers;
	while(getline(fileIn, lineIn)){
		Customer* newCustomer;
		newCustomer = new Customer(stoi(lineIn.substr(0, lineIn.find(','))),
				stoi(lineIn.substr(lineIn.find(',') + 1, lineIn.length() - 1)));
		customers.insert(customers.begin(), newCustomer); //add to beginning FILO
	}

	int totalTime, totalProc = 0, totalWait = 0, totalCust = 0, longestWait = 0;
	for (int t = 1; t <= maxTime || getTotalCustomers(queue, K) > 0; t++) {
		//1) enqueue customers
		if (t <= maxTime) { //if not closed
			//while there are unqueued customers with the current arrival time
			while(!customers.empty() && customers[customers.size() - 1]->getArrival() == t){
				//Add processing time to total (for averaging later)
				totalProc += customers[customers.size() - 1]->getProcess();
				//transfer customer from vector to shortest queue
				Customer* newCustomer;
				newCustomer = customers[customers.size() - 1];
				Queue<Customer*>* shortest;
				shortest = getShortestQueue(queue, K);
				shortest->enqueue(newCustomer);
				customers.pop_back(); //pop off end
			}
		}
		for(int i = 0; i < K; i++){ //each queue
			if(!queue[i].isEmpty()){
				//2) dequeue finished customer
				if(queue[i].peek()->getProcess() == 0){ //if we're done processing
					//add current customers wait to overall total (for averaging later)
					Customer* DQed = queue[i].dequeue();
					int currentWait = t - DQed->getArrival();
					totalWait += currentWait;
					if(currentWait > longestWait) //check for longest wait
						longestWait = currentWait;
					totalCust++;
					delete DQed;
				}
				//3) process queue
				if(!queue[i].isEmpty()) {
					queue[i].peek()->process(); //process next customer
				}
			}
		}
		if(enableJump) jumpQueue(queue, K); //extra function
		//Get total customers in all queues
		totalTime = t;
		if(t%60 == 0) {
			cout << "Hour " << t/60 << " " << "Queue Sizes:" << endl;;
			printQueueLength(queue, K);
		}
	}

	//Final Output
	cout << "Final Queue Sizes:\n";
	printQueueLength(queue, K);
	printf("Total Time: %d hours %d minutes\n"
			"Total Customers: %d\n"
			"Average Process Time: %.1f minutes\n"
			"Average Wait Time: %.1f minutes\n"
			"Longest Wait Time: %d minutes\n",
			totalTime/60, totalTime%60,
			totalCust,
			1.0*totalProc/totalCust,
			1.0*totalWait/totalCust,
			longestWait);

	//cleanup
	fileIn.close();
}

/*Get shortest queue*/
Queue<Customer*>* getShortestQueue(Queue<Customer*> queue[], int K) {
	int shortest = 0;
	for (int i = 0; i < K - 1; i++) {
		if(queue[i].isEmpty()) return &queue[i]; //just return is queue is empty
		if (queue[shortest].getCount() > queue[i + 1].getCount())
			shortest = i + 1;
	}
	return &queue[shortest];
}

/*Prints individual queue sizes*/
void printQueueLength(Queue<Customer*> queue[], int K){
	for(int i = 0; i < K; i++){
		printf("%d ", queue[i].getCount());
	}
	cout << endl;
}

/*Totals all queue sizes*/
int getTotalCustomers(Queue<Customer*> queue[], int K){
	int total = 0;
	for(int i = 0; i < K; i++){
		total += queue[i].getCount();
	}
	return total;
}



/*Everything below here is extra.
 * Enable by adding a 3rd argument in the cmd line args (argument can be any string)*/
void jumpQueue(Queue<Customer*> queue[], int K){
	for(int i = 0; i < K; i++){
		if(queue[i].getCount() > 1){
			float timeGuess[K] = {0};
			int shortest = 0;
			//look at lines and guess wait time
//			cout << i+1 << ": ";
			for(int j = 0; j < K; j++){
				//look at each customer in the line (excluding last of current)
				for(int k = 0; k < queue[j].getCount(); k++){
					if(!(j == i && k == queue[j].getCount() - 1))
						timeGuess[j] += queue[j].peekIndex(k)->getProcess() * queue[i].peekBack()->getAptitude();
				}
//				cout << timeGuess[j] << " ";
			}
//			cout << endl;
			//compare wait times
			for(int j = 1; j < K; j++){
				if(timeGuess[shortest] > timeGuess[j])
					shortest = j;
			}
			//jump to shortest queue if at least 2 min shorter wait or empty
			if((timeGuess[shortest] == 0 && timeGuess[i] > timeGuess[shortest]) || (
					shortest != i && timeGuess[shortest] < timeGuess[i] - 2)){
//				cout << "Jump from " << i+1 << " to " << shortest+1 << endl;
				queue[i].jumpTo(&queue[shortest]);
			}
		}
	}
}
