@ECHO OFF
ECHO.
ECHO.	===========================================================
ECHO  	 SELAMAT ! SATU LANGKAH LAGI APLIKASI RILIS SIAP UPLOAD
ECHO	 			      KE GOOGLE PLAYSTORE
ECHO.	===========================================================

ECHO.	===========================================================
ECHO  	 Jalankan semua perintah dibawah ini:
ECHO.	===========================================================
ECHO.
ECHO  	[1] Membuat Keystore
ECHO  	[2] Sign Keystore
ECHO  	[3] Merilis Aplikasi Siap Upload
ECHO.
ECHO.	===========================================================

:buat
SET "ans="
ECHO.
SET /p ans= + Silahkan masukan pilihan Anda ?
ECHO.
IF /i "%ans%" equ "1" goto buatkeystore
IF /i "%ans%" equ "2" goto singkeystore
IF /i "%ans%" equ "3" goto releaseapk
IF /i "%ans%" equ "4" goto help
IF /i "%ans%" equ "x" goto exit
IF /i "%ans%" equ "up" goto upd

echo + Pilihan Yang Anda Masukan Salah. Silahkan Ulangi Kembali.
pause
goto buat

:buatkeystore
ECHO 				+ Kamu memilih perintah no 1 +
ECHO.	===========================================================
ECHO 	 + MEMBUAT KEYSTORE
ECHO.	===========================================================

ECHO.
keytool -genkey -v -keystore namakeystore.keystore -alias namaAplikasi -keyalg RSA -keysize 2048 -validity 10000
ECHO.
goto buat

:singkeystore
ECHO 				+ Kamu memilih perintah no 2 +
ECHO.	===========================================================
ECHO 	 + MENJALANKAN APP SIGNER
ECHO.	===========================================================
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore namakeystore.keystore app-release-unsigned.apk namaAplikasi
ECHO.
goto buat

:releaseapk
ECHO 				+ Kamu memilih perintah no 3 +
ECHO.	===========================================================
ECHO 	 + MERILIS OUTPUT APLIKASI SIAP UPLOAD
ECHO.	===========================================================
zipalign -v 4 app-release-unsigned.apk app-release1.0.0.apk
ECHO.
goto buat

:upd
SET "jwb="
SET /p jwb= + Ingin update perubahan aplikasi ? (ya/tidak)
IF /i "%jwb%" equ "ya" goto backfolder
IF /i "%jwb%" equ "y" goto backfolder
IF /i "%jwb%" equ "t" goto buat 
IF /i "%jwb%" equ "tidak" goto buat
goto buat

:backfolder
cd ..
cd ..
cd ..
cd ..
cd ..
cd ..
cd ..
