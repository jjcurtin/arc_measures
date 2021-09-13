# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: PCLR is officially scored on a scale from 0 to 2. Range selected as 1 to 3 based on lab convention.
# Score correction as -8, -9, and -17 respectively to adjust for scale shift to 1 through 3

dS$PCLR_DET = varScore(dI, Forward= c('PCLR1', 'PCLR2', 'PCLR4', 'PCLR5', 'PCLR6', 'PCLR7', 'PCLR8', 'PCLR16'), Range = c(1,3) ) - 8
dS$PCLR_ANT = varScore(dI, Forward= c('PCLR3', 'PCLR9', 'PCLR10', 'PCLR12', 'PCLR13', 'PCLR14', 'PCLR15', 'PCLR18', 'PCLR19'), Range = c(1,3) ) - 9
dS$PCLR_TOT = varScore(dI, Forward= c('PCLR1', 'PCLR2', 'PCLR4', 'PCLR5', 'PCLR6', 'PCLR7', 'PCLR8', 'PCLR16', 'PCLR3', 'PCLR9', 'PCLR10', 'PCLR12', 'PCLR13', 'PCLR14', 'PCLR15', 'PCLR18', 'PCLR19'), Range = c(1,3) ) - 17