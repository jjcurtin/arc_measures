#Dyadic Adjustment Scale (DAS) - Susan Schneck 2017_May. Errors corrected 2018_Mar.
#Spanier, G. B. (1976). Measuring dyadic adjustment: New scales for assessing the quality of marriage and similar dyads. Journal of Marriage and the Family, 38, 15-28. 
#Four subscales: Consensus, Satisfaction, Cohesion, Affectional Expression. 
#Qualtrics scoring: Reverse scoring as indicated below. Items 1-15, 18-19, 25-28, & 32 are forward scored 1-6 ; Items 23-24 are forward scored 1-5; Item 31 is forward scored 1-7.


dDAS = dI

#Items do not have the same ranges. Therefore reverse scored items must be recoded prior to scoring. 
dDAS$DAS_16 = varRecode(dDAS$DAS_16, 1:6, c(6,5,4,3,2,1))  
dDAS$DAS_17 = varRecode(dDAS$DAS_17, 1:6, c(6,5,4,3,2,1))  
dDAS$DAS_20 = varRecode(dDAS$DAS_20, 1:6, c(6,5,4,3,2,1))  
dDAS$DAS_21 = varRecode(dDAS$DAS_21, 1:6, c(6,5,4,3,2,1))  
dDAS$DAS_22 = varRecode(dDAS$DAS_22, 1:6, c(6,5,4,3,2,1)) 

dDAS$DAS_29 = varRecode(dDAS$DAS_29, 1:2, c(2,1))  
dDAS$DAS_30 = varRecode(dDAS$DAS_30, 1:2, c(2,1)) 


#Subscale scores
#Consensus
dS$DAS_Con = varScore(dDAS, Forward= c('DAS_1', 'DAS_2', 'DAS_3', 'DAS_5', 'DAS_7', 'DAS_8', 'DAS_9', 'DAS_10', 'DAS_11', 'DAS_12', 'DAS_13', 'DAS_14', 'DAS_15') )

#Satisfaction
dS$DAS_Sat = varScore(dDAS, Forward= c('DAS_16', 'DAS_17', 'DAS_18', 'DAS_19', 'DAS_20', 'DAS_21', 'DAS_22', 'DAS_23', 'DAS_31', 'DAS_32') )

#Cohesion
dS$DAS_Coh = varScore(dDAS, Forward= c('DAS_24', 'DAS_25', 'DAS_26', 'DAS_27', 'DAS_28') )

#Affectional Expression
dS$DAS_Aff = varScore(dDAS, Forward= c('DAS_4', 'DAS_6', 'DAS_29', 'DAS_30') )

#Total Score
dS$DAS_Tot = varScore(dDAS, Forward= paste0('DAS_', 1:32))

#remove tmp dataframe
rm(dDAS)
