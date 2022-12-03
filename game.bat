@echo off
:title
cls
set ver=0.1.5 ver
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
echo 4. - 취소(메뉴로 이동하기)
set /p out=선택하세요(1,2,3)
if %out%==1 goto updown
if %out%==2 goto memory
if %out%==3 goto sorry
if %out%==4 goto title

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
echo - ver 0.1.5
timeout /t 2 /nobreak >nul
echo 제작환경
echo - 그냥 cmd
timeout /t 2 /nobreak >nul
echo 끝. 계속할려면 아무키나 누르세요.
pause >nul
cls
goto title