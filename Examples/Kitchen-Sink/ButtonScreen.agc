
function ButtonScreen(selectedTab as integer)
	SetViewOffset(0, 0)
	thisScreen as integer : thisScreen = constButtonScreen
	
	if (selectedTab = 0) then selectedTab = 1
	tabSelected[thisScreen] = selectedTab
	
	select tabSelected[thisScreen]
		case 1
			ButtonScreenPreviewTab()
		endcase
		case 2
			ButtonScreenCodeTab()
		endcase
	endselect
endfunction

function ButtonScreenPreviewTab()
	thisScreen as integer : thisScreen = constButtonScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]
	
	// Initiate Screen
	contentHeight# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUIButton;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	button as integer[20]
	txtLabel as integer[20]
	
	txtLabel[1] = OryUICreateText("text:Buttons with text[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[1]) + 2
	button[1] = OryUICreateButton("size:30,5;text:Button;offset:15,0;position:33," + str(contentHeight#) + ";depth:20")
	button[2] = OryUICreateButton("size:30,5;text:Button;offset:15,0;position:67," + str(contentHeight#) + ";color:255,0,0;depth:20")
	contentHeight# = contentHeight# + OryUIGetButtonHeight(button[2]) + 2

	txtLabel[3] = OryUICreateText("text:Transparent button with text[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[3]) + 2
	button[3] = OryUICreateButton("size:30,5;text:Button;offset:15,0;position:50," + str(contentHeight#) + ";alpha:0;textColor:87,7,235;depth:20")
	contentHeight# = contentHeight# + OryUIGetButtonHeight(button[3]) + 2
	
	txtLabel[4] = OryUICreateText("text:Button with icon only[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[4]) + 2
	button[4] = OryUICreateButton("size:12,5;text:;icon:share;offset:6,0;position:50," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetButtonHeight(button[4]) + 2
	
	txtLabel[5] = OryUICreateText("text:Button with icon and text[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[5]) + 2
	button[5] = OryUICreateButton("size:36,5;text:Button;icon:Share;iconSize:-1,2;iconPlacement:left;offset:18,0;position:50," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetButtonHeight(button[5]) + 2
	
	txtLabel[6] = OryUICreateText("text:Button disabled[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[6]) + 2
	button[6] = OryUICreateButton("size:30,5;text:Button;enabled:false;offset:15,0;position:50," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetButtonHeight(button[6]) + 2
	
	playButtonImage as integer : playButtonImage = LoadImage("PlayButton.png")
	txtLabel[7] = OryUICreateText("text:Image button[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[7]) + 2
	button[7] = OryUICreateButton("size:20,-1;text: ;image:" + str(playButtonImage) + ";offset:10,0;position:50," + str(contentHeight#) + ";color:255,255,255;depth:20")
	contentHeight# = contentHeight# + OryUIGetButtonHeight(button[7]) + 50
	
	tooltip as integer : tooltip = OryUICreateTooltip("")

	scrollToTop as integer : scrollToTop = OryUICreateScrollToTop("color:52,73,94")
	
	// Manage Screen
	do	
		PrintDebug()
		
		// ScrollToTop listeners need to be added to the top of the do loop. Adding it to the bottom causes the screen to flicker when pressed.
		OryUIInsertScrollToTopListener(scrollToTop)	
		
		OryUIInsertTopBarListener(topBar)
		if (OryUIGetTopBarNavigationReleasedName(topBar) = "Menu")
			OryUIShowNavigationDrawer(mainMenu)
		endif
		ProcessMainMenu()

		OryUIInsertTabsListener(tabs)
		if (OryUIGetTabsButtonReleasedID(tabs) >= 1)
			tabSelected[thisScreen] = OryUIGetTabsButtonReleasedID(tabs)
		endif
		
		for i = 1 to 7
			if (OryUIGetButtonReleased(button[i]))
				OryUIUpdateTooltip(tooltip, "text:Button " + str(i) + " Released")
				OryUIShowTooltip(tooltip, GetViewOffsetX() + 50, GetViewOffsetY() + 90)
			endif
		next
		
		// Change Screen/Tab?
		if (screen <> thisScreen or tabSelected[thisScreen] <> thisTab) then exit
		
		// Scroll Limits
		OryUISetScreenScrollLimits(0, 0, 0, contentHeight# - 100.0)
		
		OryUIAnimateTooltip(tooltip)
		
		OryUISync()
	loop
	
	// Delete all OryUI created components
	OryUIDeleteAllWidgets()
	
	// Delete everything else
	DeleteImage(playButtonImage)
endfunction

function ButtonScreenCodeTab()
	thisScreen as integer : thisScreen = constButtonScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]

	// Initiate Screen
	contentHeight# as float
	contentWidth# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUIButton;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	txtCode as integer : txtCode = OryUICreateText("text:" + ReadCodeFile("ButtonScreen.txt") + ";size:2;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtCode) + 50
	contentWidth# = GetTextTotalWidth(txtCode) + 10
	
	fabShare as integer : fabShare = OryUICreateFloatingActionButton("icon:Share;mini:true;placement:bottomcentre;color:52,73,94;depth:10")
	OryUIShowFloatingActionButton(fabShare)
	
	// Manage Screen
	do
		PrintDebug()

		OryUIInsertTopBarListener(topBar)
		if (OryUIGetTopBarNavigationReleasedName(topBar) = "Menu")
			OryUIShowNavigationDrawer(mainMenu)
		endif
		ProcessMainMenu()

		OryUIInsertTabsListener(tabs)
		if (OryUIGetTabsButtonReleasedID(tabs) >= 1)
			tabSelected[thisScreen] = OryUIGetTabsButtonReleasedID(tabs)
		endif

		if (OryUIGetFloatingActionButtonReleased(fabShare))
			ShareCode("ButtonScreen.txt")
		endif
		
		// Change Screen/Tab?
		if (screen <> thisScreen or tabSelected[thisScreen] <> thisTab) then exit
		
		// Scroll Limits
		OryUISetScreenScrollLimits(0, contentWidth# - 100.0, 0, contentHeight# - 100.0)
		
		OryUISync()
	loop
	
	// Delete all OryUI created components
	OryUIDeleteAllWidgets()
endfunction