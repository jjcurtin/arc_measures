#Score MPS Primary Trait Scales
MPS_WB = varScore(d, Forward= c('MPS1', 'MPS26', 'MPS38',  'MPS50', 'MPS62', 'MPS74', 'MPS85',  'MPS97', 'MPS109', 'MPS121',  'MPS133', 'MPS144'), Range = c(0,1) )
MPS_SP = varScore(d, Forward= c('MPS2', 'MPS15', 'MPS39',  'MPS51', 'MPS75', 'MPS87', 'MPS110'), Reverse =c( 'MPS63','MPS98','MPS122', 'MPS134', 'MPS145'), Range = c(0,1) )
MPS_AC = varScore(d, Forward= c('MPS3',  'MPS16', 'MPS27', 'MPS52', 'MPS76', 'MPS88', 'MPS111','MPS123', 'MPS135', 'MPS146'), Reverse= c('MPS64', 'MPS99'), Range = c(0,1) )
MPS_SC = varScore(d, Forward= c('MPS5',  'MPS17',  'MPS40', 'MPS77', 'MPS112'), Reverse = c( 'MPS28','MPS65', 'MPS89','MPS100','MPS124','MPS136','MPS148' ), Range = c(0,1))
MPS_SR = varScore(d, Forward= c( 'MPS6','MPS18', 'MPS29', 'MPS41', 'MPS53', 'MPS78', 'MPS90', 'MPS101','MPS113', 'MPS125', 'MPS137','MPS125', 'MPS137', 'MPS149'), Reverse= c('MPS60'), Range = c(0,1) )
MPS_AL = varScore(d, Forward= c('MPS7', 'MPS19', 'MPS30', 'MPS42', 'MPS54',  'MPS66', 'MPS91', 'MPS102', 'MPS114', 'MPS126', 'MPS138', 'MPS150'), Range = c(0,1) )
MPS_AG = varScore(d, Forward= c('MPS8', 'MPS20', 'MPS31', 'MPS43', 'MPS55', 'MPS67', 'MPS103', 'MPS115','MPS127',  'MPS139', 'MPS151'), Reverse= c('MPS79'), Range = c(0,1) )
MPS_HA = varScore(d, Forward= c( 'MPS34', 'MPS69', 'MPS81',   'MPS93', 'MPS105',  'MPS129'), Reverse= c('MPS11','MPS22','MPS46','MPS57','MPS141','MPS153'), Range = c(0,1))
MPS_TD = varScore(d, Forward= c('MPS12', 'MPS23', 'MPS35', 'MPS58', 'MPS70', 'MPS82', 'MPS94', 'MPS106','MPS142', 'MPS154'), Reverse= c('MPS47', 'MPS118'), Range = c(0,1) )
MPS_CT = varScore(d, Forward= c( 'MPS9', 'MPS44', 'MPS56', 'MPS68', 'MPS92', 'MPS116', 'MPS128', 'MPS140'), Reverse =c( 'MPS21','MPS33', 'MPS80','MPS152' ), Range = c(0,1) )
MPS_AB = varScore(d, Forward= c('MPS13', 'MPS24', 'MPS36', 'MPS48', 'MPS59', 'MPS71', 'MPS83', 'MPS95','MPS107', 'MPS119', 'MPS130', 'MPS155'), Range = c(0,1) )
MPS_UV = varScore(d, Forward= c('MPS25', 'MPS49', 'MPS72', 'MPS96', 'MPS120', 'MPS143', 'MPS147'), Reverse= c('MPS4', 'MPS14', 'MPS37','MPS61', 'MPS84', 'MPS108', 'MPS131') , Range = c(0,1))


#Score MPS Broad Trait Scales
MPS_PEM = (MPS_wb * 1.933) + (mps_sp * 1.669) + (MPS_ac * 1.671) + (MPS_sc * 1.950) + (MPS_sr * 0.085) + (MPS_al * 0.292) + 
                        (MPS_ag * 0.130) + (MPS_ct * 0.048) + (MPS_ha * 0.015) + 
                        (MPS_td * 0.070) + 13.712

MPS_nem = RND((MPS_wb * 0.127) + (mps_sp * 0.150) + (MPS_ac * 0.038) + 
                        (MPS_sc * 0.279) + (MPS_sr * 1.904) + (MPS_al * 3.061) + 
                        (MPS_ag * 2.551) + (MPS_ct * 0.045) + (MPS_ha * 0.126) + 
                        (MPS_td * 0.147) + 6.270)

MPS_con = RND((MPS_wb * -0.085) + (MPS_sp * -0.052) + (MPS_ac * 0.241) + 
                        (MPS_sc * -0.068) + (MPS_sr * 0.046) + (MPS_al * -0.302) + 
                        (MPS_ag * 0.296) + (MPS_ct * 2.717) + (MPS_ha * 2.579) + 
                        (MPS_td * 2.199) + 20.742)

