#Requires AutoHotkey v2.0.18+
#SingleInstance Force
CoordMode("ToolTip","Screen")
CoordMode("Mouse","Screen")
SetTitleMatchMode(3)

while(!WinExist("Roblox")) {
    MsgBox("start roblox")
}

*!r::Reload()

*!e::{
    static data := []
    if(!WinExist("Roblox")) {
        Reload()
        return
    }
    if(data.Length<2) {
        MouseGetPos(&x,&y)
        WinGetClientPos(&wx,&wy,&w,&h,"Roblox")
        data.Push({x:x-wx,y:y-wy,w:w,h:h})
        ToolTip(data.Length,x,y,data.Length)
    }
    if(data.Length>=2) {
        try {
            InputBox("UDIM2 PROPORTIONS",,,"{px: " (data[1].x-data[2].x)/(data[1].w-data[2].w) ", py: " (data[1].y-data[2].y)/(data[1].h-data[2].h) "}")
            Reload()
        } catch {
            MsgBox("follow the instructions you retard")
            Reload()
        }
    }
}

eyeStrain(hotkey,dx,dy) {
    MouseMove(dx,dy,,"R")
    while GetKeyState(hotkey,"P") {
    }
}

Up::eyeStrain(A_ThisHotkey,0,-1)
Left::eyeStrain(A_ThisHotkey,-1,0)
Down::eyeStrain(A_ThisHotkey,0,1)
Right::eyeStrain(A_ThisHotkey,1,0)

MsgBox("press OK to close this script`n`nALT R: restart`nALT E: place points`nARROW KEYS: move cursor by 1 pixel`n`nHOW TO USE:`n1. pick a point on a gui`n2. move cursor to it and press ALT E`n3. resize roblox window on x and y axis`n4. go to the same point on the gui with cursor then press ALT E")
ExitApp()