Attribute VB_Name = "Utilities"
'Created  3/23/2000
'modified 4/07/2000 - added GetOneRecord
'modified 4/08/2000 - added additional record/data array functions
'modified 4/09/2000 - revised GetOneRecord to accept string value
'                   - added ConvertRecordToNumeric
'modified 4/10/2000 - added prompt to overwrite to save as dialog
'modified 4/12/2000 - added ParseString (comparable to GetOneRecord, but usings string rather than file input)
'modified 4/22/2000 - added PrintOneRecord
'modified 4/23/2000 - added AppendValueToRecord
'modified 4/24/2000 - changed MAX,MIN,MEAN,and SDInREcord to accept and string array rather than numeric
'modified 4/25/2000 - added RemoveFromRecord
'modified 4/26/2000 - added MedianInRecord, IsOdd
'modified 4/27/2000 - added IQRInRecord
'modified 4/28/2000 - changed MAX, MINInRecord, etc. to accept string Missing value code
'modified 5/12/2000 - added CountValidNinRecord(StringArray() As String, MissValue As String, Optional StartPos As Integer = 1, Optional EndPos As Integer = -1) As Integer
'                   - modified other inRecord functions to use CoundValidN to avoid errors when no data in record
'                   - modified other inRecord functions to return string value instead of double (for possible Missvalue return)
'modified 6/9/2000  - added AppendRecordArray
'modified 6/11/2000 - added PrintRecordArray
'modified 8/26/2000 - added optional AllowEmptyCell parameter to GetOneRecord
'modified 8/26/2000 - modified SDinRecord.  Now requires mean of record as parameter

'------------------------------------------------------
'LIST OF ROUTINES
'------------------------------------------------------
'FILE MANIPULATION
'Function OpenFile(filename As String, filehandle As Integer, method As String) As Integer
'Function GetFileName(filename As String, dialogtype As String, caption As String) As String
'Function ResetInputFile(filename As String, filehandle As Integer)
'------------------------------------------------------
'WORKING WITH ONE-DIMENSIONAL ARRAY: "StringArray()"
'Function GetOneRecord(filehandle as integer, StringArray() As String) as boolean
'Function ConvertRecordToNumeric(StringArray() As String, NumericArray As Double) As Boolean
'Function MaxInRecord(StringArray() As String, optional StartPos as integer, EndPos as integer, Optional ExcludeMiss As Boolean = False, Optional MissValue As Double = -999) as double
'Function MinInRecord(StringArray() As String, Optional StartPos As Integer = 1, Optional EndPos As Integer = -1, Optional ExcludeMiss As Boolean = False, Optional MissValue As string = "-999") As Double
'Function MeanInRecord(StringArray() As String, Optional StartPos As Integer = 1, Optional EndPos As Integer = -1, Optional ExcludeMiss As Boolean = False, Optional MissValue As string = "-999") As Double
'Function SDInRecord(StringArray() As String, Optional StartPos As Integer = 1, Optional EndPos As Integer = -1, Optional ExcludeMiss As Boolean = False, Optional MissValue As string = "-999") As Double
'Function MedianInRecord(StringArray() As String, Optional StartPos As Integer = 1, Optional EndPos As Integer = -1, Optional ExcludeMiss As Boolean = False, Optional MissValue As string = "-999") As Double
'Function IQRInRecord(StringArray() As String, Optional StartPos As Integer = 1, Optional EndPos As Integer = -1, Optional ExcludeMiss As Boolean = False, Optional MissValue As string = "-999") As Double
'Function CountValidNinRecord(StringArray() As String, MissValue As String, Optional StartPos As Integer = 1, Optional EndPos As Integer = -1) As Integer
'Sub      AppendValueToRecord(StringArray() as string,Value as string)
'Sub      RemoveFromRecord(StringArray() As String, Index As Integer)
'Sub      PrintOneRecord(filehandle As Integer, StringArray() As String)
'------------------------------------------------------
'MATHEMATICAL, LOGICAL
'Function IsOdd(Number As Integer) As Boolean
'------------------------------------------------------
'OTHER
'Function GetValueN(Text As String, Position As Integer) As String
'Sub      ParseString(ByVal TheString As String, StringArray() As String)

'------------------------------------------------------
Option Explicit

Function OpenFile(filename As String, FileHandle As Integer, Method As String) As Integer
    'filename = string with name of file to open
    'filehandle = pass a var by ref.  Value is changed by function
    'method = (I)nput, (O)utput or (A)ppend
    'OpenFile returns value to indicate success.  > 0 indicates error

    Method = UCase(Method)
    FileHandle = FreeFile

    Select Case Method
        Case "I"
            On Error Resume Next
            Open filename For Input As #FileHandle
        Case "O"
            On Error Resume Next
            Open filename For Output As #FileHandle
        Case "A"
            On Error Resume Next
            Open filename For Append As #FileHandle
            Case Else
                MsgBox "Method in OpenFile() Not Defined: " & Method
    End Select

    If (Err.Number > 0) Then
        MsgBox Error(Err.Number)
        Dim errmsg
        errmsg = "Error opening file: " & filename
        MsgBox errmsg
    End If

    OpenFile = Err.Number
End Function

Function GetFileName(filename As String, dialogtype As String, caption As String) As String
    'filename var passed by ref.  Will be changed by function
    'dialogtype = Show(S)ave or Show(O)pen
    'caption is string for DialogTitle
    'GetFileName returns filename (in addition to changing filename parameter that was passed)
    'Assumptions:  there is a main form called frmM which has a commondialog called dlgCommonDialog

    dialogtype = UCase(dialogtype)

    With frmM.dlgCommonDialog
        .DialogTitle = caption
        .Filter = "All Files (*.*)|*.*"
        .filename = ""
        Select Case dialogtype
            Case "S"
                .Flags = cdlOFNOverwritePrompt
                .ShowSave
                
            Case "O"
                .ShowOpen
            Case Else
                MsgBox "DialogType in GetFileName() Not Defined: " & dialogtype
        End Select
        filename = .filename
        GetFileName = .filename
    End With

End Function

Function ResetInputFile(filename As String, FileHandle As Integer)
'resets an input file by closing it and then reopening it.
        Close #FileHandle
        If (OpenFile(filename, FileHandle, "I") > 0) Then
            MsgBox "Error Resetting File"
        End If
        
End Function

Function GetValueN(Text As String, Position As Integer) As String
'Text is string containing data
'position is the serial position of the value to return
'data should be tab or space delimited
'Function returns data as string

    Dim NextChr As String
    Dim Result As String
    Dim ChrCtr
    ChrCtr = 1
    
    Dim i As Integer
    For i = 1 To Position
        Result = ""
        NextChr = ""
        
        'remove leading space
        NextChr = Mid(Text, ChrCtr, 1)
        Do While NextChr = " "
            ChrCtr = ChrCtr + 1
            NextChr = Mid(Text, ChrCtr, 1)
        Loop
        
        'get all chars till delimiter or endstring
        Do Until ((NextChr = " ") Or (NextChr = vbTab) Or _
                  (NextChr = vbCrLf) Or (ChrCtr > Len(Text)))
    
            Result = Result & NextChr
            ChrCtr = ChrCtr + 1
            NextChr = Mid(Text, ChrCtr, 1)
        Loop
    Next i
    
    GetValueN = Result
End Function

Function GetOneRecord(FileHandle As Integer, StringArray() As String, Optional AllowEmptyCells As Boolean = True) As Boolean
'Filehandle with tab delimited real data
'DataArray passed by ref.  Must be able to redim this array
'Data array is string type so can handle any data
'DataArray will be changed by sub to include data values from record
'it will be resized to fit the number of values
'number of values will be stored in cell 0 of array
'Will return false if no data record in filehandle
'can set it to not accept blank (empty cell) values with optional parameter


    'get a record.  If no record remains, return false and exit function
    Dim TheRecord As String
    If Not EOF(FileHandle) Then
        Line Input #FileHandle, TheRecord
    Else
        GetOneRecord = False
        Exit Function
    End If

    'initial sizing of array
    Dim ArrayMax As Integer
    ArrayMax = 100
    ReDim StringArray(0 To ArrayMax)

    Dim Valuectr As Integer
    Valuectr = 0
    
    Dim Value As String
    
    Do While Len(TheRecord) > 0
        
        'if another tab, get next value
        If (InStr(1, TheRecord, vbTab, vbTextCompare) > 0) Then
            Value = Left(TheRecord, InStr(1, TheRecord, vbTab) - 1)
            
        Else  'if no more tabs, get last value
            Value = TheRecord
            TheRecord = ""
        End If

        'if no empty allowed, check that value exists before adding
        If Not AllowEmptyCells Then
            If (Value <> "") Then
                'count it
                Valuectr = Valuectr + 1
        
                'determine if need to grow array
                If Valuectr > ArrayMax Then
                    ArrayMax = ArrayMax + 100
                    ReDim Preserve StringArray(0 To ArrayMax)
                End If

                'put value in array
                StringArray(Valuectr) = Value
            End If
            
        Else    'if empty allowed, just add
            'count it
            Valuectr = Valuectr + 1
        
            'determine if need to grow array
            If Valuectr > ArrayMax Then
                ArrayMax = ArrayMax + 100
                ReDim Preserve StringArray(0 To ArrayMax)
            End If

            'put value in array
            StringArray(Valuectr) = Value
        End If
    
        'shorten record by removing the value that has been extracted
        TheRecord = Right(TheRecord, (Len(TheRecord) - InStr(1, TheRecord, vbTab, vbTextCompare)))
    Loop

    'resize array to fit data record
    ReDim Preserve StringArray(0 To Valuectr)
    StringArray(0) = Valuectr 'put record length in cell 0
    
    GetOneRecord = True
End Function

Function ConvertRecordToNumeric(StringArray() As String, NumericArray() As Double) As Boolean
'StringArray in a one dimenstinoal array containing string data
'index 0 contains a value which indicates the dimension of the array
'takes a string data record array and converts all values to double
'returns false (with error msg) if non-numeric value is encountered
    
    'make NumericArray size of string array
    ReDim NumericArray(0 To StringArray(0))

    Dim i As Integer
    For i = 0 To StringArray(0)

        If IsNumeric(StringArray(i)) Then
            NumericArray(i) = CDbl(StringArray(i))
        Else
            MsgBox "Non-numeric value in data record: " & StringArray(i)
            ConvertRecordToNumeric = False
            Exit Function
        End If
    Next i

    'Sucessful conversion
    ConvertRecordToNumeric = True

End Function

Function MaxInRecord(StringArray() As String, Optional StartPos As Integer = 1, Optional EndPos As Integer = -1, Optional ExcludeMiss As Boolean = False, Optional MissValue As String = "-999") As String
'StringArray in a one dimenstinoal array containing string data
'index 0 contains a value which indicates the dimension of the array
'user is responsible for making certain that range of cells used are all numeric
'start position and end position are supplied in StartPos and EndPos, by default beginning and end of array
'returns max value between startpos and endpos
'user is responsible for making certain that value of cells between startpos and endpos are all numeric
'ExcludeMiss and MissValue allows function to not include missvalues in calculations.

    Dim i As Integer
    Dim MaxValue As Double
    
    'if endpos was not supplied then set to length of array
    If EndPos = -1 Then
        EndPos = StringArray(0)
    End If
    
    'make sure end pos is not past end of array
    If EndPos > StringArray(0) Then
        MsgBox "Endpos in MaxInRecord Function out of bound.  Set to upper bound."
        EndPos = StringArray(0)
    End If

    'in case not excluding missvalue dont want to have a miss
    'value that can match real data in CountValidNinRecord
    If Not ExcludeMiss Then
        MissValue = ""
    End If

    If CountValidNinRecord(StringArray(), MissValue, StartPos, EndPos) > 0 Then
        
        MaxValue = CDbl(StringArray(StartPos))
        For i = StartPos + 1 To EndPos
            If Not (ExcludeMiss And (StringArray(i) = MissValue)) Then
                If CDbl(StringArray(i)) > MaxValue Then
                    MaxValue = CDbl(StringArray(i))
                End If
            End If
        Next i
    Else
        MaxValue = MissValue
    End If

    MaxInRecord = MaxValue

End Function

Function MinInRecord(StringArray() As String, Optional StartPos As Integer = 1, Optional EndPos As Integer = -1, Optional ExcludeMiss As Boolean = False, Optional MissValue As String = "-999") As String
'StringArray in a one dimenstinoal array containing string data
'index 0 contains a value which indicates the dimension of the array
'start position and end position are supplied in StartPos and EndPos, by default beginning and end of array
'returns Min value between startpos and endpos
'user is responsible for making certain that value of cells between startpos and endpos are all numeric
'ExcludeMiss and MissValue allows function to not include missvalues in calculations.


    Dim i As Integer
    Dim MinValue As Double
    
    'if endpos was not supplied then set to length of array
    If EndPos = -1 Then
        EndPos = StringArray(0)
    End If
    
    'make sure end pos is not past end of array
    If EndPos > StringArray(0) Then
        MsgBox "EndPos in MinInRecord Function out of bound.  Set to upper bound."
        EndPos = StringArray(0)
    End If
    

    'in case not excluding missvalue dont want to have a miss
    'value that can match real data in CountValidNinRecord
    If Not ExcludeMiss Then
        MissValue = ""
    End If

    If CountValidNinRecord(StringArray(), MissValue, StartPos, EndPos) > 0 Then
    
        MinValue = CDbl(StringArray(StartPos))
        For i = StartPos + 1 To EndPos
            If Not (ExcludeMiss And (StringArray(i) = MissValue)) Then
                If CDbl(StringArray(i)) < MinValue Then
                    MinValue = CDbl(StringArray(i))
                End If
            End If
        Next i
    Else
        MinValue = MissValue
    End If
        
    MinInRecord = MinValue


End Function


Function MeanInRecord(StringArray() As String, Optional StartPos As Integer = 1, Optional EndPos As Integer = -1, Optional ExcludeMiss As Boolean = False, Optional MissValue As String = "-999") As String
'StringArray in a one dimenstinoal array containing string data
'index 0 contains a value which indicates the dimension of the array
'start position and end position are supplied in StartPos and EndPos, by default beginning and end of array
'returns mean value between startpos and endpos
'user is responsible for making certain that value of cells between startpos and endpos are all numeric
'ExcludeMiss and MissValue allows function to not include missvalues in calculations.

    Dim i As Integer
    Dim Sum As Double
    Dim Valuectr As Integer

    'if endpos was not supplied then set to length of array
    If EndPos = -1 Then
        EndPos = StringArray(0)
    End If

    'make sure end pos is not past end of array
    If EndPos > StringArray(0) Then
        MsgBox "EndPos in MeanInRecord Function out of bound.  Set to upper bound."
        EndPos = StringArray(0)
    End If
    
    Sum = 0
    Valuectr = 0
    Dim Mean As Double

    'in case not excluding missvalue dont want to have a miss
    'value that can match real data in CountValidNinRecord
 '   If Not ExcludeMiss Then
 '       MissValue = ""
 '   End If

    For i = StartPos To EndPos
        If Not (ExcludeMiss And (StringArray(i) = MissValue)) Then
            Sum = Sum + CDbl(StringArray(i))
            Valuectr = Valuectr + 1
        End If
    Next i

    If Valuectr > 0 Then
        Mean = Sum / Valuectr

    Else
        Mean = MissValue
    End If
    
    MeanInRecord = Mean

End Function

Function SDInRecord(StringArray() As String, TheMean As Double, Optional StartPos As Integer = 1, Optional EndPos As Integer = -1, Optional ExcludeMiss As Boolean = False, Optional MissValue As String = "-999") As String
'StringArray in a one dimenstinoal array containing string data
'index 0 contains a value which indicates the dimension of the array
'start position and end position are supplied in StartPos and EndPos, by default beginning and end of array
'returns SD (using n in denominator) of values between startpos and endpos
'user is responsible for making certain that value of cells between startpos and endpos are all numeric
'ExcludeMiss and MissValue allows function to not include missvalues in calculations.
'need to provide mean to speed this function

    Dim i As Integer
    Dim DiffSumSqr As Double
    Dim Valuectr As Integer

    'if endpos was not supplied then set to length of array
    If EndPos = -1 Then
        EndPos = StringArray(0)
    End If

    'make sure end pos is not past end of array
    If EndPos > StringArray(0) Then
        MsgBox "EndPos in SDInRecord Function out of bound.  Set to upper bound."
        EndPos = StringArray(0)
    End If

    'in case not excluding missvalue dont want to have a miss
    'value that can match real data in CountValidNinRecord
  '  If Not ExcludeMiss Then
 '       MissValue = ""
 '   End If

    DiffSumSqr = 0
    Valuectr = 0
    
    For i = StartPos To EndPos
        If Not (ExcludeMiss And (StringArray(i) = MissValue)) Then
            DiffSumSqr = DiffSumSqr + ((CDbl(StringArray(i)) - TheMean) ^ 2)
            Valuectr = Valuectr + 1
        End If
    Next i
    
    If Valuectr > 0 Then
        Dim SD As Double
        SD = (DiffSumSqr / Valuectr) ^ 0.5
    Else
        SD = MissValue
    End If

    SDInRecord = SD

End Function

Sub ParseString(ByVal TheString As String, StringArray() As String)
'String with tab delimited data.  String will not be altered by sub
'DataArray passed by ref.  Must be able to redim this array
'Data array is string type so can handle any data
'DataArray will be changed by sub to include data values from record
'it will be resized to fit the number of values
'number of values will be stored in cell 0 of array

    'initial sizing of array
    Dim ArrayMax As Integer
    ArrayMax = 100
    ReDim StringArray(0 To ArrayMax)

    Dim Valuectr As Integer
    Valuectr = 0
    
    Dim Value As String
    
    Do While Len(TheString) > 0
        Valuectr = Valuectr + 1
        
        'if another tab, get next value
        If (InStr(1, TheString, vbTab) > 0) Then
            Value = Left(TheString, InStr(1, TheString, vbTab) - 1)
        Else  'if no more tabs, get last value
            Value = TheString
            TheString = ""
        End If
    
        'determine if need to grow array
        If Valuectr > ArrayMax Then
            ArrayMax = ArrayMax + 100
            ReDim Preserve StringArray(0 To ArrayMax)
        End If

        'put value in array
        StringArray(Valuectr) = Value
        
        'shorten record by removing the value that has been extracted
        TheString = Right(TheString, (Len(TheString) - InStr(1, TheString, vbTab)))
    Loop

    'resize array to fit data record
    ReDim Preserve StringArray(0 To Valuectr)
    StringArray(0) = Valuectr 'put record length in cell 0
End Sub

Sub PrintOneRecord(FileHandle As Integer, StringArray() As String)
'StringArray in a one dimenstinoal array containing string data
'index 0 contains a value which indicates the dimension of the array

    Dim i As Integer
    Dim LineBuffer As String

    LineBuffer = ""
    For i = 1 To StringArray(0)
        LineBuffer = LineBuffer & StringArray(i)
        If i < StringArray(0) Then
            LineBuffer = LineBuffer & vbTab
        End If
    Next i

    Print #FileHandle, LineBuffer

End Sub

Sub PrintRecordArray(FileHandle As Integer, RecordArray() As String)
'RecordArray in a two dimenstional array containing string data
'each row is a record of data from one trial.  Index [n,0] contains # of values for record

    Dim i As Integer
    Dim j As Integer
    Dim LineBuffer As String

    'for each record
    For j = 1 To UBound(RecordArray(), 1)
        LineBuffer = ""
        For i = 1 To RecordArray(j, 0)
            LineBuffer = LineBuffer & RecordArray(j, i)
            If i < RecordArray(j, 0) Then
                LineBuffer = LineBuffer & vbTab
            End If
        Next i

        Print #FileHandle, LineBuffer
    Next j

End Sub

Sub AppendValueToRecord(StringArray() As String, Value As String)
'StringArray in a one dimenstinoal array containing string data
'index 0 contains a value which indicates the dimension of the array
'appends one string value to the end of the array and modifies
'the value counter at index 0

    Dim NumofValues As Integer
    NumofValues = StringArray(0)

    ReDim Preserve StringArray(0 To NumofValues + 1)
    StringArray(0) = NumofValues + 1
    StringArray(NumofValues + 1) = Value

End Sub

Sub RemoveFromRecord(StringArray() As String, Index As Integer)
'StringArray in a one dimenstinoal array containing string data
'index 0 contains a value which indicates the dimension of the array
'Index is the position of the value in the array to be deleted
'Array will be resized to new dimension.

    Dim i As Integer
    
    For i = 1 To (StringArray(0) - 1)
        If i >= Index Then
            StringArray(i) = StringArray(i + 1)
        End If
    Next i
    StringArray(0) = StringArray(0) - 1
    ReDim Preserve StringArray(StringArray(0)) As String

End Sub

Sub SortRecord(StringArray() As String, SortType As String, Optional CheckError As Boolean = True)
'StringArray in a one dimenstinoal array containing string data
'Index 0 contains a value which indicates the dimension of the array
'String array is sorted in ascending order either (N)umerically or (A)lphabetically

    Dim Unsorted As Boolean
    Unsorted = True
    
    SortType = UCase(SortType)
    
    Select Case SortType
    
        Case "N"
        
        Dim i As Integer
        Dim j As Integer
        Dim Transfer As String
        
        If CheckError Then
            If IsNumeric(StringArray(i)) And IsNumeric(StringArray(i + 1)) Then
                For i = 1 To StringArray(0) - 1
                    For j = i + 1 To StringArray(0)
                        If CDbl(StringArray(j)) < CDbl(StringArray(i)) Then
                            Transfer = StringArray(i)
                            StringArray(i) = StringArray(j)
                            StringArray(j) = Transfer
                        End If
                    Next j
                Next i
            Else
                MsgBox "Error in SortRecord.  Numeric sort encountered non-numeric data"
                Exit Sub
            End If
        Else        'no checking for valid numeric data
        
            For i = 1 To StringArray(0) - 1
                For j = i + 1 To StringArray(0)
                    If CDbl(StringArray(j)) < CDbl(StringArray(i)) Then
                        Transfer = StringArray(i)
                        StringArray(i) = StringArray(j)
                        StringArray(j) = Transfer
                    End If
                Next j
            Next i
        End If
        
        'old sort algorithm
        'Do While Unsorted
        '    Unsorted = False
        '    Dim i As Integer
        '    For i = 1 To (StringArray(0) - 1)
    
        '        If IsNumeric(StringArray(i)) And IsNumeric(StringArray(i + 1)) Then
        '            If CDbl(StringArray(i + 1)) < CDbl(StringArray(i)) Then
        '                Dim Transfer As String
        '                Transfer = StringArray(i)
        '                StringArray(i) = StringArray(i + 1)
        '                StringArray(i + 1) = Transfer
        '                Unsorted = True
        '            End If
        '        Else
        '            MsgBox "Error in SortRecord.  Numeric sort encountered non-numeric data"
        '            Exit Sub
        '        End If
        '    Next i
        'Loop
    
        Case "A"
            For i = 1 To StringArray(0) - 1
                For j = i + 1 To StringArray(0)
                    If StringArray(j) < StringArray(i) Then
                        Transfer = StringArray(i)
                        StringArray(i) = StringArray(j)
                        StringArray(j) = Transfer
                    End If
                Next j
            Next i

        Case Else
            MsgBox "SortType must be either (N)umeric or (A)lphabetic!"
            Exit Sub
    
    End Select

End Sub

Function MedianInRecord(StringArray() As String, Optional StartPos As Integer = 1, Optional EndPos As Integer = -1, Optional ExcludeMiss As Boolean = False, Optional MissValue As String = "-999") As Double
'StringArray in a one dimenstinoal array containing string data
'index 0 contains a value which indicates the dimension of the array
'start position and end position are supplied in StartPos and EndPos, by default beginning and end of array
'returns SD (using n in denominator) of values between startpos and endpos
'user is responsible for making certain that value of cells between startpos and endpos are all numeric
'ExcludeMiss and MissValue allows function to not include missvalues in calculations.

    'if endpos was not supplied then set to length of array
    If EndPos = -1 Then
        EndPos = StringArray(0)
    End If

    'make sure end pos is not past end of array
    If EndPos > StringArray(0) Then
        MsgBox "EndPos in MedianInRecord Function out of bound.  Set to upper bound."
        EndPos = StringArray(0)
    End If

   'in case not excluding missvalue dont want to have a miss
    'value that can match real data in CountValidNinRecord
   ' If Not ExcludeMiss Then
   '     MissValue = ""
   ' End If

    
    Dim TempArray() As String
    ReDim TempArray(0 To StringArray(0)) As String
        
    Dim i As Integer
    Dim IndexCtr As Integer
    For i = StartPos To EndPos
        If Not (ExcludeMiss And (StringArray(i) = MissValue)) Then
            IndexCtr = IndexCtr + 1
            TempArray(IndexCtr) = StringArray(i)
        End If
    Next i
    TempArray(0) = IndexCtr

    If IndexCtr > 0 Then
    
        SortRecord TempArray(), "N"
        
        Dim median As Double

        If IsOdd(Int(TempArray(0))) Then
            median = TempArray(Int(TempArray(0) / 2) + 1)
        Else
            median = TempArray(Int(TempArray(0) / 2))
            median = median + (TempArray(Int(TempArray(0) / 2) + 1))
            median = median / 2
        End If

    Else
        median = MissValue
    End If

    MedianInRecord = median

End Function

Function IsOdd(Number As Integer) As Boolean
    Dim Odd As Boolean
    
    If Number Mod 2 = 1 Then
        Odd = True
    Else
        Odd = False
    End If
    
    IsOdd = Odd
    
End Function


Function IQRInRecord(StringArray() As String, Optional StartPos As Integer = 1, Optional EndPos As Integer = -1, Optional ExcludeMiss As Boolean = False, Optional MissValue As String = "-999") As Double
'StringArray in a one dimenstinoal array containing string data
'index 0 contains a value which indicates the dimension of the array
'start position and end position are supplied in StartPos and EndPos, by default beginning and end of array
'returns SD (using n in denominator) of values between startpos and endpos
'user is responsible for making certain that value of cells between startpos and endpos are all numeric
'ExcludeMiss and MissValue allows function to not include missvalues in calculations.

    'if endpos was not supplied then set to length of array
    If EndPos = -1 Then
        EndPos = StringArray(0)
    End If

    'make sure end pos is not past end of array
    If EndPos > StringArray(0) Then
        MsgBox "EndPos in MedianInRecord Function out of bound.  Set to upper bound."
        EndPos = StringArray(0)
    End If
    
   'in case not excluding missvalue dont want to have a miss
    'value that can match real data in CountValidNinRecord
    If Not ExcludeMiss Then
        MissValue = ""
    End If

    If CountValidNinRecord(StringArray(), MissValue, StartPos, EndPos) > 0 Then
    

        Dim TempArray() As String
        ReDim TempArray(0 To StringArray(0)) As String
        
        Dim i As Integer
        Dim IndexCtr As Integer
        For i = StartPos To EndPos
            If Not (ExcludeMiss And (StringArray(i) = MissValue)) Then
                IndexCtr = IndexCtr + 1
                TempArray(IndexCtr) = StringArray(i)
            End If
        Next i
        TempArray(0) = IndexCtr
    
        SortRecord TempArray(), "N"
        
        Dim LowRange As Double
        Dim HiRange As Double
        Dim Index As Integer
        Dim Weight1 As Double
        Dim Weight2 As Double
        
        Index = Int((TempArray(0) + 1) / 4)
        Weight2 = ((TempArray(0) + 1) Mod 4) / 4
        Weight1 = 1 - Weight2
        LowRange = Weight1 * TempArray(Index) + Weight2 * TempArray(Index + 1)
    
        Index = Int(3 * (TempArray(0) + 1) / 4)
        Weight2 = (3 * (TempArray(0) + 1) Mod 4) / 4
        Weight1 = 1 - Weight2
        HiRange = Weight1 * TempArray(Index) + Weight2 * TempArray(Index + 1)
        
        Dim IQR As Double
        IQR = HiRange - LowRange
    Else
        IQR = MissValue
    End If
      
    IQRInRecord = IQR

End Function

Function CountValidNinRecord(StringArray() As String, MissValue As String, Optional StartPos As Integer = 1, Optional EndPos As Integer = -1) As Integer
'StringArray in a one dimenstinoal array containing string data
'index 0 contains a value which indicates the dimension of the array
'start position and end position are supplied in StartPos and EndPos, by default beginning and end of array
'returns number of nonmissing data points between startpos and endpos
'user is responsible for making certain that value of cells between startpos and endpos are all numeric
'ExcludeMiss and MissValue allows function to not include missvalues in calculations.

    'if endpos was not supplied then set to length of array
    If EndPos = -1 Then
        EndPos = StringArray(0)
    End If

    'make sure end pos is not past end of array
    If EndPos > StringArray(0) Then
        MsgBox "EndPos in CountValidNinRecord Function out of bound.  Set to upper bound."
        EndPos = StringArray(0)
    End If
    
    Dim Ctr As Integer
    Ctr = 0
    Dim i As Integer
    For i = StartPos To EndPos
        If StringArray(i) <> MissValue Then
            Ctr = Ctr + 1
        End If
    Next i

    CountValidNinRecord = Ctr
    
End Function

Sub AppendRecordArray(RecordArray() As String, ARecord() As String, CurRecordNum As Integer, TotalRecords As Integer)
'RecordArray is an array of RXC where R is # of records and C is Number of values in a record
'There may be extra empty cells if record lengths differ
'RecordArray subscripts are [1..R, 0..C]


    Dim MaxValues As Integer
    MaxValues = UBound(RecordArray, 2)
    
    If (ARecord(0) > MaxValues) Then
        MaxValues = ARecord(0)
    End If

    ReDim Preserve RecordArray(1 To TotalRecords, 0 To MaxValues)
    
    Dim i As Integer
    
    For i = 0 To ARecord(0)
        RecordArray(CurRecordNum, i) = ARecord(i)
    Next i

End Sub
