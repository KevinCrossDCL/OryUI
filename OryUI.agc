/*
 * OryUI
 * 
 * OryUI is a UI framework to be used with AGK2 (AppGameKit)
 * 
 * 	Author	: Kevin Cross
 * 	License	: MIT
 */
 
// OryUI

foldstart

type typeOryUICreatedWidgets
	id as integer
	type$ as string
endtype

type typeOryUIDefaults

	// OryUIButton
	buttonDisabledColor# as float[4]
	buttonDisabledIconColor# as float[4]
	buttonDisabledIconPlacement$ as string
	buttonDisabledIconSize# as float[2]
	buttonDisabledTextAlignment as integer
	buttonDisabledTextBold as integer
	buttonDisabledTextColor# as float[4]
	buttonDisabledTextSize# as float
	buttonEnabledColor# as float[4]
	buttonEnabledIconColor# as float[4]
	buttonEnabledIconPlacement$ as string
	buttonEnabledIconSize# as float[2]
	buttonEnabledTextAlignment as integer
	buttonEnabledTextBold as integer
	buttonEnabledTextColor# as float[4]
	buttonEnabledTextSize# as float
	buttonSize# as float[2]

	// OryUICheckbox
	checkboxCheckedColor# as float[4]
	checkboxCheckedImage as integer
	checkboxDepth as integer
	checkboxSize# as float[2]
	checkboxUncheckedColor# as float[4]
	checkboxUncheckedImage as integer

	// OryUIDialog
	dialogAutoHeight as integer
	dialogBottomMargin# as float
	dialogButtonColor# as float[4]
	dialogButtonHeight# as float
	dialogButtonTextBold as integer
	dialogButtonTextColor# as float[4]
	dialogButtonTextSize# as float
	dialogButtonXSpacing# as float
	dialogButtonYSpacing# as float
	dialogCheckboxAlignment as integer
	dialogCheckboxCheckedImage as integer
	dialogCheckboxColor# as float[4]
	dialogCheckboxHeight# as float
	dialogCheckboxTextBold as integer
	dialogCheckboxTextColor# as float[4]
	dialogCheckboxTextSize# as float
	dialogCheckboxUncheckedImage as integer
	dialogCheckboxWidth# as float
	dialogColor# as float[4]
	dialogDepth as integer
	dialogFlexButtons as integer
	dialogHeight# as float
	dialogLeftMargin# as float
	dialogRightMargin# as float
	dialogScrimColor# as float[4]
	dialogSpacingBetweenSupportingTextAndButtons# as float
	dialogSpacingBetweenTitleAndSupportingText# as float
	dialogStackButtons as integer
	dialogSupportingTextAlignment as integer
	dialogSupportingTextColor# as float[4]
	dialogSupportingTextSize# as float
	dialogTitleTextAlignment as integer
	dialogTitleTextColor# as float[4]
	dialogTitleTextSize# as float
	dialogTopMargin# as float
	dialogWidth# as float

	// OryUIFloatingActionButton
	floatingActionButtonColor# as float[4]
	floatingActionButtonDepth as integer
	floatingActionButtonIcon as integer
	floatingActionButtonIconColor# as float[4]
	floatingActionButtonIconSize# as float[2]
	floatingActionButtonMini as integer
	floatingActionButtonPlacement$ as string
	floatingActionButtonShadow as integer
	floatingActionButtonSize# as float[2]

	// OryUIInputSpinner
	inputSpinnerAutoCorrectIfOutOfRange as integer
	inputSpinnerBackgroundColor# as float[4]
	inputSpinnerButtonActiveColor# as float[4]
	inputSpinnerButtonActiveIconColor# as float[4]
	inputSpinnerButtonColor# as float[4]
	inputSpinnerButtonHeight# as float
	inputSpinnerButtonIconHeight# as float
	inputSpinnerButtonIconWidth# as float
	inputSpinnerButtonInactiveColor# as float[4]
	inputSpinnerButtonInactiveIconColor# as float[4]
	inputSpinnerButtonWidth# as float
	inputSpinnerHeight# as float
	inputSpinnerTextColor# as float[4]
	inputSpinnerTextSize# as float
	inputSpinnerWidth# as float

	// OryUIMenu
	menuColor# as float[4]
	menuDepth as integer
	menuDividerColor# as float[4]
	menuDividerHeight# as float
	menuItemHeight# as float
	menuItemLeftIconColor# as float[4]
	menuItemLeftIconHeight# as float
	menuItemLeftIconLeftPadding# as float
	menuItemRightIconColor# as float[4]
	menuItemRightIconHeight# as float
	menuItemRightIconRightPadding# as float
	menuItemTextBold as integer
	menuItemTextColor# as float[4]
	menuItemTextPadding# as float
	menuItemTextSize# as float
	menuScrimColor# as float[4]
	menuShowLeftIcon as integer
	menuShowRightIcon as integer
	menuWidth# as float
	
	// OryUINavigationDrawer
	navigationDrawerColor# as float[4]
	navigationDrawerDepth as integer
	navigationDrawerDividerColor# as float[4]
	navigationDrawerDividerHeight# as float
	navigationDrawerHeaderBackroundImage as integer
	navigationDrawerHeaderColor# as float[4]
	navigationDrawerHeaderHeight# as float
	navigationDrawerHeaderTextBold as integer
	navigationDrawerHeaderTextColor# as float[4]
	navigationDrawerHeaderTextLeftPadding# as float
	navigationDrawerHeaderTextScrimColor# as float[4]
	navigationDrawerHeaderTextScrimHeight# as float
	navigationDrawerHeaderTextSize# as float
	navigationDrawerLocation$ as string
	navigationDrawerOptionActiveOverlayColor# as float[4]
	navigationDrawerOptionActiveOverlayHeight# as float
	navigationDrawerOptionColor# as float[4]
	navigationDrawerOptionHeight# as float
	navigationDrawerOptionIconColor# as float[4]
	navigationDrawerOptionIconHeight# as float
	navigationDrawerOptionIconLeftPadding# as float
	navigationDrawerOptionRightTextBold as integer
	navigationDrawerOptionRightTextColor# as float[4]
	navigationDrawerOptionRightTextRightPadding# as float
	navigationDrawerOptionRightTextSize# as float
	navigationDrawerOptionTextBold as integer
	navigationDrawerOptionTextColor# as float[4]
	navigationDrawerOptionTextLeftPadding# as float
	navigationDrawerOptionTextSize# as float
	navigationDrawerScrimColor# as float[4]
	navigationDrawerShowOptionIcon as integer
	navigationDrawerShowOptionRightText as integer
	navigationDrawerShowShadow as integer
	navigationDrawerStatusBarColor# as float[4]
	navigationDrawerSubtitleColor# as float[4]
	navigationDrawerSubtitleHeight# as float
	navigationDrawerSubtitleTextBold as integer
	navigationDrawerSubtitleTextColor# as float[4]
	navigationDrawerSubtitleTextLeftPadding# as float
	navigationDrawerSubtitleTextSize# as float
	navigationDrawerType$ as string
	navigationDrawerWidth# as float

	// OryUIPagination
	//paginationButtonHeight# as float
	paginationButtonMargin# as float
	//paginationButtonWidth# as float
	paginationColor# as float[4]
	paginationDepth as integer
	//paginationFlexButtons as integer
	paginationHeight# as float
	paginationIconHeight# as float
	paginationIconWidth# as float
	paginationInactiveColor# as float[4]
	paginationInactiveIconColor# as float[4]
	paginationInactiveTextBold as integer
	paginationInactiveTextColor# as float[4]
	paginationInactiveTextSize# as float
	paginationMaximumButtonsToDisplay as integer
	paginationSelectedColor# as float[4]
	paginationSelectedIconColor# as float[4]
	paginationSelectedTextBold as integer
	paginationSelectedTextColor# as float[4]
	paginationSelectedTextSize# as float
	paginationShowSkipToEndButtons as integer
	paginationUnselectedColor# as float[4]
	paginationUnselectedIconColor# as float[4]
	paginationUnselectedTextBold as integer
	paginationUnselectedTextColor# as float[4]
	paginationUnselectedTextSize# as float
	paginationWidth# as float
	
	// OryUIPicker
	pickerAutoHeight as integer
	pickerBottomMargin# as float
	pickerButtonColor# as float[4]
	pickerButtonHeight# as float
	pickerButtonTextBold as integer
	pickerButtonTextColor# as float[4]
	pickerButtonTextSize# as float
	pickerButtonXSpacing# as float
	pickerButtonYSpacing# as float
	pickerColor# as float[4]
	pickerDepth as integer
	pickerFlexButtons as integer
	pickerHeight# as float
	pickerLeftMargin# as float
	pickerRightMargin# as float
	pickerScrimColor# as float[4]
	pickerSpacingBetweenSupportingTextAndButtons# as float
	pickerSpacingBetweenTitleAndSupportingText# as float
	pickerStackButtons as integer
	pickerSupportingTextAlignment as integer
	pickerSupportingTextColor# as float[4]
	pickerSupportingTextSize# as float
	pickerTitleTextAlignment as integer
	pickerTitleTextColor# as float[4]
	pickerTitleTextSize# as float
	pickerTopMargin# as float
	pickerWidth# as float
	
	// OryUIProgressIndicator
	progressIndicatorAnimationFPS as integer
	progressIndicatorAnimationFrame as integer[101]
	progressIndicatorColor# as float[4]
	progressIndicatorTrackColor# as float[4]
	progressIndicatorTrackHeight# as float
	progressIndicatorTrackWidth# as float

	// OryUIScrollBar
	scrollBarGripColor# as float[4]
	scrollBarGripIconColor# as float[4]
	scrollBarTrackColor# as float[4]
	
	// OryUIScrollToTop
	scrollToTopColor# as float[4]
	scrollToTopDepth as integer
	scrollToTopHeight# as float
	scrollToTopIconColor# as float[4]
	scrollToTopIconHeight# as float
	scrollToTopIconImage as integer
	scrollToTopIconWidth# as float
	scrollToTopPlacement$ as string
	scrollToTopShowShadow as integer
	scrollToTopStartY# as float
	scrollToTopWidth# as float

	// OryUISwitch
	switchCheckedColor# as float[4]
	switchDepth as integer
	switchHeight# as float
	switchTrackCheckedColor# as float[4]
	switchTrackDepth as integer
	switchTrackHeight# as float
	switchTrackUncheckedColor# as float[4]
	switchTrackWidth# as float
	switchUncheckedColor# as float[4]
	switchWidth# as float

	// OryUITemplate
	templateColor# as float[4]
	templateDepth as integer
	templateHeight# as float
	templateItemColor# as float[4]
	templateItemHeight# as float
	templateItemWidth# as float
	templateWidth# as float

	// OryUITooltip
	tooltipColor# as float[4]
	tooltipDepth as integer
	tooltipHeight# as float
	tooltipTextAlignment as integer
	tooltipTextBold as integer
	tooltipTextColor# as float[4]
	tooltipTextSize# as float
endtype

type typeOryUIJSONVariables
	variable$ as string
	value$ as string
endtype

type typeOryUIMaterialIcon
	sortKey$ as string
	imageID as integer
	index as integer
	name$ as string
endtype

type typeOryUIParameters
	activeButtonColor# as float[4]
	activeColor# as float[4]
	activeIconColor# as float[4]
	addIcon$ as string
	addIconColor# as float[4]
	addIconID as integer
	addIconSize# as float[2]
	addToFront as integer
	alignment as integer
	alwaysVisible as integer
	angle# as float
	attachToSpriteID as integer
	autoCorrectIfOutOfRange as integer
	autoResize as integer
	autoHeight as integer
	backgroundColor# as float[4]
	blockOrder$ as string[]
	bold as integer
	buttonMargin# as float
	cancelText$ as string
	checkboxAlignment as integer
	checkboxColor# as float[4]
	checkboxText$ as string
	checkboxTextBold as integer
	checkboxTextColor# as float[4]
	checkboxTextSize# as float
	checkedColor# as float[4]
	checkedImageID as integer
	color# as float[4]
	contentSize# as float[2]
	decimals as integer
	decisionRequired as integer
	defaultValue# as float
	delay# as float
	depth as integer
	dialogType$ as string
	direction$ as string
	disabledColor# as float[4]
	disabledIcon$ as string
	disabledIconColor# as float[4]
	disabledIconID as integer
	disabledIconPlacement$ as string
	disabledIconSize# as float[2]
	disabledImageID as integer
	disabledText$ as string							
	disabledTextAlignment as integer				
	disabledTextBold as integer						
	disabledTextColor# as float[4]					
	disabledTextSize# as float
	disableKeyboardInput as integer
	domain$ as string					
	draggable as integer
	drawerLocation$ as string
	drawerType$ as string
	enabled as integer
	enabledColor# as float[4]
	enabledIcon$ as string
	enabledIconColor# as float[4]
	enabledIconID as integer
	enabledIconPlacement$ as string
	enabledIconSize# as float[2]
	enabledImageID as integer
	enabledText$ as string							
	enabledTextAlignment as integer				
	enabledTextBold as integer						
	enabledTextColor# as float[4]					
	enabledTextSize# as float
	endY# as float		
	extended as integer
	file$ as string
	fileID as integer
	fixToscreen as integer
	flexButtons as integer
	frameShape$ as String
	gripColor# as float[4]
	gripIcon$ as string
	gripIconColor# as float[4]
	gripIconID as integer
	gripIconSize# as float[2]
	gripImageID as integer
	gripPosition# as float[2]
	gripSize# as float[2]
	group as integer
	headerText$ as string
	headerTextAlignment as integer
	headerTextBold as integer
	headerTextColor# as float[4]
	headerTextSize# as float
	helperText$ as string
	helperTextBold as integer
	helperTextColor# as float[4]
	helperTextSize# as float
	icon$ as string
	iconColor# as float[4]
	iconID as integer
	iconPlacement$ as string
	iconSize# as float[2]
	imageID as integer
	inactiveButtonColor# as float[4]
	inactiveColor# as float[4]
	inactiveIconColor# as float[4]
	inactiveTextBold as integer
	inactiveTextColor# as float[4]
	inactiveTextSize# as float
	index as integer
	indicatorColor# as float[4]
	inputText$ as string
	inputType$ as string
	invisibleGripSize# as float[2]
	itemHeight# as float
	itemSize# as float[2]
	itemType$ as string
	labelText$ as string
	leadingIcon$ as string
	leadingIconID as integer
	leftIcon$ as string
	leftIconID as integer
	leftIconColor# as float[4]
	leftLine1Text$ as string
	leftLine1TextBold as integer
	leftLine1TextColor# as float[4]
	leftLine1TextSize# as float
	leftLine2Text$ as string
	leftLine2TextBold as integer
	leftLine2TextColor# as float[4]
	leftLine2TextSize# as float
	leftText$ as string
	leftTextBold as integer
	leftTextColor# as float[4]
	leftTextSize# as float
	leftThumbnailImageID as float
	max# as float
	maxButtonsToDisplay
	maxLength as integer
	maxPosition# as float[2]
	maxView# as float[2]
	maxZoom# as float
	multiline as integer
	min# as float
	minGripSize# as float[2]
	mini as integer
	minPosition# as float[2]
	minView# as float[2]
	name$ as String
	navigationIcon$ as string
	navigationIconColor# as float[4]
	navigationIconID as integer
	navigationName$ as string
	noOfLeftLines as integer
	noOfPages as integer
	noOfRightLines as integer
	offset# as float[2]
	offsetBottomCenter as integer
	offsetBottomLeft as integer
	offsetBottomRight as integer
	offsetCenter as integer
	offsetCenterLeft as integer
	offsetCenterRight as integer
	offsetTopCenter as integer
	offsetTopLeft as integer
	offsetTopRight as integer
	placeholderText$ as string
	placement$ as string
	placementOffset# as float[2]
	platformStyle$ as string
	position# as float[2]
	postData$ as string
	progressType$ as string
	rightIcon$ as string
	rightIconID as integer
	rightIconColor# as float[4]
	rightLine1Text$ as string
	rightLine1TextBold as integer
	rightLine1TextColor# as float[4]
	rightLine1TextSize# as float
	rightLine2Text$ as string
	rightLine2TextBold as integer
	rightLine2TextColor# as float[4]
	rightLine2TextSize# as float
	rightText$ as string
	rightTextBold as integer
	rightTextColor# as float[4]
	rightTextSize# as float
	saveText$ as string
	scrollable as integer
	scrollType$ as string
	scrimColor# as float[4]
	script$ as string
	selected as integer
	selectedColor# as float[4]
	selectedIconColor# as float[4]
	selectedTextBold as integer
	selectedTextColor# as float[4]
	selectedTextSize# as float
	shadow as integer
	showCheckbox as integer
	showGripIcon as integer
	showHelperText as integer
	showIcon as integer
	showItemDivider as integer
	showLeadingIcon as integer
	showLeftIcon as integer
	showLeftThumbnail as integer
	showRightButton as integer
	showRightIcon as integer
	showRightText as integer
	showShadow as integer
	showSkipToEndButtons as integer
	showTrailingIcon as integer
	size# as float[2]
	spriteShader as integer
	ssl as integer
	stackButtons as integer
	startY# as float
	step# as float
	stickUntilComplete as integer
	strokeColor# as float[4]
	style$ as string
	subtitleText$ as string
	subtitleTextAlignment as integer
	subtitleTextBold as integer
	subtitleTextColor# as float[4]
	subtitleTextSize# as float
	subtractIcon$ as string
	subtractIconColor# as float[4]
	subtractIconID as integer
	subtractIconSize# as float[2]
	supportingText$ as string
	supportingTextAlignment as integer
	supportingTextBold as integer
	supportingTextColor# as float[4]
	supportingTextSize# as float
	switchCheckedColor# as float[4]
	switchCheckedImageID as integer
	switchImageID as integer
	switchUncheckedColor# as float[4]
	switchUncheckedImageID as integer
	switchSize# as float[2]
	text$ as string
	textAlignment as integer
	textBold as integer
	textColor# as float[4]
	textSize# as float
	timeout as integer
	titleText$ as string
	titleTextAlignment as integer
	titleTextBold as integer
	titleTextColor# as float[4]
	titleTextSize# as float
	trackCheckedColor# as float[4]
	trackCheckedImageID as integer
	trackColor# as float[4]
	trackImageID as integer
	trackPosition# as float[2]
	trackSize# as float[2]
	trackUncheckedColor# as float[4]
	trackUncheckedImageID as integer
	trailingIcon$ as string
	trailingIconID as integer
	uncheckedColor# as float[4]
	uncheckedImageID as integer
	unselectedColor# as float[4]
	unselectedIconColor# as float[4]
	unselectedTextBold as integer
	unselectedTextColor# as float[4]
	unselectedTextSize# as float
	widget$ as string
	wrapList as integer
	wrapListBottomY# as float
	wrapListTopY# as float
endtype

foldend


foldstart

global oryUIBlankLocalJSONVariable as typeOryUIJSONVariables
global oryUIBlockFlickScroll as integer
global oryUIBlockScreenScrolling as integer
global oryUIBottomBannerAdOnScreen as integer
global oryUIContentHeight# as float 			// NOT YET USED
global oryUIContentStartX# as float				// NOT YET USED
global oryUIContentStartY# as float				// NOT YET USED
global oryUIContentWidth# as float				// NOT YET USED
global oryUICreatedWidgets as typeOryUICreatedWidgets[]
global oryUIDefaults as typeOryUIDefaults
global oryUIDialogVisible as integer
global oryUILocalJSONVariables as typeOryUIJSONVariables[]
if (GetFileExists("OryUILocalVariables.json")) then oryUILocalJSONVariables.load("OryUILocalVariables.json")
global oryUIMaterialIcon as typeOryUIMaterialIcon[]
global oryUIParameters as typeoryUIParameters
global oryUIPickerVisible as integer
global OryUIScreenActive as integer
global oryUIScrimDepth as integer
global oryUIScrimVisible as integer
global oryUIMaxSyncRate# as integer : oryUIMaxSyncRate# = 60.0
global oryUIStatusBarHeight# as float : oryUIStatusBarHeight# = 3.6
global oryUITouchingTabs as integer
global oryUITouchingTopBar as integer

foldend


foldstart

function OryUIAddCreatedWidget(oryUIID as integer, oryUIType$ as string)
	local oryUIT as typeOryUICreatedWidgets
	oryUIT.type$ = oryUIType$
	oryUIT.id = oryUIID
endfunction oryUIT

function OryUIAddLeadingZeros(oryUINumber$ as string, oryUINumberOfZeros as integer)
	local oryUIForI as integer

	for oryUIForI = 1 to oryUINumberOfZeros
		if (len(oryUINumber$) < oryUINumberOfZeros)
			oryUINumber$ = "0" + oryUINumber$
		endif
	next
endfunction oryUINumber$

function OryUIAddToContentHeight(oryUIHeight# as float)
	oryUIContentHeight# = oryUIContentHeight# + oryUIHeight#
endfunction

function OryUIConvertBoolean(oryUIBoolean$ as string)
	local oryUIBoolean as integer
	
	if (lower(oryUIBoolean$) = "true" or lower(oryUIBoolean$) = "y" or lower(oryUIBoolean$) = "yes" or oryUIBoolean$ = "1")
		oryUIBoolean = 1
	elseif (lower(oryUIBoolean$) = "false" or lower(oryUIBoolean$) = "n" or lower(oryUIBoolean$) = "no" or oryUIBoolean$ = "0")
		oryUIBoolean = 0
	endif
endfunction oryUIBoolean

function OryUIConvertColor(oryUIColor$ as string)
	local oryUICommaCount as integer
	local oryUIHexInt as integer[6]
	local oryUIRGBA# as float[4] : oryUIRGBA#[1] = 255 : oryUIRGBA#[2] = 255 : oryUIRGBA#[3] = 255 : oryUIRGBA#[4] = 255
	
	oryUICommaCount = CountStringTokens(oryUIColor$, ",")
	if (oryUICommaCount = 1)
		if (FindString(oryUIColor$, "#") > 0)
			oryUIColor$ = ReplaceString(oryUIColor$, "#", "", -1)
			if (len(oryUIColor$) = 3)
				oryUIRGBA#[1] = val(mid(oryUIColor$, 1, 1) + mid(oryUIColor$, 1, 1), 16)
				oryUIRGBA#[2] = val(mid(oryUIColor$, 2, 1) + mid(oryUIColor$, 2, 1), 16)
				oryUIRGBA#[3] = val(mid(oryUIColor$, 3, 1) + mid(oryUIColor$, 3, 1), 16)
			elseif (len(oryUIColor$) = 6)
				oryUIRGBA#[1] = val(mid(oryUIColor$, 1, 2), 16)
				oryUIRGBA#[2] = val(mid(oryUIColor$, 3, 2), 16)
				oryUIRGBA#[3] = val(mid(oryUIColor$, 5, 2), 16)
			endif
		else
			oryUIRGBA#[1] = GetColorRed(val(oryUIColor$))
			oryUIRGBA#[2] = GetColorGreen(val(oryUIColor$))
			oryUIRGBA#[3] = GetColorBlue(val(oryUIColor$))
		endif
	elseif (oryUICommaCount >= 3)
		oryUIRGBA#[1] = valFloat(GetStringToken(oryUIColor$, ",", 1))
		oryUIRGBA#[2] = valFloat(GetStringToken(oryUIColor$, ",", 2))
		oryUIRGBA#[3] = valFloat(GetStringToken(oryUIColor$, ",", 3))
		if (oryUICommaCount = 4) then oryUIRGBA#[4] = valFloat(GetStringToken(oryUIColor$, ",", 4))
	endif
endfunction oryUIRGBA#

function OryUIConvertMaterialIconSubImages(oryUIAMax as integer, oryUIBMax as integer)
	local oryUIBlankIcon as typeOryUIMaterialIcon
	local oryUIFileID as integer
	local oryUIForA as integer
	local oryUIForB as integer
	local oryUIID as integer
	local oryUIImage as integer
	local oryUILine$ as string
	local oryUISubImage as integer

	oryUIFileID = OpenToRead("OryUIMedia/Material-Icons/Material-Icons.txt")
	for oryUIForA = 1 to oryUIAMax
		oryUIImage = LoadImage("OryUIMedia/Material-Icons/Material-Icons-" + OryUIAddLeadingZeros(str(oryUIForA), len(str(oryUIAMax)) + 1) + ".png")
		for oryUIForB = 1 to oryUIBMax
			oryUILine$ = ReadLine(oryUIFileID)
			oryUISubImage = LoadSubImage(oryUIImage, "icon" + str(oryUIForB))
			oryUIMaterialIcon.insert(oryUIBlankIcon)
			oryUIID = oryUIMaterialIcon.length
			oryUIMaterialIcon[oryUIID].sortKey$ = oryUILine$
			oryUIMaterialIcon[oryUIID].index = oryUIID
			oryUIMaterialIcon[oryUIID].imageID = oryUISubImage
			oryUIMaterialIcon[oryUIID].name$ = oryUILine$
		next
	next
	CloseFile(oryUIFileID)
	oryUIMaterialIcon.sort()
endfunction

function OryUICreateWidget(oryUIWidgetParameters$)
	OryUIResetParametersType()

	local oryUIForI as integer
	local oryUIValue$ as string
	local oryUIVariable$ as string
	local oryUIWidget as integer
	local oryUIWidgetEnd as integer
	local oryUIWidgetParameter$ as string
	local oryUIWidgetStart as integer

	oryUIWidgetStart = FindString(oryUIWidgetParameters$, "widget:", 1, 1)
	oryUIWidgetEnd = FindString(oryUIWidgetParameters$, ";", 1, oryUIWidgetStart)
	oryUIWidgetParameter$ = Mid(oryUIWidgetParameters$, oryUIWidgetStart, oryUIWidgetEnd - oryUIWidgetStart)
	oryUIVariable$ = lower(TrimString(GetStringToken(oryUIWidgetParameter$, ":", 1), " "))
	oryUIValue$ = GetStringToken(oryUIWidgetParameter$, ":", 2)
	oryUIValue$ = ReplaceString(oryUIValue$, "[colon]", ":", -1)
	oryUIValue$ = ReplaceString(oryUIValue$, "[semicolon]", ";", -1)

	if (oryUIValue$ = "") then oryUIValue$ = "null"
	if (oryUIVariable$ = "widget")
		oryUIParameters.widget$ = lower(oryUIValue$)
	endif
	
	select oryUIParameters.widget$
		case "button"
			oryUIWidget = OryUICreateButton(oryUIWidgetParameters$)
		endcase
		case "buttongroup"
			oryUIWidget = OryUICreateButtonGroup(oryUIWidgetParameters$)
		endcase
		case "checkbox"
			oryUIWidget = OryUICreateCheckbox(oryUIWidgetParameters$)
		endcase
		case "dialog"
			oryUIWidget = OryUICreateDialog(oryUIWidgetParameters$)
		endcase
		case "editavatarscreen"
			oryUIWidget = OryUICreateEditAvatarScreen(oryUIWidgetParameters$)
		endcase
		case "floatingactionbutton"
			oryUIWidget = OryUICreateFloatingActionButton(oryUIWidgetParameters$)
		endcase
		case "httpsqueue"
			oryUIWidget = OryUICreateHTTPSQueue(oryUIWidgetParameters$)
		endcase
		case "inputspinner"
			oryUIWidget = OryUICreateInputSpinner(oryUIWidgetParameters$)
		endcase
		case "list"
			oryUIWidget = OryUICreateList(oryUIWidgetParameters$)
		endcase
		case "menu"
			oryUIWidget = OryUICreateMenu(oryUIWidgetParameters$)
		endcase
		case "navigationdrawer"
			oryUIWidget = OryUICreateNavigationDrawer(oryUIWidgetParameters$)
		endcase
		case "pagination"
			oryUIWidget = OryUICreatePagination(oryUIWidgetParameters$)
		endcase
		case "progressindicator"
			oryUIWidget = OryUICreateProgressIndicator(oryUIWidgetParameters$)
		endcase
		case "scrollbar"
			oryUIWidget = OryUICreateScrollBar(oryUIWidgetParameters$)
		endcase
		case "scrolltotop"
			oryUIWidget = OryUICreateScrollToTop(oryUIWidgetParameters$)
		endcase
		case "sprite"
			oryUIWidget = OryUICreateSprite(oryUIWidgetParameters$)
		endcase
		case "switch"
			oryUIWidget = OryUICreateSwitch(oryUIWidgetParameters$)
		endcase
		case "tabs"
			oryUIWidget = OryUICreateTabs(oryUIWidgetParameters$)
		endcase
		case "text"
			oryUIWidget = OryUICreateText(oryUIWidgetParameters$)
		endcase
		case "textcard"
			oryUIWidget = OryUICreateTextCard(oryUIWidgetParameters$)
		endcase
		case "textfield"
			oryUIWidget = OryUICreateTextfield(oryUIWidgetParameters$)
		endcase
		case "tooltip"
			oryUIWidget = OryUICreateTooltip(oryUIWidgetParameters$)
		endcase
		case "topbar"
			oryUIWidget = OryUICreateTopBar(oryUIWidgetParameters$)
		endcase
	endselect
endfunction oryUIWidget

function OryUIDeleteAllWidgets()
	local oryUIForI as integer
	OryUISync()
	for oryUIForI = 0 to oryUICreatedWidgets.length
		select oryUICreatedWidgets[oryUIForI].type$
			case "Button"
				OryUIDeleteButton(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "ButtonGroup"
				OryUIDeleteButtonGroup(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "Checkbox"
				OryUIDeleteCheckbox(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "Dialog"
				OryUIDeleteDialog(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "EditAvatarScreen"
				OryUIDeleteEditAvatarScreen(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "FloatingActionButton"
				OryUIDeleteFloatingActionButton(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "InputSpinner"
				OryUIDeleteInputSpinner(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "List"
				OryUIDeleteList(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "Menu"
				OryUIDeleteMenu(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "NavigationDrawer"
				OryUIDeleteNavigationDrawer(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "Pagination"
				OryUIDeletePagination(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "ProgressIndicator"
				OryUIDeleteProgressIndicator(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "ScrollBar"
				OryUIDeleteScrollBar(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "ScrollToTop"
				OryUIDeleteScrollToTop(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "Sprite"
				DeleteSprite(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "Switch"
				OryUIDeleteSwitch(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "Tabs"
				OryUIDeleteTabs(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "Text"
				DeleteText(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "TextCard"
				OryUIDeleteTextCard(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "Textfield"
				OryUIDeleteTextfield(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "Tooltip"
				OryUIDeleteTooltip(oryUICreatedWidgets[oryUIForI].id)
			endcase
			case "TopBar"
				OryUIDeleteTopBar(oryUICreatedWidgets[oryUIForI].id)
			endcase
		endselect
	next
	oryUICreatedWidgets.length = -1
endfunction

function OryUIGetLocalJSONVariable(oryUIVariable$ as string)
	local oryUIForI as integer
	local oryUIVariableValue$ as string
	
	for oryUIForI = 0 to oryUILocalJSONVariables.length
		if (oryUILocalJSONVariables[oryUIForI].variable$ = "") then oryUILocalJSONVariables.remove(oryUIForI)
		if (lower(oryUILocalJSONVariables[oryUIForI].variable$) = lower(oryUIVariable$))
			oryUIVariableValue$ = oryUILocalJSONVariables[oryUIForI].value$
		endif
	next
endfunction oryUIVariableValue$

function OryUILerp(oryUIMin# as float, oryUIMax# as float, oryUIF# as float)
	local oryUIResult# as float
	oryUIResult# = oryUIMin# + oryUIF# * (oryUIMax# - oryUIMin#)
endfunction oryUIResult#

function OryUIMaxFloat(oryUIA# as float, oryUIB# as float)
	local oryUIMaxValue# as float
	if (oryUIA# >= oryUIB#)
		oryUIMaxValue# = oryUIA#
	else
		oryUIMaxValue# = oryUIB#
	endif
endfunction oryUIMaxValue#

function OryUIMaxInt(oryUIA as integer, oryUIB as integer)
	local oryUIMaxValue as integer
	if (oryUIA >= oryUIB)
		oryUIMaxValue = oryUIA
	else
		oryUIMaxValue = oryUIB
	endif
endfunction oryUIMaxValue

function OryUIMinFloat(oryUIA# as float, oryUIB# as float)
	local oryUIMinValue# as float
	if (oryUIA# <= oryUIB#)
		oryUIMinValue# = oryUIA#
	else
		oryUIMinValue# = oryUIB#
	endif
endfunction oryUIMinValue#

function OryUIMinInt(oryUIA as integer, oryUIB as integer)
	local oryUIMinValue as integer
	if (oryUIA <= oryUIB)
		oryUIMinValue = oryUIA
	else
		oryUIMinValue = oryUIB
	endif
endfunction oryUIMinValue

function OryUIResetParametersType()
	local oryUIForI as integer
	
	oryUIParameters.addIcon$ = ""
	oryUIParameters.addIconID = -999999
	oryUIParameters.addToFront = -999999
	oryUIParameters.alignment = -999999
	oryUIParameters.alwaysVisible = -999999
	oryUIParameters.angle# = -999999
	oryUIParameters.attachToSpriteID = -999999
	oryUIParameters.autoCorrectIfOutOfRange = -999999
	oryUIParameters.autoHeight = -999999
	oryUIParameters.autoResize = -999999
	oryUIParameters.blockOrder$.length = -1
	oryUIParameters.bold = -999999
	oryUIParameters.buttonMargin# = -999999
	oryUIParameters.cancelText$ = ""
	oryUIParameters.checkboxAlignment = -999999
	oryUIParameters.checkboxText$ = ""
	oryUIParameters.checkboxTextBold = -999999
	oryUIParameters.checkboxTextSize# = -999999
	oryUIParameters.checkedImageID = -999999
	oryUIParameters.decimals = -999999
	oryUIParameters.decisionRequired = -999999
	oryUIParameters.defaultValue# = -999999
	oryUIParameters.delay# = -999999
	oryUIParameters.depth = -999999
	oryUIParameters.dialogType$ = ""
	oryUIParameters.direction$ = ""
	oryUIParameters.disabledIcon$ = ""
	oryUIParameters.disabledIconID = -999999
	oryUIParameters.disabledIconPlacement$ = ""
	oryUIParameters.disabledImageID = -999999
	oryUIParameters.disabledText$ = ""
	oryUIParameters.disabledTextAlignment = -999999
	oryUIParameters.disabledTextBold = -999999
	oryUIParameters.disabledTextSize# = -999999
	oryUIParameters.disableKeyboardInput = -999999
	oryUIParameters.domain$ = ""
	oryUIParameters.draggable = -999999
	oryUIParameters.drawerLocation$ = ""
	oryUIParameters.drawerType$ = ""
	oryUIParameters.enabled = -999999
	oryUIParameters.enabledIcon$ = ""
	oryUIParameters.enabledIconID = -999999
	oryUIParameters.enabledIconPlacement$ = ""
	oryUIParameters.enabledImageID = -999999
	oryUIParameters.enabledText$ = ""
	oryUIParameters.enabledTextAlignment = -999999
	oryUIParameters.enabledTextBold = -999999
	oryUIParameters.enabledTextSize# = -999999
	oryUIParameters.endY# = -999999
	oryUIParameters.extended = -999999
	oryUIParameters.file$ = ""
	oryUIParameters.fileID = -999999
	oryUIParameters.fixToscreen = -999999
	oryUIParameters.flexButtons = -999999
	oryUIParameters.frameShape$ = ""
	oryUIParameters.gripIcon$ = ""
	oryUIParameters.gripIconID = -999999
	oryUIParameters.gripImageID = -999999
	oryUIParameters.group = -999999
	oryUIParameters.headerText$ = ""
	oryUIParameters.headerTextAlignment = -999999
	oryUIParameters.headerTextBold = -999999
	oryUIParameters.headerTextSize# = -999999
	oryUIParameters.helperText$ = ""
	oryUIParameters.helperTextBold = -999999
	oryUIParameters.helperTextSize# = -999999
	oryUIParameters.icon$ = ""
	oryUIParameters.iconID = -999999
	oryUIParameters.iconPlacement$ = ""
	oryUIParameters.imageID = -999999
	oryUIParameters.inactiveTextBold = -999999
	oryUIParameters.inactiveTextSize# = -999999
	oryUIParameters.index = -999999	
	oryUIParameters.inputText$ = ""
	oryUIParameters.inputType$ = ""
	oryUIParameters.itemHeight# = -999999
	oryUIParameters.itemType$ = ""
	oryUIParameters.labelText$ = ""
	oryUIParameters.leadingIcon$ = ""
	oryUIParameters.leadingIconID = -999999
	oryUIParameters.leftIcon$ = ""
	oryUIParameters.leftIconID = -999999
	oryUIParameters.leftLine1Text$ = ""
	oryUIParameters.leftLine1TextBold = -999999
	oryUIParameters.leftLine1TextSize# = -999999
	oryUIParameters.leftLine2Text$ = ""
	oryUIParameters.leftLine2TextBold = -999999
	oryUIParameters.leftLine2TextSize# = -999999
	oryUIParameters.leftText$ = ""
	oryUIParameters.leftTextBold = -999999
	oryUIParameters.leftTextSize# = -999999
	oryUIParameters.leftThumbnailImageID = -999999
	oryUIParameters.max# = -999999
	oryUIParameters.maxButtonsToDisplay = -999999
	oryUIParameters.maxLength = -999999
	oryUIParameters.maxZoom# = -999999
	oryUIParameters.min# = -999999
	oryUIParameters.mini = -999999
	oryUIParameters.multiline = -999999
	oryUIParameters.name$ = ""
	oryUIParameters.navigationIcon$ = ""
	oryUIParameters.navigationIconID = -999999
	oryUIParameters.navigationName$ = ""
	oryUIParameters.noOfLeftLines = -999999
	oryUIParameters.noOfPages = -999999
	oryUIParameters.noOfRightLines = -999999
	oryUIParameters.offsetBottomCenter = -999999
	oryUIParameters.offsetBottomLeft = -999999
	oryUIParameters.offsetBottomRight = -999999
	oryUIParameters.offsetCenter = -999999
	oryUIParameters.offsetCenterLeft = -999999
	oryUIParameters.offsetCenterRight = -999999
	oryUIParameters.offsetTopCenter = -999999
	oryUIParameters.offsetTopLeft = -999999
	oryUIParameters.offsetTopRight = -999999
	oryUIParameters.placeholderText$ = ""
	oryUIParameters.placement$ = ""
	oryUIParameters.platformStyle$ = ""
	oryUIParameters.postData$ = ""
	oryUIParameters.progressType$ = ""
	oryUIParameters.rightIcon$ = ""
	oryUIParameters.rightIconID = -999999
	oryUIParameters.rightLine1Text$ = ""
	oryUIParameters.rightLine1TextBold = -999999
	oryUIParameters.rightLine1TextSize# = -999999
	oryUIParameters.rightLine2Text$ = ""
	oryUIParameters.rightLine2TextBold = -999999
	oryUIParameters.rightLine2TextSize# = -999999
	oryUIParameters.rightText$ = ""
	oryUIParameters.rightTextBold = -999999
	oryUIParameters.rightTextSize# = -999999
	oryUIParameters.saveText$ = ""
	oryUIParameters.script$ = ""
	oryUIParameters.scrollable = -999999
	oryUIParameters.scrollType$ = ""
	oryUIParameters.selected = -999999
	oryUIParameters.selectedTextBold = -999999
	oryUIParameters.selectedTextSize# = -999999	
	oryUIParameters.shadow = -999999
	oryUIParameters.showCheckbox = -999999
	oryUIParameters.showHelperText = -99999
	oryUIParameters.showIcon = -999999
	oryUIParameters.showItemDivider = -999999
	oryUIParameters.showLeadingIcon = -999999
	oryUIParameters.showLeftIcon = -999999
	oryUIParameters.showLeftThumbnail = -999999
	oryUIParameters.showRightButton = -999999
	oryUIParameters.showRightIcon = -999999
	oryUIParameters.showRightText = -999999
	oryUIParameters.showShadow = -999999
	oryUIParameters.showSkipToEndButtons = -999999
	oryUIParameters.showTrailingIcon = -999999
	oryUIParameters.spriteShader = -999999
	oryUIParameters.ssl = -999999
	oryUIParameters.stackButtons = -999999
	oryUIParameters.startY# = -999999
	oryUIParameters.step# = -999999
	oryUIParameters.stickUntilComplete = -999999
	oryUIParameters.style$ = ""
	oryUIParameters.subtitleText$ = ""
	oryUIParameters.subtitleTextAlignment = -999999
	oryUIParameters.subtitleTextBold = -999999
	oryUIParameters.subtitleTextSize# = -999999
	oryUIParameters.subtractIcon$ = ""
	oryUIParameters.subtractIconID = -999999
	oryUIParameters.supportingText$ = ""
	oryUIParameters.supportingTextAlignment = -999999
	oryUIParameters.supportingTextBold = -999999
	oryUIParameters.supportingTextSize# = -999999
	oryUIParameters.switchCheckedImageID = -999999
	oryUIParameters.switchImageID = -999999
	oryUIParameters.switchUncheckedImageID = -999999
	oryUIParameters.text$ = ""
	oryUIParameters.textAlignment = -999999
	oryUIParameters.textBold = -999999
	oryUIParameters.textSize# = -999999
	oryUIParameters.timeout = -999999
	oryUIParameters.titleText$ = ""
	oryUIParameters.titleTextAlignment = -999999
	oryUIParameters.titleTextBold = -999999
	oryUIParameters.titleTextSize# = -999999
	oryUIParameters.trackCheckedImageID = -999999
	oryUIParameters.trackImageID = -999999
	oryUIParameters.trackUncheckedImageID = -999999
	oryUIParameters.trailingIcon$ = ""
	oryUIParameters.trailingIconID = -999999
	oryUIParameters.uncheckedImageID = -999999
	oryUIParameters.unselectedTextBold = -999999
	oryUIParameters.unselectedTextSize# = -999999
	oryUIParameters.widget$ = ""
	oryUIParameters.wrapList = -999999	
	oryUIParameters.wrapListBottomY# = -999999	
	oryUIParameters.wrapListTopY# = -999999	
	for oryUIForI = 1 to 4
		if (oryUIForI < 3)
			oryUIParameters.addIconSize#[oryUIForI] = -999999
			oryUIParameters.contentSize#[oryUIForI] = -999999
			oryUIParameters.disabledIconSize#[oryUIForI] = -999999
			oryUIParameters.enabledIconSize#[oryUIForI] = -999999
			oryUIParameters.gripPosition#[oryUIForI] = -999999
			oryUIParameters.gripIconSize#[oryUIForI] = -999999
			oryUIParameters.gripSize#[oryUIForI] = -999999
			oryUIParameters.iconSize#[oryUIForI] = -999999
			oryUIParameters.invisibleGripSize#[oryUIForI] = -999999
			oryUIParameters.itemSize#[oryUIForI] = -999999
			oryUIParameters.maxPosition#[oryUIForI] = -999999
			oryUIParameters.maxView#[oryUIForI] = -999999
			oryUIParameters.minGripSize#[oryUIForI] = -999999
			oryUIParameters.minPosition#[oryUIForI] = -999999
			oryUIParameters.minView#[oryUIForI] = -999999
			oryUIParameters.offset#[oryUIForI] = -999999
			oryUIParameters.placementOffset#[oryUIForI] = -999999
			oryUIParameters.position#[oryUIForI] = -999999
			oryUIParameters.size#[oryUIForI] = -999999
			oryUIParameters.subtractIconSize#[oryUIForI] = -999999
			oryUIParameters.switchSize#[oryUIForI] = -999999
			oryUIParameters.trackSize#[oryUIForI] = -999999
		endif
		oryUIParameters.activeButtonColor#[oryUIForI] = -999999
		oryUIParameters.activeColor#[oryUIForI] = -999999
		oryUIParameters.activeIconColor#[oryUIForI] = -999999
		oryUIParameters.addIconColor#[oryUIForI] = -999999
		oryUIParameters.backgroundColor#[oryUIForI] = -999999
		oryUIParameters.checkboxColor#[oryUIForI] = -999999
		oryUIParameters.checkboxTextColor#[oryUIForI] = -999999
		oryUIParameters.checkedColor#[oryUIForI] = -999999
		oryUIParameters.color#[oryUIForI] = -999999
		oryUIParameters.disabledColor#[oryUIForI] = -999999
		oryUIParameters.disabledIconColor#[oryUIForI] = -999999
		oryUIParameters.disabledTextColor#[oryUIForI] = -999999
		oryUIParameters.enabledColor#[oryUIForI] = -999999
		oryUIParameters.enabledIconColor#[oryUIForI] = -999999
		oryUIParameters.enabledTextColor#[oryUIForI] = -999999
		oryUIParameters.gripColor#[oryUIForI] = -999999
		oryUIParameters.gripIconColor#[oryUIForI] = -999999
		oryUIParameters.headerTextColor#[oryUIForI] = -999999
		oryUIParameters.helperTextColor#[oryUIForI] = -999999
		oryUIParameters.iconColor#[oryUIForI] = -999999
		oryUIParameters.inactiveButtonColor#[oryUIForI] = -999999
		oryUIParameters.inactiveColor#[oryUIForI] = -999999
		oryUIParameters.inactiveIconColor#[oryUIForI] = -999999
		oryUIParameters.inactiveTextColor#[oryUIForI] = -999999
		oryUIParameters.indicatorColor#[oryUIForI] = -999999
		oryUIParameters.leftIconColor#[oryUIForI] = -999999
		oryUIParameters.leftLine1TextColor#[oryUIForI] = -999999
		oryUIParameters.leftLine2TextColor#[oryUIForI] = -999999
		oryUIParameters.leftTextColor#[oryUIForI] = -999999
		oryUIParameters.navigationIconColor#[oryUIForI] = -999999
		oryUIParameters.rightIconColor#[oryUIForI] = -999999
		oryUIParameters.rightLine1TextColor#[oryUIForI] = -999999
		oryUIParameters.rightLine2TextColor#[oryUIForI] = -999999
		oryUIParameters.rightTextColor#[oryUIForI] = -999999
		oryUIParameters.scrimColor#[oryUIForI] = -999999
		oryUIParameters.selectedColor#[oryUIForI] = -999999
		oryUIParameters.selectedIconColor#[oryUIForI] = -999999
		oryUIParameters.selectedTextColor#[oryUIForI] = -999999
		oryUIParameters.strokeColor#[oryUIForI] = -999999
		oryUIParameters.subtitleTextColor#[oryUIForI] = -999999
		oryUIParameters.subtractIconColor#[oryUIForI] = -999999
		oryUIParameters.supportingTextColor#[oryUIForI] = -999999
		oryUIParameters.switchCheckedColor#[oryUIForI] = -999999
		oryUIParameters.switchUncheckedColor#[oryUIForI] = -999999
		oryUIParameters.textColor#[oryUIForI] = -999999
		oryUIParameters.titleTextColor#[oryUIForI] = -999999
		oryUIParameters.trackCheckedColor#[oryUIForI] = -999999
		oryUIParameters.trackColor#[oryUIForI] = -999999
		oryUIParameters.trackUncheckedColor#[oryUIForI] = -999999
		oryUIParameters.uncheckedColor#[oryUIForI] = -999999
		oryUIParameters.unselectedColor#[oryUIForI] = -999999
		oryUIParameters.unselectedIconColor#[oryUIForI] = -999999
		oryUIParameters.unselectedTextColor#[oryUIForI] = -999999
	next
endfunction

function OryUIReturnIconID(oryUIIcon$ as string)
	local oryUIIconID as integer
	local oryUIMaterialIconIndex as integer

	oryUIIconID = -999999
	if (lower(oryUIIcon$) = "back") then oryUIIconID = oryUIIconBackImage
	if (lower(oryUIIcon$) = "morehorizontal" or lower(oryUIIcon$) = "morehoriz") then oryUIIconID = oryUIIconMoreHorizontalImage
	if (lower(oryUIIcon$) = "morevertical" or lower(oryUIIcon$) = "morevert") then oryUIIconID = oryUIIconMoreVerticalImage
	if (lower(oryUIIcon$) = "profile") then oryUIIconID = oryUIIconProfileImage
	if (lower(oryUIIcon$) = "scrolltotop") then oryUIIconID = oryUIIconScrollToTopImage
	if (lower(oryUIIcon$) = "subtract") then oryUIIconID = oryUIIconSubtractImage
	oryUIMaterialIconIndex = oryUIMaterialIcon.find(lower(oryUIIcon$))
	if (oryUIMaterialIconIndex >= 0) then oryUIIconID = oryUIMaterialIcon[oryUIMaterialIconIndex].imageID
endfunction oryUIIconID

function OryUISetContentHeight(oryUIHeight# as float)
	oryUIContentHeight# = oryUIHeight#
endfunction

function OryUISetContentStartPosition(oryUIStartX# as float, oryUIStartY# as float)
	oryUIContentStartX# = oryUIStartX#
	oryUIContentStartY# = oryUIStartY#
endfunction

function OryUISetLocalJSONVariable(oryUIVariable$ as string, oryUIVariableValue$ as string)
	local oryUIForI as integer
	local oryUIIndexFound as integer
	
	oryUIIndexFound = -1
	for oryUIForI = 0 to oryUILocalJSONVariables.length
		if (lower(oryUILocalJSONVariables[oryUIForI].variable$) = lower(oryUIVariable$))
			oryUIIndexFound = oryUIForI
			oryUILocalJSONVariables[oryUIForI].value$ = oryUIVariableValue$
		endif
	next
	if (oryUIIndexFound = -1)
		oryUILocalJSONVariables.insert(oryUIBlankLocalJSONVariable)
		oryUILocalJSONVariables[oryUILocalJSONVariables.length].variable$ = oryUIVariable$
		oryUILocalJSONVariables[oryUILocalJSONVariables.length].value$ = oryUIVariableValue$
	endif
	oryUILocalJSONVariables.sort()
	oryUILocalJSONVariables.save("OryUILocalVariables.json")
endfunction

function OryUISetParametersType(oryUIWidgetParameters$ as string)
	OryUIResetParametersType()
	
	local oryUIWidgetParameter$ as string
	local oryUIForI as integer
	local oryUIForJ as integer
	local oryUIValue$ as string
	local oryUIVariable$ as string
	
	for oryUIForI = 1 to CountStringTokens(oryUIWidgetParameters$, ";")
		oryUIWidgetParameter$ = GetStringToken(oryUIWidgetParameters$, ";", oryUIForI)
		oryUIVariable$ = lower(TrimString(GetStringToken(oryUIWidgetParameter$, ":", 1), " "))
		oryUIValue$ = GetStringToken(oryUIWidgetParameter$, ":", 2)
		oryUIValue$ = ReplaceString(oryUIValue$, "[colon]", ":", -1)
		oryUIValue$ = ReplaceString(oryUIValue$, "[semicolon]", ";", -1)
		if (oryUIValue$ = "") then oryUIValue$ = "null"
		if (oryUIVariable$ = "activebuttoncolor" or oryUIVariable$ = "activebuttoncolorid")
			oryUIParameters.activeButtonColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "activecolor" or oryUIVariable$ = "activecolorid")
			oryUIParameters.activeColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "activeiconcolor" or oryUIVariable$ = "activeiconcolorid")
			oryUIParameters.activeIconColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "addicon")
			oryUIParameters.addIcon$ = oryUIValue$
			oryUIParameters.addIconID = OryUIReturnIconID(oryUIValue$)
		elseif (oryUIVariable$ = "addiconcolor" or oryUIVariable$ = "addiconcolorid")
			oryUIParameters.addIconColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "addiconid")
			oryUIParameters.addIconID = val(oryUIValue$)
		elseif (oryUIVariable$ = "addiconsize")
			oryUIParameters.addIconSize#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.addIconSize#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "addtofront")
			oryUIParameters.addToFront = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "alignment")
			if (lower(oryUIValue$) = "left")
				oryUIParameters.alignment = 0
			elseif (lower(oryUIValue$) = "center" or lower(oryUIValue$) = "centre")
				oryUIParameters.alignment = 1
			elseif (lower(oryUIValue$) = "right")
				oryUIParameters.alignment = 2
			endif
		elseif (oryUIVariable$ = "alpha")
			oryUIParameters.color#[4] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "alwaysvisible")
			oryUIParameters.alwaysVisible = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "angle")
			oryUIParameters.angle# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "attachtospriteid")
			oryUIParameters.attachToSpriteID = val(oryUIValue$)
		elseif (oryUIVariable$ = "autocorrectifoutofrange")
			oryUIParameters.autoCorrectIfOutOfRange = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "autoheight")
			oryUIParameters.autoHeight = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "autoresize")
			oryUIParameters.autoResize = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "backgroundcolor" or oryUIVariable$ = "backgroundcolorid")
			oryUIParameters.backgroundColor# = OryUIConvertColor(oryUIValue$)
		elseif (OryUIVariable$ = "blockorder")
			for oryUIForJ = 1 to CountStringTokens(oryUIValue$, ",")
				oryUIParameters.blockOrder$.insert(GetStringToken(oryUIWidgetParameters$, ",", oryUIForJ))
			next
		elseif (oryUIVariable$ = "bold")
			oryUIParameters.bold = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "buttonmargin")
			oryUIParameters.buttonMargin# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "canceltext")
			oryUIParameters.cancelText$ = oryUIValue$
		elseif (oryUIVariable$ = "checkboxcolor" or oryUIVariable$ = "checkboxcolorid")
			oryUIParameters.checkboxColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "checkboxtext")
			oryUIParameters.checkboxText$ = oryUIValue$
		elseif (oryUIVariable$ = "checkboxtextbold")
			oryUIParameters.checkboxTextBold = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "checkboxtextcolor" or oryUIVariable$ = "checkboxtextcolorid")
			oryUIParameters.checkboxTextColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "checkboxtextsize")
			oryUIParameters.checkboxTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "checkedcolor" or oryUIVariable$ = "checkedcolorid")
			oryUIParameters.checkedColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "checkedimageid")
			oryUIParameters.checkedImageID = val(oryUIValue$)
		elseif (oryUIVariable$ = "color" or oryUIVariable$ = "colorid")
			oryUIParameters.color# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "contentsize")
			oryUIParameters.contentSize#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.contentSize#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "decimals")
			oryUIParameters.decimals = val(oryUIValue$)
		elseif (oryUIVariable$ = "decisionrequired")
			oryUIParameters.decisionRequired = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "defaultvalue")
			oryUIParameters.defaultValue# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "delay")
			oryUIParameters.delay# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "depth")
			oryUIParameters.depth = val(oryUIValue$)
		elseif (oryUIVariable$ = "dialogtype")
			oryUIParameters.dialogType$ = oryUIValue$
		elseif (oryUIVariable$ = "direction")
			oryUIParameters.direction$ = oryUIValue$
		elseif (oryUIVariable$ = "disabledcolor" or oryUIVariable$ = "disabledcolorid")
			oryUIParameters.disabledColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "disabledicon")
			oryUIParameters.disabledIcon$ = oryUIValue$
			oryUIParameters.disabledIconID = OryUIReturnIconID(oryUIValue$)
		elseif (oryUIVariable$ = "disablediconcolor" or oryUIVariable$ = "disablediconcolorid")
			oryUIParameters.disabledIconColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "disablediconplacement")
			oryUIParameters.disabledIconPlacement$ = oryUIValue$
		elseif (oryUIVariable$ = "disablediconsize")
			oryUIParameters.disabledIconSize#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.disabledIconSize#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "disabledimage")
			oryUIParameters.disabledImageID = val(oryUIValue$)
		elseif (oryUIVariable$ = "disabledtext")
			oryUIParameters.disabledText$ = oryUIValue$
		elseif (oryUIVariable$ = "disabledtextalignment")
			if (lower(oryUIValue$) = "left")
				oryUIParameters.disabledTextAlignment = 0
			elseif (lower(oryUIValue$) = "center" or lower(oryUIValue$) = "centre")
				oryUIParameters.disabledTextAlignment = 1
			elseif (lower(oryUIValue$) = "right")
				oryUIParameters.disabledTextAlignment = 2
			endif
		elseif (oryUIVariable$ = "disabledtextbold")
			oryUIParameters.disabledTextBold = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "disabledtextcolor" or oryUIVariable$ = "disabledtextcolorid")
			oryUIParameters.disabledTextColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "disabledtextsize")
			oryUIParameters.disabledTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "disablekeyboardinput")
			oryUIParameters.disableKeyboardInput = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "domain")
			oryUIParameters.domain$ = oryUIValue$
		elseif (oryUIVariable$ = "draggable")
			oryUIParameters.draggable = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "drawerlocation")
			if (lower(oryUIValue$) = "bottom")
				oryUIParameters.drawerLocation$ = "Bottom"
			elseif (lower(oryUIValue$) = "left")
				oryUIParameters.drawerLocation$ = "Left"
			elseif (lower(oryUIValue$) = "right")
				oryUIParameters.drawerLocation$ = "Right"
			endif
		elseif (oryUIVariable$ = "drawertype")
			oryUIParameters.drawerType$ = oryUIValue$
		elseif (oryUIVariable$ = "enabled")
			oryUIParameters.enabled = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "enabledcolor" or oryUIVariable$ = "enabledcolorid")
			oryUIParameters.enabledColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "enabledicon")
			oryUIParameters.enabledIcon$ = oryUIValue$
			oryUIParameters.enabledIconID = OryUIReturnIconID(oryUIValue$)
		elseif (oryUIVariable$ = "enablediconcolor" or oryUIVariable$ = "enablediconcolorid")
			oryUIParameters.enabledIconColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "enablediconplacement")
			oryUIParameters.enabledIconPlacement$ = oryUIValue$
		elseif (oryUIVariable$ = "enablediconsize")
			oryUIParameters.enabledIconSize#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.enabledIconSize#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "enabledimage")
			oryUIParameters.enabledImageID = val(oryUIValue$)
		elseif (oryUIVariable$ = "enabledtext")
			oryUIParameters.enabledText$ = oryUIValue$
		elseif (oryUIVariable$ = "enabledtextalignment")
			if (lower(oryUIValue$) = "left")
				oryUIParameters.enabledTextAlignment = 0
			elseif (lower(oryUIValue$) = "center" or lower(oryUIValue$) = "centre")
				oryUIParameters.enabledTextAlignment = 1
			elseif (lower(oryUIValue$) = "right")
				oryUIParameters.enabledTextAlignment = 2
			endif
		elseif (oryUIVariable$ = "enabledtextbold")
			oryUIParameters.enabledTextBold = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "enabledtextcolor" or oryUIVariable$ = "enabledtextcolorid")
			oryUIParameters.enabledTextColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "enabledtextsize")
			oryUIParameters.enabledTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "endy")
			oryUIParameters.endY# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "extended")
			oryUIParameters.extended = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "file")
			oryUIParameters.file$ = oryUIValue$
		elseif (oryUIVariable$ = "fileID")
			oryUIParameters.fileID = val(oryUIValue$)
		elseif (oryUIVariable$ = "fixtoscreen")
			oryUIParameters.fixToScreen = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "flexbuttons")
			oryUIParameters.flexButtons = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "frameshape")
			oryUIParameters.frameShape$ = oryUIValue$
		elseif (oryUIVariable$ = "gripcolor" or oryUIVariable$ = "gripcolorid")
			oryUIParameters.gripColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "gripicon")
			oryUIParameters.gripIcon$ = oryUIValue$
			oryUIParameters.gripIconID = OryUIReturnIconID(oryUIValue$)
		elseif (oryUIVariable$ = "gripiconcolor" or oryUIVariable$ = "gripiconcolorid")
			oryUIParameters.gripIconColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "gripiconid")
			oryUIParameters.gripIconID = val(oryUIValue$)
		elseif (oryUIVariable$ = "gripiconsize")
			oryUIParameters.gripIconSize#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.gripIconSize#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "gripimage")
			oryUIParameters.gripImageID = val(oryUIValue$)
		elseif (oryUIVariable$ = "gripposition")
			oryUIParameters.gripPosition#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.gripPosition#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "gripsize")
			oryUIParameters.gripSize#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.gripSize#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "group")
			oryUIParameters.group = val(oryUIValue$)
		elseif (oryUIVariable$ = "headertext")
			oryUIParameters.headerText$ = oryUIValue$
		elseif (oryUIVariable$ = "headertextalignment")
			if (lower(oryUIValue$) = "left")
				oryUIParameters.headerTextAlignment = 0
			elseif (lower(oryUIValue$) = "center" or lower(oryUIValue$) = "centre")
				oryUIParameters.headerTextAlignment = 1
			elseif (lower(oryUIValue$) = "right")
				oryUIParameters.headerTextAlignment = 2
			endif
		elseif (oryUIVariable$ = "headertextbold")
			oryUIParameters.headerTextBold = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "headertextcolor" or oryUIVariable$ = "headertextcolorid")
			oryUIParameters.headerTextColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "headertextsize")
			oryUIParameters.headerTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "helpertext")
			oryUIParameters.helperText$ = oryUIValue$
		elseif (oryUIVariable$ = "height")
			oryUIParameters.size#[2] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "helpertextbold")
			oryUIParameters.helperTextBold = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "helpertextcolor" or oryUIVariable$ = "helpertextcolorid")
			oryUIParameters.helperTextColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "helpertextsize")
			oryUIParameters.helperTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "icon")
			oryUIParameters.icon$ = oryUIValue$
			oryUIParameters.iconID = OryUIReturnIconID(oryUIValue$)
		elseif (oryUIVariable$ = "iconcolor" or oryUIVariable$ = "iconcolorid")
			oryUIParameters.iconColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "iconid")
			oryUIParameters.iconID = val(oryUIValue$)
		elseif (oryUIVariable$ = "iconplacement")
			oryUIParameters.iconPlacement$ = oryUIValue$
		elseif (oryUIVariable$ = "iconsize")
			oryUIParameters.iconSize#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.iconSize#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "image")
			oryUIParameters.imageID = val(oryUIValue$)
		elseif (oryUIVariable$ = "inactivebuttoncolor" or oryUIVariable$ = "inactivebuttoncolorid")
			oryUIParameters.inactiveButtonColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "inactivecolor" or oryUIVariable$ = "inactivecolorid")
			oryUIParameters.inactiveColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "inactiveiconcolor" or oryUIVariable$ = "inactiveiconcolorid")
			oryUIParameters.inactiveIconColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "inactivetextbold")
			oryUIParameters.inactiveTextBold = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "inactivetextcolor" or oryUIVariable$ = "inactivetextcolorid")
			oryUIParameters.inactiveTextColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "inactivetextsize")
			oryUIParameters.inactiveTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "index")
			oryUIParameters.index = val(oryUIValue$)
		elseif (oryUIVariable$ = "indicatorcolor" or oryUIVariable$ = "indicatorcolorid")
			oryUIParameters.indicatorColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "inputtext")
			oryUIParameters.inputText$ = oryUIValue$
		elseif (oryUIVariable$ = "inputtype")
			oryUIParameters.inputType$ = oryUIValue$
		elseif (oryUIVariable$ = "invisiblegripsize")
			oryUIParameters.invisibleGripSize#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.invisibleGripSize#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "itemheight")
			oryUIParameters.itemSize#[2] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "itemsize")
			oryUIParameters.itemSize#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.itemSize#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "itemtype")
			oryUIParameters.itemType$ = oryUIValue$
		elseif (oryUIVariable$ = "itemwidth")
			oryUIParameters.itemSize#[1] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "labeltext")
			oryUIParameters.labelText$ = oryUIValue$
		elseif (oryUIVariable$ = "leadingicon")
			oryUIParameters.leadingIcon$ = oryUIValue$
			oryUIParameters.leadingIconID = OryUIReturnIconID(oryUIValue$)
		elseif (oryUIVariable$ = "lefticon")
			oryUIParameters.leftIcon$ = oryUIValue$
			oryUIParameters.leftIconID = OryUIReturnIconID(oryUIValue$)
		elseif (oryUIVariable$ = "lefticoncolor" or oryUIVariable$ = "lefticoncolorid")
			oryUIParameters.leftIconColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "lefticonid")
			oryUIParameters.leftIconID = val(oryUIValue$)
		elseif (oryUIVariable$ = "lefttext")
			oryUIParameters.leftText$ = oryUIValue$
		elseif (oryUIVariable$ = "lefttextbold")
			oryUIParameters.leftTextBold = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "lefttextcolor" or oryUIVariable$ = "lefttextcolorid")
			oryUIParameters.leftTextColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "lefttextsize")
			oryUIParameters.leftTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "leftline1text")
			oryUIParameters.leftLine1Text$ = oryUIValue$
		elseif (oryUIVariable$ = "leftline1textbold")
			oryUIParameters.leftLine1TextBold = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "leftline1textcolor" or oryUIVariable$ = "leftline1textcolorid")
			oryUIParameters.leftLine1TextColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "leftline1textsize")
			oryUIParameters.leftLine1TextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "leftline2text")
			oryUIParameters.leftLine2Text$ = oryUIValue$
		elseif (oryUIVariable$ = "leftline2textbold")
			oryUIParameters.leftLine2TextBold = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "leftline2textcolor" or oryUIVariable$ = "leftline2textcolorid")
			oryUIParameters.leftLine2TextColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "leftline2textsize")
			oryUIParameters.leftLine2TextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "leftthumbnailimage")
			oryUIParameters.leftThumbnailImageID = val(oryUIValue$)
		elseif (oryUIVariable$ = "max")
			oryUIParameters.max# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "maxbuttonstodisplay")
			oryUIParameters.maxButtonsToDisplay = val(oryUIValue$)
		elseif (oryUIVariable$ = "maxlength")
			oryUIParameters.maxLength = val(oryUIValue$)
		elseif (oryUIVariable$ = "maxposition")
			oryUIParameters.maxPosition#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.maxPosition#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "maxview")
			oryUIParameters.maxView#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.maxView#[2] = valFloat(GetStringToken(oryUIValue$, ",", 1))
		elseif (oryUIVariable$ = "maxviewx")
			oryUIParameters.maxView#[1] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "maxviewy")
			oryUIParameters.maxView#[2] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "maxx")
			oryUIParameters.maxPosition#[1] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "maxy")
			oryUIParameters.maxPosition#[2] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "maxzoom")
			oryUIParameters.maxZoom# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "min")
			oryUIParameters.min# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "mingripsize")
			oryUIParameters.minGripSize#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.minGripSize#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "mini")
			oryUIParameters.mini = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "minposition")
			oryUIParameters.minPosition#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.minPosition#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "minview")
			oryUIParameters.minView#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.minView#[2] = valFloat(GetStringToken(oryUIValue$, ",", 1))
		elseif (oryUIVariable$ = "minviewx")
			oryUIParameters.minView#[1] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "minviewy")
			oryUIParameters.minView#[2] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "minx")
			oryUIParameters.minPosition#[1] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "miny")
			oryUIParameters.minPosition#[2] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "multiline")
			oryUIParameters.multiline = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "name")
			oryUIParameters.name$ = oryUIValue$
		elseif (oryUIVariable$ = "navigationicon")
			oryUIParameters.navigationIcon$ = oryUIValue$
			oryUIParameters.navigationIconID = OryUIReturnIconID(oryUIValue$)
		elseif (oryUIVariable$ = "navigationiconcolor" or oryUIVariable$ = "navigationiconcolorid")
			oryUIParameters.navigationIconColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "navigationiconid")
			oryUIParameters.navigationIconID = val(oryUIValue$)
		elseif (oryUIVariable$ = "navigationname")
			oryUIParameters.navigationName$ = oryUIValue$
		elseif (oryUIVariable$ = "noofleftlines")
			oryUIParameters.noOfLeftLines = val(oryUIValue$)
		elseif (oryUIVariable$ = "noofpages")
			oryUIParameters.noOfPages = val(oryUIValue$)
		elseif (oryUIVariable$ = "noofrightlines")
			oryUIParameters.noOfRightLines = val(oryUIValue$)	
		elseif (oryUIVariable$ = "offset")
			if (lower(oryUIValue$) = "topleft")
				oryUIParameters.offsetTopLeft = 1
			elseif (lower(oryUIValue$) = "topcenter" or lower(oryUIValue$) = "topcentre")
				oryUIParameters.offsetTopCenter = 1
			elseif (lower(oryUIValue$) = "topright")
				oryUIParameters.offsetTopRight = 1
			elseif (lower(oryUIValue$) = "centerleft" or lower(oryUIValue$) = "centreleft" or lower(oryUIValue$) = "middleleft")
				oryUIParameters.offsetCenterLeft = 1
			elseif (lower(oryUIValue$) = "center" or lower(oryUIValue$) = "centre" or lower(oryUIValue$) = "middle")
				oryUIParameters.offsetCenter = 1
			elseif (lower(oryUIValue$) = "centerright" or lower(oryUIValue$) = "centreright" or lower(oryUIValue$) = "middleright")
				oryUIParameters.offsetCenterRight = 1
			elseif (lower(oryUIValue$) = "bottomleft")
				oryUIParameters.offsetBottomLeft = 1
			elseif (lower(oryUIValue$) = "bottomcenter" or lower(oryUIValue$) = "bottomcentre")
				oryUIParameters.offsetBottomCenter = 1
			elseif (lower(oryUIValue$) = "bottomright")
				oryUIParameters.offsetBottomRight = 1
			else
				oryUIParameters.offset#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.offset#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
			endif
		elseif (oryUIVariable$ = "placeholdertext")
			oryUIParameters.placeholderText$ = oryUIValue$
		elseif (oryUIVariable$ = "placement")
			oryUIParameters.placement$ = oryUIValue$
		elseif (oryUIVariable$ = "placementoffset")
			oryUIParameters.placementOffset#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.placementOffset#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "platformstyle")
			oryUIParameters.platformStyle$ = oryUIValue$
		elseif (oryUIVariable$ = "position")
			oryUIParameters.position#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.position#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "postdata")
			oryUIParameters.postData$ = oryUIValue$
		elseif (oryUIVariable$ = "progresstype")
			oryUIParameters.progressType$ = oryUIValue$
		elseif (oryUIVariable$ = "righticon")
			oryUIParameters.rightIcon$ = oryUIValue$
			oryUIParameters.rightIconID = OryUIReturnIconID(oryUIValue$)
		elseif (oryUIVariable$ = "righticoncolor" or oryUIVariable$ = "righticoncolorid")
			oryUIParameters.rightIconColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "righticonid")
			oryUIParameters.rightIconID = val(oryUIValue$)
		elseif (oryUIVariable$ = "righttext")
			oryUIParameters.rightText$ = oryUIValue$
		elseif (oryUIVariable$ = "righttextbold")
			oryUIParameters.rightTextBold = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "righttextcolor" or oryUIVariable$ = "righttextcolorid")
			oryUIParameters.rightTextColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "righttextsize")
			oryUIParameters.rightTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "rightline1text")
			oryUIParameters.rightLine1Text$ = oryUIValue$
		elseif (oryUIVariable$ = "rightline1textbold")
			oryUIParameters.rightLine1TextBold = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "rightline1textcolor" or oryUIVariable$ = "rightline1textcolorid")
			oryUIParameters.rightLine1TextColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "rightline1textsize")
			oryUIParameters.rightLine1TextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "rightline2text")
			oryUIParameters.rightLine2Text$ = oryUIValue$
		elseif (oryUIVariable$ = "rightline2textbold")
			oryUIParameters.rightLine2TextBold = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "rightline2textcolor" or oryUIVariable$ = "rightline2textcolorid")
			oryUIParameters.rightLine2TextColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "rightline2textsize")
			oryUIParameters.rightLine2TextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "savetext")
			oryUIParameters.saveText$ = oryUIValue$
		elseif (oryUIVariable$ = "scrimcolor" or oryUIVariable$ = "scrimcolorid")
			oryUIParameters.scrimColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "script")
			oryUIParameters.script$ = oryUIValue$
		elseif (oryUIVariable$ = "scrollable")
			oryUIParameters.scrollable = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "scrolltype")
			oryUIParameters.scrollType$ = oryUIValue$
		elseif (oryUIVariable$ = "selected")
			oryUIParameters.selected = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "selectedcolor" or oryUIVariable$ = "selectedcolorid")
			oryUIParameters.selectedColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "selectediconcolor" or oryUIVariable$ = "selectediconcolorid")
			oryUIParameters.selectedIconColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "selectedtextbold")
			oryUIParameters.selectedTextBold = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "selectedtextcolor" or oryUIVariable$ = "selectedtextcolorid")
			oryUIParameters.selectedTextColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "selectedtextsize")
			oryUIParameters.selectedTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "shadow")
			oryUIParameters.shadow = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "showcheckbox")
			oryUIParameters.showCheckbox = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "showgripicon")
			oryUIParameters.showGripIcon = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "showhelpertext")
			oryUIParameters.showHelperText = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "showicon")
			oryUIParameters.showIcon = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "showitemdivider")
			oryUIParameters.showItemDivider = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "showleadingicon")
			oryUIParameters.showLeadingIcon = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "showlefticon")
			oryUIParameters.showLeftIcon = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "showleftthumbnail")
			oryUIParameters.showLeftThumbnail = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "showrightbutton")
			oryUIParameters.showRightButton = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "showrighticon")
			oryUIParameters.showRightIcon = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "showrighttext")
			oryUIParameters.showRightText = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "showshadow")
			oryUIParameters.showShadow = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "showskiptoendbuttons")
			oryUIParameters.showSkipToEndButtons = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "showtrailingicon")
			oryUIParameters.showTrailingIcon = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "size")
			oryUIParameters.size#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.size#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "spriteshader")
			oryUIParameters.spriteShader = val(oryUIValue$)
		elseif (oryUIVariable$ = "stackbuttons")
			oryUIParameters.stackButtons = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "starty")
			oryUIParameters.startY# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "step")
			oryUIParameters.step# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "stickuntilcomplete")
			oryUIParameters.stickUntilComplete = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "string")
			oryUIParameters.text$ = oryUIValue$
		elseif (oryUIVariable$ = "strokecolor" or oryUIVariable$ = "strokecolorid")
			oryUIParameters.strokeColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "style")
			oryUIParameters.style$ = oryUIValue$
		elseif (oryUIVariable$ = "subtitletext")
			oryUIParameters.subtitleText$ = oryUIValue$
		elseif (oryUIVariable$ = "subtitletextalignment")
			if (lower(oryUIValue$) = "left")
				oryUIParameters.subtitleTextAlignment = 0
			elseif (lower(oryUIValue$) = "center" or lower(oryUIValue$) = "centre")
				oryUIParameters.subtitleTextAlignment = 1
			elseif (lower(oryUIValue$) = "right")
				oryUIParameters.subtitleTextAlignment = 2
			endif
		elseif (oryUIVariable$ = "subtitletextbold")
			oryUIParameters.subtitleTextBold = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "subtitletextcolor" or oryUIVariable$ = "subtitletextcolorid")
			oryUIParameters.subtitleTextColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "subtitletextsize")
			oryUIParameters.subtitleTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "subtracticon")
			oryUIParameters.subtractIcon$ = oryUIValue$
			oryUIParameters.subtractIconID = OryUIReturnIconID(oryUIValue$)
		elseif (oryUIVariable$ = "subtracticoncolor" or oryUIVariable$ = "subtracticoncolorid")
			oryUIParameters.subtractIconColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "subtracticonid")
			oryUIParameters.subtractIconID = val(oryUIValue$)
		elseif (oryUIVariable$ = "subtracticonsize")
			oryUIParameters.subtractIconSize#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.subtractIconSize#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "supportingtext")
			oryUIParameters.supportingText$ = oryUIValue$
		elseif (oryUIVariable$ = "supportingtextalignment")
			if (lower(oryUIValue$) = "left")
				oryUIParameters.supportingTextAlignment = 0
			elseif (lower(oryUIValue$) = "center" or lower(oryUIValue$) = "centre")
				oryUIParameters.supportingTextAlignment = 1
			elseif (lower(oryUIValue$) = "right")
				oryUIParameters.supportingTextAlignment = 2
			endif
		elseif (oryUIVariable$ = "supportingtextbold")
			oryUIParameters.supportingTextBold = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "supportingtextcolor" or oryUIVariable$ = "supportingtextcolorid")
			oryUIParameters.supportingTextColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "supportingtextsize")
			oryUIParameters.supportingTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "switchcheckedcolor" or oryUIVariable$ = "switchcheckedcolorid")
			oryUIParameters.switchCheckedColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "switchcheckedimage")
			oryUIParameters.switchCheckedImageID = val(oryUIValue$)
		elseif (oryUIVariable$ = "switchimage")
			oryUIParameters.switchImageID = val(oryUIValue$)
		elseif (oryUIVariable$ = "switchuncheckedimage")
			oryUIParameters.switchUncheckedImageID = val(oryUIValue$)
		elseif (oryUIVariable$ = "switchsize")
			oryUIParameters.switchSize#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.switchSize#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "switchuncheckedcolor" or oryUIVariable$ = "switchuncheckedcolorid")
			oryUIParameters.switchUncheckedColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "text")
			oryUIParameters.text$ = oryUIValue$
		elseif (oryUIVariable$ = "textalignment")
			if (lower(oryUIValue$) = "left")
				oryUIParameters.textAlignment = 0
			elseif (lower(oryUIValue$) = "center" or lower(oryUIValue$) = "centre")
				oryUIParameters.textAlignment = 1
			elseif (lower(oryUIValue$) = "right")
				oryUIParameters.textAlignment = 2
			endif
		elseif (oryUIVariable$ = "textbold")
			oryUIParameters.textBold = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "textcolor" or oryUIVariable$ = "textcolorid")
			oryUIParameters.textColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "textsize")
			oryUIParameters.textSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "timeout")
			oryUIParameters.timeout = val(oryUIValue$)
		elseif (oryUIVariable$ = "titletext")
			oryUIParameters.titleText$ = oryUIValue$
		elseif (oryUIVariable$ = "titletextalignment")
			if (lower(oryUIValue$) = "left")
				oryUIParameters.titleTextAlignment = 0
			elseif (lower(oryUIValue$) = "center" or lower(oryUIValue$) = "centre")
				oryUIParameters.titleTextAlignment = 1
			elseif (lower(oryUIValue$) = "right")
				oryUIParameters.titleTextAlignment = 2
			endif
		elseif (oryUIVariable$ = "titletextbold")
			oryUIParameters.titleTextBold = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "titletextcolor" or oryUIVariable$ = "titletextcolorid")
			oryUIParameters.titleTextColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "titletextsize")
			oryUIParameters.titleTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "trackcheckedcolor" or oryUIVariable$ = "trackcheckedcolorid")
			oryUIParameters.trackCheckedColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "trackcolor" or oryUIVariable$ = "trackcolorid")
			oryUIParameters.trackColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "trackcheckedimage")
			oryUIParameters.trackCheckedImageID = val(oryUIValue$)
		elseif (oryUIVariable$ = "trackimage")
			oryUIParameters.trackImageID = val(oryUIValue$)
		elseif (oryUIVariable$ = "trackuncheckedimage")
			oryUIParameters.trackUncheckedImageID = val(oryUIValue$)
		elseif (oryUIVariable$ = "trackposition")
			oryUIParameters.trackPosition#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.trackPosition#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "tracksize")
			oryUIParameters.trackSize#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.trackSize#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "trackuncheckedcolor" or oryUIVariable$ = "trackuncheckedcolorid")
			oryUIParameters.trackUncheckedColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "trailingicon")
			oryUIParameters.trailingIcon$ = oryUIValue$
			oryUIParameters.trailingIconID = OryUIReturnIconID(oryUIValue$)
		elseif (oryUIVariable$ = "uncheckedcolor" or oryUIVariable$ = "uncheckedcolorid")
			oryUIParameters.uncheckedColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "uncheckedimageid")
			oryUIParameters.uncheckedImageID = val(oryUIValue$)
		elseif (oryUIVariable$ = "unselectedcolor" or oryUIVariable$ = "unselectedcolorid")
			oryUIParameters.unselectedColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "unselectediconcolor" or oryUIVariable$ = "unselectediconcolorid")
			oryUIParameters.unselectedIconColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "unselectedtextbold")
			oryUIParameters.unselectedTextBold = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "unselectedtextcolor" or oryUIVariable$ = "unselectedtextcolorid")
			oryUIParameters.unselectedTextColor# = OryUIConvertColor(oryUIValue$)
		elseif (oryUIVariable$ = "unselectedtextsize")
			oryUIParameters.unselectedTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "widget")
			oryUIParameters.widget$ = lower(oryUIValue$)
		elseif (oryUIVariable$ = "width")
			oryUIParameters.size#[1] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "wraplist")
			oryUIParameters.wrapList = OryUIConvertBoolean(oryUIValue$)
		elseif (oryUIVariable$ = "wraplistbottomy")
			oryUIParameters.wrapListBottomY# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "wraplisttopy")
			oryUIParameters.wrapListTopY# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "x")
			oryUIParameters.position#[1] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "y")
			oryUIParameters.position#[2] = valFloat(oryUIValue$)
		endif
	next	
endfunction

function OryUISetSyncRate(oryUISyncRate# as float, oryUIMode as integer)
	SetSyncRate(oryUISyncRate#, oryUIMode)
	oryUIMaxSyncRate# = oryUISyncRate#
endfunction

function OryUISync()
	OryUIEndTrackingTouch()
	UpdateAllTweens(GetFrameTime())
	Sync()
	OryUIStartTrackingTouch()
endfunction

foldend
