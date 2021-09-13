# Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$MMQ_Soc = varScore(dI, Forward= c('MMQ3', 'MMQ5', 'MMQ11', 'MMQ14', 'MMQ15'), Range = c(1,4) )
dS$MMQ_COP = varScore(dI, Forward= c('MMQ1', 'MMQ4', 'MMQ6', 'MMQ17'), Range = c(1,4) )
dS$MMQ_ENH = varScore(dI, Forward= c('MMQ7', 'MMQ9', 'MMQ10', 'MMQ13', 'MMQ18'), Range = c(1,4) )
dS$MMQ_CON = varScore(dI, Forward= c('MMQ2', 'MMQ8', 'MMQ12', 'MMQ19', 'MMQ20'), Range = c(1,4))
dS$MMQ_EXP = varScore(dI, Forward= c('MMQ21', 'MMQ22', 'MMQ23', 'MMQ24', 'MMQ25'), Range = c(1,4))
dS$MMQ_TOT = varScore(dI, Forward= c('MMQ1', 'MMQ2', 'MMQ3', 'MMQ4',  'MMQ5', 'MMQ6', 'MMQ7', 'MMQ8', 'MMQ9', 'MMQ10', 'MMQ11', 'MMQ12', 'MMQ13', 'MMQ14', 'MMQ15', 'MMQ16', 'MMQ17', 'MMQ18', 'MMQ19', 'MMQ20', 'MMQ21', 'MMQ22', 'MMQ23', 'MMQ24', 'MMQ25'), Range = c(1,4) )