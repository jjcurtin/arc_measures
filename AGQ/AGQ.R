# Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$AGQ_PHYS = varScore(dI, Forward= c('AGQ1', 'AGQ2', 'AGQ3', 'AGQ4', 'AGQ5', 'AGQ6', 'AG8', 'AGQ9'), Reverse= c('AGQ7'),  Range = c(1,7) )
dS$AGQ_VERB = varScore(dI, Forward= c('AGQ10', 'AGQ11', 'AGQ12', 'AGQ13', 'AGQ14'), Range = c(1,7) )
dS$AGQ_ANG = varScore(dI, Forward= c('AGQ15', 'AGQ16', 'AGQ17', 'AGQ19', 'AGQ20', 'AGQ21'), Reverse= c('AGQ18'), Range = c(1,7) )
dS$AGQ_HOST = varScore(dI, Forward= c('AGQ22', 'AGQ23', 'AGQ24', 'AGQ25', 'AGQ26', 'AGQ27', 'AGQ28', 'AGQ29'), Range = c(1,7) )
dS$AGQ_TOT = varScore(dI, Forward= c('AGQ1', 'AGQ2', 'AGQ3', 'AGQ4', 'AGQ5', 'AGQ6', 'AG8', 'AGQ9','AGQ10', 'AGQ11', 'AGQ12', 'AGQ13', 'AGQ14','AGQ15', 'AGQ16', 'AGQ17', 'AGQ19', 'AGQ20', 'AGQ21','AGQ22', 'AGQ23', 'AGQ24', 'AGQ25', 'AGQ26', 'AGQ27', 'AGQ28', 'AGQ29'), Reverse= c('AGQ7', 'AGQ18'), Range= c(1,7))