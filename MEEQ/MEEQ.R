#Items scored 1-5 on bipolar scale (strongly disagree to strongly agree)
#No item range correction needed
#REF

dS$MEEQ_COGBEH = varScore(dI, Forward= c('MEEQ_1', 'MEEQ_7', 'MEEQ_13'), Range = c(1,5))
ds$MEEQ_RELAX = varScore(dI, Forward= c('MEEQ_2', 'MEEQ_8', 'MEEQ_14'), Range = c(1,5))
ds$MEEQ_SOCSEX = varScore(dI, Forward= c('MEEQ_3', 'MEEQ_9'), Reverse= c('MEEQ_15'), Range = c(1,5))
ds$MEEQ_ENHANCE = varScore(dI, Forward= c('MEEQ_4', 'MEEQ_10', 'MEEQ_16'), Range = c(1,5))
ds$MEEQ_NEG = varScore(dI, Forward= c('MEEQ_5', 'MEEQ_11', 'MEEQ_17'), Range = c(1,5))
ds$MEEQ_CRAVE = varScore(dI, Forward= c('MEEQ_6', 'MEEQ_12', 'MEEQ_18'), Range = c(1,5))