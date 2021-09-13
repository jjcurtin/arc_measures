# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: PAT, UNX, PDO, AGD originally scored from 0 to 1. Scored as 1 to 2 according to lab conventions. Score corrections added.
# Note: TPQ, AGO, BLD, Soc originally scored from 0 to 8. Scored as 1 to 9 according to lab conventions. Score corrections added.

dS$AXEQ_PSWQ = varScore(dI, Forward= c('AXEQ2', 'AXEQ4', 'AXEQ5', 'AXEQ6', 'AXEQ7', 'AXEQ9', 'AXEQ12', 'AXEQ13', 'AXEQ14', 'AXEQ15', 'AXEQ16'), Reverse= c('AXEQ1', 'AXEQ3', 'AXEQ8', 'AXEQ10', 'AXEQ11') , Range = c(1,5) )
dS$AXEQ_TPQ = varScore(dI, Forward= c('AXEQ17', 'AXEQ18', 'AXEQ19', 'AXEQ20', 'AXEQ21', 'AXEQ22', 'AXEQ23', 'AXEQ24', 'AXEQ25', 'AXEQ26', 'AXEQ27', 'AXEQ28', 'AXEQ29', 'AXEQ30', 'AXEQ31'), Range = c(1,9) ) - 15
dS$AXEQ_AGO = varScore(dI, Forward= c('AXEQ20', 'AXEQ21', 'AXEQ23', 'AXEQ27', 'AXEQ30'), Range = c(1,9) ) - 5
dS$AXEQ_BLD = varScore(dI, Forward= c('AXEQ17', 'AXEQ19', 'AXEQ25', 'AXEQ28', 'AXEQ31'), Range = c(1,9) ) - 5
dS$AXEQ_SOC = varScore(dI, Forward= c('AXEQ18', 'AXEQ22', 'AXEQ24', 'AXEQ26', 'AXEQ29'), Range = c(1,9) ) - 5
dS$AXEQ_PAT = varScore(dI, Forward= c('AXEQ32'), Range = c(1,2) ) - 1
dS$AXEQ_PAS = varScore(dI, Forward= c('AXEQ33', 'AXEQ34', 'AXEQ35', 'AXEQ36', 'AXEQ37', 'AXEQ38', 'AXEQ39', 'AXEQ40', 'AXEQ41', 'AXEQ42', 'AXEQ43', 'AXEQ44', 'AXEQ45', 'AXEQ46'), Range = c(1,14) )
dS$AXEQ_UNX = varScore(dI, Forward= c('AXEQ47'), Range = c(1,2) ) - 1
dS$AXEQ_MPA = varScore(dI, Forward= c('AXEQ48'), Range = c(1,6) )
dS$AXEQ_LPA = varScore(dI, Forward= c('AXEQ49'), Range = c(1,10) )
dS$AXEQ_PDO = varScore(dI, Forward= c('AXEQ50', 'AXEQ51', 'AXEQ52'), Range = c(1,2) ) - 3
dS$AXEQ_AGD = varScore(dI, Forward= c('AXEQ52', 'AXEQ53'), Range = c(1,2) ) - 2
