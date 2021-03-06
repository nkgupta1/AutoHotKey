#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; https://autohotkey.com/docs/commands/index.htm
; https://autohotkey.com/docs/Hotkeys.htm

; $ fixes infinite loop when calling same key from within command
; ~ passes key to system while still executing the command
; ^ is Ctrl
; + is Shift
; # for Windows key
; ! for alt

; planned features:
    ; ctrl+arrows for mouse movement
    ; ctrl+esc to dismiss pushbullet notifcations

; alt+g does not open facebook until all chrome windows have been closed


; Alternate home shortcut
; alt+left
~!left::
{
    Send, {Home}
    Return
}

; Alternate end shortcut
; alt+end
~!right::
{
    Send, {End}
    Return
}

; Open bash terminal
; alt+b
!b::
{
    Run bash.exe
    Return
}

; Open file folder 
; alt+f
!f::
{
    Run explorer.exe
    Return
}

; Open temp folder 
; alt+t
!t::
{
    Run explorer.exe C:\Users\Nikhil\Desktop\Temp
    Return
}

; Save on Build for Sublime Text
; ctrl+b -> ctrl+s and ctrl+b
$^b::
{
    IfWinActive, ahk_exe sublime_text.exe
    {
        Send, ^s
        Send, ^b
    }
    IfWinNotActive, ahk_exe sublime_text.exe
    {
        Send, ^b
    }
    Return
}


; Save as for Word using 
; ctrl+shift+s
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

; Minimizing using CapsLock key
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

; AlwaysOnTop - toggles focused windows between staying on top and regular
; WindowList := ||$
; ctrl+space 
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

; CHROME - opens a new chrome window
; Alt + c
!c::
{
    Run chrome.exe
    Return
}

; Open gmail and messenger in chrome
; Alt + g
!g::
{
    RunWait chrome --new-window gmail.com
    Run chrome messenger.com
    Return
}

; Open pandora in new chrome window
; Alt + w
!w::
{
    Run chrome --new-window pandora.com
    Return
}

; Close pandora
; Alt + shift + w
!+w::
{
    WinClose Pandora
    Return
}

; ; Open Spotify
; !a::
; {
;     Run C:\Users\Nikhil\AppData\Roaming\Spotify\SpotifyLauncher.exe
;     Return
; }

; Open reddit in chrome
!r::
{
    Run chrome reddit.com
    Return
}

; Open Sublime
!s::
{
    Run sublime_text.exe
    Return
}

; PANDORA
; To pause
; Media key - pause
; If a pandora window is open, then push key to that
; otherwise, treat it as normal
$Media_Play_Pause::
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

; PANDORA
; To skip
; Media key - next  
; If a pandora window is open, then push key to that
; otherwise, treat it as normal
$Media_Next::
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