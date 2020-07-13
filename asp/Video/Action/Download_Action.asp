<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
Response.Buffer = True
Dim Stream
Dim Contents
Dim FilePath
Dim FileName
Const adTypeBinary = 1
FilePath = Session("Video_Path")
FileName = Right(FilePath,Len(FilePath)-InstrRev(FilePath,"/"))
Response.Clear
Response.ContentType = "application/octet-stream"
Response.AddHeader "content-disposition", "attachment; filename=" & FileName
Set Stream = server.CreateObject("ADODB.Stream")
Stream.Type = adTypeBinary
Stream.Open
Stream.LoadFromFile Server.MapPath(FilePath)
While Not Stream.EOS
	Response.BinaryWrite Stream.Read(1024 * 64)
Wend
Stream.Close
Set Stream = Nothing
Response.Flush
Response.End
%>