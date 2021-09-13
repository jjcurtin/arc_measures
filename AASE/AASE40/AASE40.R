#Alcohol Abstinence Self-Efficacy Scale (AASE) - Susan Schneck 2017_May
#DiClemente CC; Carbonari JP; Montgomery RPG; Hughes SO. The Alcohol Abstinence Self-Efficacy Scale. Journal of Studies on Alcohol 1994;55:141-148.
# 2 domains (Temptation and Confidence), each with 4 subscales - NEGATIVE AFFECT,SOCIAL/POSITIVE, PHYSICAL AND OTHER CONCERNS, CRAVING AND URGES

#raw items in Qualtrics anchored at 1-5 but scales corrected to reflect published 0-4 scoring, JJC

#Added dS and dI to match new scoring conventions- Megan F 2018_March

#Temptation domain
dS$AASE_TempNA = varScore(dI, Forward= c('AASE_18', 'AASE_16', 'AASE_3', 'AASE_14', 'AASE_6'), Range = c(1,5) )-5
dS$AASE_TempSoc = varScore(dI, Forward= c('AASE_15', 'AASE_20', 'AASE_4', 'AASE_17', 'AASE_8'), Range = c(1,5) )-5
dS$AASE_TempPhys = varScore(dI, Forward= c('AASE_2', 'AASE_12', 'AASE_5', 'AASE_13', 'AASE_9'), Range = c(1,5) )-5
dS$AASE_TempCrav = varScore(dI, Forward=c('AASE_1', 'AASE_7', 'AASE_11', 'AASE_10', 'AASE_19'), Range = c(1,5) )-5

#Confidence domain
dS$AASE_ConNA = varScore(dI, Forward= c('AASE_38', 'AASE_36', 'AASE_23', 'AASE_34', 'AASE_26'), Range = c(1,5) )-5
dS$AASE_ConSoc = varScore(dI, Forward= c('AASE_35', 'AASE_40', 'AASE_24', 'AASE_37', 'AASE_28'), Range = c(1,5) )-5
dS$AASE_ConPhys = varScore(dI, Forward= c('AASE_22', 'AASE_32', 'AASE_25', 'AASE_33', 'AASE_29'), Range = c(1,5) )-5
dS$AASE_ConCrav = varScore(dI, Forward=c('AASE_21', 'AASE_27', 'AASE_31', 'AASE_30', 'AASE_39'), Range = c(1,5) )-5

# Calculate Alphas --------------------------------------------------------

#Temptation Domains
dTempNA = dI[,c('AASE_18', 'AASE_16', 'AASE_3', 'AASE_14', 'AASE_6')] #Negative Affect
aTempNA = alpha(dTempNA, keys=NULL)
aTempNA$total #output stats

dTempSoc = dI[,c('AASE_15', 'AASE_20', 'AASE_4', 'AASE_17', 'AASE_8')] #Social/Positive
aTempSoc = alpha(TempSoc, keys=NULL)
aTempSoc$total #output stats

dTempPhys = dI[,c('AASE_2', 'AASE_12', 'AASE_5', 'AASE_13', 'AASE_9')] #Physical and Other Concerns
aTempPhys = alpha(TempPhys, keys=NULL)
aTempPhys$total #output stats

dTempCrav = dI[,c('AASE_1', 'AASE_7', 'AASE_11', 'AASE_10', 'AASE_19')] #Craving and Urges
aTempCrav = alpha(TempCrav, keys=NULL)
aTempCrav$total #output stats

#Confidence domains
dConNA = dI[,c('AASE_38', 'AASE_36', 'AASE_23', 'AASE_34', 'AASE_26')] #Negative Affect
aConNA = alpha(dConNA, keys=NULL)
aConNA$total #output stats

dConSoc = dI[,c('AASE_35', 'AASE_40', 'AASE_24', 'AASE_37', 'AASE_28')] #Social/Positive
aConSoc = alpha(ConSoc, keys=NULL)
aConSoc$total #output stats

dConPhys = dI[,c('AASE_22', 'AASE_32', 'AASE_25', 'AASE_33', 'AASE_29')] #Physical and Other Concerns
aConPhys = alpha(ConPhys, keys=NULL)
aConPhys$total #output stats

dConConCrav = dI[,c('AASE_21', 'AASE_27', 'AASE_31', 'AASE_30', 'AASE_39')] #Craving and Urges
aConConCrav = alpha(ConConCrav, keys=NULL)
aConConCrav$total #output stats