@echo off

set ST_GCC_ARCH=x86_64
set ST_VC_ARCH=64
set ST_CB_ARCH=AMD64

set ST_FFMPEG=FFmpeg-2016-03-29-git-fda00aa-%ST_GCC_ARCH%-w64-mingw32-4.9.2-LGPL
set ST_FREETYPE=freetype-2.5.5-vc10-%ST_VC_ARCH%
set ST_OPENAL=openal-soft-1.17.0-vc10-%ST_VC_ARCH%
set ST_WEBP=libwebp-0.2-vc10-%ST_VC_ARCH%.zip

if not exist "%~dp0\..\lib\WIN_vc_%ST_CB_ARCH%\"       mkdir "%~dp0\..\lib\WIN_vc_%ST_CB_ARCH%\"
if not exist "%~dp0\..\lib\WIN_vc_%ST_CB_ARCH%_DEBUG\" mkdir "%~dp0\..\lib\WIN_vc_%ST_CB_ARCH%_DEBUG\"

cscript //nologo "%~dp0unpack_zip.vbs" "%~dp0%ST_FFMPEG%.zip"   "%~dp0"
cscript //nologo "%~dp0unpack_zip.vbs" "%~dp0%ST_FREETYPE%.zip" "%~dp0"
cscript //nologo "%~dp0unpack_zip.vbs" "%~dp0%ST_OPENAL%.zip"   "%~dp0"
cscript //nologo "%~dp0unpack_zip.vbs" "%~dp0%ST_WEBP%.zip"     "%~dp0"

xcopy /Y "%~dp0%ST_FFMPEG%\include\*"   "%~dp0\..\include\"
xcopy /Y "%~dp0%ST_FFMPEG%\lib\*"       "%~dp0\..\lib\WIN_vc_%ST_CB_ARCH%\"
xcopy /Y "%~dp0%ST_FFMPEG%\lib\*"       "%~dp0\..\lib\WIN_vc_%ST_CB_ARCH%_DEBUG\"
xcopy /Y "%~dp0%ST_FREETYPE%\include\*" "%~dp0\..\include\"
xcopy /Y "%~dp0%ST_FREETYPE%\lib\*"     "%~dp0\..\lib\WIN_vc_%ST_CB_ARCH%\"
xcopy /Y "%~dp0%ST_FREETYPE%\lib\*"     "%~dp0\..\lib\WIN_vc_%ST_CB_ARCH%_DEBUG\"
xcopy /Y "%~dp0%ST_OPENAL%\include\*"   "%~dp0\..\include\"
xcopy /Y "%~dp0%ST_OPENAL%\lib\*"       "%~dp0\..\lib\WIN_vc_%ST_CB_ARCH%\"
xcopy /Y "%~dp0%ST_OPENAL%\lib\*"       "%~dp0\..\lib\WIN_vc_%ST_CB_ARCH%_DEBUG\"
xcopy /Y "%~dp0%ST_WEBP%\lib\*"         "%~dp0\..\lib\WIN_vc_%ST_CB_ARCH%\"
xcopy /Y "%~dp0%ST_WEBP%\libd\*"        "%~dp0\..\lib\WIN_vc_%ST_CB_ARCH%_DEBUG\"
