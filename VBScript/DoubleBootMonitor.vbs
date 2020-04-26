Option Explicit

'============================================================================================
' 二重起動監視実行バッチ
' 
' このバッチを通してアプリケーションを実行することで多重起動を防止する。
' 実行するアプリケーションは以下で指定する。
'============================================================================================

Dim wmiLocator
Dim wmiService
Dim objEnumerator
Dim strQuery
Dim WSHShell
Dim cmd

'------------------------------------------------------------
'実行アプリケーションの指定
cmd = "notepad.exe"
'------------------------------------------------------------

'前準備
strQuery = "Select * FROM Win32_Process WHERE (Caption = 'wscript.exe' OR " & _
	"Caption = 'cscript.exe') AND CommandLine LIKE '%" & WScript.ScriptName & "%'"
Set wmiLocator = CreateObject("WbemScripting.SWbemLocator")
Set wmiService = wmiLocator.ConnectServer
Set objEnumerator = wmiService.ExecQuery(strQuery)

'多重起動判定
If objEnumerator.Count > 1 Then
	WScript.Echo "同じアプリケーションが実行されています。"
Else
	Set WSHShell = WScript.CreateObject("WScript.Shell")
	WSHShell.Run cmd,1,true
End If
