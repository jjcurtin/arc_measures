#Alcohol Abstinence Self-Efficacy Scale - 20 item form (AASE20) - Susan Schneck 2017_May
#DiClemente CC; Carbonari JP; Montgomery RPG; Hughes SO. The Alcohol Abstinence Self-Efficacy Scale. Journal of Studies on Alcohol 1994;55:141-148.

#The questions and instructions on AASE20 are identical to the last 20 questions of AASE40 (Confidence domain). 

#raw items in Qualtrics anchored at 1-5 but scales corrected to reflect published 0-4 scoring, JJC

#Added dS and dI to match new scoring conventions- Megan F 2018_March

#Confidence domain
dS$AASE20_ConNA = varScore(dI, Forward= c('AASE20_18', 'AASE20_16', 'AASE20_3', 'AASE20_14', 'AASE20_6'), Range = c(1,5) )-5
dS$AASE20_ConSoc = varScore(dI, Forward= c('AASE20_15', 'AASE20_20', 'AASE20_4', 'AASE20_17', 'AASE20_8'), Range = c(1,5) )-5
dS$AASE20_ConPhys = varScore(dI, Forward= c('AASE20_2', 'AASE20_12', 'AASE20_5', 'AASE20_13', 'AASE20_9'), Range = c(1,5) )-5
dS$AASE20_ConCrav = varScore(dI, Forward=c('AASE20_1', 'AASE20_7', 'AASE20_11', 'AASE20_10', 'AASE20_19'), Range = c(1,5) )-5

# Calculate Alphas --------------------------------------------------------

dConNA = dI[,c('AASE20_18', 'AASE20_16', 'AASE20_3', 'AASE20_14', 'AASE20_6')] #Negative Affect
aConNA = alpha(dConNA, keys=NULL)
aConNA$total #output stats

dConSoc = dI[,c('AASE20_15', 'AASE20_20', 'AASE20_4', 'AASE20_17', 'AASE20_8')] #Social/Positive
aConSoc = alpha(ConSoc, keys=NULL)
aConSoc$total #output stats

dConPhys = dI[,c('AASE20_2', 'AASE20_12', 'AASE20_5', 'AASE20_13', 'AASE20_9')] #Physical and Other Concerns
aConPhys = alpha(ConPhys, keys=NULL)
aConPhys$total #output stats

dConCrav = dI[,c('AASE20_1', 'AASE20_7', 'AASE20_11', 'AASE20_10', 'AASE20_19')] #Craving and Urges
aConCrav = alpha(ConCrav, keys=NULL)
aConCrav$total #output stats