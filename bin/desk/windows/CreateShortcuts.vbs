Set oWS = WScript.CreateObject("WScript.Shell")
Set oLink = oWS.CreateShortcut("$HOME\Desktop\Omni Integrators WorkBench.lnk")
oLink.TargetPath = "$SYSTEMROOT\explorer.exe"
oLink.Arguments="$USERPROFILE\omnidock\data"
oLink.Save
      
Set oLink = oWS.CreateShortcut("$HOME\Desktop\OmniDock.lnk")
oLink.Description = "OmniDock Shell"
oLink.TargetPath = "sh"
oLink.Arguments="-login -i bin\setenv"
oLink.WorkingDirectory="$USERPROFILE\omnidock"
oLink.Save
      
Set oLink = oWS.CreateShortcut("$HOME\Desktop\Omni Consoles.url")
oLink.TargetPath = "file:///$USERPROFILE/omnidock/index.html"
oLink.Save
