#Distress Tolerance Scale
#Raw data items coded 1-5 (with high anchor of very true of me)
#scales scoreed so that high scores represent great tolerance
#Last checked by JJC on 2017-05-22
#Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$DTS_Toler = varScore(dI, Forward= c(), Reverse = c('DTS_1', 'DTS_3', 'DTS_5'), Range = c(1,5)  ) / 3
dS$DTS_Absorb = varScore(dI, Forward= c(), Reverse = c('DTS_2', 'DTS_4', 'DTS_15'), Range = c(1,5)  ) / 3
dS$DTS_Appraise = varScore(dI, Forward = c('DTS_6'), Reverse = c('DTS_7', 'DTS_9', 'DTS_10', 'DTS_11', 'DTS_12'), Range = c(1,5)  ) / 6
dS$DTS_Regulate = varScore(dI, Forward= c(), Reverse = c('DTS_8', 'DTS_13', 'DTS_14'), Range = c(1,5)  ) / 3

d$DTS_Tot = (d$DTS_Toler + d$DTS_Absorb + d$DTS_Appraise + d$DTS_Regulate ) / 4