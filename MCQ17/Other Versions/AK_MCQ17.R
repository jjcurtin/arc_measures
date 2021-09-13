# Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$MCQ_Com = varScore(dI, Forward= c('MCQ17_1', 'MCQ17_2', 'MCQ17_3', 'MCQ17_5'), Reverse= c('MCQ17_4', 'MCQ17_6', 'MCQ17_7'), Range = c(1,7) )
dS$MCQ_Emo = varScore(dI, Forward= NULL, Reverse= c('MCQ17_8', 'MCQ17_9', 'MCQ17_10', 'MCQ17_11'), Range = c(1,7) )
dS$MCQ_Exp = varScore(dI, Forward= c('MCQ17_12', 'MCQ17_13'), Reverse= c('MCQ17_14'), Range = c(1,7) )
dS$MCQ_Pur = varScore(dI, Forward= c('MCQ17_17'), Reverse= c('MCQ17_15', 'MCQ17_16'), Range = c(1,7) )
dS$MCQ_Tot = varScore(dI, Forward= c('MCQ17_1', 'MCQ17_2', 'MCQ17_3', 'MCQ17_5', 'MCQ17_12','MCQ17_13', 'MCQ17_17'), Reverse= c('MCQ17_4', 'MCQ17_6', 'MCQ17_7', 'MCQ17_8', 'MCQ17_9', 'MCQ17_10', 'MCQ17_11', 'MCQ17_14', 'MCQ17_15', 'MCQ17_16'), Range = c(1,7) )