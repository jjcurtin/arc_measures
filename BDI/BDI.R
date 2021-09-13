# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: BDI is officially scored on a scale from 0 to 3. Range selected as 1 to 4 based on lab convention.
# Score correction as -21 to adjust for scale shift to 1 through 4


dS$BDI_TOT = varScore(dI, Forward= c('BDI1', 'BDI2', 'BDI3', 'BDI4',  'BDI5', 'BDI6', 'BDI7', 'BDI8', 'BDI9', 'BDI10', 'BDI11', 'BDI12', 'BDI13', 'BDI14', 'BDI15', 'BDI16', 'BDI17', 'BDI18', 'BDI19', 'BDI20', 'BDI21'), Range = c(1,4) ) - 21