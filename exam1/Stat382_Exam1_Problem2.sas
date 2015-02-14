/* 
Max Martinelli
Stat 382, Exam 1 - Problem 2
*/


/* You can find a csv file in the blackboard assignment folder. 
There are two variables in the file, one is BMI (Body Mass Index), 
another one is FEMALE with 1 indicates female and 0 indicates male.  */

title 'Stat 382: Exam 1 Problem 2';

/* Initial Step
Input the file into SAS format. */

PROC IMPORT datafile= "/folders/myfolders/Exam1.csv"
	out= exam1_bmi
	dbms=csv
	replace;
	getnames= yes;
RUN; 

/* Step 1
Compute the mean, standard deviation, 5th, 25th, median, 
75th, 95th quantile, as well as 95% confidence interval 
of the mean of BMI. */

PROC REPORT DATA = WORK.exam1_bmi;
	COLUMN BMI, (MEAN  STD P5 Q1 MEDIAN Q3 P95);
	TITLE 'Summary of BMI';
RUN; 

title '95% Confidence Interval for mean of BMI';
proc means data=WORK.exam1_bmi alpha=.05 mean clm;
	var BMI;
run;

/*
Step 2
Compute 90% confidence interval of the proportion of female.  */


DATA exam1_bmi_female;
	SET WORK.exam1_bmi;
	IF FEMALE = 1 THEN OUTPUT exam1_bmi_female;
RUN;


title '90% Confidence Interval for mean of Female BMI';
proc means data=WORK.exam1_bmi_female alpha=.1 mean clm;
	var BMI;
run;




