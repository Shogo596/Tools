Option Explicit

'============================================================================================
' ファイル内文字列置換バッチvbs
' 
' このバッチに文字列を置換したいファイル（複数可）をドラック＆ドロップし、
' 置換元文字列と置換先文字列を入力すると対象のファイル内を置換する。
'============================================================================================


'対象ファイルのドラッグ＆ドロップによる取得
Dim Args, Arg
Set Args = WScript.Arguments
 
'ユーザー入力
Dim ReplacedWord
Dim ReplacingWord
ReplacedWord = InputBox("置き換えられる文字を入力してください", "置換情報の入力")
If IsEmpty(ReplacedWord) = True Then
  WScript.Quit
End If
ReplacingWord = InputBox("置き換え文字を入力してください", "置換情報の入力")
If IsEmpty(ReplacingWord) = True Then
  WScript.Quit
End If
 
Dim objFSO        'FileSystemObject
Dim objFileRead   'ファイル読み込み用
Dim objFileWrite  'ファイル書き込み用
Dim objFileOpe    'ファイル操作用
Dim objFileName   'ファイル名
 
Set objFso = WSCript.CreateObject("Scripting.FileSystemObject")
If Err.Number = 0 Then
  For Each Arg In Args
 
    'ファイル操作準備
    Set objFileRead = WSCript.CreateObject("ADODB.Stream")
    Set objFileWrite = WSCript.CreateObject("ADODB.Stream")
    Set objFileOpe = objFSO.GetFile(Arg)
    objFileName = objFileOpe.Path

    '読込ファイル準備
    objFileRead.Type = 2                  ' 1：バイナリ・2：テキスト
    objFileRead.Charset = "UTF-8"         ' 文字コード指定
    objFileRead.Open                      ' Stream オブジェクトを開く
    objFileRead.LoadFromFile objFileName  ' ファイルを読み込む

    '書込ファイル準備
    objFileWrite.Type = 2
    objFileWrite.Charset = "UTF-8"
    objFileWrite.Open

    '1行ずつ読み込み＆置換
    If Err.Number = 0 Then
      Do Until objFileRead.EOS
        Dim Line
        Line = objFileRead.ReadText(-2)    ' -1：全行読み込み・-2：一行読み込み
        objFileWrite.WriteText Replace(Line, ReplacedWord, ReplacingWord), 1
      Loop

      '書込ファイルに上書き
     objFileWrite.SaveToFile objFileName, 2    '1：指定ファイルがなければ新規作成・2：ファイルがある場合は上書き

      objFileRead.Close
      objFileWrite.Close
    Else
      WScript.Echo "エラー: " & Err.Description
    End If
 
  Next
Else
  WScript.Echo "エラー: " & Err.Description
End If
 
Set objFSO = Nothing
Set objFileRead = Nothing
Set objFileWrite = Nothing
Set objFileOpe = Nothing
