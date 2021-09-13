# Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$CEOA_SOC = varScore(dI, Forward= c('CEOA1', 'CEOA3', 'CEOA5', 'CEOA14', 'CEOA24', 'CEOA31', 'CEOA34', 'CEOA38'), Range = c(1,4) )
dS$CEOA_TR = varScore(dI, Forward= c('CEOA18', 'CEOA27', 'CEOA29'), Range = c(1,4) )
dS$CEOA_LC = varScore(dI, Forward= c('CEOA19', 'CEOA20', 'CEOA21', 'CEOA22', 'CEOA37'), Range = c(1,4) )
dS$CEOA_SEX = varScore(dI, Forward= c('CEOA7', 'CEOA12', 'CEOA16', 'CEOA32'), Range = c(1,4) )
dS$CEOA_CBI = varScore(dI, Forward= c('CEOA2', 'CEOA6', 'CEOA8', 'CEOA9', 'CEOA11', 'CEOA13', 'CEOA15', 'CEOA23', 'CEOA26'), Range = c(1,4) )
dS$CEOA_RA = varScore(dI, Forward= c('CEOA10', 'CEOA17', 'CEOA25', 'CEOA35', 'CEOA36'), Range = c(1,4) )
dS$CEOA_SP = varScore(dI, Forward= c('CEOA4', 'CEOA28', 'CEOA30', 'CEOA33'), Range = c(1,4) )