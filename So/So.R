# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: So is officially scored on a scale from 0 to 1. Range selected as 1 to 2 based on lab convention.
# Score correction as -54 to adjust for scale shift to 1 through 2

dS$So_TOT = varScore(dI, Forward= c('So1', 'So2', 'So4', 'So5', 'So8', 'So9', 'So11', 'So13', 'So14', 'So18', 'So19', 'So21', 'So23', 'So26', 'So28', 'So29', 'So30', 'So31', 'So33', 'So35', 'So36', 'So38', 'So41', 'So42', 'So43', 'So45', 'So46', 'So47', 'So49', 'So50', 'So51', 'So53', 'So54'), Reverse= c('So3', 'So6', 'So7', 'So10', 'So12', 'So15', 'So16', 'So17', 'So19', 'So20', 'So22', 'So24', 'So25', 'So27', 'So32', 'So34', 'So37', 'So39', 'So40', 'So44', 'So48', 'So52'), Range = c(1,2) ) - 54