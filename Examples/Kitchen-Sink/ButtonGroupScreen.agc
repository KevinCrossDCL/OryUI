
function ButtonGroupScreen(selectedTab as integer)
	SetViewOffset(0, 0)
	thisScreen as integer : thisScreen = constButtonGroupScreen
	
	if (selectedTab = 0) then selectedTab = 1
	tabSelected[thisScreen] = selectedTab
	
	select tabSelected[thisScreen]
		case 1
			ButtonGroupScreenPreviewTab()
		endcase
		case 2
			ButtonGroupScreenCodeTab()
		endcase
	endselect
endfunction

function ButtonGroupScreenPreviewTab()
	thisScreen as integer : thisScreen = constButtonGroupScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]
	
	// Initiate Screen
	contentHeight# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUIButtonGroup;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	buttonGroup as integer[20]
	txtLabel as integer[20]
	
	txtLabel[1] = OryUICreateText("text:ButtonGroup with text[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[1]) + 2
	buttonGroup[1] = OryUICreateButtonGroup("size:70,5;offset:35,0;position:50," + str(contentHeight#) + ";depth:20")
	OryUIInsertButtonGroupItem(buttonGroup[1], -1, "name:Yes;text:Yes")
	OryUIInsertButtonGroupItem(buttonGroup[1], -1, "name:No;text:No")
	OryUIInsertButtonGroupItem(buttonGroup[1], -1, "name:Maybe;text:Maybe")
	OryUISetButtonGroupItemSelectedByIndex(buttonGroup[1], 2)
	contentHeight# = contentHeight# + OryUIGetButtonGroupHeight(buttonGroup[1]) + 2

	centerAlignImage as integer : centerAlignImage = LoadImage("Icon-Center-Align.png")
	justifyAlignImage as integer : justifyAlignImage = LoadImage("Icon-Justify-Align.png")
	leftAlignImage as integer : leftAlignImage = LoadImage("Icon-Left-Align.png")
	rightAlignImage as integer : rightAlignImage = LoadImage("Icon-Right-Align.png")
	txtLabel[2] = OryUICreateText("text:ButtonGroup with icons only[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[2]) + 2
	buttonGroup[2] = OryUICreateButtonGroup("size:60,5;offset:30,0;position:50," + str(contentHeight#) + ";selectedColor:100,100,100;selectedIconColor:0,0,0;unselectedColor:220,220,220;unselectedIconColor:0,0,0;depth:20")
	OryUIInsertButtonGroupItem(buttonGroup[2], -1, "name:LeftAlign;text:;iconID:" + str(leftAlignImage))
	OryUIInsertButtonGroupItem(buttonGroup[2], -1, "name:CentreAlign;text:;iconID:" + str(centerAlignImage))
	OryUIInsertButtonGroupItem(buttonGroup[2], -1, "name:RightAlign;text:;iconID:" + str(rightAlignImage))
	OryUIInsertButtonGroupItem(buttonGroup[2], -1, "name:JustifyAlign;text:;iconID:" + str(justifyAlignImage))
	OryUISetButtonGroupItemSelectedByIndex(buttonGroup[2], 1)
	contentHeight# = contentHeight# + OryUIGetButtonGroupHeight(buttonGroup[2]) + 2
	
	greenFlagImage as integer : greenFlagImage = LoadImage("FlagGreen.png")
	redFlagImage as integer : redFlagImage = LoadImage("FlagRed.png")
	yellowFlagImage as integer : yellowFlagImage = LoadImage("FlagYellow.png")
	txtLabel[3] = OryUICreateText("text:ButtonGroup with icons and text[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[3]) + 2
	buttonGroup[3] = OryUICreateButtonGroup("size:90,5;offset:45,0;position:50," + str(contentHeight#) + ";depth:20")
	OryUIInsertButtonGroupItem(buttonGroup[3], -1, "name:RedFlag;text:Red;iconID:" + str(redFlagImage))
	OryUIInsertButtonGroupItem(buttonGroup[3], -1, "name:YellowFlag;text:Yellow;iconID:" + str(yellowFlagImage))
	OryUIInsertButtonGroupItem(buttonGroup[3], -1, "name:GreenFlag;text:Green;iconID:" + str(greenFlagImage))
	OryUISetButtonGroupItemSelectedByIndex(buttonGroup[3], 3)
	contentHeight# = contentHeight# + OryUIGetButtonGroupHeight(buttonGroup[3]) + 50
	
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
		
		for i = 1 to 3
			OryUIInsertButtonGroupListener(buttonGroup[i])
			if (OryUIGetButtonGroupItemReleasedName(buttonGroup[i]) <> "")
				OryUIUpdateTooltip(tooltip, "text:Button '" + OryUIGetButtonGroupItemReleasedName(buttonGroup[i]) + "' Released")
				OryUIShowTooltip(tooltip, GetViewOffsetX() + 50, GetViewOffsetY() + 90)
			endif
		next
		
		// Device OS back button pressed
		if (GetRawKeyPressed(27))
			screen = constHomeScreen
		endif
		
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
	DeleteImage(centerAlignImage)
	DeleteImage(greenFlagImage)
	DeleteImage(justifyAlignImage)
	DeleteImage(leftAlignImage)
	DeleteImage(redFlagImage)
	DeleteImage(rightAlignImage)
	DeleteImage(yellowFlagImage)
endfunction

function ButtonGroupScreenCodeTab()
	thisScreen as integer : thisScreen = constButtonGroupScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]

	// Initiate Screen
	contentHeight# as float
	contentWidth# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUIButtonGroup;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	txtCode as integer : txtCode = OryUICreateText("text:" + ReadCodeFile("ButtonGroupScreen.txt") + ";size:2;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
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
			ShareCode("ButtonGroupScreen.txt")
		endif
		
		// Device OS back button pressed
		if (GetRawKeyPressed(27))
			tabSelected[thisScreen] = 1
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
