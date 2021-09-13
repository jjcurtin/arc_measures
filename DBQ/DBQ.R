#Drinking Behaviors Questionnaire (DBQ) - Susan Schneck 2017_Feb
#Edited by Sarah to add DBQ_5 in, correct variable names
#Cahalan, Don; Cisin, Ira H.; and Crossley, Helen M. American Drinking Practices: A National Study of Drinking Behavior and Attitudes. New Brunswick, Rutgers Center of Alcohol Studies, 1969.

#Recode DBQ (Assumes the variables are coded 1:5 or 1:10). 
dS$DBQ_TYPE = varRecode(dI$DBQ_1, 1:5, c('Beer', 'Wine', 'Mixed', 'Straight', 'Other'))
dS$DBQ_FREQ = varRecode(dI$DBQ_2, 1:10, c(.25,.625,1,2,3.5,5.5,7.5,10.5,17,21))  
dS$DBQ_QUAN = varRecode(dI$DBQ_3, 1:10, c(.5,1,2,3,4,5,6,8,11,13))
dS$DBQ_RTLG = varRecode(dI$DBQ_4, 1:10, c(.25,.375,.75,1,2,3,4,6,9,11))
dS$DBQ_RTBC = dI$DBQ_5 
dS$DBQ_FRHG = varRecode(dI$DBQ_6, 1:10, c(.125,.25,.5,.75,1,2,3,4,6,8))
dS$DBQ_QNHG = varRecode(dI$DBQ_7, 1:10, c(0,1,2,3,4,5,6,8,11,13))
dS$DBQ_FRDK = varRecode(dI$DBQ_8, 1:10, c(.125,.25,.5,.75,1,2,3,4,6,8))
dS$DBQ_QNDK = varRecode(dI$DBQ_9, 1:10, c(0,1,2,3,4,5,6,8,11,13))
dS$DBQ_HOLD = dI$DBQ_10