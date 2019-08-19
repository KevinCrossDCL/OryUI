/*
 * OryUI
 * 
 * OryUI is a UI framework to be used with AGK2 (AppGameKit)
 * 
 * 	Author	: Kevin Cross
 * 	License	: MIT
 */
 
// OryUI (Updated 19/08/2019)

foldstart

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
	
	// OryUIProgressIndicator
	progressIndicatorAnimationFPS as integer
	progressIndicatorAnimationFrame as integer[101]
	progressIndicatorColor# as float[4]
	progressIndicatorTrackColor# as float[4]
	progressIndicatorTrackHeight# as float
	progressIndicatorTrackWidth# as float

	// OryUIScrollToTop
	scrollToTopColor# as float[4]
	scrollToTopDepth as integer
	scrollToTopHeight# as integer
	scrollToTopIconColor# as float[4]
	scrollToTopIconHeight# as float
	scrollToTopIconImage as integer
	scrollToTopIconWidth# as float
	scrollToTopPlacement$ as string
	scrollToTopShowShadow as integer
	scrollToTopStartY# as float
	scrollToTopWidth# as float

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

type typeoryUIParameters
	activeButtonColor# as float[4]
	activeColor# as float[4]
	activeIconColor# as float[4]
	addIcon$ as string
	addIconColor# as float[4]
	addIconID as integer
	addIconSize# as float[2]
	addToFront as integer
	alignment as integer
	angle# as float
	attachToSpriteID as integer
	autoCorrectIfOutOfRange as integer
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
	checkedImageID as integer
	color# as float[4]
	decimals as integer
	decisionRequired as integer
	defaultValue# as float
	delay# as float
	depth as integer
	dialogType$ as string
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
	domain$ as string					
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
	extended as integer
	file$ as string
	fileID as integer
	fixToscreen as integer
	flexButtons as integer
	frameShape$ as String
	group as integer
	headerText$ as string
	headerTextAlignment as integer
	headerTextBold as integer
	headerTextColor# as float[4]
	headerTextSize# as float
	helperText$ as String
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
	itemHeight# as float
	itemSize# as float[2]
	itemType$ as string
	labelText$ as string
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
	maxZoom# as float
	min# as float
	mini as integer
	minPosition# as float[2]
	name$ as String
	navigationIcon$ as string
	navigationIconColor# as float[4]
	navigationIconID as integer
	navigationName$ as string
	noOfLeftLines as integer
	noOfPages as integer
	noOfRightLines as integer
	offset# as float[2]
	offsetCenter as integer
	placement$ as string
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
	showHelperText as integer
	showIcon as integer
	showLeftIcon as integer
	showLeftThumbnail as integer
	showRightIcon as integer
	showRightText as integer
	showShadow as integer
	showSkipToEndButtons as integer
	size# as float[2]
	spriteShader as integer
	ssl as integer
	stackButtons as integer
	startY# as float
	step# as float
	stickUntilComplete as integer
	strokeColor# as float[4]
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
	trackColor# as float[4]
	uncheckedImageID as integer
	unselectedColor# as float[4]
	unselectedIconColor# as float[4]
	unselectedTextBold as integer
	unselectedTextColor# as float[4]
	unselectedTextSize# as float
endtype

foldend


foldstart

global oryUIBlockScreenScrolling as integer
global oryUIBottomBannerAdOnScreen as integer
global oryUIContentHeight# as float 			// NOT YET USED
global oryUIContentStartX# as float				// NOT YET USED
global oryUIContentStartY# as float				// NOT YET USED
global oryUIContentWidth# as float				// NOT YET USED
global oryUIDefaults as typeOryUIDefaults
global oryUIDialogVisible as integer
global oryUIParameters as typeoryUIParameters
global oryUIScrimDepth as integer
global oryUIScrimVisible as integer
global oryUIStatusBarHeight# as float : oryUIStatusBarHeight# = 3.6

foldend


foldstart

function OryUIAddToContentHeight(oryUIHeight# as float)
	oryUIContentHeight# = oryUIContentHeight# + oryUIHeight#
endfunction

function OryUIResetParametersType()
	oryUIParameters.addIcon$ = ""
	oryUIParameters.addIconID = -999999
	oryUIParameters.addToFront = -999999
	oryUIParameters.alignment = -999999
	oryUIParameters.angle# = -999999
	oryUIParameters.attachToSpriteID = -999999
	oryUIParameters.autoCorrectIfOutOfRange = -999999
	oryUIParameters.autoHeight = -999999
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
	oryUIParameters.disabledIcon$ = ""
	oryUIParameters.disabledIconID = -999999
	oryUIParameters.disabledIconPlacement$ = ""
	oryUIParameters.disabledImageID = -999999
	oryUIParameters.disabledText$ = ""
	oryUIParameters.disabledTextAlignment = -999999
	oryUIParameters.disabledTextBold = -999999
	oryUIParameters.disabledTextSize# = -999999
	oryUIParameters.domain$ = ""
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
	oryUIParameters.extended = -999999
	oryUIParameters.file$ = ""
	oryUIParameters.fileID = -999999
	oryUIParameters.fixToscreen = -999999
	oryUIParameters.flexButtons = -999999
	oryUIParameters.frameShape$ = ""
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
	oryUIParameters.name$ = ""
	oryUIParameters.navigationIcon$ = ""
	oryUIParameters.navigationIconID = -999999
	oryUIParameters.navigationName$ = ""
	oryUIParameters.noOfLeftLines = -999999
	oryUIParameters.noOfPages = -999999
	oryUIParameters.noOfRightLines = -999999
	oryUIParameters.offsetCenter = -999999
	oryUIParameters.placement$ = ""
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
	oryUIParameters.selected = -999999
	oryUIParameters.selectedTextBold = -999999
	oryUIParameters.selectedTextSize# = -999999	
	oryUIParameters.shadow = -999999
	oryUIParameters.showCheckbox = -999999
	oryUIParameters.showIcon = -999999
	oryUIParameters.showLeftIcon = -999999
	oryUIParameters.showLeftThumbnail = -999999
	oryUIParameters.showRightIcon = -999999
	oryUIParameters.showRightText = -999999
	oryUIParameters.showShadow = -999999
	oryUIParameters.showSkipToEndButtons = -999999
	oryUIParameters.spriteShader = -999999
	oryUIParameters.ssl = -999999
	oryUIParameters.stackButtons = -999999
	oryUIParameters.startY# = -999999
	oryUIParameters.step# = -999999
	oryUIParameters.stickUntilComplete = -999999
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
	oryUIParameters.text$ = ""
	oryUIParameters.textAlignment = -999999
	oryUIParameters.textBold = -999999
	oryUIParameters.textSize# = -999999
	oryUIParameters.timeout = -999999
	oryUIParameters.titleText$ = ""
	oryUIParameters.titleTextAlignment = -999999
	oryUIParameters.titleTextBold = -999999
	oryUIParameters.titleTextSize# = -999999
	oryUIParameters.uncheckedImageID = -999999
	oryUIParameters.unselectedTextBold = -999999
	oryUIParameters.unselectedTextSize# = -999999	
	for i = 1 to 4
		if (i < 3)
			oryUIParameters.addIconSize#[i] = -999999
			oryUIParameters.disabledIconSize#[i] = -999999
			oryUIParameters.enabledIconSize#[i] = -999999
			oryUIParameters.iconSize#[i] = -999999
			oryUIParameters.itemSize#[i] = -999999
			oryUIParameters.maxPosition#[i] = -999999
			oryUIParameters.minPosition#[i] = -999999
			oryUIParameters.offset#[i] = -999999
			oryUIParameters.position#[i] = -999999
			oryUIParameters.size#[i] = -999999
			oryUIParameters.subtractIconSize#[i] = -999999
		endif
		oryUIParameters.activeButtonColor#[i] = -999999
		oryUIParameters.activeColor#[i] = -999999
		oryUIParameters.activeIconColor#[i] = -999999
		oryUIParameters.addIconColor#[i] = -999999
		oryUIParameters.backgroundColor#[i] = -999999
		oryUIParameters.checkboxColor#[i] = -999999
		oryUIParameters.checkboxTextColor#[i] = -999999
		oryUIParameters.color#[i] = -999999
		oryUIParameters.disabledColor#[i] = -999999
		oryUIParameters.disabledIconColor#[i] = -999999
		oryUIParameters.disabledTextColor#[i] = -999999
		oryUIParameters.enabledColor#[i] = -999999
		oryUIParameters.enabledIconColor#[i] = -999999
		oryUIParameters.enabledTextColor#[i] = -999999
		oryUIParameters.headerTextColor#[i] = -999999
		oryUIParameters.helperTextColor#[i] = -999999
		oryUIParameters.iconColor#[i] = -999999
		oryUIParameters.inactiveButtonColor#[i] = -999999
		oryUIParameters.inactiveColor#[i] = -999999
		oryUIParameters.inactiveIconColor#[i] = -999999
		oryUIParameters.inactiveTextColor#[i] = -999999
		oryUIParameters.indicatorColor#[i] = -999999
		oryUIParameters.leftIconColor#[i] = -999999
		oryUIParameters.leftLine1TextColor#[i] = -999999
		oryUIParameters.leftLine2TextColor#[i] = -999999
		oryUIParameters.leftTextColor#[i] = -999999
		oryUIParameters.navigationIconColor#[i] = -999999
		oryUIParameters.rightIconColor#[i] = -999999
		oryUIParameters.rightLine1TextColor#[i] = -999999
		oryUIParameters.rightLine2TextColor#[i] = -999999
		oryUIParameters.rightTextColor#[i] = -999999
		oryUIParameters.scrimColor#[i] = -999999
		oryUIParameters.selectedColor#[i] = -999999
		oryUIParameters.selectedIconColor#[i] = -999999
		oryUIParameters.selectedTextColor#[i] = -999999
		oryUIParameters.strokeColor#[i] = -999999
		oryUIParameters.subtitleTextColor#[i] = -999999
		oryUIParameters.subtractIconColor#[i] = -999999
		oryUIParameters.supportingTextColor#[i] = -999999
		oryUIParameters.textColor#[i] = -999999
		oryUIParameters.titleTextColor#[i] = -999999
		oryUIParameters.trackColor#[i] = -999999
		oryUIParameters.unselectedColor#[i] = -999999
		oryUIParameters.unselectedIconColor#[i] = -999999
		oryUIParameters.unselectedTextColor#[i] = -999999
	next
endfunction

function OryUIReturnIconID(oryUIIcon$ as string)
	local oryUIIconID as integer
	oryUIIconID = -999999
	if (lower(oryUIIcon$) = "add") then oryUIIconID = oryUIIconAddImage
	if (lower(oryUIIcon$) = "back") then oryUIIconID = oryUIIconBackImage
	if (lower(oryUIIcon$) = "camera") then oryUIIconID = oryUIIconCameraImage
	if (lower(oryUIIcon$) = "menu") then oryUIIconID = oryUIIconMenuImage
	if (lower(oryUIIcon$) = "profile") then oryUIIconID = oryUIIconProfileImage
	if (lower(oryUIIcon$) = "refresh") then oryUIIconID = oryUIIconRefreshImage
	if (lower(oryUIIcon$) = "save") then oryUIIconID = oryUIIconSaveImage
	if (lower(oryUIIcon$) = "scrolltotop") then oryUIIconID = oryUIIconScrollToTopImage
	if (lower(oryUIIcon$) = "share") then oryUIIconID = oryUIIconShareImage
	if (lower(oryUIIcon$) = "subtract") then oryUIIconID = oryUIIconSubtractImage
endfunction oryUIIconID

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
		if (oryUIVariable$ = "activebuttoncolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.activeButtonColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.activeButtonColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.activeButtonColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.activeButtonColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "activebuttoncolorid")
			oryUIActiveButtonColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.activeButtonColor#[1] = GetColorRed(oryUIActiveButtonColorID)
			oryUIParameters.activeButtonColor#[2] = GetColorGreen(oryUIActiveButtonColorID)
			oryUIParameters.activeButtonColor#[3] = GetColorBlue(oryUIActiveButtonColorID)
			oryUIParameters.activeButtonColor#[4] = 255
		elseif (oryUIVariable$ = "activecolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.activeColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.activeColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.activeColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.activeColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "activecolorid")
			oryUIActiveColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.activeColor#[1] = GetColorRed(oryUIActiveColorID)
			oryUIParameters.activeColor#[2] = GetColorGreen(oryUIActiveColorID)
			oryUIParameters.activeColor#[3] = GetColorBlue(oryUIActiveColorID)
			oryUIParameters.activeColor#[4] = 255
		elseif (oryUIVariable$ = "activeiconcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.activeIconColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.activeIconColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.activeIconColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.activeIconColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "activeiconcolorid")
			oryUIActiveIconColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.activeIconColor#[1] = GetColorRed(oryUIActiveIconColorID)
			oryUIParameters.activeIconColor#[2] = GetColorGreen(oryUIActiveIconColorID)
			oryUIParameters.activeIconColor#[3] = GetColorBlue(oryUIActiveIconColorID)
			oryUIParameters.activeIconColor#[4] = 255
		elseif (oryUIVariable$ = "addicon")
			oryUIParameters.addIcon$ = oryUIValue$
			oryUIParameters.addIconID = OryUIReturnIconID(oryUIValue$)
		elseif (oryUIVariable$ = "addiconcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.addIconColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.addIconColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.addIconColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.addIconColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "addiconcolorid")
			oryUIAddIconColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.addIconColor#[1] = GetColorRed(oryUIAddIconColorID)
			oryUIParameters.addIconColor#[2] = GetColorGreen(oryUIAddIconColorID)
			oryUIParameters.addIconColor#[3] = GetColorBlue(oryUIAddIconColorID)
			oryUIParameters.addIconColor#[4] = 255
		elseif (oryUIVariable$ = "addiconid")
			oryUIParameters.addIconID = val(oryUIValue$)
		elseif (oryUIVariable$ = "addiconsize")
			oryUIParameters.addIconSize#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.addIconSize#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "addtofront")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.addToFront = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.addToFront = 0
			endif
		elseif (oryUIVariable$ = "alignment")
			if (oryUIValue$ = "left")
				oryUIParameters.alignment = 0
			elseif (oryUIValue$ = "center" or oryUIValue$ = "centre")
				oryUIParameters.alignment = 1
			elseif (oryUIValue$ = "right")
				oryUIParameters.alignment = 2
			endif
		elseif (oryUIVariable$ = "alpha")
			oryUIParameters.color#[4] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "angle")
			oryUIParameters.angle# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "attachtospriteid")
			oryUIParameters.attachToSpriteID = val(oryUIValue$)
		elseif (oryUIVariable$ = "autocorrectifoutofrange")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.autoCorrectIfOutOfRange = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.autoCorrectIfOutOfRange = 0
			endif
		elseif (oryUIVariable$ = "autoheight")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.autoHeight = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.autoHeight = 0
			endif
		elseif (oryUIVariable$ = "backgroundcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.backgroundColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.backgroundColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.backgroundColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.backgroundColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "backgroundcolorid")
			oryUIBackgroundColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.backgroundColor#[1] = GetColorRed(oryUIBackgroundColorID)
			oryUIParameters.backgroundColor#[2] = GetColorGreen(oryUIBackgroundColorID)
			oryUIParameters.backgroundColor#[3] = GetColorBlue(oryUIBackgroundColorID)
			oryUIParameters.backgroundColor#[4] = 255
		elseif (OryUIVariable$ = "blockorder")
			for oryUIForJ = 1 to CountStringTokens(oryUIValue$, ",")
				oryUIParameters.blockOrder$.insert(GetStringToken(oryUIComponentParameters$, ",", oryUIForJ))
			next
		elseif (oryUIVariable$ = "bold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.bold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.bold = 0
			endif
		elseif (oryUIVariable$ = "buttonmargin")
			oryUIParameters.buttonMargin# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "canceltext")
			oryUIParameters.cancelText$ = oryUIValue$
		elseif (oryUIVariable$ = "checkboxcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.checkboxColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.checkboxColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.checkboxColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.checkboxColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "checkboxcolorid")
			oryUICheckboxColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.checkboxColor#[1] = GetColorRed(oryUICheckboxColorID)
			oryUIParameters.checkboxColor#[2] = GetColorGreen(oryUICheckboxColorID)
			oryUIParameters.checkboxColor#[3] = GetColorBlue(oryUICheckboxColorID)
			oryUIParameters.checkboxColor#[4] = 255
		elseif (oryUIVariable$ = "checkboxtext")
			oryUIParameters.checkboxText$ = oryUIValue$
		elseif (oryUIVariable$ = "checkboxtextbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.checkboxTextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.checkboxTextBold = 0
			endif
		elseif (oryUIVariable$ = "checkboxtextcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.checkboxTextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.checkboxTextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.checkboxTextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.checkboxTextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "checkboxtextcolorid")
			oryUICheckboxTextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.checkboxTextColor#[1] = GetColorRed(oryUICheckboxTextColorID)
			oryUIParameters.checkboxTextColor#[2] = GetColorGreen(oryUICheckboxTextColorID)
			oryUIParameters.checkboxTextColor#[3] = GetColorBlue(oryUICheckboxTextColorID)
			oryUIParameters.checkboxTextColor#[4] = 255
		elseif (oryUIVariable$ = "checkboxtextsize")
			oryUIParameters.checkboxTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "checkedimageid")
			oryUIParameters.checkedImageID = val(oryUIValue$)
		elseif (oryUIVariable$ = "color")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.color#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.color#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.color#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.color#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "colorid")
			oryUIColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.color#[1] = GetColorRed(oryUIColorID)
			oryUIParameters.color#[2] = GetColorGreen(oryUIColorID)
			oryUIParameters.color#[3] = GetColorBlue(oryUIColorID)
			oryUIParameters.color#[4] = 255
		elseif (oryUIVariable$ = "decimals")
			oryUIParameters.decimals = val(oryUIValue$)
		elseif (oryUIVariable$ = "decisionrequired")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.decisionRequired = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.decisionRequired = 0
			endif
		elseif (oryUIVariable$ = "defaultvalue")
			oryUIParameters.defaultValue# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "delay")
			oryUIParameters.delay# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "depth")
			oryUIParameters.depth = val(oryUIValue$)
		elseif (oryUIVariable$ = "dialogtype")
			oryUIParameters.dialogType$ = oryUIValue$
		elseif (oryUIVariable$ = "disabledcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.disabledColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.disabledColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.disabledColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.disabledColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "disabledicon")
			oryUIParameters.disabledIcon$ = oryUIValue$
			oryUIParameters.disabledIconID = OryUIReturnIconID(oryUIValue$)
		elseif (oryUIVariable$ = "disablediconcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.disabledIconColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.disabledIconColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.disabledIconColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.disabledIconColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
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
			if (oryUIValue$ = "left")
				oryUIParameters.disabledTextAlignment = 0
			elseif (oryUIValue$ = "center" or oryUIValue$ = "centre")
				oryUIParameters.disabledTextAlignment = 1
			elseif (oryUIValue$ = "right")
				oryUIParameters.disabledTextAlignment = 2
			endif
		elseif (oryUIVariable$ = "disabledtextbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.disabledTextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.disabledTextBold = 0
			endif
		elseif (oryUIVariable$ = "disabledtextcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.disabledTextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.disabledTextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.disabledTextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.disabledTextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "disabledtextcolorid")
			oryUITextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.disabledTextColor#[1] = GetColorRed(oryUITextColorID)
			oryUIParameters.disabledTextColor#[2] = GetColorGreen(oryUITextColorID)
			oryUIParameters.disabledTextColor#[3] = GetColorBlue(oryUITextColorID)
			oryUIParameters.disabledTextColor#[4] = 255
		elseif (oryUIVariable$ = "disabledtextsize")
			oryUIParameters.disabledTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "domain")
			oryUIParameters.domain$ = oryUIValue$
		elseif (oryUIVariable$ = "drawerlocation")
			if (oryUIValue$ = "bottom")
				oryUIParameters.drawerLocation$ = "Bottom"
			elseif (oryUIValue$ = "left")
				oryUIParameters.drawerLocation$ = "Left"
			elseif (oryUIValue$ = "right")
				oryUIParameters.drawerLocation$ = "Right"
			endif
		elseif (oryUIVariable$ = "drawertype")
			oryUIParameters.drawerType$ = oryUIValue$
		elseif (oryUIVariable$ = "enabled")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.enabled = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.enabled = 0
			endif
		elseif (oryUIVariable$ = "enabledcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.enabledColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.enabledColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.enabledColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.enabledColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "enabledicon")
			oryUIParameters.enabledIcon$ = oryUIValue$
			oryUIParameters.enabledIconID = OryUIReturnIconID(oryUIValue$)
		elseif (oryUIVariable$ = "enablediconcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.enabledIconColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.enabledIconColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.enabledIconColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.enabledIconColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
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
			if (oryUIValue$ = "left")
				oryUIParameters.enabledTextAlignment = 0
			elseif (oryUIValue$ = "center" or oryUIValue$ = "centre")
				oryUIParameters.enabledTextAlignment = 1
			elseif (oryUIValue$ = "right")
				oryUIParameters.enabledTextAlignment = 2
			endif
		elseif (oryUIVariable$ = "enabledtextbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.enabledTextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.enabledTextBold = 0
			endif
		elseif (oryUIVariable$ = "enabledtextcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.enabledTextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.enabledTextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.enabledTextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.enabledTextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "enabledtextcolorid")
			oryUITextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.enabledTextColor#[1] = GetColorRed(oryUITextColorID)
			oryUIParameters.enabledTextColor#[2] = GetColorGreen(oryUITextColorID)
			oryUIParameters.enabledTextColor#[3] = GetColorBlue(oryUITextColorID)
			oryUIParameters.enabledTextColor#[4] = 255
		elseif (oryUIVariable$ = "enabledtextsize")
			oryUIParameters.enabledTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "extended")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.extended = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.extended = 0
			endif
		elseif (oryUIVariable$ = "file")
			oryUIParameters.file$ = oryUIValue$
		elseif (oryUIVariable$ = "fileID")
			oryUIParameters.fileID = val(oryUIValue$)
		elseif (oryUIVariable$ = "fixtoscreen")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.fixToScreen = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.fixToScreen = 0
			endif
		elseif (oryUIVariable$ = "flexbuttons")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.flexButtons = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.flexButtons = 0
			endif
		elseif (oryUIVariable$ = "frameshape")
			oryUIParameters.frameShape$ = oryUIValue$
		elseif (oryUIVariable$ = "group")
			oryUIParameters.group = val(oryUIValue$)
		elseif (oryUIVariable$ = "headertext")
			oryUIParameters.headerText$ = oryUIValue$
		elseif (oryUIVariable$ = "headertextalignment")
			if (oryUIValue$ = "left")
				oryUIParameters.headerTextAlignment = 0
			elseif (oryUIValue$ = "center" or oryUIValue$ = "centre")
				oryUIParameters.headerTextAlignment = 1
			elseif (oryUIValue$ = "right")
				oryUIParameters.headerTextAlignment = 2
			endif
		elseif (oryUIVariable$ = "headertextbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.headerTextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.headerTextBold = 0
			endif
		elseif (oryUIVariable$ = "headertextcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.headerTextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.headerTextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.headerTextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.headerTextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "headertextcolorid")
			oryUIHeaderTextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.headerTextColor#[1] = GetColorRed(oryUIHeaderTextColorID)
			oryUIParameters.headerTextColor#[2] = GetColorGreen(oryUIHeaderTextColorID)
			oryUIParameters.headerTextColor#[3] = GetColorBlue(oryUIHeaderTextColorID)
			oryUIParameters.headerTextColor#[4] = 255
		elseif (oryUIVariable$ = "headertextsize")
			oryUIParameters.headerTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "helpertext")
			oryUIParameters.helperText$ = oryUIValue$
		elseif (oryUIVariable$ = "height")
			oryUIParameters.size#[2] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "helpertextbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.helperTextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.helperTextBold = 0
			endif
		elseif (oryUIVariable$ = "helpertextcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.helperTextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.helperTextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.helperTextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.helperTextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "helpertextcolorid")
			oryUIHelperTextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.helperTextColor#[1] = GetColorRed(oryUIHelperTextColorID)
			oryUIParameters.helperTextColor#[2] = GetColorGreen(oryUIHelperTextColorID)
			oryUIParameters.helperTextColor#[3] = GetColorBlue(oryUIHelperTextColorID)
			oryUIParameters.helperTextColor#[4] = 255
		elseif (oryUIVariable$ = "helpertextsize")
			oryUIParameters.helperTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "icon")
			oryUIParameters.icon$ = oryUIValue$
			oryUIParameters.iconID = OryUIReturnIconID(oryUIValue$)
		elseif (oryUIVariable$ = "iconcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.iconColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.iconColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.iconColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.iconColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "iconcolorid")
			oryUIIconColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.iconColor#[1] = GetColorRed(oryUIIconColorID)
			oryUIParameters.iconColor#[2] = GetColorGreen(oryUIIconColorID)
			oryUIParameters.iconColor#[3] = GetColorBlue(oryUIIconColorID)
			oryUIParameters.iconColor#[4] = 255
		elseif (oryUIVariable$ = "iconid")
			oryUIParameters.iconID = val(oryUIValue$)
		elseif (oryUIVariable$ = "iconplacement")
			oryUIParameters.iconPlacement$ = oryUIValue$
		elseif (oryUIVariable$ = "iconsize")
			oryUIParameters.iconSize#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.iconSize#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "image")
			oryUIParameters.imageID = val(oryUIValue$)
		elseif (oryUIVariable$ = "inactivebuttoncolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.inactiveButtonColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.inactiveButtonColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.inactiveButtonColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.inactiveButtonColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "inactivebuttoncolorid")
			oryUIInactiveButtonColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.inactiveButtonColor#[1] = GetColorRed(oryUIInactiveButtonColorID)
			oryUIParameters.inactiveButtonColor#[2] = GetColorGreen(oryUIInactiveButtonColorID)
			oryUIParameters.inactiveButtonColor#[3] = GetColorBlue(oryUIInactiveButtonColorID)
			oryUIParameters.inactiveButtonColor#[4] = 255
		elseif (oryUIVariable$ = "inactivecolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.inactiveColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.inactiveColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.inactiveColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.inactiveColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "inactivecolorid")
			oryUIInactiveColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.inactiveColor#[1] = GetColorRed(oryUIInactiveColorID)
			oryUIParameters.inactiveColor#[2] = GetColorGreen(oryUIInactiveColorID)
			oryUIParameters.inactiveColor#[3] = GetColorBlue(oryUIInactiveColorID)
			oryUIParameters.inactiveColor#[4] = 255
		elseif (oryUIVariable$ = "inactiveiconcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.inactiveIconColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.inactiveIconColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.inactiveIconColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.inactiveIconColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "inactiveiconcolorid")
			oryUIInactiveIconColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.inactiveIconColor#[1] = GetColorRed(oryUIInactiveIconColorID)
			oryUIParameters.inactiveIconColor#[2] = GetColorGreen(oryUIInactiveIconColorID)
			oryUIParameters.inactiveIconColor#[3] = GetColorBlue(oryUIInactiveIconColorID)
			oryUIParameters.inactiveIconColor#[4] = 255
		elseif (oryUIVariable$ = "inactivetextbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.inactiveTextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.inactiveTextBold = 0
			endif
		elseif (oryUIVariable$ = "inactivetextcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.inactiveTextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.inactiveTextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.inactiveTextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.inactiveTextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "inactivetextcolorid")
			oryUIInactiveTextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.inactiveTextColor#[1] = GetColorRed(oryUIInactiveTextColorID)
			oryUIParameters.inactiveTextColor#[2] = GetColorGreen(oryUIInactiveTextColorID)
			oryUIParameters.inactiveTextColor#[3] = GetColorBlue(oryUIInactiveTextColorID)
			oryUIParameters.inactiveTextColor#[4] = 255
		elseif (oryUIVariable$ = "inactivetextsize")
			oryUIParameters.inactiveTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "index")
			oryUIParameters.index = val(oryUIValue$)
		elseif (oryUIVariable$ = "indicatorcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.indicatorColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.indicatorColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.indicatorColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.indicatorColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "indicatorcolorid")
			oryUIIndicatorColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.indicatorColor#[1] = GetColorRed(oryUIIndicatorColorID)
			oryUIParameters.indicatorColor#[2] = GetColorGreen(oryUIIndicatorColorID)
			oryUIParameters.indicatorColor#[3] = GetColorBlue(oryUIIndicatorColorID)
			oryUIParameters.indicatorColor#[4] = 255
		elseif (oryUIVariable$ = "inputtext")
			oryUIParameters.inputText$ = oryUIValue$
		elseif (oryUIVariable$ = "inputtype")
			oryUIParameters.inputType$ = oryUIValue$
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
		elseif (oryUIVariable$ = "lefticon")
			oryUIParameters.leftIcon$ = oryUIValue$
			oryUIParameters.leftIconID = OryUIReturnIconID(oryUIValue$)
		elseif (oryUIVariable$ = "lefticoncolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.leftIconColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.leftIconColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.leftIconColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.leftIconColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "lefticoncolorid")
			oryUILeftIconColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.leftIconColor#[1] = GetColorRed(oryUILeftIconColorID)
			oryUIParameters.leftIconColor#[2] = GetColorGreen(oryUILeftIconColorID)
			oryUIParameters.leftIconColor#[3] = GetColorBlue(oryUILeftIconColorID)
			oryUIParameters.leftIconColor#[4] = 255
		elseif (oryUIVariable$ = "lefticonid")
			oryUIParameters.leftIconID = val(oryUIValue$)
		elseif (oryUIVariable$ = "lefttext")
			oryUIParameters.leftText$ = oryUIValue$
		elseif (oryUIVariable$ = "lefttextbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.leftTextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.leftTextBold = 0
			endif
		elseif (oryUIVariable$ = "lefttextcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.leftTextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.leftTextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.leftTextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.leftTextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "lefttextcolorid")
			oryUILeftTextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.leftTextColor#[1] = GetColorRed(oryUILeftTextColorID)
			oryUIParameters.leftTextColor#[2] = GetColorGreen(oryUILeftTextColorID)
			oryUIParameters.leftTextColor#[3] = GetColorBlue(oryUILeftTextColorID)
			oryUIParameters.leftTextColor#[4] = 255
		elseif (oryUIVariable$ = "lefttextsize")
			oryUIParameters.leftTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "leftline1text")
			oryUIParameters.leftLine1Text$ = oryUIValue$
		elseif (oryUIVariable$ = "leftline1textbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.leftLine1TextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.leftLine1TextBold = 0
			endif
		elseif (oryUIVariable$ = "leftline1textcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.leftLine1TextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.leftLine1TextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.leftLine1TextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.leftLine1TextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "leftline1textcolorid")
			oryUILeftLine1TextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.leftLine1TextColor#[1] = GetColorRed(oryUILeftLine1TextColorID)
			oryUIParameters.leftLine1TextColor#[2] = GetColorGreen(oryUILeftLine1TextColorID)
			oryUIParameters.leftLine1TextColor#[3] = GetColorBlue(oryUILeftLine1TextColorID)
			oryUIParameters.leftLine1TextColor#[4] = 255
		elseif (oryUIVariable$ = "leftline1textsize")
			oryUIParameters.leftLine1TextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "leftline2text")
			oryUIParameters.leftLine2Text$ = oryUIValue$
		elseif (oryUIVariable$ = "leftline2textbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.leftLine2TextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.leftLine2TextBold = 0
			endif
		elseif (oryUIVariable$ = "leftline2textcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.leftLine2TextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.leftLine2TextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.leftLine2TextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.leftLine2TextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "leftline2textcolorid")
			oryUILeftLine2TextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.leftLine2TextColor#[1] = GetColorRed(oryUILeftLine2TextColorID)
			oryUIParameters.leftLine2TextColor#[2] = GetColorGreen(oryUILeftLine2TextColorID)
			oryUIParameters.leftLine2TextColor#[3] = GetColorBlue(oryUILeftLine2TextColorID)
			oryUIParameters.leftLine2TextColor#[4] = 255
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
		elseif (oryUIVariable$ = "maxx")
			oryUIParameters.maxPosition#[1] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "maxy")
			oryUIParameters.maxPosition#[2] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "maxzoom")
			oryUIParameters.maxZoom# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "min")
			oryUIParameters.min# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "mini")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.mini = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.mini = 0
			endif
		elseif (oryUIVariable$ = "minposition")
			oryUIParameters.minPosition#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.minPosition#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "minx")
			oryUIParameters.minPosition#[1] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "miny")
			oryUIParameters.minPosition#[2] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "name")
			oryUIParameters.name$ = oryUIValue$
		elseif (oryUIVariable$ = "navigationicon")
			oryUIParameters.navigationIcon$ = oryUIValue$
			oryUIParameters.navigationIconID = OryUIReturnIconID(oryUIValue$)
		elseif (oryUIVariable$ = "navigationiconcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.navigationIconColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.navigationIconColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.navigationIconColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.navigationIconColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "navigationiconcolorid")
			oryUINavigationIconColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.navigationIconColor#[1] = GetColorRed(oryUINavigationIconColorID)
			oryUIParameters.navigationIconColor#[2] = GetColorGreen(oryUINavigationIconColorID)
			oryUIParameters.navigationIconColor#[3] = GetColorBlue(oryUINavigationIconColorID)
			oryUIParameters.navigationIconColor#[4] = 255
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
			if (oryUIValue$ = "center" or oryUIValue$ = "centre")
				oryUIParameters.offsetCenter = 1
			else
				oryUIParameters.offset#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.offset#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
			endif
		elseif (oryUIVariable$ = "placement")
			oryUIParameters.placement$ = oryUIValue$
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
		elseif (oryUIVariable$ = "righticoncolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.rightIconColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.rightIconColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.rightIconColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.rightIconColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "righticoncolorid")
			oryUIRightIconColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.rightIconColor#[1] = GetColorRed(oryUIRightIconColorID)
			oryUIParameters.rightIconColor#[2] = GetColorGreen(oryUIRightIconColorID)
			oryUIParameters.rightIconColor#[3] = GetColorBlue(oryUIRightIconColorID)
			oryUIParameters.rightIconColor#[4] = 255
		elseif (oryUIVariable$ = "righticonid")
			oryUIParameters.rightIconID = val(oryUIValue$)
		elseif (oryUIVariable$ = "righttext")
			oryUIParameters.rightText$ = oryUIValue$
		elseif (oryUIVariable$ = "righttextbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.rightTextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.rightTextBold = 0
			endif
		elseif (oryUIVariable$ = "righttextcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.rightTextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.rightTextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.rightTextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.rightTextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "righttextcolorid")
			oryUIRightTextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.rightTextColor#[1] = GetColorRed(oryUIRightTextColorID)
			oryUIParameters.rightTextColor#[2] = GetColorGreen(oryUIRightTextColorID)
			oryUIParameters.rightTextColor#[3] = GetColorBlue(oryUIRightTextColorID)
			oryUIParameters.rightTextColor#[4] = 255
		elseif (oryUIVariable$ = "righttextsize")
			oryUIParameters.rightTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "rightline1text")
			oryUIParameters.rightLine1Text$ = oryUIValue$
		elseif (oryUIVariable$ = "rightline1textbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.rightLine1TextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.rightLine1TextBold = 0
			endif
		elseif (oryUIVariable$ = "rightline1textcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.rightLine1TextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.rightLine1TextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.rightLine1TextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.rightLine1TextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "rightline1textcolorid")
			oryUIRightLine1TextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.rightLine1TextColor#[1] = GetColorRed(oryUIRightLine1TextColorID)
			oryUIParameters.rightLine1TextColor#[2] = GetColorGreen(oryUIRightLine1TextColorID)
			oryUIParameters.rightLine1TextColor#[3] = GetColorBlue(oryUIRightLine1TextColorID)
			oryUIParameters.rightLine1TextColor#[4] = 255
		elseif (oryUIVariable$ = "rightline1textsize")
			oryUIParameters.rightLine1TextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "rightline2text")
			oryUIParameters.rightLine2Text$ = oryUIValue$
		elseif (oryUIVariable$ = "rightline2textbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.rightLine2TextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.rightLine2TextBold = 0
			endif
		elseif (oryUIVariable$ = "rightline2textcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.rightLine2TextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.rightLine2TextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.rightLine2TextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.rightLine2TextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "rightline2textcolorid")
			oryUIRightLine2TextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.rightLine2TextColor#[1] = GetColorRed(oryUIRightLine2TextColorID)
			oryUIParameters.rightLine2TextColor#[2] = GetColorGreen(oryUIRightLine2TextColorID)
			oryUIParameters.rightLine2TextColor#[3] = GetColorBlue(oryUIRightLine2TextColorID)
			oryUIParameters.rightLine2TextColor#[4] = 255
		elseif (oryUIVariable$ = "rightline2textsize")
			oryUIParameters.rightLine2TextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "savetext")
			oryUIParameters.saveText$ = oryUIValue$
		elseif (oryUIVariable$ = "scrimcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.scrimColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.scrimColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.scrimColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.scrimColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "scrimcolorid")
			oryUIScrimColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.scrimColor#[1] = GetColorRed(oryUIScrimColorID)
			oryUIParameters.scrimColor#[2] = GetColorGreen(oryUIScrimColorID)
			oryUIParameters.scrimColor#[3] = GetColorBlue(oryUIScrimColorID)
			oryUIParameters.scrimColor#[4] = 255
		elseif (oryUIVariable$ = "script")
			oryUIParameters.script$ = oryUIValue$
		elseif (oryUIVariable$ = "scrollable")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.scrollable = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.scrollable = 0
			endif
		elseif (oryUIVariable$ = "selected")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.selected = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.selected = 0
			endif
		elseif (oryUIVariable$ = "selectedcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.selectedColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.selectedColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.selectedColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.selectedColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "selectedcolorid")
			oryUISelectedColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.selectedColor#[1] = GetColorRed(oryUISelectedColorID)
			oryUIParameters.selectedColor#[2] = GetColorGreen(oryUISelectedColorID)
			oryUIParameters.selectedColor#[3] = GetColorBlue(oryUISelectedColorID)
			oryUIParameters.selectedColor#[4] = 255
		elseif (oryUIVariable$ = "selectediconcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.selectedIconColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.selectedIconColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.selectedIconColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.selectedIconColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "selectediconcolorid")
			oryUISelectedIconColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.selectedIconColor#[1] = GetColorRed(oryUISelectedIconColorID)
			oryUIParameters.selectedIconColor#[2] = GetColorGreen(oryUISelectedIconColorID)
			oryUIParameters.selectedIconColor#[3] = GetColorBlue(oryUISelectedIconColorID)
			oryUIParameters.selectedIconColor#[4] = 255
		elseif (oryUIVariable$ = "selectedtextbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.selectedTextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.selectedTextBold = 0
			endif
		elseif (oryUIVariable$ = "selectedtextcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.selectedTextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.selectedTextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.selectedTextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.selectedTextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "selectedtextcolorid")
			oryUISelectedTextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.selectedTextColor#[1] = GetColorRed(oryUISelectedTextColorID)
			oryUIParameters.selectedTextColor#[2] = GetColorGreen(oryUISelectedTextColorID)
			oryUIParameters.selectedTextColor#[3] = GetColorBlue(oryUISelectedTextColorID)
			oryUIParameters.selectedTextColor#[4] = 255
		elseif (oryUIVariable$ = "selectedtextsize")
			oryUIParameters.selectedTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "shadow")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.shadow = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.shadow = 0
			endif
		elseif (oryUIVariable$ = "showcheckbox")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.showCheckbox = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.showCheckbox = 0
			endif
		elseif (oryUIVariable$ = "showhelpertext")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.showHelperText = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.showHelperText = 0
			endif
		elseif (oryUIVariable$ = "showicon")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.showIcon = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.showIcon = 0
			endif
		elseif (oryUIVariable$ = "showlefticon")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.showLeftIcon = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.showLeftIcon = 0
			endif
		elseif (oryUIVariable$ = "showleftthumbnail")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.showLeftThumbnail = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.showLeftThumbnail = 0
			endif
		elseif (oryUIVariable$ = "showrighticon")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.showRightIcon = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.showRightIcon = 0
			endif
		elseif (oryUIVariable$ = "showrighttext")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.showRightText = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.showRightText = 0
			endif
		elseif (oryUIVariable$ = "showshadow")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.showShadow = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.showShadow = 0
			endif
		elseif (oryUIVariable$ = "showskiptoendbuttons")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.showSkipToEndButtons = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.showSkipToEndButtons = 0
			endif
		elseif (oryUIVariable$ = "size")
			oryUIParameters.size#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.size#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "spriteshader")
			oryUIParameters.spriteShader = val(oryUIValue$)
		elseif (oryUIVariable$ = "stackbuttons")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.stackButtons = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.stackButtons = 0
			endif
		elseif (oryUIVariable$ = "starty")
			oryUIParameters.startY# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "step")
			oryUIParameters.step# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "stickuntilcomplete")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.stickUntilComplete = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.stickUntilComplete = 0
			endif
		elseif (oryUIVariable$ = "string")
			oryUIParameters.text$ = oryUIValue$
		elseif (oryUIVariable$ = "strokecolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.strokeColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.strokeColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.strokeColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.strokeColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "strokecolorid")
			oryUIStrokeColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.strokeColor#[1] = GetColorRed(oryUIStrokeColorID)
			oryUIParameters.strokeColor#[2] = GetColorGreen(oryUIStrokeColorID)
			oryUIParameters.strokeColor#[3] = GetColorBlue(oryUIStrokeColorID)
			oryUIParameters.strokeColor#[4] = 255
		elseif (oryUIVariable$ = "subtitletext")
			oryUIParameters.subtitleText$ = oryUIValue$
		elseif (oryUIVariable$ = "subtitletextalignment")
			if (oryUIValue$ = "left")
				oryUIParameters.subtitleTextAlignment = 0
			elseif (oryUIValue$ = "center" or oryUIValue$ = "centre")
				oryUIParameters.subtitleTextAlignment = 1
			elseif (oryUIValue$ = "right")
				oryUIParameters.subtitleTextAlignment = 2
			endif
		elseif (oryUIVariable$ = "subtitletextbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.subtitleTextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.subtitleTextBold = 0
			endif
		elseif (oryUIVariable$ = "subtitletextcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.subtitleTextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.subtitleTextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.subtitleTextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.subtitleTextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "subtitletextcolorid")
			oryUISubTitleTextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.subtitleTextColor#[1] = GetColorRed(oryUISubtitleTextColorID)
			oryUIParameters.subtitleTextColor#[2] = GetColorGreen(oryUISubtitleTextColorID)
			oryUIParameters.subtitleTextColor#[3] = GetColorBlue(oryUISubtitleTextColorID)
			oryUIParameters.subtitleTextColor#[4] = 255
		elseif (oryUIVariable$ = "subtitletextsize")
			oryUIParameters.subtitleTextSize# = valFloat(oryUIValue$)

		elseif (oryUIVariable$ = "subtracticon")
			oryUIParameters.subtractIcon$ = oryUIValue$
			oryUIParameters.subtractIconID = OryUIReturnIconID(oryUIValue$)
		elseif (oryUIVariable$ = "subtracticoncolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.subtractIconColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.subtractIconColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.subtractIconColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.subtractIconColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "subtracticoncolorid")
			oryUISubtractIconColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.subtractIconColor#[1] = GetColorRed(oryUISubtractIconColorID)
			oryUIParameters.subtractIconColor#[2] = GetColorGreen(oryUISubtractIconColorID)
			oryUIParameters.subtractIconColor#[3] = GetColorBlue(oryUISubtractIconColorID)
			oryUIParameters.subtractIconColor#[4] = 255
		elseif (oryUIVariable$ = "subtracticonid")
			oryUIParameters.subtractIconID = val(oryUIValue$)
		elseif (oryUIVariable$ = "subtracticonsize")
			oryUIParameters.subtractIconSize#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.subtractIconSize#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
		elseif (oryUIVariable$ = "supportingtext")
			oryUIParameters.supportingText$ = oryUIValue$
		elseif (oryUIVariable$ = "supportingtextalignment")
			if (oryUIValue$ = "left")
				oryUIParameters.supportingTextAlignment = 0
			elseif (oryUIValue$ = "center" or oryUIValue$ = "centre")
				oryUIParameters.supportingTextAlignment = 1
			elseif (oryUIValue$ = "right")
				oryUIParameters.supportingTextAlignment = 2
			endif
		elseif (oryUIVariable$ = "supportingtextbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.supportingTextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.supportingTextBold = 0
			endif
		elseif (oryUIVariable$ = "supportingtextcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.supportingTextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.supportingTextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.supportingTextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.supportingTextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "supportingtextcolorid")
			oryUISupportingTextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.supportingTextColor#[1] = GetColorRed(oryUISupportingTextColorID)
			oryUIParameters.supportingTextColor#[2] = GetColorGreen(oryUISupportingTextColorID)
			oryUIParameters.supportingTextColor#[3] = GetColorBlue(oryUISupportingTextColorID)
			oryUIParameters.supportingTextColor#[4] = 255
		elseif (oryUIVariable$ = "supportingtextsize")
			oryUIParameters.supportingTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "text")
			oryUIParameters.text$ = oryUIValue$
		elseif (oryUIVariable$ = "textalignment")
			if (oryUIValue$ = "left")
				oryUIParameters.textAlignment = 0
			elseif (oryUIValue$ = "center" or oryUIValue$ = "centre")
				oryUIParameters.textAlignment = 1
			elseif (oryUIValue$ = "right")
				oryUIParameters.textAlignment = 2
			endif
		elseif (oryUIVariable$ = "textbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.textBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.textBold = 0
			endif
		elseif (oryUIVariable$ = "textcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.textColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.textColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.textColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.textColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "textcolorid")
			oryUITextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.textColor#[1] = GetColorRed(oryUITextColorID)
			oryUIParameters.textColor#[2] = GetColorGreen(oryUITextColorID)
			oryUIParameters.textColor#[3] = GetColorBlue(oryUITextColorID)
			oryUIParameters.textColor#[4] = 255
		elseif (oryUIVariable$ = "textsize")
			oryUIParameters.textSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "timeout")
			oryUIParameters.timeout = val(oryUIValue$)
		elseif (oryUIVariable$ = "titletext")
			oryUIParameters.titleText$ = oryUIValue$
		elseif (oryUIVariable$ = "titletextalignment")
			if (oryUIValue$ = "left")
				oryUIParameters.titleTextAlignment = 0
			elseif (oryUIValue$ = "center" or oryUIValue$ = "centre")
				oryUIParameters.titleTextAlignment = 1
			elseif (oryUIValue$ = "right")
				oryUIParameters.titleTextAlignment = 2
			endif
		elseif (oryUIVariable$ = "titletextbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.titleTextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.titleTextBold = 0
			endif
		elseif (oryUIVariable$ = "titletextcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.titleTextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.titleTextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.titleTextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.titleTextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "titletextcolorid")
			oryUITitleTextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.titleTextColor#[1] = GetColorRed(oryUITitleTextColorID)
			oryUIParameters.titleTextColor#[2] = GetColorGreen(oryUITitleTextColorID)
			oryUIParameters.titleTextColor#[3] = GetColorBlue(oryUITitleTextColorID)
			oryUIParameters.titleTextColor#[4] = 255
		elseif (oryUIVariable$ = "titletextsize")
			oryUIParameters.titleTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "trackcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.trackColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.trackColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.trackColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.trackColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "trackcolorid")
			oryUITrackColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.trackColor#[1] = GetColorRed(oryUITrackColorID)
			oryUIParameters.trackColor#[2] = GetColorGreen(oryUITrackColorID)
			oryUIParameters.trackColor#[3] = GetColorBlue(oryUITrackColorID)
			oryUIParameters.trackColor#[4] = 255
		elseif (oryUIVariable$ = "uncheckedimageid")
			oryUIParameters.uncheckedImageID = val(oryUIValue$)
		elseif (oryUIVariable$ = "unselectedcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.unselectedColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.unselectedColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.unselectedColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.unselectedColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "unselectedcolorid")
			oryUIUnselectedColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.unselectedColor#[1] = GetColorRed(oryUIUnselectedColorID)
			oryUIParameters.unselectedColor#[2] = GetColorGreen(oryUIUnselectedColorID)
			oryUIParameters.unselectedColor#[3] = GetColorBlue(oryUIUnselectedColorID)
			oryUIParameters.unselectedColor#[4] = 255
		elseif (oryUIVariable$ = "unselectediconcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.unselectedIconColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.unselectedIconColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.unselectedIconColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.unselectedIconColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "unselectediconcolorid")
			oryUIUnselectedIconColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.unselectedIconColor#[1] = GetColorRed(oryUIUnselectedIconColorID)
			oryUIParameters.unselectedIconColor#[2] = GetColorGreen(oryUIUnselectedIconColorID)
			oryUIParameters.unselectedIconColor#[3] = GetColorBlue(oryUIUnselectedIconColorID)
			oryUIParameters.unselectedIconColor#[4] = 255
		elseif (oryUIVariable$ = "unselectedtextbold")
			if (oryUIValue$ = "true" or oryUIValue$ = "1")
				oryUIParameters.unselectedTextBold = 1
			elseif (oryUIValue$ = "false" or oryUIValue$ = "0")
				oryUIParameters.unselectedTextBold = 0
			endif
		elseif (oryUIVariable$ = "unselectedtextcolor")
			if (CountStringTokens(oryUIValue$, ",") >= 3)
				oryUIParameters.unselectedTextColor#[1] = valFloat(GetStringToken(oryUIValue$, ",", 1))
				oryUIParameters.unselectedTextColor#[2] = valFloat(GetStringToken(oryUIValue$, ",", 2))
				oryUIParameters.unselectedTextColor#[3] = valFloat(GetStringToken(oryUIValue$, ",", 3))
			endif
			if (CountStringTokens(oryUIValue$, ",") = 4)
				oryUIParameters.unselectedTextColor#[4] = valFloat(GetStringToken(oryUIValue$, ",", 4))
			endif
		elseif (oryUIVariable$ = "unselectedtextcolorid")
			oryUIUnselectedTextColorID = val(GetStringToken(oryUIValue$, ",", 1))
			oryUIParameters.unselectedTextColor#[1] = GetColorRed(oryUIUnselectedTextColorID)
			oryUIParameters.unselectedTextColor#[2] = GetColorGreen(oryUIUnselectedTextColorID)
			oryUIParameters.unselectedTextColor#[3] = GetColorBlue(oryUIUnselectedTextColorID)
			oryUIParameters.unselectedTextColor#[4] = 255
		elseif (oryUIVariable$ = "selectedtextsize")
			oryUIParameters.unselectedTextSize# = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "width")
			oryUIParameters.size#[1] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "x")
			oryUIParameters.position#[1] = valFloat(oryUIValue$)
		elseif (oryUIVariable$ = "y")
			oryUIParameters.position#[2] = valFloat(oryUIValue$)
		endif
	next	
endfunction

foldend
