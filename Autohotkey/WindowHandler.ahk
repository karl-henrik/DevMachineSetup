Class WindowHandler
{
    FocusOnWindow(windowname, applicationToStart)
    {    
        if WinExist(windowname)
            WinActivate
        else
            Run, %applicationToStart%
    }

    CycleWindows(windowName, groupname)
    {
        GroupAdd, %groupname%, %windowName% ; Add only Internet Explorer windows to this group.
    GroupActivate, %groupname%, r

    }

    CloseWindow(windowName)
    {
        if WinExist(windowName)
            WinClose ; Use the window found by WinExist.    
    }

}

