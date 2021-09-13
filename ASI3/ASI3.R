#Anxiety Sensitivity Index-3 (ASI-3) 
#Taylor, et al, 2007, Psychological Assessment
#Raw data items coded 1-5 but scale scores based on 0-4
#last checked by JJC, 2017-05-22
#Added Cronbach's alpha calculations from Kaye2 Dissertation. - Megan F. 05/2018

dS$ASI3_PC = varScore(dI, Forward= c('ASI3_4', 'ASI3_12', 'ASI3_8', 'ASI3_7', 'ASI3_15', 'ASI3_3'), Range = c(1,5) ) - 6
dS$ASI3_CC = varScore(dI, Forward= c('ASI3_14', 'ASI3_18', 'ASI3_10', 'ASI3_16', 'ASI3_2', 'ASI3_5'), Range = c(1,5) ) - 6
dS$ASI3_SC = varScore(dI, Forward= c('ASI3_9', 'ASI3_6', 'ASI3_11', 'ASI3_13', 'ASI3_17', 'ASI3_1'), Range = c(1,5) ) - 6
dS$ASI3_TOT = varScore(dI, Forward= paste0('ASI3_', 1:18), Range = c(1,5) ) - 18

# Calculate Alphas --------------------------------------------------------

#Anxiety Sensitivity Index-3 (ASI-3) 
dPC = dI[,c('ASI3_4', 'ASI3_12', 'ASI3_8', 'ASI3_7', 'ASI3_15', 'ASI3_3')] #Physical Concerns
aPC = alpha(dPC, keys=NULL)
aPC$total #output stats

dCC = dI[,c('ASI3_14', 'ASI3_18', 'ASI3_10', 'ASI3_16', 'ASI3_2', 'ASI3_5')] #Cognitive Concerns
aCC = alpha(dCC, keys=NULL)
aCC$total #output stats

dSC = dI[,c('ASI3_9', 'ASI3_6', 'ASI3_11', 'ASI3_13', 'ASI3_17', 'ASI3_1')] #Social Concerns
aSC = alpha(dSC, keys=NULL)
aSC$total #output stats

dASI3 = dI[,c('ASI3_1', 'ASI3_2', 'ASI3_3', 'ASI3_4', 'ASI3_5', 'ASI3_6', 'ASI3_7','ASI3_8','ASI3_9','ASI3_10',
              'ASI3_11','ASI3_12','ASI3_13','ASI3_14','ASI3_15','ASI3_16','ASI3_17','ASI3_18')] #ASI Total
aASI3 = alpha(dASI3, keys=NULL)
aASI3$total #output stats