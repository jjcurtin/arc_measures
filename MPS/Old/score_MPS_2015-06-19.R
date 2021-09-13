score_MPS <- function(indata){
  # purpose: score MPQ-BF (155 item version of MPQ)
  # input: wide-formatted data frame (one row per person)
  # output: wide-formatted data frame with new columns for scale (e.g., NEM/PEM/CON) and sub-scale scores
  #         when MPS_Valid > 0, scale scores are likely invalid
  # author: mark j. starr (mark.starr@wisc.edu), 2015-06-19; 
  # ... based on the spss script (MPS.sps) written by john j. curtin (jjcurtin@wisc.edu), 2006-12-06.
  
require(lmSupport)

# Score Validity Scales --------------------------------------------

# True Response Inconsistency (TRIN)
indata = ddply(indata,.(SubID),mutate,
               MPS_TRIN1 = ifelse(is.na(MPS5)  | is.na(MPS136),   NA, ifelse(MPS5==1   &  MPS136==0,1,0)),
               MPS_TRIN2 = ifelse(is.na(MPS20) | is.na(MPS79),    NA, ifelse(MPS20==1  &  MPS79==0, 1,0)),
               MPS_TRIN3 = ifelse(is.na(MPS15) | is.na(MPS98),    NA, ifelse(MPS15==1  &  MPS98==0, 1,0)),
               MPS_TRIN4 = ifelse(is.na(MPS28) | is.na(MPS112),   NA, ifelse(MPS28==0  &  MPS112==1,1,0)),
               MPS_TRIN5 = ifelse(is.na(MPS52) | is.na(MPS64),    NA, ifelse(MPS52==1  &  MPS64==0, 1,0)),
               MPS_TRIN6 = ifelse(is.na(MPS70) | is.na(MPS118),   NA, ifelse(MPS70==1  &  MPS118==0,1,0)),
               MPS_TRIN7 = ifelse(is.na(MPS99) | is.na(MPS146),   NA, ifelse(MPS99==0  &  MPS146==1,1,0)),
               MPS_TRIN8 = ifelse(is.na(MPS110) | is.na(MPS145),  NA, ifelse(MPS110==1 &  MPS145==0,1,0)),
               MPS_TRIN_Pos = (sum(MPS_TRIN1,MPS_TRIN2,MPS_TRIN3,MPS_TRIN4,
                                  MPS_TRIN5,MPS_TRIN6,MPS_TRIN7,MPS_TRIN8,
                                  na.rm=TRUE) / sum(!is.na(c(MPS_TRIN1,MPS_TRIN2,MPS_TRIN3,MPS_TRIN4,
                                                             MPS_TRIN5,MPS_TRIN6,MPS_TRIN7,MPS_TRIN8)))) * 8,
               MPS_TRIN9 = ifelse(is.na(MPS51) | is.na(MPS63),    NA, ifelse(MPS51==0   & MPS63==1, 1,0)),
               MPS_TRIN10 = ifelse(is.na(MPS5) | is.na(MPS136),   NA, ifelse(MPS5==0    & MPS136==1,1,0)),               
               MPS_TRIN11 = ifelse(is.na(MPS132) | is.na(MPS60),  NA, ifelse(MPS132==0  & MPS60==1, 1,0)),               
               MPS_TRIN12 = ifelse(is.na(MPS20) | is.na(MPS79),   NA, ifelse(MPS20==0   & MPS79==1, 1,0)),               
               MPS_TRIN13 = ifelse(is.na(MPS15) | is.na(MPS98),   NA, ifelse(MPS15==0   & MPS98==1, 1,0)),               
               MPS_TRIN14 = ifelse(is.na(MPS86) | is.na(MPS9),    NA, ifelse(MPS86==1   & MPS9==0,  1,0)),               
               MPS_TRIN15 = ifelse(is.na(MPS30) | is.na(MPS73),   NA, ifelse(MPS30==0   & MPS73==1, 1,0)),              
               MPS_TRIN16 = ifelse(is.na(MPS40) | is.na(MPS148),  NA, ifelse(MPS40== 0  & MPS148==1,1,0)),
               MPS_TRIN17 = ifelse(is.na(MPS31) | is.na(MPS104),  NA, ifelse(MPS31== 0  & MPS104==1,1,0)),
               MPS_TRIN18 = ifelse(is.na(MPS69) | is.na(MPS46),   NA, ifelse(MPS69== 0  & MPS46==1, 1,0)),
               MPS_TRIN19 = ifelse(is.na(MPS80) | is.na(MPS140),  NA, ifelse(MPS80== 1  & MPS140==0,1,0)),
               MPS_TRIN20 = ifelse(is.na(MPS110) | is.na(MPS145), NA, ifelse(MPS110==0  & MPS145==1,1,0)),               
               MPS_TRIN_Neg = (sum(MPS_TRIN9,MPS_TRIN10,MPS_TRIN11,MPS_TRIN12,
                                   MPS_TRIN13,MPS_TRIN14,MPS_TRIN15,MPS_TRIN16,
                                   MPS_TRIN17,MPS_TRIN18,MPS_TRIN19,MPS_TRIN20,
                                   na.rm=TRUE) / sum(!is.na(c(MPS_TRIN9,MPS_TRIN10,MPS_TRIN11,MPS_TRIN12,
                                                              MPS_TRIN13,MPS_TRIN14,MPS_TRIN15,MPS_TRIN16,
                                                              MPS_TRIN17,MPS_TRIN18,MPS_TRIN19,MPS_TRIN20)))) * 12,
               MPS_TRIN = sum(MPS_TRIN_Pos,MPS_TRIN_Neg,na.rm=TRUE)
               )

# discard TRIN items
indata$MPS_TRIN1=NULL; indata$MPS_TRIN2=NULL; indata$MPS_TRIN3=NULL; indata$MPS_TRIN4=NULL; indata$MPS_TRIN5=NULL;
indata$MPS_TRIN6=NULL; indata$MPS_TRIN7=NULL; indata$MPS_TRIN8=NULL; indata$MPS_TRIN9=NULL; indata$MPS_TRIN10=NULL
indata$MPS_TRIN11=NULL; indata$MPS_TRIN12=NULL; indata$MPS_TRIN13=NULL; indata$MPS_TRIN14=NULL; indata$MPS_TRIN15=NULL
indata$MPS_TRIN16=NULL; indata$MPS_TRIN17=NULL; indata$MPS_TRIN18=NULL; indata$MPS_TRIN19=NULL; indata$MPS_TRIN20=NULL
indata$MPS_TRIN_Neg=NULL; indata$MPS_TRIN_Pos=NULL

# Variable Response Inconsistency (VRIN)
# note, still need to update handling of missing data for VRIN rules
indata = ddply(indata,.(SubID),mutate,
               MPS_VRIN1 = ifelse(is.na(MPS51)  | is.na(MPS45),   NA, ifelse(MPS51 != MPS45, 1,0)),
               MPS_VRIN2 = ifelse(is.na(MPS5) | is.na(MPS112),    NA, ifelse(MPS5  != MPS112,1,0)),
               MPS_VRIN3 = ifelse(is.na(MPS20) | is.na(MPS139),   NA, ifelse(MPS20 != MPS139,1,0)),
               MPS_VRIN4 = ifelse(is.na(MPS44) | is.na(MPS140),   NA, ifelse(MPS44 != MPS140,1,0)),                        
               MPS_VRIN5 = ifelse(is.na(MPS29) | is.na(MPS10),    NA, ifelse(MPS29 !=MPS10, 1,0)),               
               MPS_VRIN6 = ifelse(is.na(MPS2) | is.na(MPS110),    NA, ifelse(MPS2  !=MPS110,1,0)),                              
               MPS_VRIN7 = ifelse(is.na(MPS88) | is.na(MPS135),   NA, ifelse(MPS88 !=MPS135,1,0)),                              
               MPS_VRIN8 = ifelse(is.na(MPS132) | is.na(MPS53),   NA, ifelse(MPS132==0  & MPS53==1, 1,0)),
               MPS_VRIN9 = ifelse(is.na(MPS15) | is.na(MPS117),   NA, ifelse(MPS15==0   & MPS117==1,1,0)),             
               MPS_VRIN10 = ifelse(is.na(MPS38) | is.na(MPS109),  NA, ifelse(MPS38==0   & MPS109==1,1,0)),                              
               MPS_VRIN11 = ifelse(is.na(MPS30) | is.na(MPS91),   NA, ifelse(MPS30==0   & MPS91==1, 1,0)),                     
               MPS_VRIN12 = ifelse(is.na(MPS33) | is.na(MPS152),  NA, ifelse(MPS33==0   & MPS152==1,1,0)),                 
               MPS_VRIN13 = ifelse(is.na(MPS52) | is.na(MPS111),  NA, ifelse(MPS52==0   & MPS111==1,1,0)),               
               MPS_VRIN14 = ifelse(is.na(MPS65) | is.na(MPS148),  NA, ifelse(MPS65==0   & MPS148==1,1,0)),                              
               MPS_VRIN15 = ifelse(is.na(MPS71) | is.na(MPS130),  NA, ifelse(MPS71==0   & MPS130==1,1,0)),                
               MPS_VRIN16 = ifelse(is.na(MPS109) | is.na(MPS144), NA, ifelse(MPS109==0  & MPS144==1,1,0)),                                 
               MPS_VRIN17 = ifelse(is.na(MPS82) | is.na(MPS142),  NA, ifelse(MPS82==1   & MPS142==0,1,0)),                              
               MPS_VRIN18 = ifelse(is.na(MPS6) | is.na(MPS90),    NA, ifelse(MPS6==1    & MPS90==0, 1,0)),                              
               MPS_VRIN19 = ifelse(is.na(MPS76) | is.na(MPS146),  NA, ifelse(MPS76==1   & MPS146==0,1,0)),                              
               MPS_VRIN20 = ifelse(is.na(MPS50) | is.na(MPS62),   NA, ifelse(MPS50==1   & MPS62==0, 1,0)),                 
               MPS_VRIN21 = ifelse(is.na(MPS28) | is.na(MPS136),  NA, ifelse(MPS28==1   & MPS136==0,1,0)),                                                           
               MPS_VRIN = (sum(MPS_VRIN1,MPS_VRIN2,MPS_VRIN3,MPS_VRIN4,MPS_VRIN5,MPS_VRIN6,MPS_VRIN7,MPS_VRIN8,
                               MPS_VRIN9,MPS_VRIN10,MPS_VRIN11,MPS_VRIN12,MPS_VRIN13,MPS_VRIN14,MPS_VRIN15,
                               MPS_VRIN16,MPS_VRIN17,MPS_VRIN18,MPS_VRIN19,MPS_VRIN20,MPS_VRIN21,
                                   na.rm=TRUE) / sum(!is.na(c(MPS_VRIN1,MPS_VRIN2,MPS_VRIN3,MPS_VRIN4,
                                                              MPS_VRIN5,MPS_VRIN6,MPS_VRIN7,MPS_VRIN8,
                                                              MPS_VRIN9,MPS_VRIN10,MPS_VRIN11,MPS_VRIN12,
                                                              MPS_VRIN13,MPS_VRIN14,MPS_VRIN15,MPS_VRIN16,
                                                              MPS_VRIN17,MPS_VRIN18,MPS_VRIN19,MPS_VRIN20,
                                                              MPS_VRIN21)))) * 21
)

MPS_TRIN.mean = mean(indata$MPS_TRIN,na.rm=TRUE)
MPS_TRIN.sd = sd(indata$MPS_TRIN,na.rm=TRUE)
MPS_VRIN.mean = mean(indata$MPS_VRIN,na.rm=TRUE)
MPS_VRIN.sd = sd(indata$MPS_VRIN,na.rm=TRUE)
indata = ddply(indata,.(SubID),mutate,
               MPS_Valid = sum(ifelse(MPS_VRIN >= (MPS_VRIN.mean+3*MPS_VRIN.sd),1,0), #criteria a
                               ifelse(MPS_TRIN >= (MPS_TRIN.mean+3.21*MPS_TRIN.sd) | MPS_TRIN <= (MPS_TRIN.mean-3.21*MPS_TRIN.sd),10,0), #criteria b
                               ifelse(MPS_VRIN >= (MPS_VRIN.mean+2*MPS_VRIN.sd) & (MPS_TRIN <= (MPS_TRIN.mean+2.28*MPS_TRIN.sd) | MPS_TRIN >= (MPS_TRIN.mean-2.28*MPS_TRIN.sd)),100,0)) #criteria c
               ) 

# when MPS Valid > 0, survey results may be invalid

# discard VRIN items
indata$MPS_VRIN1=NULL;  indata$MPS_VRIN2=NULL;  indata$MPS_VRIN3=NULL;  indata$MPS_VRIN4=NULL;  indata$MPS_VRIN5=NULL;
indata$MPS_VRIN6=NULL;  indata$MPS_VRIN7=NULL;  indata$MPS_VRIN8=NULL;  indata$MPS_VRIN9=NULL;  indata$MPS_VRIN10=NULL
indata$MPS_VRIN11=NULL; indata$MPS_VRIN12=NULL; indata$MPS_VRIN13=NULL; indata$MPS_VRIN14=NULL; indata$MPS_VRIN15=NULL
indata$MPS_VRIN16=NULL; indata$MPS_VRIN17=NULL; indata$MPS_VRIN18=NULL; indata$MPS_VRIN19=NULL; indata$MPS_VRIN20=NULL;
indata$MPS_VRIN21=NULL; 

# For both the MPQ and the MPQ–BF, protocols were deemed invalid if any of the following three criteria were met: 
# (a) Overall response pattern is excessively inconsistent with respect to item pair content (i.e., score on VRIN is 3 standard deviations above the mean VRIN score); 
# (b) response pattern is excessively polarized toward responding either true or false irrespective of item content (i.e., score on TRIN is greater than 􏰄3.21 standard deviations from the mean TRIN score); or
# (c) response pattern is both inconsistent and polarized in direction (i.e., score is 2 standard deviations above the mean for VRIN and 􏰄2.28 standard deviations from the mean for TRIN).
# The above criteria were translated into discrete numeric cutoffs for both the MPQ and the MPQ–BF, using distributions of scores within the overall normative sample (n 􏰀 1,350). The normative sample was used because this is the referent sample for the MPQ (Tellegen, in press).


# Score MPS Primary Trait Scales ------------------------------------------

# Well-being
MPS_WB = varScore(indata, 
                  Forward = c('MPS1',  'MPS26', 'MPS38',  'MPS50', 'MPS62', 
                              'MPS74', 'MPS85', 'MPS97',  'MPS109','MPS121',
                              'MPS133','MPS144'), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# Social Potency
MPS_SP = varScore(indata, 
                  Forward = c('MPS2',  'MPS15', 'MPS39',  'MPS51', 'MPS75', 
                              'MPS87', 'MPS110'), 
                  Reverse = c('MPS63', 'MPS98', 'MPS122', 'MPS134','MPS145'), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# Achievement
MPS_AC = varScore(indata, 
                  Forward = c('MPS3',  'MPS16',  'MPS27', 'MPS52', 'MPS76', 
                              'MPS88', 'MPS111', 'MPS123','MPS135','MPS146'), 
                  Reverse = c('MPS64', 'MPS99'),                   
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# Social Closeness
MPS_SC = varScore(indata, 
                  Forward = c('MPS5',  'MPS17',  'MPS40', 'MPS77', 'MPS112'), 
                  Reverse = c('MPS28', 'MPS65',  'MPS89', 'MPS100','MPS124',
                              'MPS136','MPS148' ), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# Stress Reaction
MPS_SR = varScore(indata, 
                  Forward = c('MPS6',  'MPS18',  'MPS29',  'MPS41', 'MPS53', 
                              'MPS78', 'MPS90',  'MPS101', 'MPS113','MPS125',
                              'MPS137','MPS149'), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# Alienation
MPS_AL = varScore(indata, 
                  Forward = c('MPS7',  'MPS19',  'MPS30', 'MPS42',  'MPS54',
                              'MPS66', 'MPS91',  'MPS102','MPS114', 'MPS126',
                              'MPS138','MPS150'), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# Aggression
MPS_AG = varScore(indata, 
                  Forward = c('MPS8',  'MPS20',  'MPS31', 'MPS43', 'MPS55',  
                              'MPS67', 'MPS103', 'MPS115','MPS127','MPS139',
                              'MPS151'), 
                  Reverse = c('MPS79'), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# Control
MPS_CT = varScore(indata, 
                  Forward = c('MPS9',  'MPS44',  'MPS56', 'MPS68', 'MPS92', 
                              'MPS116','MPS128', 'MPS140'), 
                  Reverse = c('MPS21', 'MPS33',  'MPS80', 'MPS152' ), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# Harm Avoidance
MPS_HA = varScore(indata, 
                  Forward = c('MPS34', 'MPS69',  'MPS81', 'MPS93', 'MPS105', 
                              'MPS129'), 
                  Reverse = c('MPS11', 'MPS22',  'MPS46', 'MPS57', 'MPS141', 
                              'MPS153'), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# Traditionalism
MPS_TD = varScore(indata, 
                  Forward = c('MPS12', 'MPS23',  'MPS35', 'MPS58', 'MPS70',  
                              'MPS82', 'MPS94',  'MPS106','MPS142','MPS154'), 
                  Reverse = c('MPS47', 'MPS118'), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# Absorption
MPS_AB = varScore(indata, 
                  Forward = c('MPS13', 'MPS24',  'MPS36', 'MPS48', 'MPS59',  
                              'MPS71', 'MPS83',  'MPS95', 'MPS107','MPS119', 
                              'MPS130','MPS155'),                 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# Unlikely Virtues
MPS_UV = varScore(indata, 
                  Forward = c('MPS25', 'MPS49',  'MPS72', 'MPS96', 'MPS120',
                              'MPS143','MPS147'), 
                  Reverse= c( 'MPS4',  'MPS14',  'MPS37', 'MPS61', 'MPS84',  
                              'MPS108','MPS131'), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# Score MPS Broad Trait Scales --------------------------------------------

# Positive Emotionality
MPS_PEM = round((MPS_WB * 1.933) + (MPS_SP * 1.669) + (MPS_AC * 1.671) + 
                (MPS_SC * 1.950) + (MPS_SR * 0.085) + (MPS_AL * 0.292) + 
                (MPS_AG * 0.130) + (MPS_CT * 0.048) + (MPS_HA * 0.015) + 
                (MPS_TD * 0.070) + 13.712
                )

# Negative Emotionality
MPS_NEM = round((MPS_WB * 0.127) + (MPS_SP * 0.150) + (MPS_AC * 0.038) + 
                (MPS_SC * 0.279) + (MPS_SR * 1.904) + (MPS_AL * 3.061) + 
                (MPS_AG * 2.551) + (MPS_CT * 0.045) + (MPS_HA * 0.126) + 
                (MPS_TD * 0.147) + 6.270
                )

# Constraint
MPS_CON = round((MPS_WB * -0.085) + (MPS_SP * -0.052) + (MPS_AC * 0.241) + 
                (MPS_SC * -0.068) + (MPS_SR * 0.046) + (MPS_AL * -0.302) + 
                (MPS_AG* 0.296) + (MPS_CT * 2.717) + (MPS_HA * 2.579) + 
                (MPS_TD * 2.199) + 20.742
                )


outdata=cbind(indata,MPS_PEM,MPS_NEM,MPS_CON,MPS_WB,MPS_SP,MPS_AC,MPS_SC,MPS_SR,MPS_AL,MPS_AG,MPS_HA,MPS_TD,MPS_CT,MPS_AB,MPS_UV)

return(outdata)
}





