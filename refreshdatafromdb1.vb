Sub RefreshData()
    MsgBox "Data refreshed!"
End Sub

Sub GenerateSummary()
    Dim ws As Worksheet
    Set ws = ThisWorkbook.Sheets("Sheet1")
    
    Dim lastRow As Long
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    
    Dim totalApplications As Long
    totalApplications = Application.WorksheetFunction.CountA(ws.Range("A2:A" & lastRow))
    
    Dim totalHired As Long
    totalHired = Application.WorksheetFunction.CountIf(ws.Range("E2:E" & lastRow), "Hired")
    
    Dim totalRejected As Long
    totalRejected = Application.WorksheetFunction.CountIf(ws.Range("E2:E" & lastRow), "Rejected")
    
    MsgBox "Total Applications: " & totalApplications & vbCrLf & _
           "Total Hired: " & totalHired & vbCrLf & _
           "Total Rejected: " & totalRejected
End Sub

Sub CreatePivotTable()
    Dim ws As Worksheet
    Set ws = ThisWorkbook.Sheets("Sheet1")
    
    Dim pivotWs As Worksheet
    Set pivotWs = ThisWorkbook.Sheets.Add(After:=ws)
    pivotWs.Name = "PivotTable"
    
    Dim pivotRange As Range
    Set pivotRange = ws.Range("A1:H" & ws.Cells(ws.Rows.Count, "A").End(xlUp).Row)
    
    Dim pivotTable As PivotTable
    Set pivotTable = pivotWs.PivotTableWizard(SourceType:=xlDatabase, SourceData:=pivotRange)
    
    With pivotTable
        .PivotFields("PositionName").Orientation = xlRowField
        .PivotFields("Status").Orientation = xlColumnField
        .PivotFields("ApplicationID").Orientation = xlDataField
        .PivotFields("ApplicationID").Function = xlCount
    End With
End Sub

Sub CreateAdvancedChart()
    Dim ws As Worksheet
    Set ws = ThisWorkbook.Sheets("Sheet1")
    
    Dim chartObj As ChartObject
    Set chartObj = ws.ChartObjects.Add(Left:=100, Width:=375, Top:=50, Height:=225)
    
    With chartObj.Chart
        .SetSourceData Source:=ws.Range("B1:B" & ws.Cells(ws.Rows.Count, "B").End(xlUp).Row)
        .ChartType = xlColumnClustered
        .HasTitle = True
        .ChartTitle.Text = "Applications by Position"
        .Axes(xlCategory, xlPrimary).HasTitle = True
        .Axes(xlCategory, xlPrimary).AxisTitle.Text = "Position"
        .Axes(xlValue, xlPrimary).HasTitle = True
        .Axes(xlValue, xlPrimary).AxisTitle.Text = "Number of Applications"
    End With
End Sub