
foldstart // OryUIMenu Component (Updated 07/07/2020)

type typeOryUIMenu
	id as integer
	itemPressed as integer
	itemReleased as integer
	items as typeOryUIMenuItem[]
	scrimPressed as integer
	scrimReleased as integer
	showLeftIcon as integer
	showRightIcon as integer
	sprContainer as integer
	sprScrim as integer
	visible as integer
endtype

type typeOryUIMenuItem
	id as integer
//~	checked as integer
//~	itemType$ as string
	leftIcon$ as string
	name$ as string
	pressed as integer
	released as integer
	rightIcon$ as string
	sprContainer as integer
//~	sprDivider as integer
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
	OryUIMenuCollection[oryUIMenuID].showLeftIcon = oryUIDefaults.menuShowLeftIcon
	OryUIMenuCollection[oryUIMenuID].showRightIcon = oryUIDefaults.menuShowRightIcon
	OryUIMenuCollection[oryUIMenuID].visible = 0

	OryUIMenuCollection[oryUIMenuID].sprScrim = CreateSprite(0)
	SetSpriteSize(OryUIMenuCollection[oryUIMenuID].sprScrim, 100, abs(GetScreenBoundsTop() * 2) + 100)
	SetSpriteDepth(OryUIMenuCollection[oryUIMenuID].sprScrim, oryUIDefaults.menuDepth)
	SetSpriteColor(OryUIMenuCollection[oryUIMenuID].sprScrim, oryUIDefaults.menuScrimColor#[1], oryUIDefaults.menuScrimColor#[2], oryUIDefaults.menuScrimColor#[3], oryUIDefaults.menuScrimColor#[4])
	SetSpriteOffset(OryUIMenuCollection[oryUIMenuID].sprScrim, 0, 0)
	SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].sprScrim, -999999, -999999)
	SetSpritePhysicsOff(OryUIMenuCollection[oryUIMenuID].sprScrim)
	
	OryUIMenuCollection[oryUIMenuID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUIMenuCollection[oryUIMenuID].sprContainer, oryUIDefaults.menuWidth#, 0)
	SetSpriteDepth(OryUIMenuCollection[oryUIMenuID].sprContainer, oryUIDefaults.menuDepth - 1)
	SetSpriteColor(OryUIMenuCollection[oryUIMenuID].sprContainer, oryUIDefaults.menuColor#[1], oryUIDefaults.menuColor#[2], oryUIDefaults.menuColor#[3], oryUIDefaults.menuColor#[4])
	SetSpriteOffset(OryUIMenuCollection[oryUIMenuID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].sprContainer, -999999, -999999)
	SetSpritePhysicsOff(OryUIMenuCollection[oryUIMenuID].sprContainer)
	
	if (oryUIComponentParameters$ <> "") then OryUIUpdateMenu(oryUIMenuID, oryUIComponentParameters$)
endfunction oryUIMenuID

function OryUIDeleteMenu(oryUIMenuID as integer)
	DeleteSprite(OryUIMenuCollection[oryUIMenuID].sprScrim)
	DeleteSprite(OryUIMenuCollection[oryUIMenuID].sprContainer)
	while (OryUIMenuCollection[oryUIMenuID].items.length > 0)
		OryUIDeleteMenuItem(oryUIMenuID, 0)
	endwhile
endfunction

function OryUIDeleteMenuItem(oryUIMenuID as integer, oryUIMenuItemID as integer)
	DeleteSprite(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer)
//~	DeleteSprite(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprDivider)
	DeleteSprite(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprLeftIcon)
	DeleteSprite(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprRightIcon)
	DeleteText(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].txtLabel)
	OryUIMenuCollection[oryUIMenuID].items.remove(oryUIMenuItemID)
endfunction

function OryUIGetMenuHeight(oryUIMenuID as integer)
	local oryUIForI as integer
	local oryUIMenuHeight# as float
	oryUIMenuHeight# = 0
	for oryUIForI = 0 to OryUIGetMenuItemCount(oryUIMenuID) - 1
		if (GetSpriteExists(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer))
//~			if (OryUIMenuCollection[oryUIMenuID].items[oryUIForI].itemType$ = "divider")
//~				oryUIMenuHeight# = oryUIMenuHeight# + GetSpriteHeight(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprDivider)
//~			endif
//~			if (OryUIMenuCollection[oryUIMenuID].items[oryUIForI].itemType$ = "option" or OryUIMenuCollection[oryUIMenuID].items[oryUIForI].itemType$ = "toggle")
				oryUIMenuHeight# = oryUIMenuHeight# + GetSpriteHeight(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer)
//~			endif
		endif
	next
endfunction oryUIMenuHeight#

function OryUIGetMenuItemCount(oryUIMenuID as integer)
	local oryUIMenuItemCount as integer
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

function OryUIGetMenuVisible(oryUIMenuID as integer)

endfunction OryUIMenuCollection[oryUIMenuID].visible

function OryUIGetMenuX(oryUIMenuID as integer)
	local oryUIMenuX# as float
	if (OryUIMenuCollection[oryUIMenuID].visible = 1)
		oryUIMenuX# = GetSpriteX(OryUIMenuCollection[oryUIMenuID].sprContainer)
	endif
endfunction oryUIMenuX#

function OryUIGetMenuY(oryUIMenuID as integer)
	local oryUIMenuY# as float
	if (OryUIMenuCollection[oryUIMenuID].visible = 1)
		oryUIMenuY# = GetSpriteY(OryUIMenuCollection[oryUIMenuID].sprContainer)
	endif
endfunction oryUIMenuY#

function OryUIHideMenu(oryUIMenuID as integer)
	local oryUIForI as integer
	oryUIScrimVisible = 0
	oryUIBlockScreenScrolling = 0
	OryUIMenuCollection[oryUIMenuID].visible = 0
	SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].sprScrim, -999999, -999999)
	SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].sprContainer, -999999, -999999)
	for oryUIForI = 0 to OryUIGetMenuItemCount(oryUIMenuID) - 1
		if (GetSpriteExists(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer))
			SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, -999999, -999999)
//~			SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprDivider, -999999, -999999)
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

//~	OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].itemType$ = "option"
//~	OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].checked = 0
	
	OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer, GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].sprContainer), oryUIDefaults.menuItemHeight#)
	SetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer, GetSpriteDepth(OryUIMenuCollection[oryUIMenuID].sprContainer) - 1)
	SetSpriteColor(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer, oryUIDefaults.menuColor#[1], oryUIDefaults.menuColor#[2], oryUIDefaults.menuColor#[3], oryUIDefaults.menuColor#[4])
	SetSpriteOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer, -999999, -999999)
	SetSpritePhysicsOff(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer)

//~	OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprDivider = CreateSprite(0)
//~	SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprDivider, GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].sprContainer) * 0.9, oryUIDefaults.menuDividerHeight#)
//~	SetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprDivider, GetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer) - 1)
//~	SetSpriteColor(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprDivider, oryUIDefaults.menuDividerColor#[1], oryUIDefaults.menuDividerColor#[2], oryUIDefaults.menuDividerColor#[3], oryUIDefaults.menuDividerColor#[4])
//~	//SetSpriteOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprDivider, 0, 0)
//~	SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprDivider, -999999, -999999)
//~	SetSpritePhysicsOff(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprDivider)
	
	OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprLeftIcon = CreateSprite(0)
	SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprLeftIcon, -1, oryUIDefaults.menuItemLeftIconHeight#)
	SetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprLeftIcon, GetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer) - 1)
	SetSpriteColor(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprLeftIcon, oryUIDefaults.menuItemLeftIconColor#[1], oryUIDefaults.menuItemLeftIconColor#[2], oryUIDefaults.menuItemLeftIconColor#[3], oryUIDefaults.menuItemLeftIconColor#[4])
	SetSpriteOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprLeftIcon, GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprLeftIcon) / 2, GetSpriteHeight(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprLeftIcon) / 2)
	SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprLeftIcon, -999999, -999999)
	SetSpritePhysicsOff(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprLeftIcon)

	OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprRightIcon = CreateSprite(0)
	SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprRightIcon, -1, oryUIDefaults.menuItemRightIconHeight#)
	SetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprRightIcon, GetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer) - 1)
	SetSpriteColor(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprRightIcon, oryUIDefaults.menuItemRightIconColor#[1], oryUIDefaults.menuItemRightIconColor#[2], oryUIDefaults.menuItemRightIconColor#[3], oryUIDefaults.menuItemRightIconColor#[4])
	SetSpriteOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprRightIcon, GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprRightIcon) / 2, GetSpriteHeight(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprRightIcon) / 2)
	SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprRightIcon, -999999, -999999)
	SetSpritePhysicsOff(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprRightIcon)

	OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].txtLabel = CreateText("Menu Item")
	SetTextSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].txtLabel, oryUIDefaults.menuItemTextSize#)
	SetTextBold(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].txtLabel, oryUIDefaults.menuItemTextBold)
	SetTextColor(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].txtLabel, oryUIDefaults.menuItemTextColor#[1], oryUIDefaults.menuItemTextColor#[2], oryUIDefaults.menuItemTextColor#[3], oryUIDefaults.menuItemTextColor#[4])
	SetTextAlignment(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].txtLabel, 0)
	SetTextDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].txtLabel, GetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].sprContainer) - 1)
	SetTextPosition(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID].txtLabel, -999999, -999999)

	OryUIUpdateMenuItem(oryUIMenuID, oryUIMenuItemID + 1, oryUIComponentParameters$)
endfunction

function OryUIInsertMenuListener(oryUIMenuID as integer)
	if (oryUIDialogVisible = 1)
		if (OryUIMenuCollection[oryUIMenuID].visible = 1)
			OryUIHideMenu(oryUIMenuID)
		endif
		exitfunction
	endif

	local oryUIForI as integer
	local oryUIMenuContainerSprite as integer
	local oryUIMenuScrimSprite as integer
	local oryUIMenuItemSprite as integer

	OryUIMenuCollection[oryUIMenuID].scrimReleased = -1
	OryUIMenuCollection[oryUIMenuID].itemReleased = -1
	if (GetRawKeyPressed(27) and OryUIMenuCollection[oryUIMenuID].visible = 1)
		OryUIHideMenu(oryUIMenuID)
	endif
	if (OryUIMenuCollection[oryUIMenuID].visible = 1)
		for oryUIForI = 0 to OryUIGetMenuItemCount(oryUIMenuID) - 1
			OryUIUpdateMenuItem(oryUIMenuID, oryUIForI + 1, "")
			if (GetSpriteExists(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer))
				if (OryUIGetSwipingVertically() = 0)
					if (GetPointerPressed())
						oryUIMenuScrimSprite = GetSpriteHitTest(OryUIMenuCollection[oryUIMenuID].sprScrim, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						oryUIMenuContainerSprite = GetSpriteHitTest(OryUIMenuCollection[oryUIMenuID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						oryUIMenuItemSprite = GetSpriteHitTest(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						if (oryUIMenuItemSprite = 1)
							OryUIMenuCollection[oryUIMenuID].items[oryUIForI].pressed = 1
							OryUIMenuCollection[oryUIMenuID].itemPressed = oryUIForI + 1
						elseif (oryUIMenuScrimSprite = 1 and oryUIMenuContainerSprite = 0)
							OryUIMenuCollection[oryUIMenuID].scrimPressed = 1
							OryUIHideMenu(oryUIMenuID)
						endif
					else
						if (GetPointerState())
							oryUIMenuScrimSprite = GetSpriteHitTest(OryUIMenuCollection[oryUIMenuID].sprScrim, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							oryUIMenuContainerSprite = GetSpriteHitTest(OryUIMenuCollection[oryUIMenuID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							oryUIMenuItemSprite = GetSpriteHitTest(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							if (OryUIMenuCollection[oryUIMenuID].items[oryUIForI].pressed)
								if (oryUIMenuContainerSprite = 1)
									OryUIMenuCollection[oryUIMenuID].scrimPressed = 0
								endif
								if (oryUIMenuItemSprite = 0)
									OryUIMenuCollection[oryUIMenuID].items[oryUIForI].pressed = 0
									OryUIMenuCollection[oryUIMenuID].itemPressed = 0
								endif
							endif
						endif
						if (GetPointerReleased())
							oryUIMenuScrimSprite = GetSpriteHitTest(OryUIMenuCollection[oryUIMenuID].sprScrim, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							oryUIMenuContainerSprite = GetSpriteHitTest(OryUIMenuCollection[oryUIMenuID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							oryUIMenuItemSprite = GetSpriteHitTest(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							if (OryUIMenuCollection[oryUIMenuID].items[oryUIForI].pressed)
								if (oryUIMenuItemSprite = 1) // and (OryUIMenuCollection[oryUIMenuID].items[oryUIForI].itemType$ = "option" or OryUIMenuCollection[oryUIMenuID].items[oryUIForI].itemType$ = "toggle"))
									OryUIMenuCollection[oryUIMenuID].items[oryUIForI].released = 1
									OryUIMenuCollection[oryUIMenuID].itemReleased = oryUIForI + 1
									OryUIHideMenu(oryUIMenuID)
//~									if (OryUIMenuCollection[oryUIMenuID].items[oryUIForI].itemType$ = "option") then OryUIHideMenu(oryUIMenuID)
//~									if (OryUIMenuCollection[oryUIMenuID].items[oryUIForI].itemType$ = "toggle")
//~										if (OryUIMenuCollection[oryUIMenuID].items[oryUIForI].checked = 0)
//~											OryUIMenuCollection[oryUIMenuID].items[oryUIForI].checked = 1
//~										else
//~											OryUIMenuCollection[oryUIMenuID].items[oryUIForI].checked = 0
//~										endif
//~									endif
								elseif (oryUIMenuScrimSprite = 1 and oryUIMenuContainerSprite = 0)
									OryUIMenuCollection[oryUIMenuID].scrimPressed = 1
									OryUIHideMenu(oryUIMenuID)
								endif
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
	local oryUIForI as integer
	local oryUIOldMenuItemCount as integer
	
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
	local oryUIForI as integer
	local oryUIMenuHeight# as float
	local oryUIMenuItemsHeight# as float
	
	oryUIScrimDepth = GetSpriteDepth(OryUIMenuCollection[oryUIMenuID].sprScrim)
	oryUIScrimVisible = 1
	oryUIBlockScreenScrolling = 1
	OryUIMenuCollection[oryUIMenuID].visible = 1
	SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].sprScrim, GetViewOffsetX(), GetViewOffsetY() + GetScreenBoundsTop())

	oryUIMenuHeight# = OryUIGetMenuHeight(oryUIMenuID)

	SetSpriteSize(OryUIMenuCollection[oryUIMenuID].sprContainer, GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].sprContainer), oryUIMenuHeight#)

	if (oryUIMenuX# + GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].sprContainer) + (2.46 / GetDisplayAspect()) > GetViewOffsetX() + 100)
		oryUIMenuX# = GetViewOffsetX() + 100 - (2.46 / GetDisplayAspect()) - GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].sprContainer)
	endif
	if (oryUIMenuY# + GetSpriteHeight(OryUIMenuCollection[oryUIMenuID].sprContainer) + oryUIDefaults.menuItemHeight# > GetViewOffsetY() + GetScreenBoundsTop() + 100)
		oryUIMenuY# = GetViewOffsetY() + GetScreenBoundsTop() + 100 - oryUIDefaults.menuItemHeight# - GetSpriteHeight(OryUIMenuCollection[oryUIMenuID].sprContainer)
	endif
	SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].sprContainer, oryUIMenuX#, oryUIMenuY#)
	
	oryUIMenuItemsHeight# = 0
	
	for oryUIForI = 0 to OryUIGetMenuItemCount(oryUIMenuID) - 1
		if (GetSpriteExists(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer))
			SetSpritePosition(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, -999999, -999999)
//~			SetSpritePosition(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprDivider, -999999, -999999)
			SetSpritePosition(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprLeftIcon, -999999, -999999)
			SetSpritePosition(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprRightIcon, -999999, -999999)
			SetTextPosition(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].txtLabel, -999999, -999999)
//~			if (OryUIMenuCollection[oryUIMenuID].items[oryUIForI].itemType$ = "divider")
//~				SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].sprContainer), oryUIDefaults.menuDividerHeight#)
//~				SetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, GetSpriteDepth(OryUIMenuCollection[oryUIMenuID].sprContainer) - 1)
//~				SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, oryUIMenuX#, oryUIMenuY# + oryUIMenuItemsHeight#)
//~				SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprDivider, GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].sprContainer) * 0.9, GetSpriteHeight(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer))
//~				SetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprDivider, GetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer) - 1)
//~				OryUIPinSpriteToCentreOfSprite(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprDivider, OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, 0, 0)
//~				oryUIMenuItemsHeight# = oryUIMenuItemsHeight# + oryUIDefaults.menuDividerHeight#
//~			endif
//~			if (OryUIMenuCollection[oryUIMenuID].items[oryUIForI].itemType$ = "option" or OryUIMenuCollection[oryUIMenuID].items[oryUIForI].itemType$ = "toggle")
				//SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].sprContainer), GetSpriteHeight(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer))
				SetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, GetSpriteDepth(OryUIMenuCollection[oryUIMenuID].sprContainer) - 1)
				SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, oryUIMenuX#, oryUIMenuY# + oryUIMenuItemsHeight#)
				SetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprLeftIcon, GetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer) - 1)
				OryUIPinSpriteToCentreLeftOfSprite(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprLeftIcon, OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, oryUIDefaults.menuItemLeftIconLeftPadding# + (GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprLeftIcon) / 2), 0)
				SetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprRightIcon, GetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer) - 1)
				OryUIPinSpriteToCentreRightOfSprite(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprRightIcon, OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, -(oryUIDefaults.menuItemRightIconRightPadding# + (GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprRightIcon) / 2)), 0)
				SetTextDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].txtLabel, GetSpriteDepth(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer) - 1)
				if (GetTextAlignment(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].txtLabel) = 0)
					OryUIPinTextToCentreLeftOfSprite(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].txtLabel, OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, oryUIDefaults.menuItemLeftIconLeftPadding# + GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprLeftIcon) + oryUIDefaults.menuItemTextPadding#, 0)
				elseif (GetTextAlignment(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].txtLabel) = 1)
					OryUIPinTextToCentreOfSprite(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].txtLabel, OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, 0, 0)
				elseif (GetTextAlignment(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].txtLabel) = 2)
					OryUIPinTextToCentreRightOfSprite(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].txtLabel, OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer, -(oryUIDefaults.menuItemRightIconRightPadding# + GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprRightIcon) + oryUIDefaults.menuItemTextPadding#), 0)
				endif
				oryUIMenuItemsHeight# = oryUIMenuItemsHeight# + GetSpriteHeight(OryUIMenuCollection[oryUIMenuID].items[oryUIForI].sprContainer)
//~			endif
		endif
	next
endfunction

function OryUIUpdateMenu(oryUIMenuID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUIMenuCollection[oryUIMenuID].sprContainer))

		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
		if (oryUIParameters.size#[1] > -999999)
			SetSpriteSize(OryUIMenuCollection[oryUIMenuID].sprContainer, oryUIParameters.size#[1], GetSpriteHeight(OryUIMenuCollection[oryUIMenuID].sprContainer))
		endif
		
		// THE REST OF THE PARAMETERS NEXT
		if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999 or oryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUIMenuCollection[oryUIMenuID].sprContainer, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], oryUIParameters.color#[4])
		endif
		if (oryUIParameters.depth > -999999)
			SetSpriteDepth(OryUIMenuCollection[oryUIMenuID].sprScrim, oryUIParameters.depth)
			SetSpriteDepth(OryUIMenuCollection[oryUIMenuID].sprContainer, oryUIParameters.depth - 1)
		endif
		if (oryUIParameters.scrimColor#[1] > -999999 or oryUIParameters.scrimColor#[2] > -999999 or oryUIParameters.scrimColor#[3] > -999999 or oryUIParameters.scrimColor#[4] > -999999)
			SetSpriteColor(OryUIMenuCollection[oryUIMenuID].sprScrim, oryUIParameters.scrimColor#[1], oryUIParameters.scrimColor#[2], oryUIParameters.scrimColor#[3], oryUIParameters.scrimColor#[4])
		endif
		if (oryUIParameters.showLeftIcon > -999999)
			OryUIMenuCollection[oryUIMenuID].showLeftIcon = oryUIParameters.showLeftIcon
		endif
		if (oryUIParameters.showRightIcon > -999999)
			OryUIMenuCollection[oryUIMenuID].showRightIcon = oryUIParameters.showRightIcon
		endif
	endif
endfunction

function OryUIUpdateMenuItem(oryUIMenuID as integer, oryUIMenuItemID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (oryUIMenuItemID - 1 <= OryUIMenuCollection[oryUIMenuID].items.length)
		if (GetSpriteExists(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprContainer))
			//SetSpritePositionByOffset(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprContainer, GetSpriteXByOffset(OryUIMenuCollection[oryUIMenuID].sprContainer), GetSpriteYByOffset(OryUIMenuCollection[oryUIMenuID].sprContainer) + 0.1 + ((oryUIMenuItemID - 1) * oryUIDefaults.menuItemHeight#))

			// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
//~			if (lower(oryUIParameters.itemType$) = "divider")
//~				OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].itemType$ = "divider"
//~				SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprContainer, GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].sprContainer), oryUIDefaults.menuDividerHeight#)
//~				SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprDivider, GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].sprContainer) * 0.9, oryUIDefaults.menuDividerHeight#)
//~			endif
//~			if (lower(oryUIParameters.itemType$) = "option")
//~				OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].itemType$ = "option"
//~				SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprContainer, GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].sprContainer), oryUIDefaults.menuItemHeight#)
//~			endif
//~			if (lower(oryUIParameters.itemType$) = "toggle")
//~				OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].itemType$ = "toggle"
//~				SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprContainer, GetSpriteWidth(OryUIMenuCollection[oryUIMenuID].sprContainer), oryUIDefaults.menuItemHeight#)
//~			endif
			if (OryUIMenuCollection[oryUIMenuID].showLeftIcon = 1)
				SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprLeftIcon, -1, 3.5)
				if (oryUIParameters.leftIcon$ <> "" and oryUIParameters.leftIconID > -999999)
					OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].leftIcon$ = lower(oryUIParameters.leftIcon$)
					SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprLeftIcon, oryUIParameters.leftIconID)
				elseif (oryUIParameters.leftIconID > -999999)
					OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].leftIcon$ = "custom"
					SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprLeftIcon, oryUIParameters.leftIconID)
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
				if (oryUIParameters.rightIcon$ <> "" and oryUIParameters.rightIconID > -999999)
					OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].rightIcon$ = lower(oryUIParameters.rightIcon$)
					SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, oryUIParameters.rightIconID)
				elseif (oryUIParameters.rightIconID > -999999)
					OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].rightIcon$ = "custom"
					SetSpriteImage(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, oryUIParameters.rightIconID)
				endif
				if (OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].rightIcon$ <> "")
					SetSpriteColorAlpha(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, 255)
				else
					SetSpriteColorAlpha(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, 0)
				endif	
			elseif (OryUIMenuCollection[oryUIMenuID].showRightIcon = 0)
				SetSpriteSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, 0, 0)
			endif
			if (oryUIParameters.text$ <> "")
				if (lower(oryUIParameters.text$) = "null") then oryUIParameters.text$ = ""
				SetTextString(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].txtLabel, oryUIParameters.text$)
			endif
			if (oryUIParameters.textAlignment > -999999)
				SetTextAlignment(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].txtLabel, oryUIParameters.textAlignment)
			endif
			if (oryUIParameters.textBold > -999999)
				SetTextBold(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].txtLabel, oryUIParameters.textBold)
			endif
			if (oryUIParameters.textSize# > -999999)
				SetTextSize(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].txtLabel, oryUIParameters.textSize#)
			endif

			// THE REST OF THE PARAMETERS NEXT
			if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999 or oryUIParameters.color#[4] > -999999)
				SetSpriteColor(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprContainer, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], oryUIParameters.color#[4])
			endif
			if (oryUIParameters.iconColor#[1] > -999999 or oryUIParameters.iconColor#[2] > -999999 or oryUIParameters.iconColor#[3] > -999999 or oryUIParameters.iconColor#[4] > -999999)
				SetSpriteColor(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprLeftIcon, oryUIParameters.iconColor#[1], oryUIParameters.iconColor#[2], oryUIParameters.iconColor#[3], oryUIParameters.iconColor#[4])
				SetSpriteColor(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, oryUIParameters.iconColor#[1], oryUIParameters.iconColor#[2], oryUIParameters.iconColor#[3], oryUIParameters.iconColor#[4])
			endif
			if (oryUIParameters.leftIconColor#[1] > -999999 or oryUIParameters.leftIconColor#[2] > -999999 or oryUIParameters.leftIconColor#[3] > -999999 or oryUIParameters.leftIconColor#[4] > -999999)
				SetSpriteColor(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprLeftIcon, oryUIParameters.leftIconColor#[1], oryUIParameters.leftIconColor#[2], oryUIParameters.leftIconColor#[3], oryUIParameters.leftIconColor#[4])
			endif
			if (oryUIParameters.rightIconColor#[1] > -999999 or oryUIParameters.rightIconColor#[2] > -999999 or oryUIParameters.rightIconColor#[3] > -999999 or oryUIParameters.rightIconColor#[4] > -999999)
				SetSpriteColor(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].sprRightIcon, oryUIParameters.rightIconColor#[1], oryUIParameters.rightIconColor#[2], oryUIParameters.rightIconColor#[3], oryUIParameters.rightIconColor#[4])
			endif
			if (oryUIParameters.name$ <> "")
				if (lower(oryUIParameters.name$) = "null") then oryUIParameters.name$ = ""
				OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].name$ = oryUIParameters.name$
			endif
			if (oryUIParameters.textColor#[1] > -999999 or oryUIParameters.textColor#[2] > -999999 or oryUIParameters.textColor#[3] > -999999 or oryUIParameters.textColor#[4] > -999999)
				SetTextColor(OryUIMenuCollection[oryUIMenuID].items[oryUIMenuItemID - 1].txtLabel, oryUIParameters.textColor#[1], oryUIParameters.textColor#[2], oryUIParameters.textColor#[3], oryUIParameters.textColor#[4])
			endif
		endif
	endif
endfunction

foldend
