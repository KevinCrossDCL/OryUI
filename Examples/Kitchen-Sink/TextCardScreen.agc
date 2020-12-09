
function TextCardScreen(selectedTab as integer)
	SetViewOffset(0, 0)
	thisScreen as integer : thisScreen = constTextCardScreen
	
	if (selectedTab = 0) then selectedTab = 1
	tabSelected[thisScreen] = selectedTab
	
	select tabSelected[thisScreen]
		case 1
			TextCardScreenPreviewTab()
		endcase
		case 2
			TextCardScreenCodeTab()
		endcase
	endselect
endfunction

function TextCardScreenPreviewTab()
	thisScreen as integer : thisScreen = constTextCardScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]
	
	// Initiate Screen
	contentHeight# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUITextCard;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2
	
	textCard as integer[10]
	
	textCard[1] = OryUICreateTextCard("color:244,244,244;width:94;headerText:Auto Size And Wrap To Content;supportingText:TextCards can be auto sized to their content, and all text is autowrapped." + chr(10) + chr(10) + "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi mattis ex in dignissim faucibus. Quisque vitae dictum urna. Duis pulvinar nec ex ut volutpat. Integer commodo libero purus, sed rutrum augue tristique in. Nam dictum porttitor metus, ac efficitur lectus maximus sodales.;supportingTextAlignment:left;position:3," + str(contentHeight#) + ";autoHeight:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard[1]) + 2
	
	textCard[2] = OryUICreateTextCard("color:244,244,244;width:94;headerText:Text Alignment;headerTextAlignment:center;supportingText:Text in text card headers and supporting text can be aligned.[colon] left (default), center, and right;supportingTextAlignment:right;position:3," + str(contentHeight#) + ";autoHeight:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard[2]) + 2
	
	textCard[3] = OryUICreateTextCard("color:30,30,30;size:45.5,13;headerText:Sunny;headerTextAlignment:center;headerTextColor:255,255,255;headerTextSize:2.5;supportingText:21°C;supportingTextAlignment:center;supportingTextColor:255,255,255;supportingTextSize:7;position:3," + str(contentHeight#) + ";depth:20")
	textCard[4] = OryUICreateTextCard("color:#fad744;size:45.5,13;headerText:Users;headerTextAlignment:left;headerTextColor:221,94,90;headerTextSize:2.5;supportingText:1.2M;supportingTextAlignment:center;supportingTextColor:221,94,90;supportingTextSize:7;position:51.5," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard[3]) + 50
	
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
endfunction

function TextCardScreenCodeTab()
	thisScreen as integer : thisScreen = constTextCardScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]

	// Initiate Screen
	contentHeight# as float
	contentWidth# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUITextCard;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	txtCode as integer : txtCode = OryUICreateText("text:" + ReadCodeFile("TextCardScreen.txt") + ";size:2;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
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
			ShareCode("TextCardScreen.txt")
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