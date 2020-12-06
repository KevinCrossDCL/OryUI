
function HomeScreen()
	SetViewOffset(0, 0)
	// Initiate Screen
	contentHeight# as float : contentHeight# = 0
	
	topBar as integer : topBar = OryUICreateWidget("widget:TopBar;text:OryUI Kitchen Sink;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar) + 2
		
	textCard as integer[10]
	
	textCard[1] = OryUICreateTextCard("width:94;headerText:What is OryUI?;supportingText:OryUI is an opensource UI framework for building apps in AGK (AppGameKit). It is written in AGK Tier 1." + chr(10) + chr(10) + "It has a number of widgets available, with more being added over time. Some of the available widgets include[colon] buttons, dialogs, menus, progress bars, scroll bars, and textfields." + chr(10) + chr(10) + "It is primarily designed for mobile apps.;position:3," + str(contentHeight#) + ";autoHeight:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard[1])
	
	buttonOryUIURL = OryUICreateButton("size:90,5;text:OryUI on GitHub;offset:45,0;position:50," + str(contentHeight#) + ";alpha:0;textColor:#0000EE;depth:20")
	contentHeight# = contentHeight# + OryUIGetButtonHeight(buttonOryUIURL) + 1
	
	buttonAGKURL = OryUICreateButton("size:90,5;text:AppGameKit.com;offset:45,0;position:50," + str(contentHeight#) + ";alpha:0;textColor:#0000EE;depth:20")
	contentHeight# = contentHeight# + OryUIGetButtonHeight(buttonAGKURL) + 1
	
	textCard[2] = OryUICreateTextCard("width:94;headerText:Why choose OryUI?;supportingText:OryUI has been designed to require very little code to implement widgets." + chr(10) + chr(10) + "In standard AGK code you would need to write a dozen lines of code to create, position, style, and action a button, but in AGK you typically only need to write one line to create, position, and style the button. And one line to action the button." + chr(10) + chr(10) + "This is achieved with functions that allow an unlimited number of parameters provided in a semi-colon delimited string." + chr(10) + chr(10) + "OryUI also handles functionality like drag and flick to scroll (inertia scrolling);position:3," + str(contentHeight#) + ";autoHeight:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard[2]) + 2
	
	textCard[3] = OryUICreateTextCard("width:94;headerText:About this app;supportingText:This app is built with the OryUI framework and shows examples of some of the available widgets. At the moment only a few examples have been added, but more will be added overtime.;position:3," + str(contentHeight#) + ";autoHeight:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard[3]) + 50
	
	startScrollBarY# = OryUIGetTopBarHeight(topBar) + 1
	trackBarHeight# = 100 - startScrollBarY# - 1
	scrollBar as integer : scrollBar = OryUICreateScrollBar("alwaysVisible:false;autoResize:false;contentSize:100," + str(contentHeight#) + ";direction:vertical;draggable:true;gripColor:52,73,94;gripIconColor:255,255,255;gripIconSize:4,5;gripSize:4.5,5;invisibleGripSize:8.5,7;scrollType:fastscroll;showGripIcon:true;trackColor:0,0,0;trackPosition:93," + str(startScrollBarY#) + ";trackSize:4.5," + str(trackBarHeight#))

	scrollToTop as integer : scrollToTop = OryUICreateScrollToTop("color:52,73,94")
	
	// Manage Screen
	do
		PrintDebug()
		
		// ScrollBar listeners need to be added above ScrollToTopListeners
		if (OryUIGetNavigationDrawerVisible(mainMenu) = 0)
			OryUIInsertScrollBarListener(scrollBar)
		else
			OryUIHideScrollBar(scrollBar)
		endif
		
		// ScrollToTop listeners need to be added to the top of the do loop. Adding it to the bottom causes the screen to flicker when pressed.
		OryUIInsertScrollToTopListener(scrollToTop)	
			
		OryUIInsertTopBarListener(topBar)
		if (OryUIGetTopBarNavigationReleasedName(topBar) = "Menu")
			OryUIShowNavigationDrawer(mainMenu)
		endif
		ProcessMainMenu()
		
		if (OryUIGetButtonReleased(buttonOryUIURL))
			OpenBrowser("https://github.com/KevinCrossDCL/OryUI")
		endif
		if (OryUIGetButtonReleased(buttonAGKURL))
			OpenBrowser("https://appgamekit.com")
		endif
		
		// Change Screen?
		if (screen <> constHomeScreen) then exit
		
		// Scroll Limits
		OryUISetScreenScrollLimits(0, 0, 0, contentHeight# - 100.0)
		
		OryUISync()
	loop
	
	// Delete all OryUI created components
	OryUIDeleteAllWidgets()
endfunction