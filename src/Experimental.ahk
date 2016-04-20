; Beep on any keypress
; #InstallKeybdHook
; #Persistent
; SetTimer,UserInput,30
; Return
; UserInput:
;     If A_TimeIdlePhysical<50
;         SoundBeep,,50
; Return

; Beep on keypress
; ~a::
;     SoundBeep
; Return

