#Anxiety Control Questionnaire (ACQ) - Susan Schneck 2017_Feb
#Rapee et al. BEHAVIOR THERAPY 27, 279-293, 1996
# 2 scales - EXTernal (events) and INTernal (reactions)
# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: ACQ is officially scored on a scale from 0 to 5. Range selected as 1 to 6 based on lab convention.
# Score correction as -16 and -14 respectively to adjust for scale shift to 1 through 6

dS$ACQ_Ext = varScore(dI, Forward= c('ACQ_1', 'ACQ_12', 'ACQ_19', 'ACQ_29'), Reverse= c('ACQ_2', 'ACQ_5', 'ACQ_7', 'ACQ_8', 'ACQ_14', 'ACQ_15', 'ACQ_16', 'ACQ_20', 'ACQ_23', 'ACQ_24', 'ACQ_25', 'ACQ_30'), Range = c(1,6) ) - 16
dS$ACQ_Int = varScore(dI, Forward= c('ACQ_4', 'ACQ_10', 'ACQ_11', 'ACQ_13', 'ACQ_17', 'ACQ_21', 'ACQ_22', 'ACQ_27'), Reverse= c('ACQ_3', 'ACQ_6', 'ACQ_9', 'ACQ_18', 'ACQ_26', 'ACQ_28'),Range = c(1,6) ) - 14

# Calculate Alphas --------------------------------------------------------

dExt = dI[,c('ACQ_1', 'ACQ_12', 'ACQ_19', 'ACQ_29', 'ACQ_2', 'ACQ_5', 'ACQ_7', 'ACQ_8', 'ACQ_14', 'ACQ_15', 'ACQ_16', 'ACQ_20', 'ACQ_23', 'ACQ_24', 'ACQ_25', 'ACQ_30' )] #External Events
aExt = alpha(dExt, keys= c('ACQ_2', 'ACQ_5', 'ACQ_7', 'ACQ_8', 'ACQ_14', 'ACQ_15', 'ACQ_16', 'ACQ_20', 'ACQ_23', 'ACQ_24', 'ACQ_25', 'ACQ_30'))
aExt$total #output stats

dInt = dI[,c('ACQ_4', 'ACQ_10', 'ACQ_11', 'ACQ_13', 'ACQ_17', 'ACQ_21', 'ACQ_22', 'ACQ_27', 'ACQ_3', 'ACQ_6', 'ACQ_9', 'ACQ_18', 'ACQ_26', 'ACQ_28')] #Internal Events
aInt = alpha(dInt, keys= c('ACQ_3', 'ACQ_6', 'ACQ_9', 'ACQ_18', 'ACQ_26', 'ACQ_28'))
aInt$total #output stats