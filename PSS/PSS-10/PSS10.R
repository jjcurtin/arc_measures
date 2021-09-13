#Perceived Stress Scale 10-item version
#Raw items are coded 1-5.  Recoded here to match publised 0-4 coding
#last checked by JJC on 2017-05-22
#Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$PSS10_Tot = varScore(dI, Forward= c('PSS_1', 'PSS_2', 'PSS_3', 'PSS_6', 'PSS_9', 'PSS_10'), Reverse= c('PSS_4', 'PSS_5', 'PSS_7', 'PSS_8'), Range = c(1,5) ) - 10