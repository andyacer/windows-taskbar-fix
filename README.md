# Moving the Windows Taskbar back to where you want it

**Short Description**
This AutoIT script can be used to automatically adjust the Windows taskbar after it is annoyingly moved by windows when a monitor goes to sleep.

**The Problem**
The operating system known as *"Windows 10"* seems to be unaware that some people use multiple monitors and that some monitors have powersaving features.  When some monitors go to sleep they register as disconnected.  When that happens, Windows changes the desktop to accomodate fewer monitors and can move the taskbar in the process.  When the user returns and all the monitors are once again active, the user finds that the desktop taskbar has been moved and isn't where it was before.  The user might then curse Microsoft and the developers that decided not to account for this scenario.

**The Solution**
AutoIT.  It's a pretty great scripting language that can automate GUI actions in Windows.  This script uses AutoIT to fix the above mentioned problem.

**Details**
I compiled this script into an executable and set it as a scheduled task so that every time I unlock my computer, my taskbar is moved back to my left screen, how I want it.  

Discussion threads that discuss this problem:
https://answers.microsoft.com/en-us/windows/forum/all/windows-10-keeps-moving-taskbar-even-if-locked/33109f86-7e5b-4bd2-b871-1d4580900090
https://answers.microsoft.com/en-us/windows/forum/windows_10-desktop/taskbar-resetting-after-computer-goes-into-sleep/9d99a4ce-a255-43b4-9b90-e6bd3f6345a4

# I just want to use the script

Currently, this script moves the taskbar to the *left monitor* on the *right side* and makes it a bit wider.

Here's all that you need to do to use it:
1. Download this repo.
1. Install [AutoIT](https://www.autoitscript.com/site/autoit/downloads/).
1. Move the taskbar to the bottom of your screen.
1. Run the script.  The taskbar should automatically move.

# I want to use it just like you did, how do I do that?

You'll need to create a scheduled task to automate the whole thing.  And to create the scheduled task you'll need to enable some additional audit logs.  I set it up so that it fixes my taskbar every time I unlock my machine, which is Windows event ID 4801.  I could write some more code to automate the install and make the taskbar location selectable ... but I won't bother unless someone asks really nicely.

1. Click the button in the upper right to download this repo.
1. Install [AutoIT](https://www.autoitscript.com/site/autoit/downloads/).
1. Move the taskbar to the bottom of your display, then run the script to test it.  Make sure it's working before adding in the automation.
1. Enable the proper audit logs if they're not already firing.  Steps taken from [Stack Overflow](https://stackoverflow.com/a/15904838).
  1. Run "gpedit.msc"
  1. Enable Audit Other Login/Logoff Events which can be found by following the tree to here:
     Computer Configuration ->
     Windows Settings ->
     Security Settings ->
     Advanced Audit Policy Configuration ->
     System Audit Policies - Local Group Policy Object ->
     Logon/Logoff ->
     Audit Other Login/Logoff Events
1. Testing




