#Scoring is not confirmed, this is what we have used in the past. the key is copywrited. varScore may not handle.
# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: HARDY is officially scored on a scale from 0 to 3. Range selected as 1 to 4 based on lab convention.
# Score correction as -15 and -45 respectively to adjust for scale shift to 1 through 4



dS$HARDY_COMM = varScore(dI, Forward= c('HARDY1', 'HARDY8', 'HARDY17', 'HARDY25', 'HARDY39'), Reverse= c('HARDY7', 'HARDY9', 'HARDY18', 'HARDY23', 'HARDY24', 'HARDY31', 'HARDY37', 'HARDY41', 'HARDY44', 'HARDY45'), Range = c(1,4) ) - 15
dS$HARDY_CHAL = varScore(dI, Forward= c('HARDY15', 'HARDY21', 'HARDY30', 'HARDY33', 'HARDY36'), Reverse= c('HARDY5', 'HARDY6', 'HARDY12', 'HARDY16', 'HARDY20', 'HARDY27', 'HARDY32', 'HARDY35', 'HARDY38', 'HARDY40'), Range = c(1,4) ) - 15
dS$HARDY_CONT = varScore(dI, Forward= c('HARDY2', 'HARDY13', 'HARDY19', 'HARDY22', 'HARDY42'), Reverse= c('HARDY3', 'HARDY4', 'HARDY10', 'HARDY11', 'HARDY14', 'HARDY26', 'HARDY28', 'HARDY29', 'HARDY34', 'HARDY43'), Range = c(1,4) ) - 15
dS$HARDY_TOT = varScore(dI, Forward= c('HARDY1', 'HARDY8', 'HARDY17', 'HARDY25', 'HARDY39','HARDY15', 'HARDY21', 'HARDY30', 'HARDY33', 'HARDY36','HARDY2', 'HARDY13', 'HARDY19', 'HARDY22', 'HARDY42'), Reverse= c('HARDY7', 'HARDY9', 'HARDY18', 'HARDY23', 'HARDY24', 'HARDY31', 'HARDY37', 'HARDY41', 'HARDY44', 'HARDY45','HARDY5', 'HARDY6', 'HARDY12', 'HARDY16', 'HARDY20', 'HARDY27', 'HARDY32', 'HARDY35', 'HARDY38', 'HARDY40','HARDY3', 'HARDY4', 'HARDY10', 'HARDY11', 'HARDY14', 'HARDY26', 'HARDY28', 'HARDY29', 'HARDY34', 'HARDY43'), Range = c(1,4) ) - 45