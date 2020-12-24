
function InputSpinnerScreen(selectedTab as integer)
	SetViewOffset(0, 0)
	thisScreen as integer : thisScreen = constInputSpinnerScreen
	
	if (selectedTab = 0) then selectedTab = 1
	tabSelected[thisScreen] = selectedTab
	
	select tabSelected[thisScreen]
		case 1
			InputSpinnerScreenPreviewTab()
		endcase
		case 2
			InputSpinnerScreenCodeTab()
		endcase
	endselect
endfunction

function InputSpinnerScreenPreviewTab()
	thisScreen as integer : thisScreen = constInputSpinnerScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]
	
	// Initiate Screen
	contentHeight# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUIInputSpinner;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	inputSpinner as integer[10]
	txtLabel as integer[10]
	
	txtLabel[1] = OryUICreateText("text:Default input spinner[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[1]) + 2
	inputSpinner[1] = OryUICreateInputSpinner("offset:topCenter;position:50," + str(contentHeight#) + ";activeButtonColor:52,73,94;depth:20")
	contentHeight# = contentHeight# + OryUIGetInputSpinnerHeight(inputSpinner[1]) + 2
	
	txtLabel[2] = OryUICreateText("text:Min & max input spinner[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[2]) + 2
	inputSpinner[2] = OryUICreateInputSpinner("offset:topCenter;min:5;max:10;step:1;position:50," + str(contentHeight#) + ";activeButtonColor:52,73,94;inactiveButtonColor:52,73,94;autoCorrectIfOutOfRange:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetInputSpinnerHeight(inputSpinner[2]) + 2

	txtLabel[3] = OryUICreateText("text:Input spinner with steps of 10[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[3]) + 2
	inputSpinner[3] = OryUICreateInputSpinner("offset:topCenter;step:10;position:50," + str(contentHeight#) + ";activeButtonColor:52,73,94;depth:20")
	contentHeight# = contentHeight# + OryUIGetInputSpinnerHeight(inputSpinner[3]) + 2
	
	txtLabel[4] = OryUICreateText("text:Keyboard input disabled[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[4]) + 2
	inputSpinner[4] = OryUICreateInputSpinner("offset:topCenter;position:50," + str(contentHeight#) + ";activeButtonColor:52,73,94;disableKeyboardInput:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetInputSpinnerHeight(inputSpinner[4]) + 2
	
	txtLabel[5] = OryUICreateText("text:Input spinner with decimal points[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[5]) + 2
	inputSpinner[5] = OryUICreateInputSpinner("size:40,5;offset:topCenter;min:0;max:100;step:0.01;decimals:2;position:50," + str(contentHeight#) + ";activeButtonColor:52,73,94;inactiveButtonColor:52,73,94;autoCorrectIfOutOfRange:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetInputSpinnerHeight(inputSpinner[5]) + 2
	
	txtLabel[6] = OryUICreateText("text:Custom style example 1[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[6]) + 2
	inputSpinner[6] = OryUICreateInputSpinner("size:40,5;offset:topCenter;backgroundColor:255,255,255;activeButtonColor:66,155,213;inactiveButtonColor:169,169,169;textColor:90,90,90;position:50," + str(contentHeight#) + ";min:0;max:99999;maxLength:5;autoCorrectIfOutOfRange:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetInputSpinnerHeight(inputSpinner[6]) + 2
	
	txtLabel[7] = OryUICreateText("text:Custom style example 2[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[7]) + 2
	inputSpinner[7] = OryUICreateInputSpinner("offset:topCenter;backgroundColor:255,255,255;activeButtonColor:255,255,255;activeIconColor:0,0,0;inactiveButtonColor:255,255,255;inactiveIconColor:169,169,169;textColor:0,0,0;addIcon:keyboard_arrow_right;subtractIcon:keyboard_arrow_left;position:50," + str(contentHeight#) + ";min:0;max:100;maxLength:3;autoCorrectIfOutOfRange:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetInputSpinnerHeight(inputSpinner[7]) + 50

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
		
		for i = 1 to 10
			OryUIInsertInputSpinnerListener(inputSpinner[i])	
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
endfunction

function InputSpinnerScreenCodeTab()
	thisScreen as integer : thisScreen = constInputSpinnerScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]

	// Initiate Screen
	contentHeight# as float
	contentWidth# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUIInputSpinner;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	txtCode as integer : txtCode = OryUICreateText("text:" + ReadCodeFile("InputSpinnerScreen.txt") + ";size:2;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
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
			ShareCode("InputSpinnerScreen.txt")
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