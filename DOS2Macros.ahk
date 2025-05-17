#NoEnv
#SingleInstance Force
CoordMode Pixel, Screen
CoordMode Mouse, Screen

#IfWinActive ahk_class SDL_app
$^B::DOS2InventoryTimer("SendToBeast")
$^I::DOS2InventoryTimer("SendToIfan")
$^S::DOS2InventoryTimer("SendToSebille","*70")
$^F::DOS2InventoryTimer("SendToFane")
$^V::DOS2InventoryTimer("SendToLadyVengence","*70")

DOS2InventoryTimer(ImageName, Variation:="*50") {
    imagePath := A_ScriptDir . "\Resources\" . ImageName . ".png"
    key := SubStr(A_ThisHotkey, 3)
    While GetKeyState(key, "P")  ; e.g. "B" from "^B"
    {
        DOS2InventoryMacro(ImageName,, Variation)
        Sleep,50
    }
}

DOS2InventoryMacro(ImagePath, SearchRadius:=300, Variation:="*50") {
    ImagePath := A_ScriptDir . "\Resources\" . ImagePath . ".png"
    
    Click, Right

    ;Get region to search for image
    MouseGetPos, cx, cy
    left   := Max(cx - SearchRadius, 0)
    top    := Max(cy - SearchRadius, 0)
    right  := Min(cx + SearchRadius, A_ScreenWidth - 1)
    bottom := Min(cy + SearchRadius, A_ScreenHeight - 1)

    ;Loop until we find image, timeout after 300ms
    start := A_TickCount
    Loop {
        ImageSearch, fx, fy, %left%, %top%, %right%, %bottom%, %Variation% %ImagePath%
        if (ErrorLevel = 0)
            break
        if (A_TickCount - start > 300)
            return false
    }

    ; re-grab mouse pos just before click
    MouseGetPos, cx, cy
    Sleep,10 ;buffer to ensure right cx and cy obtained
    MouseClick, Left, %fx%, %fy%, 1, 0
    MouseMove, %cx%, %cy%, 0
    return true
}
