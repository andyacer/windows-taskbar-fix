; #FUNCTION# ====================================================================================================================
; Name ..........: _MoveTaskBar
; Description ...: Moves the Windows Taskbar to a New Location on the Screen.
; Syntax ........: _MoveTaskBar([$ScreenPosX [, $ScreenPosY = '']])
; Parameters ....: $ScreenPosX = Left, Right, Top, Bottom
;                or $ScreenPosX And $ScreenPosY = New Window Location
; Return values .: Success - True
;                 Failure - False
; Origal Author ........: IanN1990
; Later Edtis ........: Andy Acer
; Remarks .......:
; Example .......:
; Note ..........: CUSTOM EDITS made to resize the taskbar wider, after moving.
;
; FOUND THIS SCRIPT Originally here: https://www.autoitscript.com/forum/topic/148470-windows-7-move-taskbar/
; Now saved on Github:
; ===============================================================================================================================

#NoTrayIcon
#include <String.au3>

Func _MoveTaskBar($ScreenPosX, $ScreenPosY='')
    Local $LockState = RegRead("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "TaskbarSizeMove") ;Get Lock State
    Local $TaskBarPos = WinGetPos('[Class:Shell_TrayWnd]') ;Get Current TaskBar State

    If Not $LockState Then DllCall("user32.dll", "lresult", "SendMessageW", "hwnd", WinGetHandle("[CLASS:Shell_TrayWnd]"), "uint", 273, "wparam", 424, "lparam", 0) ;Unlock Taskbar
    ControlSend('[Class:Shell_TrayWnd]', '', '', '!{Space}' & '{m}' & '{Up}') ;Prepare TaskBar For Movement

        If $ScreenPosX = 'Left' Then
            MouseMove(0, @DesktopHeight/2, 0)
        ElseIf $ScreenPosX = 'Right' Then
            MouseMove(@DesktopWidth/1.25, @DesktopHeight/2, 0)
        ElseIf $ScreenPosX = 'Top' Then
            MouseMove(@DesktopWidth/2, 0, 0)
        Elseif $ScreenPosX = 'Bottom' Then
            MouseMove(@DesktopWidth/2, @DesktopHeight, 0)
        ElseIf IsNumber($ScreenPosX) And IsNumber($ScreenPosY) Then
            MouseMove($ScreenPosX, $ScreenPosY, 0)
        EndIf

    ControlSend('[Class:Shell_TrayWnd]', '', '', '{Enter}') ;Complete Location Movemenet

	;REMOVE THIS SECTION IF RESIZING THE WIDTH OF THE TASKBAR ISN'T YOUR THING ----------------------------------
    Sleep(500)
	ControlSend('[Class:Shell_TrayWnd]', '', '', '!{Space}' & '{s}' & '{Left}') ;Prepare TaskBar For Resizing
	ControlSend('[Class:Shell_TrayWnd]', '', '', _StringRepeat('{Left}', 8))    ;Send left arrow a few times, to make it wider
    ControlSend('[Class:Shell_TrayWnd]', '', '', '{Enter}') 					;Complete resizing
    ;------------------------------------------------------------------------------------------------------------

    ControlHide('[Class:Shell_TrayWnd]', '', '[CLASS:TrayClockWClass; INSTANCE:1]') ;Refresh Icons To New Location
    ControlShow('[Class:Shell_TrayWnd]', '', '[CLASS:TrayClockWClass; INSTANCE:1]')

    If Not $LockState Then DllCall("user32.dll", "lresult", "SendMessageW", "hwnd", WinGetHandle("[CLASS:Shell_TrayWnd]"), "uint", 273, "wparam", 424, "lparam", 1) ;Relock Taskbar

    Local $NewTaskBarPos = WinGetPos('[Class:Shell_TrayWnd]') ;Get New TaskBar State

    If IsArray($TaskBarPos) And IsArray($NewTaskBarPos) And Not($TaskBarPos[0]+$TaskBarPos[1]=$NewTaskBarPos[0]+$NewTaskBarPos[1]) Then
        Return 1 ;Success
    Else
        Return 0 ;Failure
    EndIf
 EndFunc

; CUSTOM STUFF HERE.. TO ACTUALLY USE THE AWESOME FUNCTION

Local $TaskBarPos = WinGetPos('[Class:Shell_TrayWnd]') ;Get New TaskBar State

;Check if Taskbar is already where I want it, on the right side of the left screen
If Not ($TaskBarPos[0] < 0 And $TaskBarPos[1] = 0) Then

   Sleep(400)
   _MoveTaskBar(-40, @DesktopHeight/2)

EndIf




