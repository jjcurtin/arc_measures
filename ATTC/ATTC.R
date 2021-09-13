# Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$ATTC_TOT = varScore(dI, Forward= c('ATTC4', 'ATTC5', 'ATTC9', 'ATTC10', 'ATTC13', 'ATTC14', 'ATTC17', 'ATTC18', 'ATTC19'), Reverse = c('ATTC1', 'ATTC2', 'ATTC3', 'ATTC6','ATTC7', 'ATTC8', 'ATTC11', 'ATTC12', 'ATTC15', 'ATTC16', 'ATTC20'), Range = c(1,4) )
dS$ATTC_FOC = varScore(dI, Forward= c('ATTC4', 'ATTC5', 'ATTC9'), Reverse= c('ATTC1', 'ATTC2', 'ATTC3', 'ATTC6','ATTC7', 'ATTC8'), Range = c(1,4) )
dS$ATTC_SHI = varScore(dI, Forward= c('ATTC10', 'ATTC13', 'ATTC14', 'ATTC17', 'ATTC18', 'ATTC19'), Reverse= c('ATTC11', 'ATTC12', 'ATTC15', 'ATTC16', 'ATTC20'), Range = c(1,4) )