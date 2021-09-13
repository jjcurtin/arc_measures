# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: PHQ is officially scored on a scale from 0 to 8. Range selected as 1 to 9 based on lab convention.
# Score correction as -5 and -15 respectively to adjust for scale shift to 1 through 9


dS$PHQ_AGO = varScore(dI, Forward= c('PHQ4', 'PHQ5', 'PHQ7', 'PHQ11', 'PHQ14'), Range = c(1,9) ) - 5
dS$PHQ_BLD = varScore(dI, Forward= c('PHQ1', 'PHQ3', 'PHQ9', 'PHQ12', 'PHQ15'), Range = c(1,9) ) - 5
dS$PHQ_SOC = varScore(dI, Forward= c('PHQ2', 'PHQ6', 'PHQ8', 'PHQ10', 'PHQ13'), Range = c(1,9) ) - 5
dS$PHQ_TOT = varScore(dI, Forward= c('PHQ4', 'PHQ5', 'PHQ7', 'PHQ11', 'PHQ14', 'PHQ1', 'PHQ3', 'PHQ9', 'PHQ12', 'PHQ15', 'PHQ2', 'PHQ6', 'PHQ8', 'PHQ10', 'PHQ13'), Range = c(1,9) ) - 15