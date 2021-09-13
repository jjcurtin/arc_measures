# Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$AEX_OUT = varScore(dI, Forward= c('AEX2', 'AEX7', 'AEX9', 'AEX11', 'AEX13', 'AEX17', 'AEX19', 'AEX20'), Range = c(1,4) )
dS$AEX_AIN = varScore(dI, Forward= c('AEX3', 'AEX5', 'AEX6', 'AEX10', 'AEX12', 'AEX14', 'AEX15', 'AEX18'), Range = c(1,4) )
dS$AEX_CON = varScore(dI, Forward= c('AEX1', 'AEX8', 'AEX16'), Range = c(1,4) )
dS$AEX_TOT = varScore(dI, Forward= c('AEX1', 'AEX2', 'AEX3', 'AEX4', 'AEX5', 'AEX6', 'AEX7', 'AEX8', 'AEX9', 'AEX10', 'AEX11', 'AEX12', 'AEX13', 'AEX14', 'AEX15', 'AEX16', 'AEX17', 'AEX18', 'AEX19', 'AEX20'), Range = c(1,4) )