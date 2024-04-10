SetCapsLockState, AlwaysOff

#If GetKeyState("CapsLock", "P")
    h::Left
    j::Down
    k::Up
    l::Right
#If


#InstallKeybdHook
#UseHook

~Ctrl::
    KeyWait, Ctrl
    if (A_TimeSinceThisHotkey < 150) ; Adjust the timing here (in milliseconds)
    {
        Send {Esc}
    }
    else
    {
        Send {Ctrl down}
        KeyWait, Ctrl
        Send {Ctrl up}
    }
return
