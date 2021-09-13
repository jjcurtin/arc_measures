#Locus of Control Scale (LCS) - Susan Schneck 2017_Feb
#Rotter, J. B. (1966) Generalized expectancies for internal versus external control of reinforcement. Psychological Monographs: General and Applied, 80, 1-28
#Score one point for each of the following: 2.a, 3.b, 4.b, 5.b, 6.a, 7.a, 9.a, 10.b, 11.b, 12.b, 13.b, 15.b, 16.a, 17.a, 18.a, 20.a, 21.a, 22.b, 23.a, 25.a, 26.b, 28.b, 29.a. 
# There are 6 filler items intended to make somewhat more ambiguous the purpose of the test, which are not scored??? (1, 8, 14, 19, 24, 27)
# Higher score = external LOC; lower = internal LoC


#Recode LCS 
dID$LCS_2 = varRecode(dID$LCS_2, c(1,2), c(1,0))
dID$LCS_3 = varRecode(dID$LCS_3, c(1,2), c(0,1))
dID$LCS_4 = varRecode(dID$LCS_4, c(1,2), c(0,1))
dID$LCS_5 = varRecode(dID$LCS_5, c(1,2), c(0,1))
dID$LCS_6 = varRecode(dID$LCS_6, c(1,2), c(1,0))
dID$LCS_7 = varRecode(dID$LCS_7, c(1,2), c(1,0))
dID$LCS_9 = varRecode(dID$LCS_9, c(1,2), c(1,0))
dID$LCS_10 = varRecode(dID$LCS_10, c(1,2), c(0,1))
dID$LCS_11 = varRecode(dID$LCS_11, c(1,2), c(0,1))
dID$LCS_12 = varRecode(dID$LCS_12, c(1,2), c(0,1))
dID$LCS_13 = varRecode(dID$LCS_13, c(1,2), c(0,1))
dID$LCS_15 = varRecode(dID$LCS_15, c(1,2), c(0,1))
dID$LCS_16 = varRecode(dID$LCS_16, c(1,2), c(1,0))
dID$LCS_17 = varRecode(dID$LCS_17, c(1,2), c(1,0))
dID$LCS_18 = varRecode(dID$LCS_18, c(1,2), c(1,0))
dID$LCS_20 = varRecode(dID$LCS_20, c(1,2), c(1,0))
dID$LCS_21 = varRecode(dID$LCS_21, c(1,2), c(1,0))
dID$LCS_22 = varRecode(dID$LCS_22, c(1,2), c(0,1))
dID$LCS_23 = varRecode(dID$LCS_23, c(1,2), c(1,0))
dID$LCS_25 = varRecode(dID$LCS_25, c(1,2), c(1,0))
dID$LCS_26 = varRecode(dID$LCS_26, c(1,2), c(0,1))
dID$LCS_28 = varRecode(dID$LCS_27, c(1,2), c(0,1))
dID$LCS_29 = varRecode(dID$LCS_27, c(1,2), c(1,0))


#Score LCS
dID$LCS_TOT = varScore(dID, Forward= c('LCS_2', 'LCS_3', 'LCS_4', 'LCS_5', 'LCS_6', 'LCS_7', 'LCS_9', 'LCS_10', 'LCS_11', 'LCS_12', 'LCS_13', 'LCS_15', 'LCS_16', 'LCS_17', 'LCS_18', 'LCS_20', 'LCS_21', 'LCS_22', 'LCS_23', 'LCS_25', 'LCS_26', 'LCS_28', 'LCS_29'), Range = c(0,1) )
