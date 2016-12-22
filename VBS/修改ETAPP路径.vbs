CONST ForReading = 1
CONST ForWriting = 2
CONST S_PATTERN = "(Reference=\*\\G\{[\w+-]+\w+\}#2.0#0#)(.+)(#Kingsoft ET 2.0 Object Library)"

Dim retValue 
Dim strPath
Dim strTemp

retValue = InputBox("������Ҫ�޸Ĺ����ļ���ETAPP·���ĸ�Ŀ¼��", "����Ҫ�޸Ĺ����ļ���ETAPP·���ĸ�Ŀ¼(����·��)")
WScript.Echo "�޸Ĺ����ļ���ETAPP·���ĸ�Ŀ¼��" & retValue

If retValue <> ""   Then 
    If MsgBox("ȷ���޸�Ŀ¼��" & vbCrLf & retValue   &   vbCrLf & "��ETAPP·����",   vbYesNo +   vbInformation, "�޸�ETAPP·��")   =   vbYes   Then
        'strPath = InputBox("�������޸ĺ�ETAPP·����", "�޸�ETAPP·��")
		strPath = "C:\Windows\System32"

        WScript.Echo "�޸ĺ�ETAPP·��Ϊ��" & strPath
        If strPath <> "" Then 
        	strTemp = Mid(strPath, InStrRev(strPath, "\") + 1)
        	If LCASE(strTemp) <> "etapp.dll" Then strPath = strPath & "\etapp.dll"
            MODIFYYSSCOMPONENT  retValue
        Else
            WScript.Echo "����Ƿ�"    
        End If
    Else
        WScript.Echo "�û�ȡ��"
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
            		WScript.Echo "�޸��ļ���" & sName
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