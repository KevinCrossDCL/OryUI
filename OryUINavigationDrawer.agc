
foldstart // OryUINavigationDrawer Widget

type typeOryUINavigationDrawer
	id as integer
	drawerLocation$ as string
	drawerType$ as string
	itemPressed as integer
	itemReleased as integer
	items as typeOryUINavigationDrawItems[]
	scrimPressed as integer
	scrimReleased as integer
	selected as integer
	selectedChange as integer
	showIcon as integer
	showRightText as integer
	showShadow as integer
	sprContainer as integer
	sprScrim as integer
	sprShadow as integer
	sprStatusBar as integer
	startTouchY# as float
	startViewY# as float
	startY# as float
	visible as integer
endtype

type typeOryUINavigationDrawItems
	id as integer
	icon$ as string
	itemReleased as integer
	itemType$ as string
	label$ as string
	name$ as string
	pressed as integer
	released as integer
	rightLabel$ as string
	selected as integer
	size# as float[2]
	sprActiveOverlay as integer
	sprContainer as integer
	sprDivider as integer
	sprHeaderTextScrim as integer
	sprIcon as integer
	txtLabel as integer
	txtRightLabel as integer
	txtSubtitle as integer
endtype

global OryUINavigationDrawerCollection as typeOryUINavigationDrawer[]
OryUINavigationDrawerCollection.length = 1

function OryUICreateNavigationDrawer(oryUIWidgetParameters$ as string)
	local oryUINavigationDrawerID as integer
	OryUINavigationDrawerCollection.length = OryUINavigationDrawerCollection.length + 1
	oryUINavigationDrawerID = OryUINavigationDrawerCollection.length
	OryUINavigationDrawerCollection[oryUINavigationDrawerID].id = oryUINavigationDrawerID

	oryUICreatedWidgets.insert(OryUIAddCreatedWidget(oryUINavigationDrawerID, "NavigationDrawer"))

	// DEFAULTS
	OryUINavigationDrawerCollection[oryUINavigationDrawerID].drawerLocation$ = oryUIDefaults.navigationDrawerLocation$
	OryUINavigationDrawerCollection[oryUINavigationDrawerID].drawerType$ = oryUIDefaults.navigationDrawerType$
	OryUINavigationDrawerCollection[oryUINavigationDrawerID].showIcon = oryUIDefaults.navigationDrawerShowOptionIcon
	OryUINavigationDrawerCollection[oryUINavigationDrawerID].showRightText = oryUIDefaults.navigationDrawerShowOptionRightText
	OryUINavigationDrawerCollection[oryUINavigationDrawerID].showShadow = oryUIDefaults.navigationDrawerShowShadow
	
	OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprScrim = CreateSprite(0)
	SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprScrim, 100, abs(GetScreenBoundsTop() * 2) + 100)
	SetSpriteDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprScrim, oryUIDefaults.navigationDrawerDepth)
	SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprScrim, oryUIDefaults.navigationDrawerScrimColor#[1], oryUIDefaults.navigationDrawerScrimColor#[2], oryUIDefaults.navigationDrawerScrimColor#[3], oryUIDefaults.navigationDrawerScrimColor#[4])
	SetSpriteOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprScrim, 0, 0)
	SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprScrim, -999999, -999999)
	SetSpritePhysicsOff(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprScrim)

	OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, oryUIDefaults.navigationDrawerWidth#, OryUIStatusBarHeight#)
	SetSpriteDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, oryUIDefaults.navigationDrawerDepth - 1)
	SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, oryUIDefaults.navigationDrawerColor#[1], oryUIDefaults.navigationDrawerColor#[2], oryUIDefaults.navigationDrawerColor#[3], oryUIDefaults.navigationDrawerColor#[4])
	SetSpriteOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, -999999, -999999)
	SetSpritePhysicsOff(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer)

	OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprStatusBar = CreateSprite(0)
	SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprStatusBar, oryUIDefaults.navigationDrawerWidth#, OryUIStatusBarHeight#)
	SetSpriteDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprStatusBar, oryUIDefaults.navigationDrawerDepth - 4)
	SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprStatusBar, oryUIDefaults.navigationDrawerStatusBarColor#[1], oryUIDefaults.navigationDrawerStatusBarColor#[2], oryUIDefaults.navigationDrawerStatusBarColor#[3], oryUIDefaults.navigationDrawerStatusBarColor#[4])
	SetSpriteOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprStatusBar, 0, 0)
	SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprStatusBar, -999999, -999999)
	SetSpritePhysicsOff(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprStatusBar)

	OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow = CreateSprite(0)
	SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, 1, OryUIStatusBarHeight#)
	SetSpriteDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, oryUIDefaults.navigationDrawerDepth - 1)
	SetSpriteImage(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, oryUIRightShadowImage)
	SetSpriteOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, 0, 0)
	SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, -999999, -999999)
	SetSpritePhysicsOff(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow)

	if (oryUIWidgetParameters$ <> "") then OryUIUpdateNavigationDrawer(oryUINavigationDrawerID, oryUIWidgetParameters$)
endfunction oryUINavigationDrawerID

function OryUIDeleteNavigationDrawer(oryUINavigationDrawerID as integer)
	DeleteSprite(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer)
	DeleteSprite(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprScrim)
	DeleteSprite(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow)
	DeleteSprite(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprStatusBar)
	while (OryUINavigationDrawerCollection[oryUINavigationDrawerID].items.length >= 0)
		OryUIDeleteNavigationDrawerItem(oryUINavigationDrawerID, 0)
	endwhile
endfunction

function OryUIDeleteNavigationDrawerItem(oryUINavigationDrawerID as integer, oryUINavigationDrawerItemID as integer)
	DeleteSprite(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprActiveOverlay)
	DeleteSprite(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprContainer)
	DeleteSprite(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprDivider)
	DeleteSprite(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprIcon)
	DeleteText(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtLabel)
	DeleteText(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtRightLabel)
	DeleteText(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtSubtitle)
	OryUINavigationDrawerCollection[oryUINavigationDrawerID].items.remove(oryUINavigationDrawerItemID)
endfunction

function OryUIGetNavigationDrawerHeight(oryUINavigationDrawerID as integer)
	local oryUIForI as integer
	local oryUINavigationDrawerHeight# as float
	oryUINavigationDrawerHeight# = OryUIStatusBarHeight#
	for oryUIForI = 0 to OryUIGetNavigationDrawerItemCount(oryUINavigationDrawerID) - 1
		if (GetSpriteExists(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer))
			oryUINavigationDrawerHeight# = oryUINavigationDrawerHeight# + GetSpriteHeight(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer)
		endif
	next
	if (oryUINavigationDrawerHeight# < abs(GetScreenBoundsTop() * 2) + 100) then oryUINavigationDrawerHeight# = abs(GetScreenBoundsTop() * 2) + 100
endfunction oryUINavigationDrawerHeight#

function OryUIGetNavigationDrawerItemCount(oryUINavigationDrawerID as integer)
	local oryUINavigationDrawerItemCount as integer
	oryUINavigationDrawerItemCount = OryUINavigationDrawerCollection[oryUINavigationDrawerID].items.length + 1
endfunction oryUINavigationDrawerItemCount

function OryUIGetNavigationDrawerItemReleasedByIndex(oryUINavigationDrawerID as integer, oryUINavigationDrawerItemIndex as integer)
	local oryUINavigationDrawerItemReleased as integer
	oryUINavigationDrawerItemReleased = 0
	if (OryUINavigationDrawerCollection[oryUINavigationDrawerID].itemReleased = oryUINavigationDrawerItemIndex) then oryUINavigationDrawerItemReleased = 1
endfunction oryUINavigationDrawerItemReleased

function OryUIGetNavigationDrawerItemReleasedByName(oryUINavigationDrawerID as integer, oryUINavigationDrawerItemName$ as string)
	local oryUINavigationDrawerItemReleased as integer
	oryUINavigationDrawerItemReleased = 0
	if (OryUINavigationDrawerCollection[oryUINavigationDrawerID].itemReleased > 0)
		if (lower(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[OryUINavigationDrawerCollection[oryUINavigationDrawerID].itemReleased - 1].name$) = lower(oryUINavigationDrawerItemName$)) then oryUINavigationDrawerItemReleased = 1
	endif
endfunction oryUINavigationDrawerItemReleased

function OryUIGetNavigationDrawerItemReleasedIndex(oryUINavigationDrawerID as integer)
	local oryUINavigationDrawerItemReleasedIndex as integer
	oryUINavigationDrawerItemReleasedIndex = OryUINavigationDrawerCollection[oryUINavigationDrawerID].itemReleased
endfunction oryUINavigationDrawerItemReleasedIndex

function OryUIGetNavigationDrawerItemReleasedName(oryUINavigationDrawerID as integer)
	local oryUINavigationDrawerItemReleasedName$ as string
	if (OryUINavigationDrawerCollection[oryUINavigationDrawerID].itemReleased > 0)
		oryUINavigationDrawerItemReleasedName$ = OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[OryUINavigationDrawerCollection[oryUINavigationDrawerID].itemReleased - 1].name$
	endif
endfunction oryUINavigationDrawerItemReleasedName$

function OryUIGetNavigationDrawerVisible(oryUINavigationDrawerID as integer)

endfunction OryUINavigationDrawerCollection[oryUINavigationDrawerID].visible

function OryUIGetNavigationDrawerX(oryUINavigationDrawerID as integer)
	local oryUINavigationDrawerX# as float
	if (OryUINavigationDrawerCollection[oryUINavigationDrawerID].visible = 1)
		oryUINavigationDrawerX# = GetSpriteX(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer)
	endif
endfunction oryUINavigationDrawerX#

function OryUIGetNavigationDrawerY(oryUINavigationDrawerID as integer)
	local oryUINavigationDrawerY# as float
	if (OryUINavigationDrawerCollection[oryUINavigationDrawerID].visible = 1)
		oryUINavigationDrawerY# = GetSpriteY(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer)
	endif
endfunction oryUINavigationDrawerY#

function OryUIHideNavigationDrawer(oryUINavigationDrawerID as integer)
	local oryUIForI as integer
	oryUIScrimVisible = 0
	oryUIBlockScreenScrolling = 0
	OryUINavigationDrawerCollection[oryUINavigationDrawerID].visible = 0
	SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprScrim, -999999, -999999)
	SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, -999999, -999999)
	SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, -999999, -999999)
	SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprStatusBar, -999999, -999999)
	for oryUIForI = 0 to OryUIGetNavigationDrawerItemCount(oryUINavigationDrawerID) - 1
		if (GetSpriteExists(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer))
			SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprActiveOverlay, -999999, -999999)
			SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer, -999999, -999999)
			SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprDivider, -999999, -999999)
			SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprIcon, -999999, -999999)
			SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprHeaderTextScrim, -999999, -999999)
			SetTextPosition(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].txtLabel, -999999, -999999)
			SetTextPosition(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].txtRightLabel, -999999, -999999)
			SetTextPosition(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].txtSubtitle, -999999, -999999)
		endif
	next
endfunction

function OryUIInsertNavigationDrawerItem(oryUINavigationDrawerID as integer, oryUINavigationDrawerIndex as integer, oryUIWidgetParameters$ as string)
	local oryUINavigationDrawerItemID as integer
	if (oryUINavigationDrawerIndex = -1)
		OryUINavigationDrawerCollection[oryUINavigationDrawerID].items.length = OryUINavigationDrawerCollection[oryUINavigationDrawerID].items.length + 1
		oryUINavigationDrawerItemID = OryUINavigationDrawerCollection[oryUINavigationDrawerID].items.length
		OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].id = oryUINavigationDrawerItemID + 1
	endif

	// DEFAULT SETTINGS
	OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].itemType$ = "option"
	
	OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprContainer, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer), oryUIDefaults.navigationDrawerOptionHeight#)
	SetSpriteDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprContainer, GetSpriteDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer) - 1)
	SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprContainer, oryUIDefaults.navigationDrawerOptionColor#[1], oryUIDefaults.navigationDrawerOptionColor#[2], oryUIDefaults.navigationDrawerOptionColor#[3], oryUIDefaults.navigationDrawerOptionColor#[4])
	SetSpriteOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprContainer, -999999, -999999)
	SetSpritePhysicsOff(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprContainer)

	OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprActiveOverlay = CreateSprite(0)
	SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprActiveOverlay, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer), oryUIDefaults.navigationDrawerOptionHeight#)
	SetSpriteDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprActiveOverlay, GetSpriteDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer) - 2)
	SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprActiveOverlay, oryUIDefaults.navigationDrawerOptionActiveOverlayColor#[1], oryUIDefaults.navigationDrawerOptionActiveOverlayColor#[2], oryUIDefaults.navigationDrawerOptionActiveOverlayColor#[3], oryUIDefaults.navigationDrawerOptionActiveOverlayColor#[4])
	SetSpriteOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprActiveOverlay, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprActiveOverlay) / 2, GetSpriteHeight(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprActiveOverlay) / 2)
	SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprActiveOverlay, -999999, -999999)
	SetSpritePhysicsOff(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprActiveOverlay)

	OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprDivider = CreateSprite(0)
	SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprDivider, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer), oryUIDefaults.navigationDrawerDividerHeight#)
	SetSpriteDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprDivider, GetSpriteDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprContainer) - 1)
	SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprDivider, oryUIDefaults.navigationDrawerDividerColor#[1], oryUIDefaults.navigationDrawerDividerColor#[2], oryUIDefaults.navigationDrawerDividerColor#[3], oryUIDefaults.navigationDrawerDividerColor#[4])
	SetSpriteOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprDivider, 0, 0)
	SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprDivider, -999999, -999999)
	SetSpritePhysicsOff(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprDivider)

	OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprIcon = CreateSprite(0)
	SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprIcon, -1, oryUIDefaults.navigationDrawerOptionIconHeight#)
	SetSpriteDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprIcon, GetSpriteDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprContainer) - 1)
	SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprIcon, oryUIDefaults.navigationDrawerOptionIconColor#[1], oryUIDefaults.navigationDrawerOptionIconColor#[2], oryUIDefaults.navigationDrawerOptionIconColor#[3], oryUIDefaults.navigationDrawerOptionIconColor#[4])
	SetSpriteOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprIcon, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprIcon) / 2, GetSpriteHeight(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprIcon) / 2)
	SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprIcon, -999999, -999999)
	SetSpritePhysicsOff(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprIcon)

	OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprHeaderTextScrim = CreateSprite(0)
	SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprHeaderTextScrim, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer), oryUIDefaults.navigationDrawerHeaderTextScrimHeight#)
	SetSpriteDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprHeaderTextScrim, GetSpriteDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprContainer) - 1)
	SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprHeaderTextScrim, oryUIDefaults.navigationDrawerHeaderTextScrimColor#[1], oryUIDefaults.navigationDrawerHeaderTextScrimColor#[2], oryUIDefaults.navigationDrawerHeaderTextScrimColor#[3], oryUIDefaults.navigationDrawerHeaderTextScrimColor#[4])
	SetSpriteOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprHeaderTextScrim, 0, 0)
	SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprHeaderTextScrim, -999999, -999999)
	SetSpritePhysicsOff(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprHeaderTextScrim)
	
	OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtLabel = CreateText(" ")
	SetTextSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtLabel, oryUIDefaults.navigationDrawerOptionTextSize#)
	SetTextBold(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtLabel, oryUIDefaults.navigationDrawerOptionTextBold)
	SetTextColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtLabel, oryUIDefaults.navigationDrawerOptionTextColor#[1], oryUIDefaults.navigationDrawerOptionTextColor#[2], oryUIDefaults.navigationDrawerOptionTextColor#[3], oryUIDefaults.navigationDrawerOptionTextColor#[4])
	SetTextAlignment(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtLabel, 0)
	SetTextDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtLabel, GetSpriteDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprContainer) - 1)
	SetTextPosition(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtLabel, -999999, -999999)

	OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtRightLabel = CreateText(" ")
	SetTextSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtRightLabel, oryUIDefaults.navigationDrawerOptionRightTextSize#)
	SetTextBold(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtRightLabel, oryUIDefaults.navigationDrawerOptionRightTextBold)
	SetTextColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtRightLabel, oryUIDefaults.navigationDrawerOptionRightTextColor#[1], oryUIDefaults.navigationDrawerOptionRightTextColor#[2], oryUIDefaults.navigationDrawerOptionRightTextColor#[3], oryUIDefaults.navigationDrawerOptionRightTextColor#[4])
	SetTextAlignment(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtRightLabel, 2)
	SetTextDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtRightLabel, GetSpriteDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprContainer) - 1)
	SetTextPosition(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtRightLabel, -999999, -999999)

	OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtSubtitle = CreateText(" ")
	SetTextSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtSubtitle, oryUIDefaults.navigationDrawerSubtitleTextSize#)
	SetTextBold(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtSubtitle, oryUIDefaults.navigationDrawerSubtitleTextBold)
	SetTextColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtSubtitle, oryUIDefaults.navigationDrawerSubtitleTextColor#[1], oryUIDefaults.navigationDrawerSubtitleTextColor#[2], oryUIDefaults.navigationDrawerSubtitleTextColor#[3], oryUIDefaults.navigationDrawerSubtitleTextColor#[4])
	SetTextAlignment(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtSubtitle, 0)
	SetTextDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtSubtitle, GetSpriteDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].sprContainer) - 1)
	SetTextPosition(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID].txtSubtitle, -999999, -999999)

	OryUIUpdateNavigationDrawerItem(oryUINavigationDrawerID, oryUINavigationDrawerItemID + 1, oryUIWidgetParameters$)
endfunction

function OryUIInsertNavigationDrawerListener(oryUINavigationDrawerID as integer)
	if (oryUIDialogVisible = 1)
		if (OryUINavigationDrawerCollection[oryUINavigationDrawerID].visible = 1)
			OryUIHideNavigationDrawer(oryUINavigationDrawerID)
		endif
		exitfunction
	endif

	local oryUIForI as integer
	local oryUINavigationDrawerContainerSprite as integer
	local oryUINavigationDrawerDistanceY# as float
	local oryUINavigationDrawerItemSprite as integer
	local oryUINavigationDrawerY# as float
	local oryUINavigationDrawerScrimSprite as integer

	OryUINavigationDrawerCollection[oryUINavigationDrawerID].scrimReleased = -1
	OryUINavigationDrawerCollection[oryUINavigationDrawerID].itemReleased = -1
	if (OryUINavigationDrawerCollection[oryUINavigationDrawerID].visible = 1)
		if (GetPointerPressed())
			oryUINavigationDrawerScrimSprite = GetSpriteHitTest(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprScrim, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			oryUINavigationDrawerContainerSprite = GetSpriteHitTest(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			if (oryUINavigationDrawerScrimSprite = 1 and oryUINavigationDrawerContainerSprite = 0)
				OryUINavigationDrawerCollection[oryUINavigationDrawerID].scrimPressed = 1
			endif
			OryUINavigationDrawerCollection[oryUINavigationDrawerID].startTouchY# = ScreenToWorldY(GetPointerY())
			OryUINavigationDrawerCollection[oryUINavigationDrawerID].startViewY# = GetViewOffsetY() + GetScreenBoundsTop()
			OryUINavigationDrawerCollection[oryUINavigationDrawerID].startY# = GetSpriteY(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer)
		else
			if (GetPointerState())
				oryUINavigationDrawerContainerSprite = GetSpriteHitTest(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				if (oryUINavigationDrawerContainerSprite = 1)
					OryUINavigationDrawerCollection[oryUINavigationDrawerID].scrimPressed = 0
					//if (((lower(OryUINavigationDrawerCollection[oryUINavigationDrawerID].drawerLocation$) = "left" or lower(OryUINavigationDrawerCollection[oryUINavigationDrawerID].drawerLocation$) = "right") and GetSpriteHeight(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer) > abs(GetScreenBoundsTop() * 2) + 100) or (lower(OryUINavigationDrawerCollection[oryUINavigationDrawerID].drawerLocation$) = "bottom" and GetSpriteHeight(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer) > abs(GetScreenBoundsTop() * 2) + 50))
					if (((lower(OryUINavigationDrawerCollection[oryUINavigationDrawerID].drawerLocation$) = "left" or lower(OryUINavigationDrawerCollection[oryUINavigationDrawerID].drawerLocation$) = "right") and GetSpriteHeight(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer) > abs(GetScreenBoundsTop() * 2) + 100))
						oryUINavigationDrawerDistanceY# = OryUINavigationDrawerCollection[oryUINavigationDrawerID].startTouchY# - ScreenToWorldY(GetPointerY()) + GetViewOffsetY() + GetScreenBoundsTop()
						oryUINavigationDrawerY# = OryUINavigationDrawerCollection[oryUINavigationDrawerID].startViewY# + OryUINavigationDrawerCollection[oryUINavigationDrawerID].startY# - oryUINavigationDrawerDistanceY#
						if (oryUINavigationDrawerY# >= GetViewOffsetY() + GetScreenBoundsTop())
							oryUINavigationDrawerY# = GetViewOffsetY() + GetScreenBoundsTop()
						endif
						if (oryUINavigationDrawerY# <= -(GetSpriteHeight(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer) - abs(GetScreenBoundsTop() * 2) - 100) + GetViewOffsetY() + GetScreenBoundsTop())
							oryUINavigationDrawerY# = -(GetSpriteHeight(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer) - abs(GetScreenBoundsTop() * 2) - 100) + GetViewOffsetY() + GetScreenBoundsTop()
						endif
						SetSpritePosition(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, GetSpriteX(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer), oryUINavigationDrawerY#)
						OryUIPositionItemsInNavigationDrawer(oryUINavigationDrawerID)
					endif
				endif
			endif
			if (GetPointerReleased())
				oryUINavigationDrawerScrimSprite = GetSpriteHitTest(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprScrim, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUINavigationDrawerContainerSprite = GetSpriteHitTest(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				if (OryUINavigationDrawerCollection[oryUINavigationDrawerID].scrimPressed = 1)
					if (oryUINavigationDrawerScrimSprite = 1 and oryUINavigationDrawerContainerSprite = 0)
						OryUINavigationDrawerCollection[oryUINavigationDrawerID].scrimReleased = 1
						OryUIHideNavigationDrawer(oryUINavigationDrawerID)
					endif
				endif
			endif		
		endif
		for oryUIForI = 0 to OryUIGetNavigationDrawerItemCount(oryUINavigationDrawerID) - 1
			if (GetSpriteExists(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer) and lower(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].itemType$) = "option")
				if (OryUIGetSwipingVertically() = 0)
					if (GetPointerPressed())
						oryUINavigationDrawerItemSprite = GetSpriteHitTest(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						if (oryUINavigationDrawerItemSprite = 1)
							OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].pressed = 1
							OryUINavigationDrawerCollection[oryUINavigationDrawerID].itemPressed = oryUIForI + 1
						endif
					else
						if (GetPointerState())
							oryUINavigationDrawerItemSprite = GetSpriteHitTest(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							if (OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].pressed)
								if (oryUINavigationDrawerItemSprite = 0)
									OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].pressed = 0
									OryUINavigationDrawerCollection[oryUINavigationDrawerID].itemPressed = 0
								endif
							endif
						endif
						if (GetPointerReleased())
							oryUINavigationDrawerItemSprite = GetSpriteHitTest(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							if (OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].pressed)
								if (oryUINavigationDrawerItemSprite = 1)
									OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].released = 1
									OryUINavigationDrawerCollection[oryUINavigationDrawerID].itemReleased = oryUIForI + 1
									OryUIHideNavigationDrawer(oryUINavigationDrawerID)
								endif
							endif
							OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].pressed = 0
							OryUINavigationDrawerCollection[oryUINavigationDrawerID].itemPressed = 0
						endif
					endif
				else
					OryUINavigationDrawerCollection[oryUINavigationDrawerID].itemPressed = 0
					OryUINavigationDrawerCollection[oryUINavigationDrawerID].itemReleased = 0
					OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].pressed = 0
					OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].released = 0
				endif
			endif
		next
	endif
endfunction

function OryUIPositionItemsInNavigationDrawer(oryUINavigationDrawerID as integer)
	local oryUIForI as integer
	local oryUINavigationDrawerItemHeight# as float
	local oryUINavigationDrawerItemY# as float
	
	oryUINavigationDrawerItemY# = OryUIStatusBarHeight#

	SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprStatusBar, GetSpriteX(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer), GetViewOffsetY() + GetScreenBoundsTop())

	for oryUIForI = 0 to OryUIGetNavigationDrawerItemCount(oryUINavigationDrawerID) - 1
		if (GetSpriteExists(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer))
			SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer), GetSpriteHeight(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer))
			SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer, GetSpriteX(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer), GetSpriteY(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer) + oryUINavigationDrawerItemY#)
			oryUINavigationDrawerItemY# = oryUINavigationDrawerItemY# + GetSpriteHeight(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer)
			SetSpritePosition(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprActiveOverlay, -999999, -999999)
			SetSpritePosition(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprDivider, -999999, -999999)
			SetSpritePosition(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprIcon, -999999, -999999)
			SetSpritePosition(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprHeaderTextScrim, -999999, -999999)
			SetTextPosition(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].txtLabel, -999999, -999999)
			SetTextPosition(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].txtRightLabel, -999999, -999999)
			SetTextPosition(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].txtSubtitle, -999999, -999999)
			if (lower(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].itemType$) = "divider")
				SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprDivider, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer), GetSpriteHeight(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprDivider))
				OryUIPinSpriteToSprite(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprDivider, OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer, 0, 0)
			endif
			if (lower(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].itemType$) = "header")
				SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprHeaderTextScrim, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer), GetSpriteHeight(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprHeaderTextScrim))
				OryUIPinSpriteToBottomLeftOfSprite(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprHeaderTextScrim, OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer, 0, 0)
				OryUIPinTextToCentreLeftOfSprite(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].txtLabel, OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprHeaderTextScrim, oryUIDefaults.navigationDrawerHeaderTextLeftPadding#, 0)
			endif
			if (lower(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].itemType$) = "option")
				if (OryUINavigationDrawerCollection[oryUINavigationDrawerID].showIcon = 1)
					OryUIPinSpriteToCentreLeftOfSprite(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprIcon, OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer, oryUIDefaults.navigationDrawerOptionIconLeftPadding# + (GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprIcon) / 2), 0)
					OryUIPinTextToCentreLeftOfSprite(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].txtLabel, OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer, oryUIDefaults.navigationDrawerOptionIconLeftPadding# + GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprIcon) + oryUIDefaults.navigationDrawerOptionTextLeftPadding#, 0)
				else
					OryUIPinTextToCentreLeftOfSprite(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].txtLabel, OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer, oryUIDefaults.navigationDrawerOptionTextLeftPadding# + GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprIcon), 0)
				endif
				if (OryUINavigationDrawerCollection[oryUINavigationDrawerID].showRightText = 1)
					OryUIPinTextToCentreRightOfSprite(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].txtRightLabel, OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer, -(oryUIDefaults.navigationDrawerOptionRightTextRightPadding#), 0)
				endif
				if (OryUINavigationDrawerCollection[oryUINavigationDrawerID].selected = oryUIForI + 1)
					OryUIPinSpriteToCentreOfSprite(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprActiveOverlay, OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer, 0, 0)
				endif
			endif
			if (lower(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].itemType$) = "subtitle")
				OryUIPinTextToCentreLeftOfSprite(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].txtSubtitle, OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].sprContainer, oryUIDefaults.navigationDrawerSubtitleTextLeftPadding#, 0)	
			endif
		endif
	next
endfunction

function OryUISetNavigationDrawerItemCount(oryUINavigationDrawerID as integer, oryUINewNavigationDrawerItemCount as integer)
	local oryUIForI as integer
	local oryUIOldNavigationDrawerItemCount as integer
	
	oryUIOldNavigationDrawerItemCount = OryUIGetNavigationDrawerItemCount(oryUINavigationDrawerID) - 1
	while (OryUIGetNavigationDrawerItemCount(oryUINavigationDrawerID) - 1 > oryUINewNavigationDrawerItemCount - 1)
		OryUIDeleteNavigationDrawerItem(oryUINavigationDrawerID, OryUIGetNavigationDrawerItemCount(oryUINavigationDrawerID) - 1)
	endwhile
	for oryUIForI = 0 to oryUINewNavigationDrawerItemCount - 1
		if (oryUIForI > oryUIOldNavigationDrawerItemCount)
			OryUIInsertNavigationDrawerItem(oryUINavigationDrawerID, -1, "")
		endif
	next
endfunction

function OryUISetNavigationDrawerItemSelectedByIndex(oryUINavigationDrawerID as integer, oryUIItemID as integer)
	OryUINavigationDrawerCollection[oryUINavigationDrawerID].selected = oryUIItemID
	OryUINavigationDrawerCollection[oryUINavigationDrawerID].selectedChange = 1
endfunction

function OryUISetNavigationDrawerItemSelectedByName(oryUINavigationDrawerID as integer, oryUIItemName$ as string)
	local oryUIForI as integer
	
	for oryUIForI = 0 to OryUIGetNavigationDrawerItemCount(oryUINavigationDrawerID) - 1
		if (lower(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUIForI].name$) = lower(oryUIItemName$))
			OryUINavigationDrawerCollection[oryUINavigationDrawerID].selected = oryUIForI + 1
			OryUINavigationDrawerCollection[oryUINavigationDrawerID].selectedChange = 1
		endif
	next
endfunction

function OryUIShowNavigationDrawer(oryUINavigationDrawerID as integer)
	local oryUINavigationDrawerHeight# as float
	
	oryUIScrimDepth = GetSpriteDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprScrim)
	oryUIScrimVisible = 1
	oryUIBlockScreenScrolling = 1
	OryUINavigationDrawerCollection[oryUINavigationDrawerID].visible = 1

	oryUINavigationDrawerHeight# = OryUIGetNavigationDrawerHeight(oryUINavigationDrawerID)

	SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprScrim, GetViewOffsetX(), GetViewOffsetY() + GetScreenBoundsTop())	
	if (lower(OryUINavigationDrawerCollection[oryUINavigationDrawerID].drawerType$) = "modal")
		if (lower(OryUINavigationDrawerCollection[oryUINavigationDrawerID].drawerLocation$) = "left")
			if (oryUINavigationDrawerHeight# < abs(GetScreenBoundsTop() * 2) + 100)
				SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, oryUIDefaults.navigationDrawerWidth#, abs(GetScreenBoundsTop() * 2) + 100)
			else
				SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, oryUIDefaults.navigationDrawerWidth#, oryUINavigationDrawerHeight#)
			endif
			SetSpriteOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, 0, 0)
			SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, GetViewOffsetX(), GetViewOffsetY() + GetScreenBoundsTop())
			//SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, oryUIDefaults.navigationDrawerColor#[1], oryUIDefaults.navigationDrawerColor#[2], oryUIDefaults.navigationDrawerColor#[3], oryUIDefaults.navigationDrawerColor#[4])
			SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprStatusBar, GetSpriteX(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer), GetViewOffsetY() + GetScreenBoundsTop())
			SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprStatusBar, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer), GetSpriteHeight(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprStatusBar))
			SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprStatusBar, oryUIDefaults.navigationDrawerStatusBarColor#[1], oryUIDefaults.navigationDrawerStatusBarColor#[2], oryUIDefaults.navigationDrawerStatusBarColor#[3], oryUIDefaults.navigationDrawerStatusBarColor#[4])
			if (OryUINavigationDrawerCollection[oryUINavigationDrawerID].showShadow = 1)
				SetSpriteImage(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, oryUIRightShadowImage)
				SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, 1, 100)
				SetSpriteOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, 0, 0)
				SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, GetSpriteX(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer) + GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer), GetViewOffsetY() + GetScreenBoundsTop())
			endif
		elseif (lower(OryUINavigationDrawerCollection[oryUINavigationDrawerID].drawerLocation$) = "right")
			if (oryUINavigationDrawerHeight# < abs(GetScreenBoundsTop() * 2) + 100)
				SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, oryUIDefaults.navigationDrawerWidth#, abs(GetScreenBoundsTop() * 2) + 100)
			else
				SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, oryUIDefaults.navigationDrawerWidth#, oryUINavigationDrawerHeight#)
			endif
			SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, oryUIDefaults.navigationDrawerWidth#, oryUINavigationDrawerHeight#)
			SetSpriteOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer), 0)
			SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, GetViewOffsetX() + 100, GetViewOffsetY() + GetScreenBoundsTop())
			//SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, oryUIDefaults.navigationDrawerColor#[1], oryUIDefaults.navigationDrawerColor#[2], oryUIDefaults.navigationDrawerColor#[3], oryUIDefaults.navigationDrawerColor#[4])
			SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprStatusBar, GetSpriteX(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer), GetViewOffsetY() + GetScreenBoundsTop())
			SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprStatusBar, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer), GetSpriteHeight(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprStatusBar))
			//SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprStatusBar, oryUIDefaults.navigationDrawerStatusBarColor#[1], oryUIDefaults.navigationDrawerStatusBarColor#[2], oryUIDefaults.navigationDrawerStatusBarColor#[3], oryUIDefaults.navigationDrawerStatusBarColor#[4])
			if (OryUINavigationDrawerCollection[oryUINavigationDrawerID].showShadow = 1)
				SetSpriteImage(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, oryUILeftShadowImage)
				SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, 1, 100)
				SetSpriteOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow), 0)
				SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, GetSpriteX(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer), GetViewOffsetY() + GetScreenBoundsTop())
			endif
		//elseif (lower(OryUINavigationDrawerCollection[oryUINavigationDrawerID].drawerLocation$) = "bottom")
			//if (oryUINavigationDrawerHeight# > abs(GetScreenBoundsTop() * 2) + 50)
				//SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, 100, abs(GetScreenBoundsTop() * 2) + 50)
				//SetSpriteOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, 0, 0)
				//SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, 0, abs(GetScreenBoundsTop() * 2) + 50)
				//SetSpriteImage(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, oryUITopShadowImage)
				//SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, 100, 1)
				//SetSpriteOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, 0, GetSpriteHeight(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow))
				//SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, GetSpriteX(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer), GetViewOffsetY() + GetScreenBoundsTop() + 50)
			//else
				//SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, 100, oryUINavigationDrawerHeight#)
				//SetSpriteOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, 0, GetSpriteHeight(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer))
				//SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, 0, 100)
				//SetSpriteImage(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, oryUITopShadowImage)
				//SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, 100, 1)
				//SetSpriteOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, 0, GetSpriteHeight(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow))
				//SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprShadow, GetSpriteX(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer), GetSpriteY(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer))
			//endif
			//SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprStatusBar, -999999, -999999)
		endif
	endif

	OryUIPositionItemsInNavigationDrawer(oryUINavigationDrawerID)
endfunction

function OryUIUpdateNavigationDrawer(oryUINavigationDrawerID as integer, oryUIWidgetParameters$ as string)
	OryUISetParametersType(oryUIWidgetParameters$)

	if (GetSpriteExists(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer))
		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE WIDGET
		if (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, oryUIParameters.position#[1], oryUIParameters.position#[2])
		elseif (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, oryUIParameters.position#[1], GetSpriteYByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer))
		elseif (oryUIParameters.position#[1] = -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, GetSpriteXByOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer), oryUIParameters.position#[2])
		endif
		
		// THE REST OF THE PARAMETERS NEXT
		if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999 or oryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], oryUIParameters.color#[4])
		endif
		if (oryUIParameters.depth > -999999)
			SetSpriteDepth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, oryUIParameters.depth)
		endif
		if (oryUIParameters.drawerType$ <> "")
			if (lower(oryUIParameters.drawerType$) = "modal")
				OryUINavigationDrawerCollection[oryUINavigationDrawerID].drawerType$ = "modal"
			endif
		endif
		if (oryUIParameters.drawerLocation$ <> "")
			if (OryUINavigationDrawerCollection[oryUINavigationDrawerID].drawerType$ = "modal")
				//if (lower(oryUIParameters.drawerLocation$) = "bottom")
				//	OryUINavigationDrawerCollection[oryUINavigationDrawerID].drawerLocation$ = "bottom"
				//elseif (lower(oryUIParameters.drawerLocation$) = "left")
				if (lower(oryUIParameters.drawerLocation$) = "left")
					OryUINavigationDrawerCollection[oryUINavigationDrawerID].drawerLocation$ = "left"
				elseif (lower(oryUIParameters.drawerLocation$) = "right")
					OryUINavigationDrawerCollection[oryUINavigationDrawerID].drawerLocation$ = "right"
				endif
			endif
		endif	
		if (oryUIParameters.imageID > -999999)
			SetSpriteImage(OryUINavigationDrawerCollection[oryUINavigationDrawerID].sprContainer, oryUIParameters.imageID)
		endif
		if (oryUIParameters.showIcon > -999999)
			OryUINavigationDrawerCollection[oryUINavigationDrawerID].showIcon = oryUIParameters.showIcon
		endif
		if (oryUIParameters.showRightText > -999999)
			OryUINavigationDrawerCollection[oryUINavigationDrawerID].showRightText = oryUIParameters.showRightText
		endif
		if (oryUIParameters.showShadow > -999999)
			OryUINavigationDrawerCollection[oryUINavigationDrawerID].showShadow = oryUIParameters.showShadow
		endif
	endif
endfunction

function OryUIUpdateNavigationDrawerItem(oryUINavigationDrawerID as integer, oryUINavigationDrawerItemID as integer, oryUIWidgetParameters$ as string)
	OryUISetParametersType(oryUIWidgetParameters$)

	if (GetSpriteExists(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprContainer))
		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE WIDGET
		if (lower(oryUIParameters.itemType$) = "divider")
			OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].itemType$ = "divider"
			SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprContainer, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprContainer), oryUIDefaults.navigationDrawerDividerHeight#)
			SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprDivider, oryUIDefaults.navigationDrawerDividerColor#[1], oryUIDefaults.navigationDrawerDividerColor#[2], oryUIDefaults.navigationDrawerDividerColor#[3], oryUIDefaults.navigationDrawerDividerColor#[4])
		endif
		if (lower(oryUIParameters.itemType$) = "header")
			OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].itemType$ = "header"
			SetSpriteImage(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprContainer, oryUIDefaults.navigationDrawerHeaderBackroundImage)	
			SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprContainer, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprContainer), oryUIDefaults.navigationDrawerHeaderHeight#)	
			SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprContainer, oryUIDefaults.navigationDrawerHeaderColor#[1], oryUIDefaults.navigationDrawerHeaderColor#[2], oryUIDefaults.navigationDrawerHeaderColor#[3], oryUIDefaults.navigationDrawerHeaderColor#[4])
			SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprHeaderTextScrim, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprContainer), oryUIDefaults.navigationDrawerHeaderTextScrimHeight#)	
			SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprHeaderTextScrim, oryUIDefaults.navigationDrawerHeaderTextScrimColor#[1], oryUIDefaults.navigationDrawerHeaderTextScrimColor#[2], oryUIDefaults.navigationDrawerHeaderTextScrimColor#[3], oryUIDefaults.navigationDrawerHeaderTextScrimColor#[4])
			SetTextSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtLabel, oryUIDefaults.navigationDrawerHeaderTextSize#)
			SetTextBold(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtLabel, oryUIDefaults.navigationDrawerHeaderTextBold)
			SetTextColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtLabel, oryUIDefaults.navigationDrawerHeaderTextColor#[1], oryUIDefaults.navigationDrawerHeaderTextColor#[2], oryUIDefaults.navigationDrawerHeaderTextColor#[3], oryUIDefaults.navigationDrawerHeaderTextColor#[4])
		endif
		if (lower(oryUIParameters.itemType$) = "option")
			OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].itemType$ = "option"
			SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprContainer, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprContainer), oryUIDefaults.navigationDrawerOptionHeight#)
			SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprContainer, oryUIDefaults.navigationDrawerOptionColor#[1], oryUIDefaults.navigationDrawerOptionColor#[2], oryUIDefaults.navigationDrawerOptionColor#[3], oryUIDefaults.navigationDrawerOptionColor#[4])
			if (OryUINavigationDrawerCollection[oryUINavigationDrawerID].showIcon = 1)
				SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprIcon, -1, 3.5)
				SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprIcon, oryUIDefaults.navigationDrawerOptionIconColor#[1], oryUIDefaults.navigationDrawerOptionIconColor#[2], oryUIDefaults.navigationDrawerOptionIconColor#[3], oryUIDefaults.navigationDrawerOptionIconColor#[4])
				if (oryUIParameters.icon$ <> "" and oryUIParameters.iconID > -999999)
					OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].icon$ = lower(oryUIParameters.icon$)
					SetSpriteImage(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprIcon, oryUIParameters.iconID)
				elseif (oryUIParameters.iconID > -999999)
					OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].icon$ = "custom"
					SetSpriteImage(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprIcon, oryUIParameters.iconID)
				endif
				if (OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].icon$ <> "")
					SetSpriteColorAlpha(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprIcon, 255)
				else
					SetSpriteColorAlpha(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprIcon, 0)
				endif
			elseif (OryUINavigationDrawerCollection[oryUINavigationDrawerID].showIcon = 0)
				SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprIcon, 0, 0)
			endif
			SetTextSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtLabel, oryUIDefaults.navigationDrawerOptionTextSize#)
			SetTextBold(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtLabel, oryUIDefaults.navigationDrawerOptionTextBold)
			SetTextColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtLabel, oryUIDefaults.navigationDrawerOptionTextColor#[1], oryUIDefaults.navigationDrawerOptionTextColor#[2], oryUIDefaults.navigationDrawerOptionTextColor#[3], oryUIDefaults.navigationDrawerOptionTextColor#[4])
			SetTextSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtRightLabel, oryUIDefaults.navigationDrawerOptionRightTextSize#)
			SetTextBold(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtRightLabel, oryUIDefaults.navigationDrawerOptionRightTextBold)
			SetTextColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtRightLabel, oryUIDefaults.navigationDrawerOptionRightTextColor#[1], oryUIDefaults.navigationDrawerOptionRightTextColor#[2], oryUIDefaults.navigationDrawerOptionRightTextColor#[3], oryUIDefaults.navigationDrawerOptionRightTextColor#[4])
			SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprActiveOverlay, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprContainer), oryUIDefaults.navigationDrawerOptionActiveOverlayHeight#)
			SetSpriteOffset(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprActiveOverlay, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprActiveOverlay) / 2, GetSpriteHeight(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprActiveOverlay) / 2)
			SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprActiveOverlay, oryUIDefaults.navigationDrawerOptionActiveOverlayColor#[1], oryUIDefaults.navigationDrawerOptionActiveOverlayColor#[2], oryUIDefaults.navigationDrawerOptionActiveOverlayColor#[3], oryUIDefaults.navigationDrawerOptionActiveOverlayColor#[4])
		endif
		if (lower(oryUIParameters.itemType$) = "subtitle")
			OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].itemType$ = "subtitle"
			SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprContainer, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprContainer), oryUIDefaults.navigationDrawerSubtitleHeight#)
			SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprContainer, oryUIDefaults.navigationDrawerSubtitleColor#[1], oryUIDefaults.navigationDrawerSubtitleColor#[2], oryUIDefaults.navigationDrawerSubtitleColor#[3], oryUIDefaults.navigationDrawerSubtitleColor#[4])
			SetTextSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtSubtitle, oryUIDefaults.navigationDrawerSubtitleTextSize#)
			SetTextBold(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtSubtitle, oryUIDefaults.navigationDrawerSubtitleTextBold)
			SetTextColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtSubtitle, oryUIDefaults.navigationDrawerSubtitleTextColor#[1], oryUIDefaults.navigationDrawerSubtitleTextColor#[2], oryUIDefaults.navigationDrawerSubtitleTextColor#[3], oryUIDefaults.navigationDrawerSubtitleTextColor#[4])
		endif
		if (oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprContainer, GetSpriteWidth(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprContainer), oryUIParameters.size#[2])
		endif
		
		// THE REST OF THE PARAMETERS NEXT
		if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999 or oryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprContainer, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], oryUIParameters.color#[4])
		endif
		if (oryUIParameters.imageID > -999999)
			SetSpriteImage(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprContainer, oryUIParameters.imageID)
		endif
		if (oryUIParameters.text$ <> "")
			if (lower(oryUIParameters.text$) = "null") then oryUIParameters.text$ = ""
			SetTextString(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtLabel, oryUIParameters.text$)
		endif
		if (GetTextString(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtLabel) = "")
			SetSpriteColorAlpha(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprHeaderTextScrim, 0)
		endif
		if (oryUIParameters.textBold > -999999)
			SetTextBold(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtLabel, oryUIParameters.textBold)
		endif
		if (oryUIParameters.textColor#[1] > -999999 or oryUIParameters.textColor#[2] > -999999 or oryUIParameters.textColor#[3] > -999999 or oryUIParameters.textColor#[4] > -999999)
			SetTextColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtLabel, oryUIParameters.textColor#[1], oryUIParameters.textColor#[2], oryUIParameters.textColor#[3], oryUIParameters.textColor#[4])
		endif
		if (oryUIParameters.textSize# > -999999)
			SetTextSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtLabel, oryUIParameters.textSize#)
		endif
		if (oryUIParameters.iconColor#[1] > -999999 or oryUIParameters.iconColor#[2] > -999999 or oryUIParameters.iconColor#[3] > -999999 or oryUIParameters.iconColor#[4] > -999999)
			SetSpriteColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].sprIcon, oryUIParameters.iconColor#[1], oryUIParameters.iconColor#[2], oryUIParameters.iconColor#[3], oryUIParameters.iconColor#[4])
		endif
		if (oryUIParameters.name$ <> "")
			if (lower(oryUIParameters.name$) = "null") then oryUIParameters.name$ = ""
			OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].name$ = oryUIParameters.name$
		endif
		if (oryUIParameters.rightText$ <> "")
			if (lower(oryUIParameters.rightText$) = "null") then oryUIParameters.rightText$ = ""
			SetTextString(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtRightLabel, oryUIParameters.rightText$)
		endif
		if (oryUIParameters.rightTextBold > -999999)
			SetTextBold(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtRightLabel, oryUIParameters.rightTextBold)
		endif
		if (oryUIParameters.rightTextColor#[1] > -999999 or oryUIParameters.rightTextColor#[2] > -999999 or oryUIParameters.rightTextColor#[3] > -999999 or oryUIParameters.rightTextColor#[4] > -999999)
			SetTextColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtRightLabel, oryUIParameters.rightTextColor#[1], oryUIParameters.rightTextColor#[2], oryUIParameters.rightTextColor#[3], oryUIParameters.rightTextColor#[4])
		endif
		if (oryUIParameters.rightTextSize# > -999999)
			SetTextSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtRightLabel, oryUIParameters.rightTextSize#)
		endif
		if (oryUIParameters.subtitleText$ <> "")
			if (lower(oryUIParameters.subtitleText$) = "null") then oryUIParameters.subtitleText$ = ""
			SetTextString(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtSubtitle, oryUIParameters.subtitleText$)
		endif
		if (oryUIParameters.subtitleTextBold > -999999)
			SetTextBold(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtSubtitle, oryUIParameters.subtitleTextBold)
		endif
		if (oryUIParameters.subtitleTextColor#[1] > -999999 or oryUIParameters.subtitleTextColor#[2] > -999999 or oryUIParameters.subtitleTextColor#[3] > -999999 or oryUIParameters.subtitleTextColor#[4] > -999999)
			SetTextColor(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtSubtitle, oryUIParameters.subtitleTextColor#[1], oryUIParameters.subtitleTextColor#[2], oryUIParameters.subtitleTextColor#[3], oryUIParameters.subtitleTextColor#[4])
		endif
		if (oryUIParameters.subtitleTextSize# > -999999)
			SetTextSize(OryUINavigationDrawerCollection[oryUINavigationDrawerID].items[oryUINavigationDrawerItemID - 1].txtSubtitle, oryUIParameters.subtitleTextSize#)
		endif
	endif
endfunction

foldend
