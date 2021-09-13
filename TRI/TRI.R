# Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$TRI_GOV = varScore(dI, Forward= c('TRI9', 'TRI13', 'TRI15'), Range = c(1,9) )
dS$TRI_RES = varScore(dI, Forward= c('TRI3', 'TRI10', 'TRI14'), Range = c(1,9) )
dS$TRI_EMO = varScore(dI, Forward= c('TRI1', 'TRI2', 'TRI6'), Range = c(1,9) )
dS$TRI_CP = varScore(dI, Forward= c('TRI4', 'TRI7', 'TRI11'), Range = c(1,9) )
dS$TRI_CAD = varScore(dI, Forward= c('TRI5', 'TRI8', 'TRI12'), Range = c(1,9) )