Set oWS = WScript.CreateObject("WScript.Shell")
home=oWS.ExpandEnvironmentStrings("%USERPROFILE%")
root=oWS.ExpandEnvironmentStrings("%SYSTEMROOT%")

Set oLink = oWS.CreateShortcut(home+"\Desktop\Omni Integrators WorkBench Explorer.lnk")
oLink.TargetPath = root+"\explorer.exe"
oLink.Arguments=home+"\omnidock\data"
oLink.Save
      
Set oLink = oWS.CreateShortcut(home+"\Desktop\Omni Integrators Workbench Shell.lnk")
oLink.Description = "OmniDock Shell"
oLink.TargetPath = "sh"
oLink.Arguments="-login -i bin\desk\omnidock"
oLink.WorkingDirectory=home+"\omnidock"
oLink.Save
      
Set oLink = oWS.CreateShortcut(home+"\Desktop\Omni Integrators Workbench Consoles.url")
oLink.TargetPath = "file:///"+home+"/omnidock/index.html"
oLink.Save

Set oLink = oWS.CreateShortcut(home+"\Desktop\Omni Integrators WorkBench.url")
oLink.TargetPath = "http://localhost:8086"
oLink.Save

