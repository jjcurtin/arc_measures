
RECODE YAP1 YAP2 YAP3 YAP4 YAP5 YAP6 YAP7 YAP8 YAP9 YAP10 YAP11 YAP12 YAP13 YAP14 YAP15 YAP16 YAP17 
    YAP18 YAP19 YAP20 YAP21 YAP22 YAP23 YAP24 YAP25 YAP26 YAP27 (0=0) (1=0) (2=1) (3=1) (4=1) (5=1) 
    (6=1) (7=1) (8=1) (9=1) INTO YAP1_PAST YAP2_PAST YAP3_PAST YAP4_PAST YAP5_PAST YAP6_PAST YAP7_PAST 
    YAP8_PAST YAP9_PAST YAP10_PAST YAP11_PAST YAP12_PAST YAP13_PAST YAP14_PAST YAP15_PAST YAP16_PAST 
    YAP17_PAST YAP18_PAST YAP19_PAST YAP20_PAST YAP21_PAST YAP22_PAST YAP23_PAST YAP24_PAST YAP25_PAST 
    YAP26_PAST YAP27_PAST.
EXECUTE.

COMPUTE YAP_PAST_TOT = mean.7(YAP1_PAST, YAP2_PAST, YAP3_PAST, YAP4_PAST, YAP5_PAST, YAP6_PAST, YAP7_PAST, 
    YAP8_PAST, YAP9_PAST, YAP10_PAST, YAP11_PAST, YAP12_PAST, YAP13_PAST, YAP14_PAST, YAP15_PAST, YAP16_PAST, 
    YAP17_PAST, YAP18_PAST, YAP19_PAST, YAP20_PAST, YAP21_PAST, YAP22_PAST, YAP23_PAST, YAP24_PAST, YAP25_PAST, 
    YAP26_PAST, YAP27_PAST)*27.
EXECUTE.