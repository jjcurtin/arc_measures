# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: SMA is officially scored on a scale from 0 to 1. Range selected as 1 to 2 based on lab convention.
# Score correction as -13 to adjust for scale shift to 1 through 2

dS$SMA_TOT = varScore(dI, Forward= c('SMA2', 'SMA3', 'SMA6', 'SMA7', 'SMA8', 'SMA9', 'SMA10', 'SMA11', 'SMA12', 'SMA13'), Reverse= c('SMA1', 'SMA4', 'SMA5'), Range= c(1,2) ) - 13