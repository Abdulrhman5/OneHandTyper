#MaxHotkeysPerInterval 200

shiftFlag := False
reflectFlag := False

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
send {vkDC}
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
send {vkDD} ; DD = ]}
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
send {vkBA}
return


q::
    l := GKL()
    if(reflectFlag && shiftFlag){
        send +{p}
    }
    else if(reflectFlag){
        send {p}
    }
    else if(shiftFlag){
        send +{q}
    }
    else {
        send {q}
    }
return
w::
    l := GKL()
    if(reflectFlag && shiftFlag)
    {
        send +{o}
    }
    else if(reflectFlag){
        send {o}
    }
    else if(shiftFlag){
        send +{w}
    }
    else {
        send {w}
    }
return
e::
    l := GKL()
    if(reflectFlag && shiftFlag){
        send +{i}
    }
    else if(reflectFlag){
        send {i}
    }
    else if(shiftFlag){
        send +{e}
    }
    else {
        send {e}
    }
return
r::
    l := GKL()
    if(reflectFlag && shiftFlag){
        send +{u}
    }
    else if(reflectFlag){
        send {u}
    }
    else if(shiftFlag){
        send +{r}
    }
    else {
        send {r}
    }
return
t::
    l := GKL()
    if(reflectFlag && shiftFlag){
        send +{y}
    }
    else if(reflectFlag){
        send {y}
    }
    else if(shiftFlag){
        send +{t}
    }
    else {
        send {t}
    }
return
a::
    l := GKL()
    if(reflectFlag && shiftFlag){
        send +{vkBA} ; BA = ;:
    }
    else if(reflectFlag){
        send {vkBA} 
    }
    else if(shiftFlag){
        send +{a}
    }
    else {
        send {a}
    }
return
s::
    l := GKL()
    if(reflectFlag && shiftFlag){
        send +{l}
    }
    else if(reflectFlag){
        send {l}
    }
    else if(shiftFlag){
        send +{s}
    }
    else {
        send {s}
    }
return
d::
    l := GKL()
    if(reflectFlag && shiftFlag){
        send +{k}
    }
    else if(reflectFlag){
        send {k}
    }
    else if(shiftFlag){
        send +{d}
    }
    else {
        send {d}
    }
return
f::
    l := GKL()
    if(reflectFlag && shiftFlag){
        send +{j}
    }
    else if(reflectFlag){
        send {j}
    }
    else if(shiftFlag){
        send +{f}
    }
    else {
        send {f}
    }
return
g::
    l := GKL()
    if(reflectFlag && shiftFlag){
        send +{h}
    }
    else if(reflectFlag){
        send {h}
    }
    else if(shiftFlag){
        send +{g}
    }
    else {
        send {g}
    }
return
z::
    l := GKL()
    if(reflectFlag && shiftFlag)
    {
        send +{vkBF}
    }
    else if(reflectFlag)
    {
        send {vkBF}
    }
    else if(shiftFlag)
    {
        send +{z}
    }
    else
    {
        send {z}
    }
return

x::
    l := GKL()
    if(reflectFlag && shiftFlag)
    {       
        send +{vkBC}
    }
    else if(reflectFlag)
    {
        send {vkBC}
    }
    else if(shiftFlag)
    {
        send +{x}
    }
    else
    {
        send {x}
    }
return

c::
    l := GKL()
    if(reflectFlag && shiftFlag)
    {
        send +{vkBE}
    }
    else if(reflectFlag)
    {
        send {vkBE}
    }
    else if(shiftFlag)
    {
        send +{C}
    }
    else
    {
        send {c}
    }
return

v::
    l := GKL()
    if(reflectFlag && shiftFlag){
        send +{m}
    }
    else if(reflectFlag){
        send {m}
    }
    else if(shiftFlag){
        send +{v}
    }
    else {
        send {v}
    }
return
b::
    l := GKL()
    if(reflectFlag && shiftFlag){
        send +{n}
    }
    else if(reflectFlag){
        send {n}
    }
    else if(shiftFlag){
        send +{b}
    }
    else {
        send {b}
    }
return
1::
    if(reflectFlag && shiftFlag)
    {
        send {^}
    }
    else if(reflectFlag)
    {
        send 6
    }
    else if(shiftFlag)
    {
        send {!}
    }
    else
    {
        send 1 
    }
return
2::
    if(reflectFlag && shiftFlag)
    {
        send {&}
    }
    else if(reflectFlag)
    {
        send 7
    }
    else if(shiftFlag)
    {
        send @
    }
    else
    {
        send 2
    }
return

3::
    if(reflectFlag && shiftFlag)
    {
        send {*}
    }
    else if(reflectFlag)
    {
        send {8}
    }
    else if(shiftFlag)
    {
        send {#}
    }
    else
        {send {3}
}
return

4::
    if(reflectFlag && shiftFlag)
    {
        send {(}
    }
    else if(reflectFlag)
    {
        send 9
    }
    else if(shiftFlag)
    {
        send {$}
    }
    else
    {
        send 4
    }
return

5::
    if(reflectFlag && shiftFlag)
    {
        send {)}
    }
    else if(reflectFlag)
    {
        send 0
    }
    else if(shiftFlag)
    {
        send {ASC 37}
    }
    else
    {
        send 5
    }
return

6::
    if(reflectFlag && shiftFlag)
    {
        send {_}
    }
    else if(reflectFlag)
    {
        send {-}
    }
    else if(shiftFlag)
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
    if(reflectFlag && shiftFlag){
        send +{vkDE} ;DE = double and single quote
    }
    else if(reflectFlag){
        send {vkDE}
    }
    else if(shiftFlag){
        send +{vkC0} ; C0 = ~`
    }
    else {
        send {vkC0}
    }
return
space::
    if(reflectFlag && shiftFlag)
    {
        send {backspace}
    }
    else if(reflectFlag)
    {
        send {backspace}
    }
    else if(shiftFlag)
    {
        send {delete}
    }
    else
    {
        send {space}
    }
return
k::
    if(reflectFlag && shiftFlag)
    {
        send {Home}
    }
    else if(reflectFlag)
    {
        send {Right}
    }
    else if(shiftFlag)
    {
        send ^{Right}
    }
    else
    {
        send {k}
    }
Return
j::
    if(reflectFlag && shiftFlag)
    {
        send {End}
    }
    else if(reflectFlag)
    {
        send {Down}
    }
    else if(shiftFlag)
    {
        send ^{Down}
    }
    else
    {
        send {j}
    }
return
y::
    if(reflectFlag && shiftFlag)
    {
        send {End}
    }
    else if(reflectFlag)
    {
        send {Right}
    }
    else if(shiftFlag)
    {
        send ^{Right}
    }
    else
    {
        send {y}
    }
Return

h::
    if(reflectFlag && shiftFlag)
    {
        send {Home}
    }
    else if(reflectFlag)
    {
        send {Left}
    }
    else if(shiftFlag)
    {
        send ^{Left}
    }
    else
    {
        send {h}
    }
Return

u::
    if(reflectFlag && shiftFlag)
            {send {Home}
    }
    else if(reflectFlag)
        {send {Up}
    }
    else if(shiftFlag)
    {
        send ^{Up}
    }
    else
    {
        send {u}

    }
Return

Tab::
    if(reflectFlag && shiftFlag)
    {
        send +{vkDB}
    }
    else if(reflectFlag)
    {
        send {vkDB}
    }
    else if(shiftFlag)
    {
    }
    else
    {
        send {Tab}
    }

return

capslock::
    if(reflectFlag && shiftFlag)
    {
        send +{vkDD}
    }
    else if(reflectFlag)
    {
        send {vkDD}
    }
    else if(shiftFlag)
    {
    }
    else
    {
        send {Enter}
    }
return

F7::
    if(reflectFlag)
    {
        send {Media_Prev}
    }
    else{
        send {F7}
    }
return

F8::
    if(reflectFlag)
    {
        send {Media_Play_Pause}
    }
    else{
        send {F8}
    }
return
F9::
    if(reflectFlag)
    {
        send {Media_Next}
    }
    else{
        send {F9}
    }
return
F10::
    if(reflectFlag)
    {
        send {Volume_Down}
    }
    else{
        send {F10}
    }
return
F11::
    if(reflectFlag)
    {
        send {Volume_UP}
    }
    else{
        send {F11}
    }
return
F12::
    if(reflectFlag)
    {
        send {Volume_Mute}
    }
    else{
        send {F12}
    }
return

Numpadmult::
    if(reflectFlag)
    {
        send {delete}
    }
    else{
        send {backspace}
    }
return


NumpadAdd::
    shiftFlag := True
return
NumpadAdd up::
    shiftFlag := False
return


NumpadSub::
    reflectFlag := True
return
NumpadSub up::
    reflectFlag := False
return

#If activator And thiefMode 
Numpad2::
    send ^{v}
Return

Numpad3::
    send ^{c}
return 