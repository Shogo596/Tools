@echo off

rem ===============================================================================================================================
rem �y�t�@�C�������o�b�`�z
rem ���̃o�b�`�Ƀt�@�C�����h���b�O���h���b�v����Ƃ��̃t�@�C����C�ӂ̃T�C�Y�ɕ�������B
rem �Ⴆ�΁A�t�@�C���T�C�Y�ɐ���������T�C�g�ȂǂɎg���B
rem ��������ɂ́u1.cab�v���J���āA���g���E�N���b�N����C�ӂ̏ꏊ�ɓW�J���邱�ƁB
rem ===============================================================================================================================

echo.
echo ���������J�n����
echo.

set split_size=3145728
set ddf=%TEMP%\cabprof.ddf
(echo %1) > "%ddf%"

rem �ȉ��́uMaxDiskSize�v�̐ݒ�l����������t�@�C���T�C�Y�ɂȂ�܂��B�i��F3145728����3MB�ɕ��������B�j
makecab /d MaxDiskSize=%split_size% /d RptFileName=NUL /d InfFileName=NUL /d DiskDirectoryTemplate="%~n1" /f "%ddf%"

del "%ddf%"

echo.
echo ���������I������
exit /b
