@echo off
cd /d "%~dp0"

echo >>> 변경사항 확인 중...
git status --short

echo.
set /p msg="커밋 메시지 입력 (엔터치면 자동): "
if "%msg%"=="" set msg=update from FlutterFlow

git add .
git commit -m "%msg%"
git push

echo.
echo >>> 완료! Cloudflare Pages 자동 배포 시작됨.
pause
