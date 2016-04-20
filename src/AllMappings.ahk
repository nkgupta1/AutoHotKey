#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; https://autohotkey.com/docs/commands/index.htm

; Save as for Word
$^+s::
{
    IfWinActive, ahk_exe WINWORD.EXE
    {
        Send, {F12}
    }
    IfWinNotActive, ahk_exe WINWORD.EXE
    {
        Send, ^+s
    }
    Return
}

$Capslock::
{
    IfWinNotActive, ahk_exe VirtualBox.exe
    {
        WinMinimize,A
    }
    Return
}

; pause break opens calc
~Pause::
{
    Run calc.exe
    Return
}

; AlwaysOnTop
; WindowList := ||$
^SPACE:: 
{
    ; MsgBox HI
    ; GetKeyState, state, Shift
    ; Input, Key, L1
    ; if Key = Shift 
    ; {
    ;     MsgBox Hi
    ; }
    ; else 
    ; {
    WinGet, currentWindow, ID, A
    WinGet, ExStyle, ExStyle, ahk_id %currentWindow%
    if (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST.
    {
        Winset, AlwaysOnTop, off, ahk_id %currentWindow%
    }
    else
    {
        WinSet, AlwaysOnTop, on, ahk_id %currentWindow%
    }
    ;}
Return
}


; PANDORA
; To pause
$SC122::
{
    ; DetectHiddenWindows, On   
    IfWinExist, Pandora
    {
        SetTitleMatchMode, 1
        SetTitleMatchMode, Slow
        ; WinGet, maximized, MinMax  
        WinGet, original, ID, A
        WinActivate, Pandora
        Sleep, 50
        Send {Space}
        Sleep, 50
        WinMinimize, Pandora
        Sleep, 50  
        WinActivate, ahk_id %original%
    }
    IfWinNotExist, Pandora
    {
        Send {Media_Play_Pause}
    }

Return
}

; To skip  
$SC119::
{
    IfWinExist, Pandora
    {
        SetTitleMatchMode, 1 
        SetTitleMatchMode, Slow
        WinGet, original, ID, A
        WinActivate, Pandora
        Sleep, 50
        Send {Right}
        Sleep, 50
        WinMinimize, Pandora
        Sleep, 50  
        WinActivate, ahk_id %original%    
    }
    IfWinNotExist, Pandora
    {
        Send {Media_Next}
    }
Return 
}