# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: GAD7 is officially scored on a scale from 0 to 3. Range selected as 1 to 4 based on lab convention.
# Score correction as -7 to adjust for scale shift to 1 through 4

dS$GAD_TOT = varScore(dI, Forward= c('GAD1', 'GAD2', 'GAD3', 'GAD4', 'GAD5', 'GAD6', 'GAD7'), Range = c(1,4) ) - 7