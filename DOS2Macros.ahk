#NoEnv
#SingleInstance Force
CoordMode Pixel, Screen
CoordMode Mouse, Screen

ContextRowHeight:=30

#IfWinActive ahk_class SDL_app

;Send to a specific character
$^R::DOS2InventoryTimer("SendToRedPrince")
$^S::DOS2InventoryTimer("SendToSebille")
$^I::DOS2InventoryTimer("SendToIfan")
$^B::DOS2InventoryTimer("SendToBeast")
$^L::DOS2InventoryTimer("SendToLohse")
$^F::DOS2InventoryTimer("SendToFane")
$^D::DOS2InventoryTimer("Drop")


;Send to the lady vengence
$^V::DOS2InventoryTimer("SendToLadyVengence")

;Send to the 1st( or 2nd, 3rd, 4th) option listed in the context menu
$^1::DOS2InventoryTimer("SendToAmbiguous",, 0*ContextRowHeight)
$^2::DOS2InventoryTimer("SendToAmbiguous",, 1*ContextRowHeight)
$^3::DOS2InventoryTimer("SendToAmbiguous",, 2*ContextRowHeight)
$^4::DOS2InventoryTimer("SendToAmbiguous",, 3*ContextRowHeight)



DOS2InventoryTimer(ImageName, Variation:="*70", FixedOffset:=0) {
    key := SubStr(A_ThisHotkey, 3)
    While GetKeyState(key, "P")  ; e.g. "B" from "^B"
    {
        DOS2InventoryMacro(ImageName,, Variation, FixedOffset)
        Sleep,50
    }
}

DOS2InventoryMacro(ImagePath, SearchRadius:=300, Variation:="*50", FixedOffset:=0) {
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
    fy := fy + FixedOffset
    
    ; re-grab mouse pos just before click
    MouseGetPos, cx, cy
    Sleep,10 ;buffer to ensure right cx and cy obtained
    MouseClick, Left, %fx%, %fy%, 1, 0
    MouseMove, %cx%, %cy%, 0
    return true
}
