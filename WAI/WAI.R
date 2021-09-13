# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: WAI is officially scored on a scale from 1 to 0. Range selected as 2 to 1 based on lab convention.
# Score correction as -39 to adjust for scale shift to 2 through 1

dS$WAI_TOT = varScore(dI, Forward= c('WAI1', 'WAI2', 'WAI3', 'WAI4', 'WAI5', 'WAI6','WAI7', 'WAI8', 'WAI9','WAI10', 'WAI11', 'WAI12', 'WAI13', 'WAI14','WAI15', 'WAI16', 'WAI17','WAI18', 'WAI19', 'WAI20', 'WAI21','WAI22', 'WAI23', 'WAI24', 'WAI25', 'WAI26', 'WAI27', 'WAI28', 'WAI29', 'WAI30','WAI31', 'WAI32', 'WAI33', 'WAI34', 'WAI35', 'WAI36', 'WAI37', 'WAI38'), Reverse = c('WAI39'), Range= c(2,1)) - 39