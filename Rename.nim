import os,strutils,re
#newFontフォルダが無ければ作成
if os.existsDir("beFont") == false:
  createDir("newFont")
#fontフォルダがあれば一括リネーム
if os.existsDir("javaFont") == false:
  echo "ERROR fontフォルダがありません。"
else:
  for file in walkDirRec("javaFont/",{pcFile}):
    var newFileName = file.replace("unicode_page","glyph").replace("javaFont","beFont")
    newFileName = newFileName.replace(newFileName[13..newFileName.len()-5],newFileName[13..newFileName.len()-5].toUpperAscii)
    moveFile(file,newFileName)