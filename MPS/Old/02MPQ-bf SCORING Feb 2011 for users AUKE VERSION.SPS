* MPQ-BF KEY January 2011

* MPQ-BF copyright 2002 Auke Tellegen.

* NOTE: the following SPSS syntax file reads a data file
  containing MPQ-bf item responses and computes raw scores
  and linear T scores for TRINbf, VRINbf, UVbf and 18 substantive
  scales; absence of error not guaranteed.

* Get the data file containing each respondent's 155 MPQ-bf 
  item responses; label the 155 items, in booklet order, 
  m1 through m155.

* For each respondent include also in the data file an ID number.

GET FILE='C:\xxx.SAV'.

* If necessary, recode item responses such that "A" responses 
  are coded 1, and "B" responses are coded 0; for example, if
  "A" is coded 1 and "B" is coded two, then recode as follows: 

RECODE M1 TO M155 (1=1) (2=0).

Missing values m1 to m155 (9).

EXECUTE.

*VRINbf.

Compute VRINbf1 = 0.
Compute VRINbf2 = 0.
Compute VRINbf3 = 0.
Compute VRINbf4 = 0.
Compute VRINbf5 = 0.
Compute VRINbf6 = 0.
Compute VRINbf7 = 0.
Compute VRINbf8 = 0.
Compute VRINbf9 = 0.
Compute VRINbf10 = 0.
Compute VRINbf11 = 0.
Compute VRINbf12 = 0.
Compute VRINbf14 = 0.
Compute VRINbf15 = 0.
Compute VRINbf16 = 0.
Compute VRINbf17 = 0.
Compute VRINbf18 = 0.
Compute VRINbf19 = 0.
Compute VRINbf20 = 0.
Compute VRINbf21 = 0.

COMPUTE VRINbf1 = m5 EQ 1 AND m112 EQ 0.
COMPUTE VRINbf1 = m5 EQ 0 AND m112 EQ 1.
COMPUTE VRINbf2 = m20 EQ 1 AND m139 EQ 0.
COMPUTE VRINbf2 = m20 EQ 0 AND m139 EQ 1.
COMPUTE VRINbf3 = m44 EQ 1 AND m140 EQ 0.
COMPUTE VRINbf3 = m44 EQ 0 AND m140 EQ 1.
COMPUTE VRINbf4 = m2 EQ 1 AND m110 EQ 0.
COMPUTE VRINbf4 = m2 EQ 0 AND m110 EQ 1.
COMPUTE VRINbf5 = m88 EQ 1 AND m135 EQ 0.
COMPUTE VRINbf5 = m88 EQ 0 AND m135 EQ 1.
COMPUTE VRINbf6 = m51 EQ 1 AND m45 EQ 0.
COMPUTE VRINbf6 = m51 EQ 0 AND m45 EQ 1.
COMPUTE VRINbf7 = m6 EQ 1 AND m90 EQ 0.
COMPUTE VRINbf7 = m6 EQ 0 AND m90 EQ 1.
COMPUTE VRINbf8 = m76 EQ 1 AND m146 EQ 0.
COMPUTE VRINbf8 = m76 EQ 0 AND m146 EQ 1.
COMPUTE VRINbf9 = m38 EQ 1 AND m109 EQ 0.
COMPUTE VRINbf9 = m38 EQ 0 AND m109 EQ 1.
COMPUTE VRINbf10 = m30 EQ 1 AND m91 EQ 0.
COMPUTE VRINbf10 = m30 EQ 0 AND m91 EQ 1.
COMPUTE VRINbf11 = m82 EQ 1 AND m142 EQ 0.
COMPUTE VRINbf11 = m82 EQ 0 AND m142 EQ 1.
COMPUTE VRINbf12 = m33 EQ 1 AND m152 EQ 0.
COMPUTE VRINbf12 = m33 EQ 0 AND m152 EQ 1.
COMPUTE VRINbf13 = m50 EQ 1 AND m62 EQ 0.
COMPUTE VRINbf13 = m50 EQ 0 AND m62 EQ 1.
COMPUTE VRINbf14 = m28 EQ 1 AND m136 EQ 0.
COMPUTE VRINbf14 = m28 EQ 0 AND m136 EQ 1.
COMPUTE VRINbf15 = m52 EQ 1 AND m111 EQ 0.
COMPUTE VRINbf15 = m52 EQ 0 AND m111 EQ 1.
COMPUTE VRINbf16 = m65 EQ 1 AND m148 EQ 0.
COMPUTE VRINbf16 = m65 EQ 0 AND m148 EQ 1.
COMPUTE VRINbf17 = m71 EQ 1 AND m130 EQ 0.
COMPUTE VRINbf17 = m71 EQ 0 AND m130 EQ 1.
COMPUTE VRINbf18 = m85 EQ 1 AND m144 EQ 0.
COMPUTE VRINbf18 = m85 EQ 0 AND m144 EQ 1.
COMPUTE VRINbf19 = m132 EQ 1 AND m53 EQ 0.
COMPUTE VRINbf19 = m132 EQ 0 AND m53 EQ 1.
COMPUTE VRINbf20 = m15 EQ 1 AND m117 EQ 0.
COMPUTE VRINbf20 = m15 EQ 0 AND m117 EQ 1.
COMPUTE VRINbf21 = m10 EQ 1 AND m29 EQ 0.
COMPUTE VRINbf21 = m10 EQ 0 AND m29 EQ 1.

COUNT VRINbf=VRINbf1 to VRINbf21 (1).

*TRINbf.

Compute TRINbft1 = 0.
Compute TRINbft2 = 0.
Compute TRINbft3 = 0.
Compute TRINbft4 = 0.
Compute TRINbft5 = 0.
Compute TRINbft6 = 0.
Compute TRINbft7 = 0.
Compute TRINbft8 = 0.
Compute TRINbff1 = 0.
Compute TRINbff2 = 0.
Compute TRINbff3 = 0.
Compute TRINbff4 = 0.
Compute TRINbff5 = 0.
Compute TRINbff6 = 0.
Compute TRINbff7 = 0.
Compute TRINbff8 = 0.
Compute TRINbff9 = 0.
Compute TRINbff10 = 0.
Compute TRINbff11 = 0.
Compute TRINbff12 = 0.

COMPUTE TRINbft1 = m28 EQ 1 AND m112 EQ 1.
COMPUTE TRINbft2 = m52 EQ 1 AND m64 EQ 1.
COMPUTE TRINbft3 = m70 EQ 1 AND m118 EQ 1.
COMPUTE TRINbft4 = m99 EQ 1 AND m146 EQ 1.
COMPUTE TRINbft5 = m5 EQ 1 AND m136 EQ 1.
COMPUTE TRINbft6 = m20 EQ 1 AND m79 EQ 1.
COMPUTE TRINbft7 = m15 EQ 1 AND m98 EQ 1.
COMPUTE TRINbft8 = m110 EQ 1 AND m145 EQ 1.

COMPUTE TRINbff1 = m51 EQ 0 AND m63 EQ 0.
COMPUTE TRINbff2 = m40 EQ 0 AND m148 EQ 0.
COMPUTE TRINbff3 = m69 EQ 0 AND m46 EQ 0.
COMPUTE TRINbff4 = m80 EQ 0 AND m140 EQ 0.
COMPUTE TRINbff5 = m5 EQ 0 AND m136 EQ 0.
COMPUTE TRINbff6 = m20 EQ 0 AND m79 EQ 0.
COMPUTE TRINbff7 = m15 EQ 0 AND m98 EQ 0.
COMPUTE TRINbff8 = m110 EQ 0 AND m145 EQ 0.
COMPUTE TRINbff9 = m132 EQ 0 AND m60 EQ 0.
COMPUTE TRINbff10 = m86 EQ 0 AND m9 EQ 0.
COMPUTE TRINbff11 = m30 EQ 0 AND m73 EQ 0.
COMPUTE TRINbff12 = m32 EQ 0 AND m104 EQ 0.

COUNT TRINbft=TRINbft1 TO TRINbft8 (1).
COUNT TRINbff=TRINbff1 TO TRINbff12 (1).

COMPUTE TRINbf =12+TRINbft - TRINbff.


COUNT WBbf = M1 M26 M38 M50 M62 M74 M85 M97 M109 
             M121 M133 M144 (1).

COUNT SPbf = M2 M15 M39 M51 M75 M87 M110 (1) 
               M63 M98 M122 M134 M145 (0).

COUNT ACbf = M3 M16 M27 M52 M76 M88 M111 M123 M135 M146 (1) 
                M64 M99 (0).

COUNT SCbf = M5 M17 M40 M77 M112 (1) 
                M28 M65 M89 M100 M124 M136 M148 (0).

COUNT SRbf = M6 M18 M29 M41 M53 M78 M90 M101 M113 M125
                 M137 M149 (1).

COUNT AGbf=  M8 M20 M31 M43 M55 M67 M103 M115 M127 M139
                M151 (1) M79 (0).

COUNT ALbf = M7 M19 M30 M42 M54 M66 M91 M102 M114 M126 M138 
              M150 (1).

COUNT CNbf = M9 M44 M56 M68 M92 M116 M128 M140 (1)
                M21 M33 M80 M152 (0).

COUNT HAbf = M34 M69 M81 M93 M105 M129 (1) 
                 M11 M22 M46 M57 M141 M153 (0).

COUNT TRbf = M12 M23 M35 M58 M70 M82 M94 M106 M142 M154 (1) 
                 M47 M118 (0).

COUNT ABbf = M13 M24 M36 M48 M59 M71 M83 M95 M107 M119 
               M130 M155 (1).

COUNT UVbf = m25 m49 m72 m96 m120 m143 m147 (1)
             m4 m14 m37 m61 m84 m108 m131 (0).

COMPUTE PEMbf = RND(1.933 * WBbf + 1.669 * SPbf + 1.671 * ACbf
             + 1.95 * SCbf + 0.085 * SRbf + 0.292 * ALbf
             + 0.13 * AGbf + 0.048 * CNbf + 0.015 * HAbf
             + 0.07 * TRbf + 13.712).

COMPUTE NEMbf = RND(0.127 * WBbf + 0.15 * SPbf + 0.038 * ACbf 
             + 0.279 * SCbf + 1.904 * SRbf + 3.061 * ALbf
             + 2.551 * AGbf + 0.045 * CNbf + 0.126 * HAbf
             + 0.147 * TRbf + 6.27).

COMPUTE CONbf = RND(-0.085 * WBbf + -0.052 * SPbf + 0.241 * ACbf
              + -0.068 * SCbf + 0.046 * SRbf + -0.302 * ALbf
              + 0.296 * AGbf + 2.717 * CNbf + 2.579 * HAbf
              + 2.199 * TRbf + 20.742).

COMPUTE PEMAGbf = RND(1.529 * WBbf + 1.294 * SPbf + 3.211 * ACbf
             + -0.317 * SCbf + -0.112 * SRbf + -0.085 * ALbf
             + 0.063 * AGbf + 0.154 * CNbf + -0.186 * HAbf
             + 0.02 * TRbf + 18.448).

COMPUTE PEMCObf = RND(1.582 * WBbf + 1.387 * SPbf + -0.51 * ACbf
              + 3.411 * SCbf + 0.048 * SRbf + 0.017 * ALbf
              + 0.059 * AGbf + -0.068 * CNbf + 0.205 * HAbf
              + 0.097 * TRbf + 16.804).

COMPUTE NEMAGbf = RND(0.042 * WBbf + 0.111 * SPbf + - 0.036 * ACbf
              + -0.07 * SCbf + 1.721 * SRbf + -0.885 * ALbf
              + 5.26 * AGbf + 0.106 * CNbf + 0.13 * HAbf
              + 0.057 * TRbf + 22.739).

COMPUTE NEMALbf = RND(-0.043 * WBbf + -0.072 * SPbf + 0.059 * ACbf
              + 0.206 * SCbf + 1.389 * SRbf + 5.398 * ALbf
              + -0.695 * AGbf + -0.114 * CNbf + -0.025 * HAbf
              + 0.089 * TRbf + 20.341).

COMPUTE  TVRINbf  = ((VRINbf - 2.4156) / 1.50656) * 10 + 50. 
COMPUTE  TTRINbf  = ((TRINbf - 11.8296) / 1.49445) * 10 + 50. 
COMPUTE  TWBbf  = ((WBbf - 8.6785) / 2.84443) * 10 + 50. 
COMPUTE  TSPbf = ((SPbf - 4.7933) / 3.57565) * 10 + 50. 
COMPUTE  TACbf = ((ACbf - 6.9422) / 3.11712) * 10 + 50. 
COMPUTE  TSCbf = ((SCbf - 7.7415) / 3.14921) * 10 + 50. 
COMPUTE  TSRbf = ((SRbf - 5.6244) / 3.45281) * 10 + 50. 
COMPUTE  TAGbf = ((AGbf - 2.5304) / 2.43678) * 10 + 50. 
COMPUTE  TALbf = ((ALbf - 1.5104) / 2.30630) * 10 + 50. 
COMPUTE  TCNbf = ((CNbf - 8.5378) / 2.57915) * 10 + 50. 
COMPUTE  THAbf = ((HAbf - 8.7326) / 2.79156) * 10 + 50. 
COMPUTE  TTRbf = ((TRbf - 8.2496) / 2.87842) * 10 + 50. 
COMPUTE  TABbf = ((ABbf - 5.5052) / 3.06363) * 10 + 50. 
COMPUTE  TUVbf = ((UVbf - 3.3467) / 2.39033) * 10 + 50. 
COMPUTE  TPEMbf = ((PEMbf - 67.5556) / 14.62548) * 10 + 50.  
COMPUTE  TNEMbf = ((NEMbf - 34.9926) / 14.74955) * 10 + 50. 
COMPUTE  TCONbf = ((CONbf - 85.3111) / 14.41936) * 10 + 50. 
COMPUTE  TPEMAGbf = ((PEMAGbf - 57.0207) / 14.24022) * 10 + 50. 
COMPUTE  TPEMCObf = ((PEMCObf - 62.4948) / 14.66491) * 10 + 50. 
COMPUTE  TNEMAGbf = ((NEMAGbf - 47.0059) / 14.82040) * 10 + 50. 
COMPUTE  TNEMALbf = ((NEMALbf - 35.3726) / 14.48441) * 10 + 50.

DESCRIPTIVES variables AGE VRINbf TRINbf WBbf SPbf ACbf SCbf SRbf AGbf 
ALbf CNbf HAbf TRbf ABbf UVbf PEMbf NEMbf CONbf PEMAGbf PEMCObf 
NEMAGbf NEMALbf.

DESCRIPTIVES variables AGE TVRINbf TTRINbf TWBbf TSPbf TACbf TSCbf TSRbf 
TAGbf TALbf TCNbf THAbf TTRbf TABbf TUVbf TPEMbf TNEMbf TCONbf 
TPEMAGbf TPEMCObf TNEMAGbf TNEMALbf.

* The following commands list the raw scores and linear T scores of
  each individual in the data file.

* RAW SCORES.

SUMMARIZE
/TABLES=ID AGE VRINbf TRINbf WBbf SPbf ACbf SCbf 
SRbf AGbf ALbf CNbf HAbf TRbf ABbf
UVbf PEMbf NEMbf CONbf PEMAGbf PEMCObf NEMAGbf NEMALbf
 /FORMAT=LIST TOTAL
 /TITLE='Case Summaries'
 /MISSING=VARIABLE
 /CELLS=COUNT.

* T SCORES.

SUMMARIZE
/TABLES=ID AGE TVRINbf TTRINbf TWBbf TSPbf TACbf TSCbf TSRbf TAGbf TALbf 
TCNbf THAbf TTRbf TABbf TUVbf
TPEMbf TNEMbf TCONbf TPEMAGbf TPEMCObf TNEMAGbf TNEMALbf
 /FORMAT=LIST TOTAL
 /TITLE='Case Summaries'
 /MISSING=VARIABLE
 /CELLS=COUNT.  

* Commands such as the following can be used to derive descriptive
  statistics of designated subgroups.

*Raw Scores.

TEMPORARY.
SELECT IF (SEX EQ 1). 
DESCRIPTIVES variables AGE VRINbf TRINbf WBbf SPbf ACbf SCbf SRbf AGbf 
ALbf CNbf HAbf TRbf ABbf UVbf PEMbf NEMbf CONbf PEMAGbf PEMCObf 
NEMAGbf NEMALbf.

TEMPORARY.
SELECT IF (SEX EQ 2). 
DESCRIPTIVES variables AGE VRINbf TRINbf WBbf SPbf ACbf SCbf SRbf AGbf 
ALbf CNbf HAbf TRbf ABbf UVbf PEMbf NEMbf CONbf PEMAGbf PEMCObf 
NEMAGbf NEMALbf.

TEMPORARY.
SELECT IF (AGE LE 40). 
DESCRIPTIVES variables AGE VRINbf TRINbf WBbf SPbf ACbf SCbf SRbf AGbf 
ALbf CNbf HAbf TRbf ABbf UVbf PEMbf NEMbf CONbf PEMAGbf PEMCObf 
NEMAGbf NEMALbf.

TEMPORARY.
SELECT IF (AGE GT 40). 
DESCRIPTIVES variables AGE VRINbf TRINbf WBbf SPbf ACbf SCbf SRbf AGbf 
ALbf CNbf HAbf TRbf ABbf UVbf PEMbf NEMbf CONbf PEMAGbf PEMCObf 
NEMAGbf NEMALbf.

*Linear T scores.

TEMPORARY.
SELECT IF (SEX EQ 1). 
DESCRIPTIVES variables AGE TVRINbf TTRINbf TWBbf TSPbf TACbf TSCbf TSRbf
TAGbf TALbf  TCNbf THAbf TTRbf TABbf TUVbf TPEMbf TNEMbf TCONbf 
TPEMAGbf TPEMCObf TNEMAGbf TNEMALbf.

TEMPORARY.
SELECT IF (SEX EQ 2). 
DESCRIPTIVES variables AGE TVRINbf TTRINbf TWBbf TSPbf TACbf TSCbf TSRbf
TAGbf TALbf  TCNbf THAbf TTRbf TABbf TUVbf TPEMbf TNEMbf TCONbf 
TPEMAGbf TPEMCObf TNEMAGbf TNEMALbf.

TEMPORARY.
SELECT IF (AGE LE 40). 
DESCRIPTIVES variables AGE TVRINbf TTRINbf TWBbf TSPbf TACbf TSCbf TSRbf
TAGbf TALbf  TCNbf THAbf TTRbf TABbf TUVbf TPEMbf TNEMbf TCONbf 
TPEMAGbf TPEMCObf TNEMAGbf TNEMALbf.

TEMPORARY.
SELECT IF (AGE GT 40). 
DESCRIPTIVES variables AGE TVRINbf TTRINbf TWBbf TSPbf TACbf TSCbf TSRbf
TAGbf TALbf  TCNbf THAbf TTRbf TABbf TUVbf TPEMbf TNEMbf TCONbf 
TPEMAGbf TPEMCObf TNEMAGbf TNEMALbf.







