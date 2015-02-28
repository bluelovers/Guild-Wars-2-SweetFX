@echo off

FOR %%V IN ("*.bmp") do (call :myDosFunc "%%~V")
rem FOR %%V IN (%1) do echo %%~tV

move *.bmp "SweetFX Screenshot\"

GOTO :EOF

:myDosFunc

call :sub_replace1 "%~t1"

set "id=0"

call :sub_replace2 "%~n1"

rename "%~1" "Screenshot_%v_result%_%id%%~x1" >> log.bat

GOTO :EOF

:sub_replace1

SETLOCAL

SET v_t=%~1
Set v_s=%~2
Set v_r=%~3

SET v_t=%v_t: =_%
SET v_t=%v_t::=-%

(ENDLOCAL
SET v_result=%v_t:/=-%
)

GOTO :EOF

:sub_replace2

SETLOCAL

SET v_t=%~1
Set v_s=Screenshot
Set v_r=""

(ENDLOCAL
	SET "id=%v_t:Screenshot=%"
)

GOTO :EOF
