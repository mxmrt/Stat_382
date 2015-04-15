/* 
Max Martinelli
Stat 382, Homework 6
*/


/* Instructions
Level of significance is alpha = 0.05.
Write down:
  (i) null and alternative hypothesis
 (ii) corresponding code 
(iii) conclusion */


ODS NOPROCTITLE;

/* for problems 1 and 2, t-test is used, thus we assume normality*/

/* Problem 1

Problem Restatement
Comparison of two diets and their impact on lowering blood glucose 
in diabetic patients


Hypothesis
	H0: Group 1 with diet A has an equal average difference in blood glucose
	H1: Group 1 with diet A has a lower average difference in blood glucose */

/* Sample size needed for statistical power being 0.5*/
PROC Power;
	TwoSampleMeans	
		Sides=1 MeanDiff=8 StdDev=16 Power=0.5 NTotal=.;
RUN;
/*n=46.*/;

/* Sample size needed for statistical power being 0.6*/
PROC Power;
	TwoSampleMeans	
		Sides=1 MeanDiff=8 StdDev=16 Power=0.6 NTotal=.;
RUN;
/*n=60.*/;

/* Sample size needed for statistical power being 0.7*/
PROC Power;
	TwoSampleMeans	
		Sides=1 MeanDiff=8 StdDev=16 Power=0.7 NTotal=.;
RUN;
/*n=78.*/;

/* Sample size needed for statistical power being 0.8*/
PROC Power;
	TwoSampleMeans	
		Sides=1 MeanDiff=8 StdDev=16 Power=0.8 NTotal=.;
RUN;
/*n=102.*/;

/* Sample size needed for statistical power being 0.9*/
PROC Power;
	TwoSampleMeans	
		Sides=1 MeanDiff=8 StdDev=16 Power=0.9 NTotal=.;
RUN;
/*n=140.*/;

/* Analysis
We see the power has a significant impact on the samle size needed*/








/* Problem 2

Problem Restatement
Effect of gender on the response time to a certain sound frequency.


Hypothesis
	H0: Response time is equal for both genders 
	H1: Response time for males is better than that of females */

/* Statistical power when mean difference is 0.05*/
PROC Power;
	TwoSampleMeans	
		Sides=1 MeanDiff=0.05 StdDev=0.2 Power=. NTotal=40;
RUN;
/*Corresponding statistical power is 0.193*/


/* Statistical power when mean difference is 0.1*/
PROC Power;
	TwoSampleMeans	
		Sides=1 MeanDiff=0.10 StdDev=0.2 Power=. NTotal=40;
RUN;
/*Corresponding statistical power is 0.463*/


/* Statistical power when mean difference is 0.15*/
PROC Power;
	TwoSampleMeans	
		Sides=1 MeanDiff=0.15 StdDev=0.2 Power=. NTotal=40;
RUN;
/*Corresponding statistical power is 0.753*/


/* Statistical power when mean difference is 0.2*/
PROC Power;
	TwoSampleMeans	
		Sides=1 MeanDiff=0.20 StdDev=0.2 Power=. NTotal=40;
RUN;
/*Corresponding statistical power is 0.928*/


/* Statistical power when mean difference is 0.25*/
PROC Power;
	TwoSampleMeans	
		Sides=1 MeanDiff=0.25 StdDev=0.2 Power=. NTotal=40;
RUN;
/*Corresponding statistical power is 0.987*/


/* Analysis
We see the mean difference has a significant impact on the 
	corresponding statistical powers*/




/* Wilcoxon-Manny-Whitney Test is used for problems 3 and 4*/



/* Problem 3

Problem Restatement
Reassess problem 1 with revised distribution assumptions.


Hypothesis
	H0: Group 1 with diet A has median equal to that of Group 2 with diet B
	H1: Group 1 with diet A has median less than that of Group 2 with diet B*/

/* Sample size needed for statistical power being 0.5*/
PROC Power;
   TwoSampleWilcoxon
      VarDist("UNIF") = UNIFORM(50, 80)
      VarDist("NORM") = NORMAL(75, 10)
      Variables = "UNIF" |  "NORM"
	  Alpha=0.05 Sides=1 Power = 0.5 NTotal = .;
RUN;
/*n=12.*/;

/* Sample size needed for statistical power being 0.6*/
PROC Power;
   TwoSampleWilcoxon
      VarDist("UNIF") = UNIFORM(50, 80)
      VarDist("NORM") = NORMAL(75, 10)
      Variables = "UNIF" |  "NORM"
	  Alpha=0.05 Sides=1 Power = 0.6 NTotal = .;
RUN;
/*n=14.*/;

/* Sample size needed for statistical power being 0.7*/
PROC Power;
   TwoSampleWilcoxon
      VarDist("UNIF") = UNIFORM(50, 80)
      VarDist("NORM") = NORMAL(75, 10)
      Variables = "UNIF" |  "NORM"
	  Alpha=0.05 Sides=1 Power = 0.7 NTotal = .;
RUN;
/*n=20.*/;

/* Sample size needed for statistical power being 0.8*/
PROC Power;
   TwoSampleWilcoxon
      VarDist("UNIF") = UNIFORM(50, 80)
      VarDist("NORM") = NORMAL(75, 10)
      Variables = "UNIF" |  "NORM"
	  Alpha=0.05 Sides=1 Power = 0.8 NTotal = .;
RUN;
/*n=26.*/;

/* Sample size needed for statistical power being 0.9*/
PROC Power;
   TwoSampleWilcoxon
      VarDist("UNIF") = UNIFORM(50, 80)
      VarDist("NORM") = NORMAL(75, 10)
      Variables = "UNIF" |  "NORM"
	  Alpha=0.05 Sides=1 Power = 0.9 NTotal = .;
RUN;
/*n=36.*/;

/* Analysis
We see the revised assumption has reduced the needed sample sizes considerably*/




/* Problem 4

Problem Restatement
Reassess problem 2 with revised distribution assumptions.


Hypothesis
	H0: Median response time is equal for both genders 
	H1: Median response time for males is less than that of females */

/* n=10*/
PROC Power;
   TwoSampleWilcoxon
      VarDist("GAMMA") 	= GAMMA(2, 0.05)
      VarDist("EXP") 	= GAMMA(1, 0.2)
      Variables = "GAMMA" |  "EXP"
	  Alpha=0.05 Sides=1 Power=. NTotal=20;
RUN;
/*Corresponding statistical power is 0.308*/


/* n=20*/
PROC Power;
   TwoSampleWilcoxon
      VarDist("GAMMA") 	= GAMMA(2, 0.05)
      VarDist("EXP") 	= GAMMA(1, 0.2)
      Variables = "GAMMA" |  "EXP"
	  Alpha=0.05 Sides=1 Power=. NTotal=40;
RUN;
/*Corresponding statistical power is 0.474*/


/* n=30*/
PROC Power;
   TwoSampleWilcoxon
      VarDist("GAMMA") 	= GAMMA(2, 0.05)
      VarDist("EXP") 	= GAMMA(1, 0.2)
      Variables = "GAMMA" |  "EXP"
	  Alpha=0.05 Sides=1 Power=. NTotal=60;
RUN;
/*Corresponding statistical power is 0.606*/


/* n=40*/
PROC Power;
   TwoSampleWilcoxon
      VarDist("GAMMA") 	= GAMMA(2, 0.05)
      VarDist("EXP") 	= GAMMA(1, 0.2)
      Variables = "GAMMA" |  "EXP"
	  Alpha=0.05 Sides=1 Power=. NTotal=80;
RUN;
/*Corresponding statistical power is 0.709*/



/* Analysis
We see the revised assumption has impacted the corresponding statistical powers*/
	
	
	
/* Problem 5

For this problem, we will assess it step by step. */


/* Step 1: Construct Linear Model  */	


DATA Reaction_Data;
	INPUT FeedRate 	Catelyst 	AgitRate 	Temp	Concen 	ReactionPercentage;
	DataLines;
		10 		1 		100 	140 	6 		37.5	
		10 		1 		120 	180 	3 		28.5
		10 		2 		100 	180 	3 		40.4
		10 		2 		120 	140 	6 		48.2
		15 		1 		100 	180 	6 		50.7
		15 		1 		120 	140 	3 		28.9
		15 		2 		100 	140 	3 		43.5
		15 		2 		120 	180 	6 		64.5
		12.5 	1.5 	110 	160 	4.5 	39
		12.5 	1.5 	110 	160 	4.5 	40.3
		12.5 	1.5 	110 	160 	4.5 	38.7
		12.5 	1.5 	110 	160 	4.5 	39.7
		;
RUN;

PROC Reg DATA = Reaction_Data;
	MODEL ReactionPercentage = FeedRate 	Catelyst 	AgitRate 	Temp	Concen;
RUN;


/* Our model is as follows:

Expected_Reaction_Data = -43.69167
						+ 1.65 * FeedRate
						+ 12.75 * Catelyst
						- 0.025 * AgitRate
						+ 0.1625 * Temp
						+ 4.96667 * Concen
Where the coefficients are Beta_i for i = 0, 1, ... , 5 */




/* Step 2: Refine Linear Model */	
/* To refine the model, we will see if it is possible to improve 
the adjusted value for R-square. Our current R-square = 0.9362.
We will use the forward method.*/

PROC Reg DATA = Reaction_Data;
	MODEL ReactionPercentage = FeedRate 	Catelyst 	AgitRate 	Temp	Concen
	/ Selection=FORWARD details=summary;
RUN;

/*This suggests we should remove AgitRate*/

PROC Reg DATA = Reaction_Data;
	MODEL ReactionPercentage = FeedRate 	Catelyst 	Temp	Concen;
RUN;

/* The new model improves R-square to 0.9446 */


/* Step 3: Write Down The Final Model 

The change only impacts our intercept and removes AgitRate

Expected_Reaction_Data = -46.44167
						+ 1.65 * FeedRate
						+ 12.75 * Catelyst
						+ 0.1625 * Temp
						+ 4.96667 * Concen
Where the coefficients are Beta_i for i = 0, 1, ... , 4 */


/* Step 4: Refine Linear Model */

PROC Reg DATA = Reaction_Data;
	MODEL ReactionPercentage = FeedRate 	Catelyst 	Temp	Concen
	/clb cli clm p;
	OUTPUT out=RESULTS p=rpredict lcl=lp ucl=up lclm=lm uclm=um;
RUN;

PROC Print DATA = RESULTS;
RUN;
/*
Variable		95% Confidence Limits
Intercept		-66.16853	-26.71480
FeedRate		0.88954		2.41046
Catelyst		8.94769		16.55231
Temp			0.06744		0.25756
Concen			3.69923		6.23410
*/


/* Step 5: 95% Confidence Interval of The Expected Mean 
	of the First Observation 

From the above output, we see the desired CI is (31.2514, 39.4653)*/


/* Step 6 */







