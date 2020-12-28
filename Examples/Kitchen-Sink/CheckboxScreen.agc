
function CheckboxScreen(selectedTab as integer)
	SetViewOffset(0, 0)
	thisScreen as integer : thisScreen = constCheckboxScreen
	
	if (selectedTab = 0) then selectedTab = 1
	tabSelected[thisScreen] = selectedTab
	
	select tabSelected[thisScreen]
		case 1
			CheckboxScreenPreviewTab()
		endcase
		case 2
			CheckboxScreenCodeTab()
		endcase
	endselect
endfunction

function CheckboxScreenPreviewTab()
	thisScreen as integer : thisScreen = constCheckboxScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]
	
	// Initiate Screen
	contentHeight# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUICheckbox;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	checkbox as integer[10]
	txtLabel as integer[10]
	
	txtLabel[1] = OryUICreateText("text:Default checkbox (Unchecked)[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[1]) + 2
	checkbox[1] = OryUICreateCheckbox("offset:topCenter;position:50," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetCheckboxHeight(checkbox[1]) + 2

	txtLabel[2] = OryUICreateText("text:Custom color (Unchecked)[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[2]) + 2
	checkbox[2] = OryUICreateCheckbox("offset:topCenter;position:50," + str(contentHeight#) + ";checkedColor:95,169,49;uncheckedColor:150,150,150;depth:20")
	contentHeight# = contentHeight# + OryUIGetCheckboxHeight(checkbox[2]) + 2
	
	txtLabel[3] = OryUICreateText("text:Custom icon (Unchecked)[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[3]) + 2
	checkbox[3] = OryUICreateCheckbox("offset:topCenter;position:50," + str(contentHeight#) + ";checkedColor:255,0,0;checkedImageID:" + str(OryUIReturnIconID("favorite")) + ";uncheckedColor:150,150,150;uncheckedImageID:" + str(OryUIReturnIconID("favorite_border")) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetCheckboxHeight(checkbox[3]) + 2
	
	txtLabel[4] = OryUICreateText("text:Custom size (Unchecked)[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[4]) + 2
	checkbox[4] = OryUICreateCheckbox("offset:topCenter;size:-1,5;position:50," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetCheckboxHeight(checkbox[4]) + 2

	txtLabel[5] = OryUICreateText("text:Custom images (Unchecked)[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[5]) + 2
	checkbox[5] = OryUICreateCheckbox("offset:topCenter;size:-1,5;position:50," + str(contentHeight#) + ";checkedColor:0,0,0;checkedImageID:" + str(oryUICheckboxCheckedImage) + ";uncheckedColor:0,0,0;uncheckedImageID:" + str(oryUICheckboxUncheckedImage) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetCheckboxHeight(checkbox[5]) + 2
	
	checkedImage = LoadImage("CheckboxChecked.png")
	uncheckedImage = LoadImage("CheckboxUnchecked.png")
	txtLabel[6] = OryUICreateText("text:Custom images (Unchecked)[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[6]) + 2
	checkbox[6] = OryUICreateCheckbox("offset:topCenter;size:-1,5;position:50," + str(contentHeight#) + ";checkedColor:255,255,255;checkedImageID:" + str(checkedImage) + ";uncheckedColor:255,255,255;uncheckedImageID:" + str(uncheckedImage) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetCheckboxHeight(checkbox[6]) + 50
	
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
			OryUIInsertCheckboxListener(checkbox[i])
			checkedString$ as string
			if (OryUIGetCheckboxChecked(checkbox[i]))
				checkedString$ = "Checked"
			else
				checkedString$ = "Unchecked"
			endif
			if (i = 1) then OryUIUpdateText(txtLabel[i], "text:Default checkbox (" + checkedString$ + ")[colon]")
			if (i = 2) then OryUIUpdateText(txtLabel[i], "text:Custom color (" + checkedString$ + ")[colon]")
			if (i = 3) then OryUIUpdateText(txtLabel[i], "text:Custom icon (" + checkedString$ + ")[colon]")
			if (i = 4) then OryUIUpdateText(txtLabel[i], "text:Custom size (" + checkedString$ + ")[colon]")
			if (i = 5) then OryUIUpdateText(txtLabel[i], "text:Custom images (" + checkedString$ + ")[colon]")
			if (i = 6) then OryUIUpdateText(txtLabel[i], "text:Custom images (" + checkedString$ + ")[colon]")
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
	DeleteImage(checkedImage)
	DeleteImage(uncheckedImage)
endfunction

function CheckboxScreenCodeTab()
	thisScreen as integer : thisScreen = constCheckboxScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]

	// Initiate Screen
	contentHeight# as float
	contentWidth# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUICheckbox;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	txtCode as integer : txtCode = OryUICreateText("text:" + ReadCodeFile("CheckboxScreen.txt") + ";size:2;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
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
			ShareCode("CheckboxScreen.txt")
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