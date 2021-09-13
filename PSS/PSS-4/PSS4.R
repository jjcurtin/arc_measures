#Perceived Stress Scale 4-item version
#Raw items coded 1-5, recoded to 0-4 scoring to  match published measure
#last checked by JJC on 2017-05-22
#Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$PSS4_Tot = varScore(dI, Forward= c('PSS_1', 'PSS_4'), Reverse= c('PSS_2', 'PSS_3'), Range = c(1,5) ) - 4