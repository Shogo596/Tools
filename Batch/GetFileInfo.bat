@ECHO OFF 

rem ====================================================================================================================
rem 【ファイルサイズ・更新日取得バッチ】
rem 
rem 第一引数（もしくはドラッグアンドドロップ）で指定されたフォルダにある全てのファイルの以下情報を出力します。
rem なお、サブディレクトリも対象です。
rem 
rem ＜出力内容＞
rem ・ファイル名
rem ・ファイルサイズ
rem ・更新日時
rem ====================================================================================================================

rem 引数取得
set directory=%1

echo ★★実行開始★★
echo.

rem 全てのファイルでループ
echo ----
echo FileName, Size(bytes), Date, Time
forfiles /S /P %directory% /c "cmd /c echo @file, @fsize, @fdate, @ftime"
echo ----

echo.
echo ★★実行終了★★
