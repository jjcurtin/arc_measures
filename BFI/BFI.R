# Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$BFI_EXT = varScore(dI, Forward= c('BFI1', 'BFI11', 'BFI26', 'BFI36'), Reverse= c('BFI6', 'BFI21', 'BFI31'), Range = c(1,5) )
dS$BFI_AGR = varScore(dI, Forward= c('BFI7', 'BFI17', 'BFI22', 'BFI32', 'BFI42'), Reverse= c('BFI2', 'BFI12', 'BFI27', 'BFI37'), Range = c(1,5) )
dS$BFI_CON = varScore(dI, Forward= c('BFI3', 'BFI13', 'BFI28', 'BFI33', 'BFI38'), Reverse= c('BFI8', 'BFI18', 'BFI23', 'BFI43'), Range = c(1,5) )
dS$BAI_NEU = varScore(dI, Forward= c('BFI4', 'BFI14', 'BFI19', 'BFI29', 'BFI39'), Reverse= c('BFI9', 'BFI24', 'BFI34'), Range = c(1,5) )
dS$BAI_OPEN = varScore(dI, Forward= c('BFI5', 'BFI10', 'BFI15', 'BFI20', 'BFI25', 'BFI30', 'BFI40', 'BFI44'), Reverse= c('BFI35', 'BFI44'), Range = c(1,5) )