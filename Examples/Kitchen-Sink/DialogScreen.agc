
function DialogScreen(selectedTab as integer)
	SetViewOffset(0, 0)
	thisScreen as integer : thisScreen = constDialogScreen
	
	if (selectedTab = 0) then selectedTab = 1
	tabSelected[thisScreen] = selectedTab
	
	select tabSelected[thisScreen]
		case 1
			DialogScreenPreviewTab()
		endcase
		case 2
			DialogScreenCodeTab()
		endcase
	endselect
endfunction

function DialogScreenPreviewTab()
	thisScreen as integer : thisScreen = constDialogScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]
	
	// Initiate Screen
	contentHeight# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUIDialog;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	button as integer[20]
	disableDialog4 as integer
	dialog as integer[20]
	txtLabel as integer[20]
	
	txtLabel[1] = OryUICreateText("text:Simple 'Ok' dialog[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[1]) + 2
	button[1] = OryUICreateButton("size:30,5;text:Reveal;offset:15,0;position:50," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetButtonHeight(button[1]) + 2
	
	txtLabel[2] = OryUICreateText("text:Simple 'Ok' dialog that forces input[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[2]) + 2
	button[2] = OryUICreateButton("size:30,5;text:Reveal;offset:15,0;position:50," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetButtonHeight(button[2]) + 2
	
	txtLabel[3] = OryUICreateText("text:Confirm dialog[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[3]) + 2
	button[3] = OryUICreateButton("size:30,5;text:Reveal;offset:15,0;position:50," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetButtonHeight(button[3]) + 2
	
	txtLabel[4] = OryUICreateText("text:Dialog with checkbox[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[4]) + 2
	button[4] = OryUICreateButton("size:30,5;text:Reveal;offset:15,0;position:50," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetButtonHeight(button[4]) + 2
	
	txtLabel[5] = OryUICreateText("text:Dialog with stacked buttons[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[5]) + 2
	button[5] = OryUICreateButton("size:30,5;text:Reveal;offset:15,0;position:50," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetButtonHeight(button[5]) + 2
	
	txtLabel[6] = OryUICreateText("text:Dialog with flex buttons[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[6]) + 2
	button[6] = OryUICreateButton("size:30,5;text:Reveal;offset:15,0;position:50," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetButtonHeight(button[6]) + 2
	
	txtLabel[7] = OryUICreateText("text:Styled dialog[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[7]) + 2
	button[7] = OryUICreateButton("size:30,5;text:Reveal;offset:15,0;position:50," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetButtonHeight(button[7]) + 2
	
	dialogBackgroundImage = LoadImage("DialogBackground.png")
	txtLabel[8] = OryUICreateText("text:Dialog with background image[colon];size:3;bold:true;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLabel[8]) + 2
	button[8] = OryUICreateButton("size:30,5;text:Reveal;offset:15,0;position:50," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetButtonHeight(button[8]) + 50
	
	// Typically your app would only need one dialog per screen, but because each one in this demo is styled differently I have created a seperate one for each use.
	for i = 1 to 8
		dialog[i] = OryUICreateDialog("autoHeight:true")
	next
	
	tooltip as integer : tooltip = OryUICreateTooltip("")
	
	scrollToTop as integer : scrollToTop = OryUICreateScrollToTop("color:52,73,94")
	
	// Manage Screen
	do	
		PrintDebug()
		
		// ScrollToTop listeners need to be added to the top of the do loop. Adding it to the bottom causes the screen to flicker when pressed.
		OryUIInsertScrollToTopListener(scrollToTop)	
		
		for i = 1 to 8
			OryUIInsertDialogListener(dialog[i])
		next
		
		OryUIInsertTopBarListener(topBar)
		if (OryUIGetTopBarNavigationReleasedName(topBar) = "Menu")
			OryUIShowNavigationDrawer(mainMenu)
		endif
		ProcessMainMenu()

		OryUIInsertTabsListener(tabs)
		if (OryUIGetTabsButtonReleasedID(tabs) >= 1)
			tabSelected[thisScreen] = OryUIGetTabsButtonReleasedID(tabs)
		endif
		
		if (OryUIGetButtonReleased(button[1]))
			OryUIUpdateDialog(dialog[1], "titleText:Simple 'Ok' Dialog;supportingText:Pressing Ok will close this dialog" + chr(10) + chr(10) + "Pressing anywhere on the screen will also close this dialog.;showCheckbox:false;stackButtons:false;flexButtons:false;decisionRequired:false")
			OryUISetDialogButtonCount(dialog[1], 1)
			OryUIUpdateDialogButton(dialog[1], 1, "name:Ok;text:Ok")	
			OryUIShowDialog(dialog[1])
		endif
		
		if (OryUIGetButtonReleased(button[2]))
			OryUIUpdateDialog(dialog[2], "titleText:Simple 'Ok' Dialog;supportingText:Pressing Ok will close this dialog" + chr(10) + chr(10) + "Pressing anywhere on the screen will NOT close this dialog.;showCheckbox:false;stackButtons:false;flexButtons:false;decisionRequired:true")
			OryUISetDialogButtonCount(dialog[2], 1)
			OryUIUpdateDialogButton(dialog[2], 1, "name:Ok;text:Ok")	
			OryUIShowDialog(dialog[2])
		endif
		
		if (OryUIGetButtonReleased(button[3]))
			OryUIUpdateDialog(dialog[3], "titleText:Confirm dialog?;supportingText:Are you sure you want to do this?;showCheckbox:false;stackButtons:false;flexButtons:false;decisionRequired:true")
			OryUISetDialogButtonCount(dialog[3], 2)
			OryUIUpdateDialogButton(dialog[3], 1, "name:Cancel;text:Cancel")	
			OryUIUpdateDialogButton(dialog[3], 2, "name:Yes;text:Yes")
			OryUIShowDialog(dialog[3])
		endif
		
		if (OryUIGetButtonReleased(button[4]))
			if (disableDialog4 = 0)
				OryUIUpdateDialog(dialog[4], "titleText:Dialog with checkbox;supportingText:Ticking the checkbox will stop the dialog from being shown again." + chr(10) + chr(10) + "It will show again the next time this screen is created." + chr(10) + chr(10) + "If you want to hide it for good you will need to save the data/variable.;showCheckbox:true;checkBoxText:Do not show again;checkBoxChecked:true;stackButtons:false;flexButtons:false;decisionRequired:true")
				OryUISetDialogButtonCount(dialog[4], 1)
				OryUIUpdateDialogButton(dialog[4], 1, "name:Ok;text:Ok")
				OryUIShowDialog(dialog[4])
			else
				OryUIUpdateTooltip(tooltip, "text:Dialog not shown")
				OryUIShowTooltip(tooltip, GetViewOffsetX() + 50, GetViewOffsetY() + 90)
			endif
		endif
		if (OryUIGetDialogButtonReleasedName(dialog[4]) <> "" and OryUIGetDialogChecked(dialog[4]))
			disableDialog4 = 1
		endif
		
		if (OryUIGetButtonReleased(button[5]))
			OryUIUpdateDialog(dialog[5], "titleText:Stacked buttons;supportingText:Choose an account;showCheckbox:false;stackButtons:true;flexButtons:true;decisionRequired:true")
			OryUISetDialogButtonCount(dialog[5], 4)
			OryUIUpdateDialogButton(dialog[5], 1, "name:AccountOne;text:Account One")
			OryUIUpdateDialogButton(dialog[5], 2, "name:AccountTwo;text:Account Two")	
			OryUIUpdateDialogButton(dialog[5], 3, "name:AccountThree;text:Account Three")	
			OryUIUpdateDialogButton(dialog[5], 4, "name:Cancel;text:Cancel")	
			OryUIShowDialog(dialog[5])
		endif
		
		if (OryUIGetButtonReleased(button[6]))
			OryUIUpdateDialog(dialog[6], "titleText:Flex width buttons;supportingText:Buttons on the same row with widths auto set to fill the full width of the dialog;showCheckbox:false;stackButtons:false;flexButtons:true;decisionRequired:true")
			OryUISetDialogButtonCount(dialog[6], 3)
			OryUIUpdateDialogButton(dialog[6], 1, "name:Button 1;text:Button 1")
			OryUIUpdateDialogButton(dialog[6], 2, "name:Button 2;text:Button 2")	
			OryUIUpdateDialogButton(dialog[6], 3, "name:Button 3;text:Button 3")
			OryUIShowDialog(dialog[6])
		endif
		
		if (OryUIGetButtonReleased(button[7]))
			OryUIUpdateDialog(dialog[7], "color:#d2e9fc;titleText:Styled dialog;titleTextColor:#1976d2;supportingText:Dialog text, background, and buttons can all be styled/coloured;supportingTextColor:#1976d2;showCheckbox:false;stackButtons:false;flexButtons:false;decisionRequired:true")
			OryUISetDialogButtonCount(dialog[7], 1)
			OryUIUpdateDialogButton(dialog[7], 1, "name:Ok;text:Ok;color:#d2e9fc;textColor:#1976d2")
			OryUIShowDialog(dialog[7])
		endif
		
		if (OryUIGetButtonReleased(button[8]))
			OryUIUpdateDialog(dialog[8], "image:" + str(dialogBackgroundImage) + ";titleText:Background image dialog;titleTextColor:#ffffff;supportingText:Dialogs can be given a background image to fit in style with your app/game." + chr(10) + chr(10) + "Background images may appear distorted due to the size of the dialog and its content;supportingTextColor:#ffffff;showCheckbox:false;stackButtons:false;flexButtons:true;decisionRequired:true")
			OryUISetDialogButtonCount(dialog[8], 1)
			OryUIUpdateDialogButton(dialog[8], 1, "name:Ok;text:Ok;color:#000000;alpha:50;textColor:#ffffff")
			OryUIShowDialog(dialog[8])
		endif
		
		for i = 1 to 8
			if (OryUIGetDialogButtonReleasedName(dialog[i]) <> "")
				OryUIUpdateTooltip(tooltip, "text:You chose '" + OryUIGetDialogButtonReleasedName(dialog[i]) + "'")
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
	DeleteImage(dialogBackgroundImage)
endfunction

function DialogScreenCodeTab()
	thisScreen as integer : thisScreen = constDialogScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]

	// Initiate Screen
	contentHeight# as float
	contentWidth# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUIDialog;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	txtCode as integer : txtCode = OryUICreateText("text:" + ReadCodeFile("DialogScreen.txt") + ";size:2;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
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
			ShareCode("DialogScreen.txt")
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