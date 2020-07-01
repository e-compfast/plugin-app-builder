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
ECHO  	 	Jalankan program dibawah ini secara berturut-turut:
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

ECHO.
ECHO.

ECHO.	===========================================================
ECHO  	 Silahkan pilih platform yang kamu inginkan :
ECHO.	===========================================================
ECHO.
ECHO  	[1] Android
ECHO  	[2] IOS
ECHO  	[3] Web
ECHO.
ECHO.	===========================================================

ECHO.
ECHO.

:appbuilder

SET "program="
SET /p program= + Masukan pilihan program/platform kamu :
ECHO.

rem IF "%program%" equ "a" goto projectApp
IF "%program%" equ "b" goto appID
IF "%program%" equ "c" goto appName
IF "%program%" equ "d" goto addPlatform
IF "%program%" equ "e" goto buildtest
IF "%program%" equ "f" goto buildrilis
IF "%program%" equ "g" goto persiapanupload

IF "%program%" equ "h" goto updapptest
IF "%program%" equ "i" goto updapprilis

IF "%program%" == 1 cordova platform add android
IF "%program%" == 2 cordova platform add ios
IF "%program%" == 3 cordova platform add browser

ECHO.
ECHO + Pilihan Yang Anda Masukan Salah. Silahkan Ulangi Kembali.
ECHO.
PAUSE
GOTO appbuilder

rem :projectApp
rem cordova create masterchess com.masterchess.app masterchessApp
rem move signapk.bat masterchess
rem move appbuilder.bat masterchess && cd masterchess && appbuilder
rem GOTO appbuilder

:appID
cordova plugin add cordova-plugin-admobpro --save --variable ADMOB_APP_ID="ca-app-pub-3821963146527465~9690679929"
GOTO appbuilder

:appName
cordova plugin add cordova-plugin-app-name --variable APP_NAME="Master Chess Indonesia"
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

 
