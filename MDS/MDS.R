# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: MDS is officially scored on a scale from 0 to 3. Range selected as 1 to 4 based on lab convention.
# Score correction as -10 to adjust for scale shift to 1 through 4

dS$MDS_TOT = varScore(dI, Forward= c('MDS1', 'MDS2', 'MDS3', 'MDS4',  'MDS5', 'MDS6', 'MDS7', 'MDS8', 'MDS9', 'MDS10'), Range = c(1,4) ) - 10