Option Explicit

'============================================================================================
' �t�@�C����������u���o�b�`vbs
' 
' ���̃o�b�`�ɕ������u���������t�@�C���i�����j���h���b�N���h���b�v���A
' �u����������ƒu���敶�������͂���ƑΏۂ̃t�@�C������u������B
'============================================================================================


'�Ώۃt�@�C���̃h���b�O���h���b�v�ɂ��擾
Dim Args, Arg
Set Args = WScript.Arguments
 
'���[�U�[����
Dim ReplacedWord
Dim ReplacingWord
ReplacedWord = InputBox("�u���������镶������͂��Ă�������", "�u�����̓���")
If IsEmpty(ReplacedWord) = True Then
  WScript.Quit
End If
ReplacingWord = InputBox("�u��������������͂��Ă�������", "�u�����̓���")
If IsEmpty(ReplacingWord) = True Then
  WScript.Quit
End If
 
Dim objFSO        'FileSystemObject
Dim objFileRead   '�t�@�C���ǂݍ��ݗp
Dim objFileWrite  '�t�@�C���������ݗp
Dim objFileOpe    '�t�@�C������p
Dim objFileName   '�t�@�C����
 
Set objFso = WSCript.CreateObject("Scripting.FileSystemObject")
If Err.Number = 0 Then
  For Each Arg In Args
 
    '�t�@�C�����쏀��
    Set objFileRead = WSCript.CreateObject("ADODB.Stream")
    Set objFileWrite = WSCript.CreateObject("ADODB.Stream")
    Set objFileOpe = objFSO.GetFile(Arg)
    objFileName = objFileOpe.Path

    '�Ǎ��t�@�C������
    objFileRead.Type = 2                  ' 1�F�o�C�i���E2�F�e�L�X�g
    objFileRead.Charset = "UTF-8"         ' �����R�[�h�w��
    objFileRead.Open                      ' Stream �I�u�W�F�N�g���J��
    objFileRead.LoadFromFile objFileName  ' �t�@�C����ǂݍ���

    '�����t�@�C������
    objFileWrite.Type = 2
    objFileWrite.Charset = "UTF-8"
    objFileWrite.Open

    '1�s���ǂݍ��݁��u��
    If Err.Number = 0 Then
      Do Until objFileRead.EOS
        Dim Line
        Line = objFileRead.ReadText(-2)    ' -1�F�S�s�ǂݍ��݁E-2�F��s�ǂݍ���
        objFileWrite.WriteText Replace(Line, ReplacedWord, ReplacingWord), 1
      Loop

      '�����t�@�C���ɏ㏑��
     objFileWrite.SaveToFile objFileName, 2    '1�F�w��t�@�C�����Ȃ���ΐV�K�쐬�E2�F�t�@�C��������ꍇ�͏㏑��

      objFileRead.Close
      objFileWrite.Close
    Else
      WScript.Echo "�G���[: " & Err.Description
    End If
 
  Next
Else
  WScript.Echo "�G���[: " & Err.Description
End If
 
Set objFSO = Nothing
Set objFileRead = Nothing
Set objFileWrite = Nothing
Set objFileOpe = Nothing
