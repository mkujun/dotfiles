AppsKey::return  ; Fn key (Menu / AppsKey) acts as modifier

; Volume controls
AppsKey & F1::SoundSet,+5      ; Fn + F1 → Volume Up
AppsKey & F2::SoundSet,-5      ; Fn + F2 → Volume Down
AppsKey & F3::SoundSet,0       ; Fn + F3 → Mute

; Media controls
AppsKey & F5::Send {Media_Prev}    ; Fn + F5 → Previous Track
AppsKey & F6::Send {Media_Play_Pause}  ; Fn + F6 → Play/Pause
AppsKey & F7::Send {Media_Stop}    ; Fn + F7 → Stop
AppsKey & F8::Send {Media_Next}    ; Fn + F8 → Next Track