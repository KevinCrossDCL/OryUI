
foldstart // OryUIButtonGroup Component (Updated 08/04/2019)

type typeOryUIButtonGroup
	id as integer
	buttons as typeOryUIButtonGroupItem[]
	buttonNames$ as string[]
	buttonReleased as integer
	iconPlacement$ as string
	iconSize# as float[2]
	name$ as string
	selected as integer
	selectedChange as integer
	selectedColor# as float[4]
	selectedTextBold as integer
	selectedTextColor# as float[4]
	selectedTextSize# as float
	sprContainer as integer
	unselectedColor# as float[4]
	unselectedTextBold as integer
	unselectedTextColor# as float[4]
	unselectedTextSize# as float
	updatedButtons as integer
	visible as integer
endtype

type typeOryUIButtonGroupItem
	id as integer
	icon$ as string
	label$ as string
	name$ as string
	pressed as integer
	selected as integer
	sprContainer as integer
	sprIcon as integer
	txtLabel as integer
endtype

global OryUIButtonGroupCollection as typeOryUIButtonGroup[]
OryUIButtonGroupCollection.length = 1

function OryUICreateButtonGroup(oryUIComponentParameters$ as string)
	local oryUIButtonGroupID as integer
	OryUIButtonGroupCollection.length = OryUIButtonGroupCollection.length + 1
	oryUIButtonGroupID = OryUIButtonGroupCollection.length
	OryUIButtonGroupCollection[oryUIButtonGroupID].id = oryUIButtonGroupID

	// DEFAULT SETTINGS
	OryUIButtonGroupCollection[oryUIButtonGroupID].iconPlacement$ = "Left"
	OryUIButtonGroupCollection[oryUIButtonGroupID].iconSize#[1] = -1
	OryUIButtonGroupCollection[oryUIButtonGroupID].iconSize#[2] = 3
	OryUIButtonGroupCollection[oryUIButtonGroupID].selectedColor#[1] = 44
	OryUIButtonGroupCollection[oryUIButtonGroupID].selectedColor#[2] = 62
	OryUIButtonGroupCollection[oryUIButtonGroupID].selectedColor#[3] = 180
	OryUIButtonGroupCollection[oryUIButtonGroupID].selectedColor#[4] = 255
	OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextBold = 0
	OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextColor#[1] = 255
	OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextColor#[2] = 255
	OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextColor#[3] = 255
	OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextColor#[4] = 255
	OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextSize# = 3
	OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[1] = 189
	OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[2] = 195
	OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[3] = 199
	OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[4] = 255
	OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextBold = 0
	OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[1] = 128
	OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[2] = 128
	OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[3] = 128
	OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[4] = 255
	OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextSize# = 3

	OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer, 5, 5)
	SetSpriteColor(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer, 255, 255, 255, 255)
	SetSpriteOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer, 0, 0)

	if (oryUIComponentParameters$ <> "") then OryUIUpdateButtonGroup(oryUIButtonGroupID, oryUIComponentParameters$)
endfunction oryUIButtonGroupID

function OryUIDeleteButtonGroup(oryUIButtonGroupID as integer)
	DeleteSprite(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer)
	while (OryUIButtonGroupCollection[oryUIButtonGroupID].buttons.length > 0)
		OryUIDeleteButtonGroupItem(oryUIButtonGroupID, 0)
	endwhile
endfunction

function OryUIDeleteButtonGroupItem(oryUIButtonGroupID as integer, oryUIItemID as integer)
	DeleteSprite(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID].sprContainer)
	DeleteText(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID].txtLabel)
	OryUIButtonGroupCollection[oryUIButtonGroupID].buttons.remove(oryUIItemID)
endfunction

function OryUIGetButtonGroupHeight(oryUIButtonGroupID as integer)
	local oryUIButtonGroupHeight#
	if (GetSpriteExists(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer))
		oryUIButtonGroupHeight# = GetSpriteHeight(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer)
	endif
endfunction oryUIButtonGroupHeight#

function OryUIGetButtonGroupItemCount(oryUIButtonGroupID as integer)
	local oryUIButtonGroupItemCount
	oryUIButtonGroupItemCount = OryUIButtonGroupCollection[oryUIButtonGroupID].buttons.length + 1
endfunction oryUIButtonGroupItemCount

function OryUIGetButtonGroupItemHeight(oryUIButtonGroupID as integer, oryUIItemID as integer)
	local oryUIButtonGroupItemHeight#
	if (GetSpriteExists(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].sprContainer))
		oryUIButtonGroupItemHeight# = GetSpriteHeight(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].sprContainer)
	endif
endfunction oryUIButtonGroupItemHeight#

function OryUIGetButtonGroupItemPressedByIndex(oryUIButtonGroupID as integer, oryUIItemID as integer)
	local oryUIButtonGroupItemPressed as integer
	local oryUIButtonGroupItemSprite as integer
	local oryUIButtonGroupItemText as integer
	if (GetSpriteExists(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].sprContainer))
		if (OryUIGetSwipingVertically() = 0)
			if (GetPointerPressed())
				oryUIButtonGroupItemSprite = GetSpriteHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIButtonGroupItemText = GetTextHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				if (oryUIButtonGroupItemSprite = 1 or oryUIButtonGroupItemText = 1)
					OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].pressed = 1
				else
					OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].pressed = 0
				endif
			elseif (OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].pressed = 1)
				if (GetPointerState())
					oryUIButtonGroupItemSprite = GetSpriteHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIButtonGroupItemText = GetTextHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (oryUIButtonGroupItemSprite = 1 or oryUIButtonGroupItemText = 1)
						OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].pressed = 1
					else
						OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].pressed = 0
					endif
					if (OryUIGetSwipingVertically())
						OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].pressed = 0
					endif
				endif
			endif
		endif
		oryUIButtonGroupItemPressed = OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].pressed					
	endif
	
	if (oryUIDialogVisible = 1) then oryUIButtonGroupItemPressed = 0
endfunction oryUIButtonGroupItemPressed

function OryUIGetButtonGroupItemPressedByName(oryUIButtonGroupID as integer, oryUIItemName$ as string)
	local oryUIButtonGroupItemPressed as integer
	local oryUIButtonGroupItemSprite as integer
	local oryUIButtonGroupItemText as integer
	for oryUIForI = 0 to OryUIGetButtonGroupItemCount(oryUIButtonGroupID) - 1
		if (lower(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].name$) = lower(oryUIItemName$))
			if (GetSpriteExists(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer))
				if (OryUIGetSwipingVertically() = 0)
					if (GetPointerPressed())
						oryUIButtonGroupItemSprite = GetSpriteHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						//oryUIButtonGroupItemText = GetTextHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						if (oryUIButtonGroupItemSprite = 1) // or oryUIButtonGroupItemText = 1)
							OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].pressed = 1
						else
							OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].pressed = 0
						endif
					elseif (OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].pressed = 1)
						if (GetPointerState())
							oryUIButtonGroupItemSprite = GetSpriteHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							//oryUIButtonGroupItemText = GetTextHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							if (oryUIButtonGroupItemSprite = 1) // or oryUIButtonGroupItemText = 1)
								OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].pressed = 1
							else
								OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].pressed = 0
							endif
							if (OryUIGetSwipingVertically())
								OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].pressed = 0
							endif
						endif
					endif
				else
					OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].pressed = 0
				endif
				oryUIButtonGroupItemPressed = OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].pressed					
			endif
			exit
		endif
	next

	if (oryUIDialogVisible = 1) then oryUIButtonGroupItemPressed = 0
endfunction oryUIButtonGroupItemPressed
	
function OryUIGetButtonGroupItemReleasedByIndex(oryUIButtonGroupID as integer, oryUIItemID as integer)
	local oryUIButtonGroupItemReleased as integer
	local oryUIButtonGroupItemSprite as integer
	local oryUIButtonGroupItemText as integer
	if (GetSpriteExists(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].sprContainer))
		if (OryUIGetSwipingVertically() = 0)
			if (GetPointerPressed())
				oryUIButtonGroupItemSprite = GetSpriteHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIButtonGroupItemText = GetTextHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				if (oryUIButtonGroupItemSprite = 1 or oryUIButtonGroupItemText = 1)
					OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].pressed = 1
				endif
			else
				if (GetPointerState())
					oryUIButtonGroupItemSprite = GetSpriteHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIButtonGroupItemText = GetTextHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].pressed = 1)
						if (oryUIButtonGroupItemSprite = 0 and oryUIButtonGroupItemText = 0)
							OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].pressed = 0
						endif
					endif
				endif
				if (GetPointerReleased())
					oryUIButtonGroupItemSprite = GetSpriteHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIButtonGroupItemText = GetTextHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].pressed = 1)
						if (oryUIButtonGroupItemSprite = 1 or oryUIButtonGroupItemText = 1)
							oryUIButtonGroupItemReleased = 1
						else
							oryUIButtonGroupItemReleased = 0
						endif
					endif
					OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].pressed = 0
				endif
			endif
		else
			OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].pressed = 0
		endif
	endif
	
	if (oryUIDialogVisible = 1) then oryUIButtonGroupItemReleased = 0
endfunction oryUIButtonGroupItemReleased

function OryUIGetButtonGroupItemReleasedByName(oryUIButtonGroupID as integer, oryUIItemName$ as string)
	local oryUIButtonGroupItemReleased as integer
	local oryUIButtonGroupItemSprite as integer
	local oryUIButtonGroupItemText as integer
	for oryUIForI = 0 to OryUIGetButtonGroupItemCount(oryUIButtonGroupID) - 1
		if (lower(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].name$) = lower(oryUIItemName$))
			if (GetSpriteExists(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer))
				if (OryUIGetSwipingVertically() = 0)
					if (GetPointerPressed())
						oryUIButtonGroupItemSprite = GetSpriteHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						oryUIButtonGroupItemText = GetTextHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						if (oryUIButtonGroupItemSprite = 1 or oryUIButtonGroupItemText = 1)
							OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].pressed = 1
						endif
					else
						if (GetPointerState())
							oryUIButtonGroupItemSprite = GetSpriteHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							oryUIButtonGroupItemText = GetTextHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							if (OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].pressed = 1)
								if (oryUIButtonGroupItemSprite = 0 and oryUIButtonGroupItemText = 0)
									OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].pressed = 0
								endif
							endif
						endif
						if (GetPointerReleased())
							oryUIButtonGroupItemSprite = GetSpriteHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							oryUIButtonGroupItemText = GetTextHitTest(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							if (OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].pressed = 1)
								if (oryUIButtonGroupItemSprite = 1 or oryUIButtonGroupItemText = 1)
									oryUIButtonGroupItemReleased = 1
								else
									oryUIButtonGroupItemReleased = 0
								endif
							endif
							OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].pressed = 0
						endif
					endif
				else
					OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].pressed = 0
				endif
			endif
			exit
		endif
	next

	if (oryUIDialogVisible = 1) then oryUIButtonGroupItemReleased = 0
endfunction oryUIButtonGroupItemReleased

function OryUIGetButtonGroupItemReleasedIndex(oryUIButtonGroupID as integer)
	local oryUIButtonGroupItemReleasedIndex
	oryUIButtonGroupItemReleasedIndex = OryUIButtonGroupCollection[oryUIButtonGroupID].buttonReleased
endfunction oryUIButtonGroupItemReleasedIndex

function OryUIGetButtonGroupItemReleasedName(oryUIButtonGroupID as integer)
	local oryUIButtonGroupItemReleasedName$
	oryUIButtonGroupItemReleasedName$ = OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[OryUIButtonGroupCollection[oryUIButtonGroupID].buttonReleased - 1].name$
endfunction oryUIButtonGroupItemReleasedName$

function OryUIGetButtonGroupItemSelectedIndex(oryUIButtonGroupID as integer)
	local oryUIButtonGroupItemSelectedIndex
	oryUIButtonGroupItemSelectedIndex = OryUIButtonGroupCollection[oryUIButtonGroupID].selected
endfunction oryUIButtonGroupItemSelectedIndex

function OryUIGetButtonGroupItemSelectedName(oryUIButtonGroupID as integer)
	local oryUIButtonGroupItemSelectedName$
	if (OryUIButtonGroupCollection[oryUIButtonGroupID].selected > 0)
		oryUIButtonGroupItemSelectedName$ = OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[OryUIButtonGroupCollection[oryUIButtonGroupID].selected - 1].name$
	endif
endfunction oryUIButtonGroupItemSelectedName$

function OryUIGetButtonGroupItemWidth(oryUIButtonGroupID as integer, oryUIItemID as integer)
	local oryUIButtonGroupItemWidth#
	if (GetSpriteExists(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].sprContainer))
		oryUIButtonGroupItemWidth# = GetSpriteWidth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].sprContainer)
	endif
endfunction oryUIButtonGroupItemWidth#

function OryUIGetButtonGroupWidth(oryUIButtonGroupID as integer)
	local oryUIButtonGroupWidth#
	if (GetSpriteExists(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer))
		oryUIButtonGroupWidth# = GetSpriteWidth(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer)
	endif
endfunction oryUIButtonGroupWidth#

function OryUIGetButtonGroupX(oryUIButtonGroupID as integer)
	local oryUIButtonGroupX#
	if (GetSpriteExists(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer))
		oryUIButtonGroupX# = GetSpriteX(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer)
	endif
endfunction oryUIButtonGroupX#

function OryUIGetButtonGroupY(oryUIButtonGroupID as integer)
	local oryUIButtonGroupY#
	if (GetSpriteExists(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer))
		oryUIButtonGroupY# = GetSpriteY(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer)
	endif
endfunction oryUIButtonGroupY#

function OryUIInsertButtonGroupItem(oryUIButtonGroupID as integer, oryUIIndex as integer, oryUIComponentParameters$ as string)
	local oryUIButtonGroupItemID as integer
	if (oryUIIndex = -1)
		OryUIButtonGroupCollection[oryUIButtonGroupID].buttons.length = OryUIButtonGroupCollection[oryUIButtonGroupID].buttons.length + 1
		OryUIButtonGroupCollection[oryUIButtonGroupID].buttonNames$.length = OryUIButtonGroupCollection[oryUIButtonGroupID].buttonNames$.length + 1
		oryUIButtonGroupItemID = OryUIButtonGroupCollection[oryUIButtonGroupID].buttons.length
		OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].id = oryUIButtonGroupItemID + 1
	endif

	OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprContainer, 30, 5)
	SetSpriteDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprContainer, GetSpriteDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer) - 1)
	SetSpriteColor(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprContainer, OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[1], OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[2], OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[3], OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[4])
	SetSpriteOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprContainer, 0, 0)

	OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprIcon = CreateSprite(0)
	SetSpriteSize(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprIcon, -1, 3) //2.87
	//SetSpriteImage(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprIcon, oryUIIconAddImage)
	SetSpriteColor(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprIcon, 255, 255, 255, 0)
	SetSpriteDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprIcon, GetSpriteDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprContainer) - 1)
	SetSpriteOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprIcon, GetSpriteWidth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprIcon) / 2, GetSpriteHeight(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprIcon) / 2)
	OryUIPinSpriteToCentreOfSprite(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprIcon, OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprContainer, 0, 0)

	OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].txtLabel = CreateText("")
	SetTextSize(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextSize#)
	SetTextBold(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextBold)
	SetTextColor(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[1], OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[2], OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[3], OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[4])
	SetTextAlignment(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].txtLabel, 1)
	SetTextDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].txtLabel, GetSpriteDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprContainer) - 1)
	OryUIPinTextToCentreOfSprite(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprContainer, 0, 0)

	if (oryUIComponentParameters$ <> "") then OryUIUpdateButtonGroupItem(oryUIButtonGroupID, oryUIButtonGroupItemID + 1, oryUIComponentParameters$)
endfunction

function OryUIInsertButtonGroupListener(oryUIButtonGroupID as integer)
	OryUIButtonGroupCollection[oryUIButtonGroupID].buttonReleased = -1
	for oryUIForI = 0 to OryUIGetButtonGroupItemCount(oryUIButtonGroupID) - 1
		if (GetSpriteExists(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer))
			if (OryUIGetButtonGroupItemReleasedByIndex(oryUIButtonGroupID, oryUIForI + 1))
				OryUIButtonGroupCollection[oryUIButtonGroupID].buttonReleased = oryUIForI + 1
				OryUIButtonGroupCollection[oryUIButtonGroupID].selected = oryUIForI + 1
				OryUIButtonGroupCollection[oryUIButtonGroupID].selectedChange = 1
			endif
		endif
	next
	if (OryUIButtonGroupCollection[oryUIButtonGroupID].selectedChange = 1)
		for oryUIForI = 0 to OryUIGetButtonGroupItemCount(oryUIButtonGroupID) - 1
			if (GetSpriteExists(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer))
				if (OryUIButtonGroupCollection[oryUIButtonGroupID].selected = oryUIForI + 1)
					SetSpriteColor(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, OryUIButtonGroupCollection[oryUIButtonGroupID].selectedColor#[1], OryUIButtonGroupCollection[oryUIButtonGroupID].selectedColor#[2], OryUIButtonGroupCollection[oryUIButtonGroupID].selectedColor#[3], OryUIButtonGroupCollection[oryUIButtonGroupID].selectedColor#[4])
					SetTextBold(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextBold)
					SetTextColor(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextColor#[1], OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextColor#[2], OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextColor#[3], OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextColor#[4])
					SetTextSize(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextSize#)
				else
					SetSpriteColor(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[1], OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[2], OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[3], OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[4])
					SetTextBold(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextBold)
					SetTextColor(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[1], OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[2], OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[3], OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[4])
					SetTextSize(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextSize#)
				endif
			endif
		next
	endif
	OryUIButtonGroupCollection[oryUIButtonGroupID].selectedChange = 0
endfunction

function OryUIResizeAndPositionButtonsInButtonGroup(oryUIButtonGroupID as integer)
	local oryUIButtonGroupX# as float
	local oryUIButtonWidth# as float
	oryUIButtonGroupX# = GetSpriteX(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer)
	oryUIButtonWidth# = GetSpriteWidth(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer) / (OryUIButtonGroupCollection[oryUIButtonGroupID].buttons.length + 1)
	for oryUIForI = 0 to OryUIButtonGroupCollection[oryUIButtonGroupID].buttons.length
		SetSpritePositionByOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, oryUIButtonGroupX# + (oryUIForI * oryUIButtonWidth#), GetSpriteY(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer))
		SetSpriteSize(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, oryUIButtonWidth#, GetSpriteHeight(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer))
		SetSpriteDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, GetSpriteDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer) - 1)
		if (OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].label$ <> "" and OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].icon$ = "")
			OryUIPinTextToCentreOfSprite(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, 0, 0)
			SetTextAlignment(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, 1)
			SetTextDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, GetSpriteDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer) - 1)
		elseif (OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].icon$ <> "" and OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].label$ = "")
			SetSpriteSize(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon, OryUIButtonGroupCollection[oryUIButtonGroupID].iconSize#[1], OryUIButtonGroupCollection[oryUIButtonGroupID].iconSize#[2])
			OryUIPinSpriteToCentreOfSprite(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon, OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, 0, 0)
			SetSpriteDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon, GetSpriteDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer) - 1)
		else
			SetSpriteSize(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon, OryUIButtonGroupCollection[oryUIButtonGroupID].iconSize#[1], OryUIButtonGroupCollection[oryUIButtonGroupID].iconSize#[2])
			oryUIIconAndLabelWidth# = GetSpriteWidth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon) + 1 + GetTextTotalWidth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel)
			oryUIIconAndLabelOffsetX# = (GetSpriteWidth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer) - oryUIIconAndLabelWidth#) / 2
			oryUIIconAndLabelHeight# = GetSpriteHeight(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon) + 1 + GetTextTotalHeight(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel)
			oryUIIconAndLabelOffsetY# = (GetSpriteHeight(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer) - oryUIIconAndLabelHeight#) / 2
			if (lower(OryUIButtonGroupCollection[oryUIButtonGroupID].iconPlacement$) = "left")
				SetSpriteOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon, 0, GetSpriteHeight(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon))
				OryUIPinSpriteToCentreLeftOfSprite(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon, OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, oryUIIconAndLabelOffsetX#, GetSpriteHeight(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon) / 2)
				OryUIPinTextToCentreRightOfSprite(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon, 1, 0)
				SetTextAlignment(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, 0)
			elseif (lower(OryUIButtonGroupCollection[oryUIButtonGroupID].iconPlacement$) = "right")
				SetSpriteOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon, GetSpriteWidth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon), GetSpriteHeight(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon))
				OryUIPinSpriteToCentreRightOfSprite(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon, OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, -oryUIIconAndLabelOffsetX#, GetSpriteHeight(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon) / 2)
				OryUIPinTextToCentreLeftOfSprite(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon, -1, 0)
				SetTextAlignment(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, 2)
			elseif (lower(OryUIButtonGroupCollection[oryUIButtonGroupID].iconPlacement$) = "top")
				SetSpriteOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon, GetSpriteWidth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon) / 2, 0)
				OryUIPinSpriteToTopCentreOfSprite(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon, OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, 0, oryUIIconAndLabelOffsetY#)
				OryUIPinTextToBottomCentreOfSprite(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon, 0, 1 + GetTextTotalHeight(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel))
				SetTextAlignment(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, 1)
			elseif (lower(OryUIButtonGroupCollection[oryUIButtonGroupID].iconPlacement$) = "bottom")
				SetSpriteOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon, GetSpriteWidth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon) / 2, GetSpriteHeight(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon))
				OryUIPinSpriteToBottomCentreOfSprite(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon, OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, 0, oryUIIconAndLabelOffsetY#)
				OryUIPinTextToTopCentreOfSprite(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprIcon, 0, -(1 + GetTextTotalHeight(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel)))
				SetTextAlignment(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, 1)
			endif 
		endif
	next
endfunction

function OryUISetButtonGroupItemCount(oryUIButtonGroupID as integer, oryUINewButtonGroupItemCount as integer)
	local oryUIOldButtonGroupItemCount
	oryUIOldButtonGroupItemCount = OryUIGetButtonGroupItemCount(oryUIButtonGroupID) - 1
	while (OryUIGetButtonGroupItemCount(oryUIButtonGroupID) - 1 > oryUINewButtonGroupItemCount - 1)
		OryUIDeleteButtonGroupItem(oryUIButtonGroupID, OryUIGetButtonGroupItemCount(oryUIButtonGroupID) - 1)
	endwhile
	for oryUIForI = 0 to oryUINewButtonGroupItemCount - 1
		if (oryUIForI > oryUIOldButtonGroupItemCount)
			OryUIInsertButtonGroupItem(oryUIButtonGroupID, -1, "")
		endif
	next
endfunction

function OryUISetButtonGroupItemSelectedByIndex(oryUIButtonGroupID as integer, oryUIItemID as integer)
	OryUIButtonGroupCollection[oryUIButtonGroupID].selected = oryUIItemID
	OryUIButtonGroupCollection[oryUIButtonGroupID].selectedChange = 1
endfunction

function OryUISetButtonGroupItemSelectedByName(oryUIButtonGroupID as integer, oryUIItemName$ as string)
	for oryUIForI = 0 to OryUIGetButtonGroupItemCount(oryUIButtonGroupID) - 1
		if (lower(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].name$) = lower(oryUIItemName$))
			OryUIButtonGroupCollection[oryUIButtonGroupID].selected = oryUIForI + 1
			OryUIButtonGroupCollection[oryUIButtonGroupID].selectedChange = 1
		endif
	next
endfunction

function OryUIUpdateButtonGroup(oryUIButtonGroupID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer))

		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
		if (OryUIParameters.size#[1] > -999999 and OryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer, OryUIParameters.size#[1], OryUIParameters.size#[2])
		elseif (OryUIParameters.size#[1] > -999999 and OryUIParameters.size#[2] = -999999)
			SetSpriteSize(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer, OryUIParameters.size#[1], GetSpriteHeight(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer))
		elseif (OryUIParameters.size#[1] = -999999 and OryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer, GetSpriteWidth(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer), OryUIParameters.size#[2])
		endif
		if (OryUIParameters.offsetCenter = 1)
			SetSpriteOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer, GetSpriteWidth(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer) / 2, GetSpriteHeight(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer) / 2)
		else
			if (OryUIParameters.offset#[1] > -999999 or OryUIParameters.offset#[2] > -999999)
				SetSpriteOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer, OryUIParameters.offset#[1], OryUIParameters.offset#[2])
			endif
		endif
		if (OryUIParameters.position#[1] > -999999 and OryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer, OryUIParameters.position#[1], OryUIParameters.position#[2])
		elseif (OryUIParameters.position#[1] > -999999 and OryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer, OryUIParameters.position#[1], GetSpriteYByOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer))
		elseif (OryUIParameters.position#[1] = -999999 and OryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer, GetSpriteXByOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer), OryUIParameters.position#[2])
		endif

		// THE REST OF THE PARAMETERS NEXT
		if (OryUIParameters.depth > -999999)
			SetSpriteDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer, OryUIParameters.depth)
		endif
		if (lower(OryUIParameters.iconPlacement$) = "bottom")
			OryUIButtonGroupCollection[oryUIButtonGroupID].iconPlacement$ = "Bottom"
		endif
		if (lower(OryUIParameters.iconPlacement$) = "left")
			OryUIButtonGroupCollection[oryUIButtonGroupID].iconPlacement$ = "Left"
		endif
		if (lower(OryUIParameters.iconPlacement$) = "right")
			OryUIButtonGroupCollection[oryUIButtonGroupID].iconPlacement$ = "Right"
		endif
		if (lower(OryUIParameters.iconPlacement$) = "top")
			OryUIButtonGroupCollection[oryUIButtonGroupID].iconPlacement$ = "Top"
		endif
		if (OryUIParameters.iconSize#[1] > -999999)
			OryUIButtonGroupCollection[oryUIButtonGroupID].iconSize#[1] = OryUIParameters.iconSize#[1]
		endif
		if (OryUIParameters.iconSize#[2] > -999999)
			OryUIButtonGroupCollection[oryUIButtonGroupID].iconSize#[2] = OryUIParameters.iconSize#[2]
		endif
		if (OryUIParameters.selectedColor#[1] > -999999 or OryUIParameters.selectedColor#[2] > -999999 or OryUIParameters.selectedColor#[3] > -999999 or OryUIParameters.selectedColor#[4] > -999999)
			OryUIButtonGroupCollection[oryUIButtonGroupID].selectedColor#[1] = OryUIParameters.selectedColor#[1]
			OryUIButtonGroupCollection[oryUIButtonGroupID].selectedColor#[2] = OryUIParameters.selectedColor#[2]
			OryUIButtonGroupCollection[oryUIButtonGroupID].selectedColor#[3] = OryUIParameters.selectedColor#[3]
			OryUIButtonGroupCollection[oryUIButtonGroupID].selectedColor#[4] = OryUIParameters.selectedColor#[4]
		endif
		if (OryUIParameters.selectedTextBold > -999999)
			OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextBold = OryUIParameters.selectedTextBold
		endif
		if (OryUIParameters.selectedTextColor#[1] > -999999 or OryUIParameters.selectedTextColor#[2] > -999999 or OryUIParameters.selectedTextColor#[3] > -999999 or OryUIParameters.selectedTextColor#[4] > -999999)
			OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextColor#[1] = OryUIParameters.selectedTextColor#[1]
			OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextColor#[2] = OryUIParameters.selectedTextColor#[2]
			OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextColor#[3] = OryUIParameters.selectedTextColor#[3]
			OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextColor#[4] = OryUIParameters.selectedTextColor#[4]
		endif
		if (OryUIParameters.selectedTextSize# > -999999)
			OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextSize# = OryUIParameters.selectedTextSize#
		endif
		if (OryUIParameters.unselectedColor#[1] > -999999 or OryUIParameters.unselectedColor#[2] > -999999 or OryUIParameters.unselectedColor#[3] > -999999 or OryUIParameters.unselectedColor#[4] > -999999)
			OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[1] = OryUIParameters.unselectedColor#[1]
			OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[2] = OryUIParameters.unselectedColor#[2]
			OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[3] = OryUIParameters.unselectedColor#[3]
			OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[4] = OryUIParameters.unselectedColor#[4]
		endif
		if (OryUIParameters.unselectedTextBold > -999999)
			OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextBold = OryUIParameters.unselectedTextBold
		endif
		if (OryUIParameters.unselectedTextColor#[1] > -999999 or OryUIParameters.unselectedTextColor#[2] > -999999 or OryUIParameters.unselectedTextColor#[3] > -999999 or OryUIParameters.unselectedTextColor#[4] > -999999)
			OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[1] = OryUIParameters.unselectedTextColor#[1]
			OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[2] = OryUIParameters.unselectedTextColor#[2]
			OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[3] = OryUIParameters.unselectedTextColor#[3]
			OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[4] = OryUIParameters.unselectedTextColor#[4]
		endif
		if (OryUIParameters.unselectedTextSize# > -999999)
			OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextSize# = OryUIParameters.unselectedTextSize#
		endif
	endif
	
	OryUIResizeAndPositionButtonsInButtonGroup(oryUIButtonGroupID)
endfunction

function OryUIUpdateButtonGroupItem(oryUIButtonGroupID as integer, oryUIButtonGroupItemID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID - 1].sprContainer))
		if (OryUIParameters.color#[1] > -999999 or OryUIParameters.color#[2] > -999999 or OryUIParameters.color#[3] > -999999 or OryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID - 1].sprContainer, OryUIParameters.color#[1], OryUIParameters.color#[2], OryUIParameters.color#[3], OryUIParameters.color#[4])
		endif
		if (OryUIParameters.icon$ <> "" and OryUIParameters.iconID > -999999)
			OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID - 1].icon$ = OryUIParameters.icon$
			SetSpriteImage(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID - 1].sprIcon, OryUIParameters.iconID)
			SetSpriteColorAlpha(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID - 1].sprIcon, 255)
		elseif (OryUIParameters.iconID > -999999)
			OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID - 1].icon$ = "custom"
			SetSpriteImage(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID - 1].sprIcon, OryUIParameters.iconID)
			SetSpriteColorAlpha(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID - 1].sprIcon, 255)
		endif
		if (OryUIParameters.name$ <> "")
			OryUIButtonGroupCollection[oryUIButtonGroupID].buttonNames$[oryUIButtonGroupItemID - 1] = lower(OryUIParameters.name$)
			OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID - 1].name$ = OryUIParameters.name$
		endif
		if (OryUIParameters.selected > -999999)
			OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID - 1].selected = OryUIParameters.selected
			OryUIButtonGroupCollection[oryUIButtonGroupID].selected = oryUIButtonGroupItemID
		endif
		if (OryUIParameters.text$ <> "")
			OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID - 1].label$ = OryUIParameters.text$
			SetTextString(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID - 1].txtLabel, OryUIParameters.text$)
		endif
		if (OryUIParameters.textBold > -999999)
			SetTextBold(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID - 1].txtLabel, OryUIParameters.textBold)
		endif
		if (OryUIParameters.textColor#[1] > -999999 or OryUIParameters.textColor#[2] > -999999 or OryUIParameters.textColor#[3] > -999999 or OryUIParameters.textColor#[4] > -999999)
			SetTextColor(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID - 1].txtLabel, OryUIParameters.textColor#[1], OryUIParameters.textColor#[2], OryUIParameters.textColor#[3], OryUIParameters.textColor#[4])
		endif
		if (OryUIParameters.textSize# > -999999)
			SetTextSize(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID - 1].txtLabel, OryUIParameters.textSize#)
		endif
	endif

	OryUIResizeAndPositionButtonsInButtonGroup(oryUIButtonGroupID)
endfunction

foldend
