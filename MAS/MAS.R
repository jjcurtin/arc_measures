# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: MAS is officially scored on a scale from 0 to 1. Range selected as 1 to 2 based on lab convention.
# Score correction as -38 to adjust for scale shift to 1 through 2

dS$MAS_TOT = varScore(dI, Forward= c('MAS4', 'MAS5', 'MAS7', 'MAS8',  'MAS10', 'MAS12', 'MAS13', 'MAS15', 'MAS17', 'MAS18', 'MAS19', 'MAS20', 'MAS21', 'MAS22', 'MAS24','MAS26', 'MAS27', 'MAS28', 'MAS29',  'MAS31', 'MAS32', 'MAS33', 'MAS34', 'MAS35', 'MAS36', 'MAS37'), Reverse= c('MAS1', 'MAS2', 'MAS3', 'MAS6',  'MAS9', 'MAS11', 'MAS14', 'MAS16', 'MAS23', 'MAS25', 'MAS30', 'MAS38'), Range = c(1,2) ) - 38