# DSM-5 Checklist for Alcohol Use Disorder
# Raw data coded 1=No, 2=Yes
# Subtract 11 to have total reflect total symptoms (yes)
#Last checked by JJC on 2017-05-22
# Added dI to match new scoring conventions- Megan F 2018_March

dS$DSM5_Tot = varScore(dI, Forward= paste0('DSM5_', 1:11), Range = c(1,2)) - 11

