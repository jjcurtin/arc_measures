VERSION 5.00
Begin VB.Form frmSplash 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   3975
   ClientLeft      =   45
   ClientTop       =   45
   ClientWidth     =   7815
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3975
   ScaleWidth      =   7815
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin VB.PictureBox picLogo 
      AutoSize        =   -1  'True
      Height          =   2730
      Left            =   240
      Picture         =   "frmSplash.frx":0000
      ScaleHeight     =   2670
      ScaleWidth      =   2250
      TabIndex        =   6
      Top             =   840
      Width           =   2310
   End
   Begin VB.Frame fraMainFrame 
      Height          =   3870
      Left            =   45
      TabIndex        =   0
      Top             =   -15
      Width           =   7740
      Begin VB.CommandButton Command1 
         Caption         =   "Info"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   6240
         TabIndex        =   9
         Top             =   3120
         Width           =   1215
      End
      Begin VB.CommandButton cmdBegin 
         Caption         =   "Begin"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   4800
         TabIndex        =   4
         Top             =   3120
         Width           =   1215
      End
      Begin VB.Label Label6 
         Caption         =   "jjcurtin@wisc.edu"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   2640
         TabIndex        =   8
         Top             =   2160
         Width           =   3015
      End
      Begin VB.Label Label2 
         Caption         =   "Scoring Program"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   2640
         TabIndex        =   7
         Top             =   1080
         Width           =   3135
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Caption         =   "Multidimensonal Personality Questionnaire Brief Form (155 item version) "
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   7575
      End
      Begin VB.Label lblPlatform 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "Windows 98"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   2640
         TabIndex        =   3
         Tag             =   "Platform"
         Top             =   3120
         Width           =   1140
      End
      Begin VB.Label lblVersion 
         AutoSize        =   -1  'True
         Caption         =   "Version"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   2640
         TabIndex        =   2
         Tag             =   "Version"
         Top             =   3360
         Width           =   720
      End
      Begin VB.Label lblAuthor 
         Caption         =   "code by John J. Curtin, Ph.D."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2640
         TabIndex        =   1
         Tag             =   "Warning"
         Top             =   1800
         Width           =   3375
      End
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdBegin_Click()
    Unload frmSplash
    Set frmM = New frmMain
    Load frmM
    frmM.Show
End Sub

Private Sub Command1_Click()
    Load frmAbout
    frmAbout.Show
End Sub

Private Sub Form_Load()
    lblVersion.caption = "Version " & App.Major & "." & App.Minor & "." & App.Revision
End Sub


