/*
 * OryUI
 * 
 * OryUI is a UI framework to be used with AGK2 (AppGameKit)
 * 
 * 	Author	: Kevin Cross
 * 	License	: MIT
 */

foldstart // OryUI Main Types (Updated 24/03/2019)

type typeOryUIParameters
	activeColor# as float[4]				// OryUITabs
	alignment as integer 					// OryUIText
	angle# as float 						// OryUISprite, OryUIText
	attachToSpriteID as integer 			// OryUIFloatingActionButton
	autoHeight as integer					// OryUITextCard
	backgroundColor# as float[4]			// OryUIProfileImageScreen, OryUITextfield
	blockOrder$ as string[]					// OryUICard
	bold as integer							// OryUIText
	cancelText$ as string					// OryUIProfileImageScreen
	color# as float[4]						// OryUIButton, OryUIFloatingActionButton, OryUIList, OryUIMenu, OryUIProgressIndicator, OryUISprite, OryUITabs, OryUIText, OryUITextfield, OryUITopBar
	depth as integer						// OryUIButton, OryUIButtonGroup, OryUIFloatingActionButton, OryUIList, OryUIMenu, OryUIProgressIndicator, OryUISprite, OryUIText, OryUITopBar
	extended as integer						// OryUITopBar
	fixToscreen as integer					// OryUIButton, OryUIProgressIndicator, OryUISprite, OryUIText
	frameShape$ as String					// OryUIProfileImageScreen
	group as integer						// OryUISprite
	headerText$ as string					// OryUITextCard
	headerTextAlignment as integer			// OryUITextCard
	headerTextBold as integer				// OryUITextCard
	headerTextColor# as float[4]			// OryUITextCard
	headerTextSize# as float				// OryUITextCard
	icon$ as string 						// OryUIFloatingActionButton, OryUITopBar
	iconColor# as float[4]					// OryUIFloatingActionButton, OryUITopBar
	iconID as integer 						// OryUIFloatingActionButton, OryUITopBar
	imageID as integer						// OryUIButton, OryUIProfileImageScreen, OryUISprite, OryUITabs, OryUITopBar
	inactiveColor# as float[4]				// OryUITabs
	inputText$ as string					// OryUITextfield
	inputType$ as string					// OryUITextfield
	itemSize# as float[2]					// OryUIList, OryUIMenu
	labelText$ as string					// OryUITextfield
	leftIcon$ as string						// OryUIMenu
	leftIconID as integer					// OryUIMenu
	leftIconColor# as float[4]				// OryUIMenu
	leftLine1Text$ as string				// OryUIList
	leftLine1TextBold as integer			// OryUIList
	leftLine1TextColor# as float[4]			// OryUIList
	leftLine1TextSize# as float				// OryUIList
	leftLine2Text$ as string				// OryUIList
	leftLine2TextBold as integer			// OryUIList
	leftLine2TextColor# as float[4]			// OryUIList
	leftLine2TextSize# as float				// OryUIList
	leftThumbnailImageID as float			// OryUIList
	maxLength as integer					// OryUITextfield
	maxPosition# as float[2]				// OryUITabs
	maxZoom# as float						// OryUIProfileImageScreen
	mini as integer 						// OryUIFloatingActionButton
	minPosition# as float[2]				// OryUITabs
	name$ as String							// OryUIMenu
	navigationIcon$ as string 				// OryUITopBar
	noOfLeftLines as integer				// OryUIList
	noOfRightLines as integer				// OryUIList
	offset# as float[2]						// OryUIButton, OryUIButtonGroup, OryUIProgressIndicator, OryUISprite
	offsetCenter as integer					// OryUIButton, OryUIButtonGroup, OryUIProgressIndicator, OryUISprite
	placement$ as string					// OryUIFloatingActionButton
	position# as float[2]					// OryUIButton, OryUIButtonGroup, OryUIList, OryUIProfileImageScreen, OryUIProgressIndicator, OryUISprite, OryUITabs, OryUIText, OryUITextfield, OryUITopBar
	progressType$ as String					// OryUIProgressIndicator
	rightIcon$ as string					// OryUIList, OryUIMenu
	rightIconID as integer					// OryUIList, OryUIMenu
	rightIconColor# as float[4]				// OryUIList, OryUIMenu
	rightLine1Text$ as string				// OryUIList
	rightLine1TextBold as integer			// OryUIList
	rightLine1TextColor# as float[4]		// OryUIList
	rightLine1TextSize# as float			// OryUIList
	rightLine2Text$ as string				// OryUIList
	rightLine2TextBold as integer			// OryUIList
	rightLine2TextColor# as float[4]		// OryUIList
	rightLine2TextSize# as float			// OryUIList
	saveText$ as string						// OryUIProfileImageScreen
	scrollable as integer					// OryUITabs
	selected as integer						// OryUIButtonGroup
	selectedColor# as float[4]				// OryUIButtonGroup
	selectedTextBold as integer				// OryUIButtonGroup
	selectedTextColor# as float[4]			// OryUIButtonGroup
	selectedTextSize# as float				// OryUIButtonGroup
	shadow as integer						// OryUIFloatingActionButton
	showLeftIcon as integer					// OryUIMenu
	showLeftThumbnail as integer			// OryUIList
	showRightIcon as integer				// OryUIList, OryUIMenu
	size# as float[2]						// OryUIButton, OryUIButtonGroup, OryUIList, OryUIProgressIndicator, OryUISprite, OryUITabs, OryUIText, OryUITextfield
	spriteShader as integer					// OryUISprite
	strokeColor# as float[4]				// OryUITextfield
	supportingText$ as string				// OryUITextCard
	supportingTextAlignment as integer		// OryUITextCard
	supportingTextBold as integer			// OryUITextCard
	supportingTextColor# as float[4]		// OryUITextCard
	supportingTextSize# as float			// OryUITextCard
	text$ as string							// OryUIButton, OryUIButtonGroup, OryUIMenu, OryUIText, OryUITopBar
	textAlignment as integer				// OryUIButton, OryUIMenu, OryUITopBar
	textBold as integer						// OryUIButton, OryUIButtonGroup, OryUIMenu, OryUITopBar
	textColor# as float[4]					// OryUIButton, OryUIButtonGroup, OryUIMenu, OryUITopBar
	textSize# as float						// OryUIButton, OryUIButtonGroup, OryUIMenu
	unselectedColor# as float[4]			// OryUIButtonGroup
	unselectedTextBold as integer			// OryUIButtonGroup
	unselectedTextColor# as float[4]		// OryUIButtonGroup
	unselectedTextSize# as float			// OryUIButtonGroup
endtype

foldend


foldstart // OryUI Main Global Variables (Updated 22/02/2019)

global oryUIBottomBannerAdOnScreen as integer
global oryUIContentHeight# as float 			// NOT YET USED
global oryUIContentStartX# as float				// NOT YET USED
global oryUIContentStartY# as float				// NOT YET USED
global oryUIContentWidth# as float				// NOT YET USED
global OryUIParameters as typeOryUIParameters
global OryUIStatusBarHeight# as float : OryUIStatusBarHeight# = 3.6

foldend


foldstart // OryUI Main Functions (Updated 22/02/2019)

function OryUIAddToContentHeight(oryUIHeight# as float)
	oryUIContentHeight# = oryUIContentHeight# + oryUIHeight#
endfunction

function OryUIResetParametersType()
	OryUIParameters.alignment = -999999
	OryUIParameters.angle# = -999999
	OryUIParameters.attachToSpriteID = -999999
	OryUIParameters.autoHeight = -999999
	OryUIParameters.blockOrder$.length = -1
	OryUIParameters.bold = -999999
	OryUIParameters.cancelText$ = ""
	OryUIParameters.depth = -999999
	OryUIParameters.extended = -999999
	OryUIParameters.fixToscreen = -999999
	OryUIParameters.frameShape$ = ""
	OryUIParameters.group = -999999
	OryUIParameters.headerText$ = ""
	OryUIParameters.headerTextAlignment = -999999
	OryUIParameters.headerTextBold = -999999
	OryUIParameters.headerTextSize# = -999999
	OryUIParameters.icon$ = ""
	OryUIParameters.iconID = -999999
	OryUIParameters.imageID = -999999
	OryUIParameters.inputText$ = ""
	OryUIParameters.inputType$ = ""
	OryUIParameters.labelText$ = ""
	OryUIParameters.leftIcon$ = ""
	OryUIParameters.leftIconID = -999999
	OryUIParameters.leftLine1Text$ = ""
	OryUIParameters.leftLine1TextBold = -999999
	OryUIParameters.leftLine1TextSize# = -999999
	OryUIParameters.leftLine2Text$ = ""
	OryUIParameters.leftLine2TextBold = -999999
	OryUIParameters.leftLine2TextSize# = -999999
	OryUIParameters.leftThumbnailImageID = -999999
	OryUIParameters.maxLength = -999999
	OryUIParameters.maxZoom# = -999999
	OryUIParameters.mini = -999999
	OryUIParameters.name$ = ""
	OryUIParameters.navigationIcon$ = ""
	OryUIParameters.noOfLeftLines = -999999
	OryUIParameters.noOfRightLines = -999999
	OryUIParameters.offsetCenter = -999999
	OryUIParameters.placement$ = ""
	OryUIParameters.progressType$ = ""
	OryUIParameters.rightIcon$ = ""
	OryUIParameters.rightIconID = -999999
	OryUIParameters.rightLine1Text$ = ""
	OryUIParameters.rightLine1TextBold = -999999
	OryUIParameters.rightLine1TextSize# = -999999
	OryUIParameters.rightLine2Text$ = ""
	OryUIParameters.rightLine2TextBold = -999999
	OryUIParameters.rightLine2TextSize# = -999999
	OryUIParameters.saveText$ = ""
	OryUIParameters.scrollable = -999999
	OryUIParameters.selected = -999999
	OryUIParameters.selectedTextBold = -999999
	OryUIParameters.selectedTextSize# = -999999	
	OryUIParameters.shadow = -999999
	OryUIParameters.showLeftIcon = -999999
	OryUIParameters.showLeftThumbnail = -999999
	OryUIParameters.showRightIcon = -999999
	OryUIParameters.spriteShader = -999999
	OryUIParameters.supportingText$ = ""
	OryUIParameters.supportingTextAlignment = -999999
	OryUIParameters.supportingTextBold = -999999
	OryUIParameters.supportingTextSize# = -999999
	OryUIParameters.text$ = ""
	OryUIParameters.textAlignment = -999999
	OryUIParameters.textBold = -999999
	OryUIParameters.textSize# = -999999
	OryUIParameters.unselectedTextBold = -999999
	OryUIParameters.unselectedTextSize# = -999999	
	for i = 1 to 4
		if (i < 3)
			OryUIParameters.itemSize#[i] = -999999
			OryUIParameters.maxPosition#[i] = -999999
			OryUIParameters.minPosition#[i] = -999999
			OryUIParameters.offset#[i] = -999999
			OryUIParameters.position#[i] = -999999
			OryUIParameters.size#[i] = -999999
		endif
		OryUIParameters.activeColor#[i] = -999999
		OryUIParameters.backgroundColor#[i] = -999999
		OryUIParameters.color#[i] = -999999
		OryUIParameters.headerTextColor#[i] = -999999
		OryUIParameters.iconColor#[i] = -999999
		OryUIParameters.inactiveColor#[i] = -999999
		OryUIParameters.leftIconColor#[i] = -999999
		OryUIParameters.leftLine1TextColor#[i] = -999999
		OryUIParameters.leftLine2TextColor#[i] = -999999
		OryUIParameters.rightIconColor#[i] = -999999
		OryUIParameters.rightLine1TextColor#[i] = -999999
		OryUIParameters.rightLine2TextColor#[i] = -999999
		OryUIParameters.selectedColor#[i] = -999999
		OryUIParameters.selectedTextColor#[i] = -999999
		OryUIParameters.strokeColor#[i] = -999999
		OryUIParameters.supportingTextColor#[i] = -999999
		OryUIParameters.textColor#[i] = -999999
		OryUIParameters.unselectedColor#[i] = -999999
		OryUIParameters.unselectedTextColor#[i] = -999999
	next
endfunction

function OryUISetContentHeight(oryUIHeight# as float)
	oryUIContentHeight# = oryUIHeight#
endfunction

function OryUISetContentStartPosition(oryUIStartX# as float, oryUIStartY# as float)
	oryUIContentStartX# = oryUIStartX#
	oryUIContentStartY# = oryUIStartY#
endfunction

function OryUISetParametersType(oryUIComponentParameters$ as string)
	OryUIResetParametersType()
	
	local oryUIForI as integer
	local oryUIForJ as integer
	local oryUIComponentParameter$ as string
	local oryUIValue$ as string
	local oryUIVariable$ as string
	for oryUIForI = 1 to CountStringTokens(oryUIComponentParameters$, ";")
		oryUIComponentParameter$ = GetStringToken(oryUIComponentParameters$, ";", oryUIForI)
		oryUIVariable$ = lower(TrimString(GetStringToken(oryUIComponentParameter$, ":", 1), " "))
		oryUIValue$ = GetStringToken(oryUIComponentParameter$, ":", 2)
		oryUIValue$ = ReplaceString(oryUIValue$, "[colon]", ":", -1)
		if (oryUIVariable$ = "activecolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				OryUIParameters.activeColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.activeColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				OryUIParameters.activeColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				OryUIParameters.activeColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "activecolorid")
			oryUIActiveColorID = val(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.activeColor#[1] = GetColorRed(oryUIActiveColorID)
			OryUIParameters.activeColor#[2] = GetColorGreen(oryUIActiveColorID)
			OryUIParameters.activeColor#[3] = GetColorBlue(oryUIActiveColorID)
			OryUIParameters.activeColor#[4] = 255
		elseif (oryUIVariable$ = "alignment")
			if (oryUIValue$ = "left")
				OryUIParameters.alignment = 0
			elseif (oryUIValue$ = "center" or oryUIValue$ = "centre")
				OryUIParameters.alignment = 1
			elseif (oryUIValue$ = "right")
				OryUIParameters.alignment = 2
			endif
		elseif (oryUIVariable$ = "alpha")
			OryUIParameters.color#[4] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "angle")
			OryUIParameters.angle# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "attachtospriteid")
			OryUIParameters.attachToSpriteID = val(oryUIValue$)
		elseif (oryUIVariable$ = "autoheight")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.autoHeight = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.autoHeight = 0
			endif
		elseif (oryUIVariable$ = "backgroundcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				OryUIParameters.backgroundColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.backgroundColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				OryUIParameters.backgroundColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				OryUIParameters.backgroundColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "backgroundcolorid")
			oryUIBackgroundColorID = val(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.backgroundColor#[1] = GetColorRed(oryUIBackgroundColorID)
			OryUIParameters.backgroundColor#[2] = GetColorGreen(oryUIBackgroundColorID)
			OryUIParameters.backgroundColor#[3] = GetColorBlue(oryUIBackgroundColorID)
			OryUIParameters.backgroundColor#[4] = 255
		elseif (OryUIVariable$ = "blockorder")
			for oryUIForJ = 1 to CountStringTokens(oryUIValue$, ",")
				OryUIParameters.blockOrder$.insert(GetStringToken(oryUIComponentParameters$, ",", oryUIForJ))
			next
		elseif (oryUIVariable$ = "bold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.bold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.bold = 0
			endif
		elseif (oryUIVariable$ = "canceltext")
			OryUIParameters.cancelText$ = oryUIValue$
		elseif (oryUIVariable$ = "color")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				OryUIParameters.color#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.color#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				OryUIParameters.color#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				OryUIParameters.color#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "colorid")
			oryUIColorID = val(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.color#[1] = GetColorRed(oryUIColorID)
			OryUIParameters.color#[2] = GetColorGreen(oryUIColorID)
			OryUIParameters.color#[3] = GetColorBlue(oryUIColorID)
			OryUIParameters.color#[4] = 255
		elseif (oryUIVariable$ = "depth")
			OryUIParameters.depth = val(oryUIValue$)
		elseif (oryUIVariable$ = "extended")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.extended = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.extended = 0
			endif
		elseif (oryUIVariable$ = "fixtoscreen")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.fixToScreen = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.fixToScreen = 0
			endif
		elseif (oryUIVariable$ = "frameshape")
			OryUIParameters.frameShape$ = oryUIValue$
		elseif (oryUIVariable$ = "group")
			OryUIParameters.group = val(oryUIValue$)
		elseif (oryUIVariable$ = "headertext")
			OryUIParameters.headerText$ = oryUIValue$
		elseif (oryUIVariable$ = "headertextalignment")
			if (oryUIValue$ = "left")
				OryUIParameters.headerTextAlignment = 0
			elseif (oryUIValue$ = "center" or oryUIValue$ = "centre")
				OryUIParameters.headerTextAlignment = 1
			elseif (oryUIValue$ = "right")
				OryUIParameters.headerTextAlignment = 2
			endif
		elseif (oryUIVariable$ = "headertextbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.headerTextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.headerTextBold = 0
			endif
		elseif (oryUIVariable$ = "headertextcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				OryUIParameters.headerTextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.headerTextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				OryUIParameters.headerTextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				OryUIParameters.headerTextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "headertextcolorid")
			oryUIHeaderTextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.headerTextColor#[1] = GetColorRed(oryUIHeaderTextColorID)
			OryUIParameters.headerTextColor#[2] = GetColorGreen(oryUIHeaderTextColorID)
			OryUIParameters.headerTextColor#[3] = GetColorBlue(oryUIHeaderTextColorID)
			OryUIParameters.headerTextColor#[4] = 255
		elseif (oryUIVariable$ = "headertextsize")
			OryUIParameters.headerTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "height")
			OryUIParameters.size#[2] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "icon")
			OryUIParameters.icon$ = oryUIValue$
		elseif (oryUIVariable$ = "iconcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				OryUIParameters.iconColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.iconColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				OryUIParameters.iconColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				OryUIParameters.iconColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "iconcolorid")
			oryUIIconColorID = val(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.iconColor#[1] = GetColorRed(oryUIIconColorID)
			OryUIParameters.iconColor#[2] = GetColorGreen(oryUIIconColorID)
			OryUIParameters.iconColor#[3] = GetColorBlue(oryUIIconColorID)
			OryUIParameters.iconColor#[4] = 255
		elseif (oryUIVariable$ = "iconid")
			OryUIParameters.iconID = val(oryUIValue$)
		elseif (oryUIVariable$ = "image")
			OryUIParameters.imageID = val(oryUIValue$)
		elseif (oryUIVariable$ = "inactivecolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				OryUIParameters.inactiveColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.inactiveColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				OryUIParameters.inactiveColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				OryUIParameters.inactiveColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "inactivecolorid")
			oryUIInactiveColorID = val(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.inactiveColor#[1] = GetColorRed(oryUIInactiveColorID)
			OryUIParameters.inactiveColor#[2] = GetColorGreen(oryUIInactiveColorID)
			OryUIParameters.inactiveColor#[3] = GetColorBlue(oryUIInactiveColorID)
			OryUIParameters.inactiveColor#[4] = 255
		elseif (oryUIVariable$ = "inputtext")
			OryUIParameters.inputText$ = oryUIValue$
		elseif (oryUIVariable$ = "inputtype")
			OryUIParameters.inputType$ = oryUIValue$
		elseif (oryUIVariable$ = "itemheight")
			OryUIParameters.itemSize#[2] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "itemsize")
			OryUIParameters.itemSize#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.itemSize#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "itemwidth")
			OryUIParameters.itemSize#[1] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "labeltext")
			OryUIParameters.labelText$ = oryUIValue$
		elseif (oryUIVariable$ = "lefticon")
			OryUIParameters.leftIcon$ = oryUIValue$
		elseif (oryUIVariable$ = "lefticoncolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				OryUIParameters.leftIconColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.leftIconColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				OryUIParameters.leftIconColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				OryUIParameters.leftIconColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "lefticoncolorid")
			oryUILeftIconColorID = val(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.leftIconColor#[1] = GetColorRed(oryUILeftIconColorID)
			OryUIParameters.leftIconColor#[2] = GetColorGreen(oryUILeftIconColorID)
			OryUIParameters.leftIconColor#[3] = GetColorBlue(oryUILeftIconColorID)
			OryUIParameters.leftIconColor#[4] = 255
		elseif (oryUIVariable$ = "lefticonid")
			OryUIParameters.leftIconID = val(oryUIValue$)
		elseif (oryUIVariable$ = "leftline1text")
			OryUIParameters.leftLine1Text$ = oryUIValue$
		elseif (oryUIVariable$ = "leftline1textbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.leftLine1TextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.leftLine1TextBold = 0
			endif
		elseif (oryUIVariable$ = "leftline1textcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				OryUIParameters.leftLine1TextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.leftLine1TextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				OryUIParameters.leftLine1TextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				OryUIParameters.leftLine1TextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "leftline1textcolorid")
			oryUILeftLine1TextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.leftLine1TextColor#[1] = GetColorRed(oryUILeftLine1TextColorID)
			OryUIParameters.leftLine1TextColor#[2] = GetColorGreen(oryUILeftLine1TextColorID)
			OryUIParameters.leftLine1TextColor#[3] = GetColorBlue(oryUILeftLine1TextColorID)
			OryUIParameters.leftLine1TextColor#[4] = 255
		elseif (oryUIVariable$ = "leftline1textsize")
			OryUIParameters.leftLine1TextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "leftline2text")
			OryUIParameters.leftLine2Text$ = oryUIValue$
		elseif (oryUIVariable$ = "leftline2textbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.leftLine2TextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.leftLine2TextBold = 0
			endif
		elseif (oryUIVariable$ = "leftline2textcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				OryUIParameters.leftLine2TextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.leftLine2TextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				OryUIParameters.leftLine2TextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				OryUIParameters.leftLine2TextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "leftline2textcolorid")
			oryUILeftLine2TextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.leftLine2TextColor#[1] = GetColorRed(oryUILeftLine2TextColorID)
			OryUIParameters.leftLine2TextColor#[2] = GetColorGreen(oryUILeftLine2TextColorID)
			OryUIParameters.leftLine2TextColor#[3] = GetColorBlue(oryUILeftLine2TextColorID)
			OryUIParameters.leftLine2TextColor#[4] = 255
		elseif (oryUIVariable$ = "leftline2textsize")
			OryUIParameters.leftLine2TextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "leftthumbnailimage")
			OryUIParameters.leftThumbnailImageID = val(oryUIValue$)
		elseif (oryUIVariable$ = "maxposition")
			OryUIParameters.maxPosition#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.maxPosition#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "maxx")
			OryUIParameters.maxPosition#[1] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "maxy")
			OryUIParameters.maxPosition#[2] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "maxzoom")
			OryUIParameters.maxZoom# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "mini")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.mini = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.mini = 0
			endif
		elseif (oryUIVariable$ = "minposition")
			OryUIParameters.minPosition#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.minPosition#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "minx")
			OryUIParameters.minPosition#[1] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "miny")
			OryUIParameters.minPosition#[2] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "name")
			OryUIParameters.name$ = oryUIValue$
		elseif (oryUIVariable$ = "navigationicon")
			OryUIParameters.navigationIcon$ = oryUIValue$
		elseif (oryUIVariable$ = "noofleftlines")
			OryUIParameters.noOfLeftLines = val(oryUIValue$)
		elseif (oryUIVariable$ = "noofrightlines")
			OryUIParameters.noOfRightLines = val(oryUIValue$)	
		elseif (oryUIVariable$ = "offset")
			if (oryUIValue$ = "center" or oryUIValue$ = "centre")
				OryUIParameters.offsetCenter = 1
			else
				OryUIParameters.offset#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.offset#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
			endif
		elseif (oryUIVariable$ = "placement")
			OryUIParameters.placement$ = oryUIValue$
		elseif (oryUIVariable$ = "position")
			OryUIParameters.position#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.position#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "progresstype")
			OryUIParameters.progressType$ = oryUIValue$
		elseif (oryUIVariable$ = "righticon")
			OryUIParameters.rightIcon$ = oryUIValue$
		elseif (oryUIVariable$ = "righticoncolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				OryUIParameters.rightIconColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.rightIconColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				OryUIParameters.rightIconColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				OryUIParameters.rightIconColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "righticoncolorid")
			oryUIRightIconColorID = val(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.rightIconColor#[1] = GetColorRed(oryUIRightIconColorID)
			OryUIParameters.rightIconColor#[2] = GetColorGreen(oryUIRightIconColorID)
			OryUIParameters.rightIconColor#[3] = GetColorBlue(oryUIRightIconColorID)
			OryUIParameters.rightIconColor#[4] = 255
		elseif (oryUIVariable$ = "righticonid")
			OryUIParameters.rightIconID = val(oryUIValue$)
		elseif (oryUIVariable$ = "rightline1text")
			OryUIParameters.rightLine1Text$ = oryUIValue$
		elseif (oryUIVariable$ = "rightline1textbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.rightLine1TextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.rightLine1TextBold = 0
			endif
		elseif (oryUIVariable$ = "rightline1textcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				OryUIParameters.rightLine1TextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.rightLine1TextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				OryUIParameters.rightLine1TextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				OryUIParameters.rightLine1TextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "rightline1textcolorid")
			oryUIRightLine1TextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.rightLine1TextColor#[1] = GetColorRed(oryUIRightLine1TextColorID)
			OryUIParameters.rightLine1TextColor#[2] = GetColorGreen(oryUIRightLine1TextColorID)
			OryUIParameters.rightLine1TextColor#[3] = GetColorBlue(oryUIRightLine1TextColorID)
			OryUIParameters.rightLine1TextColor#[4] = 255
		elseif (oryUIVariable$ = "rightline1textsize")
			OryUIParameters.rightLine1TextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "rightline2text")
			OryUIParameters.rightLine2Text$ = oryUIValue$
		elseif (oryUIVariable$ = "rightline2textbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.rightLine2TextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.rightLine2TextBold = 0
			endif
		elseif (oryUIVariable$ = "rightline2textcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				OryUIParameters.rightLine2TextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.rightLine2TextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				OryUIParameters.rightLine2TextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				OryUIParameters.rightLine2TextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "rightline2textcolorid")
			oryUIRightLine2TextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.rightLine2TextColor#[1] = GetColorRed(oryUIRightLine2TextColorID)
			OryUIParameters.rightLine2TextColor#[2] = GetColorGreen(oryUIRightLine2TextColorID)
			OryUIParameters.rightLine2TextColor#[3] = GetColorBlue(oryUIRightLine2TextColorID)
			OryUIParameters.rightLine2TextColor#[4] = 255
		elseif (oryUIVariable$ = "rightline2textsize")
			OryUIParameters.rightLine2TextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "savetext")
			OryUIParameters.saveText$ = oryUIValue$
		elseif (oryUIVariable$ = "scrollable")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.scrollable = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.scrollable = 0
			endif
		elseif (oryUIVariable$ = "selected")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.selected = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.selected = 0
			endif
		elseif (oryUIVariable$ = "selectedcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				OryUIParameters.selectedColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.selectedColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				OryUIParameters.selectedColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				OryUIParameters.selectedColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "selectedcolorid")
			oryUISelectedColorID = val(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.selectedColor#[1] = GetColorRed(oryUISelectedColorID)
			OryUIParameters.selectedColor#[2] = GetColorGreen(oryUISelectedColorID)
			OryUIParameters.selectedColor#[3] = GetColorBlue(oryUISelectedColorID)
			OryUIParameters.selectedColor#[4] = 255
		elseif (oryUIVariable$ = "selectedtextbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.selectedTextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.selectedTextBold = 0
			endif
		elseif (oryUIVariable$ = "selectedtextcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				OryUIParameters.selectedTextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.selectedTextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				OryUIParameters.selectedTextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				OryUIParameters.selectedTextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "selectedtextcolorid")
			oryUISelectedTextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.selectedTextColor#[1] = GetColorRed(oryUISelectedTextColorID)
			OryUIParameters.selectedTextColor#[2] = GetColorGreen(oryUISelectedTextColorID)
			OryUIParameters.selectedTextColor#[3] = GetColorBlue(oryUISelectedTextColorID)
			OryUIParameters.selectedTextColor#[4] = 255
		elseif (oryUIVariable$ = "selectedtextsize")
			OryUIParameters.selectedTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "shadow")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.shadow = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.shadow = 0
			endif
		elseif (oryUIVariable$ = "showlefticon")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.showLeftIcon = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.showLeftIcon = 0
			endif
		elseif (oryUIVariable$ = "showleftthumbnail")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.showLeftThumbnail = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.showLeftThumbnail = 0
			endif
		elseif (oryUIVariable$ = "showrighticon")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.showRightIcon = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.showRightIcon = 0
			endif
		elseif (oryUIVariable$ = "size")
			OryUIParameters.size#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.size#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "spriteshader")
			OryUIParameters.spriteShader = val(oryUIValue$)
		elseif (oryUIVariable$ = "string")
			OryUIParameters.text$ = oryUIValue$
		elseif (oryUIVariable$ = "strokecolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				OryUIParameters.strokeColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.strokeColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				OryUIParameters.strokeColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				OryUIParameters.strokeColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "strokecolorid")
			oryUIStrokeColorID = val(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.strokeColor#[1] = GetColorRed(oryUIStrokeColorID)
			OryUIParameters.strokeColor#[2] = GetColorGreen(oryUIStrokeColorID)
			OryUIParameters.strokeColor#[3] = GetColorBlue(oryUIStrokeColorID)
			OryUIParameters.strokeColor#[4] = 255
		elseif (oryUIVariable$ = "supportingtext")
			OryUIParameters.supportingText$ = oryUIValue$
		elseif (oryUIVariable$ = "supportingtextalignment")
			if (oryUIValue$ = "left")
				OryUIParameters.supportingTextAlignment = 0
			elseif (oryUIValue$ = "center" or oryUIValue$ = "centre")
				OryUIParameters.supportingTextAlignment = 1
			elseif (oryUIValue$ = "right")
				OryUIParameters.supportingTextAlignment = 2
			endif
		elseif (oryUIVariable$ = "supportingtextbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.supportingTextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.supportingTextBold = 0
			endif
		elseif (oryUIVariable$ = "supportingtextcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				OryUIParameters.supportingTextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.supportingTextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				OryUIParameters.supportingTextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				OryUIParameters.supportingTextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "supportingtextcolorid")
			oryUISupportingTextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.supportingTextColor#[1] = GetColorRed(oryUISupportingTextColorID)
			OryUIParameters.supportingTextColor#[2] = GetColorGreen(oryUISupportingTextColorID)
			OryUIParameters.supportingTextColor#[3] = GetColorBlue(oryUISupportingTextColorID)
			OryUIParameters.supportingTextColor#[4] = 255
		elseif (oryUIVariable$ = "supportingtextsize")
			OryUIParameters.supportingTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "text")
			OryUIParameters.text$ = oryUIValue$
		elseif (oryUIVariable$ = "textalignment")
			if (oryUIValue$ = "left")
				OryUIParameters.textAlignment = 0
			elseif (oryUIValue$ = "center" or oryUIValue$ = "centre")
				OryUIParameters.textAlignment = 1
			elseif (oryUIValue$ = "right")
				OryUIParameters.textAlignment = 2
			endif
		elseif (oryUIVariable$ = "textbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.textBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.textBold = 0
			endif
		elseif (oryUIVariable$ = "textcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				OryUIParameters.textColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.textColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				OryUIParameters.textColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				OryUIParameters.textColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "textcolorid")
			oryUITextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.textColor#[1] = GetColorRed(oryUITextColorID)
			OryUIParameters.textColor#[2] = GetColorGreen(oryUITextColorID)
			OryUIParameters.textColor#[3] = GetColorBlue(oryUITextColorID)
			OryUIParameters.textColor#[4] = 255
		elseif (oryUIVariable$ = "textsize")
			OryUIParameters.textSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "unselectedcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				OryUIParameters.unselectedColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.unselectedColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				OryUIParameters.unselectedColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				OryUIParameters.unselectedColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "unselectedcolorid")
			oryUIUnselectedColorID = val(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.unselectedColor#[1] = GetColorRed(oryUIUnselectedColorID)
			OryUIParameters.unselectedColor#[2] = GetColorGreen(oryUIUnselectedColorID)
			OryUIParameters.unselectedColor#[3] = GetColorBlue(oryUIUnselectedColorID)
			OryUIParameters.unselectedColor#[4] = 255
		elseif (oryUIVariable$ = "unselectedtextbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				OryUIParameters.unselectedTextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				OryUIParameters.unselectedTextBold = 0
			endif
		elseif (oryUIVariable$ = "unselectedtextcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				OryUIParameters.unselectedTextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				OryUIParameters.unselectedTextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				OryUIParameters.unselectedTextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				OryUIParameters.unselectedTextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "unselectedtextcolorid")
			oryUIUnselectedTextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			OryUIParameters.unselectedTextColor#[1] = GetColorRed(oryUIUnselectedTextColorID)
			OryUIParameters.unselectedTextColor#[2] = GetColorGreen(oryUIUnselectedTextColorID)
			OryUIParameters.unselectedTextColor#[3] = GetColorBlue(oryUIUnselectedTextColorID)
			OryUIParameters.unselectedTextColor#[4] = 255
		elseif (oryUIVariable$ = "selectedtextsize")
			OryUIParameters.unselectedTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "width")
			OryUIParameters.size#[1] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "x")
			OryUIParameters.position#[1] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "y")
			OryUIParameters.position#[2] = valFloat(oryUIValue$)
		endif
	next	
endfunction

foldend
