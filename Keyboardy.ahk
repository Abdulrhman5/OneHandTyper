activator := True
thiefModeTimer = 400
thiefMode := False
GKL()
{
    if !ThreadId := DllCall("user32.dll\GetWindowThreadProcessId", "Ptr", WinActive("A"), "UInt", 0, "UInt")
        return false
    if !KBLayout := DllCall("user32.dll\GetKeyboardLayout", "UInt", ThreadId, "UInt")
        return false
    x := KBLayout & 0xFFFF
    if ( x=0x0809||x=0x0409
        ||x=0x0409||x=0x1009||x=0x2409
    ||x=0x1809||x=0x2009||x=0x1409
    ||x=0x3409||x=0x1c09||x=0x2c09
    ||x=0x2809)
    return "EN"
    else if( x=0x1401||x=0x3c01||x=0x3c01
        ||x=0x0c01||x=0x0801||x=0x2c01
    ||x=0x3401||x=0x3001||x=0x1001
    ||x=0x1801||x=0x2001||x=0x4001
    ||x=0x0401||x=0x2801||x=0x1c01
    ||x=0x3801||x=0x2401)
    return "AR"
}

$\::
OutputDebug, % thiveModeTimer
If ( A_ThisHotkey = A_PriorHotkey and A_TimeSincePriorHotkey < thiefModeTimer )
   Count++
Else
    Count := 1
if Count >= 3
{
    Loop, % Count - 1{ 
        send {BackSpace}
    }
    if activator
        activator := False
    else
        activator := True
    return
}
send {\}
return

$]::
OutputDebug, % thiveModeTimer
If ( A_ThisHotkey = A_PriorHotkey and A_TimeSincePriorHotkey < thiefModeTimer )
   Count++
Else
    Count := 1
if Count >= 3
{
    Loop, % Count - 1{ 
        send {BackSpace}
    }
    ; If the script is not elevated, relaunch as administrator and kill current instance:
    full_command_line := DllCall("GetCommandLine", "str")
    if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
    {
        try ; leads to having the script re-launching itself as administrator
        {
            if A_IsCompiled
                Run *RunAs "Keyboardy.exe" /restart
            else
                Run *RunAs "%A_AhkPath%" /restart "Keyboardy.ahk"
        }
        ExitApp
    }
}
send {]}
return


#If activator
$;::
OutputDebug, % thiveModeTimer
If ( A_ThisHotkey = A_PriorHotkey and A_TimeSincePriorHotkey < thiefModeTimer )
   Count++
Else
    Count := 1
if Count >= 3
{
    Loop, % Count - 1{ 
        send {BackSpace}
    }
    if thiefMode = True    
    {
        MsgBox, Thive mode deactiviated.
        thiefMode = False
    }
    else
    {
        MsgBox, Thive mode activiated.
        thiefMode = True
    }
    return
}
send {;}
return


q::
    l := GKL()
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P")){
        if(l="EN"){
            sendInput P
        }
        else{
            send {ج}
        }
    }
    else if(GetkeyState("NumpadSub","P")){
        if(l="EN"){
            sendInput p
        }
        else{
            send {ح}
        }
    }
    else if(GetkeyState("NumpadAdd","P")){
        if(l="EN"){
            sendInput Q
        }
        else{
        }
    }
    else {
        if(l="EN"){
            sendInput q
        }
        else{
            send {ض}
        }
    }
return
w::
    l := GKL()
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd"))
    {
        if(l="EN"){
            send {O}
        }
    }
    else if(GetkeyState("NumpadSub","P")){
        send {o}
    }
    else if(GetkeyState("NumpadAdd","P")){
        send +{w}
    }
    else {
        send {w}
    }
return
e::
    l := GKL()
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P")){
        send +{i}
    }
    else if(GetkeyState("NumpadSub","P")){
        send {i}
    }
    else if(GetkeyState("NumpadAdd","P")){
        send +{e}
    }
    else {
        send {e}
    }
return
r::
    l := GKL()
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P")){
        send +{u}
    }
    else if(GetkeyState("Numpadsub","P")){
        send {u}
    }
    else if(GetkeyState("NumpadAdd","P")){
        send +{r}
    }
    else {
        send {r}
    }
return
t::
    l := GKL()
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P")){
        send +{y}
    }
    else if(GetkeyState("NumpadSub","P")){
        send {y}
    }
    else if(GetkeyState("NumpadAdd","P")){
        send +{t}
    }
    else {
        send {t}
    }
return
a::
    l := GKL()
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P")){
        send +{;}
    }
    else if(GetkeyState("NumpadSub","P")){
        send {;} 
    }
    else if(GetkeyState("NumpadAdd","P")){
        send +{a}
    }
    else {
        send {a}
    }
return
s::
    l := GKL()
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P")){
        send +{l}
    }
    else if(GetkeyState("NumpadSub","P")){
        send {l}
    }
    else if(GetkeyState("NumpadAdd","P")){
        send +{s}
    }
    else {
        send {s}
    }
return
d::
    l := GKL()
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P")){
        send +{k}
    }
    else if(GetkeyState("NumpadSub","P")){
        send {k}
    }
    else if(GetkeyState("NumpadAdd","P")){
        send +{d}
    }
    else {
        send {d}
    }
return
f::
    l := GKL()
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P")){
        send +{j}
    }
    else if(GetkeyState("NumpadSub","P")){
        send {j}
    }
    else if(GetkeyState("NumpadAdd","P")){
        send +{f}
    }
    else {
        send {f}
    }
return
g::
    l := GKL()
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P")){
        send +{h}
    }
    else if(GetkeyState("NumpadSub","P")){
        send {h}
    }
    else if(GetkeyState("NumpadAdd","P")){
        send +{g}
    }
    else {
        send {g}
    }
return
z::
    l := GKL()
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P"))
    {
        if(l="EN")
        {
            send ?
        }
        else
        {
            send {ط}
        }
    }
    else if(GetkeyState("NumpadSub","P"))
    {
        if(l="EN")
        {
            send /
        }
        else
        {
            send {ظ}
        }
    }
    else if(GetkeyState("NumpadAdd","P"))
    {
        if(l="EN")
        {
            send Z
        }
        else
        {
            send /
        }
    }
    else
    {
        if(l="EN")
        {
            send z
        }
        else
        {
            send {ئ}
        }
    }
return

x::
    l := GKL()
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P"))
    {
        if(l="EN")
        {
            send <
        }
        else
        {
            send {؟}
        }
    }
    else if(GetkeyState("NumpadSub","P"))
    {
        if(l="EN")
        {
            send {,}
        }
        else
        {
            send {ز}
        }
    }
    else if(GetkeyState("NumpadAdd","P"))
    {
        if(l="EN"){
            send X
        }
        else{
            send {,}
        }
    }
    else
    {
        if(l="EN"){
            send x
        }
        else
        {
            send {ء}
        }
    }
return

c::
    l := GKL()
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P"))
    {
        if(l="EN"){
            send {ASC 62}
        }
        else{
            send {.}
        }
    }
    else if(GetkeyState("NumpadSub","P"))
    {
        if(l="EN")
        {
            send {.}
        }
        else
        {
            send {و}
        }
    }
    else if(GetkeyState("NumpadAdd","P"))
    {
        if(l="EN")
        {
            send C
        }
        else
        {
            send {.}
        }
    }
    else
    {
        if(l="EN")
        {
            send c
        }
        else
        {
            send {ؤ}
        }
    }
return

v::
    l := GKL()
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P")){
        send +{m}
    }
    else if(GetkeyState("NumpadSub","P")){
        send {m}
    }
    else if(GetkeyState("NumpadAdd","P")){
        send +{v}
    }
    else {
        send {v}
    }
return
b::
    l := GKL()
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P")){
        send +{n}
    }
    else if(GetkeyState("NumpadSub","P")){
        send {n}
    }
    else if(GetkeyState("NumpadAdd","P")){
        send +{b}
    }
    else {
        send {b}
    }
return
1::
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P"))
    {
        send {^}
    }
    else if(GetkeyState("NumpadSub","P"))
    {
        send 6
    }
    else if(GetkeyState("NumpadAdd","P"))
    {
        send {!}
    }
    else
    {
        send 1 
    }
return
2::
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P"))
    {
        send {&}
    }
    else if(GetkeyState("NumpadSub","P"))
    {
        send 7
    }
    else if(GetkeyState("NumpadAdd","P"))
    {
        send @
    }
    else
    {
        send 2
    }
return

3::
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P"))
    {
        send {*}
    }
    else if(GetkeyState("NumpadSub","P"))
    {
        send {8}
    }
    else if(GetkeyState("NumpadAdd","P"))
    {
        send {#}
    }
    else
        {send {3}
}
return

4::
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P"))
    {
        send {(}
    }
    else if(GetkeyState("NumpadSub","P"))
    {
        send 9
    }
    else if(GetkeyState("NumpadAdd","P"))
    {
        send {$}
    }
    else
    {
        send 4
    }
return

5::
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P"))
    {
        send {)}
    }
    else if(GetkeyState("NumpadSub","P"))
    {
        send 0
    }
    else if(GetkeyState("NumpadAdd","P"))
    {
        send {ASC 37}
    }
    else
    {
        send 5
    }
return

6::
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P"))
    {
        send {_}
    }
    else if(GetkeyState("NumpadSub","P"))
    {
        send {-}
    }
    else if(GetkeyState("NumpadAdd","P"))
    {
        send {+}
    }
    else
    {
        send {=}
    }
return

`::
    l := GKL()
    if(GetkeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P")){
        if(l="EN"){
            send {"}
        }
        else{
            send {"}
        }
    }
    else if(GetkeyState("NumpadSub","P")){
        if(l="EN")
        {
            send {'}
        }
        else{
            send {ذ}
        }
    }
    else if(GetkeyState("NumpadAdd","P")){
        if(l="EN"){
            send {~}
        }
        else{
        }
    }
    else {
        if(l="EN"){
            send {``}
        }
        else{
            send {د}
        }
    }
return
space::
    if(GetKeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P"))
    {
        send {backspace}
    }
    else if(GetkeyState("NumpadSub","P"))
    {
        send {backspace}
    }
    else if(GetkeyState("NumpadAdd","P"))
    {
        send {delete}
    }
    else
    {
        send {space}
    }
return
k::
    if(GetKeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P"))
    {
        send {Home}
    }
    else if(GetkeyState("NumpadSub","P"))
    {
        send {Right}
    }
    else if(GetkeyState("NumpadAdd","P"))
    {
        send ^{Right}
    }
    else
    {
        send {k}
    }
Return
j::
    if(GetKeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P"))
    {
        send {End}
    }
    else if(GetkeyState("NumpadSub","P"))
    {
        send {Down}
    }
    else if(GetkeyState("NumpadAdd","P"))
    {
        send ^{Down}
    }
    else
    {
        send {j}
    }
return
y::
    if(GetKeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P"))
    {
        send {End}
    }
    else if(GetkeyState("NumpadSub","P"))
    {
        send {Right}
    }
    else if(GetkeyState("NumpadAdd","P"))
    {
        send ^{Right}
    }
    else
    {
        send {y}
    }
Return

h::
    if(GetKeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P"))
    {
        send {Home}
    }
    else if(GetkeyState("NumpadSub","P"))
    {
        send {Left}
    }
    else if(GetkeyState("NumpadAdd","P"))
    {
        send ^{Left}
    }
    else
    {
        send {h}
    }
Return

u::
    if(GetKeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P"))
            {send {Home}
    }
    else if(GetkeyState("NumpadSub","P"))
        {send {Up}
    }
    else if(GetkeyState("NumpadAdd","P"))
    {
        send ^{Up}
    }
    else
    {
        send {u}

    }
Return

Tab::
    if(GetKeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P"))
        {send {{}
}
else if(GetkeyState("NumpadSub","P"))
    {send {[}
}
else if(GetkeyState("NumpadAdd","P"))
    {send {O}
}
else
    {send {Tab}
}
return

capslock::
    if(GetKeyState("NumpadSub","P") && GetKeyState("NumpadAdd","P"))
    {send {}}
}
else if(GetkeyState("NumpadSub","P"))
    {send {]}
}
else if(GetkeyState("NumpadAdd","P"))
    {send {>}
}
else
    {send {Enter}
}
return

F7::
    if(GetkeyState("NumpadSub","P"))
    {
        send {Media_Prev}
    }
    else{
        send {F7}
    }
return

F8::
    if(GetkeyState("NumpadSub","P"))
    {
        send {Media_Play_Pause}
    }
    else{
        send {F8}
    }
return
F9::
    if(GetkeyState("NumpadSub","P"))
    {
        send {Media_Next}
    }
    else{
        send {F9}
    }
return
F10::
    if(GetkeyState("NumpadSub","P"))
    {
        send {Volume_Down}
    }
    else{
        send {F10}
    }
return
F11::
    if(GetkeyState("NumpadSub","P"))
    {
        send {Volume_UP}
    }
    else{
        send {F11}
    }
return
F12::
    if(GetkeyState("NumpadSub","P"))
    {
        send {Volume_Mute}
    }
    else{
        send {F12}
    }
return

Numpadmult::
    if(GetkeyState("NumpadSub","P"))
    {
        send {delete}
    }
    else{
        send {backspace}
    }
return
NumpadAdd::
return
NumpadSub::
    return

#If activator And thiefMode 
Numpad2::
    send ^{v}
Return

Numpad3::
    send ^{c}
return 