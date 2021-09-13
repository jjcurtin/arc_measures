# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Added underscores between scale title and items to match Qualtrics conventions.

dS$BFNE_TOT = varScore(dI, Forward= c('BFNE_1', 'BFNE_3', 'BFNE_5', 'BFNE_6',  'BFNE_8', 'BFNE_9', 'BFNE_11', 'BFNE_12'), Reverse= c('BFNE_2', 'BFNE_4', 'BFNE_7', 'BFNE_10') , Range = c(1,5) )