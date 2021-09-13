# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: AEI is officially scored on a scale from 0 to 6. Range selected as 1 to 7 based on lab convention.
# Score correction as -8, -9,  and -24 respectively to adjust for scale shift to 1 through 7


dS$AEI_POS = varScore(dI, Forward= c('AEI8', 'AEI11', 'AEI13', 'AEI15', 'AEI16', 'AEI18', 'AEI22', 'AEI24'), Range = c(1,7) ) - 8
dS$AEI_NEG = varScore(dI, Forward= c('AEI2', 'AEI5', 'AEI6', 'AEI7', 'AEI10', 'AEI12', 'AEI14', 'AEI17', 'AEI19'), Range = c(1,7)) - 9
dS$AEI_ARO = varScore(dI, Forward= c('AEI1', 'AEI2', 'AEI3', 'AEI4', 'AEI5', 'AEI10', 'AEI11', 'AEI13', 'AEI16'), Range = c(1,7) ) - 9
dS$AEI_SOD = varScore(dI, Forward= c('AEI8', 'AEI9', 'AEI14', 'AEI15', 'AEI17', 'AEI19', 'AEI20', 'AEI23', 'AEI24'), Range = c(1,7) ) - 9
dS$AEI_TOT = varScore(dI, Forward= c('AEI1', 'AEI2', 'AEI3', 'AEI4',  'AEI5', 'AEI6', 'AEI7', 'AEI8', 'AEI9', 'AEI10', 'AEI11', 'AEI12', 'AEI13', 'AEI14', 'AEI15','AEI16', 'AEI17', 'AEI18', 'AEI19', 'AEI20', 'AEI21', 'AEI22', 'AEI23', 'AEI24'), Range = c(1,7) ) - 24