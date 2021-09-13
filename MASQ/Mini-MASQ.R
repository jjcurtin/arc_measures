##See scoring notes for reverse coded items##
#Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$MASQ_GD = varScore(dI, Forward= c('MASQ2', 'MASQ3', 'MASQ7', 'MASQ12', 'MASQ13', 'MASQ17', 'MASQ20', 'MASQ21'), Range = c(1,5) )
dS$MASQ_AA = varScore(dI, Forward= c('MASQ4', 'MASQ6', 'MASQ8', 'MASQ10', 'MASQ14', 'MASQ16', 'MASQ18', 'MASQ22', 'MASQ24', 'MASQ2', 'MASQ3', 'MASQ7', 'MASQ12', 'MASQ13', 'MASQ17', 'MASQ20', 'MASQ21', 'MASQ26'), Range = c(1,5) )
dS$MASQ_AD = varScore(dI, Forward= c('MASQ5', 'MASQ11'), Reverse= c('MASQ1', 'MASQ9', 'MASQ15', 'MASQ19', 'MASQ23', 'MASQ25'), Range = c(1,5) )