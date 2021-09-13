##See scoring notes for reverse coded items##
#Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$MASQ_GDM = varScore(dI, Forward= c('MASQ4', 'MASQ17', 'MASQ29', 'MASQ31', 'MASQ34', 'MASQ37', 'MASQ50', 'MASQ51','MASQ70', 'MASQ76', 'MASQ80', 'MASQ83', 'MASQ84', 'MASQ90'), Reverse = c('MASQ5'), Range = c(1,5) )
dS$MASQ_AA = varScore(dI, Forward= c('MASQ3', 'MASQ19', 'MASQ25', 'MASQ48', 'MASQ52', 'MASQ55', 'MASQ57', 'MASQ61','MASQ67', 'MASQ69', 'MASQ73','MASQ75', 'MASQ79','MASQ85', 'MASQ87', 'MASQ88'), Range = c(1,5))
dS$MASQ_GDA = varScore(dI, Forward= c('MASQ2', 'MASQ9', 'MASQ12', 'MASQ15', 'MASQ20', 'MASQ59', 'MASQ63', 'MASQ65', 'MASQ77', 'MASQ81', 'MASQ82'), Range = c(1,5) )
dS$MASQ_AD = varScore(dI, Forward= c('MASQ5', 'MASQ11'), Reverse= c('MASQ1', 'MASQ9', 'MASQ15', 'MASQ19', 'MASQ23', 'MASQ25'), Range = c(1,5) )
dS$MASQ_GDD = varScore(dI, Forward= c('MASQ6', 'MASQ8', 'MASQ10', 'MASQ13', 'MASQ16', 'MASQ22', 'MASQ24', 'MASQ42', 'MASQ47', 'MASQ56', 'MASQ64', 'MASQ74'), Range = c(1,5) )