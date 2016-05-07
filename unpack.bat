@echo off

set ST_GCC_ARCH=x86_64
set ST_VC_ARCH=64
set ST_CB_ARCH=AMD64
set ST_VC_VER=vc10

set ST_FFMPEG=ffmpeg-7.1-%ST_GCC_ARCH%-w64-mingw32-lgpl
set ST_FREETYPE=freetype-2.5.5-%ST_VC_VER%-%ST_VC_ARCH%
set ST_OPENAL=openal-soft-1.17.0-%ST_VC_VER%-%ST_VC_ARCH%
set ST_OPENVR=openvr-1.0.5-%ST_VC_ARCH%
set ST_WEBP=libwebp-1.0.2-%ST_VC_VER%-%ST_VC_ARCH%
set ST_NVAPI=nvapi-%ST_VC_VER%-%ST_VC_ARCH%

set "ST_INC=%~dp0\..\include\"
set "ST_LIB_RELEASE=%~dp0\..\lib\WIN_vc_%ST_CB_ARCH%\"
set "ST_LIB_DEBUG=%~dp0\..\lib\WIN_vc_%ST_CB_ARCH%_DEBUG\"
if not exist "%ST_LIB_RELEASE%" mkdir "%ST_LIB_RELEASE%"
if not exist "%ST_LIB_DEBUG%"   mkdir "%ST_LIB_DEBUG%"

cscript //nologo "%~dp0unpack_zip.vbs" "%~dp0%ST_FFMPEG%.zip"   "%~dp0"
cscript //nologo "%~dp0unpack_zip.vbs" "%~dp0%ST_FREETYPE%.zip" "%~dp0"
cscript //nologo "%~dp0unpack_zip.vbs" "%~dp0%ST_OPENAL%.zip"   "%~dp0"
cscript //nologo "%~dp0unpack_zip.vbs" "%~dp0%ST_OPENVR%.zip"   "%~dp0"
cscript //nologo "%~dp0unpack_zip.vbs" "%~dp0%ST_WEBP%.zip"     "%~dp0"
cscript //nologo "%~dp0unpack_zip.vbs" "%~dp0%ST_NVAPI%.zip"    "%~dp0"

xcopy /S /Y "%~dp0%ST_FFMPEG%\include\*"   "%ST_INC%"
xcopy /S /Y "%~dp0%ST_FFMPEG%\lib\*"       "%ST_LIB_RELEASE%"
xcopy /S /Y "%~dp0%ST_FFMPEG%\lib\*"       "%ST_LIB_DEBUG%"
xcopy /S /Y "%~dp0%ST_FREETYPE%\include\*" "%ST_INC%"
xcopy /S /Y "%~dp0%ST_FREETYPE%\lib\*"     "%ST_LIB_RELEASE%"
xcopy /S /Y "%~dp0%ST_FREETYPE%\lib\*"     "%ST_LIB_DEBUG%"
xcopy /S /Y "%~dp0%ST_OPENAL%\include\*"   "%ST_INC%"
xcopy /S /Y "%~dp0%ST_OPENAL%\lib\*"       "%ST_LIB_RELEASE%"
xcopy /S /Y "%~dp0%ST_OPENAL%\lib\*"       "%ST_LIB_DEBUG%"
xcopy /S /Y "%~dp0%ST_OPENVR%\include\*"   "%ST_INC%"
xcopy /S /Y "%~dp0%ST_OPENVR%\lib\*"       "%ST_LIB_RELEASE%"
xcopy /S /Y "%~dp0%ST_OPENVR%\lib\*"       "%ST_LIB_DEBUG%"
xcopy /S /Y "%~dp0%ST_WEBP%\lib\*"         "%ST_LIB_RELEASE%"
xcopy /S /Y "%~dp0%ST_WEBP%\libd\*"        "%ST_LIB_DEBUG%"
xcopy /S /Y "%~dp0%ST_NVAPI%\lib\*"        "%ST_LIB_RELEASE%"
xcopy /S /Y "%~dp0%ST_NVAPI%\lib\*"        "%ST_LIB_DEBUG%"
