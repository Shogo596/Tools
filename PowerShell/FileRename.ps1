# 以下の「置換したい単語」と「置換後の単語」を修正して置換したいファイルがあるフォルダにこのバッチを格納して実行する。
Get-ChildItem | Rename-Item -NewName { $_.Name -replace '置換したい単語','置換後の単語' }
