
function MoreSoonScreen()
	SetViewOffset(0, 0)
	// Initiate Screen
	contentHeight# as float : contentHeight# = 0
	
	topBar as integer : topBar = OryUICreateWidget("widget:TopBar;text:More Examples Soon...;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar) + 2
		
	textCard as integer[20]
	
	textCard[1] = OryUICreateTextCard("width:94;headerText:OryUIHTTPSQueue;supportingText:This one might be a hard one to demo, but it lets you queue HTTPS call requests. When a request is successful it is moved from the queue and any remaining ones in the queue are tried until the queue is empty. If a request fails it is put to the end of the queue to be tried again. Each item in the queue can be assigned ID's or you can see which script on the server was called, to know what request was just successful and handle it accordingly.;position:3," + str(contentHeight#) + ";autoHeight:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard[1]) + 2
	
	textCard[2] = OryUICreateTextCard("width:94;headerText:OryUIList;supportingText:OryUIList is a widget for handling lists. There is one example of a list on the Icons screen within this app.;position:3," + str(contentHeight#) + ";autoHeight:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard[2]) + 2
	
	textCard[3] = OryUICreateTextCard("width:94;headerText:OryUINavigationDrawer;supportingText:OryUINavigationDrawer is a widget that creates a navigation menu. Icons can be assigned to each item in the menu. This app uses the OryUINavigationDrawer to let you move between the different example screens.;position:3," + str(contentHeight#) + ";autoHeight:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard[3]) + 2
	
	textCard[4] = OryUICreateTextCard("width:94;headerText:OryUIPagination;supportingText:OryUIPagination is a widget that creates a row of buttons for page numbers.;position:3," + str(contentHeight#) + ";autoHeight:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard[4]) + 2
	
	textCard[5] = OryUICreateTextCard("width:94;headerText:OryUIScrollBar;supportingText:There is an example of a scroll bar on this screen. Scroll bars can be set up to allow for touch and drag to scroll the screen quickly or just visual bars that the user can't interact with. These can also be set to remain on the screen at all times, or hide after a few seconds of the screen being still.;position:3," + str(contentHeight#) + ";autoHeight:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard[5]) + 2
	
	textCard[6] = OryUICreateTextCard("width:94;headerText:OryUIScrollToTop;supportingText:You will find an example of the OryUIScrollToTop widget on all screens in this app when you flick or drag the screen to scroll.;position:3," + str(contentHeight#) + ";autoHeight:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard[6]) + 2
	
	textCard[7] = OryUICreateTextCard("width:94;headerText:OryUISprite;supportingText:Not much to show with this widget. A few of the AGK sprite functions have been built into this one. It also has a few functions for positioning one sprite on top of another i.e. pin sprite a to the center of sprite b, or pin sprite a to the bottom right of sprite b. The full list of functions can be found on the GitHub repository Wiki section.;position:3," + str(contentHeight#) + ";autoHeight:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard[7]) + 2
	
	textCard[8] = OryUICreateTextCard("width:94;headerText:OryUITabs;supportingText:OryUITabs are used on almost all screens in this app. The maximum number of tabs in this app on any one screen is 2, but you can have more.;position:3," + str(contentHeight#) + ";autoHeight:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard[8]) + 2
	
	textCard[9] = OryUICreateTextCard("width:94;headerText:OryUITextfield;supportingText:OryUITextfield creates nicer looking edit boxes. One example of this can be found in this app on the OryUIFloatingActionButton screen.;position:3," + str(contentHeight#) + ";autoHeight:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard[9]) + 2
	
	textCard[10] = OryUICreateTextCard("width:94;headerText:OryUIText;supportingText:Like OryUISprite there isn't much to show with this widget. A few of the AGK text functions have been built into this one. It also has a few functions for positioning text on top of a sprite i.e. pin text a to the center of sprite b, or pin text a to the bottom right of sprite b. These pin functions auto align text, so in the last pin text to a to the bottom right of sprite b, the text will be aligned to the right. The full list of functions can be found on the GitHub repository Wiki section.;position:3," + str(contentHeight#) + ";autoHeight:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard[10]) + 2

	textCard[11] = OryUICreateTextCard("width:94;headerText:OryUITooltip;supportingText:OryUITooltips are text items that flash up on the screen, usually at the bottom, to let the user know that they've done something. You'll see examples on the OryUIButton and OryUIButtonGroup screens in this app.;position:3," + str(contentHeight#) + ";autoHeight:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard[11]) + 2
	
	textCard[12] = OryUICreateTextCard("width:94;headerText:OryUITopBar;supportingText:OryUITopBar can be found on every screen in this app. In this app I've chosen to add the menu to all screens for convenient but you can have other buttons in its place, like the back button to go back to the previous screen. Top bars also allow for action buttons to be added to the top right of the top bar. You'll see a demo of this on the OryUIMenu screen in this app.;position:3," + str(contentHeight#) + ";autoHeight:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard[12]) + 50

	startScrollBarY# as float : startScrollBarY# = OryUIGetTopBarHeight(topBar) + 1
	trackBarHeight# as float : trackBarHeight# = 100 - startScrollBarY# - 1
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

		// Device OS back button pressed
		if (GetRawKeyPressed(27))
			screen = constHomeScreen
		endif
		
		// Change Screen?
		if (screen <> constMoreSoonScreen) then exit
		
		// Scroll Limits
		OryUISetScreenScrollLimits(0, 0, 0, contentHeight# - 100.0)
		
		OryUISync()
	loop
	
	// Delete all OryUI created components
	OryUIDeleteAllWidgets()
endfunction
