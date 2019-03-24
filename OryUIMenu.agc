
foldstart // OryUIMenu Component (Updated 23/03/2019)

type typeOryUIMenu
	id as integer
	backgroundOverlayPressed as integer
	backgroundOverlayReleased as integer
	color# as float[4]
	itemPressed as integer
	itemReleased as integer
	items as typeOryUIMenuItem[]
	itemSize# as float[2]
	leftIconColor# as float[4]
	rightIconColor# as float[4]
	showLeftIcon as integer
	showRightIcon as integer
	sprBackgroundOverlay as integer
	sprContainer as integer
	textColor# as float[4]
	visible as integer
endtype

type typeOryUIMenuItem
	id as integer
	leftIcon$ as string
	name$ as string
	pressed as integer
	released as integer
	rightIcon$ as string
	sprContainer as integer
	sprLeftIcon as integer
	sprRightIcon as integer
	txtLabel as integer
endtype

global OryUIMenuCollection as typeOryUIMenu[]
OryUIMenuCollection.length = 1

function OryUICreateMenu(oryUIComponentParameters$ as string)
	local oryUIMenuID as integer
	OryUIMenuCollection.length = OryUIMenuCollection.length + 1
	oryUIMenuID = OryUIMenuCollection.length
	OryUIMenuCollection[oryUIMenuID].id = oryUIMenuID

	// DEFAULT SETTINGS
	OryUIMenuCollection[oryUIMenuID].color#[1] = 255
	OryUIMenuCollection[oryUIMenuID].color#[2] = 255
	OryUIMenuCollection[oryUIMenuID].color#[3] = 255
	OryUIMenuCollection[oryUIMenuID].color#[4] = 255
	OryUIMenuCollection[oryUIMenuID].itemSize#[1] = 48
	OryUIMenuCollection[oryUIMenuID].itemSize#[2] = 7
	OryUIMenuCollection[oryUIMenuID].leftIconColor#[1] = 0
	OryUIMenuCollection[oryUIMenuID].leftIconColor#[2] = 0
	OryUIMenuCollection[oryUIMenuID].leftIconColor#[3] = 0
	OryUIMenuCollection[oryUIMenuID].leftIconColor#[4] = 255
	OryUIMenuCollection[oryUIMenuID].rightIconColor#[1] = 0
	OryUIMenuCollection[oryUIMenuID].rightIconColor#[2] = 0
	OryUIMenuCollection[oryUIMenuID].rightIconColor#[3] = 0
	OryUIMenuCollection[oryUIMenuID].rightIconColor#[4] = 255
	OryUIMenuCollection[oryUIMenuID].showLeftIcon = 0
	OryUIMenuCollection[oryUIMenuID].showRightIcon = 0
	OryUIMenuCollection[oryUIMenuID].textColor#[1] = 0
	OryUIMenuCollection[oryUIMenuID].textColor#[2] = 0
	OryUIMenuCollection[oryUIMenuID].textColor#[3] = 0
	OryUIMenuCollection[oryUIMenuID].textColor#[4] = 255
	OryUIMenuCollection[oryUIMenuID].visible = 0

	OryUIMenuCollection[oryUIMenuID].sprBackgroundOverlay = CreateSprite(0)
	SetSpriteSize(OryUIMenuCollection[oryUIMenuID].sprBackgroundOverlay, 100, 100)
	SetSpriteDepth(OryUIMenuCollection[oryUIMenuID].sprBackgroundOverlay, 3)
	SetSpriteColor(OryUIMenuCollection[oryUIMenuID].sprBackgroundOverlay, 0, 0, 0, 66)
	SetSpriteOffset(OryUIMenuCollection[oryUIMenuID].sprBackgroundOverlay, 0, 0)
	SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].sprBackgroundOverlay, -999999, -999999)
	
	OryUIMenuCollection[oryUIMenuID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUIMenuCollection[oryUIMenuID].sprContainer, OryUIMenuCollection[oryUIMenuID].itemSize#[1], 0)
	SetSpriteDepth(OryUIMenuCollection[oryUIMenuID].sprContainer, 2)
	SetSpriteColor(OryUIMenuCollection[oryUIMenuID].sprContainer, OryUIMenuCollection[oryUIMenuID].color#[1], OryUIMenuCollection[oryUIMenuID].color#[2], OryUIMenuCollection[oryUIMenuID].color#[3], OryUIMenuCollection[oryUIMenuID].color#[4])
	SetSpriteOffset(OryUIMenuCollection[oryUIMenuID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].sprContainer, -999999, -999999)
	
	if (oryUIComponentParameters$ <> "") then OryUIUpdateMenu(oryUIMenuID, oryUIComponentParameters$)
endfunction oryUIMenuID

function OryUIDeleteMenu(oryUIMenuID as integer)
	DeleteSprite(OryUIMenuCollection[oryUIMenuID].sprBackgroundOverlay)
	DeleteSprite(OryUIMenuCollection[oryUIMenuID].sprContainer)
	while (OryUIMenuCollection[oryUIMenuID].items.length > 0)
		OryUIDeleteMenuItem(oryUIMenuID, 0)
	endwhile
endfunction

function OryUIDeleteMenuItem(oryUIMenuID as integer, oryUIMenuItemID as integer)
	DeleteSprite(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer)
	DeleteSprite(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprLeftIcon)
	DeleteSprite(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprRightIcon)
	DeleteText(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].txtLabel)
endfunction

function OryUIGetMenuHeight(oryUIMenuID as integer)
	local oryUIMenuEndY#
	local oryUIMenuHeight#
	local oryUIMenuStartY#
	oryUIMenuStartY# = GetSpriteY(OryUIMenuCollection[oryUIMenuID].sprContainer)
	for oryUIForI = OryUIGetMenuItemCount(oryUIMenuID) - 1 to 0 step -1
		if (GetSpriteExists(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer))
			oryUIMenuEndY# = GetSpriteY(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer) + GetSpriteHeight(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer)
			exit
		endif
	next
	oryUIMenuHeight# = oryUIMenuEndY# - oryUIMenuStartY#
	if (oryUIMenuHeight# < 0) then oryUIMenuHeight# = 0
endfunction oryUIMenuHeight#

function OryUIGetMenuItemCount(oryUIMenuID as integer)
	local oryUIMenuItemCount
	oryUIMenuItemCount = OryUIMenuCollection[oryUIMenuID].items.length + 1
endfunction oryUIMenuItemCount

function OryUIGetMenuItemReleasedByIndex(oryUIMenuID as integer, oryUIMenuItemIndex as integer)
	local oryUIMenuItemReleased as integer
	oryUIMenuItemReleased = 0
	if (OryUIMenuCollection[oryUIMenuID].itemReleased = oryUIMenuItemIndex) then oryUIMenuItemReleased = 1
endfunction oryUIMenuItemReleased

function OryUIGetMenuItemReleasedByName(oryUIMenuID as integer, oryUIMenuItemName$ as string)
	local oryUIMenuItemReleased as integer
	oryUIMenuItemReleased = 0
	if (OryUIMenuCollection[oryUIMenuID].itemReleased > 0)
		if (OryUIMenuCollection[oryUIMenuID].items[OryUIMenuCollection[oryUIMenuID].itemReleased - 1].name$ = oryUIMenuItemName$) then oryUIMenuItemReleased = 1
	endif
endfunction oryUIMenuItemReleased

function OryUIGetMenuItemReleasedIndex(oryUIMenuID as integer)
	local oryUIMenuItemReleasedIndex as integer
	oryUIMenuItemReleasedIndex = OryUIMenuCollection[oryUIMenuID].itemReleased
endfunction oryUIMenuItemReleasedIndex

function OryUIGetMenuItemReleasedName(oryUIMenuID as integer)
	local oryUIMenuItemReleasedName$ as string
	if (OryUIMenuCollection[oryUIMenuID].itemReleased > 0)
		oryUIMenuItemReleasedName$ = OryUIMenuCollection[oryUIMenuID].items[OryUIMenuCollection[oryUIMenuID].itemReleased - 1].name$
	endif
endfunction oryUIMenuItemReleasedName$

function OryUIHideMenu(oryUIMenuID as integer)
	OryUIMenuCollection[oryUIMenuID].visible = 0
	SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].sprBackgroundOverlay, -999999, -999999)
	SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].sprContainer, -999999, -999999)
	for oryUIForI = 0 to OryUIGetMenuItemCount(oryUIMenuID) - 1
		if (GetSpriteExists(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer))
			SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, -999999, -999999)
			SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprLeftIcon, -999999, -999999)
			SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprRightIcon, -999999, -999999)
			SetTextPosition(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].txtLabel, -999999, -999999)
		endif
	next
endfunction

function OryUIInsertMenuItem(oryUIMenuID as integer, oryUIMenuIndex as integer, oryUIComponentParameters$ as string)
	local oryUIMenuItemID as integer
	if (oryUIMenuIndex = -1)
		OryUIMenuCollection[oryUIMenuID].items.length = OryUIMenuCollection[oryUIMenuID].items.length + 1
		oryUIMenuItemID = OryUIMenuCollection[oryUIMenuID].items.length
		OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].id = oryUIMenuItemID + 1
	endif

	OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer, OryUIMenuCollection[oryUIMenuID].itemSize#[1], OryUIMenuCollection[oryUIMenuID].itemSize#[2])
	SetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer, GetSpriteDepth(OryUIMenuCollection[oryUIMenuID].sprContainer) - 1)
	SetSpriteColor(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer, OryUIMenuCollection[oryUIMenuID].color#[1], OryUIMenuCollection[oryUIMenuID].color#[2], OryUIMenuCollection[oryUIMenuID].color#[3], OryUIMenuCollection[oryUIMenuID].color#[4])
	SetSpriteOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer, -999999, -999999)

	OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprLeftIcon = CreateSprite(0)
	SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprLeftIcon, -1, 3.5)
	SetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprLeftIcon, GetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer) - 1)
	SetSpriteColor(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprLeftIcon, OryUIMenuCollection[oryUIMenuID].leftIconColor#[1], OryUIMenuCollection[oryUIMenuID].leftIconColor#[2], OryUIMenuCollection[oryUIMenuID].leftIconColor#[3], OryUIMenuCollection[oryUIMenuID].leftIconColor#[4])
	SetSpriteOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprLeftIcon, GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprLeftIcon) / 2, GetSpriteHeight(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprLeftIcon) / 2)
	SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprLeftIcon, -999999, -999999)

	OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprRightIcon = CreateSprite(0)
	SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprRightIcon, -1, 3.5)
	SetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprRightIcon, GetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer) - 1)
	SetSpriteColor(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprRightIcon, OryUIMenuCollection[oryUIMenuID].rightIconColor#[1], OryUIMenuCollection[oryUIMenuID].rightIconColor#[2], OryUIMenuCollection[oryUIMenuID].rightIconColor#[3], OryUIMenuCollection[oryUIMenuID].rightIconColor#[4])
	SetSpriteOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprRightIcon, GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprRightIcon) / 2, GetSpriteHeight(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprRightIcon) / 2)
	SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprRightIcon, -999999, -999999)

	OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].txtLabel = CreateText("Menu Item")
	SetTextSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].txtLabel, 3)
	SetTextColor(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].txtLabel, OryUIMenuCollection[oryUIMenuID].textColor#[1], OryUIMenuCollection[oryUIMenuID].textColor#[2], OryUIMenuCollection[oryUIMenuID].textColor#[3], OryUIMenuCollection[oryUIMenuID].textColor#[4])
	SetTextAlignment(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].txtLabel, 0)
	SetTextDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].txtLabel, GetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer) - 1)
	SetTextPosition(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].txtLabel, -999999, -999999)

	OryUIUpdateMenuItem(oryUIMenuID, oryUIMenuItemID + 1, oryUIComponentParameters$)
endfunction

function OryUIInsertMenuListener(oryUIMenuID as integer)
	local oryUIMenuBackgroundOverlaySprite as integer
	local oryUIMenuItemSprite as integer

	OryUIMenuCollection[oryUIMenuID].backgroundOverlayReleased = -1
	OryUIMenuCollection[oryUIMenuID].itemReleased = -1
	if (OryUIMenuCollection[oryUIMenuID].visible = 1)
		for oryUIForI = 0 to OryUIGetMenuItemCount(oryUIMenuID) - 1
			OryUIUpdateMenuItem(oryUIMenuID, oryUIForI + 1, "")
			if (GetSpriteExists(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer))
				if (OryUIGetSwipingVertically() = 0)
					if (GetPointerPressed())
						oryUIMenuBackgroundOverlaySprite = GetSpriteHitTest(OryUIMenuCollection[oryUIMenuID].sprBackgroundOverlay, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						oryUIMenuContainerSprite = GetSpriteHitTest(OryUIMenuCollection[oryUIMenuID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						oryUIMenuItemSprite = GetSpriteHitTest(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						if (oryUIMenuBackgroundOverlaySprite = 1 and oryUIMenuContainerSprite = 0)
							OryUIMenuCollection[oryUIMenuID].backgroundOverlayPressed = 1
							OryUIHideMenu(oryUIMenuID)
						elseif (oryUIMenuItemSprite = 1)
							OryUIMenuCollection[oryUIMenuID].items[oryUIForI].pressed = 1
							OryUIMenuCollection[oryUIMenuID].itemPressed = oryUIForI + 1
						endif
					else
						if (GetPointerState())
							oryUIMenuBackgroundOverlaySprite = GetSpriteHitTest(OryUIMenuCollection[oryUIMenuID].sprBackgroundOverlay, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							oryUIMenuContainerSprite = GetSpriteHitTest(OryUIMenuCollection[oryUIMenuID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							oryUIMenuItemSprite = GetSpriteHitTest(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							if (OryUIMenuCollection[oryUIMenuID].items[oryUIForI].pressed)
								if (oryUIMenuContainerSprite = 1)
									OryUIMenuCollection[oryUIMenuID].backgroundOverlayPressed = 0
								endif
								if (oryUIMenuItemSprite = 0)
									OryUIMenuCollection[oryUIMenuID].items[oryUIForI].pressed = 0
									OryUIMenuCollection[oryUIMenuID].itemPressed = 0
								endif
							endif
						endif
						if (GetPointerReleased())
							oryUIMenuBackgroundOverlaySprite = GetSpriteHitTest(OryUIMenuCollection[oryUIMenuID].sprBackgroundOverlay, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							oryUIMenuContainerSprite = GetSpriteHitTest(OryUIMenuCollection[oryUIMenuID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							oryUIMenuItemSprite = GetSpriteHitTest(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							if (OryUIMenuCollection[oryUIMenuID].items[oryUIForI].pressed)
								if (oryUIMenuBackgroundOverlaySprite = 1 and oryUIMenuContainerSprite = 0)
									OryUIMenuCollection[oryUIMenuID].backgroundOverlayPressed = 1
								elseif (oryUIMenuItemSprite = 1)
									OryUIMenuCollection[oryUIMenuID].items[oryUIForI].released = 1
									OryUIMenuCollection[oryUIMenuID].itemReleased = oryUIForI + 1
								endif
								OryUIHideMenu(oryUIMenuID)
							endif
							OryUIMenuCollection[oryUIMenuID].items[oryUIForI].pressed = 0
							OryUIMenuCollection[oryUIMenuID].itemPressed = 0
						endif
					endif
				endif
			endif
		next
	endif
endfunction

function OryUISetMenuItemCount(oryUIMenuID as integer, oryUINewMenuItemCount as integer)
	local oryUIOldMenuItemCount
	oryUIOldMenuItemCount = OryUIGetMenuItemCount(oryUIMenuID) - 1
	while (OryUIGetMenuItemCount(oryUIMenuID) - 1 > oryUINewMenuItemCount - 1)
		OryUIDeleteMenuItem(oryUIMenuID, OryUIGetMenuItemCount(oryUIMenuID) - 1)
	endwhile
	for oryUIForI = 0 to oryUINewMenuItemCount - 1
		if (oryUIForI > oryUIOldMenuItemCount)
			OryUIInsertMenuItem(oryUIMenuID, -1, "")
		endif
	next
endfunction

function OryUIShowMenu(oryUIMenuID as integer, oryUIMenuX#, oryUIMenuY#)
	OryUIMenuCollection[oryUIMenuID].visible = 1
	SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].sprBackgroundOverlay, GetViewOffsetX(), GetViewOffsetY())
	SetSpriteSize(OryUIMenuCollection[oryUIMenuID].sprContainer, OryUIMenuCollection[oryUIMenuID].itemSize#[1], OryUIMenuCollection[oryUIMenuID].itemSize#[2] * OryUIGetMenuItemCount(oryUIMenuID))

	if (oryUIMenuX# + GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].sprContainer) + (2.46 / GetDisplayAspect()) > GetViewOffsetX() + 100)
		oryUIMenuX# = GetViewOffsetX() + 100 - (2.46 / GetDisplayAspect()) - GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].sprContainer)
	endif
	if (oryUIMenuY# + GetSpriteHeight(OryUIMenuCollection[oryUIMenuID].sprContainer) + OryUIMenuCollection[oryUIMenuID].itemSize#[2] > GetViewOffsetY() + 100)
		oryUIMenuY# = GetViewOffsetY() + 100 - OryUIMenuCollection[oryUIMenuID].itemSize#[2] - GetSpriteHeight(OryUIMenuCollection[oryUIMenuID].sprContainer)
	endif
	SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].sprContainer, oryUIMenuX#, oryUIMenuY#)
	
	for oryUIForI = 0 to OryUIGetMenuItemCount(oryUIMenuID) - 1
		if (GetSpriteExists(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer))
			SetSpriteColor(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, OryUIMenuCollection[oryUIMenuID].color#[1], OryUIMenuCollection[oryUIMenuID].color#[2], OryUIMenuCollection[oryUIMenuID].color#[3], OryUIMenuCollection[oryUIMenuID].color#[4]) 
			SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, oryUIMenuX#, oryUIMenuY# + (oryUIForI * OryUIMenuCollection[oryUIMenuID].itemSize#[2]))
			SetSpriteColor(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprLeftIcon, OryUIMenuCollection[oryUIMenuID].leftIconColor#[1], OryUIMenuCollection[oryUIMenuID].leftIconColor#[2], OryUIMenuCollection[oryUIMenuID].leftIconColor#[3], OryUIMenuCollection[oryUIMenuID].leftIconColor#[4]) 
			OryUIPinSpriteToCentreLeftOfSprite(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprLeftIcon, OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, 2 + (GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprLeftIcon) / 2), 0)
			SetSpriteColor(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprRightIcon, OryUIMenuCollection[oryUIMenuID].rightIconColor#[1], OryUIMenuCollection[oryUIMenuID].rightIconColor#[2], OryUIMenuCollection[oryUIMenuID].rightIconColor#[3], OryUIMenuCollection[oryUIMenuID].rightIconColor#[4]) 
			OryUIPinSpriteToCentreRightOfSprite(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprRightIcon, OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, -(2 + (GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprRightIcon) / 2)), 0)
			SetTextColor(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].txtLabel, OryUIMenuCollection[oryUIMenuID].textColor#[1], OryUIMenuCollection[oryUIMenuID].textColor#[2], OryUIMenuCollection[oryUIMenuID].textColor#[3], OryUIMenuCollection[oryUIMenuID].textColor#[4]) 
			if (GetTextAlignment(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].txtLabel) = 0)
				OryUIPinTextToCentreLeftOfSprite(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].txtLabel, OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, 2 + GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprLeftIcon) + 2, 0)
			elseif (GetTextAlignment(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].txtLabel) = 1)
				OryUIPinTextToCentreOfSprite(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].txtLabel, OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, 0, 0)
			elseif (GetTextAlignment(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].txtLabel) = 2)
				OryUIPinTextToCentreRightOfSprite(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].txtLabel, OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, -(2 + GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprRightIcon) + 2), 0)
			endif
		endif
	next
endfunction

function OryUIUpdateMenu(oryUIMenuID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUIMenuCollection[oryUIMenuID].sprContainer))

		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
		if (OryUIParameters.size#[1] > -999999)
			OryUIMenuCollection[oryUIMenuID].itemSize#[1] = OryUIParameters.size#[1]
			SetSpriteSize(OryUIMenuCollection[oryUIMenuID].sprContainer, OryUIParameters.size#[1], 0)
		endif
		if (OryUIParameters.itemSize#[1] > -999999 and OryUIParameters.itemSize#[2] > -999999)
			OryUIMenuCollection[oryUIMenuID].itemSize#[1] = OryUIParameters.itemSize#[1]
			OryUIMenuCollection[oryUIMenuID].itemSize#[2] = OryUIParameters.itemSize#[2]
		endif
		//if (OryUIParameters.position#[1] > -999999 and OryUIParameters.position#[2] > -999999)
			//SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].sprContainer, OryUIParameters.position#[1], OryUIParameters.position#[2])
		//elseif (OryUIParameters.position#[1] > -999999 and OryUIParameters.position#[2] = -999999)
			//SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].sprContainer, OryUIParameters.position#[1], GetSpriteYByOffset(OryUIMenuCollection[oryUIMenuID].sprContainer))
		//elseif (OryUIParameters.position#[1] = -999999 and OryUIParameters.position#[2] > -999999)
			//SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].sprContainer, GetSpriteXByOffset(OryUIMenuCollection[oryUIMenuID].sprContainer), OryUIParameters.position#[2])
		//endif

		// THE REST OF THE PARAMETERS NEXT
		if (OryUIParameters.color#[1] > -999999 or OryUIParameters.color#[2] > -999999 or OryUIParameters.color#[3] > -999999 or OryUIParameters.color#[4] > -999999)
			if (OryUIParameters.color#[1] > -999999) then OryUIMenuCollection[oryUIMenuID].color#[1] = OryUIParameters.color#[1]
			if (OryUIParameters.color#[2] > -999999) then OryUIMenuCollection[oryUIMenuID].color#[2] = OryUIParameters.color#[2]
			if (OryUIParameters.color#[3] > -999999) then OryUIMenuCollection[oryUIMenuID].color#[3] = OryUIParameters.color#[3]
			if (OryUIParameters.color#[4] > -999999) then OryUIMenuCollection[oryUIMenuID].color#[4] = OryUIParameters.color#[4]
			SetSpriteColor(OryUIMenuCollection[oryUIMenuID].sprContainer, OryUIMenuCollection[oryUIMenuID].color#[1], OryUIMenuCollection[oryUIMenuID].color#[2], OryUIMenuCollection[oryUIMenuID].color#[3], OryUIMenuCollection[oryUIMenuID].color#[4])
		endif
		if (OryUIParameters.depth > -999999)
			SetSpriteDepth(OryUIMenuCollection[oryUIMenuID].sprContainer, OryUIParameters.depth)
		endif
		if (OryUIParameters.iconColor#[1] > -999999 or OryUIParameters.iconColor#[2] > -999999 or OryUIParameters.iconColor#[3] > -999999 or OryUIParameters.iconColor#[4] > -999999)
			if (OryUIParameters.iconColor#[1] > -999999) then OryUIMenuCollection[oryUIMenuID].leftIconColor#[1] = OryUIParameters.iconColor#[1]
			if (OryUIParameters.iconColor#[2] > -999999) then OryUIMenuCollection[oryUIMenuID].leftIconColor#[2] = OryUIParameters.iconColor#[2]
			if (OryUIParameters.iconColor#[3] > -999999) then OryUIMenuCollection[oryUIMenuID].leftIconColor#[3] = OryUIParameters.iconColor#[3]
			if (OryUIParameters.iconColor#[4] > -999999) then OryUIMenuCollection[oryUIMenuID].leftIconColor#[4] = OryUIParameters.iconColor#[4]
			if (OryUIParameters.iconColor#[1] > -999999) then OryUIMenuCollection[oryUIMenuID].rightIconColor#[1] = OryUIParameters.iconColor#[1]
			if (OryUIParameters.iconColor#[2] > -999999) then OryUIMenuCollection[oryUIMenuID].rightIconColor#[2] = OryUIParameters.iconColor#[2]
			if (OryUIParameters.iconColor#[3] > -999999) then OryUIMenuCollection[oryUIMenuID].rightIconColor#[3] = OryUIParameters.iconColor#[3]
			if (OryUIParameters.iconColor#[4] > -999999) then OryUIMenuCollection[oryUIMenuID].rightIconColor#[4] = OryUIParameters.iconColor#[4]
		endif
		if (OryUIParameters.leftIconColor#[1] > -999999 or OryUIParameters.leftIconColor#[2] > -999999 or OryUIParameters.leftIconColor#[3] > -999999 or OryUIParameters.leftIconColor#[4] > -999999)
			if (OryUIParameters.leftIconColor#[1] > -999999) then OryUIMenuCollection[oryUIMenuID].leftIconColor#[1] = OryUIParameters.leftIconColor#[1]
			if (OryUIParameters.leftIconColor#[2] > -999999) then OryUIMenuCollection[oryUIMenuID].leftIconColor#[2] = OryUIParameters.leftIconColor#[2]
			if (OryUIParameters.leftIconColor#[3] > -999999) then OryUIMenuCollection[oryUIMenuID].leftIconColor#[3] = OryUIParameters.leftIconColor#[3]
			if (OryUIParameters.leftIconColor#[4] > -999999) then OryUIMenuCollection[oryUIMenuID].leftIconColor#[4] = OryUIParameters.leftIconColor#[4]
		endif
		if (OryUIParameters.rightIconColor#[1] > -999999 or OryUIParameters.rightIconColor#[2] > -999999 or OryUIParameters.rightIconColor#[3] > -999999 or OryUIParameters.rightIconColor#[4] > -999999)
			if (OryUIParameters.rightIconColor#[1] > -999999) then OryUIMenuCollection[oryUIMenuID].rightIconColor#[1] = OryUIParameters.rightIconColor#[1]
			if (OryUIParameters.rightIconColor#[2] > -999999) then OryUIMenuCollection[oryUIMenuID].rightIconColor#[2] = OryUIParameters.rightIconColor#[2]
			if (OryUIParameters.rightIconColor#[3] > -999999) then OryUIMenuCollection[oryUIMenuID].rightIconColor#[3] = OryUIParameters.rightIconColor#[3]
			if (OryUIParameters.rightIconColor#[4] > -999999) then OryUIMenuCollection[oryUIMenuID].rightIconColor#[4] = OryUIParameters.rightIconColor#[4]
		endif
		if (OryUIParameters.showLeftIcon > -999999)
			OryUIMenuCollection[oryUIMenuID].showLeftIcon = OryUIParameters.showLeftIcon
		endif
		if (OryUIParameters.showRightIcon > -999999)
			OryUIMenuCollection[oryUIMenuID].showRightIcon = OryUIParameters.showRightIcon
		endif
		if (OryUIParameters.textColor#[1] > -999999 or OryUIParameters.textColor#[2] > -999999 or OryUIParameters.textColor#[3] > -999999 or OryUIParameters.textColor#[4] > -999999)
			if (OryUIParameters.textColor#[1] > -999999) then OryUIMenuCollection[oryUIMenuID].textColor#[1] = OryUIParameters.textColor#[1]
			if (OryUIParameters.textColor#[2] > -999999) then OryUIMenuCollection[oryUIMenuID].textColor#[2] = OryUIParameters.textColor#[2]
			if (OryUIParameters.textColor#[3] > -999999) then OryUIMenuCollection[oryUIMenuID].textColor#[3] = OryUIParameters.textColor#[3]
			if (OryUIParameters.textColor#[4] > -999999) then OryUIMenuCollection[oryUIMenuID].textColor#[4] = OryUIParameters.textColor#[4]
		endif
	endif
endfunction

function OryUIUpdateMenuItem(oryUIMenuID as integer, oryUIMenuItemID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (oryUIMenuItemID - 1 <= OryUIMenuCollection[oryUIMenuID].items.length)
		if (GetSpriteExists(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprContainer))
			SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprContainer, GetSpriteXByOffset(OryUIMenuCollection[oryUIMenuID].sprContainer), GetSpriteYByOffset(OryUIMenuCollection[oryUIMenuID].sprContainer) + 0.1 + ((oryUIMenuItemID - 1) * OryUIMenuCollection[oryUIMenuID].itemSize#[2]))

			// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
			if (OryUIMenuCollection[oryUIMenuID].showLeftIcon = 1)
				SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprLeftIcon, -1, 3.5)
				if (OryUIParameters.leftIcon$ <> "") then OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].leftIcon$ = lower(OryUIParameters.leftIcon$)
				if (OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].leftIcon$ = "add") then SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprLeftIcon, oryUIIconAddImage)
				if (OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].leftIcon$ = "back") then SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprLeftIcon, oryUIIconBackImage)
				if (OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].leftIcon$ = "camera") then SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprLeftIcon, oryUIIconCameraImage)
				if (OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].leftIcon$ = "delete") then SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprLeftIcon, oryUIIconDeleteImage)
				if (OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].leftIcon$ = "menu") then SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprLeftIcon, oryUIIconMenuImage)
				if (OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].leftIcon$ = "profile") then SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprLeftIcon, oryUIIconProfileImage)
				if (OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].leftIcon$ = "refresh") then SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprLeftIcon, oryUIIconRefreshImage)
				if (OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].leftIcon$ = "save") then SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprLeftIcon, oryUIIconSaveImage)
				if (OryUIParameters.leftIconID > -999999)
					OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].leftIcon$ = "custom"
					SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprLeftIcon, OryUIParameters.leftIconID)
				endif
				if (OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].leftIcon$ <> "")
					SetSpriteColorAlpha(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprLeftIcon, 255)
				else
					SetSpriteColorAlpha(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprLeftIcon, 0)
				endif	
			elseif (OryUIMenuCollection[oryUIMenuID].showLeftIcon = 0)
				SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprLeftIcon, 0, 0)
			endif
			if (OryUIMenuCollection[oryUIMenuID].showRightIcon = 1)
				SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, -1, 3.5)
				if (OryUIParameters.rightIcon$ <> "") then OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].rightIcon$ = lower(OryUIParameters.rightIcon$)
				if (OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].rightIcon$ = "add") then SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, oryUIIconAddImage)
				if (OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].rightIcon$ = "back") then SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, oryUIIconBackImage)
				if (OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].rightIcon$ = "camera") then SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, oryUIIconCameraImage)
				if (OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].rightIcon$ = "delete") then SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, oryUIIconDeleteImage)
				if (OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].rightIcon$ = "menu") then SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, oryUIIconMenuImage)
				if (OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].rightIcon$ = "profile") then SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, oryUIIconProfileImage)
				if (OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].rightIcon$ = "refresh") then SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, oryUIIconRefreshImage)
				if (OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].rightIcon$ = "save") then SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, oryUIIconSaveImage)
				if (OryUIParameters.rightIconID > -999999)
					OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].rightIcon$ = "custom"
					SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, OryUIParameters.rightIconID)
				endif
				if (OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].rightIcon$ <> "")
					SetSpriteColorAlpha(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, 255)
				else
					SetSpriteColorAlpha(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, 0)
				endif	
			elseif (OryUIMenuCollection[oryUIMenuID].showRightIcon = 0)
				SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, 0, 0)
			endif
			if (OryUIParameters.text$ <> "")
				SetTextString(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].txtLabel, OryUIParameters.text$)
			endif
			if (OryUIParameters.textAlignment > -999999)
				SetTextAlignment(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].txtLabel, OryUIParameters.textAlignment)
			endif
			if (OryUIParameters.textBold > -999999)
				SetTextBold(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].txtLabel, OryUIParameters.textBold)
			endif
			if (OryUIParameters.textSize# > -999999)
				SetTextSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].txtLabel, OryUIParameters.textSize#)
			endif

			// THE REST OF THE PARAMETERS NEXT
			if (OryUIParameters.color#[1] > -999999 or OryUIParameters.color#[2] > -999999 or OryUIParameters.color#[3] > -999999 or OryUIParameters.color#[4] > -999999)
				SetSpriteColor(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprContainer, OryUIParameters.color#[1], OryUIParameters.color#[2], OryUIParameters.color#[3], OryUIParameters.color#[4])
			endif
			if (OryUIParameters.name$ <> "")
				OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].name$ = OryUIParameters.name$
			endif
			if (OryUIParameters.textColor#[1] > -999999 or OryUIParameters.textColor#[2] > -999999 or OryUIParameters.textColor#[3] > -999999 or OryUIParameters.textColor#[4] > -999999)
				SetTextColor(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].txtLabel, OryUIParameters.textColor#[1], OryUIParameters.textColor#[2], OryUIParameters.textColor#[3], OryUIParameters.textColor#[4])
			endif
		endif
	endif
endfunction

foldend
