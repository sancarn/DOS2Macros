; AutoHotkey v1 – red 200 × 200 frame (±100 px) that follows the cursor,
; never activates, and is clipped to 0‥A_ScreenWidth / 0‥A_ScreenHeight.
#NoEnv
#SingleInstance Force
CoordMode, Mouse, Screen

off  := 300        ; half-side
edge := 2          ; border thickness

Loop 4
{
    Gui, %A_Index%:+AlwaysOnTop -Caption +ToolWindow +E0x20 +LastFound
    Gui, %A_Index%:Color, FF0000
}

SetTimer, Track, 16   ; ≈60 fps
return

Track:
    MouseGetPos, cx, cy
    left   := Max(cx-off, 0)
    top    := Max(cy-off, 0)
    right  := Min(cx+off, A_ScreenWidth-1)
    bottom := Min(cy+off, A_ScreenHeight-1)

    w := right - left + 1        ; width  for top/bottom
    h := bottom - top + 1        ; height for left/right

    Gui, 1:Show, % "x" left  " y" top    " w" w    " h" edge " NA"   ; top
    Gui, 2:Show, % "x" left  " y" bottom " w" w    " h" edge " NA"   ; bottom
    Gui, 3:Show, % "x" left  " y" top    " w" edge " h" h    " NA"   ; left
    Gui, 4:Show, % "x" right " y" top    " w" edge " h" h    " NA"   ; right
return

Esc::ExitApp
