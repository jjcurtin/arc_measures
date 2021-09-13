#Updated for Item range 1-4 but corrected back to 0-3 in scoring
#Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$MWC_TOT = varScore(dI, Forward= c('MWC1', 'MWC2', 'MWC3', 'MWC4',  'MWC5', 'MWC6', 'MWC7', 'MWC8', 'MWC9', 'MWC10', 'MWC11', 'MWC12', 'MWC13', 'MWC14',  'MWC15', 'MWC16', 'MWC17', 'MWC18', 'MWC19', 'MWC20', 'MWC21', 'MWC22'), Range = c(1,4) ) - 22