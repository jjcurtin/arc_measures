# purpose: score MPQ-BF (155 item version of MPQ)
# input: wide-formatted data frame (one row per person)
# output: wide-formatted data frame with new columns for scale (e.g., NEM/PEM/CON) and sub-scale scores
# notes: validity indices (VIN/TRIN) are not included 
# author: mark j. starr (mark.starr@wisc.edu), 2015-06-16; 
# ... based on the spss script (MPS.sps) written by john j. curtin (jjcurtin@wisc.edu), 2006-12-06.

score_MPS <- function(indata){
  
require(lmSupport)

# Score MPS Primary Trait Scales ------------------------------------------

# matches JJC's 2006 scoring script
MPS_WB = varScore(indata, 
                  Forward = c('MPS1',  'MPS26', 'MPS38',  'MPS50', 'MPS62', 
                              'MPS74', 'MPS85', 'MPS97',  'MPS109','MPS121',
                              'MPS133','MPS144'), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )
# note: JJC's "MPS.SPS" scoring script does NOT include 'MPS98'
# as a reverse coded item, but the script from the server (MPS.R) does; 
# because MPS_SP "should" include 12 items, i left item 98 in the current function
MPS_SP = varScore(indata, 
                  Forward = c('MPS2',  'MPS15', 'MPS39',  'MPS51', 'MPS75', 
                              'MPS87', 'MPS110'), 
                  Reverse = c('MPS63', 'MPS98', 'MPS122', 'MPS134','MPS145'), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# matches JJC's 2006 scoring script
MPS_AC = varScore(indata, 
                  Forward = c('MPS3',  'MPS16',  'MPS27', 'MPS52', 'MPS76', 
                              'MPS88', 'MPS111', 'MPS123','MPS135','MPS146'), 
                  Reverse = c('MPS64', 'MPS99'), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# matches JJC's 2006 scoring script
MPS_SC = varScore(indata, 
                  Forward = c('MPS5',  'MPS17',  'MPS40', 'MPS77', 'MPS112'), 
                  Reverse = c('MPS28', 'MPS65',  'MPS89', 'MPS100','MPS124',
                              'MPS136','MPS148' ), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# note: JJC's "MPS.SPS" scoring script does NOT include 'MPS60'
# as a reverse coded item, but the script from the server (MPS.R) does; 
# also, the server copy includes items 125 and 137 twice
# i excluded item 60 from MPS_SR
MPS_SR = varScore(indata, 
                  Forward = c('MPS6',  'MPS18',  'MPS29',  'MPS41', 'MPS53', 
                              'MPS78', 'MPS90',  'MPS101', 'MPS113','MPS125',
                              'MPS137','MPS149'), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# matches JJC's 2006 scoring script
MPS_AL = varScore(indata, 
                  Forward = c('MPS7',  'MPS19',  'MPS30', 'MPS42',  'MPS54',
                              'MPS66', 'MPS91',  'MPS102','MPS114', 'MPS126',
                              'MPS138','MPS150'), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# matches JJC's 2006 scoring script
MPS_AG = varScore(indata, 
                  Forward = c('MPS8',  'MPS20',  'MPS31', 'MPS43', 'MPS55',  
                              'MPS67', 'MPS103', 'MPS115','MPS127','MPS139',
                              'MPS151'), 
                  Reverse = c('MPS79'), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# matches JJC's 2006 scoring script
MPS_CT = varScore(indata, 
                  Forward = c('MPS9',  'MPS44',  'MPS56', 'MPS68', 'MPS92', 
                              'MPS116','MPS128', 'MPS140'), 
                  Reverse = c('MPS21', 'MPS33',  'MPS80', 'MPS152' ), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# matches JJC's 2006 scoring script
MPS_HA = varScore(indata, 
                  Forward = c('MPS34', 'MPS69',  'MPS81', 'MPS93', 'MPS105', 
                              'MPS129'), 
                  Reverse = c('MPS11', 'MPS22',  'MPS46', 'MPS57', 'MPS141', 
                              'MPS153'), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# matches JJC's 2006 scoring script
MPS_TD = varScore(indata, 
                  Forward = c('MPS12', 'MPS23',  'MPS35', 'MPS58', 'MPS70',  
                              'MPS82', 'MPS94',  'MPS106','MPS142','MPS154'), 
                  Reverse = c('MPS47', 'MPS118'), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# matches JJC's 2006 scoring script
MPS_AB = varScore(indata, 
                  Forward = c('MPS13', 'MPS24',  'MPS36', 'MPS48', 'MPS59',  
                              'MPS71', 'MPS83',  'MPS95', 'MPS107','MPS119', 
                              'MPS130','MPS155'), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# matches JJC's 2006 scoring script, but the pro-rate section of JJC's 
# script implies there are 12 items, though there are actually 14. this is not
# a problem when scored with varScore though, because varScore uses the n columns 
# when pro-rating items and calculating % items missed. 
MPS_UV = varScore(indata, 
                  Forward = c('MPS25', 'MPS49',  'MPS72', 'MPS96', 'MPS120',
                              'MPS143','MPS147'), 
                  Reverse= c( 'MPS4',  'MPS14',  'MPS37', 'MPS61', 'MPS84',  
                              'MPS108','MPS131'), 
                  Range = c(0,1),
                  MaxMiss = 0.25
                  )

# Score MPS Broad Trait Scales --------------------------------------------

# note MPS.R file on server did not round, though JJC's 2006 script does
MPS_PEM = round((MPS_WB * 1.933) + (MPS_SP * 1.669) + (MPS_AC * 1.671) + 
                (MPS_SC * 1.950) + (MPS_SR * 0.085) + (MPS_AL * 0.292) + 
                (MPS_AG * 0.130) + (MPS_CT * 0.048) + (MPS_HA * 0.015) + 
                (MPS_TD * 0.070) + 13.712
                )

# JJC's 2006 shows the weight of MPS_SR as 1.90, not 1.904... i left it as 1.904
MPS_NEM = round((MPS_WB * 0.127) + (MPS_SP * 0.150) + (MPS_AC * 0.038) + 
                (MPS_SC * 0.279) + (MPS_SR * 1.904) + (MPS_AL * 3.061) + 
                (MPS_AG * 2.551) + (MPS_CT * 0.045) + (MPS_HA * 0.126) + 
                (MPS_TD * 0.147) + 6.270
                )

# matches JJC's file
MPS_CON = round((MPS_WB * -0.085) + (MPS_SP * -0.052) + (MPS_AC * 0.241) + 
                (MPS_SC * -0.068) + (MPS_SR * 0.046) + (MPS_AL * -0.302) + 
                (MPS_AG* 0.296) + (MPS_CT * 2.717) + (MPS_HA * 2.579) + 
                (MPS_TD * 2.199) + 20.742
                )

# the MPS.r file does not include 
outdata=cbind(indata,MPS_PEM,MPS_NEM,MPS_CON,
              MPS_WB,MPS_SP,MPS_AC,MPS_SC,MPS_SR,MPS_AL,MPS_AG,MPS_HA,MPS_TD,MPS_CT,MPS_AB,MPS_UV)

describe(MPS_CON)

return(outdata)
}