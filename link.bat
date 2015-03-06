@echo off
set source=%1
set target=%2
set cmd=mklink /h

if exist %source%\NUL (set cmd=mklink /j)

%cmd% %target% %source%
