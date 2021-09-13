# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: ICU is officially scored on a scale from 0 to 3. Range selected as 1 to 4 based on lab convention.
# Score correction as -11, -8, and -5 respectively to adjust for scale shift to 1 through 4

dS$ICU_CAL = varScore(dI, Forward= c('ICU_4', 'ICU_9', 'ICU_18', 'ICU_11', 'ICU_21','ICU_7', 'ICU_20', 'ICU_2', 'ICU_10', 'ICU_12'), Reverse= c('ICU_8'), Range = c(1,4) ) - 11
dS$ICU_UNC = varScore(dI, Reverse= c('ICU_15', 'ICU_23', 'ICU_16', 'ICU_3', 'ICU_17', 'ICU_24','ICU_13', 'ICU_5'), Range = c(1,4) ) - 8
dS$ICU_UNE = varScore(dI, Reverse= c('ICU_1', 'ICU_19', 'ICU_6', 'ICU_22', 'ICU_14'), Range = c(1,4) ) - 5