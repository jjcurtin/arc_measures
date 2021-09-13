# Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$PGMQ_SOC = varScore(dI, Forward= c('PGMQ3', 'PGMQ5', 'PGMQ11', 'PGMQ14', 'PGMQ16'), Range = c(1,5) )
dS$PGMQ_COP = varScore(dI, Forward= c('PGMQ1', 'PGMQ4', 'PGMQ6', 'PGMQ15', 'PGMQ17'), Range = c(1,5) )
dS$PGMQ_ENH = varScore(dI, Forward= c('PGMQ7', 'PGMQ9', 'PGMQ10', 'PGMQ13', 'PGMQ18'), Range = c(1,5) )
dS$PGMQ_CNF = varScore(dI, Forward= c('PGMQ2', 'PGMQ8', 'PGMQ12', 'PGMQ19',  'PGMQ20'), Range = c(1,5) )
dS$PGMQ_TOT = varScore(dI, Forward= c('PGMQ1', 'PGMQ2', 'PGMQ3', 'PGMQ4',  'PGMQ5', 'PGMQ6', 'PGMQ7', 'PGMQ8', 'PGMQ9', 'PGMQ10', 'PGMQ11', 'PGMQ12', 'PGMQ13', 'PGMQ14', 'PGMQ15', 'PGMQ16', 'PGMQ17', 'PGMQ18', 'PGMQ19', 'PGMQ20'), Range = c(1,5) )                  