import os_files.dialog

import os,strutils,re,dialogs

proc system(formatstr: cstring) {.header: "<stdio.h>", importc: "system", varargs.}

echo "select font folder"
var di:DialogInfo
di.kind = dkSelectFolder
di.title = "変換するフォントを選択"
di.folder = "C:\\"
di.extension = "rod"
let fontFolderPath = di.show()

if os.existsDir("beFont") == false:
  createDir("beFont") 

for file in walkDirRec(fontFolderPath&"/",{pcFile}):
  if file != fontFolderPath&"/ignore":
    var newFileName = file.replace("unicode_page","glyph").replace(fontFolderPath,"beFont")
    newFileName = newFileName.replace(newFileName[newFileName.len()-6..newFileName.len()-5],newFileName[newFileName.len()-6..newFileName.len()-5].toUpperAscii)
    moveFile(file,newFileName)
system("explorer beFont")