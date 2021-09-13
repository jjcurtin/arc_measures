##must find the mean, varScore will not find the mean##
# Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$PSA_TOT = varScore(dI, Forward= c('PSA1', 'PSA2', 'PSA3', 'PSA4', 'PSA5', 'PSA6', 'PSA7', 'PSA8', 'PSA9', 'PSA10', 'PSA11', 'PSA12', 'PSA13', 'PSA14', 'PSA15', 'PSA16'), Range = c(1,5) )