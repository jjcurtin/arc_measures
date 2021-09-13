#Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$MCQ_COM = varScore(dI, Forward= c('MCQ2', 'MCQ7', 'MCQ10'), Range = c(1,7) )
dS$MCQ_EMO = varScore(dI, Forward= c('MCQ4', 'MCQ6', 'MCQ9'), Range = c(1,7) )
dS$MCQ_EXP = varScore(dI, Forward= c('MCQ5', 'MCQ11', 'MCQ12'), Range = c(1,7) )
dS$MCQ_PUR = varScore(dI, Forward= c('MCQ1', 'MCQ3', 'MCQ8'), Range = c(1,7) )
dS$MCQ_TOT = varScore(dI, Forward= c('MCQ1', 'MCQ2', 'MCQ3', 'MCQ4', 'MCQ5','MCQ6', 'MCQ7', 'MCQ8', 'MCQ9','MCQ10', 'MCQ11', 'MCQ12'), Range = c(1,7) )

#Marijuana Craving Questionnaire (MCQ) Cronbach's alpha script- Megan F 2018_May
dCrave1 = dI[,c("MCQ1", "MCQ2", "MCQ3", "MCQ4", "MCQ5", "MCQ6", "MCQ7", "MCQ8", "MCQ9", "MCQ10", "MCQ11", "MCQ12")]
aCrave1 = alpha(dCrave1, keys=c('MCQ4', 'MCQ6', 'MCQ7', 'MCQ8', 'MCQ9', 'MCQ10', 'MCQ11'),cumulative=FALSE, title=NULL, max=10,na.rm = TRUE, check.keys=FALSE,n.iter=1,delete=TRUE,use="pairwise")
aCrave1$total #output stats