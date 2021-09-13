# Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$DMQ_Soc = varScore(dI, Forward= c('DMQ1', 'DMQ4', 'DMQ7', 'DMQ10', 'DMQ13'), Range = c(1,4) )
dS$DMQ_COP = varScore(dI, Forward= c('DMQ2', 'DMQ5', 'DMQ8', 'DMQ11', 'DMQ14'), Range = c(1,4) )
dS$DMQ_ENH = varScore(dI, Forward= c('DMQ3', 'DMQ6', 'DMQ9', 'DMQ12', 'DMQ15'), Range = c(1,4) )
dS$DMQ_TOT = varScore(dI, Forward= c('DMQ1', 'DMQ2', 'DMQ3', 'DMQ4',  'DMQ5', 'DMQ6', 'DMQ7', 'DMQ8', 'DMQ9', 'DMQ10', 'DMQ11', 'DMQ12', 'DMQ13', 'DMQ14', 'DMQ15'), Range = c(1,4) )