@ECHO OFF
ECHO.
ECHO.

ECHO.	===========================================================
ECHO  	 Jalankan Perintah Yang kamu inginkan :
ECHO.	===========================================================
ECHO.
ECHO  	[1] Membuat Project
ECHO  	[2] Memulai Project
ECHO.
ECHO.	===========================================================

ECHO.
ECHO.
ECHO Membuat Project Aplikasi
ECHO.

SET FOLDER_NAME=masterchess
SET PACKAGE_NAME=com.masterchess.app
SET PROJECT_NAME=com.masterchess.app

:menu 
SET "pilihanmenu="
ECHO.
SET /p pilihanmenu= + Masukan nomor menu :
IF /i "%pilihanmenu%" equ "1" goto projectApp
IF /i "%pilihanmenu%" equ "2" goto mulaiproject
ECHO.
ECHO + Pilihan tidak ada. Silahkan coba lagi.
GOTO menu

:projectApp
cordova create "%FOLDER_NAME%" "%PACKAGE_NAME%" "%PROJECT_NAME%"
GOTO menu

:mulaiproject
move signapk.bat "%FOLDER_NAME%"  && move appbuilder.bat "%FOLDER_NAME%"
cd "%FOLDER_NAME%" && call appbuilder.bat
GOTO menu
