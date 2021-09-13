#ESI 100 items
#Edited by Sarah Sant'Ana Feb_2018 (Added dS, dI, and _ to item names)
#Megan F. March_ 2018
#Note: ESI_100 is officially scored on a scale from 0 to 3. Range selected as 1 to 4 based on lab convention.
#Score corrections have been added to adjust for scale shift to 1 through 4


dS$ESI_MJU = varScore(dI, Forward= c('ESI_1', 'ESI_7', 'ESI_10', 'ESI_31', 'ESI_48', 'ESI_50', 'ESI_53', 'ESI_57', 'ESI_97'), Reverse = c('ESI_4'), Range = c(1,4) ) - 9
dS$ESI_FRAU = varScore(dI, Forward= c('ESI_2', 'ESI_9', 'ESI_27', 'ESI_37', 'ESI_76', 'ESI_92'), Range = c(1,4) ) - 6
dS$ESI_DU = varScore(dI, Forward= c('ESI_3', 'ESI_21', 'ESI_41', 'ESI_47'), Reverse = c('ESI_35', 'ESI_59', 'ESI_62', 'ESI_89'), Range = c(1,4) ) - 8
dS$ESI_THEF = varScore(dI, Forward= c('ESI_5', 'ESI_29', 'ESI_39', 'ESI_93', 'ESI_99'), Range = c(1,4) ) - 5
dS$ESI_PI = varScore(dI, Forward= c('ESI_6', 'ESI_16', 'ESI_55', 'ESI_61', 'ESI_67', 'ESI_85', 'ESI_88'), Range = c(1,4) ) - 7
dS$ESI_IRE = varScore(dI, Forward= c('ESI_8', 'ESI_11', 'ESI_12', 'ESI_19', 'ESI_66', 'ESI_75', 'ESI_80', 'ESI_87', 'ESI_100'), Range = c(1,4) ) - 9
dS$ESI_ES = varScore(dI, Forward= c('ESI_13', 'ESI_98'), Range = c(1,4) ) - 2
dS$ESI_DP = varScore(dI, Forward= c('ESI_14', 'ESI_15', 'ESI_36', 'ESI_54', 'ESI_81', 'ESI_84', 'ESI_95'), Range = c(1,4) ) - 7
dS$ESI_RA = varScore(dI, Forward= c('ESI_17', 'ESI_30', 'ESI_46', 'ESI_52', 'ESI_79', 'ESI_83'), Range = c(1,4) ) - 6
dS$ESI_ALI = varScore(dI, Forward= c('ESI_18', 'ESI_86'), Range = c(1,4) ) - 2
dS$ESI_BP = varScore(dI, Forward= c('ESI_20', 'ESI_24'), Range = c(1,4) ) - 2
dS$ESI_HON = varScore(dI, Forward= c('ESI_22', 'ESI_51'),  Range = c(1,4) ) - 2
dS$ESI_PA = varScore(dI, Forward= c('ESI_23', 'ESI_34', 'ESI_44', 'ESI_49'), Range = c(1,4) ) - 4
dS$ESI_MJP = varScore(dI, Forward= c('ESI_25', 'ESI_32', 'ESI_40', 'ESI_58', 'ESI_74'), Range = c(1,4) ) - 5
dS$ESI_AP = varScore(dI, Forward= c('ESI_26', 'ESI_33', 'ESI_38'), Range = c(1,4) ) - 3
dS$ESI_DEP = varScore(dI, Forward= c('ESI_42', 'ESI_43'), Range = c(1,4) ) - 2
dS$ESI_REB = varScore(dI, Forward= c('ESI_56', 'ESI_65', 'ESI_70', 'ESI_73'),  Range = c(1,4) ) - 4
dS$ESI_PC = varScore(dI, Forward= c('ESI_63', 'ESI_82'), Range = c(1,4) ) - 2
dS$ESI_EMP = varScore(dI, Forward= c('ESI_64', 'ESI_94'), Reverse = c('ESI_71'),  Range = c(1,4) ) - 3
dS$ESI_BE = varScore(dI, Forward= c('ESI_69', 'ESI_90'), Range = c(1,4) ) - 2
dS$ESI_DA = varScore(dI, Forward= c('ESI_72', 'ESI_77', 'ESI_78', 'ESI_91'), Range = c(1,4) ) - 4
dS$ESI_IU = varScore(dI, Forward= c('ESI_28', 'ESI_45', 'ESI_60'),  Range = c(1,4) ) - 3
dS$ESI_AU = varScore(dI, Forward= c('ESI_68', 'ESI_96'), Range = c(1,4) ) - 2
dS$ESI_TOT= varScore(dI, Forward= c('ESI_1', 'ESI_2', 'ESI_3', 'ESI_5', 'ESI_6', 'ESI_7', 'ESI_8', 'ESI_9', 'ESI_10', 'ESI_11', 'ESI_12', 'ESI_13', 'ESI_14', 'ESI_15', 'ESI_16', 'ESI_17', 'ESI_18', 'ESI_19', 'ESI_20', 'ESI_21', 'ESI_22', 'ESI_23', 'ESI_24', 'ESI_25', 'ESI_26', 'ESI_27', 'ESI_28', 'ESI_29', 'ESI_30', 'ESI_31', 'ESI_32', 'ESI_33', 'ESI_34', 'ESI_36', 'ESI_37', 'ESI_38', 'ESI_39', 'ESI_40', 'ESI_41', 'ESI_42', 'ESI_43', 'ESI_44', 'ESI_45', 'ESI_46', 'ESI_47', 'ESI_48', 'ESI_49', 'ESI_50', 'ESI_51', 'ESI_52', 'ESI_53', 'ESI_54', 'ESI_55', 'ESI_56', 'ESI_57', 'ESI_58', 'ESI_60', 'ESI_61', 'ESI_63', 'ESI_64', 'ESI_65', 'ESI_66', 'ESI_67', 'ESI_68', 'ESI_69', 'ESI_70', 'ESI_72', 'ESI_73', 'ESI_74', 'ESI_75', 'ESI_76', 'ESI_77', 'ESI_78', 'ESI_79', 'ESI_80', 'ESI_81', 'ESI_82', 'ESI_83', 'ESI_84', 'ESI_85', 'ESI_86', 'ESI_87', 'ESI_88', 'ESI_90', 'ESI_91', 'ESI_92', 'ESI_93', 'ESI_94', 'ESI_95', 'ESI_96', 'ESI_97', 'ESI_98', 'ESI_99', 'ESI_100'), Reverse = c('ESI_4', 'ESI_35', 'ESI_59', 'ESI_62', 'ESI_71', 'ESI_89'), Range = c(1,4) ) - 100

