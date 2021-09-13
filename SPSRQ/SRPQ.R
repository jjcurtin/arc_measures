# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: SRPQ is officially scored on a scale from 0 to 1. Range selected as 1 to 2 based on lab convention.
# Score correction as - to adjust for scale shift to 1 through 2

dS$SENS_PUN = varScore(dI, Forward= c('SENS1', 'SENS3', 'SENS5', 'SENS7', 'SENS9', 'SENS11', 'SENS13', 'SENS15', 'SENS17', 'SENS19', 'SENS21', 'SENS23', 'SENS25', 'SENS27', 'SENS29', 'SENS31', 'SENS33', 'SENS35', 'SENS37', 'SENS39', 'SENS41', 'SENS43', 'SENS45', 'SENS47'), Range = c(1,2) ) - 24
dS$SENS_REW = varScore(dI, Forward= c('SENS2', 'SENS4', 'SENS6', 'SENS8', 'SENS10', 'SENS12', 'SENS14', 'SENS16', 'SENS18', 'SENS20', 'SENS22', 'SENS24', 'SENS26', 'SENS28', 'SENS30', 'SENS32', 'SENS34', 'SENS36', 'SENS38', 'SENS40', 'SENS42', 'SENS44', 'SENS46', 'SENS48'), Range = c(1,2) ) - 24