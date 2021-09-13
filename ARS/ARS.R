dS$ARS_ANGTHTS = varScore(dI, Forward= c('ARS19', 'ARS18', 'ARS9', 'ARS7', 'ARS8'), Range = c(1,4) )
dS$ARS_REV = varScore(dI, Forward= c('ARS4', 'ARS16', 'ARS13', 'ARS6'), Range = c(1,4) )
dS$ARS_MEM = varScore(dI, Forward= c('ARS2', 'ARS3', 'ARS15', 'ARS1', 'ARS5'), Range = c(1,4) )
dS$ARS_CAUSE = varScore(dI, Forward= c('ARS12', 'ARS17', 'ARS11', 'ARS10'), Range = c(1,4) )
dS$ARS_TOT = varScore(dI, Forward= c('ARS19', 'ARS18', 'ARS9', 'ARS7', 'ARS8','ARS4', 'ARS16', 'ARS13', 'ARS6','ARS2', 'ARS3', 'ARS15', 'ARS1', 'ARS5','ARS12', 'ARS17', 'ARS11', 'ARS10'), Range = c(1,4) )


# check scoring ref, varScore may not work for this measure 
# Added dS and dI to match new scoring conventions- Megan F 2018_March