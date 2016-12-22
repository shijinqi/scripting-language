CONST ForReading = 1
CONST ForWriting = 2
CONST S_PATTERN = "(Reference=\*\\G\{[\w+-]+\w+\}#2.0#0#)(.+)(#Kingsoft ET 2.0 Object Library)"

Dim retValue 
Dim strPath
Dim strTemp

retValue = InputBox("请输入要修改工程文件中ETAPP路径的根目录：", "输入要修改工程文件中ETAPP路径的根目录(绝对路径)")
WScript.Echo "修改工程文件中ETAPP路径的根目录：" & retValue

If retValue <> ""   Then 
    If MsgBox("确定修改目录：" & vbCrLf & retValue   &   vbCrLf & "的ETAPP路径吗？",   vbYesNo +   vbInformation, "修改ETAPP路径")   =   vbYes   Then
        'strPath = InputBox("请输入修改后ETAPP路径：", "修改ETAPP路径")
		strPath = "C:\Windows\System32"

        WScript.Echo "修改后ETAPP路径为：" & strPath
        If strPath <> "" Then 
        	strTemp = Mid(strPath, InStrRev(strPath, "\") + 1)
        	If LCASE(strTemp) <> "etapp.dll" Then strPath = strPath & "\etapp.dll"
            MODIFYYSSCOMPONENT  retValue
        Else
            WScript.Echo "输入非法"    
        End If
    Else
        WScript.Echo "用户取消"
    End If
End If

Sub MODIFYYSSCOMPONENT(sPath)
    Dim objFSO          'the FileSystemObject
    Dim objFolder       'the folder object
    Dim colFolders      'collection of folders   
    Dim objFile         'the file object
    Dim colFiles        'collection of files 
    Dim objTextFile     'the file stream object for reading
    Dim objWriteFile    'the file stream object for writing
    Dim strTextFile     'the file content of objTextFile
    Dim sName           'the file name for reading
    Dim strTmpName      'the file name for writing
    Dim havData         'regex is match 
    Dim regEx           'the regex object
    Dim Matches
    Dim Match
    
    Set objFSO = CreateObject("Scripting.FileSystemObject")
    Set objFolder = objFSO.GetFolder(SPath)
    Set colFiles = objFolder.Files
    
    WScript.Echo SPath
    
    Set regEx = New RegExp
    regEx.Pattern = S_PATTERN
    regEx.IgnoreCase = True
    regEx.Global = True
    regEx.Multiline = False
    
    For Each objFile In colFiles
        sName = sPath & "\" & objFile.name
        If UCASE(RIGHT(sName, 4)) = ".VBP" THEN
        	WScript.Echo sName
            havData = False
            Set objTextFile = objFSO.OpenTextFile(sName, ForReading, False) 
            If Not objTextFile.AtEndofStream Then
	            strTextFile = objTextFile.ReadAll
            	If regEx.Test(strTextFile) Then
            		WScript.Echo "修改文件：" & sName
	                havData = True
	                strTextFile = regEx.Replace(strTextFile, "$1" & strPath & "$3")
	                strTmpName = sName & ".TXT"    
	                Set objWriteFile = objFSO.OpenTextFile(strTmpName, ForWriting, True)
	                objWriteFile.Write strTextFile
	                objWriteFile.Close
	                Set objWriteFile = Nothing
	            End If
            End If
            objTextFile.Close
            Set objTextFile = Nothing
            If havData Then
                objFSO.DeleteFile sName
                objFSO.CopyFile strTmpName, sName
            End If
        End If 
    Next
    
    Set colFolders = objFolder.SubFolders
    For Each objFolder In colFolders
	If UCASE(objFolder.name) <> ".SVN" THEN MODIFYYSSCOMPONENT(sPath & "\" & objFolder.name)
    Next
End Sub