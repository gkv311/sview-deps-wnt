theZipFile   = WScript.Arguments.Item(0)
theOutFolder = WScript.Arguments.Item(1)

set aScriptShellObj = WScript.CreateObject("WScript.Shell")

' Create output folder if not exist
set aFileObj = CreateObject("Scripting.FileSystemObject")
if NOT aFileObj.FolderExists(theOutFolder) then
  aFileObj.CreateFolder(theOutFolder)
end if

' Open ZIP folder
set aShellApp = CreateObject("Shell.Application")
set aZipFolderObj = aShellApp.NameSpace(theZipFile)
if (aZipFolderObj is nothing) then
  set aZipFolderObj = aShellApp.NameSpace(aScriptShellObj.CurrentDirectory + "\" + theZipFile)
  if (aZipFolderObj is nothing) then
    WScript.Echo("Error! ZIP file can not be opened: " + theZipFile)
    Wscript.Quit
  end if
end if

' Open output folder
set anOutFolderObj = aShellApp.NameSpace(theOutFolder)
if (anOutFolderObj is nothing) then
  set anOutFolderObj = aShellApp.NameSpace(aScriptShellObj.CurrentDirectory + "\" + theOutFolder)
  if (aZipFolderObj is nothing) then
    WScript.Echo("Error! Output folder can not be opened: " + theOutFolder)
    Wscript.Quit
  end if
end if

' Unpack ZIP content with overriding flag
set aFilesInZip = aZipFolderObj.items
theCopyOptions = 16
anOutFolderObj.CopyHere aFilesInZip, theCopyOptions

set aFileObj  = nothing
set aShellApp = nothing
