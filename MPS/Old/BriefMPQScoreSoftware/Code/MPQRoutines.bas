Attribute VB_Name = "MPQRoutines"
Option Explicit

Public frmM As frmMain
Public ItemFileHandle As Integer
Public ItemFileName As String
Public OutFileHandle As Integer
Public OutFileName As String

Public HasHeader As Boolean
Public InputHeader() As String
Public OutputHeader() As String

Public ItemArray() As String
Public ScoreArray() As String

Public MVC As String
Public NumMissItems As Integer
Public ProrateScores As Boolean
Public MaxMissPercent As Integer
Public ScaleMiss As Boolean     'if any content scale is missing will set all Broad trait to missing
Public TrueValue As Integer
Public FalseValue As Integer

Public ItemOffset As Integer    'indicates offset for non-item data at start of record

'raw content scales
Public WBR As Double
Public SPR As Double
Public ACR As Double
Public SCR As Double
Public SRR As Double
Public ALR As Double
Public AGR As Double
Public CLR As Double
Public HAR As Double
Public TDR As Double
Public ABR As Double

'raw broad trait
Public PEM As Double
Public NEM As Double
Public CON As Double
Public PAG As Double
Public PCO As Double
Public NAG As Double
Public NAL As Double

'raw validity
Public UVR As Double
Public VRR As Double
Public TRR As Double

'T content scales
Public WBT As Double
Public SPT As Double
Public ACT As Double
Public SCT As Double
Public SRT As Double
Public ALT As Double
Public AGT As Double
Public CLT As Double
Public HAT As Double
Public TDT As Double
Public ABT As Double

'T broad trait
Public PEMT As Double
Public NEMT As Double
Public CONT As Double
Public PAGT As Double
Public PCOT As Double
Public NAGT As Double
Public NALT As Double

'T validity
Public UVT As Double
Public VRT As Double
Public TRT As Double

Public Invalid As Double


Sub Main()
    frmSplash.Show
    frmSplash.Refresh
    
    'temp initialization.  Must set with dialog later
    MVC = -999
    ProrateScores = True
    MaxMissPercent = 25
    
End Sub

Sub ScoreMPQ()
    
    If EOF(ItemFileHandle) Then
        MsgBox "Item File contains no data"
        Exit Sub
    End If

    If HasHeader Then
        GetOneRecord ItemFileHandle, InputHeader(), False
    End If
    
    CreateOutputHeader

    
    Do While GetOneRecord(ItemFileHandle, ItemArray(), False) = True
        TransferOffsetData
        
        ScaleMiss = False
        CalcWBR
        CalcSPR
        CalcACR
        CalcSCR
        CalcSRR
        CalcALR
        CalcAGR
        CalcCLR
        CalcHAR
        CalcTDR
        CalcABR
        
        CalcBT   'broad trait
        CalcUVR
        CalcVRR
        CalcTRR
        
        CalcWBT
        CalcSPT
        CalcACT
        CalcSCT
        CalcSRT
        CalcAlT
        CalcAGT
        CalcCLT
        CalcHAT
        CalcTDT
        CalcABT
        
        CalcPEMT
        CalcNEMT
        CalcCONT
        CalcPAGT
        CalcPCOT
        CalcNAGT
        CalcNALT
        
        calcUVT
        CalcVRT
        CalcTRT
        CalcInvalid
                
        'Output Scores
        PrintOneRecord OutFileHandle, ScoreArray()
    Loop
    
    'close files
    Close ItemFileHandle
    Close OutFileHandle
    MsgBox "Brief MPQ scoring complete!", , "Brief MPQ Scoring Program"
    
End Sub

Sub CreateOutputHeader()
    ReDim OutputHeader(0 To 43 + ItemOffset)
    OutputHeader(0) = 43 + ItemOffset
    
    Dim i As Integer
    For i = 1 To ItemOffset
        OutputHeader(i) = InputHeader(i)
    Next i
    
    'raw content
    OutputHeader(1 + ItemOffset) = "MPS_wbR"
    OutputHeader(2 + ItemOffset) = "MPS_spR"
    OutputHeader(3 + ItemOffset) = "MPS_acR"
    OutputHeader(4 + ItemOffset) = "MPS_scR"
    OutputHeader(5 + ItemOffset) = "MPS_srR"
    OutputHeader(6 + ItemOffset) = "MPS_alR"
    OutputHeader(7 + ItemOffset) = "MPS_agR"
    OutputHeader(8 + ItemOffset) = "MPS_clR"
    OutputHeader(9 + ItemOffset) = "MPS_haR"
    OutputHeader(10 + ItemOffset) = "MPS_tdR"
    OutputHeader(11 + ItemOffset) = "MPS_abR"
    
    'broad trait
    OutputHeader(12 + ItemOffset) = "MPS_PER"
    OutputHeader(13 + ItemOffset) = "MPS_NER"
    OutputHeader(14 + ItemOffset) = "MPS_COR"
    OutputHeader(15 + ItemOffset) = "MPS_PGR"
    OutputHeader(16 + ItemOffset) = "MPS_PCR"
    OutputHeader(17 + ItemOffset) = "MPS_NGR"
    OutputHeader(18 + ItemOffset) = "MPS_NLR"
    
    'validity
    OutputHeader(19 + ItemOffset) = "MPS_uvR"
    OutputHeader(20 + ItemOffset) = "MPS_vrR"
    OutputHeader(21 + ItemOffset) = "MPS_trR"
    
    'T content
    OutputHeader(22 + ItemOffset) = "MPS_wbT"
    OutputHeader(23 + ItemOffset) = "MPS_spT"
    OutputHeader(24 + ItemOffset) = "MPS_acT"
    OutputHeader(25 + ItemOffset) = "MPS_scT"
    OutputHeader(26 + ItemOffset) = "MPS_srT"
    OutputHeader(27 + ItemOffset) = "MPS_alT"
    OutputHeader(28 + ItemOffset) = "MPS_agT"
    OutputHeader(29 + ItemOffset) = "MPS_clT"
    OutputHeader(30 + ItemOffset) = "MPS_haT"
    OutputHeader(31 + ItemOffset) = "MPS_tdT"
    OutputHeader(32 + ItemOffset) = "MPS_abT"
     
    'T broad trait
    OutputHeader(33 + ItemOffset) = "MPS_PET"
    OutputHeader(34 + ItemOffset) = "MPS_NET"
    OutputHeader(35 + ItemOffset) = "MPS_COT"
    OutputHeader(36 + ItemOffset) = "MPS_PGT"
    OutputHeader(37 + ItemOffset) = "MPS_PCT"
    OutputHeader(38 + ItemOffset) = "MPS_NGT"
    OutputHeader(39 + ItemOffset) = "MPS_NLT"
    
    'T validity
    OutputHeader(40 + ItemOffset) = "MPS_uvT"
    OutputHeader(41 + ItemOffset) = "MPS_vrT"
    OutputHeader(42 + ItemOffset) = "MPS_trT"
    OutputHeader(43 + ItemOffset) = "MPS_inv"
    
    PrintOneRecord OutFileHandle, OutputHeader()

End Sub

Sub TransferOffsetData()
    Dim i As Integer
    ReDim ScoreArray(0 To 43 + ItemOffset)
    ScoreArray(0) = 43 + ItemOffset
    
    For i = 1 To ItemOffset
        ScoreArray(i) = ItemArray(i)
    Next i

End Sub

Sub ResetMissCount()
    NumMissItems = 0
End Sub

Function NotMissing(Itemnumber As Integer) As Boolean
    
    Dim Valid As Boolean
    If ItemArray(Itemnumber + ItemOffset) = MVC Then
        Valid = False
    Else
        Valid = True
    End If
    
    NotMissing = Valid

End Function
Function Missing(Itemnumber As Integer) As Boolean
    
    Dim Miss As Boolean
    If ItemArray(Itemnumber + ItemOffset) = MVC Then
        Miss = True
    Else
        Miss = False
    End If
    
    Missing = Miss

End Function

Function GIV(Itemnumber As Integer, Optional Reverse As Boolean = False) As Integer
    Dim ItemValue As Integer
    
    If Reverse Then
        Select Case ItemArray(Itemnumber + ItemOffset)
            Case TrueValue
                ItemValue = 0
            Case FalseValue
                ItemValue = 1
            Case MVC
                ItemValue = 0
                NumMissItems = NumMissItems + 1
            Case Else
                MsgBox "Invalid Item Value: " & ItemArray(Itemnumber + ItemOffset)
                ItemValue = 0
                NumMissItems = NumMissItems + 1
        End Select
    Else
        Select Case ItemArray(Itemnumber + ItemOffset)
            Case TrueValue
                ItemValue = 1
            Case FalseValue
                ItemValue = 0
            Case MVC
                ItemValue = 0
                NumMissItems = NumMissItems + 1
            Case Else
                MsgBox "Invalid Item Value: " & ItemArray(Itemnumber + ItemOffset)
                ItemValue = 0
                NumMissItems = NumMissItems + 1
        End Select
    End If

    GIV = ItemValue
End Function

Function Prorate(Score, TotalItems) As Double
    Dim ProScore As Double
    
    If 100 * (NumMissItems / TotalItems) > MaxMissPercent Then
        ProScore = MVC
        ScaleMiss = True    'will not calculate broad trait
    Else
        ProScore = (Score / (TotalItems - NumMissItems)) * TotalItems
    End If
    
    Prorate = ProScore
    
End Function

Sub CalcWBR()
    ResetMissCount
    WBR = GIV(1) + GIV(26) + GIV(38) + GIV(50) + _
          GIV(62) + GIV(74) + GIV(85) + GIV(97) + _
          GIV(109) + GIV(121) + GIV(133) + GIV(144)
            
    WBR = Prorate(WBR, 12)
       
    WBR = CInt(WBR)
    ScoreArray(1 + ItemOffset) = WBR
End Sub

Sub CalcSPR()
    ResetMissCount
    SPR = GIV(2) + GIV(15) + GIV(39) + GIV(51) + _
          GIV(75) + GIV(87) + GIV(110) + GIV(63, True) + _
          GIV(98, True) + GIV(122, True) + GIV(134, True) + GIV(145, True)
            
    SPR = Prorate(SPR, 12)
    
    SPR = CInt(SPR)
    ScoreArray(2 + ItemOffset) = SPR
End Sub

Sub CalcACR()
    ResetMissCount
    ACR = GIV(3) + GIV(16) + GIV(27) + GIV(52) + _
          GIV(76) + GIV(88) + GIV(111) + GIV(123) + _
          GIV(135) + GIV(146) + GIV(64, True) + GIV(99, True)
            
    ACR = Prorate(ACR, 12)
    
    ACR = CInt(ACR)
    ScoreArray(3 + ItemOffset) = ACR
End Sub

Sub CalcSCR()
    ResetMissCount
    SCR = GIV(5) + GIV(17) + GIV(40) + GIV(77) + GIV(112) + _
          GIV(28, True) + GIV(65, True) + GIV(89, True) + _
          GIV(100, True) + GIV(124, True) + GIV(136, True) + GIV(148, True)
            
    SCR = Prorate(SCR, 12)
    
    SCR = CInt(SCR)
    ScoreArray(4 + ItemOffset) = SCR
End Sub

Sub CalcSRR()
    ResetMissCount
    SRR = GIV(6) + GIV(18) + GIV(29) + GIV(41) + _
          GIV(53) + GIV(78) + GIV(90) + GIV(101) + _
          GIV(113) + GIV(125) + GIV(137) + GIV(149)
            
    SRR = Prorate(SRR, 12)
    
    SRR = CInt(SRR)
    ScoreArray(5 + ItemOffset) = SRR
End Sub

Sub CalcALR()
    ResetMissCount
    ALR = GIV(7) + GIV(19) + GIV(30) + GIV(42) + _
          GIV(54) + GIV(66) + GIV(91) + GIV(102) + _
          GIV(114) + GIV(126) + GIV(138) + GIV(150)
            
    ALR = Prorate(ALR, 12)
    
    ALR = CInt(ALR)
    ScoreArray(6 + ItemOffset) = ALR
End Sub

Sub CalcAGR()
    ResetMissCount
    AGR = GIV(8) + GIV(20) + GIV(31) + GIV(43) + _
          GIV(55) + GIV(67) + GIV(103) + GIV(115) + _
          GIV(127) + GIV(139) + GIV(151) + GIV(79, True)
            
    AGR = Prorate(AGR, 12)
    
    AGR = CInt(AGR)
    ScoreArray(7 + ItemOffset) = AGR
End Sub

Sub CalcCLR()
    ResetMissCount
    CLR = GIV(9) + GIV(44) + GIV(56) + GIV(68) + _
          GIV(92) + GIV(116) + GIV(128) + GIV(140) + _
          GIV(21, True) + GIV(33, True) + GIV(80, True) + GIV(152, True)
            
    CLR = Prorate(CLR, 12)
    
    CLR = CInt(CLR)
    ScoreArray(8 + ItemOffset) = CLR
End Sub

Sub CalcHAR()
    ResetMissCount
    HAR = GIV(34) + GIV(69) + GIV(81) + GIV(93) + _
          GIV(105) + GIV(129) + GIV(11, True) + GIV(22, True) + _
          GIV(46, True) + GIV(57, True) + GIV(141, True) + GIV(153, True)
            
    HAR = Prorate(HAR, 12)
    
    HAR = CInt(HAR)
    ScoreArray(9 + ItemOffset) = HAR
End Sub

Sub CalcTDR()
    ResetMissCount
    TDR = GIV(12) + GIV(23) + GIV(35) + GIV(58) + _
          GIV(70) + GIV(82) + GIV(94) + GIV(106) + _
          GIV(142) + GIV(154) + GIV(47, True) + GIV(118, True)
            
    TDR = Prorate(TDR, 12)
    
    TDR = CInt(TDR)
    ScoreArray(10 + ItemOffset) = TDR
End Sub

Sub CalcABR()
    ResetMissCount
    ABR = GIV(13) + GIV(24) + GIV(36) + GIV(48) + _
          GIV(59) + GIV(71) + GIV(83) + GIV(95) + _
          GIV(107) + GIV(119) + GIV(130) + GIV(155)
            
    ABR = Prorate(ABR, 12)
    
    ABR = CInt(ABR)
    ScoreArray(11 + ItemOffset) = ABR
End Sub

Sub CalcBT()
    If ScaleMiss Then
        PEM = MVC
        NEM = MVC
        CON = MVC
        PAG = MVC
        PCO = MVC
        NAG = MVC
        NAL = MVC
    Else
        PEM = CInt(1.933 * WBR + 1.669 * SPR + 1.671 * ACR + 1.95 * SCR + _
              0.085 * SRR + 0.292 * ALR + 0.13 * AGR + 0.048 * CLR + _
              0.015 * HAR + 0.07 * TDR + 13.712)
              
        NEM = CInt(0.127 * WBR + 0.15 * SPR + 0.038 * ACR + 0.279 * SCR + _
              1.904 * SRR + 3.061 * ALR + 2.551 * AGR + 0.045 * CLR + _
              0.126 * HAR + 0.147 * TDR + 6.27)
              
        CON = CInt(-0.085 * WBR + -0.052 * SPR + 0.241 * ACR + -0.068 * SCR + _
              0.046 * SRR + -0.302 * ALR + 0.296 * AGR + 2.717 * CLR + _
              2.579 * HAR + 2.199 * TDR + 20.742)
              
        PAG = CInt(1.529 * WBR + 1.294 * SPR + 3.211 * ACR + -0.317 * SCR + _
              -0.112 * SRR + -0.085 * ALR + 0.063 * AGR + 0.154 * CLR + _
              -0.186 * HAR + 0.02 * TDR + 18.448)
              
        PCO = CInt(1.582 * WBR + 1.387 * SPR + -0.51 * ACR + 3.411 * SCR + _
               0.048 * SRR + 0.017 * ALR + 0.059 * AGR + -0.068 * CLR + _
               0.205 * HAR + 0.097 * TDR + 16.804)
               
        NAG = CInt(0.042 * WBR + 0.111 * SPR - 0.036 * ACR + -0.07 * SCR + _
              1.721 * SRR + -0.885 * ALR + 5.26 * AGR + 0.106 * CLR + _
              0.13 * HAR + 0.057 * TDR + 22.739)
                
        NAL = CInt(-0.043 * WBR + -0.072 * SPR + 0.059 * ACR + 0.206 * SCR + _
               1.389 * SRR + 5.398 * ALR + -0.695 * AGR + -0.114 * CLR + _
               -0.025 * HAR + 0.089 * TDR + 20.341)
    End If
    
    ScoreArray(12 + ItemOffset) = PEM
    ScoreArray(13 + ItemOffset) = NEM
    ScoreArray(14 + ItemOffset) = CON
    ScoreArray(15 + ItemOffset) = PAG
    ScoreArray(16 + ItemOffset) = PCO
    ScoreArray(17 + ItemOffset) = NAG
    ScoreArray(18 + ItemOffset) = NAL
    

End Sub

Sub CalcUVR()
    ResetMissCount
    UVR = GIV(25) + GIV(49) + GIV(72) + GIV(96) + _
          GIV(120) + GIV(143) + GIV(147) + GIV(4, True) + _
          GIV(14, True) + GIV(37, True) + GIV(61, True) + GIV(84, True) + _
          GIV(108, True) + GIV(131, True)
            
    UVR = Prorate(UVR, 14)
    
    UVR = CInt(UVR)
    ScoreArray(19 + ItemOffset) = UVR
End Sub



Sub CalcVRR()
        VRR = 0
        
        If (NotMissing(5) And NotMissing(112) And (GIV(5) <> GIV(112))) Then VRR = VRR + 1
        If (NotMissing(20) And NotMissing(139) And (GIV(20) <> GIV(139))) Then VRR = VRR + 1
        If (NotMissing(44) And NotMissing(140) And (GIV(44) <> GIV(140))) Then VRR = VRR + 1
        If (NotMissing(2) And NotMissing(110) And (GIV(2) <> GIV(110))) Then VRR = VRR + 1
        If (NotMissing(88) And NotMissing(135) And (GIV(88) <> GIV(135))) Then VRR = VRR + 1
        If (NotMissing(51) And NotMissing(45) And (GIV(51) <> GIV(45))) Then VRR = VRR + 1
        If (NotMissing(29) And NotMissing(10) And (GIV(29) <> GIV(10))) Then VRR = VRR + 1
        If (NotMissing(6) And NotMissing(90) And (GIV(6) = 1) And (GIV(90) = 0)) Then VRR = VRR + 1
        If (NotMissing(76) And NotMissing(146) And (GIV(76) = 1) And (GIV(146) = 0)) Then VRR = VRR + 1
        If (NotMissing(38) And NotMissing(109) And (GIV(38) = 0) And (GIV(109) = 1)) Then VRR = VRR + 1
        If (NotMissing(30) And NotMissing(91) And (GIV(30) = 0) And (GIV(91) = 1)) Then VRR = VRR + 1
        If (NotMissing(82) And NotMissing(142) And (GIV(82) = 1) And (GIV(142) = 0)) Then VRR = VRR + 1
        If (NotMissing(33) And NotMissing(152) And (GIV(33) = 0) And (GIV(152) = 1)) Then VRR = VRR + 1
        If (NotMissing(50) And NotMissing(62) And (GIV(50) = 1) And (GIV(62) = 0)) Then VRR = VRR + 1
        If (NotMissing(28) And NotMissing(136) And (GIV(28) = 1) And (GIV(136) = 0)) Then VRR = VRR + 1
        If (NotMissing(52) And NotMissing(111) And (GIV(52) = 0) And (GIV(111) = 1)) Then VRR = VRR + 1
        If (NotMissing(65) And NotMissing(148) And (GIV(65) = 0) And (GIV(148) = 1)) Then VRR = VRR + 1
        If (NotMissing(71) And NotMissing(130) And (GIV(71) = 0) And (GIV(130) = 1)) Then VRR = VRR + 1
        If (NotMissing(85) And NotMissing(144) And (GIV(85) = 0) And (GIV(144) = 1)) Then VRR = VRR + 1
        If (NotMissing(132) And NotMissing(53) And (GIV(132) = 0) And (GIV(53) = 1)) Then VRR = VRR + 1
        If (NotMissing(15) And NotMissing(117) And (GIV(15) = 0) And (GIV(117) = 1)) Then VRR = VRR + 1

        'handle counting missing pairs so can prorate.
        'two types of decisions.  1) for not equal item pairs, pair is missing if either
        'item is missing.  2) for specific value pairs, pair is missing if both missing, or if single missing
        'item is equal to target value.  (i.e., for 6, 90 pair, if 6 missing and 90 =0, then missing.  However,
        'if 6 is missing and 90 = 1, pair is not missing b/c couldnt get a point.)
        
        Dim VRINMiss As Integer
        VRINMiss = 0
        
        'type 1
        If (Missing(5) Or Missing(112)) Then VRINMiss = VRINMiss + 1
        If (Missing(20) Or Missing(139)) Then VRINMiss = VRINMiss + 1
        If (Missing(44) Or Missing(140)) Then VRINMiss = VRINMiss + 1
        If (Missing(2) Or Missing(110)) Then VRINMiss = VRINMiss + 1
        If (Missing(88) Or Missing(135)) Then VRINMiss = VRINMiss + 1
        If (Missing(51) Or Missing(45)) Then VRINMiss = VRINMiss + 1
        If (Missing(29) Or Missing(10)) Then VRINMiss = VRINMiss + 1

        'type 2
        If ((Missing(6) And Missing(90)) Or ((GIV(6) = 1) And (Missing(90))) Or ((GIV(90) = 0) And (Missing(6)))) Then
            VRINMiss = VRINMiss + 1
        End If
        If ((Missing(76) And Missing(146)) Or ((GIV(76) = 1) And (Missing(146))) Or ((GIV(146) = 0) And (Missing(76)))) Then
            VRINMiss = VRINMiss + 1
        End If
        If ((Missing(38) And Missing(109)) Or ((GIV(38) = 0) And (Missing(109))) Or ((GIV(109) = 1) And (Missing(38)))) Then
            VRINMiss = VRINMiss + 1
        End If
        If ((Missing(30) And Missing(91)) Or ((GIV(30) = 0) And (Missing(30))) Or ((GIV(91) = 1) And (Missing(30)))) Then
            VRINMiss = VRINMiss + 1
        End If
        If ((Missing(82) And Missing(142)) Or ((GIV(82) = 1) And (Missing(142))) Or ((GIV(142) = 0) And (Missing(82)))) Then
            VRINMiss = VRINMiss + 1
        End If
        If ((Missing(33) And Missing(152)) Or ((GIV(33) = 0) And (Missing(152))) Or ((GIV(152) = 1) And (Missing(33)))) Then
            VRINMiss = VRINMiss + 1
        End If
        If ((Missing(50) And Missing(62)) Or ((GIV(50) = 1) And (Missing(62))) Or ((GIV(62) = 0) And (Missing(50)))) Then
            VRINMiss = VRINMiss + 1
        End If
        If ((Missing(28) And Missing(136)) Or ((GIV(28) = 1) And (Missing(136))) Or ((GIV(136) = 0) And (Missing(28)))) Then
            VRINMiss = VRINMiss + 1
        End If
        If ((Missing(52) And Missing(111)) Or ((GIV(52) = 0) And (Missing(111))) Or ((GIV(111) = 1) And (Missing(52)))) Then
            VRINMiss = VRINMiss + 1
        End If
        If ((Missing(65) And Missing(148)) Or ((GIV(65) = 0) And (Missing(148))) Or ((GIV(148) = 1) And (Missing(65)))) Then
            VRINMiss = VRINMiss + 1
        End If
        If ((Missing(71) And Missing(130)) Or ((GIV(71) = 0) And (Missing(130))) Or ((GIV(130) = 1) And (Missing(71)))) Then
            VRINMiss = VRINMiss + 1
        End If
        If ((Missing(85) And Missing(144)) Or ((GIV(85) = 0) And (Missing(144))) Or ((GIV(144) = 1) And (Missing(85)))) Then
            VRINMiss = VRINMiss + 1
        End If
        If ((Missing(132) And Missing(53)) Or ((GIV(132) = 0) And (Missing(53))) Or ((GIV(53) = 1) And (Missing(132)))) Then
            VRINMiss = VRINMiss + 1
        End If
        If ((Missing(15) And Missing(117)) Or ((GIV(15) = 0) And (Missing(117))) Or ((GIV(117) = 1) And (Missing(15)))) Then
            VRINMiss = VRINMiss + 1
        End If

        If ((VRINMiss / 21) > (MaxMissPercent / 100)) Then
              VRR = MVC
        Else            'prorate for missing item pairs
              VRR = VRR * (21 / (21 - VRINMiss))
              VRR = CInt(VRR)
        End If
        
        ScoreArray(20 + ItemOffset) = VRR

End Sub

Sub CalcTRR()

    'scoring system for TRIN
    'if both items in pair are not missing and both are true, give a point
    'if both items in pair are not missing and both are false, subtract a point

    'Scoring true pairs
        Dim TRINTrue As Integer
        TRINTrue = 0
        If (NotMissing(28) And NotMissing(112) And (GIV(28) = 1) And (GIV(112) = 1)) Then TRINTrue = TRINTrue + 1
        If (NotMissing(52) And NotMissing(64) And (GIV(52) = 1) And (GIV(64) = 1)) Then TRINTrue = TRINTrue + 1
        If (NotMissing(70) And NotMissing(118) And (GIV(70) = 1) And (GIV(118) = 1)) Then TRINTrue = TRINTrue + 1
        If (NotMissing(99) And NotMissing(146) And (GIV(99) = 1) And (GIV(146) = 1)) Then TRINTrue = TRINTrue + 1
        If (NotMissing(5) And NotMissing(136) And (GIV(5) = 1) And (GIV(136) = 1)) Then TRINTrue = TRINTrue + 1
        If (NotMissing(20) And NotMissing(79) And (GIV(20) = 1) And (GIV(79) = 1)) Then TRINTrue = TRINTrue + 1
        If (NotMissing(15) And NotMissing(98) And (GIV(15) = 1) And (GIV(98) = 1)) Then TRINTrue = TRINTrue + 1
        If (NotMissing(110) And NotMissing(145) And (GIV(110) = 1) And (GIV(145) = 1)) Then TRINTrue = TRINTrue + 1

    'count missing true pairs.  Pair is missing if a) both items are missing, or
    'b) one item missing, other item is true.  If one missing and other is false
     'then it is not considered missing b/c we know that it couldnt have been a true/true pair
       Dim MissTrue As Integer
       MissTrue = 0
       
        If ((Missing(28) And Missing(112)) Or (Missing(28) And GIV(112) = 1) Or (Missing(112) And GIV(28) = 1)) Then
            MissTrue = MissTrue + 1
        End If
        If ((Missing(52) And Missing(64)) Or (Missing(52) And GIV(64) = 1) Or (Missing(64) And GIV(52) = 1)) Then
            MissTrue = MissTrue + 1
        End If
        If ((Missing(70) And Missing(118)) Or (Missing(70) And GIV(118) = 1) Or (Missing(118) And GIV(70) = 1)) Then
            MissTrue = MissTrue + 1
        End If
        If ((Missing(99) And Missing(146)) Or (Missing(99) And GIV(146) = 1) Or (Missing(146) And GIV(99) = 1)) Then
            MissTrue = MissTrue + 1
        End If
        If ((Missing(5) And Missing(136)) Or (Missing(5) And GIV(136) = 1) Or (Missing(136) And GIV(5) = 1)) Then
            MissTrue = MissTrue + 1
        End If
        If ((Missing(20) And Missing(79)) Or (Missing(20) And GIV(79) = 1) Or (Missing(79) And GIV(20) = 1)) Then
            MissTrue = MissTrue + 1
        End If
        If ((Missing(15) And Missing(98)) Or (Missing(15) And GIV(98) = 1) Or (Missing(98) And GIV(15) = 1)) Then
            MissTrue = MissTrue + 1
        End If
        If ((Missing(110) And Missing(145)) Or (Missing(110) And GIV(145) = 1) Or (Missing(145) And GIV(110) = 1)) Then
            MissTrue = MissTrue + 1
        End If

        'prorate true pair score
        TRINTrue = TRINTrue * (8 / (8 - MissTrue))

        'Scoring false pairs
        Dim TRINFalse As Integer
        TRINFalse = 0
        
        If (NotMissing(51) And NotMissing(63) And (GIV(51) = 0) And (GIV(63) = 0)) Then
            TRINFalse = TRINFalse + 1
        End If
        If (NotMissing(40) And NotMissing(148) And (GIV(40) = 0) And (GIV(148) = 0)) Then
            TRINFalse = TRINFalse + 1
        End If
        If (NotMissing(69) And NotMissing(46) And (GIV(69) = 0) And (GIV(46) = 0)) Then
            TRINFalse = TRINFalse + 1
        End If
        If (NotMissing(80) And NotMissing(140) And (GIV(80) = 0) And (GIV(140) = 0)) Then
            TRINFalse = TRINFalse + 1
        End If
        If (NotMissing(5) And NotMissing(136) And (GIV(5) = 0) And (GIV(136) = 0)) Then
            TRINFalse = TRINFalse + 1
        End If
        If (NotMissing(20) And NotMissing(79) And (GIV(20) = 0) And (GIV(79) = 0)) Then
            TRINFalse = TRINFalse + 1
        End If
        If (NotMissing(15) And NotMissing(98) And (GIV(15) = 0) And (GIV(98) = 0)) Then
            TRINFalse = TRINFalse + 1
        End If
        If (NotMissing(110) And NotMissing(145) And (GIV(110) = 0) And (GIV(145) = 0)) Then
            TRINFalse = TRINFalse + 1
        End If
        If (NotMissing(132) And NotMissing(60) And (GIV(132) = 0) And (GIV(60) = 0)) Then
            TRINFalse = TRINFalse + 1
        End If
        If (NotMissing(86) And NotMissing(9) And (GIV(86) = 0) And (GIV(9) = 0)) Then
            TRINFalse = TRINFalse + 1
        End If
        If (NotMissing(30) And NotMissing(73) And (GIV(30) = 0) And (GIV(73) = 0)) Then
            TRINFalse = TRINFalse + 1
        End If
        If (NotMissing(32) And NotMissing(104) And (GIV(32) = 0) And (GIV(104) = 0)) Then
            TRINFalse = TRINFalse + 1
        End If

        'count missing falsepairs.  Pair is missing if a) both items are missing, or
        'b) one item missing, other item false. If one missing and other is true
        'then it is not considered missing b/c we know that it couldnt have been a false/false pair
        Dim MISSFalse As Integer
        MISSFalse = 0
        
        If ((Missing(51) And Missing(63)) Or (Missing(51) And GIV(63) = 0) Or (Missing(63) And GIV(51) = 0)) Then
            MISSFalse = MISSFalse + 1
        End If
        If ((Missing(40) And Missing(148)) Or (Missing(40) And GIV(148) = 0) Or (Missing(148) And GIV(40) = 0)) Then
            MISSFalse = MISSFalse + 1
        End If
        If ((Missing(69) And Missing(46)) Or (Missing(69) And GIV(46) = 0) Or (Missing(46) And GIV(69) = 0)) Then
            MISSFalse = MISSFalse + 1
        End If
        If ((Missing(80) And Missing(140)) Or (Missing(80) And GIV(140) = 0) Or (Missing(140) And GIV(80) = 0)) Then
            MISSFalse = MISSFalse + 1
        End If
        If ((Missing(5) And Missing(136)) Or (Missing(5) And GIV(136) = 0) Or (Missing(136) And GIV(5) = 0)) Then
            MISSFalse = MISSFalse + 1
        End If
        If ((Missing(20) And Missing(79)) Or (Missing(20) And GIV(79) = 0) Or (Missing(79) And GIV(20) = 0)) Then
            MISSFalse = MISSFalse + 1
        End If
        If ((Missing(15) And Missing(98)) Or (Missing(15) And GIV(98) = 0) Or (Missing(98) And GIV(15) = 0)) Then
            MISSFalse = MISSFalse + 1
        End If
        If ((Missing(110) And Missing(145)) Or (Missing(110) And GIV(145) = 0) Or (Missing(145) And GIV(110) = 0)) Then
            MISSFalse = MISSFalse + 1
        End If
        If ((Missing(132) And Missing(60)) Or (Missing(132) And GIV(60) = 0) Or (Missing(60) And GIV(132) = 0)) Then
            MISSFalse = MISSFalse + 1
        End If
        If ((Missing(86) And Missing(9)) Or (Missing(86) And GIV(9) = 0) Or (Missing(9) And GIV(86) = 0)) Then
            MISSFalse = MISSFalse + 1
        End If
        If ((Missing(30) And Missing(73)) Or (Missing(30) And GIV(73) = 0) Or (Missing(73) And GIV(30) = 0)) Then
            MISSFalse = MISSFalse + 1
        End If
        If ((Missing(32) And Missing(104)) Or (Missing(32) And GIV(104) = 0) Or (Missing(104) And GIV(32) = 0)) Then
            MISSFalse = MISSFalse + 1
        End If

        'prorate false pair score for missing pairs
        TRINFalse = TRINFalse * (12 / (12 - MISSFalse))

        'score total TRIN
        If ((MissTrue / 8 <= (MaxMissPercent / 100)) And (MISSFalse / 12 <= MaxMissPercent / 100)) Then 'make sure not too many missing pairs
             TRR = TRINTrue - TRINFalse + 12 'TRINTRUE are cancelled by TRINFALSE
             TRR = CInt(TRR)                 '+12 to make min score of 0
        Else
             TRR = MVC
        End If

        ScoreArray(21 + ItemOffset) = TRR
End Sub
Sub CalcWBT()
    Select Case WBR
        Case 0
            WBT = 22
        Case 1
            WBT = 27
        Case 2
            WBT = 31
        Case 3
            WBT = 34
        Case 4
            WBT = 36
        Case 5
            WBT = 38
        Case 6
            WBT = 41
        Case 7
            WBT = 43
        Case 8
            WBT = 46
        Case 9
            WBT = 49
        Case 10
            WBT = 53
        Case 11
            WBT = 57
        Case 12
            WBT = 64
        Case Else
            WBT = MVC
    End Select
    ScoreArray(22 + ItemOffset) = WBT
End Sub

Sub CalcSPT()
    Select Case SPR
        Case 0
            SPT = 34
        Case 1
            SPT = 41
        Case 2
            SPT = 45
        Case 3
            SPT = 47
        Case 4
            SPT = 49
        Case 5
            SPT = 51
        Case 6
            SPT = 53
        Case 7
            SPT = 56
        Case 8
            SPT = 57
        Case 9
            SPT = 60
        Case 10
            SPT = 62
        Case 11
            SPT = 66
        Case 12
            SPT = 71
        Case Else
            SPT = MVC
    End Select
    ScoreArray(23 + ItemOffset) = SPT
End Sub

Sub CalcACT()
    Select Case ACR
        Case 0
            ACT = 27
        Case 1
            ACT = 31
        Case 2
            ACT = 35
        Case 3
            ACT = 39
        Case 4
            ACT = 42
        Case 5
            ACT = 44
        Case 6
            ACT = 47
        Case 7
            ACT = 50
        Case 8
            ACT = 53
        Case 9
            ACT = 55
        Case 10
            ACT = 58
        Case 11
            ACT = 62
        Case 12
            ACT = 69
        Case Else
            ACT = MVC
    End Select
    ScoreArray(24 + ItemOffset) = ACT
End Sub

Sub CalcSCT()
    Select Case SCR
        Case 0
            SCT = 27
        Case 1
            SCT = 29
        Case 2
            SCT = 34
        Case 3
            SCT = 37
        Case 4
            SCT = 40
        Case 5
            SCT = 42
        Case 6
            SCT = 44
        Case 7
            SCT = 47
        Case 8
            SCT = 49
        Case 9
            SCT = 52
        Case 10
            SCT = 55
        Case 11
            SCT = 60
        Case 12
            SCT = 66
        Case Else
            SCT = MVC
    End Select
    ScoreArray(25 + ItemOffset) = SCT
End Sub

Sub CalcSRT()
    Select Case SRR
        Case 0
            SRT = 31
        Case 1
            SRT = 37
        Case 2
            SRT = 41
        Case 3
            SRT = 44
        Case 4
            SRT = 47
        Case 5
            SRT = 49
        Case 6
            SRT = 51
        Case 7
            SRT = 53
        Case 8
            SRT = 56
        Case 9
            SRT = 58
        Case 10
            SRT = 61
        Case 11
            SRT = 65
        Case 12
            SRT = 71
        Case Else
            SRT = MVC
    End Select
    ScoreArray(26 + ItemOffset) = SRT
End Sub

Sub CalcAlT()
    Select Case ALR
        Case 0
            ALT = 43
        Case 1
            ALT = 52
        Case 2
            ALT = 56
        Case 3
            ALT = 59
        Case 4
            ALT = 62
        Case 5
            ALT = 64
        Case 6
            ALT = 66
        Case 7
            ALT = 66
        Case 8
            ALT = 68
        Case 9
            ALT = 69
        Case 10
            ALT = 73
        Case 11
            ALT = 78
        Case 12
            ALT = 78
        Case Else
            ALT = MVC
    End Select
    ScoreArray(27 + ItemOffset) = ALT
End Sub

Sub CalcAGT()
    Select Case AGR
        Case 0
            AGT = 38
        Case 1
            AGT = 46
        Case 2
            AGT = 51
        Case 3
            AGT = 54
        Case 4
            AGT = 57
        Case 5
            AGT = 60
        Case 6
            AGT = 63
        Case 7
            AGT = 66
        Case 8
            AGT = 68
        Case 9
            AGT = 71
        Case 10
            AGT = 73
        Case 11
            AGT = 78
        Case 12
            AGT = 78
        Case Else
            AGT = MVC
    End Select
    ScoreArray(28 + ItemOffset) = AGT
End Sub

Sub CalcCLT()
    Select Case CLR
        Case 0
            CLT = 22
        Case 1
            CLT = 27
        Case 2
            CLT = 29
        Case 3
            CLT = 32
        Case 4
            CLT = 34
        Case 5
            CLT = 38
        Case 6
            CLT = 40
        Case 7
            CLT = 44
        Case 8
            CLT = 46
        Case 9
            CLT = 50
        Case 10
            CLT = 54
        Case 11
            CLT = 59
        Case 12
            CLT = 66
        Case Else
            CLT = MVC
    End Select
    ScoreArray(29 + ItemOffset) = CLT
End Sub

Sub CalcHAT()
    Select Case HAR
        Case 0
            HAT = 22
        Case 1
            HAT = 27
        Case 2
            HAT = 29
        Case 3
            HAT = 32
        Case 4
            HAT = 36
        Case 5
            HAT = 38
        Case 6
            HAT = 41
        Case 7
            HAT = 44
        Case 8
            HAT = 46
        Case 9
            HAT = 49
        Case 10
            HAT = 52
        Case 11
            HAT = 57
        Case 12
            HAT = 63
        Case Else
            HAT = MVC
    End Select
    ScoreArray(30 + ItemOffset) = HAT
End Sub

Sub CalcTDT()
    Select Case TDR
        Case 0
            TDT = 22
        Case 1
            TDT = 27
        Case 2
            TDT = 32
        Case 3
            TDT = 34
        Case 4
            TDT = 37
        Case 5
            TDT = 40
        Case 6
            TDT = 42
        Case 7
            TDT = 45
        Case 8
            TDT = 48
        Case 9
            TDT = 51
        Case 10
            TDT = 54
        Case 11
            TDT = 59
        Case 12
            TDT = 66
        Case Else
            TDT = MVC
    End Select
    ScoreArray(31 + ItemOffset) = TDT
End Sub

Sub CalcABT()
    Select Case ABR
        Case 0
            ABT = 29
        Case 1
            ABT = 35
        Case 2
            ABT = 39
        Case 3
            ABT = 43
        Case 4
            ABT = 46
        Case 5
            ABT = 49
        Case 6
            ABT = 52
        Case 7
            ABT = 55
        Case 8
            ABT = 57
        Case 9
            ABT = 60
        Case 10
            ABT = 63
        Case 11
            ABT = 66
        Case 12
            ABT = 73
        Case Else
            ABT = MVC
    End Select
    ScoreArray(32 + ItemOffset) = ABT
End Sub

Sub CalcPEMT()
    Select Case PEM
    
    Case MVC
        PEMT = MVC
    Case Is < 32
        PEMT = 22
    Case Is > 97
        PEMT = 78
    Case 32
        PEMT = 27
    Case 33
        PEMT = 27
    Case 34
        PEMT = 27
    Case 35
        PEMT = 27
    Case 36
        PEMT = 29
    Case 37
        PEMT = 29
    Case 38
        PEMT = 31
    Case 39
        PEMT = 31
    Case 40
        PEMT = 31
    Case 41
        PEMT = 32
    Case 42
        PEMT = 34
    Case 43
        PEMT = 34
    Case 44
        PEMT = 34
    Case 45
        PEMT = 35
    Case 46
        PEMT = 35
    Case 47
        PEMT = 36
    Case 48
        PEMT = 37
    Case 49
        PEMT = 38
    Case 50
        PEMT = 38
    Case 51
        PEMT = 39
    Case 52
        PEMT = 40
    Case 53
        PEMT = 41
    Case 54
        PEMT = 42
    Case 55
        PEMT = 42
    Case 56
        PEMT = 43
    Case 57
        PEMT = 43
    Case 58
        PEMT = 44
    Case 59
        PEMT = 44
    Case 60
        PEMT = 45
    Case 61
        PEMT = 46
    Case 62
        PEMT = 46
    Case 63
        PEMT = 47
    Case 64
        PEMT = 47
    Case 65
        PEMT = 48
    Case 66
        PEMT = 49
    Case 67
        PEMT = 50
    Case 68
        PEMT = 50
    Case 69
        PEMT = 51
    Case 70
        PEMT = 51
    Case 71
        PEMT = 52
    Case 72
        PEMT = 53
    Case 73
        PEMT = 53
    Case 74
        PEMT = 54
    Case 75
        PEMT = 54
    Case 76
        PEMT = 55
    Case 77
        PEMT = 56
    Case 78
        PEMT = 56
    Case 79
        PEMT = 57
    Case 80
        PEMT = 58
    Case 81
        PEMT = 58
    Case 82
        PEMT = 59
    Case 83
        PEMT = 60
    Case 84
        PEMT = 60
    Case 85
        PEMT = 61
    Case 86
        PEMT = 62
    Case 87
        PEMT = 63
    Case 88
        PEMT = 64
    Case 89
        PEMT = 66
    Case 90
        PEMT = 66
    Case 91
        PEMT = 66
    Case 92
        PEMT = 68
    Case 93
        PEMT = 69
    Case 94
        PEMT = 69
    Case 95
        PEMT = 71
    Case 96
        PEMT = 73
    Case 97
        PEMT = 73
    End Select
    ScoreArray(33 + ItemOffset) = PEMT
End Sub

Sub CalcNEMT()
    Select Case NEM
    Case MVC
        NEMT = NEM
    Case Is < 13
        NEMT = 22
    Case Is > 86
        NEMT = 78
    Case 13
        NEMT = 27
    Case 14
        NEMT = 29
    Case 15
        NEMT = 31
    Case 16
        NEMT = 34
    Case 17
        NEMT = 34
    Case 18
        NEMT = 36
    Case 19
        NEMT = 38
    Case 20
        NEMT = 39
    Case 21
        NEMT = 40
    Case 22
        NEMT = 41
    Case 23
        NEMT = 42
    Case 24
        NEMT = 43
    Case 25
        NEMT = 44
    Case 26
        NEMT = 45
    Case 27
        NEMT = 46
    Case 28
        NEMT = 47
    Case 29
        NEMT = 48
    Case 30
        NEMT = 48
    Case 31
        NEMT = 49
    Case 32
        NEMT = 50
    Case 33
        NEMT = 50
    Case 34
        NEMT = 51
    Case 35
        NEMT = 52
    Case 36
        NEMT = 52
    Case 37
        NEMT = 53
    Case 38
        NEMT = 54
    Case 39
        NEMT = 54
    Case 40
        NEMT = 55
    Case 41
        NEMT = 56
    Case 42
        NEMT = 56
    Case 43
        NEMT = 57
    Case 44
        NEMT = 58
    Case 45
        NEMT = 58
    Case 46
        NEMT = 59
    Case 47
        NEMT = 60
    Case 48
        NEMT = 60
    Case 49
        NEMT = 60
    Case 50
        NEMT = 61
    Case 51
        NEMT = 61
    Case 52
        NEMT = 62
    Case 53
        NEMT = 62
    Case 54
        NEMT = 63
    Case 55
        NEMT = 63
    Case 56
        NEMT = 63
    Case 57
        NEMT = 63
    Case 58
        NEMT = 64
    Case 59
        NEMT = 64
    Case 60
        NEMT = 65
    Case 61
        NEMT = 65
    Case 62
        NEMT = 66
    Case 63
        NEMT = 66
    Case 64
        NEMT = 66
    Case 65
        NEMT = 66
    Case 66
        NEMT = 68
    Case 67
        NEMT = 68
    Case 68
        NEMT = 68
    Case 69
        NEMT = 69
    Case 70
        NEMT = 69
    Case 71
        NEMT = 69
    Case 72
        NEMT = 71
    Case 73
        NEMT = 71
    Case 74
        NEMT = 71
    Case 75
        NEMT = 71
    Case 76
        NEMT = 71
    Case 77
        NEMT = 71
    Case 78
        NEMT = 71
    Case 79
        NEMT = 73
    Case 80
        NEMT = 73
    Case 81
        NEMT = 73
    Case 82
        NEMT = 73
    Case 83
        NEMT = 73
    Case 84
        NEMT = 73
    Case 85
        NEMT = 73
    Case 86
        NEMT = 73
        
    End Select
    ScoreArray(34 + ItemOffset) = NEMT

End Sub

Sub CalcCONT()

    Select Case CON
    Case MVC
        CONT = MVC
    Case Is < 44
        CONT = 22
    Case Is > 110
        CONT = 78

    Case 44
        CONT = 27
    Case 45
        CONT = 27
    Case 46
        CONT = 27
    Case 47
        CONT = 27
    Case 48
        CONT = 27
    Case 49
        CONT = 29
    Case 50
        CONT = 29
    Case 51
        CONT = 29
    Case 52
        CONT = 29
    Case 53
        CONT = 29
    Case 54
        CONT = 31
    Case 55
        CONT = 31
    Case 56
        CONT = 31
    Case 57
        CONT = 31
    Case 58
        CONT = 32
    Case 59
        CONT = 34
    Case 60
        CONT = 34
    Case 61
        CONT = 34
    Case 62
        CONT = 35
    Case 63
        CONT = 36
    Case 64
        CONT = 37
    Case 65
        CONT = 37
    Case 66
        CONT = 38
    Case 67
        CONT = 38
    Case 68
        CONT = 39
    Case 69
        CONT = 40
    Case 70
        CONT = 40
    Case 71
        CONT = 40
    Case 72
        CONT = 41
    Case 73
        CONT = 42
    Case 74
        CONT = 42
    Case 75
        CONT = 43
    Case 76
        CONT = 43
    Case 77
        CONT = 44
    Case 78
        CONT = 44
    Case 79
        CONT = 45
    Case 80
        CONT = 46
    Case 81
        CONT = 46
    Case 82
        CONT = 47
    Case 83
        CONT = 47
    Case 84
        CONT = 48
    Case 85
        CONT = 48
    Case 86
        CONT = 49
    Case 87
        CONT = 50
    Case 88
        CONT = 51
    Case 89
        CONT = 51
    Case 90
        CONT = 52
    Case 91
        CONT = 53
    Case 92
        CONT = 53
    Case 93
        CONT = 54
    Case 94
        CONT = 55
    Case 95
        CONT = 56
    Case 96
        CONT = 56
    Case 97
        CONT = 57
    Case 98
        CONT = 58
    Case 99
        CONT = 59
    Case 100
        CONT = 60
    Case 101
        CONT = 61
    Case 102
        CONT = 62
    Case 103
        CONT = 63
    Case 104
        CONT = 64
    Case 105
        CONT = 66
    Case 106
        CONT = 68
    Case 107
        CONT = 69
    Case 108
        CONT = 71
    Case 109
        CONT = 73
    Case 110
        CONT = 73

    End Select
    ScoreArray(35 + ItemOffset) = CONT
End Sub

Sub CalcPAGT()

    Select Case PAG
    Case MVC
        PAGT = MVC
    Case Is < 23
        PAGT = 22
    Case Is > 86
        PAGT = 78

    Case 23
        PAGT = 27
    Case 24
        PAGT = 27
    Case 25
        PAGT = 27
    Case 26
        PAGT = 27
    Case 27
        PAGT = 27
    Case 28
        PAGT = 29
    Case 29
        PAGT = 29
    Case 30
        PAGT = 31
    Case 31
        PAGT = 31
    Case 32
        PAGT = 32
    Case 33
        PAGT = 34
    Case 34
        PAGT = 34
    Case 35
        PAGT = 34
    Case 36
        PAGT = 35
    Case 37
        PAGT = 37
    Case 38
        PAGT = 37
    Case 39
        PAGT = 38
    Case 40
        PAGT = 39
    Case 41
        PAGT = 40
    Case 42
        PAGT = 40
    Case 43
        PAGT = 41
    Case 44
        PAGT = 42
    Case 45
        PAGT = 43
    Case 46
        PAGT = 43
    Case 47
        PAGT = 44
    Case 48
        PAGT = 44
    Case 49
        PAGT = 45
    Case 50
        PAGT = 46
    Case 51
        PAGT = 46
    Case 52
        PAGT = 47
    Case 53
        PAGT = 47
    Case 54
        PAGT = 48
    Case 55
        PAGT = 48
    Case 56
        PAGT = 49
    Case 57
        PAGT = 50
    Case 58
        PAGT = 50
    Case 59
        PAGT = 51
    Case 60
        PAGT = 52
    Case 61
        PAGT = 53
    Case 62
        PAGT = 53
    Case 63
        PAGT = 54
    Case 64
        PAGT = 55
    Case 65
        PAGT = 55
    Case 66
        PAGT = 56
    Case 67
        PAGT = 56
    Case 68
        PAGT = 57
    Case 69
        PAGT = 58
    Case 70
        PAGT = 58
    Case 71
        PAGT = 59
    Case 72
        PAGT = 60
    Case 73
        PAGT = 60
    Case 74
        PAGT = 61
    Case 75
        PAGT = 62
    Case 76
        PAGT = 62
    Case 77
        PAGT = 63
    Case 78
        PAGT = 64
    Case 79
        PAGT = 66
    Case 80
        PAGT = 66
    Case 81
        PAGT = 68
    Case 82
        PAGT = 69
    Case 83
        PAGT = 71
    Case 84
        PAGT = 71
    Case 85
        PAGT = 73
    Case 86
        PAGT = 73
    End Select
    ScoreArray(36 + ItemOffset) = PAGT
End Sub


Sub CalcPCOT()

    Select Case PCO
    Case MVC
        PCOT = MVC
    Case Is < 24
        PCOT = 22
    Case Is > 90
        PCOT = 78
    
    Case 24
        PCOT = 27
    Case 25
        PCOT = 27
    Case 26
        PCOT = 27
    Case 27
        PCOT = 27
    Case 28
        PCOT = 27
    Case 29
        PCOT = 27
    Case 30
        PCOT = 29
    Case 31
        PCOT = 29
    Case 32
        PCOT = 29
    Case 33
        PCOT = 29
    Case 34
        PCOT = 31
    Case 35
        PCOT = 32
    Case 36
        PCOT = 32
    Case 37
        PCOT = 34
    Case 38
        PCOT = 35
    Case 39
        PCOT = 36
    Case 40
        PCOT = 36
    Case 41
        PCOT = 37
    Case 42
        PCOT = 37
    Case 43
        PCOT = 38
    Case 44
        PCOT = 38
    Case 45
        PCOT = 39
    Case 46
        PCOT = 40
    Case 47
        PCOT = 40
    Case 48
        PCOT = 41
    Case 49
        PCOT = 42
    Case 50
        PCOT = 42
    Case 51
        PCOT = 43
    Case 52
        PCOT = 43
    Case 53
        PCOT = 44
    Case 54
        PCOT = 44
    Case 55
        PCOT = 45
    Case 56
        PCOT = 45
    Case 57
        PCOT = 46
    Case 58
        PCOT = 47
    Case 59
        PCOT = 47
    Case 60
        PCOT = 48
    Case 61
        PCOT = 48
    Case 62
        PCOT = 49
    Case 63
        PCOT = 49
    Case 64
        PCOT = 50
    Case 65
        PCOT = 51
    Case 66
        PCOT = 52
    Case 67
        PCOT = 52
    Case 68
        PCOT = 53
    Case 69
        PCOT = 54
    Case 70
        PCOT = 54
    Case 71
        PCOT = 55
    Case 72
        PCOT = 56
    Case 73
        PCOT = 56
    Case 74
        PCOT = 57
    Case 75
        PCOT = 57
    Case 76
        PCOT = 58
    Case 77
        PCOT = 60
    Case 78
        PCOT = 60
    Case 79
        PCOT = 61
    Case 80
        PCOT = 62
    Case 81
        PCOT = 63
    Case 82
        PCOT = 64
    Case 83
        PCOT = 65
    Case 84
        PCOT = 66
    Case 85
        PCOT = 68
    Case 86
        PCOT = 68
    Case 87
        PCOT = 69
    Case 88
        PCOT = 71
    Case 89
        PCOT = 73
    Case 90
        PCOT = 73
    End Select
    ScoreArray(37 + ItemOffset) = PCOT
End Sub

Sub CalcNAGT()

    Select Case NAG
    Case MVC
        NAGT = MVC
    Case Is < 25
        NAGT = 22
    Case Is > 92
        NAGT = 78

    Case 25
        NAGT = 27
    Case 26
        NAGT = 31
    Case 27
        NAGT = 32
    Case 28
        NAGT = 34
    Case 29
        NAGT = 36
    Case 30
        NAGT = 37
    Case 31
        NAGT = 39
    Case 32
        NAGT = 40
    Case 33
        NAGT = 41
    Case 34
        NAGT = 42
    Case 35
        NAGT = 43
    Case 36
        NAGT = 43
    Case 37
        NAGT = 44
    Case 38
        NAGT = 45
    Case 39
        NAGT = 46
    Case 40
        NAGT = 47
    Case 41
        NAGT = 47
    Case 42
        NAGT = 48
    Case 43
        NAGT = 49
    Case 44
        NAGT = 50
    Case 45
        NAGT = 51
    Case 46
        NAGT = 51
    Case 47
        NAGT = 52
    Case 48
        NAGT = 53
    Case 49
        NAGT = 53
    Case 50
        NAGT = 54
    Case 51
        NAGT = 54
    Case 52
        NAGT = 55
    Case 53
        NAGT = 55
    Case 54
        NAGT = 56
    Case 55
        NAGT = 56
    Case 56
        NAGT = 57
    Case 57
        NAGT = 57
    Case 58
        NAGT = 58
    Case 59
        NAGT = 58
    Case 60
        NAGT = 59
    Case 61
        NAGT = 60
    Case 62
        NAGT = 60
    Case 63
        NAGT = 60
    Case 64
        NAGT = 61
    Case 65
        NAGT = 61
    Case 66
        NAGT = 62
    Case 67
        NAGT = 62
    Case 68
        NAGT = 63
    Case 69
        NAGT = 63
    Case 70
        NAGT = 64
    Case 71
        NAGT = 65
    Case 72
        NAGT = 65
    Case 73
        NAGT = 66
    Case 74
        NAGT = 66
    Case 75
        NAGT = 66
    Case 76
        NAGT = 66
    Case 77
        NAGT = 68
    Case 78
        NAGT = 68
    Case 79
        NAGT = 68
    Case 80
        NAGT = 69
    Case 81
        NAGT = 69
    Case 82
        NAGT = 69
    Case 83
        NAGT = 71
    Case 84
        NAGT = 71
    Case 85
        NAGT = 71
    Case 86
        NAGT = 71
    Case 87
        NAGT = 71
    Case 88
        NAGT = 73
    Case 89
        NAGT = 73
    Case 90
        NAGT = 73
    Case 91
        NAGT = 73
    Case 92
        NAGT = 73
    End Select
    ScoreArray(38 + ItemOffset) = NAGT
End Sub

Sub CalcNALT()

    Select Case NAL
    Case MVC
        NALT = MVC
    Case Is < 18
        NALT = 22
    Case Is > 89
        NALT = 78
    
    Case 18
        NALT = 27
    Case 19
        NALT = 27
    Case 20
        NALT = 31
    Case 21
        NALT = 34
    Case 22
        NALT = 37
    Case 23
        NALT = 39
    Case 24
        NALT = 41
    Case 25
        NALT = 43
    Case 26
        NALT = 44
    Case 27
        NALT = 45
    Case 28
        NALT = 47
    Case 29
        NALT = 48
    Case 30
        NALT = 49
    Case 31
        NALT = 50
    Case 32
        NALT = 51
    Case 33
        NALT = 52
    Case 34
        NALT = 53
    Case 35
        NALT = 53
    Case 36
        NALT = 54
    Case 37
        NALT = 54
    Case 38
        NALT = 55
    Case 39
        NALT = 56
    Case 40
        NALT = 56
    Case 41
        NALT = 57
    Case 42
        NALT = 57
    Case 43
        NALT = 58
    Case 44
        NALT = 58
    Case 45
        NALT = 59
    Case 46
        NALT = 60
    Case 47
        NALT = 60
    Case 48
        NALT = 60
    Case 49
        NALT = 61
    Case 50
        NALT = 61
    Case 51
        NALT = 61
    Case 52
        NALT = 62
    Case 53
        NALT = 62
    Case 54
        NALT = 63
    Case 55
        NALT = 63
    Case 56
        NALT = 64
    Case 57
        NALT = 64
    Case 58
        NALT = 65
    Case 59
        NALT = 65
    Case 60
        NALT = 65
    Case 61
        NALT = 65
    Case 62
        NALT = 66
    Case 63
        NALT = 66
    Case 64
        NALT = 66
    Case 65
        NALT = 66
    Case 66
        NALT = 66
    Case 67
        NALT = 66
    Case 68
        NALT = 66
    Case 69
        NALT = 68
    Case 70
        NALT = 68
    Case 71
        NALT = 68
    Case 72
        NALT = 68
    Case 73
        NALT = 68
    Case 74
        NALT = 68
    Case 75
        NALT = 69
    Case 76
        NALT = 69
    Case 77
        NALT = 69
    Case 78
        NALT = 69
    Case 79
        NALT = 69
    Case 80
        NALT = 69
    Case 81
        NALT = 71
    Case 82
        NALT = 71
    Case 83
        NALT = 71
    Case 84
        NALT = 71
    Case 85
        NALT = 71
    Case 86
        NALT = 73
    Case 87
        NALT = 73
    Case 88
        NALT = 73
    Case 89
        NALT = 73
    End Select
    ScoreArray(39 + ItemOffset) = NALT
End Sub

Sub calcUVT()

    Select Case UVR
    Case MVC
        UVT = MVC
    Case Is > 9
        UVT = 78
    Case 0
        UVT = 34
    Case 1
        UVT = 41
    Case 2
        UVT = 46
    Case 3
        UVT = 50
    Case 4
        UVT = 54
    Case 5
        UVT = 57
    Case 6
        UVT = 60
    Case 7
        UVT = 63
    Case 8
        UVT = 66
    Case 9
        UVT = 71
    End Select
    ScoreArray(40 + ItemOffset) = UVT
End Sub

Sub CalcVRT()

    Select Case VRR
    Case MVC
        VRT = MVC
    Case Is > 6
        VRT = 78
    Case 0
        VRT = 31
    Case 1
        VRT = 40
    Case 2
        VRT = 47
    Case 3
        VRT = 53
    Case 4
        VRT = 59
    Case 5
        VRT = 65
    Case 6
        VRT = 71
    End Select
    ScoreArray(41 + ItemOffset) = VRT
End Sub

Sub CalcTRT()

    Select Case TRR
    Case MVC
        TRT = MVC
    Case Is < 8
        TRT = 22
    Case Is > 16
        TRT = 78
    Case 8
        TRT = 27
    Case 9
        TRT = 31
    Case 10
        TRT = 38
    Case 11
        TRT = 44
    Case 12
        TRT = 51
    Case 13
        TRT = 58
    Case 14
        TRT = 65
    Case 15
        TRT = 71
    Case 16
        TRT = 73
    End Select
    ScoreArray(42 + ItemOffset) = TRT
    
End Sub

Sub CalcInvalid()

    Invalid = 0
    If ((TRR = MVC) Or (VRR = MVC)) Then
        Invalid = MVC
    Else
        If (TRR >= 16.6277 Or TRR <= 7.1429) Then
            Invalid = 1
        End If
        If (VRR >= 7.1862) Then
            Invalid = 1
        End If
        If (VRR >= 5.6332 And (TRR >= 15.2555 Or TRR <= 8.5151)) Then
            Invalid = 1
        End If
    End If
    ScoreArray(43 + ItemOffset) = Invalid
End Sub
