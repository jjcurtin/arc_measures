# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: CAGE is officially scored on a scale from 0 to 1. Range selected as 1 to 2 based on lab convention.
# Score correction as -4 to adjust for scale shift to 1 through 2

dS$CAGE_TOT = varScore(dI, Forward= c('CAGE1', 'CAGE2', 'CAGE3', 'CAGE4'), Range = c(1,2) ) - 4
