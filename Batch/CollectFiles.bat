@echo off

rem ========================================================================================
rem 【ファイル収集バッチ】
rem 引数（ドラッグ＆ドロップ）に指定したディレクトリ（サブDir含む）から
rem 特定の拡張子のファイルをバッチ直下にコピーする。
rem 
rem ========================================================================================

echo ☆☆処理開始☆☆
echo.

rem ----------------------------------------------------------------------------------------
rem 現在ディレクトリに移動
rem ----------------------------------------------------------------------------------------
cd %~dp0

rem ----------------------------------------------------------------------------------------
rem 引数チェック。引数が無ければプログラム終了。
rem ----------------------------------------------------------------------------------------
if "%1"=="" (
	echo Err：ファイルを集めるフォルダを引数（ドラッグ＆ドロップ）で指定してください。
	echo.
	pause
	goto :end
)

rem ----------------------------------------------------------------------------------------
rem 取得するファイル名の設定
rem ----------------------------------------------------------------------------------------
echo 集めるファイルの拡張子を指定してください。
set /p ext="> "
set file_name=*.%ext%

echo ☆☆コピー開始☆☆
echo.

rem ----------------------------------------------------------------------------------------
rem 引数のループ開始。（複数引数対応）
rem ----------------------------------------------------------------------------------------
set count=1
:loop

	rem ----------------------------------------------------------------------------------------
	rem 引数がなくなればループ終了
	rem ----------------------------------------------------------------------------------------
	if "%1"=="" (
		echo ☆☆コピー終了☆☆
		goto :end
	)

	rem ----------------------------------------------------------------------------------------
	rem ファイルコピー実行
	rem ----------------------------------------------------------------------------------------
	set dir_name=%1
	call :copy_files

	rem ----------------------------------------------------------------------------------------
	rem 次の引数へ
	rem ----------------------------------------------------------------------------------------
	set /a count+=1
	shift
	goto loop

rem ----------------------------------------------------------------------------------------
rem ファイルコピー実行。（フォルダ構成は引き継がない。）
rem ----------------------------------------------------------------------------------------
:copy_files
	for /r %dir_name% %%f in (%file_name%) do (
		xcopy /D /I /Y "%%f" .
	)
	exit /b

rem ----------------------------------------------------------------------------------------
rem 終了処理
rem ----------------------------------------------------------------------------------------
:end
echo.
echo ☆☆処理終了☆☆
pause

