# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: TF is normally scored on scale from 0 to 3. Recoded as 1 to 4 for lab convention. Added score correction.

dS$TF = varScore(dI, Forward= c('TF1', 'TF13', 'TF15', 'TF18','TF19', 'TF20', 'TF22', 'TF24', 'TF26', 'TF27', 'TF28', 'TF30', 'TF31', 'TF33', 'TF40'), Reverse = c('TF2', 'TF3', 'TF4', 'TF5','TF6', 'TF7', 'TF8', 'TF9', 'TF10', 'TF11', 'TF12', 'TF14', 'TF16', 'TF17', 'TF21','TF23', 'TF25', 'TF29', 'TF32','TF34', 'TF35', 'TF36', 'TF37', 'TF38', 'TF39', 'TF41', 'TF42'), Range = c(1,4) ) - 42
dS$TF_FSS = varScore(dI, Forward = c('TF1', 'TF2', 'TF3', 'TF4', 'TF5','TF6', 'TF7', 'TF8', 'TF9', 'TF10', 'TF11', 'TF12', 'TF13'), Range = c(1,5))