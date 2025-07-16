AppsKey::return  ; Fn key (Menu / AppsKey) acts as modifier

; Volume controls with on-screen overlay
AppsKey & F1::Send {Volume_Up}        ; Fn + F1 → Volume Up
AppsKey & F2::Send {Volume_Down}      ; Fn + F2 → Volume Down
AppsKey & F3::Send {Volume_Mute}      ; Fn + F3 → Mute

; Media controls
AppsKey & F5::Send {Media_Prev}           ; Fn + F5 → Previous Track
AppsKey & F6::Send {Media_Play_Pause}     ; Fn + F6 → Play/Pause
AppsKey & F7::Send {Media_Stop}           ; Fn + F7 → Stop
AppsKey & F8::Send {Media_Next}           ; Fn + F8 → Next Track
