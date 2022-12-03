@echo off
:title
cls
set ver=0.1.6 ver
echo -----------[간단 게임]-----------
title 미니 게임 실행기 %ver%
echo -----------[  시작  ]-----------
echo -----------[  버전  ]-----------
echo -----------[  종료  ]-----------
set /p out=선택하세요(시작,버전,종료)
if %out%==시작 goto gamestart
if %out%==버전 goto version
if %out%==종료 exit
if %out%==debugMode goto debug
goto title

:debug
set /p out=선택하세요(on,off) : 
if %out%==on set debug=1
if %out%==off set debug=


:updown
title 업 다운 게임
echo 플레이 할려면 아무키나 누르세요.
set debug=0
set num=0
pause >nul
goto start

:start
cls
color 07
set max=0
set min=0

set /p min=최솟값을 입력하세요 :
:startpass
set /p max=최댓값을 입력하세요 :
set /a res=%random% * (%max% - %min% + 1) / 32768 + %min%
set /a cpr=%res% / 10

:countdown
cls
echo 게임을 3초 뒤 시작합니다.
timeout /t 1 /nobreak >nul
cls
echo 게임을 2초 뒤 시작합니다.
timeout /t 1 /nobreak >nul
cls
echo 게임을 1초 뒤 시작합니다.
timeout /t 1 /nobreak >nul
set mes=0
set count=1

cls
:typing
echo 도전횟수 : %count%
echo 코멘드____
echo %min%에서부터 %max%까지의 수 중 하나를 맞춰보세요!
if %mes%==1 echo 입력한 값이 작아요!
if %mes%==2 echo 입력한 값이 조금 작아요!
if %mes%==3 echo 입력한 값이 커요!
if %mes%==4 echo 입력한 값이 조금 커요!
if %debug%==1 echo 랜덤 값 %res% / 허용 값 %cpr% / 감지 값 %num%

echo.
set /p num=입력:

cls
echo 과연?
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
echo 축하합니다!
echo 정답은 %res%입니다!
echo 도전횟수 : %count%
echo ----------------------------
echo 1         New Game
echo 2         Restart
echo 3         Exit(타이틀로 돌아가기)
echo ----------------------------
set /p out=입력하기(1,2,3):
if %out%==1 goto start
if %out%==2 goto reset
if %out%==3 goto title
goto clear

:reset
set /a res=%random% * (%max% - %min% + 1) / 32768 + %min%
goto countdown

:gamestart
cls
title 게임 선택기
echo 1. - 업/다운
echo 2. - 기억력테스트
echo 3. - 간단 RPG
echo 4. - 음원다운로드 (파이썬 3 + pip 필요)
echo 5. - 가위바위보
echo 6. - 취소(메뉴로 이동하기)
set /p out=선택하세요(1,2,3,4,5)
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
echo 3초 뒤 게임을 시작합니다.
timeout /t 1 /nobreak >nul
cls
echo 2초 뒤 게임을 시작합니다.
timeout /t 1 /nobreak >nul
cls
echo 1초 뒤 게임을 시작합니다.
timeout /t 1 /nobreak >nul
set ma=25
set mi=1
set sc=0
set /a tx=%random% * (%ma% - %mi% + 1) / 32768 + %mi%
goto set

:set
if %tx%==1 set mt=다람쥐 쳇바퀴 타고파
if %tx%==2 set mt=믿기지 않아서 잊었노라
if %tx%==3 set mt=내 영혼의 슬픈 눈
if %tx%==4 set mt=결별이 이룩하는 축복
if %tx%==5 set mt=모시깽이 친구들
if %tx%==6 set mt=뽀로로와 친구들 모음집
if %tx%==7 set mt=나의 청춘은 꽃답게 죽는다
if %tx%==8 set mt=뒷모습은 얼마나 아름다운가
if %tx%==9 set mt=너의 USB는 너무 모시깽하다
if %tx%==10 set mt=youtube.com
if %tx%==11 set mt=허물이 있다면, 버리기를 두려워 말라
if %tx%==12 set mt=한 사람에게서 모든 덕을 구하지 말라
if %tx%==13 set mt=자기보다 못한 자를 벗으로 삼지 말라
if %tx%==14 set mt=배움 그 자체로 즐거운 생활
if %tx%==15 set mt=에반게리오리온제과
if %tx%==16 set mt=아! 보루? 떠러져쓰무니다
if %tx%==17 set mt=한국인이면서 연기를 잘 하기란 얼마나 어려운가?
if %tx%==18 set mt=촉촉한 초코칩이야기
if %tx%==19 set mt=챠프포프킨의 이야기
if %tx%==20 set mt=상표붙인 큰 깡통은 깐 깡통인가 안깐깡통인가?
if %tx%==21 set mt=가가 가가가?
if %tx%==22 set mt=암튼 뭐. 어쩌라고. 뭐! 어쩌라고!!
if %tx%==23 set mt=다음 대화에서 양갱을 찾으시오
if %tx%==24 set mt=집가고 싶다.
if %tx%==25 set mt=ㅗ
echo %mt%
timeout /t 1 /nobreak >nul
goto ingame

:ingame
cls
echo 점수 : %score%
set /p out=글자 입력 : 
if "%out%" == "%mt%" goto cs2

:cs1
echo 오답입니다.
color 40
timeout /t 1 /nobreak >nul
color 0f
goto set

:cs2
echo 정답입니다!
set /a score=(%score% + 1)
timeout /t 1 /nobreak >nul
goto memory

:sorry
echo 죄송합니다. 이 모드는 현재 개발중입니다.
pause >nul
goto title

:version
cls
echo -----------[간단 게임]-----------
echo 제작자
echo - nugu2726
timeout /t 2 /nobreak >nul
echo 버전
echo - ver 0.1.6
timeout /t 2 /nobreak >nul
echo 제작환경
echo - 그냥 cmd
timeout /t 2 /nobreak >nul
echo GitHub
echo - https://github.com/NUGU2726/.Bat-Games
timeout /t 2 /nobreak >nul
echo 끝. 계속할려면 아무키나 누르세요.
pause >nul
cls
goto title

REM Windows 환경에서 Python 3와 pip 가 설치된 조건 하에 자동으로
REM 스크립트를 실행할 수 있도록 환경을 만들어주는 배치 파일입니다.
REM 배치 파일 안에 파이썬 스크립트가 있기 때문에 이 파일만 실행하면
REM 자동으로 .py 파일이 생성됩니다.

:downStart
echo 스크립트 로드 중...
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

echo 파이썬 설치 확인 중...
python --version | find "Python 3"
if %ERRORLEVEL% == 1 goto nopy
echo pip 설치 확인 중...
pip --version >nul
if %ERRORLEVEL% == 9009 goto nopip
echo 파이썬 모듈 설치 확인중...
pip list | find "requests"
if %ERRORLEVEL% == 1 goto inst
pip list | find "youtube-dl"
if %ERRORLEVEL% == 1 goto inst
pip list | find "pafy"
if %ERRORLEVEL% == 1 goto inst

goto down

:inst
echo 필요한 패키지가 설치되어 있지 않습니다. 설치를 진행합니다.
pip install requests youtube_dl pafy
goto main

:nopy
echo 파이썬이 설치되어 있지 않은 것 같습니다. 설치 후 다시 실행해 주세요.
pause
exit

:nopip
echo pip가 설치되어 있지 않은 것 같습니다. 설치 후 다시 실행해 주세요.
pause
exit

:down
cls
color 0f
set /p que="검색 쿼리 입력 (아티스트, 곡 제목, ...): "
ytga.py -q "%que%"
pause

:rcpstart
echo 1 가위
echo 2 바위
echo 3 보
set /p hand=선택:
 
set /a comhand=%RANDOM% %%3 + 1
 
echo 컴퓨터값 : %comhand%
 
if %comhand% EQU 1 echo 컴퓨터 : 가위
if %comhand% EQU 2 echo 컴퓨터 : 바위
if %comhand% EQU 3 echo 컴퓨터 : 보
 
 
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
echo 1-3 중 하나를 입력
goto start
 
:SAME
echo 비김
goto end
 
:WIN
echo 당신의 승리
goto end
 
:LOSE
echo 당신의 패배
goto end
 
:end
pause >nul
 
cls
goto rcpstart
