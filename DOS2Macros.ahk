#NoEnv
#SingleInstance Force
CoordMode Pixel, Screen
CoordMode Mouse, Screen

#IfWinActive ahk_class SDL_app
^1::DOS2InventoryMacro("SendToBeast")
^2::DOS2InventoryMacro("SendToIfan")
^3::DOS2InventoryMacro("SendToLadyVengence")
^4::DOS2InventoryMacro("SendToSebille",,"*70")

; ── hold Ctrl + K → watch the pixel under the cursor;  
;    if it isn’t pure black, fire the Lady-Vengeance macro once per 200 ms
$^k::    SetTimer, CheckPixel, 30        ; start watching
$^k Up:: SetTimer, CheckPixel, Off       ; stop when key released



CheckPixel() {
    static lastFire := 0
    MouseGetPos, px, py
    PixelGetColor, clr, %px%, %py%, RGB
    red   := (clr >> 16) & 0xFF
    green := (clr >>  8) & 0xFF
    blue  :=  clr        & 0xFF
    if ( (red >= 40) || (green >= 40) || (blue >= 40) ) {         ; brighter than background grid
        DOS2InventoryMacro("SendToLadyVengence",,"*60")
    }
}

DOS2InventoryMacro(ImagePath, SearchRadius:=300, Variation:="*50") {
    ImagePath := A_ScriptDir . "\Resources\" . ImagePath . ".png"
    
    Click, Right
    Sleep,220

    ;Get bounding rect to find image
    MouseGetPos, cx, cy
    left   := Max(cx-SearchRadius, 0)
    top    := Max(cy-SearchRadius, 0)
    right  := Min(cx+SearchRadius, A_ScreenWidth-1)
    bottom := Min(cy+SearchRadius, A_ScreenHeight-1)

    ;Find and click image
    ImageSearch, fx, fy, %left%, %top%, %right%, %bottom%, %Variation% %ImagePath%
    if (ErrorLevel = 0) {
      MouseGetPos, cx, cy
      MouseClick, left, %fx%, %fy%,1,0
      MouseMove, %cx%, %cy%,0
    }
    return false
}

