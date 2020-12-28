
function SwitchScreen(selectedTab as integer)
	SetViewOffset(0, 0)
	thisScreen as integer : thisScreen = constSwitchScreen
	
	if (selectedTab = 0) then selectedTab = 1
	tabSelected[thisScreen] = selectedTab
	
	select tabSelected[thisScreen]
		case 1
			SwitchScreenPreviewTab()
		endcase
		case 2
			SwitchScreenCodeTab()
		endcase
	endselect
endfunction

function SwitchScreenPreviewTab()
	thisScreen as integer : thisScreen = constSwitchScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]
	
	// Initiate Screen
	contentHeight# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUISwitch;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	switch as integer[20]
	txtLabel as integer[20]
	
	txtLabel[1] = OryUICreateText("text:Default switch (Unchecked)[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[1]) + 2
	switch[1] = OryUICreateSwitch("offset:topCenter;position:50," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetSwitchHeight(switch[1]) + 2

	txtLabel[2] = OryUICreateText("text:Setting two colors (Unchecked)[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[2]) + 2
	switch[2] = OryUICreateSwitch("offset:topCenter;position:50," + str(contentHeight#) + ";checkedColor:95,169,49;uncheckedColor:150,150,150;depth:20")
	contentHeight# = contentHeight# + OryUIGetSwitchHeight(switch[2]) + 2

	txtLabel[3] = OryUICreateText("text:Setting three colors (Unchecked)[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[3]) + 2
	switch[3] = OryUICreateSwitch("offset:topCenter;position:50," + str(contentHeight#) + ";switchCheckedColor:200,200,200;switchUncheckedColor:200,200,200;trackCheckedColor:137,188,105;trackUncheckedColor:222,110,62;depth:20")
	contentHeight# = contentHeight# + OryUIGetSwitchHeight(switch[3]) + 2

	txtLabel[4] = OryUICreateText("text:Default Android Style (Unchecked)[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[4]) + 2
	switch[4] = OryUICreateSwitch("platformStyle:Android;offset:topCenter;position:50," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetSwitchHeight(switch[4]) + 2

	txtLabel[5] = OryUICreateText("text:Default iOS Style (Unchecked)[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[5]) + 2
	switch[5] = OryUICreateSwitch("platformStyle:iOS;offset:topCenter;position:50," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetSwitchHeight(switch[5]) + 2

	txtLabel[6] = OryUICreateText("text:Custom Android Style (Unchecked)[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[6]) + 2
	switch[6] = OryUICreateSwitch("platformStyle:Android;offset:topCenter;position:50," + str(contentHeight#) + ";switchCheckedColor:231,197,211;switchUncheckedColor:227,227,227;trackCheckedColor:191,163,177;trackUncheckedColor:169,169,169;depth:20")
	contentHeight# = contentHeight# + OryUIGetSwitchHeight(switch[6]) + 2

	txtLabel[7] = OryUICreateText("text:Custom iOS Style (Unchecked)[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[7]) + 2
	switch[7] = OryUICreateSwitch("platformStyle:iOS;offset:topCenter;position:50," + str(contentHeight#) + ";switchCheckedColor:231,197,211;switchUncheckedColor:227,227,227;trackCheckedColor:191,163,177;trackUncheckedColor:169,169,169;depth:20")
	contentHeight# = contentHeight# + OryUIGetSwitchHeight(switch[7]) + 2

	switchOffImage = LoadImage("SwitchSwitchOff.png")
	switchOnImage = LoadImage("SwitchSwitchOn.png")
	trackOffImage = LoadImage("SwitchTrackOff.png")
	trackOnImage = LoadImage("SwitchTrackOn.png")
	txtLabel[8] = OryUICreateText("text:Switch from 4 images (Unchecked)[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[8]) + 2
	switch[8] = OryUICreateSwitch("trackSize:20,5.5;switchSize:-1,5;offset:topCenter;position:50," + str(contentHeight#) + ";switchCheckedImage:" + str(switchOnImage) + ";switchUncheckedImage:" + str(switchOffImage) + ";trackCheckedImage:" + str(trackOnImage) + ";trackUncheckedImage:" + str(trackOffImage) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetSwitchHeight(switch[8]) + 50

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
			OryUIInsertSwitchListener(switch[i])
			checkedString$ as string
			if (OryUIGetSwitchChecked(switch[i]))
				checkedString$ = "Checked"
			else
				checkedString$ = "Unchecked"
			endif
			if (i = 1) then OryUIUpdateText(txtLabel[i], "text:Default switch (" + checkedString$ + ")[colon]")
			if (i = 2) then OryUIUpdateText(txtLabel[i], "text:Setting two colors (" + checkedString$ + ")[colon]")
			if (i = 3) then OryUIUpdateText(txtLabel[i], "text:Setting three colors (" + checkedString$ + ")[colon]")
			if (i = 4) then OryUIUpdateText(txtLabel[i], "text:Default Android Style (" + checkedString$ + ")[colon]")
			if (i = 5) then OryUIUpdateText(txtLabel[i], "text:Default iOS Style (" + checkedString$ + ")[colon]")
			if (i = 6) then OryUIUpdateText(txtLabel[i], "text:Custom Android Style (" + checkedString$ + ")[colon]")
			if (i = 7) then OryUIUpdateText(txtLabel[i], "text:Custom iOS Style (" + checkedString$ + ")[colon]")
			if (i = 8) then OryUIUpdateText(txtLabel[i], "text:Switch from 4 images (" + checkedString$ + ")[colon]")
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
	DeleteImage(switchOffImage)
	DeleteImage(switchOnImage)
	DeleteImage(trackOffImage)
	DeleteImage(trackOnImage)
endfunction

function SwitchScreenCodeTab()
	thisScreen as integer : thisScreen = constSwitchScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]

	// Initiate Screen
	contentHeight# as float
	contentWidth# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUISwitch;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	txtCode as integer : txtCode = OryUICreateText("text:" + ReadCodeFile("SwitchScreen.txt") + ";size:2;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
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
			ShareCode("SwitchScreen.txt")
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