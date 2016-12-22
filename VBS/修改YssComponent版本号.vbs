CONST ForReading = 1
CONST ForWriting = 2
CONST S_PATTERN = "(Object=\{[\w+-]+\w+\}#)(\d+\.)(\d+)(#\d*;\s+YssComponent.ocx)"

Dim retValue 
Dim intVersion

retValue = InputBox("请输入要修改YssComponent版本号的根目录：", "修改YssComponent版本号的根目录(绝对路径)")
WScript.Echo "SVN标识的根目录：" & retValue

If retValue <> ""   Then 
    If MsgBox("确定修改目录：" & retValue   &   vbCrLf & "的YssComponent版本号吗？",   vbYesNo +   vbInformation, "修改YssComponent版本号")   =   vbYes   Then
        intVersion = InputBox("修改YssComponent版本号为：", "修改YssComponent版本号")
        WScript.Echo "修改YssComponent版本号为：" & intVersion
        If intVersion > 0 Then 
            intVersion = intVersion & "."
            MODIFYYSSCOMPONENT   retValue
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
    
    Set objFSO = CreateObject("Scripting.FileSystemObject")
    Set objFolder = objFSO.GetFolder(SPath)
    Set colFiles = objFolder.Files
    
    Set regEx = New RegExp
    regEx.Pattern = S_PATTERN
    regEx.IgnoreCase = True
    regEx.Global = True
    regEx.Multiline = False
    
    For Each objFile In colFiles
        sName = sPath & "\" & objFile.name
        If UCASE(RIGHT(sName, 4)) = ".VBP" THEN
            havData = False
            strTmpName = sName & ".TXT"    
            WScript.Echo sName
            Set objTextFile = objFSO.OpenTextFile(sName, ForReading, False) 
            If Not objTextFile.AtEndofStream Then
                havData = True
                Set objWriteFile = objFSO.OpenTextFile(strTmpName, ForWriting, True)
                strTextFile = objTextFile.ReadAll
                strTextFile = regEx.Replace(strTextFile, "$1" & intVersion & "$3$4")
                objWriteFile.Write strTextFile
                objWriteFile.Close
                Set objWriteFile = Nothing
            End If
            objTextFile.Close
            Set objTextFile = Nothing
            If havData Then
                objFSO.DeleteFile sName
                objFSO.MoveFile strTmpName, sName
            End If
        End If 
    Next
    
    Set colFolders = objFolder.SubFolders
    For Each objFolder In colFolders
        MODIFYYSSCOMPONENT(sPath & "\" & objFolder.name)
    Next
End Sub