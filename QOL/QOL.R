#Quality of Life scale
#home grown based on sample measure
#Raw items coded 1-5
#last checked by JJC on 2017-05-22
#Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$QOL_Tot = varScore(dI, Forward= paste0('QOL_', 1:17), Range = c(1,5) )