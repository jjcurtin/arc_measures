*PAN60
*Created by JMHogle on 7/31/07

COMPUTE pan_paf = SUM(pan3,pan8,pan13,pan25,pan31,pan37,pan39,pan47,pan52
 ,pan55) .
COMPUTE pan_naf = SUM(pan11,pan18,pan26,pan32,pan34,pan38,pan40,pan42,pan44
 ,pan50) .
COMPUTE pan_att = SUM(pan3,pan25,pan52,pan59) .
COMPUTE pan_shy = SUM(pan4,pan23,pan30,pan49) .
COMPUTE pan_fat = SUM(pan5,pan19,pan36,pan45) .
COMPUTE pan_ser = SUM(pan10,pan17,pan43) .
COMPUTE pan_sur = SUM(pan7,pan20,pan54) .
COMPUTE pan_fer = SUM(pan18,pan21,pan34,pan40,pan44,pan53) .
COMPUTE pan_hos = SUM(pan2,pan9,pan11,pan27,pan38,pan56) .
COMPUTE pan_glt = SUM(pan15,pan32,pan42,pan46,pan51,pan60) .
COMPUTE pan_sad = SUM(pan16,pan24,pan29,pan35,pan48) .
COMPUTE pan_jov = SUM(pan1,pan12,pan22,pan33,pan37,pan41,pan47,pan58) .
COMPUTE pan_sas = SUM(pan6,pan8,pan14,pan28,pan39,pan57) .
EXECUTE .