# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: PD is officially scored on a scale from 0 to 1. Range selected as 1 to 2 based on lab convention.
# Score correction as -50 to adjust for scale shift to 1 through 2

dS$PD_TOT = varScore(dI, Forward= c('PD1', 'PD2', 'PD4', 'PD5', 'PD6', 'PD7', 'PD8','PD9', 'PD10', 'PD11', 'PD12', 'PD13', 'PD14', 'PD15', 'PD16', 'PD17', 'PD18', 'PD19', 'PD20', 'PD21', 'PD22','PD23', 'PD24', 'PD25', 'PD26', 'PD27', 'PD28', 'PD29','PD30', 'PD31', 'PD32', 'PD33', 'PD34', 'PD35', 'PD36', 'PD37', 'PD38', 'PD39', 'PD40', 'PD41', 'PD42', 'PD43','PD44', 'PD45', 'PD46', 'PD447', 'PD48', 'PD49', 'PD50'), Range = c(1,2) ) - 50