
foldstart // OryUIButtonGroup Component (Updated 23/02/2019)

type typeOryUIButtonGroup
	id as integer
	buttons as typeOryUIButtonGroupItem[]
	name$ as string
	selected as integer
	selectedColor# as float[4]
	selectedTextBold as integer
	selectedTextColor# as float[4]
	selectedTextSize# as float
	sprContainer as integer
	unselectedColor# as float[4]
	unselectedTextBold as integer
	unselectedTextColor# as float[4]
	unselectedTextSize# as float
endtype

type typeOryUIButtonGroupItem
	id as integer
	pressed as integer
	selected as integer
	sprContainer as integer
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
	OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[1] = 255
	OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[2] = 255
	OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[3] = 255
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

function OryUIGetButtonGroupItemPressed(oryUIButtonGroupID as integer, oryUIItemID as integer)
	local oryUIButtonGroupItemPressed as integer
	local oryUIButtonGroupItemSprite as integer
	local oryUIButtonGroupItemText as integer
	if (GetSpriteExists(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].sprContainer))
		if (OryUIGetDraggingVertically() = 0)
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
				endif
			endif
		endif
		oryUIButtonGroupItemPressed = OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].pressed					
	endif
endfunction oryUIButtonGroupItemPressed
	
function OryUIGetButtonGroupItemReleased(oryUIButtonGroupID as integer, oryUIItemID as integer)
	local oryUIButtonGroupItemReleased as integer
	local oryUIButtonGroupItemSprite as integer
	local oryUIButtonGroupItemText as integer
	if (GetSpriteExists(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIItemID - 1].sprContainer))
		if (OryUIGetDraggingVertically() = 0)
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
		endif
	endif
endfunction oryUIButtonGroupItemReleased

function OryUIGetButtonGroupItemSelected(oryUIButtonGroupID as integer)
	local oryUIButtonGroupItemSelected
	oryUIButtonGroupItemSelected = OryUIButtonGroupCollection[oryUIButtonGroupID].selected
endfunction oryUIButtonGroupItemSelected

function OryUIInsertButtonGroupItem(oryUIButtonGroupID, oryUIIndex, oryUIComponentParameters$ as string)
	local oryUIButtonGroupItemID as integer
	if (oryUIIndex = -1)
		OryUIButtonGroupCollection[oryUIButtonGroupID].buttons.length = OryUIButtonGroupCollection[oryUIButtonGroupID].buttons.length + 1
		oryUIButtonGroupItemID = OryUIButtonGroupCollection[oryUIButtonGroupID].buttons.length
		OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].id = oryUIButtonGroupItemID + 1
	endif

	OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprContainer, 30, 5)
	SetSpriteColor(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprContainer, OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[1], OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[2], OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[3], OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[4])
	SetSpriteOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprContainer, 0, 0)

	OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].txtLabel = CreateText("Button")
	SetTextSize(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextSize#)
	SetTextBold(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextBold)
	SetTextColor(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[1], OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[2], OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[3], OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[4])
	SetTextAlignment(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].txtLabel, 1)
	SetTextDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].txtLabel, GetSpriteDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprContainer) - 1)
	OryUIPinTextToCentreOfSprite(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprContainer, 0, 0)

	if (oryUIComponentParameters$ <> "") then OryUIUpdateButtonGroupItem(oryUIButtonGroupID, oryUIButtonGroupItemID, oryUIComponentParameters$)
endfunction

function OryUIInsertButtonGroupListener(oryUIButtonGroupID as integer)
	for oryUIForI = 0 to OryUIGetButtonGroupItemCount(oryUIButtonGroupID) - 1
		if (GetSpriteExists(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer))
			if (OryUIGetButtonGroupItemReleased(oryUIButtonGroupID, oryUIForI + 1))
				OryUIButtonGroupCollection[oryUIButtonGroupID].selected = oryUIForI + 1
			endif
			if (OryUIButtonGroupCollection[oryUIButtonGroupID].selected = oryUIForI + 1)
				OryUIUpdateButtonGroupItem(oryUIButtonGroupID, oryUIForI, "color:" + str(OryUIButtonGroupCollection[oryUIButtonGroupID].selectedColor#[1]) + "," + str(OryUIButtonGroupCollection[oryUIButtonGroupID].selectedColor#[2]) + "," + str(OryUIButtonGroupCollection[oryUIButtonGroupID].selectedColor#[3]) + "," + str(OryUIButtonGroupCollection[oryUIButtonGroupID].selectedColor#[4]) + ";textBold:" + str(OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextBold) + ";textColor:" + str(OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextColor#[1]) + "," + str(OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextColor#[2]) + "," + str(OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextColor#[3]) + "," + str(OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextColor#[4]) + ";textSize:" + str(OryUIButtonGroupCollection[oryUIButtonGroupID].selectedTextSize#))
			else
				OryUIUpdateButtonGroupItem(oryUIButtonGroupID, oryUIForI, "color:" + str(OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[1]) + "," + str(OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[2]) + "," + str(OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[3]) + "," + str(OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedColor#[4]) + ";textBold:" + str(OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextBold) + ";textColor:" + str(OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[1]) + "," + str(OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[2]) + "," + str(OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[3]) + "," + str(OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextColor#[4]) + ";textSize:" + str(OryUIButtonGroupCollection[oryUIButtonGroupID].unselectedTextSize#))
			endif
		endif
	next
endfunction

function OryUIResizeAndPositionButtonsInButtonGroup(oryUIButtonGroupID as integer)
	local oryUIButtonGroupX# as float
	local oryUIButtonWidth# as float
	oryUIButtonGroupX# = GetSpriteX(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer)
	oryUIButtonWidth# = GetSpriteWidth(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer) / (OryUIButtonGroupCollection[oryUIButtonGroupID].buttons.length + 1)
	for oryUIForI = 0 to OryUIButtonGroupCollection[oryUIButtonGroupID].buttons.length
		SetSpritePositionByOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, oryUIButtonGroupX# + (oryUIForI * oryUIButtonWidth#), GetSpriteY(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer))
		SetSpriteSize(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, oryUIButtonWidth#, GetSpriteHeight(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer))
		OryUIPinTextToCentreOfSprite(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, 0, 0)
		SetSpriteDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer, GetSpriteDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer) - 1)
		SetTextDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].txtLabel, GetSpriteDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIForI].sprContainer) - 1)
	next
endfunction

function OryUISetButtonGroupItemSelected(oryUIButtonGroupID as integer, oryUIItemID as integer)
	OryUIButtonGroupCollection[oryUIButtonGroupID].selected = oryUIItemID
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
		if (OryUIParameters.position#[1] > -999999 or OryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer, OryUIParameters.position#[1], OryUIParameters.position#[2])
		elseif (OryUIParameters.position#[1] > -999999 or OryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer, OryUIParameters.position#[1], GetSpriteYByOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer))
		elseif (OryUIParameters.position#[1] = -999999 or OryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer, GetSpriteXByOffset(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer), OryUIParameters.position#[2])
		endif

		// THE REST OF THE PARAMETERS NEXT
		if (OryUIParameters.depth > -999999)
			SetSpriteDepth(OryUIButtonGroupCollection[oryUIButtonGroupID].sprContainer, OryUIParameters.depth)
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

function OryUIUpdateButtonGroupItem(oryUIButtonGroupID, oryUIButtonGroupItemID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprContainer))
		if (OryUIParameters.color#[1] > -999999 or OryUIParameters.color#[2] > -999999 or OryUIParameters.color#[3] > -999999 or OryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].sprContainer, OryUIParameters.color#[1], OryUIParameters.color#[2], OryUIParameters.color#[3], OryUIParameters.color#[4])
		endif
		if (OryUIParameters.selected > -999999)
			OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].selected = OryUIParameters.selected
			OryUIButtonGroupCollection[oryUIButtonGroupID].selected = oryUIButtonGroupItemID + 1
		endif
		if (OryUIParameters.text$ <> "")
			SetTextString(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].txtLabel, OryUIParameters.text$)
		endif
		if (OryUIParameters.textBold > -999999)
			SetTextBold(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].txtLabel, OryUIParameters.textBold)
		endif
		if (OryUIParameters.textColor#[1] > -999999 or OryUIParameters.textColor#[2] > -999999 or OryUIParameters.textColor#[3] > -999999 or OryUIParameters.textColor#[4] > -999999)
			SetTextColor(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].txtLabel, OryUIParameters.textColor#[1], OryUIParameters.textColor#[2], OryUIParameters.textColor#[3], OryUIParameters.textColor#[4])
		endif
		if (OryUIParameters.textSize# > -999999)
			SetTextSize(OryUIButtonGroupCollection[oryUIButtonGroupID].buttons[oryUIButtonGroupItemID].txtLabel, OryUIParameters.textSize#)
		endif
	endif

	OryUIResizeAndPositionButtonsInButtonGroup(oryUIButtonGroupID)
endfunction

foldend
