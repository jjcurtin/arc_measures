# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: WSWS is officially scored on a scale from 0 to 4. Range selected as 1 to 5 based on lab convention.
# Score corrections were added to adjust for scale shift to 1 through 5

dS$WSWS_ANG = varScore(dI, Forward= c('WSWS_13', 'WSWS_15', 'WSWS_18'), Range = c(1,5) ) - 3
dS$WSWS_ANX = varScore(dI, Forward= c('WSWS_3', 'WSWS_6', 'WSWS_8'), Reverse = c('WSWS_10'), Range = c(1,5) ) - 4
dS$WSWS_SAD = varScore(dI, Forward= c('WSWS_12', 'WSWS_19'), Reverse = c('WSWS_7', 'WSWS_24'), Range = c(1,5) ) - 4
dS$WSWS_CON = varScore(dI, Forward= c('WSWS_23', 'WSWS_27'), Reverse = c('WSWS_4'), Range = c(1,5) ) - 3
dS$WSWS_CRV = varScore(dI, Forward= c('WSWS_9', 'WSWS_11', 'WSWS_20', 'WSWS_26'), Range = c(1,5) ) - 4
dS$WSWS_SLP = varScore(dI, Forward= c('WSWS_5', 'WSWS_25'), Reverse = c('WSWS_2', 'WSWS_17', 'WSWS_22'), Range = c(1,5) ) - 5
dS$WSWS_HUN = varScore(dI, Forward= c('WSWS_14', 'WSWS_16', 'WSWS_21', 'WSWS_28'), Reverse = c('WSWS_1'), Range = c(1,5) ) - 5
dS$WSWS_TOT = varScore(dI, Forward= c('WSWS_14', 'WSWS_16', 'WSWS_21', 'WSWS_28','WSWS_5', 'WSWS_25','WSWS_9', 'WSWS_11', 'WSWS_20', 'WSWS_26','WSWS_23', 'WSWS_27','WSWS_12', 'WSWS_19','WSWS_3', 'WSWS_6', 'WSWS_8','WSWS_13', 'WSWS_15', 'WSWS_18'), Reverse = c('WSWS_1','WSWS_2', 'WSWS_17', 'WSWS_22','WSWS_4','WSWS_7', 'WSWS_24','WSWS_10'), Range = c(1,5) ) - 28