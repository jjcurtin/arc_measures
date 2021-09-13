######################
# FTND #
# Qualtrics scoring starts at 1 for each response option
######################

#make temp df for FTND
dFTND = dI[,c('FTND_1','FTND_2','FTND_3','FTND_4','FTND_5', 'FTND_6')]

#recode subset of items
dFTND$FTND_1 = 4-dFTND$FTND_1
dFTND$FTND_2 = 2-dFTND$FTND_2
dFTND$FTND_3 = 2-dFTND$FTND_3
dFTND$FTND_5 = 2-dFTND$FTND_5
dFTND$FTND_6 = 2-dFTND$FTND_6

#score
dS$FTND_TOT = varScore(dFTND, Forward= c('FTND_1','FTND_2','FTND_3','FTND_4','FTND_5', 'FTND_6'), Range = c(0,3))