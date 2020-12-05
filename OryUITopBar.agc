
foldstart // OryUITopBar Widget (Updated 07/07/2020)

type typeOryUITopBar
	id as integer
	actionReleased as integer
	actions as typeOryUITopBarAction[]
	defaultIconColor# as float[4]
	extended as integer
	navigationIcon$ as string
	navigationName$ as string
	//overflowMenu as integer
	navigationPressed as integer
	navigationReleased as integer
	sprContainer as integer
	sprNavigationIcon as integer
	sprShadow as integer
	sprStatusBar as integer
	txtTitle as integer
endtype

type typeOryUITopBarAction
	id as integer
	icon$ as string
	label$ as string
	name$ as string
	pressed as integer
	sprIcon as integer
	txtLabel as integer
endtype

global OryUITopBarCollection as typeOryUITopBar[]
OryUITopBarCollection.length = 1

function OryUICreateTopBar(oryUIWidgetParameters$ as string)
	local oryUITopBarID as integer
	OryUITopBarCollection.length = OryUITopBarCollection.length + 1
	oryUITopBarID = OryUITopBarCollection.length
	OryUITopBarCollection[oryUITopBarID].id = oryUITopBarID

	oryUICreatedWidgets.insert(OryUIAddCreatedWidget(oryUITopBarID, "TopBar"))

	// DEFAULT SETTINGS
	OryUITopBarCollection[oryUITopBarID].defaultIconColor#[1] = 255
	OryUITopBarCollection[oryUITopBarID].defaultIconColor#[2] = 255
	OryUITopBarCollection[oryUITopBarID].defaultIconColor#[3] = 255
	OryUITopBarCollection[oryUITopBarID].defaultIconColor#[4] = 255
	OryUITopBarCollection[oryUITopBarID].extended = 0
	
	OryUITopBarCollection[oryUITopBarID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUITopBarCollection[oryUITopBarID].sprContainer, 100, 8.63 + OryUIStatusBarHeight#)
	SetSpriteColor(OryUITopBarCollection[oryUITopBarID].sprContainer, 52, 73, 94, 255)
	SetSpriteOffset(OryUITopBarCollection[oryUITopBarID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUITopBarCollection[oryUITopBarID].sprContainer, 0, 0)
	SetSpritePhysicsOff(OryUITopBarCollection[oryUITopBarID].sprContainer)

	OryUITopBarCollection[oryUITopBarID].sprStatusBar = CreateSprite(0)
	SetSpriteSize(OryUITopBarCollection[oryUITopBarID].sprStatusBar, 100, OryUIStatusBarHeight#)
	SetSpriteDepth(OryUITopBarCollection[oryUITopBarID].sprStatusBar, GetSpriteDepth(OryUITopBarCollection[oryUITopBarID].sprContainer) - 1)
	SetSpriteColor(OryUITopBarCollection[oryUITopBarID].sprStatusBar, 0, 0, 0, 66)
	SetSpriteOffset(OryUITopBarCollection[oryUITopBarID].sprStatusBar, 0, 0)
	SetSpritePositionByOffset(OryUITopBarCollection[oryUITopBarID].sprStatusBar, GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprContainer), GetSpriteY(OryUITopBarCollection[oryUITopBarID].sprContainer))
	SetSpritePhysicsOff(OryUITopBarCollection[oryUITopBarID].sprStatusBar)
	
	OryUITopBarCollection[oryUITopBarID].sprNavigationIcon = CreateSprite(0)
	SetSpriteSize(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon, -1, 3.69)
	SetSpriteDepth(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon, GetSpriteDepth(OryUITopBarCollection[oryUITopBarID].sprContainer) - 1)
	SetSpriteColor(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon, 255, 255, 255, 255)
	SetSpriteOffset(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon, 0, 0)
	SetSpritePositionByOffset(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon, GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprContainer) + 2.46 / GetDisplayAspect(), GetSpriteY(OryUITopBarCollection[oryUITopBarID].sprContainer) + OryUIStatusBarHeight# + 2.46)
	SetSpritePhysicsOff(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon)
	
	OryUITopBarCollection[oryUITopBarID].txtTitle = CreateText(" ")
	SetTextSize(OryUITopBarCollection[oryUITopBarID].txtTitle, 3.5)
	SetTextBold(OryUITopBarCollection[oryUITopBarID].txtTitle, 1)
	SetTextDepth(OryUITopBarCollection[oryUITopBarID].txtTitle, GetSpriteDepth(OryUITopBarCollection[oryUITopBarID].sprContainer) - 1)
	SetTextColor(OryUITopBarCollection[oryUITopBarID].txtTitle, 255, 255, 255, 255)
	SetTextAlignment(OryUITopBarCollection[oryUITopBarID].txtTitle, 0)
	OryUIPinTextToCentreLeftOfSprite(OryUITopBarCollection[oryUITopBarID].txtTitle, OryUITopBarCollection[oryUITopBarID].sprContainer, GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon) + GetSpriteWidth(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon) + ((2.46 * 2) / GetDisplayAspect()), OryUIStatusBarHeight# / 2)

	OryUITopBarCollection[oryUITopBarID].sprShadow = CreateSprite(0)
	SetSpriteSize(OryUITopBarCollection[oryUITopBarID].sprShadow, 100, 1)
	SetSpriteDepth(OryUITopBarCollection[oryUITopBarID].sprShadow, GetSpriteDepth(OryUITopBarCollection[oryUITopBarID].sprContainer))
	SetSpriteImage(OryUITopBarCollection[oryUITopBarID].sprShadow, oryUITopBarShadowImage)
	SetSpriteOffset(OryUITopBarCollection[oryUITopBarID].sprShadow, 0, 0)
	SetSpritePositionByOffset(OryUITopBarCollection[oryUITopBarID].sprShadow, GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprContainer), GetSpriteY(OryUITopBarCollection[oryUITopBarID].sprContainer) + GetSpriteHeight(OryUITopBarCollection[oryUITopBarID].sprContainer))
	SetSpritePhysicsOff(OryUITopBarCollection[oryUITopBarID].sprShadow)
	
	if (oryUIWidgetParameters$ <> "") then OryUIUpdateTopBar(oryUITopBarID, oryUIWidgetParameters$)
endfunction oryUITopBarID

function OryUIDeleteTopBar(oryUITopBarID as integer)
	DeleteSprite(OryUITopBarCollection[oryUITopBarID].sprContainer)
	DeleteSprite(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon)
	DeleteSprite(OryUITopBarCollection[oryUITopBarID].sprShadow)
	DeleteSprite(OryUITopBarCollection[oryUITopBarID].sprStatusBar)
	DeleteText(OryUITopBarCollection[oryUITopBarID].txtTitle)
	while (OryUITopBarCollection[oryUITopBarID].actions.length >= 0)
		OryUIDeleteTopBarAction(oryUITopBarID, 0)
	endwhile
endfunction

function OryUIDeleteTopBarAction(oryUITopBarID as integer, oryUIActionID as integer)
	DeleteSprite(OryUITopBarCollection[oryUITopBarID].actions[oryUIActionID].sprIcon)
	DeleteText(OryUITopBarCollection[oryUITopBarID].actions[oryUIActionID].txtLabel)
	OryUITopBarCollection[oryUITopBarID].actions.remove(oryUIActionID)
endfunction

function OryUIGetTopBarActionCount(oryUITopBarID as integer)
	local oryUITopBarActionCount as integer
	oryUITopBarActionCount = OryUITopBarCollection[oryUITopBarID].actions.length + 1
endfunction oryUITopBarActionCount

function OryUIGetTopBarActionHeightByIcon(oryUITopBarID as integer, oryUIActionIcon$ as string)
	local oryUIForI as integer
	local oryUITopBarActionHeight# as float
	for oryUIForI = 0 to OryUIGetTopBarActionCount(oryUITopBarID) - 1
		if (GetSpriteExists(OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].sprIcon))
			if (lower(OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].icon$) = lower(oryUIActionIcon$))
				oryUITopBarActionHeight# = GetSpriteHeight(OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].sprIcon)
			endif
		endif
	next
endfunction oryUITopBarActionHeight#

function OryUIGetTopBarActionHeightByID(oryUITopBarID as integer, oryUIActionID as integer)
	local oryUITopBarActionHeight# as float
	if (GetSpriteExists(OryUITopBarCollection[oryUITopBarID].actions[oryUIActionID - 1].sprIcon))
		oryUITopBarActionHeight# = GetSpriteHeight(OryUITopBarCollection[oryUITopBarID].actions[oryUIActionID - 1].sprIcon)
	endif
endfunction oryUITopBarActionHeight#

function OryUIGetTopBarActionReleasedIcon(oryUITopBarID as integer)
	local oryUITopBarActionIcon$ as string
	if (OryUITopBarCollection[oryUITopBarID].actionReleased > -1)
		oryUITopBarActionIcon$ = OryUITopBarCollection[oryUITopBarID].actions[OryUITopBarCollection[oryUITopBarID].actionReleased].icon$
	endif
endfunction oryUITopBarActionIcon$

function OryUIGetTopBarActionReleasedID(oryUITopBarID as integer)
	local oryUITopBarActionID as integer
	if (OryUITopBarCollection[oryUITopBarID].actionReleased > -1)
		oryUITopBarActionID = OryUITopBarCollection[oryUITopBarID].actionReleased + 1
	endif
endfunction oryUITopBarActionID

function OryUIGetTopBarActionReleasedName(oryUITopBarID as integer)
	local oryUITopBarActionName$ as string
	if (OryUITopBarCollection[oryUITopBarID].actionReleased > -1)
		oryUITopBarActionName$ = OryUITopBarCollection[oryUITopBarID].actions[OryUITopBarCollection[oryUITopBarID].actionReleased].name$
	endif
endfunction oryUITopBarActionName$

function OryUIGetTopBarActionWidthByIcon(oryUITopBarID as integer, oryUIActionIcon$ as string)
	local oryUIForI as integer
	local oryUITopBarActionWidth# as float
	for oryUIForI = 0 to OryUIGetTopBarActionCount(oryUITopBarID) - 1
		if (GetSpriteExists(OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].sprIcon))
			if (lower(OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].icon$) = lower(oryUIActionIcon$))
				oryUITopBarActionWidth# = GetSpriteWidth(OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].sprIcon)
			endif
		endif
	next
endfunction oryUITopBarActionWidth#

function OryUIGetTopBarActionWidthByID(oryUITopBarID as integer, oryUIActionID as integer)
	local oryUITopBarActionWidth# as float
	if (GetSpriteExists(OryUITopBarCollection[oryUITopBarID].actions[oryUIActionID - 1].sprIcon))
		oryUITopBarActionWidth# = GetSpriteWidth(OryUITopBarCollection[oryUITopBarID].actions[oryUIActionID - 1].sprIcon)
	endif
endfunction oryUITopBarActionWidth#

function OryUIGetTopBarActionXByIcon(oryUITopBarID as integer, oryUIActionIcon$ as string)
	local oryUIForI as integer
	local oryUITopBarActionX# as float
	for oryUIForI = 0 to OryUIGetTopBarActionCount(oryUITopBarID) - 1
		if (GetSpriteExists(OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].sprIcon))
			if (lower(OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].icon$) = lower(oryUIActionIcon$))
				oryUITopBarActionX# = GetSpriteX(OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].sprIcon)
			endif
		endif
	next
endfunction oryUITopBarActionX#

function OryUIGetTopBarActionYByIcon(oryUITopBarID as integer, oryUIActionIcon$ as string)
	local oryUIForI as integer
	local oryUITopBarActionY# as float
	for oryUIForI = 0 to OryUIGetTopBarActionCount(oryUITopBarID) - 1
		if (GetSpriteExists(OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].sprIcon))
			if (lower(OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].icon$) = lower(oryUIActionIcon$))
				oryUITopBarActionY# = GetSpriteY(OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].sprIcon)
			endif
		endif
	next
endfunction oryUITopBarActionY#

function OryUIGetTopBarActionXByID(oryUITopBarID as integer, oryUIActionID as integer)
	local oryUITopBarActionX# as float
	if (GetSpriteExists(OryUITopBarCollection[oryUITopBarID].actions[oryUIActionID - 1].sprIcon))
		oryUITopBarActionX# = GetSpriteX(OryUITopBarCollection[oryUITopBarID].actions[oryUIActionID - 1].sprIcon)
	endif
endfunction oryUITopBarActionX#

function OryUIGetTopBarActionYByID(oryUITopBarID as integer, oryUIActionID as integer)
	local oryUITopBarActionY# as float
	if (GetSpriteExists(OryUITopBarCollection[oryUITopBarID].actions[oryUIActionID - 1].sprIcon))
		oryUITopBarActionY# = GetSpriteY(OryUITopBarCollection[oryUITopBarID].actions[oryUIActionID - 1].sprIcon)
	endif
endfunction oryUITopBarActionY#

function OryUIGetTopBarHeight(oryUITopBarID as integer)
	local oryUITopBarHeight# as float
	if (GetSpriteExists(OryUITopBarCollection[oryUITopBarID].sprContainer))
		oryUITopBarHeight# = GetSpriteHeight(OryUITopBarCollection[oryUITopBarID].sprContainer)
	endif
endfunction oryUITopBarHeight#

function OryUIGetTopBarNavigationReleased(oryUITopBarID as integer)
	local oryUITopBarNavigationReleased as integer
	if (OryUITopBarCollection[oryUITopBarID].navigationReleased = 1)
		oryUITopBarNavigationReleased = 1
	endif
endfunction oryUITopBarNavigationReleased

function OryUIGetTopBarNavigationReleasedIcon(oryUITopBarID as integer)
	local oryUITopBarNavigationIcon$ as string
	if (OryUITopBarCollection[oryUITopBarID].navigationReleased = 1)
		oryUITopBarNavigationIcon$ = OryUITopBarCollection[oryUITopBarID].navigationIcon$
	endif
endfunction oryUITopBarNavigationIcon$

function OryUIGetTopBarNavigationReleasedName(oryUITopBarID as integer)
	local oryUITopBarNavigationName$ as string
	if (OryUITopBarCollection[oryUITopBarID].navigationReleased = 1)
		oryUITopBarNavigationName$ = OryUITopBarCollection[oryUITopBarID].navigationName$
	endif
endfunction oryUITopBarNavigationName$

function OryUIInsertTopBarAction(oryUITopBarID as integer, oryUIIndex, oryUIWidgetParameters$ as string)
	local oryUITopBarActionID as integer
	if (oryUIIndex = -1)
		OryUITopBarCollection[oryUITopBarID].actions.length = OryUITopBarCollection[oryUITopBarID].actions.length + 1
		oryUITopBarActionID = OryUITopBarCollection[oryUITopBarID].actions.length
		OryUITopBarCollection[oryUITopBarID].actions[oryUITopBarActionID].id = oryUITopBarActionID + 1
	endif

	OryUITopBarCollection[oryUITopBarID].actions[oryUITopBarActionID].sprIcon = CreateSprite(0)
	SetSpriteSize(OryUITopBarCollection[oryUITopBarID].actions[oryUITopBarActionID].sprIcon, -1, 3.69)
	SetSpriteDepth(OryUITopBarCollection[oryUITopBarID].actions[oryUITopBarActionID].sprIcon, GetSpriteDepth(OryUITopBarCollection[oryUITopBarID].sprContainer) - 1)
	SetSpriteColor(OryUITopBarCollection[oryUITopBarID].actions[oryUITopBarActionID].sprIcon, OryUITopBarCollection[oryUITopBarID].defaultIconColor#[1], OryUITopBarCollection[oryUITopBarID].defaultIconColor#[2], OryUITopBarCollection[oryUITopBarID].defaultIconColor#[3], OryUITopBarCollection[oryUITopBarID].defaultIconColor#[4])
	SetSpriteOffset(OryUITopBarCollection[oryUITopBarID].actions[oryUITopBarActionID].sprIcon, GetSpriteWidth(OryUITopBarCollection[oryUITopBarID].actions[oryUITopBarActionID].sprIcon), 0)
	SetSpritePhysicsOff(OryUITopBarCollection[oryUITopBarID].actions[oryUITopBarActionID].sprIcon)
	
	OryUIPositionNavigationAndActionsInTopBar(oryUITopBarID)
	
	if (oryUIWidgetParameters$ <> "") then OryUIUpdateTopBarAction(oryUITopBarID, oryUITopBarActionID + 1, oryUIWidgetParameters$)
endfunction

function OryUIInsertTopBarListener(oryUITopBarID as integer)	
	if (oryUIScrimVisible = 1)
		OryUITopBarCollection[oryUITopBarID].actionReleased = -1
		OryUITopBarCollection[oryUITopBarID].navigationReleased = 0
		exitfunction
	endif
	
	local oryUIForI as integer
	local oryUITopBarActionReleased as integer
	local oryUITopBarActionSprite as integer
	local oryUITopBarContainerSprite as integer
	local oryUITopBarNavigationReleased as integer
	local oryUITopBarNavigationSprite as integer

	SetSpritePositionByOffset(OryUITopBarCollection[oryUITopBarID].sprContainer, GetViewOffsetX(), GetViewOffsetY() + GetScreenBoundsTop())
	SetSpritePositionByOffset(OryUITopBarCollection[oryUITopBarID].sprStatusBar, GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprContainer), GetSpriteY(OryUITopBarCollection[oryUITopBarID].sprContainer))
	SetSpritePositionByOffset(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon, GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprContainer) + 2.46 / GetDisplayAspect(), GetSpriteY(OryUITopBarCollection[oryUITopBarID].sprContainer) + OryUIStatusBarHeight# + 2.46)
	if (OryUITopBarCollection[oryUITopBarID].extended = 0)
		//OryUIPinTextToCentreLeftOfSprite(OryUITopBarCollection[oryUITopBarID].txtTitle, OryUITopBarCollection[oryUITopBarID].sprContainer, GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon) + GetSpriteWidth(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon) + ((2.46 * 2) / GetDisplayAspect()), OryUIStatusBarHeight# / 2)
		SetTextY(OryUITopBarCollection[oryUITopBarID].txtTitle, ((GetSpriteY(OryUITopBarCollection[oryUITopBarID].sprContainer) + (GetSpriteHeight(OryUITopBarCollection[oryUITopBarID].sprContainer) / 2.0)) - (GetTextTotalHeight(OryUITopBarCollection[oryUITopBarID].txtTitle) / 2.0)) + (OryUIStatusBarHeight# / 2))
		if (GetTextAlignment(OryUITopBarCollection[oryUITopBarID].txtTitle) = 0)
			SetTextX(OryUITopBarCollection[oryUITopBarID].txtTitle, GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprContainer) + (2.46 / GetDisplayAspect()) + GetSpriteWidth(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon) + ((2.46 * 2) / GetDisplayAspect()))
		elseif (GetTextAlignment(OryUITopBarCollection[oryUITopBarID].txtTitle) = 1)
			SetTextX(OryUITopBarCollection[oryUITopBarID].txtTitle, GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprContainer) + 50)
		elseif (GetTextAlignment(OryUITopBarCollection[oryUITopBarID].txtTitle) = 2)
			SetTextX(OryUITopBarCollection[oryUITopBarID].txtTitle, (GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprContainer) + 100) - ((2.46 / GetDisplayAspect()) + GetSpriteWidth(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon) + ((2.46 * 2) / GetDisplayAspect())))
		endif
	else
		SetTextY(OryUITopBarCollection[oryUITopBarID].txtTitle, (GetSpriteY(OryUITopBarCollection[oryUITopBarID].sprContainer) + GetSpriteHeight(OryUITopBarCollection[oryUITopBarID].sprContainer)) - 2.46 - GetTextTotalHeight(OryUITopBarCollection[oryUITopBarID].txtTitle))
	endif
	if (GetTextAlignment(OryUITopBarCollection[oryUITopBarID].txtTitle) = 0)
		SetTextX(OryUITopBarCollection[oryUITopBarID].txtTitle, GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprContainer) + (2.46 / GetDisplayAspect()) + GetSpriteWidth(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon) + ((2.46 * 2) / GetDisplayAspect()))
	elseif (GetTextAlignment(OryUITopBarCollection[oryUITopBarID].txtTitle) = 1)
		SetTextX(OryUITopBarCollection[oryUITopBarID].txtTitle, GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprContainer) + 50)
	elseif (GetTextAlignment(OryUITopBarCollection[oryUITopBarID].txtTitle) = 2)
		SetTextX(OryUITopBarCollection[oryUITopBarID].txtTitle, (GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprContainer) + 100) - ((2.46 / GetDisplayAspect()) + GetSpriteWidth(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon) + ((2.46 * 2) / GetDisplayAspect())))
	endif
	SetSpritePositionByOffset(OryUITopBarCollection[oryUITopBarID].sprShadow, GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprContainer), GetViewOffsetY() + GetScreenBoundsTop() + GetSpriteHeight(OryUITopBarCollection[oryUITopBarID].sprContainer))
	OryUIPositionNavigationAndActionsInTopBar(oryUITopBarID)
	
	OryUITopBarCollection[oryUITopBarID].actionReleased = -1
	OryUITopBarCollection[oryUITopBarID].navigationReleased = 0
	if (GetSpriteExists(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon))
		if (OryUIGetSwipingVertically() = 0)
			oryUITopBarContainerSprite = GetSpriteHitTest(OryUITopBarCollection[oryUITopBarID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			if (GetPointerPressed())
				if (oryUITopBarContainerSprite = 1)
					oryUITouchingTopBar = 1
					oryUIBlockScreenScrolling = 1
				else
					oryUITouchingTopBar = 0
					oryUIBlockScreenScrolling = 0
				endif
			
				oryUITopBarNavigationSprite = GetSpriteHitTest(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				if (oryUITopBarNavigationSprite = 1)
					OryUITopBarCollection[oryUITopBarID].navigationPressed = 1
				endif
			else
				if (GetPointerState())
					if (oryUITopBarContainerSprite = 1)
						oryUITouchingTopBar = 1
						oryUIBlockScreenScrolling = 1
					else
						oryUITouchingTopBar = 0
						oryUIBlockScreenScrolling = 0
					endif
				
					oryUITopBarNavigationSprite = GetSpriteHitTest(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (OryUITopBarCollection[oryUITopBarID].navigationPressed)
						if (oryUITopBarNavigationSprite = 0)
							OryUITopBarCollection[oryUITopBarID].navigationPressed = 0
						endif
					endif
				endif
				if (GetPointerReleased())
					oryUITopBarNavigationSprite = GetSpriteHitTest(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (OryUITopBarCollection[oryUITopBarID].navigationPressed)
						if (oryUITopBarNavigationSprite = 1)
							OryUITopBarCollection[oryUITopBarID].navigationReleased = 1
						endif
					endif
					OryUITopBarCollection[oryUITopBarID].navigationPressed = 0
					oryUITouchingTopBar = 0
					oryUIBlockScreenScrolling = 0
				endif
			endif
		endif
	endif
	for oryUIForI = 0 to OryUIGetTopBarActionCount(oryUITopBarID) - 1
		if (GetSpriteExists(OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].sprIcon))
			if (OryUIGetSwipingVertically() = 0)
				if (GetPointerPressed())
					oryUITopBarActionSprite = GetSpriteHitTest(OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (oryUITopBarActionSprite = 1)
						OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].pressed = 1
					endif
				else
					if (GetPointerState())
						oryUITopBarActionSprite = GetSpriteHitTest(OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						if (OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].pressed)
							if (oryUITopBarActionSprite = 0)
								OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].pressed = 0
							endif
						endif
					endif
					if (GetPointerReleased())
						oryUITopBarActionSprite = GetSpriteHitTest(OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						if (OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].pressed)
							if (oryUITopBarActionSprite = 1)
								OryUITopBarCollection[oryUITopBarID].actionReleased = oryUIForI
							endif
						endif
						OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].pressed = 0
					endif
				endif
			endif
		endif
	next
endfunction

function OryUIPositionNavigationAndActionsInTopBar(oryUITopBarID as integer)
	local oryUIForI as integer
	
	SetSpritePositionByOffset(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon, GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprContainer) + 2.46 / GetDisplayAspect(), GetSpriteY(OryUITopBarCollection[oryUITopBarID].sprContainer) + OryUIStatusBarHeight# + 2.46)
	for oryUIForI = OryUITopBarCollection[oryUITopBarID].actions.length to 0 step -1
		SetSpritePositionByOffset(OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].sprIcon, (GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprContainer) + 100) - (2.46 / GetDisplayAspect()) - ((6.66 + GetSpriteWidth(OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].sprIcon)) * (OryUITopBarCollection[oryUITopBarID].actions.length - oryUIForI)), GetSpriteY(OryUITopBarCollection[oryUITopBarID].sprContainer) + OryUIStatusBarHeight# + 2.46)
	next
endfunction

function OryUISetTopBarActionCount(oryUITopBarID as integer, oryUINewTopBarActionCount as integer)
	local oryUIForI as integer
	local oryUIOldTopBarActionCount as integer
	
	oryUIOldTopBarActionCount = OryUIGetTopBarActionCount(oryUITopBarID) - 1
	while (OryUIGetTopBarActionCount(oryUITopBarID) - 1 > oryUINewTopBarActionCount - 1)
		OryUIDeleteTopBarAction(oryUITopBarID, OryUIGetTopBarActionCount(oryUITopBarID) - 1)
	endwhile
	for oryUIForI = 0 to oryUINewTopBarActionCount - 1
		if (oryUIForI > oryUIOldTopBarActionCount)
			OryUIInsertTopBarAction(oryUITopBarID, -1, "")
		endif
	next
endfunction

function OryUIUpdateTopBar(oryUITopBarID as integer, oryUIWidgetParameters$ as string)
	OryUISetParametersType(oryUIWidgetParameters$)

	local oryUIForI as integer
	
	if (GetSpriteExists(OryUITopBarCollection[oryUITopBarID].sprContainer))

		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE WIDGET
		if (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUITopBarCollection[oryUITopBarID].sprContainer, oryUIParameters.position#[1], oryUIParameters.position#[2])
			SetSpritePositionByOffset(OryUITopBarCollection[oryUITopBarID].sprStatusBar, oryUIParameters.position#[1], oryUIParameters.position#[2])
		elseif (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(OryUITopBarCollection[oryUITopBarID].sprContainer, oryUIParameters.position#[1], GetSpriteYByOffset(OryUITopBarCollection[oryUITopBarID].sprContainer))
			SetSpritePositionByOffset(OryUITopBarCollection[oryUITopBarID].sprStatusBar, oryUIParameters.position#[1], GetSpriteYByOffset(OryUITopBarCollection[oryUITopBarID].sprContainer))
		elseif (oryUIParameters.position#[1] = -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUITopBarCollection[oryUITopBarID].sprContainer, GetSpriteXByOffset(OryUITopBarCollection[oryUITopBarID].sprContainer), oryUIParameters.position#[2])
			SetSpritePositionByOffset(OryUITopBarCollection[oryUITopBarID].sprStatusBar, GetSpriteXByOffset(OryUITopBarCollection[oryUITopBarID].sprContainer), oryUIParameters.position#[2])
		endif
		if (oryUIParameters.extended > -999999)
			OryUITopBarCollection[oryUITopBarID].extended = oryUIParameters.extended
		endif
		if (OryUITopBarCollection[oryUITopBarID].extended = 1)
			SetSpriteSize(OryUITopBarCollection[oryUITopBarID].sprContainer, 100, 18)
			SetTextY(OryUITopBarCollection[oryUITopBarID].txtTitle, (GetSpriteY(OryUITopBarCollection[oryUITopBarID].sprContainer) + GetSpriteHeight(OryUITopBarCollection[oryUITopBarID].sprContainer)) - 2.46 - GetTextTotalHeight(OryUITopBarCollection[oryUITopBarID].txtTitle))
		endif
		SetSpritePositionByOffset(OryUITopBarCollection[oryUITopBarID].sprShadow, GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprContainer), GetSpriteY(OryUITopBarCollection[oryUITopBarID].sprContainer) + GetSpriteHeight(OryUITopBarCollection[oryUITopBarID].sprContainer))
		
		// THE REST OF THE PARAMETERS NEXT
		if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999 or oryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUITopBarCollection[oryUITopBarID].sprContainer, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], oryUIParameters.color#[4])
		endif
		if (oryUIParameters.depth > -999999)
			SetSpriteDepth(OryUITopBarCollection[oryUITopBarID].sprContainer, oryUIParameters.depth)
			SetTextDepth(OryUITopBarCollection[oryUITopBarID].txtTitle, oryUIParameters.depth - 1)
		endif
		if (oryUIParameters.iconColor#[1] > -999999 or oryUIParameters.iconColor#[2] > -999999 or oryUIParameters.iconColor#[3] > -999999 or oryUIParameters.iconColor#[4] > -999999)
			OryUITopBarCollection[oryUITopBarID].defaultIconColor#[1] = oryUIParameters.iconColor#[1]
			OryUITopBarCollection[oryUITopBarID].defaultIconColor#[2] = oryUIParameters.iconColor#[2]
			OryUITopBarCollection[oryUITopBarID].defaultIconColor#[3] = oryUIParameters.iconColor#[3]
			OryUITopBarCollection[oryUITopBarID].defaultIconColor#[4] = oryUIParameters.iconColor#[4]
			for oryUIForI = 0 to OryUITopBarCollection[oryUITopBarID].actions.length
				SetSpriteColor(OryUITopBarCollection[oryUITopBarID].actions[oryUIForI].sprIcon, oryUIParameters.iconColor#[1], oryUIParameters.iconColor#[2], oryUIParameters.iconColor#[3], oryUIParameters.iconColor#[4])
			next
		endif
		if (oryUIParameters.imageID > -999999)
			SetSpriteImage(OryUITopBarCollection[oryUITopBarID].sprContainer, oryUIParameters.imageID)
		endif
		if (oryUIParameters.navigationIcon$ = "null")
			OryUITopBarCollection[oryUITopBarID].navigationIcon$ = ""
			SetSpriteColorAlpha(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon, 0)
		elseif (oryUIParameters.navigationIcon$ <> "" and oryUIParameters.navigationIconID > -999999)
			OryUITopBarCollection[oryUITopBarID].navigationIcon$ = lower(oryUIParameters.navigationIcon$)
			SetSpriteImage(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon, oryUIParameters.navigationIconID)
			SetSpriteColorAlpha(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon, 255)
		elseif (oryUIParameters.navigationIconID > -999999)
			OryUITopBarCollection[oryUITopBarID].navigationIcon$ = "custom"
			SetSpriteImage(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon, oryUIParameters.navigationIconID)
			SetSpriteColorAlpha(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon, 255)
		endif
		if (oryUIParameters.navigationName$ <> "")
			if (lower(oryUIParameters.navigationName$) = "null") then oryUIParameters.navigationName$ = ""
			OryUITopBarCollection[oryUITopBarID].navigationName$ = oryUIParameters.navigationName$
		endif
		if (oryUIParameters.text$ <> "")
			if (lower(oryUIParameters.text$) = "null") then oryUIParameters.text$ = ""
			SetTextString(OryUITopBarCollection[oryUITopBarID].txtTitle, oryUIParameters.text$)
		endif
		if (oryUIParameters.textAlignment > -999999)
			SetTextAlignment(OryUITopBarCollection[oryUITopBarID].txtTitle, oryUIParameters.textAlignment)
		endif
		if (GetTextAlignment(OryUITopBarCollection[oryUITopBarID].txtTitle) = 0)
			SetTextX(OryUITopBarCollection[oryUITopBarID].txtTitle, GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprContainer) + (2.46 / GetDisplayAspect()) + GetSpriteWidth(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon) + ((2.46 * 2) / GetDisplayAspect()))
		elseif (GetTextAlignment(OryUITopBarCollection[oryUITopBarID].txtTitle) = 1)
			SetTextX(OryUITopBarCollection[oryUITopBarID].txtTitle, GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprContainer) + 50)
		elseif (GetTextAlignment(OryUITopBarCollection[oryUITopBarID].txtTitle) = 2)
			SetTextX(OryUITopBarCollection[oryUITopBarID].txtTitle, (GetSpriteX(OryUITopBarCollection[oryUITopBarID].sprContainer) + 100) - ((2.46 / GetDisplayAspect()) + GetSpriteWidth(OryUITopBarCollection[oryUITopBarID].sprNavigationIcon) + ((2.46 * 2) / GetDisplayAspect())))
		endif
		if (oryUIParameters.textBold > -999999)
			SetTextBold(OryUITopBarCollection[oryUITopBarID].txtTitle, oryUIParameters.textBold)
		endif
		if (oryUIParameters.textColor#[1] > -999999 or oryUIParameters.textColor#[2] > -999999 or oryUIParameters.textColor#[3] > -999999 or oryUIParameters.textColor#[4] > -999999)
			SetTextColor(OryUITopBarCollection[oryUITopBarID].txtTitle, oryUIParameters.textColor#[1], oryUIParameters.textColor#[2], oryUIParameters.textColor#[3], oryUIParameters.textColor#[4])
		endif
	endif

	OryUIPositionNavigationAndActionsInTopBar(oryUITopBarID)
endfunction

function OryUIUpdateTopBarAction(oryUITopBarID as integer, oryUITopBarActionID as integer, oryUIWidgetParameters$ as string)
	OryUISetParametersType(oryUIWidgetParameters$)

	if (oryUITopBarActionID - 1 <= OryUITopBarCollection[oryUITopBarID].actions.length)
		if (GetSpriteExists(OryUITopBarCollection[oryUITopBarID].actions[oryUITopBarActionID - 1].sprIcon))
			if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999 or oryUIParameters.color#[4] > -999999)
				SetSpriteColor(OryUITopBarCollection[oryUITopBarID].actions[oryUITopBarActionID - 1].sprIcon, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], oryUIParameters.color#[4])
			endif
			if (oryUIParameters.icon$ <> "" and oryUIParameters.iconID > -999999)
				OryUITopBarCollection[oryUITopBarID].actions[oryUITopBarActionID - 1].icon$ = lower(oryUIParameters.icon$)
				SetSpriteImage(OryUITopBarCollection[oryUITopBarID].actions[oryUITopBarActionID - 1].sprIcon, oryUIParameters.iconID)
			elseif (oryUIParameters.iconID > -999999)
				OryUITopBarCollection[oryUITopBarID].actions[oryUITopBarActionID - 1].icon$ = "custom"
				SetSpriteImage(OryUITopBarCollection[oryUITopBarID].actions[oryUITopBarActionID - 1].sprIcon, oryUIParameters.iconID)
			endif
			if (oryUIParameters.name$ <> "")
				if (lower(oryUIParameters.name$) = "null") then oryUIParameters.name$ = ""
				OryUITopBarCollection[oryUITopBarID].actions[oryUITopBarActionID - 1].name$ = lower(oryUIParameters.name$)
			endif
		endif
	endif

	OryUIPositionNavigationAndActionsInTopBar(oryUITopBarID)
endfunction


foldend
