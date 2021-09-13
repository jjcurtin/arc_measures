# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: BAES is officially scored on a scale from 0 to 10. Range selected as 1 to 11 based on lab convention.
# Score correction as -7 to adjust for scale shift to 1 through 11


dS$BAES_STIM = varScore(dI, Forward= c('BAES3', 'BAES4', 'BAES5', 'BAES11', 'BAES12','BAES13','BAES14'), Range = c(1,11) ) - 7
dS$BAES_SED = varScore(dI, Forward= c('BAES1', 'BAES2', 'BAES6', 'BAES7', 'BAES8','BAES9','BAES10'), Range = c(1,11) ) - 7