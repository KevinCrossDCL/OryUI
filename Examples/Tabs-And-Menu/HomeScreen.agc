
function HomeScreen()
	SetViewOffset(0, 0)
	// Initiate Screen
	contentHeight# as float : contentHeight# = 0
	
	topBar as integer : topBar = OryUICreateWidget("widget:TopBar;text:Tabs & Menu Demo;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar) + 2
			
	// Manage Screen
	do
		PrintDebug()
		
		OryUIInsertTopBarListener(topBar)
		if (OryUIGetTopBarNavigationReleasedName(topBar) = "Menu")
			OryUIShowNavigationDrawer(mainMenu)
		endif
		ProcessMainMenu()
		
		// Change Screen?
		if (screen <> constHomeScreen) then exit
		
		// Scroll Limits
		OryUISetScreenScrollLimits(0, 0, 0, contentHeight# - 100.0)
		
		OryUISync()
	loop
	
	// Delete all OryUI created components
	OryUIDeleteAllWidgets()
endfunction