'---------------------
'   ActiveReport6
'---------------------
'PDFコピー禁止
Dim ReportFile As Export.Pdf.PdfExport = New Export.Pdf.PdfExport
ReportFile.Security.Permissions = Export.Pdf.PdfPermissions.None

'---------------------
'   Noghing check
'---------------------
If IsNothing(anInstance) Then
    //do
End If

If Not IsNothing(anInstance) Then
    //do
End If

If anInstance Is Nothing Then
    //do
End If

If anInstance IsNot Nothing Then
    //do
End If

'---------------------
'     Dictionary
'---------------------
Dim names As New Dictionary(Of String, String)
names.Add("江戸幕府", "徳川家康")
names.Add("室町幕府", "足利尊氏")
names.Add("鎌倉幕府", "源頼朝")

Dim edoStarter As String
edoStarter = names("江戸幕府")

                
                
                
                
                
                
                
                
                
                
Filter.SYONIN_SINCYOKU_KBN = GetTagFromSelectedRadioButton(grp_SYONIN_SINCYOKU_KBN)



#Region "入力データ取得"

    Protected Function GetTagFromSelectedRadioButton(ByVal Group As Panel) As String
        Try
            For Each targetControl As Control In Group.Controls
                If TypeOf (targetControl) Is RadioButton Then
                    If CType(targetControl, RadioButton).Checked And CType(targetControl, RadioButton).Enabled Then
                        Return Trim(CType(targetControl, RadioButton).Tag)
                    End If
                End If
            Next

            '未選択の場合、空白を返す
            Return String.Empty

        Catch ex As Exception
            ShowErrorMessage(ex)
            Return String.Empty
        End Try

    End Function

#End Region






            'pnl_KEIJYO_KB に配置しているチェックボックスを取得する
            For Each targetControl As Control In Me.pnl_KEIJYO_KB.Controls
                If TypeOf (targetControl) Is CheckBox Then
                    '制御対象は、コントロール名の開始文字が「chk_KEIJYO_KB_」とする。
                    If targetControl.Name.Length > 14 AndAlso targetControl.Name.Substring(0, 14).Equals("chk_KEIJYO_KB_") Then
                        If CType(targetControl, CheckBox).Checked Then
                            'tagプロパティに格納している「計上区分,受決区分」の値を抽出する。
                            UserChoiceSearchKeijyoKbList.Add(CType(targetControl, CheckBox).Tag)
                        End If
                    End If
               End If
            Next
            Dim SystemSearchKeijyoKbArray(UserChoiceSearchKeijyoKbList.Count - 1) As String
            Dim tmpArray1() As String
            Dim i As Integer = -1
            'SQLにて実行できる形式に整形する。
            '（SQL発行時、「 where (KEIJYO_KB, JYUKETU_KBN) in ( ('2','1'),('1','1')....」というクエリ式にしています。以下では in区の条件に相当する文字列に整形しています。）
            For Each searchKeijyoKb As String In UserChoiceSearchKeijyoKbList
                i += 1
                tmpArray1 = searchKeijyoKb.Split(",")
                SystemSearchKeijyoKbArray(i) = "('" & String.Join("','", tmpArray1) & "')"
            Next



            '---< 拠点検索条件を整備 >---
            Dim UserChoiceSearchDbuserList As New System.Collections.Generic.List(Of String)
            For Each targetControl As Control In Me.pnl_TargetOffice.Controls
                If TypeOf (targetControl) Is CheckBox Then
                    If CType(targetControl, CheckBox).Checked And CType(targetControl, CheckBox).Enabled Then
                        'tagプロパティに格納している値を抽出する。
                        UserChoiceSearchDbuserList.Add(Trim(CType(targetControl, CheckBox).Tag))
                    End If
                End If
            Next





    Private Function SetOfficeControlStatus(ByVal OfficeCheckStatusGroup As Integer) As Boolean
        Try
            For Each targetControl As Control In Me.pnl_TargetOffice.Controls
                If (TypeOf (targetControl) Is CheckBox) AndAlso CType(targetControl, CheckBox).Enabled Then
                    Select Case OfficeCheckStatusGroup
                        Case IRSK.OFFICE_CHECK_STATUS_GROUP.SelectAll
                            CType(targetControl, CheckBox).Checked = True

                        Case IRSK.OFFICE_CHECK_STATUS_GROUP.UnSelectAll
                            CType(targetControl, CheckBox).Checked = False

                        Case Else
                            If GROUP_LIST(OfficeCheckStatusGroup).IndexOf(CType(targetControl, CheckBox).Tag) > -1 Then
                                CType(targetControl, CheckBox).Checked = True
                            Else
                                CType(targetControl, CheckBox).Checked = False
                            End If

                    End Select
                End If
            Next

            Return True

        Catch ex As Exception
            ShowErrorMessage(ex)
            Return False
        End Try
    End Function

                
                
