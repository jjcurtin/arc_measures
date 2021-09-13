#Intolerance of Uncertainty Scale (IUS)
#Raw data items coded 1-5
#last checked by JJC, 2017-05-02
# Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$IUS_TOT = varScore(dI, Forward= paste0('IUS_', 1:27), Range = c(1,5) )