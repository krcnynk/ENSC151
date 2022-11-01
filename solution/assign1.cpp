/******************************************************************************
;@
;@ Copyright (c) 2020 W. Craig Scratchley  wcs (AT) sfu (DOT) ca
;@
;@ *** partial solution ***
;@
;@ Below, edit to list any people who helped you with the code in this file,
;@      or put ‘none’ if nobody helped (the two of) you.
;@
;@ Helpers: _everybody helped us/me with the assignment (list names or put ‘none’)__
;@
;@ Also, reference resources beyond the course textbook and the course pages on Canvas
;@ that you used in making your submission.
;@
;@ Resources:  ___________
;@
;@% Instructions:
;@ * Put your name(s), student number(s), userid(s) in the above section.
;@ * Edit the "Helpers" line and "Resources" line.
;@ * Your group name should be "A1_<userid1>_<userid2>" (eg. A1_stu1_stu2)
;@ * Form groups as described at:  https://courses.cs.sfu.ca/docs/students
;@ * Submit your file to courses.cs.sfu.ca
;@
;@ Name        : assign1.cpp
******************************************************************************/
#include <iostream>
#include <chrono>
#include <iomanip>
#include <string>
#include <iostream>
#include <fstream>
#include "bignumber.h"
// *** add more include files if you would like ***
using namespace std;
using namespace std::chrono;

int main()
{

	cout << "Do not change this line.  Enter a sequence of increasing Fibonacci indicies and -1 to stop input.\n"
		 << endl;
	std::string str;
	// If you want to see maximum string length(max size of long long), uncomment bottom line
	//	cout << "Maximum number: " << str.max_size() << "\n" << endl;

	// Section 1
	// *** insert here a loop to input Fibonacci indexes and calculate Fibonacci numbers, or input -1 to stop input ***
	long long bNb{1};
	long long bNa{0};
	long long bN{0};
	long long bNc{0};

	int i{0};
	int n;

	while (cin >> n, -1 != n)
	{
		while (true)
		{
			if (n == i)
			{
				bN = bNa;
				break;
			}
			if (n == i + 1)
			{
				bN = bNb;
				break;
			}
			bNa += bNb;
			bNb += bNa;
			i += 2;
		}
		cout << n << endl;
		cout << bN << endl;
	}

	// SECTOR
	std::ofstream myfile;
	std::cout << std::fixed << std::setprecision(9) << std::left;
	time_point<steady_clock> start = steady_clock::now();
	const double runLimit{20.0};
	std::chrono::duration<double> diff;
	int iter = 0;
	while (iter < 10)
	{
		// Section 2
		i = 1;
		bNa = 0;
		bNb = 1;
		start = steady_clock::now();
		while ((steady_clock::now() - start) / 1000us < runLimit)
		{
			bNa += bNb;
			bNb += bNa;
			i += 2;
		}
		++iter;
	}

	myfile.open("200Runs11.csv");
	iter = 0;
	while (iter < 200)
	{
		// Section 2
		i = 1;
		bNa = 0;
		bNb = 1;
		start = steady_clock::now();
		while ((steady_clock::now() - start) / 1000us < runLimit)
		{
			bNa += bNb;
			bNb += bNa;
			i += 2;
		}
		++iter;
		diff = (steady_clock::now() - start);
		myfile << i << "," << diff.count() << endl;
	}
	myfile.close();

	myfile.open("200Runs22.csv");
	iter = 0;
	while (iter < 200)
	{
		// Section 2
		i = 1;
		bNa = 0;
		bNb = 1;
		start = steady_clock::now();
		while ((steady_clock::now() - start) / 1000us < runLimit)
		{
			bNc = bNa + bNb;
			bNa = bNb;
			bNb = bNc;
			i += 1;
		}
		++iter;
		diff = (steady_clock::now() - start);
		myfile << i << "," << diff.count() << endl;
	}
	myfile.close();

	// Section 2 Method1
	// 	i = 1;
	// 	bNa = 0;
	// 	bNb = 1;
	// 	// use the next line as is to capture the start time of a 2 second period
	// 	time_point<steady_clock> start = steady_clock::now();
	// 	while((steady_clock::now() - start)/1s < runLimit)
	// 	{ // true if 2 seconds since start time have not yet elapsed

	// 		bNa += bNb;
	// 		bNb += bNa;
	// 		i += 2;
	// 	}

	// 	// *** output the highest Fibonacci index calculated ***
	// 	std::chrono::duration<double> diff = (steady_clock::now() - start);
	// 	cout << diff.count() << endl; //Prints how long long it took
	// 	cout << i << endl;
	// //   cout << bNb << endl;

	// 	// Section 2, Method Alternative
	// 	// use the next line as is to capture the start time of a 2 second period
	// 	i = 1;
	// 	bNa = 0;
	// 	bNb = 1;
	// 	start = steady_clock::now();
	// 	while((steady_clock::now() - start)/1s < runLimit)
	// 	{ // true if 2 seconds since start time have not yet elapsed
	// 	bNc = bNa+bNb;
	// 	bNa = bNb;
	// 	bNb = bNc;
	// 	i += 1;
	// 	//    Experimentation
	// 	//      bNc = bNa+bNb;
	// 	//      bNa = bNb;
	// 	//      bNb = bNc;
	// 	//      i += 2;

	// 	}

	// // 	// *** output the highest Fibonacci index calculated ***
	// 	diff = (steady_clock::now() - start);
	// 	cout << diff.count() << endl; //Prints how long long it took
	// 	cout << i << endl;

	return 0;
}
