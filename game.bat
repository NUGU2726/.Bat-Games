@echo off
:title
cls
set ver=0.1.6 ver
echo -----------[���� ����]-----------
title �̴� ���� ����� %ver%
echo -----------[  ����  ]-----------
echo -----------[  ����  ]-----------
echo -----------[  ����  ]-----------
set /p out=�����ϼ���(����,����,����)
if %out%==���� goto gamestart
if %out%==���� goto version
if %out%==���� exit
if %out%==debugMode goto debug
goto title

:debug
set /p out=�����ϼ���(on,off) : 
if %out%==on set debug=1
if %out%==off set debug=


:updown
title �� �ٿ� ����
echo �÷��� �ҷ��� �ƹ�Ű�� ��������.
set debug=0
set num=0
pause >nul
goto start

:start
cls
color 07
set max=0
set min=0

set /p min=�ּڰ��� �Է��ϼ��� :
:startpass
set /p max=�ִ��� �Է��ϼ��� :
set /a res=%random% * (%max% - %min% + 1) / 32768 + %min%
set /a cpr=%res% / 10

:countdown
cls
echo ������ 3�� �� �����մϴ�.
timeout /t 1 /nobreak >nul
cls
echo ������ 2�� �� �����մϴ�.
timeout /t 1 /nobreak >nul
cls
echo ������ 1�� �� �����մϴ�.
timeout /t 1 /nobreak >nul
set mes=0
set count=1

cls
:typing
echo ����Ƚ�� : %count%
echo �ڸ��____
echo %min%�������� %max%������ �� �� �ϳ��� ���纸����!
if %mes%==1 echo �Է��� ���� �۾ƿ�!
if %mes%==2 echo �Է��� ���� ���� �۾ƿ�!
if %mes%==3 echo �Է��� ���� Ŀ��!
if %mes%==4 echo �Է��� ���� ���� Ŀ��!
if %debug%==1 echo ���� �� %res% / ��� �� %cpr% / ���� �� %num%

echo.
set /p num=�Է�:

cls
echo ����?
set /a count=(%count% + 1)
timeout /t 1 /nobreak >nul
cls

if %num%==%res% goto clear
if %num% LSS %res% goto sma
if %num% GTR %res% goto big


:sma
set /a hum=%res%-%num%
if %hum% LSS %cpr% goto ltsma
set mes==1
color 3F
goto typing

:ltsma
set mes==2
color 3F
goto typing

:big
set /a hum=%num%-%res%
if %hum% LSS %cpr% goto ltbig
set mes==3
color 1F
goto typing

:ltbig
set mes==4
color 3F
goto typing

:reset
set /a res=%random% * (%max% - %min% + 1) / 32768 + %min%
goto countdown
color 07

:clear
cls
color 0f
echo �����մϴ�!
echo ������ %res%�Դϴ�!
echo ����Ƚ�� : %count%
echo ----------------------------
echo 1         New Game
echo 2         Restart
echo 3         Exit(Ÿ��Ʋ�� ���ư���)
echo ----------------------------
set /p out=�Է��ϱ�(1,2,3):
if %out%==1 goto start
if %out%==2 goto reset
if %out%==3 goto title
goto clear

:reset
set /a res=%random% * (%max% - %min% + 1) / 32768 + %min%
goto countdown

:gamestart
cls
title ���� ���ñ�
echo 1. - ��/�ٿ�
echo 2. - �����׽�Ʈ
echo 3. - ���� RPG
echo 4. - �����ٿ�ε� (���̽� 3 + pip �ʿ�)
echo 5. - ����������
echo 6. - ���(�޴��� �̵��ϱ�)
set /p out=�����ϼ���(1,2,3,4,5)
if %out%==1 goto updown
if %out%==2 goto memory
if %out%==3 goto sorry
if %out%==4 goto downStart
if %out%==5 goto rcpstart
if %out%==6 goto title

:memorys
set score=0
goto memory

:memory
cls
echo 3�� �� ������ �����մϴ�.
timeout /t 1 /nobreak >nul
cls
echo 2�� �� ������ �����մϴ�.
timeout /t 1 /nobreak >nul
cls
echo 1�� �� ������ �����մϴ�.
timeout /t 1 /nobreak >nul
set ma=25
set mi=1
set sc=0
set /a tx=%random% * (%ma% - %mi% + 1) / 32768 + %mi%
goto set

:set
if %tx%==1 set mt=�ٶ��� �¹��� Ÿ����
if %tx%==2 set mt=�ϱ��� �ʾƼ� �ؾ����
if %tx%==3 set mt=�� ��ȥ�� ���� ��
if %tx%==4 set mt=�Ằ�� �̷��ϴ� �ູ
if %tx%==5 set mt=��ò��� ģ����
if %tx%==6 set mt=�Ƿηο� ģ���� ������
if %tx%==7 set mt=���� û���� �ɴ�� �״´�
if %tx%==8 set mt=�޸���� �󸶳� �Ƹ��ٿ
if %tx%==9 set mt=���� USB�� �ʹ� ��ò��ϴ�
if %tx%==10 set mt=youtube.com
if %tx%==11 set mt=�㹰�� �ִٸ�, �����⸦ �η��� ����
if %tx%==12 set mt=�� ������Լ� ��� ���� ������ ����
if %tx%==13 set mt=�ڱ⺸�� ���� �ڸ� ������ ���� ����
if %tx%==14 set mt=��� �� ��ü�� ��ſ� ��Ȱ
if %tx%==15 set mt=���ݰԸ�����������
if %tx%==16 set mt=��! ����? �����������ϴ�
if %tx%==17 set mt=�ѱ����̸鼭 ���⸦ �� �ϱ�� �󸶳� ����?
if %tx%==18 set mt=������ ����Ĩ�̾߱�
if %tx%==19 set mt=í������Ų�� �̾߱�
if %tx%==20 set mt=��ǥ���� ū ������ �� �����ΰ� �ȱ�����ΰ�?
if %tx%==21 set mt=���� ������?
if %tx%==22 set mt=��ư ��. ��¼���. ��! ��¼���!!
if %tx%==23 set mt=���� ��ȭ���� �簻�� ã���ÿ�
if %tx%==24 set mt=������ �ʹ�.
if %tx%==25 set mt=��
echo %mt%
timeout /t 1 /nobreak >nul
goto ingame

:ingame
cls
echo ���� : %score%
set /p out=���� �Է� : 
if "%out%" == "%mt%" goto cs2

:cs1
echo �����Դϴ�.
color 40
timeout /t 1 /nobreak >nul
color 0f
goto set

:cs2
echo �����Դϴ�!
set /a score=(%score% + 1)
timeout /t 1 /nobreak >nul
goto memory

:sorry
echo �˼��մϴ�. �� ���� ���� �������Դϴ�.
pause >nul
goto title

:version
cls
echo -----------[���� ����]-----------
echo ������
echo - nugu2726
timeout /t 2 /nobreak >nul
echo ����
echo - ver 0.1.6
timeout /t 2 /nobreak >nul
echo ����ȯ��
echo - �׳� cmd
timeout /t 2 /nobreak >nul
echo GitHub
echo - https://github.com/NUGU2726/.Bat-Games
timeout /t 2 /nobreak >nul
echo ��. ����ҷ��� �ƹ�Ű�� ��������.
pause >nul
cls
goto title

REM Windows ȯ�濡�� Python 3�� pip �� ��ġ�� ���� �Ͽ� �ڵ�����
REM ��ũ��Ʈ�� ������ �� �ֵ��� ȯ���� ������ִ� ��ġ �����Դϴ�.
REM ��ġ ���� �ȿ� ���̽� ��ũ��Ʈ�� �ֱ� ������ �� ���ϸ� �����ϸ�
REM �ڵ����� .py ������ �����˴ϴ�.

:downStart
echo ��ũ��Ʈ �ε� ��...
chcp 65001 >nul
echo import requests, pafy, webbrowser >ytga.py
echo from argparse import ArgumentParser >>ytga.py
echo def geturl(val): >>ytga.py
echo     s="i.ytimg.com/vi/"  >>ytga.py
echo     return val[val.find(s)+len(s):val.find(s)+len(s)+11] >>ytga.py
echo parser = ArgumentParser() >>ytga.py
echo parser.add_argument("-q", "--query") >>ytga.py
echo args = parser.parse_args() >>ytga.py
echo title = args.query >>ytga.py
echo r = requests.get("https://www.youtube.com/results?search_query="+title+' "topic"').text >>ytga.py
echo video = pafy.new(geturl(r)) >>ytga.py
echo url = video.getbestaudio().url >>ytga.py
echo print('\n=== Search Result ===\n'+str(video)) >>ytga.py
echo webbrowser.open(url) >>ytga.py
chcp 949 > nul

echo ���̽� ��ġ Ȯ�� ��...
python --version | find "Python 3"
if %ERRORLEVEL% == 1 goto nopy
echo pip ��ġ Ȯ�� ��...
pip --version >nul
if %ERRORLEVEL% == 9009 goto nopip
echo ���̽� ��� ��ġ Ȯ����...
pip list | find "requests"
if %ERRORLEVEL% == 1 goto inst
pip list | find "youtube-dl"
if %ERRORLEVEL% == 1 goto inst
pip list | find "pafy"
if %ERRORLEVEL% == 1 goto inst

goto down

:inst
echo �ʿ��� ��Ű���� ��ġ�Ǿ� ���� �ʽ��ϴ�. ��ġ�� �����մϴ�.
pip install requests youtube_dl pafy
goto main

:nopy
echo ���̽��� ��ġ�Ǿ� ���� ���� �� �����ϴ�. ��ġ �� �ٽ� ������ �ּ���.
pause
exit

:nopip
echo pip�� ��ġ�Ǿ� ���� ���� �� �����ϴ�. ��ġ �� �ٽ� ������ �ּ���.
pause
exit

:down
cls
color 0f
set /p que="�˻� ���� �Է� (��Ƽ��Ʈ, �� ����, ...): "
ytga.py -q "%que%"
pause

:rcpstart
echo 1 ����
echo 2 ����
echo 3 ��
set /p hand=����:
 
set /a comhand=%RANDOM% %%3 + 1
 
echo ��ǻ�Ͱ� : %comhand%
 
if %comhand% EQU 1 echo ��ǻ�� : ����
if %comhand% EQU 2 echo ��ǻ�� : ����
if %comhand% EQU 3 echo ��ǻ�� : ��
 
 
if %hand% EQU %comhand% goto SAME
 
if %hand% EQU 1 (
    if %comhand% EQU 2 (
        goto LOSE
    )
    if %comhand% EQU 3 (
        goto WIN
    )
)
 
if %hand% EQU 2 (
    if %comhand% EQU 1 (
        goto WIN
    )
    if %comhand% EQU 3 (
        goto LOSE
    )
)
 
if %hand% EQU 3 (
    if %comhand% EQU 1 (
        goto LOSE
    )
    if %comhand% EQU 2 (
        goto WIN
    )
)
 
cls
echo 1-3 �� �ϳ��� �Է�
goto start
 
:SAME
echo ���
goto end
 
:WIN
echo ����� �¸�
goto end
 
:LOSE
echo ����� �й�
goto end
 
:end
pause >nul
 
cls
goto rcpstart
