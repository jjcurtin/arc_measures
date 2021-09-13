##See scoring notes for reverse coded items##
#Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$MASQ_GDA = varScore(dI, Forward= c('MASQ4', 'MASQ8', 'MASQ11', 'MASQ14', 'MASQ16', 'MASQ20', 'MASQ26', 'MASQ32','MASQ35', 'MASQ55', 'MASQ59'), Range = c(1,5) )
dS$MASQ_AA = varScore(dI, Forward= c('MASQ2', 'MASQ6', 'MASQ13', 'MASQ17', 'MASQ19', 'MASQ24', 'MASQ28', 'MASQ30', 'MASQ37', 'MASQ40', 'MASQ42', 'MASQ44', 'MASQ46', 'MASQ48', 'MASQ52', 'MASQ54', 'MASQ62'), Range = c(1,5) )
dS$MASQ_AD = varScore(dI, Forward= c('MASQ18', 'MASQ25', 'MASQ33', 'MASQ41', 'MASQ50', 'MASQ51', 'MASQ57', 'MASQ61'), Reverse= c('MASQ3', 'MASQ7', 'MASQ10', 'MASQ15', 'MASQ22', 'MASQ27', 'MASQ39', 'MASQ43', 'MASQ47', 'MASQ49', 'MASQ53', 'MASQ56', 'MASQ58', 'MASQ60'), Range = c(1,5) )
dS$MASQ_GDD = varScore(dI, Forward= c('MASQ1', 'MASQ5', 'MASQ9', 'MASQ12', 'MASQ21', 'MASQ23', 'MASQ29', 'MASQ31','MASQ34', 'MASQ36', 'MASQ38','MASQ45'), Range = c(1,5))