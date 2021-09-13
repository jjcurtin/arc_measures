# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: YAACQ is officially scored on a scale from 0 to 1. Range selected as 1 to 2 based on lab convention.
# Score correction as -6, -4, -8, -5, -4, -7, and -67 respectively to adjust for scale shift to 1 through 2

dS$YAACQ_SOC = varScore(dI, Forward= c('YAACQ1', 'YAACQ14', 'YAACQ22', 'YAACQ28', 'YAACQ42', 'YAACQ45'), Range = c(1,2) ) - 6
dS$YAACQ_CON = varScore(dI, Forward= c('YAACQ13', 'YAACQ19', 'YAACQ37', 'YAACQ39', 'YAACQ53', 'YAACQ62'), Range = c(1,2) ) - 6
dS$YAACQ_SELFP = varScore(dI, Forward= c('YAACQ3', 'YAACQ15', 'YAACQ23', 'YAACQ67'), Range = c(1,2) ) - 4
dS$YAACQ_SELFC = varScore(dI, Forward= c('YAACQ25', 'YAACQ26', 'YAACQ43', 'YAACQ44',  'YAACQ49', 'YAACQ51', 'YAACQ58', 'YAACQ64'), Range = c(1,2) ) - 8
dS$YAACQ_RISK = varScore(dI, Forward= c('YAACQ4', 'YAACQ9', 'YAACQ17', 'YAACQ24',  'YAACQ32', 'YAACQ38', 'YAACQ40', 'YAACQ61'), Range = c(1,2) ) - 8
dS$YAACQ_COC = varScore(dI, Forward= c('YAACQ2', 'YAACQ11', 'YAACQ20', 'YAACQ36',  'YAACQ52'), Range = c(1,2) ) - 5
dS$YAACQ_DEP = varScore(dI, Forward= c('YAACQ21', 'YAACQ27', 'YAACQ31', 'YAACQ54'), Range = c(1,2) ) - 4
dS$YAACQ_BLK = varScore(dI, Forward= c('YAACQ5', 'YAACQ8', 'YAACQ10', 'YAACQ29',  'YAACQ41', 'YAACQ48', 'YAACQ66'), Range = c(1,2) ) - 7
dS$YAACQ_TOT = varScore(dI, Forward= c('YAACQ1', 'YAACQ2', 'YAACQ3', 'YAACQ4',  'YAACQ5', 'YAACQ6', 'YAACQ7', 'YAACQ8', 'YAACQ9', 'YAACQ10', 'YAACQ11', 'YAACQ12',  'YAACQ13', 'YAACQ14', 'YAACQ15', 'YAACQ16','YAACQ17', 'YAACQ18', 'YAACQ19', 'YAACQ20',  'YAACQ21', 'YAACQ22', 'YAACQ23', 'YAACQ24','YAACQ25', 'YAACQ26', 'YAACQ27', 'YAACQ28',  'YAACQ29', 'YAACQ30', 'YAACQ31', 'YAACQ32', 'YAACQ33', 'YAACQ34', 'YAACQ35', 'YAACQ36',  'YAACQ37', 'YAACQ38', 'YAACQ39', 'YAACQ40', 'YAACQ41', 'YAACQ42', 'YAACQ43', 'YAACQ44',  'YAACQ45', 'YAACQ46', 'YAACQ47', 'YAACQ48','YAACQ49', 'YAACQ50', 'YAACQ51', 'YAACQ52', 'YAACQ53', 'YAACQ54',  'YAACQ55', 'YAACQ56', 'YAACQ57', 'YAACQ58','YAACQ59', 'YAACQ60', 'YAACQ61', 'YAACQ62',  'YAACQ63', 'YAACQ64', 'YAACQ65', 'YAACQ66','YAACQ67'), Range = c(1,2) ) - 67
