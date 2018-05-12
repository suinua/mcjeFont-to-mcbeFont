import os,strutils,re
#newFontフォルダが無ければ作成
if os.existsDir("beFont") == false:
  createDir("beFont")
if os.existsDir("jeFont") == false:
  createDir("jeFont")  
for file in walkDirRec("jeFont/",{pcFile}):
  if file != "jeFont/ignore":
    var newFileName = file.replace("unicode_page","glyph").replace("jeFont","beFont")
    newFileName = newFileName.replace(newFileName[13..newFileName.len()-5],newFileName[13..newFileName.len()-5].toUpperAscii)
    moveFile(file,newFileName)