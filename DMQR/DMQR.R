# Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$DMQR_SOC = varScore(dI, Forward= c('DMQR3', 'DMQR5', 'DMQR11', 'DMQR14', 'DMQR16'), Range = c(1,5) )
dS$DMQR_COP = varScore(dI, Forward= c('DMQR1', 'DMQR4', 'DMQR6', 'DMQR15', 'DMQR17'), Range = c(1,5) )
dS$DMQR_ENH = varScore(dI, Forward= c('DMQR7', 'DMQR9', 'DMQR10', 'DMQR13', 'DMQR18'), Range = c(1,5) )
dS$DMQR_CON = varScore(dI, Forward= c('DMQR2', 'DMQR8', 'DMQR12', 'DMQR19', 'DMQR20'), Range = c(1,5) )