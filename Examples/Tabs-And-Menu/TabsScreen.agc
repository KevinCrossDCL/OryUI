
function TabsScreen(selectedTab as integer)
	SetViewOffset(0, 0)
	thisScreen as integer : thisScreen = constTabsScreen
	
	if (selectedTab = 0) then selectedTab = 1
	tabSelected[thisScreen] = selectedTab
	
	select tabSelected[thisScreen]
		case 1
			TabsScreenTab1()
		endcase
		case 2
			TabsScreenTab2()
		endcase
	endselect
endfunction

function TabsScreenTab1()
	thisScreen as integer : thisScreen = constTabsScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]
	
	// Initiate Screen
	contentHeight# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:Tabs;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Tab 1")
	OryUIInsertTabsButton(tabs, -1, "text:Tab 2")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	txtLoremIpsum as integer : txtLoremIpsum = OryUICreateText("text:" + OryUIWrapText("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque a vehicula ipsum. Donec non elit eget arcu lacinia euismod ac quis enim. Pellentesque tortor eros, lobortis id finibus vel, ullamcorper nec elit. Sed pellentesque ante ac ligula auctor aliquet. Maecenas eu ex tellus. Maecenas malesuada a nulla facilisis maximus. Sed vitae dolor nibh. Maecenas et tortor id metus maximus lacinia in a ante. Etiam id ultricies nisi, id pretium turpis. Lorem ipsum dolor sit amet, consectetur adipiscing elit." + chr(10) + chr(10) + "Pellentesque quam nibh, gravida ac pretium non, viverra a libero. Duis hendrerit ex velit, eget molestie purus faucibus at. Nam in orci ultricies, aliquam turpis eget, porttitor elit. Mauris accumsan finibus orci, vehicula rhoncus velit consequat ac. Quisque lobortis erat vel maximus commodo. Nullam tortor risus, dignissim ut sollicitudin et, scelerisque a ipsum. Etiam semper orci a consectetur maximus. Integer sodales vestibulum nunc. In sit amet aliquam enim." + chr(10) + chr(10) + "Nunc malesuada est in lobortis interdum. Nulla id accumsan arcu. Nulla aliquet neque eget diam ultricies sagittis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce dapibus mattis purus, eget lobortis quam convallis porttitor. Nulla facilisi. Vestibulum pellentesque, nunc at ultrices varius, nisi ex molestie erat, quis laoreet magna magna eget quam. Integer laoreet tortor ac neque tempus facilisis. Duis nibh tellus, molestie congue diam vitae, convallis consectetur ex. Ut fringilla blandit ex eget egestas. Vestibulum ultrices, ligula sagittis tincidunt tempor, eros tellus lobortis sapien, eget pulvinar massa mauris ac magna. Curabitur sit amet eleifend quam. Donec facilisis tempus viverra. Vivamus dapibus nulla metus, ac imperdiet nunc fringilla ut. Fusce eget interdum odio, a pretium mi." + chr(10) + chr(10) + "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam at tristique sapien. Integer ut erat finibus, ornare elit in, suscipit urna. Quisque ligula augue, hendrerit vitae ipsum nec, lobortis cursus mauris. Aliquam erat volutpat. Phasellus a mattis felis. Duis quis fermentum mi. Quisque ultrices arcu ac ipsum pellentesque, ullamcorper cursus ex posuere. Duis et enim suscipit, euismod purus et, sollicitudin enim. Suspendisse sed urna tortor. Quisque scelerisque, neque at suscipit sagittis, nisl tortor sodales massa, in auctor nunc orci ac nisi." + chr(10) + chr(10) + "Etiam neque lorem, sollicitudin sit amet dapibus sed, porta nec felis. Sed nec risus vitae mi bibendum tincidunt eget id sem. Praesent ac rhoncus velit. Curabitur feugiat interdum lacus, sed lobortis mauris semper nec. Morbi et mi risus. In venenatis mauris eu urna pharetra, ut mollis felis ornare. Aliquam rhoncus, enim non cursus porta, arcu mauris tempus risus, ac dignissim ante sem in libero. Morbi ut ante quis ante interdum condimentum at pretium sapien.", 2.5, 90) + ";size:2.5;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLoremIpsum)
	
	// Manage Screen
	do	
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

		OryUISync()
	loop
	
	// Delete all OryUI created components
	OryUIDeleteAllWidgets()
endfunction

function TabsScreenTab2()
	thisScreen as integer : thisScreen = constTabsScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]

	// Initiate Screen
	contentHeight# as float
	contentWidth# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:Tabs;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Tab 1")
	OryUIInsertTabsButton(tabs, -1, "text:Tab 2")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	txtLoremIpsum as integer : txtLoremIpsum = OryUICreateText("text:" + OryUIWrapText("Lorem ipsum dolor sit amet, consectetur adipiscing elit. In fermentum arcu nec posuere interdum. Cras metus orci, rhoncus non congue et, consectetur pretium libero. Maecenas vel odio et elit semper hendrerit. Ut cursus mauris turpis, ut fermentum justo ornare id. Nulla lobortis condimentum sem pharetra malesuada. Donec posuere enim vitae diam sagittis, at euismod libero vestibulum. Aenean ac sem hendrerit, malesuada lectus in, rutrum magna. Suspendisse odio est, fermentum vestibulum laoreet vel, vestibulum vel erat. Cras libero diam, feugiat quis ligula congue, cursus pulvinar turpis." + chr(10) + chr(10) + "Aenean orci mauris, venenatis eget tortor a, suscipit vehicula urna. Suspendisse a ligula ac eros accumsan vehicula et non nibh. Ut neque odio, eleifend a molestie eu, porta quis sapien. Nunc in lectus et est molestie condimentum. Donec in tortor eget tellus convallis commodo eget non est. Aliquam ligula justo, vulputate feugiat pharetra a, egestas quis velit. Praesent in consectetur metus. Donec facilisis lacus ut consequat dignissim. Cras elementum, erat finibus imperdiet tincidunt, enim libero egestas purus, sit amet sagittis elit tellus vel sem. Suspendisse ut congue ligula, ac accumsan ligula. Nam sagittis posuere orci, quis maximus nulla hendrerit et." + chr(10) + chr(10) + "Praesent vitae massa diam. Phasellus aliquam bibendum risus, nec luctus neque. Duis ipsum ligula, iaculis quis eleifend vitae, faucibus in nisi. Maecenas porta lacus non euismod tempor. Fusce vitae tempus urna. In hac habitasse platea dictumst. Aliquam consectetur lacus mauris, vitae malesuada mi convallis at. Suspendisse sit amet magna quis sapien sodales fringilla sit amet eget neque. Sed non sapien a neque fermentum porta. Nulla quis erat vitae purus mattis euismod. Nunc at elit sed dolor imperdiet porttitor. Integer congue faucibus euismod. Aliquam pretium vulputate tortor at dictum. Suspendisse potenti. Suspendisse quis sapien sed odio tempus hendrerit. Phasellus facilisis libero et tincidunt vulputate." + chr(10) + chr(10) + "Donec vulputate eu lorem non dapibus. Mauris at ante at lectus vestibulum venenatis. Curabitur elementum fringilla felis a sollicitudin. Integer vitae vulputate tortor. Nam dignissim dolor sed velit bibendum, in eleifend justo sodales. Phasellus aliquet imperdiet nulla, pharetra mattis magna hendrerit vitae. Aliquam vel laoreet nibh, eget vestibulum arcu. Curabitur nibh elit, malesuada ut arcu et, dapibus mollis nunc. Phasellus dapibus pulvinar risus, vel mattis lacus rhoncus a. Sed et mauris tristique, auctor neque auctor, finibus odio." + chr(10) + chr(10) + "Donec et dapibus quam, non luctus nisi. Nullam porta leo quam, at blandit quam ultrices a. In hac habitasse platea dictumst. Vivamus convallis magna nec odio congue blandit. Duis vitae egestas purus. Quisque lectus diam, tincidunt ac mi at, dictum cursus nisl. Aliquam fringilla auctor iaculis. Nam suscipit, nisl pellentesque elementum eleifend, mi sem sodales tellus, in ullamcorper nulla eros quis eros.", 2.5, 90) + ";size:2.5;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtLoremIpsum)
	
	// Manage Screen
	do
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
				
		OryUISync()
	loop
	
	// Delete all OryUI created components
	OryUIDeleteAllWidgets()
endfunction