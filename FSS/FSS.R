# Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$FSS_SOC = varScore(dI, Forward= c('FSS5', 'FSS8', 'FSS9', 'FSS10', 'FSS15', 'FSS20', 'FSS27', 'FSS33', 'FSS41', 'FSS44', 'FSS47', 'FSS51', 'FSS52'), Range = c(1,5) )
dS$FSS_AGO = varScore(dI, Forward= c('FSS2', 'FSS3', 'FSS6', 'FSS7', 'FSS11', 'FSS17', 'FSS18', 'FSS19', 'FSS23', 'FSS24', 'FSS35', 'FSS40', 'FSS42'), Range = c(1,5) )
dS$FSS_INJ = varScore(dI, Forward= c('FSS1', 'FSS4', 'FSS12', 'FSS14', 'FSS22', 'FSS32', 'FSS36', 'FSS38', 'FSS39', 'FSS43', 'FSS46', 'FSS50'), Range = c(1,5) )
dS$FSS_SEX = varScore(dI, Forward= c('FSS25', 'FSS26', 'FSS28', 'FSS30', 'FSS31', 'FSS34', 'FSS48', 'FSS49'), Range = c(1,5) )
dS$FSS_ANI = varScore(dI, Forward= c('FSS13', 'FSS16', 'FSS21', 'FSS29', 'FSS37', 'FSS45'), Range = c(1,5) )
dS$FSS_TOT = varScore(dI, Forward= c('FSS13', 'FSS16', 'FSS21', 'FSS29', 'FSS37', 'FSS45', 'FSS25', 'FSS26', 'FSS28', 'FSS30', 'FSS31', 'FSS34', 'FSS48', 'FSS49', 'FSS1', 'FSS4', 'FSS12', 'FSS14', 'FSS22', 'FSS32', 'FSS36', 'FSS38', 'FSS39', 'FSS43', 'FSS46', 'FSS50', 'FSS2', 'FSS3', 'FSS6', 'FSS7', 'FSS11', 'FSS17', 'FSS18', 'FSS19', 'FSS23', 'FSS24', 'FSS35', 'FSS40', 'FSS42','FSS5', 'FSS8', 'FSS9', 'FSS10', 'FSS15', 'FSS20', 'FSS27', 'FSS33', 'FSS41', 'FSS44', 'FSS47', 'FSS51', 'FSS52' ), Range = c(1,5) )