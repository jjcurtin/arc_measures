score_MPS <- function(indata,MaxMiss = .25){
  # purpose: score MPQ-BF (155 item version of MPQ)
  # input: wide-formatted data frame (one row per person, one column per question)
  # output: wide-formatted data frame with new columns for scale (e.g., NEM/PEM/CON) and sub-scale scores
  #         when MPS_Valid > 0, scale scores are likely invalid
  # author: mark j. starr (mark.starr@wisc.edu), 2015-06-24; 
  # ... based on the Brief MPQ Scoring Program, written by john j. curtin (jjcurtin@wisc.edu).
  
require(lmSupport)
require(plyr)
require(dplyr)

indata=select(indata,SubID,starts_with('MPS'))

# Score Validity Scales --------------------------------------------

# True Response Inconsistency (TRIN)
#
# Scoring system for TRIN: 
# 1) if both items in each true pair are not missing and both are true, give a point
# 2) if both items in each false pair are not missing and both are false, subtract a point
# 
# rules for determining whether a pair is missing: 
# 1) "true" pair is missing if a) both items are missing, or b) one item missing, other item is true.  
# ... If one missing and other is false then it is not considered missing b/c we know that it couldnt have been a true/true pair
# 2) "false" pair is missing if a) both items are missing, or
# ....b) one item missing, other item false. If one missing and other is true then it is not considered missing b/c we know that it couldnt have been a false/false pair

indata = ddply(indata,.(SubID),mutate,
               TRINTrue = 0,
               TRINTrue = ifelse(!is.na(MPS28) & !is.na(MPS112) & (MPS28 == 1 & MPS112 == 1), TRINTrue + 1, TRINTrue),
               TRINTrue = ifelse(!is.na(MPS52) & !is.na(MPS64) & (MPS52 == 1 & MPS64 == 1), TRINTrue + 1, TRINTrue),
               TRINTrue = ifelse(!is.na(MPS70) & !is.na(MPS118) & (MPS70 == 1 & MPS118 == 1), TRINTrue + 1, TRINTrue),
               TRINTrue = ifelse(!is.na(MPS99) & !is.na(MPS146) & (MPS99 == 1 & MPS146 == 1), TRINTrue + 1, TRINTrue),
               TRINTrue = ifelse(!is.na(MPS5) & !is.na(MPS136) & (MPS5 == 1 & MPS136 == 1), TRINTrue + 1, TRINTrue),
               TRINTrue = ifelse(!is.na(MPS20) & !is.na(MPS79) & (MPS20 == 1 & MPS79 == 1), TRINTrue + 1, TRINTrue),
               TRINTrue = ifelse(!is.na(MPS15) & !is.na(MPS98) & (MPS15 == 1 & MPS98 == 1), TRINTrue + 1, TRINTrue),
               TRINTrue = ifelse(!is.na(MPS110) & !is.na(MPS145) & (MPS110 == 1 & MPS145 == 1), TRINTrue + 1, TRINTrue),
               TRINTrueMiss = 0,               
               TRINTrueMiss = ifelse(((is.na(MPS28) & is.na(MPS112)) | (is.na(MPS28) & MPS112 == 1) | (is.na(MPS112) & MPS28 == 1)), TRINTrueMiss + 1,TRINTrueMiss),
               TRINTrueMiss = ifelse(((is.na(MPS52) & is.na(MPS64)) | (is.na(MPS52) & MPS64 == 1) | (is.na(MPS64) & MPS52 == 1)), TRINTrueMiss + 1,TRINTrueMiss),
               TRINTrueMiss = ifelse(((is.na(MPS70) & is.na(MPS118)) | (is.na(MPS70) & MPS118 == 1) | (is.na(MPS118) & MPS70 == 1)), TRINTrueMiss + 1,TRINTrueMiss),
               TRINTrueMiss = ifelse(((is.na(MPS99) & is.na(MPS146)) | (is.na(MPS99) & MPS146 == 1) | (is.na(MPS146) & MPS99 == 1)), TRINTrueMiss + 1,TRINTrueMiss),
               TRINTrueMiss = ifelse(((is.na(MPS5) & is.na(MPS136)) | (is.na(MPS5) & MPS136 == 1) | (is.na(MPS136) & MPS5 == 1)), TRINTrueMiss + 1,TRINTrueMiss),
               TRINTrueMiss = ifelse(((is.na(MPS20) & is.na(MPS79)) | (is.na(MPS20) & MPS79 == 1) | (is.na(MPS79) & MPS20 == 1)), TRINTrueMiss + 1,TRINTrueMiss),
               TRINTrueMiss = ifelse(((is.na(MPS15) & is.na(MPS98)) | (is.na(MPS15) & MPS98 == 1) | (is.na(MPS98) & MPS15 == 1)), TRINTrueMiss + 1,TRINTrueMiss),
               TRINTrueMiss = ifelse(((is.na(MPS110) & is.na(MPS145)) | (is.na(MPS110) & MPS145 == 1) | (is.na(MPS145) & MPS110 == 1)), TRINTrueMiss + 1,TRINTrueMiss),
               TRINTrue = TRINTrue * (8 / (8 - TRINTrueMiss)), # prorate true pair score
               TRINFalse = 0, # Scoring false pairs
               TRINFalse = ifelse((!is.na(MPS51) & !is.na(MPS63) & (MPS51 == 0) & (MPS63 == 0)), TRINFalse + 1, TRINFalse),
               TRINFalse = ifelse((!is.na(MPS40) & !is.na(MPS148) & (MPS40 == 0) & (MPS148 == 0)), TRINFalse + 1, TRINFalse),
               TRINFalse = ifelse((!is.na(MPS69) & !is.na(MPS46) & (MPS69 == 0) & (MPS46 == 0)), TRINFalse + 1, TRINFalse),
               TRINFalse = ifelse((!is.na(MPS80) & !is.na(MPS140) & (MPS80 == 0) & (MPS140 == 0)), TRINFalse + 1, TRINFalse),
               TRINFalse = ifelse((!is.na(MPS5) & !is.na(MPS136) & (MPS5 == 0) & (MPS136 == 0)), TRINFalse + 1, TRINFalse),
               TRINFalse = ifelse((!is.na(MPS20) & !is.na(MPS79) & (MPS20 == 0) & (MPS79 == 0)), TRINFalse + 1, TRINFalse),
               TRINFalse = ifelse((!is.na(MPS15) & !is.na(MPS98) & (MPS15 == 0) & (MPS98 == 0)), TRINFalse + 1, TRINFalse),
               TRINFalse = ifelse((!is.na(MPS110) & !is.na(MPS145) & (MPS110 == 0) & (MPS145 == 0)), TRINFalse + 1, TRINFalse),
               TRINFalse = ifelse((!is.na(MPS132) & !is.na(MPS60) & (MPS132 == 0) & (MPS60 == 0)), TRINFalse + 1, TRINFalse),
               TRINFalse = ifelse((!is.na(MPS86) & !is.na(MPS9) & (MPS86 == 0) & (MPS9 == 0)), TRINFalse + 1, TRINFalse),
               TRINFalse = ifelse((!is.na(MPS30) & !is.na(MPS73) & (MPS30 == 0) & (MPS73 == 0)), TRINFalse + 1, TRINFalse),
               TRINFalse = ifelse((!is.na(MPS32) & !is.na(MPS104) & (MPS32 == 0) & (MPS104 == 0)), TRINFalse + 1, TRINFalse),
               TRINFalseMiss = 0,
               TRINFalseMiss = ifelse(((is.na(MPS51) & is.na(MPS63)) | (is.na(MPS51) & MPS63 == 0) | (is.na(MPS63) & MPS51 == 0)), TRINFalseMiss + 1, TRINFalseMiss),
               TRINFalseMiss = ifelse(((is.na(MPS40) & is.na(MPS148)) | (is.na(MPS40) & MPS148 == 0) | (is.na(MPS148) & MPS40 == 0)), TRINFalseMiss + 1, TRINFalseMiss),
               TRINFalseMiss = ifelse(((is.na(MPS69) & is.na(MPS46)) | (is.na(MPS69) & MPS46 == 0) | (is.na(MPS46) & MPS69 == 0)), TRINFalseMiss + 1, TRINFalseMiss),
               TRINFalseMiss = ifelse(((is.na(MPS80) & is.na(MPS140)) | (is.na(MPS80) & MPS140 == 0) | (is.na(MPS140) & MPS80 == 0)), TRINFalseMiss + 1, TRINFalseMiss),
               TRINFalseMiss = ifelse(((is.na(MPS5) & is.na(MPS136)) | (is.na(MPS5) & MPS136 == 0) | (is.na(MPS136) & MPS5 == 0)), TRINFalseMiss + 1, TRINFalseMiss),
               TRINFalseMiss = ifelse(((is.na(MPS20) & is.na(MPS79)) | (is.na(MPS20) & MPS79 == 0) | (is.na(MPS79) & MPS20 == 0)), TRINFalseMiss + 1, TRINFalseMiss),
               TRINFalseMiss = ifelse(((is.na(MPS15) & is.na(MPS98)) | (is.na(MPS15) & MPS98 == 0) | (is.na(MPS98) & MPS15 == 0)), TRINFalseMiss + 1, TRINFalseMiss),
               TRINFalseMiss = ifelse(((is.na(MPS110) & is.na(MPS145)) | (is.na(MPS110) & MPS145 == 0) | (is.na(MPS145) & MPS110 == 0)), TRINFalseMiss + 1, TRINFalseMiss),
               TRINFalseMiss = ifelse(((is.na(MPS132) & is.na(MPS60)) | (is.na(MPS132) & MPS60 == 0) | (is.na(MPS60) & MPS132 == 0)), TRINFalseMiss + 1, TRINFalseMiss),
               TRINFalseMiss = ifelse(((is.na(MPS86) & is.na(MPS9)) | (is.na(MPS86) & MPS9 == 0) | (is.na(MPS9) & MPS86 == 0)), TRINFalseMiss + 1, TRINFalseMiss),
               TRINFalseMiss = ifelse(((is.na(MPS30) & is.na(MPS73)) | (is.na(MPS30) & MPS73 == 0) | (is.na(MPS73) & MPS30 == 0)), TRINFalseMiss + 1, TRINFalseMiss),
               TRINFalseMiss = ifelse(((is.na(MPS32) & is.na(MPS104)) | (is.na(MPS32) & MPS104 == 0) | (is.na(MPS104) & MPS32 == 0)), TRINFalseMiss + 1, TRINFalseMiss),
               TRINFalse = TRINFalse * (12 / (12 - TRINFalseMiss)), # prorate false pair score for missing pairs
               MPS_TRIN = ifelse( (TRINTrueMiss / 8) <= (1-MaxMiss) & (TRINFalseMiss / 12) <= (1-MaxMiss), # make sure not too many missing pairs
                              round(TRINTrue - TRINFalse + 12), NA)) # TRINTrue are cancelled by TRINFalse, +12 to make min score of 0

# Variable Response Inconsistency (VRIN)
# rules for flagging mising pairs:
# 1) for not equal item pairs, pair is missing if either item is missing.  
# 2) for specific value pairs, pair is missing if both missing, or if single missing
# ... item is equal to target value.  (i.e., for 6, 90 pair, if 6 missing and 90 =0, then missing.  However,
# ... if 6 is missing and 90 = 1, pair is not missing b/c couldnt get a point.)

indata = ddply(indata,.(SubID),mutate,
               MPS_VRIN = 0,
               MPS_VRIN = ifelse(!is.na(MPS5)   & !is.na(MPS112) & (MPS5  != MPS112), MPS_VRIN + 1, MPS_VRIN),               
               MPS_VRIN = ifelse(!is.na(MPS20)  & !is.na(MPS139) & (MPS20 != MPS139), MPS_VRIN + 1, MPS_VRIN),
               MPS_VRIN = ifelse(!is.na(MPS44)  & !is.na(MPS140) & (MPS44 != MPS140), MPS_VRIN + 1, MPS_VRIN),               
               MPS_VRIN = ifelse(!is.na(MPS2)   & !is.na(MPS110) & (MPS2  != MPS110), MPS_VRIN + 1, MPS_VRIN),                                       
               MPS_VRIN = ifelse(!is.na(MPS88)  & !is.na(MPS135) & (MPS88 != MPS135), MPS_VRIN + 1, MPS_VRIN),                              
               MPS_VRIN = ifelse(!is.na(MPS51)  & !is.na(MPS45)  & (MPS51 != MPS45),  MPS_VRIN + 1, MPS_VRIN),                  
               MPS_VRIN = ifelse(!is.na(MPS29)  & !is.na(MPS10)  & (MPS29 != MPS10),  MPS_VRIN + 1, MPS_VRIN),               
               MPS_VRIN = ifelse(!is.na(MPS6)   & !is.na(MPS90)  & (MPS6==1   & MPS90==0),  MPS_VRIN + 1, MPS_VRIN),                                             
               MPS_VRIN = ifelse(!is.na(MPS76)  & !is.na(MPS146) & (MPS76==1  & MPS146==0), MPS_VRIN + 1, MPS_VRIN),
               MPS_VRIN = ifelse(!is.na(MPS38)  & !is.na(MPS109) & (MPS38==0  & MPS109==1), MPS_VRIN + 1, MPS_VRIN),                              
               MPS_VRIN = ifelse(!is.na(MPS30)  & !is.na(MPS91)  & (MPS30==0  & MPS91==1),  MPS_VRIN + 1, MPS_VRIN),      
               MPS_VRIN = ifelse(!is.na(MPS82)  & !is.na(MPS142) & (MPS82==1  & MPS142==0), MPS_VRIN + 1, MPS_VRIN),                                             
               MPS_VRIN = ifelse(!is.na(MPS33)  & !is.na(MPS152) & (MPS33==0  & MPS152==1), MPS_VRIN + 1, MPS_VRIN),                 
               MPS_VRIN = ifelse(!is.na(MPS50)  & !is.na(MPS62)  & (MPS50==1  & MPS62==0),  MPS_VRIN + 1, MPS_VRIN),                 
               MPS_VRIN = ifelse(!is.na(MPS28)  & !is.na(MPS136) & (MPS28==1  & MPS136==0), MPS_VRIN + 1, MPS_VRIN),                             
               MPS_VRIN = ifelse(!is.na(MPS52)  & !is.na(MPS111) & (MPS52==0  & MPS111==1), MPS_VRIN + 1, MPS_VRIN),               
               MPS_VRIN = ifelse(!is.na(MPS65)  & !is.na(MPS148) & (MPS65==0  & MPS148==1), MPS_VRIN + 1, MPS_VRIN),                                             
               MPS_VRIN = ifelse(!is.na(MPS71)  & !is.na(MPS130) & (MPS71==0  & MPS130==1), MPS_VRIN + 1, MPS_VRIN),                
               MPS_VRIN = ifelse(!is.na(MPS85)  & !is.na(MPS144) & (MPS85==0  & MPS144==1), MPS_VRIN + 1, MPS_VRIN),
               MPS_VRIN = ifelse(!is.na(MPS132) & !is.na(MPS53)  & (MPS132==0 & MPS53==1),  MPS_VRIN + 1, MPS_VRIN),
               MPS_VRIN = ifelse(!is.na(MPS15)  & !is.na(MPS117) & (MPS15==0  & MPS117==1), MPS_VRIN + 1, MPS_VRIN),
               MPS_VRINMiss = 0,
               MPS_VRINMiss = ifelse(is.na(MPS5)  | is.na(MPS112), MPS_VRINMiss + 1, MPS_VRINMiss), # type 1
               MPS_VRINMiss = ifelse(is.na(MPS20) | is.na(MPS139), MPS_VRINMiss + 1, MPS_VRINMiss),
               MPS_VRINMiss = ifelse(is.na(MPS44) | is.na(MPS140), MPS_VRINMiss + 1, MPS_VRINMiss),
               MPS_VRINMiss = ifelse(is.na(MPS2)  | is.na(MPS110), MPS_VRINMiss + 1, MPS_VRINMiss),
               MPS_VRINMiss = ifelse(is.na(MPS88) | is.na(MPS135), MPS_VRINMiss + 1, MPS_VRINMiss),
               MPS_VRINMiss = ifelse(is.na(MPS51) | is.na(MPS45),  MPS_VRINMiss + 1,  MPS_VRINMiss),                              
               MPS_VRINMiss = ifelse(is.na(MPS29) | is.na(MPS10),  MPS_VRINMiss + 1,  MPS_VRINMiss),                                         
               MPS_VRINMiss = ifelse(( (is.na(MPS6) & is.na(MPS90))  | (MPS6 == 1 & is.na(MPS90))  | (MPS90 == 0  & is.na(MPS6))),  MPS_VRINMiss + 1, MPS_VRINMiss), #type 2
               MPS_VRINMiss = ifelse(((is.na(MPS76)  & is.na(MPS146)) | ((MPS76 == 1)  & (is.na(MPS146))) | ((MPS146 == 0) & (is.na(MPS76)))), MPS_VRINMiss + 1, MPS_VRINMiss),
               MPS_VRINMiss = ifelse(((is.na(MPS38)  & is.na(MPS109)) | ((MPS38 == 0)  & (is.na(MPS109))) | ((MPS109 == 1) & (is.na(MPS38)))), MPS_VRINMiss + 1, MPS_VRINMiss),
               MPS_VRINMiss = ifelse(((is.na(MPS30)  & is.na(MPS91))  | ((MPS30 == 0)  & (is.na(MPS30)))  | ((MPS91 == 1)  & (is.na(MPS30)))), MPS_VRINMiss + 1, MPS_VRINMiss),              
               MPS_VRINMiss = ifelse(((is.na(MPS82)  & is.na(MPS142)) | ((MPS82 == 1)  & (is.na(MPS142))) | ((MPS142 == 0) & (is.na(MPS82)))), MPS_VRINMiss + 1, MPS_VRINMiss),               
               MPS_VRINMiss = ifelse(((is.na(MPS33)  & is.na(MPS152)) | ((MPS33 == 0)  & (is.na(MPS152))) | ((MPS152 == 1) & (is.na(MPS33)))), MPS_VRINMiss + 1, MPS_VRINMiss),               
               MPS_VRINMiss = ifelse(((is.na(MPS50)  & is.na(MPS62))  | ((MPS50 == 1)  & (is.na(MPS62)))  | ((MPS62 == 0)  & (is.na(MPS50)))), MPS_VRINMiss + 1, MPS_VRINMiss),
               MPS_VRINMiss = ifelse(((is.na(MPS28)  & is.na(MPS136)) | ((MPS28 == 1)  & (is.na(MPS136))) | ((MPS136 == 0) & (is.na(MPS28)))), MPS_VRINMiss + 1, MPS_VRINMiss),
               MPS_VRINMiss = ifelse(((is.na(MPS52)  & is.na(MPS111)) | ((MPS52 == 0)  & (is.na(MPS111))) | ((MPS111 == 1) & (is.na(MPS52)))), MPS_VRINMiss + 1, MPS_VRINMiss),
               MPS_VRINMiss = ifelse(((is.na(MPS65)  & is.na(MPS148)) | ((MPS65 == 0)  & (is.na(MPS148))) | ((MPS148 == 1) & (is.na(MPS65)))), MPS_VRINMiss + 1, MPS_VRINMiss),
               MPS_VRINMiss = ifelse(((is.na(MPS71)  & is.na(MPS130)) | ((MPS71 == 0)  & (is.na(MPS130))) | ((MPS130 == 1) & (is.na(MPS71)))), MPS_VRINMiss + 1, MPS_VRINMiss),
               MPS_VRINMiss = ifelse(((is.na(MPS85)  & is.na(MPS144)) | ((MPS85 == 0)  & (is.na(MPS144))) | ((MPS144 == 1) & (is.na(MPS85)))), MPS_VRINMiss + 1, MPS_VRINMiss),
               MPS_VRINMiss = ifelse(((is.na(MPS132) & is.na(MPS53))  | ((MPS132 == 0) & (is.na(MPS53)))  | ((MPS53 == 1)  & (is.na(MPS132)))),MPS_VRINMiss + 1, MPS_VRINMiss),
               MPS_VRINMiss = ifelse( ((is.na(MPS15)  & is.na(MPS117)) | (MPS15 == 0  & is.na(MPS117)) | (MPS117 == 1 & is.na(MPS15))), MPS_VRINMiss + 1, MPS_VRINMiss),
               MPS_VRIN = ifelse(((MPS_VRINMiss / 21) >= MaxMiss), NA, round(MPS_VRIN * (21/(21-MPS_VRINMiss)))) #prorate for missing item pairs
)

# Mark whether profile is invalid
# From Patrick et al 2002, "For both the MPQ and the MPQ–BF, data were deemed invalid if any of the following three criteria were met: 
# (a) Overall response pattern is excessively inconsistent with respect to item pair content (i.e., score on VRIN is 3 standard deviations above the mean VRIN score); 
# (b) response pattern is excessively polarized toward responding either true or false irrespective of item content (i.e., score on TRIN is greater than 􏰄3.21 standard deviations from the mean TRIN score); or
# (c) response pattern is both inconsistent and polarized in direction (i.e., score is 2 standard deviations above the mean for VRIN and 􏰄2.28 standard deviations from the mean for TRIN).
# The above criteria were translated into discrete numeric cutoffs for both the MPQ and the MPQ–BF, using distributions of scores within the overall normative sample (n 􏰀 1,350). The normative sample was used because this is the referent sample for the MPQ (Tellegen, in press)."

indata = ddply(indata,.(SubID),mutate,
               MPS_Invalid = 0,
               MPS_Invalid = ifelse((is.na(MPS_TRIN) | is.na(MPS_VRIN)), 1, MPS_Invalid),
               MPS_Invalid = ifelse(MPS_TRIN >= 16.6277 | MPS_TRIN <= 7.1429, 1, MPS_Invalid),
               MPS_Invalid = ifelse(MPS_VRIN >= 7.1862, 1, MPS_Invalid),
               MPS_Invalid = ifelse(MPS_VRIN >= 5.6332 & (MPS_TRIN >= 15.2555 | MPS_TRIN <= 8.5151), 1, MPS_Invalid)
               )

# delete vars used to determine test validity after overall validity score is calculated
indata$TRINTrue = NULL; indata$TRINTrueMiss = NULL; indata$TRINFalse = NULL; indata$TRINFalseMiss = NULL; indata$MPS_VRINMiss = NULL





# Score MPS Primary Trait Scales ------------------------------------------

# Well-being
MPS_WB = varScore(indata, 
                  Forward = c('MPS1',  'MPS26', 'MPS38',  'MPS50', 'MPS62', 
                              'MPS74', 'MPS85', 'MPS97',  'MPS109','MPS121',
                              'MPS133','MPS144'), 
                  Range = c(0,1),
                  MaxMiss = MaxMiss
                  )

# Social Potency
MPS_SP = varScore(indata, 
                  Forward = c('MPS2',  'MPS15', 'MPS39',  'MPS51', 'MPS75', 
                              'MPS87', 'MPS110'), 
                  Reverse = c('MPS63', 'MPS98', 'MPS122', 'MPS134','MPS145'), 
                  Range = c(0,1),
                  MaxMiss = MaxMiss
                  )

# Achievement
MPS_AC = varScore(indata, 
                  Forward = c('MPS3',  'MPS16',  'MPS27', 'MPS52', 'MPS76', 
                              'MPS88', 'MPS111', 'MPS123','MPS135','MPS146'), 
                  Reverse = c('MPS64', 'MPS99'),                   
                  Range = c(0,1),
                  MaxMiss = MaxMiss
                  )

# Social Closeness
MPS_SC = varScore(indata, 
                  Forward = c('MPS5',  'MPS17',  'MPS40', 'MPS77', 'MPS112'), 
                  Reverse = c('MPS28', 'MPS65',  'MPS89', 'MPS100','MPS124',
                              'MPS136','MPS148' ), 
                  Range = c(0,1),
                  MaxMiss = MaxMiss
                  )

# Stress Reaction
MPS_SR = varScore(indata, 
                  Forward = c('MPS6',  'MPS18',  'MPS29',  'MPS41', 'MPS53', 
                              'MPS78', 'MPS90',  'MPS101', 'MPS113','MPS125',
                              'MPS137','MPS149'), 
                  Range = c(0,1),
                  MaxMiss = MaxMiss
                  )

# Alienation
MPS_AL = varScore(indata, 
                  Forward = c('MPS7',  'MPS19',  'MPS30', 'MPS42',  'MPS54',
                              'MPS66', 'MPS91',  'MPS102','MPS114', 'MPS126',
                              'MPS138','MPS150'), 
                  Range = c(0,1),
                  MaxMiss = MaxMiss
                  )

# Aggression
MPS_AG = varScore(indata, 
                  Forward = c('MPS8',  'MPS20',  'MPS31', 'MPS43', 'MPS55',  
                              'MPS67', 'MPS103', 'MPS115','MPS127','MPS139',
                              'MPS151'), 
                  Reverse = c('MPS79'), 
                  Range = c(0,1),
                  MaxMiss = MaxMiss
                  )

# Control
MPS_CT = varScore(indata, 
                  Forward = c('MPS9',  'MPS44',  'MPS56', 'MPS68', 'MPS92', 
                              'MPS116','MPS128', 'MPS140'), 
                  Reverse = c('MPS21', 'MPS33',  'MPS80', 'MPS152' ), 
                  Range = c(0,1),
                  MaxMiss = MaxMiss
                  )

# Harm Avoidance
MPS_HA = varScore(indata, 
                  Forward = c('MPS34', 'MPS69',  'MPS81', 'MPS93', 'MPS105', 
                              'MPS129'), 
                  Reverse = c('MPS11', 'MPS22',  'MPS46', 'MPS57', 'MPS141', 
                              'MPS153'), 
                  Range = c(0,1),
                  MaxMiss = MaxMiss
                  )

# Traditionalism
MPS_TD = varScore(indata, 
                  Forward = c('MPS12', 'MPS23',  'MPS35', 'MPS58', 'MPS70',  
                              'MPS82', 'MPS94',  'MPS106','MPS142','MPS154'), 
                  Reverse = c('MPS47', 'MPS118'), 
                  Range = c(0,1),
                  MaxMiss = MaxMiss
                  )

# Absorption
MPS_AB = varScore(indata, 
                  Forward = c('MPS13', 'MPS24',  'MPS36', 'MPS48', 'MPS59',  
                              'MPS71', 'MPS83',  'MPS95', 'MPS107','MPS119', 
                              'MPS130','MPS155'),                 
                  Range = c(0,1),
                  MaxMiss = MaxMiss
                  )

# Unlikely Virtues
MPS_UV = varScore(indata, 
                  Forward = c('MPS25', 'MPS49',  'MPS72', 'MPS96', 'MPS120',
                              'MPS143','MPS147'), 
                  Reverse= c( 'MPS4',  'MPS14',  'MPS37', 'MPS61', 'MPS84',  
                              'MPS108','MPS131'), 
                  Range = c(0,1),
                  MaxMiss = MaxMiss
                  )

# Score MPS Broad Trait Scales --------------------------------------------

# Agentic Positive Emotionality
MPS_PAG = round((MPS_WB * 1.529)  + (MPS_SP * 1.294)  + (MPS_AC * 3.211)  + 
                (MPS_SC * -0.317) + (MPS_SR * -0.112) + (MPS_AL * -0.085) + 
                (MPS_AG * 0.063)  + (MPS_CT * 0.154)  + (MPS_HA * -0.186) + 
                (MPS_TD * 0.02)   + 18.448)

# Communal Positive Emotionality
MPS_PCO = round((MPS_WB * 1.582) + (MPS_SP * 1.387)  + (MPS_AC * -0.51) + 
                (MPS_SC * 3.411) + (MPS_SR * 0.048)  + (MPS_AL * 0.017) + 
                (MPS_AG * 0.059) + (MPS_CT * -0.068) + (MPS_HA * 0.205) + 
                (MPS_TD * 0.097) + 16.804)

# Agentic Negative Emotionality
MPS_NAG = round((MPS_WB * 0.042) + (MPS_SP * 0.111) + (MPS_AC * -0.036) + 
                (MPS_SC * -0.07) + (MPS_SR * 1.721) + (MPS_AL * -0.885) + 
                (MPS_AG * 5.26)  + (MPS_CT * 0.106) + (MPS_HA * 0.13)   + 
                (MPS_TD * 0.057) + 22.739)

# Alienated Negative Emotionality
MPS_NAL = round((MPS_WB * -0.043) + (MPS_SP * -0.072) + (MPS_AC * 0.059) + 
                (MPS_SC * 0.206) + (MPS_SR * 1.389) + (MPS_AL * 5.398) + 
                (MPS_AG * -0.695) + (MPS_CT * -0.114) + (MPS_HA * -0.025) + 
                (MPS_TD * 0.089) + 20.341)

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



# Append T Scores ---------------------------------------------------------

indata=cbind(indata,MPS_PEM,MPS_NEM,MPS_CON,MPS_PAG,MPS_PCO,MPS_NAG,MPS_NAL,MPS_WB,MPS_SP,MPS_AC,MPS_SC,MPS_SR,MPS_AL,MPS_AG,MPS_HA,MPS_TD,MPS_CT,MPS_AB,MPS_UV)

vrinly = data.frame(MPS_VRIN = c(seq(0,20,1)),MPS_VRIN.t = c(31,40,47,53,59,65,71,rep(78,14)))
indata=join(indata,vrinly,type="left")

trinly = data.frame(MPS_TRIN = c(seq(0,20,1)),MPS_TRIN.t = c(rep(22,8),27,31,38,44,51,58,65,71,73,rep(78,4)))
indata=join(indata,trinly,type="left")

posemo = data.frame(MPS_PEM = c(seq(1,150,1)),MPS_PEM.t = c(rep(22,31),27,27,27,27,29,29,31,31,31,32,34,34,34,35,35,36,37,38,38,39,40,41,42,42,43,43,44,44,45,46,46,47,47,48,49,50,50,51,51,52,53,53,54,54,55,56,56,57,58,58,59,60,60,61,62,63,64,66,66,66,68,69,69,71,73,73,rep(78,53)))
indata=join(indata,posemo,type="left")

negemo = data.frame(MPS_NEM = c(seq(1,150,1)),MPS_NEM.t = c(rep(22,12),27,29,31,34,34,36,38,39,40,41,42,43,44,45,46,47,48,48,49,50,50,51,52,52,53,54,54,55,56,56,57,58,58,59,60,60,60,61,61,62,62,63,63,63,63,64,64,65,65,66,66,66,66,68,68,68,69,69,69,71,71,71,71,71,71,71,73,73,73,73,73,73,73,73,rep(78,64)))
indata=join(indata,negemo,type="left")

constraint = data.frame(MPS_CON = c(seq(1,150,1)),MPS_CON.t = c(rep(22,43),27,27,27,27,27,29,29,29,29,29,31,31,31,31,32,34,34,34,35,36,37,37,38,38,39,40,40,40,41,42,42,43,43,44,44,45,46,46,47,47,48,48,49,50,51,51,52,53,53,54,55,56,56,57,58,59,60,61,62,63,64,66,68,69,71,73,73,rep(78,40)))
indata=join(indata,constraint,type="left")

posagent = data.frame(MPS_PAG = c(seq(1,150,1)),MPS_PAG.t = c(rep(22,22),27,27,27,27,27,29,29,31,31,32,34,34,34,35,37,37,38,39,40,40,41,42,43,43,44,44,45,46,46,47,47,48,48,49,50,50,51,52,53,53,54,55,55,56,56,57,58,58,59,60,60,61,62,62,63,64,66,66,68,69,71,71,73,73,rep(78,64)))
indata=join(indata,posagent,type="left")

poscommun = data.frame(MPS_PCO = c(seq(1,150,1)),MPS_PCO.t = c(rep(22,23),27,27,27,27,27,27,29,29,29,29,31,32,32,34,35,36,36,37,37,38,38,39,40,40,41,42,42,43,43,44,44,45,45,46,47,47,48,48,49,49,50,51,52,52,53,54,54,55,56,56,57,57,58,60,60,61,62,63,64,65,66,68,68,69,71,73,73,rep(78,60)))
indata=join(indata,poscommun,type="left")

negagent = data.frame(MPS_NAG = c(seq(1,150,1)),MPS_NAG.t = c(rep(22,24),27,31,32,34,36,37,39,40,41,42,43,43,44,45,46,47,47,48,49,50,51,51,52,53,53,54,54,55,55,56,56,57,57,58,58,59,60,60,60,61,61,62,62,63,63,64,65,65,66,66,66,66,68,68,68,69,69,69,71,71,71,71,71,73,73,73,73,73,rep(78,58)))
indata=join(indata,negagent,type="left")

negalien = data.frame(MPS_NAL = c(seq(1,150,1)),MPS_NAL.t = c(rep(22,17),27,27,31,34,37,39,41,43,44,45,47,48,49,50,51,52,53,53,54,54,55,56,56,57,57,58,58,59,60,60,60,61,61,61,62,62,63,63,64,64,65,65,65,65,66,66,66,66,66,66,66,68,68,68,68,68,68,69,69,69,69,69,69,71,71,71,71,71,73,73,73,73,rep(78,61)))
indata=join(indata,negalien,type="left")

wellbeing = data.frame(MPS_WB = c(seq(0,12,1)),MPS_WB.t = c(22,27,31,34,36,38,41,43,46,49,53,57,64))
indata=join(indata,wellbeing,type="left")

socialp = data.frame(MPS_SP = c(seq(0,12,1)),MPS_SP.t = c(34,41,45,47,49,51,53,56,57,60,62,66,71))
indata=join(indata,socialp,type="left")

achieve = data.frame(MPS_AC = c(seq(0,12,1)),MPS_AC.t = c(27,31,35,39,42,44,47,50,53,55,58,62,69))
indata=join(indata,achieve,type="left")

socialc = data.frame(MPS_SC = c(seq(0,12,1)), MPS_SC.t = c(27,29,34,37,40,42,44,47,49,52,55,60,66))
indata=join(indata,socialc,type="left")

stressr = data.frame(MPS_SR = c(seq(0,12,1)), MPS_SR.t = c(31,37,41,44,47,49,51,53,56,58,61,65,71))
indata=join(indata,stressr,type="left")

alien = data.frame(MPS_AL = c(seq(0,12,1)), MPS_AL.t = c(43,52,56,59,62,64,66,66,68,69,73,78,78))
indata=join(indata,alien,type="left")

aggression = data.frame(MPS_AG = c(seq(0,12,1)), MPS_AG.t = c(38,46,51,54,57,60,63,66,68,71,73,78,78))
indata=join(indata,aggression,type="left")

control = data.frame(MPS_CT = c(seq(0,12,1)), MPS_CT.t = c(22,27,29,32,34,38,40,44,46,50,54,59,66))
indata=join(indata,control,type="left")

harma = data.frame(MPS_HA = c(seq(0,12,1)), MPS_HA.t = c(22,27,29,32,36,38,41,44,46,49,52,57,63))
indata=join(indata,harma,type="left")

tradition = data.frame(MPS_TD = c(seq(0,12,1)), MPS_TD.t = c(22,27,32,34,37,40,42,45,48,51,54,59,66))
indata=join(indata,tradition,type="left")

absorbtion= data.frame(MPS_AB = c(seq(0,12,1)), MPS_AB.t = c(29,35,39,43,46,49,52,55,57,60,63,66,73))
indata=join(indata,absorbtion,type="left")

unlikelyv = data.frame(MPS_UV = c(seq(0,12,1)),MPS_UV.t = c(34,41,46,50,54,57,60,63,66,71,78,78,78))
indata=join(indata,unlikelyv,type="left")

outdata=select(indata,SubID,starts_with('MPS_'))

return(outdata)

}