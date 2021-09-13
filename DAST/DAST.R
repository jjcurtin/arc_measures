# DAST is rated on a scale from 0 to 1 (No to Yes respectively). 
# It has been recoded from 1 to 2 in accordance with lab conventions.
# Score corrections added to the end to account for shift in range.
# Note that items 4, 5, and 7 are reverse coded.
# Created 4/5/2018- MF

dS$DAST_TOT = varScore(dI, Forward= c('DAST_1', 'DAST_2', 'DAST_3', 'DAST_6',  'DAST_8', 'DAST_9', 'DAST_10', 'DAST_11', 'DAST_12', 'DAST_13', 'DAST_14', 'DAST_15', 'DAST_16', 'DAST_17',
                                      'DAST_18', 'DAST_19', 'DAST_20', 'DAST_21', 'DAST_22', 'DAST_23', 'DAST_24','DAST_25', 'DAST_26', 'DAST_27', 'DAST_28'), 
                                      Reverse= c('DAST_4', 'DAST_5', 'DAST_7') , Range = c(1,2) ) - 28