VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   3015
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3015
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   600
      TabIndex        =   0
      Text            =   "Combo1"
      Top             =   600
      Width           =   2775
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private miSelStart As Integer
Private Sub Combo1_KeyDown(KeyCode As Integer, Shift As Integer)
    '<Delete>
    If KeyCode = 46 Then KeyCode = 0 'Disable the delete key

    miSelStart = Combo1.SelStart
End Sub

Private Sub Combo1_KeyPress(KeyAscii As Integer)
    Dim lCnt       As Long 'Generic long counter
    Dim lMax       As Long
    Dim sComboItem As String
    Dim sComboText As String 'Text currently in combobox
    Dim sText      As String 'Text after keypressed

    With Combo1
        lMax = .ListCount - 1
        sComboText = .Text
        sText = Left(sComboText, miSelStart) & Chr(KeyAscii)
        
        KeyAscii = 0 'Reset key pressed
        
        For lCnt = 0 To lMax
            sComboItem = .List(lCnt)
            
            If UCase(sText) = UCase(Left(sComboItem, _
                                         Len(sText))) Then
                .ListIndex = lCnt
                .Text = sComboItem
                .SelStart = Len(sText)
                .SelLength = Len(sComboItem) - (Len(sText))
                
                Exit For
            End If
        Next 'lCnt
    End With
End Sub
