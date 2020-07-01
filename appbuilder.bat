@ECHO OFF
@CLS

ECHO.
ECHO.	===========================================================
ECHO  	 TERIMAKASIH! TELAH MEMBELI SOURCE CODE DI UNITSELLERADS01
ECHO	 			DIBUAT OLEH : ALAM SANTIKO WIBOWO
ECHO.	===========================================================

ECHO.
ECHO.

ECHO.	===========================================================
ECHO  	  Jalankan program dibawah ini secara berturut-turut:
ECHO.	===========================================================
ECHO.
ECHO  	[a] Membuat Project Aplikasi
ECHO  	[b] Setting Plugin ID Iklan Admob
ECHO  	[c] Setting Plugin Nama Aplikasi
ECHO  	[d] Menambahkan Platform Android
ECHO.
ECHO  	[e] Membuat Testing Aplikasi [ Debugging ]
ECHO  	[f] Membuat Aplikasi Production [ Rilis ]
ECHO  	[g] Membuat Aplikasi Siap Upload Google Play
ECHO.
ECHO  	[h] Update Test Aplikasi
ECHO  	[i] Update Rilis Aplikasi

ECHO.
ECHO.	===========================================================

rem ECHO.
rem ECHO.

rem ECHO.	===========================================================
rem ECHO  	 Silahkan pilih platform yang kamu inginkan :
rem ECHO.	===========================================================
rem ECHO.
rem ECHO  	[1] Android
rem ECHO  	[2] IOS
rem ECHO  	[3] Web
rem ECHO.
rem ECHO.	===========================================================

ECHO.
ECHO.

:appbuilder

SET "program="
SET /p program= + Masukan pilihan program/platform kamu :
ECHO.

IF "%program%" equ "a" call buatproyek.bat
IF "%program%" equ "b" goto appID
IF "%program%" equ "c" goto appName
IF "%program%" equ "d" goto addPlatform
IF "%program%" equ "e" goto buildtest
IF "%program%" equ "f" goto buildrilis
IF "%program%" equ "g" goto persiapanupload

IF "%program%" equ "h" goto updapptest
IF "%program%" equ "i" goto updapprilis

rem IF "%program%" == 1 cordova platform add android
rem IF "%program%" == 2 cordova platform add ios
rem IF "%program%" == 3 cordova platform add browser

ECHO.
ECHO + Pilihan Yang Anda Masukan Salah. Silahkan Ulangi Kembali.
ECHO.
PAUSE
GOTO appbuilder

SET APP_NAME=Master Chess Indonesia
SET APP_ID=ca-app-pub-3821963146527465~9690679929

:appID
cordova plugin add cordova-plugin-admobpro --save --variable ADMOB_APP_ID="%APP_ID%"
GOTO appbuilder

:appName
cordova plugin add cordova-plugin-app-name --variable APP_NAME="%APP_NAME%"
GOTO appbuilder

:addPlatform
cordova platform add android
GOTO appbuilder

:buildtest
cordova build android
GOTO appbuilder

:buildrilis
cordova build android --release
GOTO appbuilder

:persiapanupload
move signapk.bat platforms\android\app\build\outputs\apk\release && cd platforms\android\app\build\outputs\apk\release && signapk
GOTO appbuilder

:updapptest
cordova build android
GOTO appbuilder

:updapprilis
cordova build android --release
GOTO appbuilder

 
