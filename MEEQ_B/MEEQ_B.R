# Each individual item on the MEEQ-B corresponds to one of each of MEEQ's 6 subscales
# Rated on bipolar scale from 1 (strongly disagree) to 5 (strongly agree)
# MEEQ-B is divided into two subscales: Positive Expectancies and Negative Expectancies

dS$MEEQB_Pos = varScore(dI, Forward= c('MEEQB_2', 'MEEQB_3', 'MEEQB_4'), Range = c(1,5))
ds$MEEQB_Neg = varScore(dI, Forward= c('MEEQB_1', 'MEEQB_5', 'MEEQB_6'), Range = c(1,5))