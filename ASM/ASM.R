# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: ASM is officially scored on a scale from 0 to 1. Range selected as 1 to 2 based on lab convention.
# Score correction as -39 and -13 respectively to adjust for scale shift to 1 through 2



dS$ASM_TOT = varScore(dI, Forward= c('ASM2', 'ASM3', 'ASM6', 'ASM7',  'ASM8', 'ASM9', 'ASM10', 'ASM11', 'ASM12', 'ASM13', 'ASM15', 'ASM16', 'ASM19', 'ASM20', 'ASM21','ASM22', 'ASM23', 'ASM24', 'ASM25',  'ASM26', 'ASM28', 'ASM29','ASM32', 'ASM33', 'ASM34', 'ASM35', 'ASM36', 'ASM37', 'ASM38', 'ASM39'), Reverse= c('ASM1', 'ASM4', 'ASM5', 'ASM14',  'ASM17', 'ASM18', 'ASM27', 'ASM30', 'ASM31'), Range = c(1,2) ) - 39
dS$ASM_SELF = varScore(dI, Forward= c('ASM2', 'ASM3', 'ASM6', 'ASM7',  'ASM8', 'ASM9', 'ASM10', 'ASM11', 'ASM12', 'ASM13'), Reverse= c('ASM1', 'ASM4', 'ASM5'), Range = c(1,2) ) - 13
dS$ASM_FATH = varScore(dI, Forward= c('ASM15', 'ASM16', 'ASM19', 'ASM20', 'ASM21','ASM22', 'ASM23', 'ASM24', 'ASM25',  'ASM26'), Reverse= c('ASM14',  'ASM17', 'ASM18'), Range = c(1,2) ) - 13
dS$ASM_MOTH = varScore(dI, Forward= c('ASM28', 'ASM29', 'ASM32', 'ASM33', 'ASM34', 'ASM35', 'ASM36', 'ASM37', 'ASM38', 'ASM39'), Reverse= c('ASM27', 'ASM30', 'ASM31'), Range = c(1,2) ) - 13