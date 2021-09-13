# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: SSS is officially scored on a scale from 0 to 1. Range selected as 1 to 2 based on lab convention.
# Score correction as -10 and -40 respectively to adjust for scale shift to 1 through 2

dS$SSS_DIS = varScore(dI, Forward= c('SSS12', 'SSS13', 'SSS25', 'SSS30', 'SSS33', 'SSS35'), Reverse= c('SSS1', 'SSS29', 'SSS32', 'SSS36'), Range = c(1,2) ) - 10
dS$SSS_BOR = varScore(dI, Forward= c('SSS2', 'SSS7', 'SSS15', 'SSS27', 'SSS31'), Reverse= c('SSS5', 'SSS8', 'SSS24', 'SSS34', 'SSS39'), Range = c(1,2) ) - 10
dS$SSS_THR = varScore(dI, Forward= c('SSS11', 'SSS20', 'SSS21', 'SSS38', 'SSS40'), Reverse= c('SSS3', 'SSS16', 'SSS17', 'SSS23', 'SSS28'), Range = c(1,2) ) - 10
dS$SSS_EXP = varScore(dI, Forward= c('SSS4', 'SSS10', 'SSS19', 'SSS26', 'SSS37'), Reverse= c('SSS6', 'SSS9', 'SSS14', 'SSS18', 'SSS22'), Range = c(1,2) ) - 10
dS$SSS_TOT = varScore(dI, Forward= c('SSS4', 'SSS10', 'SSS19', 'SSS26', 'SSS37','SSS11', 'SSS20', 'SSS21', 'SSS38', 'SSS40','SSS2', 'SSS7', 'SSS15', 'SSS27', 'SSS31','SSS12', 'SSS13', 'SSS25', 'SSS30', 'SSS33','SSS35'), Reverse= c('SSS5', 'SSS8', 'SSS24', 'SSS34', 'SSS39','SSS1', 'SSS29', 'SSS32', 'SSS36','SSS3', 'SSS16', 'SSS17', 'SSS23', 'SSS28','SSS6', 'SSS9', 'SSS14', 'SSS18', 'SSS22'), Range = c(1,2) ) - 40