/* 
Max Martinelli
Stat 382, Homework 3
*/


/* Instructions
For each problem, write down the hypothesis and also write your conclusion. 
You should also attach the codes. The level of significance is 0.05.

Preliminaries
For this assignment, we will use the Fisher’s Exact Test and the 
Chi-square test. There are six problems. 
See the document in the repository for more details. */

ODS NOPROCTITLE;

/* Problem 1

Problem Restatement
Is it statistically significant that the proportion of chipmunks 
trilling is higher when they are closer to their burrow?


Hypothesis
Our hypotheses are H0: the variables are independent and H1: the shorter 
distance increases trilling. We review the Right-sided Pr >= F output. */

data trill;
	input distance $ trilled $ count;
	cards;
	10M Yes 16
	10M No 8
	100M Yes 3
	100M No 18
	;
run;

proc print data=trill;
	TITLE 'Problem 1 Data';
run;

proc freq data=trill;
	TITLE 'Problem 1 Results';
	table trilled*distance  / NOPRINT;
	exact fisher;
	weight count;
run;

/* Analysis
Based on the p−value we find the results to be statistically 
significant and we reject H0.*/








/* Problem 2

Problem Restatement
Is there no evidence that the two species of birds use the substrates 
in different proportions?


Hypothesis
Our hypotheses are H0: the variables are independent and H1: the are not 
independent. We review the Two-sided Pr <= P output. */

data substrate;
	input type $ bird $ count;
	cards;	
	Vegetation Heron 15
	Shoreline Heron 20
	Water Heron 14
	Structures Heron 6
	Vegetation Egret 8
	Shoreline Egret 5
	Water Egret 7
	Structures Egret 1
	;
run;

proc print data=substrate;
	TITLE 'Problem 2 Data';
run;

proc freq data=substrate;
	TITLE 'Problem 2 Results';
	table type*bird / NOPRINT;
	exact fisher;
	weight count;
run;

/* Analysis
Based on the p−value we do not find the results to be 
statistically significant and we fail to reject H0./






/* Problem 3

Problem Restatement
Is there a significant difference in synonymous/replacement ratio 
between polymorphisms and fixed differences?


Hypothesis
Our hypotheses are H0: the variables are independent and H1: the are not 
independent. We review the Two-sided Pr <= P output. */

data gene;
	input fixity $ synonymicity $ count;
	cards;	
	polymorphic synonymous 43
	fixed synonymous 17
	polymorphic replacement 2
	fixed replacement 7
	;
run;

proc print data=gene;
	TITLE 'Problem 3 Data';
run;

proc freq data=gene;
	TITLE 'Problem 3 Results';
	table fixity*synonymicity / NOPRINT;
	exact fisher;
	weight count;
run;

/* Analysis
Based on the p−value we find the results to be statistically 
significant and we reject H0.*/





/* Problem 4

Problem Restatement
We want to check whether being a man or a woman (columns) is 
independent of having voted in the last election (rows). 
In other words is “sex and voting independent”?


Hypothesis
Our hypotheses are H0: the variables are independent and H1: the are not 
independent. We review the Chi-Square output. */

data vote;
	input position $ sex $ count;
	cards;	
	voted men 2792
	did-not men 1486
	voted women 3591
	did-not women 2131
	;
run;

proc print data=vote;
	TITLE 'Problem 4 Data';
run;

proc freq data=vote;
	TITLE 'Problem 4 Results';
	table position*sex / NOPRINT chisq;
	weight count;
run;

/* Analysis
Based on the p−value we find the results to be statistically 
significant and we reject H0.*/




/* Problem 5

Problem Restatement
What would we conclude (about this die)?


Hypothesis
Our hypotheses are H0: the variables are independent and H1: the are not 
independent. We review the Chi-Square output. */

data die;
	input face $ count;
	cards;	
	1 42
	2 55
	3 38
	4 57
	5 64
	6 44
	;
run;

proc print data=die;
	TITLE 'Problem 5 Data';
run;

proc freq data=die;
	TITLE 'Problem 5 Results';
	table face / NOPRINT chisq;
	weight count;
run;

/* Analysis
Based on the p−value we do not find the results to be 
statistically significant and we fail to reject H0./





/* Problem 6

Problem Restatement
Based on the data, what is your conclusion (pertaining to 
Calendar Effect for hockey players and date of birth)?


Hypothesis
Our hypotheses are H0: the variables are independent and H1: the are not 
independent. We review the Chi-Square output. */

data hockey;
	input quarter $ count;
	cards;	
	Jan-Mar 84
	Apr-Jun 77
	Jul-Sep 35
	Oct-Dec 34
	;
run;

proc print data=hockey;
	TITLE 'Problem 6 Data';
run;

proc freq data=hockey;
	TITLE 'Problem 6 Results';
	table quarter / NOPRINT chisq;
	weight count;
run;

/* Analysis
Based on the p−value we find the results to be statistically 
significant and we reject H0.*/




