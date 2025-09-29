#Requires AutoHotkey v2.0
SetWorkingDir(A_ScriptDir)

; -------- CONFIG --------
DISCORD_EXE   := "ahk_exe Discord.exe"
RELAY_TARGET  := "PASTE YOUR YAPPER SPAM CHANNEL ID HERE"
RETURN_TO_APP := true
SEND_COMBO    := "{Enter}"               ; change to "^Enter" if your Discord uses Ctrl+Enter to send
; ------------------------

+Enter:: { ; Shift + Enter
    ; --- 1) Copy from the game, but avoid stale clipboard ---
    oldClip := ClipboardAll()        ; backup user's clipboard
    A_Clipboard := ""                ; clear so ClipWait waits for NEW content
    Send("^a")
    Sleep(80)
    Send("^c")
    if !ClipWait(1) {                ; wait up to 1s for new data
        Sleep(120)
        Send("^c")                   ; retry once
        if !ClipWait(1) {
            A_Clipboard := oldClip   ; restore and bail if copy failed
            return
        }
    }
    txt := A_Clipboard
    if (txt = "") {
        A_Clipboard := oldClip
        return
    }

    prev := WinActive("A")

    ; --- 2) Bring Discord to front ---
    if !WinExist(DISCORD_EXE) {
        A_Clipboard := oldClip
        return
    }
    WinActivate(DISCORD_EXE)
    if !WinWaitActive(DISCORD_EXE,,2) {
        A_Clipboard := oldClip
        return
    }

    ; --- 3) Jump to the channel via Quick Switcher (type target, no clipboard) ---
    Send("^k")
    Sleep(150)
    SendText(RELAY_TARGET)
    Sleep(150)
    Send("{Enter}")
    Sleep(350)                        ; give Discord a moment to focus the input box

    ; --- 4) Type the message directly (no clipboard paste) and send ---
    SendText(txt)
    Sleep(120)
    Send(SEND_COMBO)
    Sleep(150)

    ; --- 5) Restore clipboard & return to game ---
    A_Clipboard := oldClip
    if (RETURN_TO_APP && prev)
        WinActivate("ahk_id " prev)
}
