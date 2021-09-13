#Multidimensional Personality Questionnaire Brief Form (MPS) - Susan Schneck 2017_May
#Edited by Sarah Sant'Ana in 2018_Feb to include dS and dI
#Verified by Megan Fleming 2018_Mar
#155 item version of MPQ
#Patrick, C. J., Curtin, J. J., & Tellegen, A. (2002). Development and validation of a brief form of the Multidimensional Personality Questionnaire (MPQ). Psychological Assessment, 14, 150-163.
#Based on a scoring function by mark j. starr (mark.starr@wisc.edu), 2015-06-24; 
#which was based on the Brief MPQ Scoring Program, written by john j. curtin (jjcurtin@wisc.edu)

#IMPORTANT:  This scoring script assumes FALSE=1, TRUE=2. It also assumes that the non=true/false items are
#coded 1, 2 in order of presentation.   This later format for non-true/false is backwards from how Tellegen
#scored the items. Therefore, all of these items (17, 34, 57, 69, 70, 81, 93, 105, 129, 141) are scored in the opposite direction (forward/reverse) from
#Tellegen and also our previous scoring scripts which followed Tellegen's item scoring.

# Score MPS Primary Trait Scales ------------------------------------------

# Well-being
dS$MPS_WB = varScore(dI, Forward = c('MPS_1', 'MPS_26', 'MPS_38', 'MPS_50', 'MPS_62',  'MPS_74', 'MPS_85', 'MPS_97', 'MPS_109','MPS_121', 'MPS_133','MPS_144'), Range = c(1,2) ) - 12

# Social Potency
dS$MPS_SP = varScore(dI, Forward = c('MPS_2', 'MPS_15', 'MPS_39', 'MPS_51', 'MPS_75',  'MPS_87', 'MPS_110'), Reverse = c('MPS_63', 'MPS_98', 'MPS_122', 'MPS_134','MPS_145'), Range = c(1,2) ) - 12

# Achievement
dS$MPS_AC = varScore(dI, Forward = c('MPS_3', 'MPS_16', 'MPS_27', 'MPS_52', 'MPS_76',  'MPS_88', 'MPS_111', 'MPS_123','MPS_135','MPS_146'), Reverse = c('MPS_64', 'MPS_99'), Range = c(1,2) ) - 12

# Social Closeness
dS$MPS_SC = varScore(dI, Forward = c('MPS_5', 'MPS_40', 'MPS_77', 'MPS_112'), Reverse = c('MPS_17', 'MPS_28', 'MPS_65', 'MPS_89', 'MPS_100','MPS_124', 'MPS_136','MPS_148' ), Range = c(1,2) ) - 12

# Stress Reaction
dS$MPS_SR = varScore(dI, Forward = c('MPS_6', 'MPS_18', 'MPS_29', 'MPS_41', 'MPS_53',  'MPS_78', 'MPS_90', 'MPS_101', 'MPS_113','MPS_125', 'MPS_137','MPS_149'), Range = c(1,2) ) - 12

# Alienation
dS$MPS_AL = varScore(dI, Forward = c('MPS_7', 'MPS_19', 'MPS_30', 'MPS_42', 'MPS_54', 'MPS_66', 'MPS_91', 'MPS_102','MPS_114', 'MPS_126', 'MPS_138','MPS_150'), Range = c(1,2) ) - 12

# Aggression
dS$MPS_AG = varScore(dI, Forward = c('MPS_8', 'MPS_20', 'MPS_31', 'MPS_43', 'MPS_55',  'MPS_67', 'MPS_103', 'MPS_115','MPS_127','MPS_139', 'MPS_151'), Reverse = c('MPS_79'), Range = c(1,2) ) - 12

# Control
dS$MPS_CT = varScore(dI, Forward = c('MPS_9', 'MPS_44', 'MPS_56', 'MPS_68', 'MPS_92',  'MPS_116','MPS_128', 'MPS_140'), Reverse = c('MPS_21', 'MPS_33', 'MPS_80', 'MPS_152' ), Range = c(1,2) ) - 12

# Harm Avoidance
dS$MPS_HA = varScore(dI, Forward = c('MPS_57', 'MPS_141'), Reverse = c('MPS_11', 'MPS_22', 'MPS_34', 'MPS_46', 'MPS_69', 'MPS_81', 'MPS_93', 'MPS_105', 'MPS_129',  'MPS_153'), Range = c(1,2) ) - 12

# Traditionalism
dS$MPS_TD = varScore(dI, Forward = c('MPS_12', 'MPS_23', 'MPS_35', 'MPS_58', 'MPS_82', 'MPS_94', 'MPS_106','MPS_142','MPS_154'), Reverse = c('MPS_47', 'MPS_70', 'MPS_118'), Range = c(1,2) ) - 12

# Absorption
dS$MPS_AB = varScore(dI, Forward = c('MPS_13', 'MPS_24', 'MPS_36', 'MPS_48', 'MPS_59',  'MPS_71', 'MPS_83', 'MPS_95', 'MPS_107','MPS_119',  'MPS_130','MPS_155'), Range = c(1,2) ) - 12

# Unlikely Virtues
dS$MPS_UV = varScore(dI, Forward = c('MPS_25', 'MPS_49', 'MPS_72', 'MPS_96', 'MPS_120', 'MPS_143', 'MPS_147'), Reverse= c( 'MPS_4', 'MPS_14', 'MPS_37', 'MPS_61', 'MPS_84',  'MPS_108','MPS_131'), Range = c(1,2) ) - 12

# Score MPS Broad Trait Scales --------------------------------------------

# Agentic Positive Emotionality
dS$MPS_PAG = round((dS$MPS_WB * 1.529) + (dS$MPS_SP * 1.294) + (dS$MPS_AC * 3.211) + (dS$MPS_SC * -0.317) + (dS$MPS_SR * -0.112) + (dS$MPS_AL * -0.085) + (dS$MPS_AG * 0.063) + (dS$MPS_CT * 0.154) + (dS$MPS_HA * -0.186) + (dS$MPS_TD * 0.02) + 18.448)

# Communal Positive Emotionality
dS$MPS_PCO = round((dS$MPS_WB * 1.582) + (dS$MPS_SP * 1.387) + (dS$MPS_AC * -0.51) + (dS$MPS_SC * 3.411) + (dS$MPS_SR * 0.048) + (dS$MPS_AL * 0.017) + (dS$MPS_AG * 0.059) + (dS$MPS_CT * -0.068) + (dS$MPS_HA * 0.205) + (dS$MPS_TD * 0.097) + 16.804)

# Agentic Negative Emotionality
dS$MPS_NAG = round((dS$MPS_WB * 0.042) + (dS$MPS_SP * 0.111) + (dS$MPS_AC * -0.036) + (dS$MPS_SC * -0.07) + (dS$MPS_SR * 1.721) + (dS$MPS_AL * -0.885) + (dS$MPS_AG * 5.26) + (dS$MPS_CT * 0.106) + (dS$MPS_HA * 0.13) + (dS$MPS_TD * 0.057) + 22.739)

# Alienated Negative Emotionality
dS$MPS_NAL = round((dS$MPS_WB * -0.043) + (dS$MPS_SP * -0.072) + (dS$MPS_AC * 0.059) + (dS$MPS_SC * 0.206) + (dS$MPS_SR * 1.389) + (dS$MPS_AL * 5.398) + (dS$MPS_AG * -0.695) + (dS$MPS_CT * -0.114) + (dS$MPS_HA * -0.025) + (dS$MPS_TD * 0.089) + 20.341)

# Positive Emotionality
dS$MPS_PEM = round((dS$MPS_WB * 1.933) + (dS$MPS_SP * 1.669) + (dS$MPS_AC * 1.671) + (dS$MPS_SC * 1.950) + (dS$MPS_SR * 0.085) + (dS$MPS_AL * 0.292) + (dS$MPS_AG * 0.130) + (dS$MPS_CT * 0.048) + (dS$MPS_HA * 0.015) + (dS$MPS_TD * 0.070) + 13.712 )

# Negative Emotionality
dS$MPS_NEM = round((dS$MPS_WB * 0.127) + (dS$MPS_SP * 0.150) + (dS$MPS_AC * 0.038) + (dS$MPS_SC * 0.279) + (dS$MPS_SR * 1.904) + (dS$MPS_AL * 3.061) + (dS$MPS_AG * 2.551) + (dS$MPS_CT * 0.045) + (dS$MPS_HA * 0.126) + (dS$MPS_TD * 0.147) + 6.270 )

# Constraint
dS$MPS_CON = round((dS$MPS_WB * -0.085) + (dS$MPS_SP * -0.052) + (dS$MPS_AC * 0.241) + (dS$MPS_SC * -0.068) + (dS$MPS_SR * 0.046) + (dS$MPS_AL * -0.302) + (dS$MPS_AG* 0.296) + (dS$MPS_CT * 2.717) + (dS$MPS_HA * 2.579) + (dS$MPS_TD * 2.199) + 20.742 )

