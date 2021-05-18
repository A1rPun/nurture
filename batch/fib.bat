@echo off
set /a input 29
if "%1" neq "" set /a input = %1
call :fib input
echo %errorlevel%
goto :eof

:fib
setlocal enabledelayedexpansion
if %1 geq 2 goto :fibrecursive
exit /b %1

:fibrecursive
set /a res1 = %1 - 1
set /a res2 = %1 - 2
call :fib !res1!
set res1=%errorlevel%
call :fib !res2!
set res2=%errorlevel%
exit /b res1 + res2
