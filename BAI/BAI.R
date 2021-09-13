# BAI
# Edited by Sarah Sant'Ana in 2018_Feb to include dS and dI and to add _ to item names
# Behavioral Activation and Behavioral Inhibition Scales
# Carver and White, 1994, JPSP
# NOTE: Item 1 and 18 are reverse coded

dS$BIS_PUN = varScore(dI, Forward= c( 'BAI_6', 'BAI_10', 'BAI_13', 'BAI_15', 'BAI_20'), Reverse = c('BAI_1', 'BAI_18'), Range = c(1,4) )
dS$BAS_REW = varScore(dI, Forward= c('BAI_3', 'BAI_5', 'BAI_11', 'BAI_14', 'BAI_19'), Range = c(1,4) )
dS$BAS_DRV = varScore(dI, Forward= c('BAI_2', 'BAI_7', 'BAI_9', 'BAI_17'), Range = c(1,4) )
dS$BAS_FUN = varScore(dI, Forward= c('BAI_4', 'BAI_8', 'BAI_12', 'BAI_16'), Range = c(1,4) )