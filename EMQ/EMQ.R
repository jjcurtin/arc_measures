# Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$EMQ_Soc = varScore(dI, Forward= c('EMQ1', 'EMQ4', 'EMQ7', 'EMQ10', 'EMQ13'), Range = c(1,4) )
dS$EMQ_COP = varScore(dI, Forward= c('EMQ2', 'EMQ5', 'EMQ8', 'EMQ11', 'EMQ14'), Range = c(1,4) )
dS$EMQ_ENH = varScore(dI, Forward= c('EMQ3', 'EMQ6', 'EMQ9', 'EMQ12', 'EMQ15'), Range = c(1,4) )
dS$EMQ_TOT = varScore(dI, Forward= c('EMQ1', 'EMQ2', 'EMQ3', 'EMQ4',  'EMQ5', 'EMQ6', 'EMQ7', 'EMQ8', 'EMQ9', 'EMQ10', 'EMQ11', 'EMQ12', 'EMQ13', 'EMQ14', 'EMQ15'), Range = c(1,4) )