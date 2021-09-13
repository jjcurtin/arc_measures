#Symptom Check-List-90 (SCL-90) - Susan Schneck 2017_May
#Derogatis, L.R., Lipman, R.S., & Covi, L. (1973). SCL-90: An outpatient psychiatric rating scale-Preliminary Report. Psychopharmacol. Bull. 9, 13-28.

#Total score (General Severity Index), plus 9 subscales: 1. Somatization, 2. Obsessive-compulsive disorder, 3. Interpersonal sensitivity, 4. Depression, 5. Anxiety, 6. Hostility, 7. Phobic anxiety, 8. Paranoid ideation, 9. Psychoticism

#Raw qualtrics items anchored at 1-5.  Transformed to reflect published scale with items scored 0-4.

#Added dS and dI to match new scoring conventions- Megan F 2018_March

#Total score
dS$SCL90_Tot = varScore(dI, Forward= paste0('SCL90_', 1:90), Range = c(1,5) ) - 90

#Somatization ( N = 12)
dS$SCL90_Som = varScore(dI, Forward= c('SCL90_1', 'SCL90_4', 'SCL90_12', 'SCL90_27', 'SCL90_40', 'SCL90_42', 'SCL90_48', 'SCL90_49', 'SCL90_52', 'SCL90_53', 'SCL90_56', 'SCL90_58'), Range = c(1,5) ) - 12

#Obsessive-compulsive disorder (N = 10)
dS$SCL90_OC = varScore(dI, Forward= c('SCL90_3', 'SCL90_9', 'SCL90_10', 'SCL90_28', 'SCL90_38', 'SCL90_45', 'SCL90_46', 'SCL90_51', 'SCL90_55', 'SCL90_65'), Range = c(1,5) ) - 10

#Interpersonal sensitivity ( N = 9)
dS$SCL90_Sens = varScore(dI, Forward= c('SCL90_6', 'SCL90_21', 'SCL90_34', 'SCL90_36', 'SCL90_37', 'SCL90_41', 'SCL90_61', 'SCL90_69', 'SCL90_73'), Range = c(1,5) ) - 9

#Depression (N = 13)
dS$SCL90_Dep = varScore(dI, Forward= c('SCL90_5', 'SCL90_14', 'SCL90_15', 'SCL90_20', 'SCL90_22', 'SCL90_26', 'SCL90_29', 'SCL90_30', 'SCL90_31', 'SCL90_32', 'SCL90_54', 'SCL90_71', 'SCL90_79'), Range = c(1,5) ) - 13

#Anxiety (N = 10)
dS$SCL90_Anx = varScore(dI, Forward= c('SCL90_2', 'SCL90_17', 'SCL90_23', 'SCL90_33', 'SCL90_39', 'SCL90_57', 'SCL90_72', 'SCL90_78', 'SCL90_80', 'SCL90_86'), Range = c(1,5) ) - 10

#Anger-Hostility (N=6)
dS$SCL90_Ang = varScore(dI, Forward= c('SCL90_11', 'SCL90_24', 'SCL90_63', 'SCL90_67', 'SCL90_74', 'SCL90_81'), Range = c(1,5) ) - 6

#Phobic anxiety (N=7)
dS$SCL90_Pho = varScore(dI, Forward= c('SCL90_13', 'SCL90_25', 'SCL90_47', 'SCL90_50', 'SCL90_70', 'SCL90_75', 'SCL90_82'), Range = c(1,5) ) - 7

#Paranoid ideation (N =6)
dS$SCL90_Par = varScore(dI, Forward= c('SCL90_8', 'SCL90_18', 'SCL90_43', 'SCL90_68', 'SCL90_76', 'SCL90_83'), Range = c(1,5) ) - 6

#Psychoticism (N=10)
dS$SCL90_Psy = varScore(dI, Forward= c('SCL90_7', 'SCL90_16', 'SCL90_35', 'SCL90_62', 'SCL90_77', 'SCL90_84', 'SCL90_85', 'SCL90_87', 'SCL90_88', 'SCL90_90'), Range = c(1,5) ) - 10
