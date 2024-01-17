LAlt::
    KeyWait, LAlt, T0.2  ; Wait for 0.2 seconds to determine if it's a tap or hold
    if (ErrorLevel) {
        ; If the key was held for more than 0.2 seconds, treat it as a regular Alt key press
        Send, {LAlt down}
        KeyWait, LAlt
        Send, {LAlt up}
    } else {
        ; If the key was tapped, treat it as a Backspace key press
        Send, {Backspace}
    }
    return
