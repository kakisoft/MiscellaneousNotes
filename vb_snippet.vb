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
