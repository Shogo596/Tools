Option Explicit

'============================================================================================
' ��d�N���Ď����s�o�b�`
' 
' ���̃o�b�`��ʂ��ăA�v���P�[�V���������s���邱�Ƃő��d�N����h�~����B
' ���s����A�v���P�[�V�����͈ȉ��Ŏw�肷��B
'============================================================================================

Dim wmiLocator
Dim wmiService
Dim objEnumerator
Dim strQuery
Dim WSHShell
Dim cmd

'------------------------------------------------------------
'���s�A�v���P�[�V�����̎w��
cmd = "notepad.exe"
'------------------------------------------------------------

'�O����
strQuery = "Select * FROM Win32_Process WHERE (Caption = 'wscript.exe' OR " & _
	"Caption = 'cscript.exe') AND CommandLine LIKE '%" & WScript.ScriptName & "%'"
Set wmiLocator = CreateObject("WbemScripting.SWbemLocator")
Set wmiService = wmiLocator.ConnectServer
Set objEnumerator = wmiService.ExecQuery(strQuery)

'���d�N������
If objEnumerator.Count > 1 Then
	WScript.Echo "�����A�v���P�[�V���������s����Ă��܂��B"
Else
	Set WSHShell = WScript.CreateObject("WScript.Shell")
	WSHShell.Run cmd,1,true
End If
