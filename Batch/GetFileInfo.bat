@ECHO OFF 

rem ====================================================================================================================
rem �y�t�@�C���T�C�Y�E�X�V���擾�o�b�`�z
rem 
rem �������i�������̓h���b�O�A���h�h���b�v�j�Ŏw�肳�ꂽ�t�H���_�ɂ���S�Ẵt�@�C���̈ȉ������o�͂��܂��B
rem �Ȃ��A�T�u�f�B���N�g�����Ώۂł��B
rem 
rem ���o�͓��e��
rem �E�t�@�C����
rem �E�t�@�C���T�C�Y
rem �E�X�V����
rem ====================================================================================================================

rem �����擾
set directory=%1

echo �������s�J�n����
echo.

rem �S�Ẵt�@�C���Ń��[�v
echo ----
echo FileName, Size(bytes), Date, Time
forfiles /S /P %directory% /c "cmd /c echo @file, @fsize, @fdate, @ftime"
echo ----

echo.
echo �������s�I������
