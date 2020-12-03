
foldstart // OryUITabs Component (Updated 07/07/2020)

type typeOryUITabs
	id as integer
	buttonReleased as integer
	buttons as typeOryUITabsButton[]
	color# as float[4]
	defaultActiveColor# as float[4]
	defaultInactiveColor# as float[4]
	maxPosition# as float[2]
	minPosition# as float[2]
	originalPosition# as float[2]
	scrollable as integer
	selected as integer
	sprActiveIndicator as integer
	sprContainer as integer
	sprShadow as integer
	tabsType$ as string
endtype

type typeOryUITabsButton
	id as integer
	icon$ as string
	label$ as string
	name$ as string
	pressed as integer
	sprContainer as integer
	sprIcon as integer
	txtLabel as integer
endtype

global OryUITabsCollection as typeOryUITabs[]
OryUITabsCollection.length = 1

function OryUICreateTabs(oryUIComponentParameters$ as string)
	local oryUITabsID as integer
	OryUITabsCollection.length = OryUITabsCollection.length + 1
	oryUITabsID = OryUITabsCollection.length
	OryUITabsCollection[oryUITabsID].id = oryUITabsID

	oryUICreatedComponents.insert(OryUIAddCreatedComponent(oryUITabsID, "Tabs"))

	// DEFAULT SETTINGS
	OryUITabsCollection[oryUITabsID].defaultActiveColor#[1] = 255
	OryUITabsCollection[oryUITabsID].defaultActiveColor#[2] = 255
	OryUITabsCollection[oryUITabsID].defaultActiveColor#[3] = 255
	OryUITabsCollection[oryUITabsID].defaultActiveColor#[4] = 255
	OryUITabsCollection[oryUITabsID].defaultInactiveColor#[1] = 255
	OryUITabsCollection[oryUITabsID].defaultInactiveColor#[2] = 255
	OryUITabsCollection[oryUITabsID].defaultInactiveColor#[3] = 255
	OryUITabsCollection[oryUITabsID].defaultInactiveColor#[4] = 128
	OryUITabsCollection[oryUITabsID].scrollable = 0
	OryUITabsCollection[oryUITabsID].selected = 1
	OryUITabsCollection[oryUITabsID].tabsType$ = "TextOnly"

	OryUITabsCollection[oryUITabsID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUITabsCollection[oryUITabsID].sprContainer, 100, 6.16)
	SetSpriteColor(OryUITabsCollection[oryUITabsID].sprContainer, 52, 73, 94, 255)
	SetSpriteOffset(OryUITabsCollection[oryUITabsID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUITabsCollection[oryUITabsID].sprContainer, 0, 0)
	SetSpritePhysicsOff(OryUITabsCollection[oryUITabsID].sprContainer)

	OryUITabsCollection[oryUITabsID].sprActiveIndicator = CreateSprite(0)
	SetSpriteSize(OryUITabsCollection[oryUITabsID].sprActiveIndicator, 100, 0.4)
	SetSpriteDepth(OryUITabsCollection[oryUITabsID].sprActiveIndicator, GetSpriteDepth(OryUITabsCollection[oryUITabsID].sprContainer) - 2)
	SetSpriteColor(OryUITabsCollection[oryUITabsID].sprActiveIndicator, 255, 255, 255, 255)
	SetSpriteOffset(OryUITabsCollection[oryUITabsID].sprActiveIndicator, 0, 0)
	SetSpritePositionByOffset(OryUITabsCollection[oryUITabsID].sprActiveIndicator, -999999, -999999)
	SetSpritePhysicsOff(OryUITabsCollection[oryUITabsID].sprActiveIndicator)

	OryUITabsCollection[oryUITabsID].sprShadow = CreateSprite(0)
	SetSpriteSize(OryUITabsCollection[oryUITabsID].sprShadow, 100, 1)
	SetSpriteDepth(OryUITabsCollection[oryUITabsID].sprShadow, GetSpriteDepth(OryUITabsCollection[oryUITabsID].sprContainer))
	SetSpriteImage(OryUITabsCollection[oryUITabsID].sprShadow, oryUITopBarShadowImage)
	SetSpriteOffset(OryUITabsCollection[oryUITabsID].sprShadow, 0, 0)
	SetSpritePositionByOffset(OryUITabsCollection[oryUITabsID].sprShadow, GetSpriteX(OryUITabsCollection[oryUITabsID].sprContainer), GetSpriteY(OryUITabsCollection[oryUITabsID].sprContainer) + GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprContainer))
	SetSpritePhysicsOff(OryUITabsCollection[oryUITabsID].sprShadow)
	
	if (oryUIComponentParameters$ <> "") then OryUIUpdateTabs(oryUITabsID, oryUIComponentParameters$)
endfunction oryUITabsID

function OryUIDeleteTabs(oryUITabsID as integer)
	DeleteSprite(OryUITabsCollection[oryUITabsID].sprActiveIndicator)
	DeleteSprite(OryUITabsCollection[oryUITabsID].sprContainer)
	DeleteSprite(OryUITabsCollection[oryUITabsID].sprShadow)
	while (OryUITabsCollection[oryUITabsID].buttons.length >= 0)
		OryUIDeleteTabsButton(oryUITabsID, 0)
	endwhile
endfunction

function OryUIDeleteTabsButton(oryUITabsID as integer, oryUIButtonID as integer)
	DeleteSprite(OryUITabsCollection[oryUITabsID].buttons[oryUIButtonID].sprContainer)
	DeleteSprite(OryUITabsCollection[oryUITabsID].buttons[oryUIButtonID].sprIcon)
	DeleteText(OryUITabsCollection[oryUITabsID].buttons[oryUIButtonID].txtLabel)
	OryUITabsCollection[oryUITabsID].buttons.remove(oryUIButtonID)
endfunction

function OryUIGetTabsButtonCount(oryUITabsID as integer)
	local oryUITabsButtonCount as integer
	oryUITabsButtonCount = OryUITabsCollection[oryUITabsID].buttons.length + 1
endfunction oryUITabsButtonCount

function OryUIGetTabsButtonReleasedIcon(oryUITabsID as integer)	
	local oryUITabsButtonIcon$ as string
	if (OryUITabsCollection[oryUITabsID].buttonReleased > -1)
		oryUITabsButtonIcon$ = OryUITabsCollection[oryUITabsID].buttons[OryUITabsCollection[oryUITabsID].buttonReleased].icon$
	endif
endfunction oryUITabsButtonIcon$

function OryUIGetTabsButtonReleasedID(oryUITabsID as integer)
	local oryUITabsButtonID as integer
	if (OryUITabsCollection[oryUITabsID].buttonReleased > -1)
		oryUITabsButtonID = OryUITabsCollection[oryUITabsID].buttonReleased + 1
	endif
endfunction oryUITabsButtonID

function OryUIGetTabsButtonReleasedName(oryUITabsID as integer)
	local oryUITabsButtonName$ as string
	if (OryUITabsCollection[oryUITabsID].buttonReleased > -1)
		oryUITabsButtonName$ = OryUITabsCollection[oryUITabsID].buttons[OryUITabsCollection[oryUITabsID].buttonReleased].name$
	endif
endfunction oryUITabsButtonName$

function OryUIGetTabsButtonReleasedText(oryUITabsID as integer)
	local oryUITabsButtonText$ as string
	if (OryUITabsCollection[oryUITabsID].buttonReleased > -1)
		oryUITabsButtonText$ = OryUITabsCollection[oryUITabsID].buttons[OryUITabsCollection[oryUITabsID].buttonReleased].label$
	endif
endfunction oryUITabsButtonText$

function OryUIGetTabsHeight(oryUITabsID as integer)
	local oryUITabsHeight# as float
	if (GetSpriteExists(OryUITabsCollection[oryUITabsID].sprContainer))
		oryUITabsHeight# = GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprContainer)
	endif
endfunction oryUITabsHeight#

function OryUIInsertTabsButton(oryUITabsID as integer, oryUIIndex, oryUIComponentParameters$ as string)
	local oryUITabsButtonID as integer
	if (oryUIIndex = -1)
		OryUITabsCollection[oryUITabsID].buttons.length = OryUITabsCollection[oryUITabsID].buttons.length + 1
		oryUITabsButtonID = OryUITabsCollection[oryUITabsID].buttons.length
		OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].id = oryUITabsButtonID + 1
	endif

	OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprContainer, 33, GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprContainer))
	SetSpriteDepth(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprContainer, GetSpriteDepth(OryUITabsCollection[oryUITabsID].sprContainer) - 1)
	SetSpriteColor(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprContainer, OryUITabsCollection[oryUITabsID].color#[1], OryUITabsCollection[oryUITabsID].color#[2], OryUITabsCollection[oryUITabsID].color#[3], OryUITabsCollection[oryUITabsID].color#[4])
	SetSpriteOffset(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprContainer, 0, 0)
	SetSpritePhysicsOff(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprContainer)

	remstart
	OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprIcon = CreateSprite(0)
	SetSpriteSize(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprIcon, -1, 3.69)
	SetSpriteDepth(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprIcon, GetSpriteDepth(OryUITabsCollection[oryUITabsID].sprContainer) - 1)
	//SetSpriteColor(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprIcon, OryUITabsCollection[oryUITabsID].defaultIconColor#[1], OryUITabsCollection[oryUITabsID].defaultIconColor#[2], OryUITabsCollection[oryUITabsID].defaultIconColor#[3], OryUITabsCollection[oryUITabsID].defaultIconColor#[4])
	SetSpriteOffset(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprIcon, GetSpriteWidth(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprIcon), 0)
	remend
	
	OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].txtLabel = CreateText("TAB")
	SetTextSize(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].txtLabel, 2.5)
	SetTextBold(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].txtLabel, 1)
	SetTextColor(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].txtLabel, OryUITabsCollection[oryUITabsID].defaultInactiveColor#[1], OryUITabsCollection[oryUITabsID].defaultInactiveColor#[2], OryUITabsCollection[oryUITabsID].defaultInactiveColor#[3], OryUITabsCollection[oryUITabsID].defaultInactiveColor#[4])
	SetTextAlignment(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].txtLabel, 1)
	SetTextDepth(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].txtLabel, GetSpriteDepth(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprContainer) - 1)
	
	OryUIPositionButtonsInTabs(oryUITabsID)

	if (oryUIComponentParameters$ <> "") then OryUIUpdateTabsButton(oryUITabsID, oryUITabsButtonID + 1, oryUIComponentParameters$)
endfunction

function OryUIInsertTabsListener(oryUITabsID as integer)
	if (oryUIScrimVisible = 1) then exitfunction
	
	local oryUIForI as integer
	local oryUITabsButtonReleased as integer
	local oryUITabsButtonSprite as integer
	local oryUITabsSprite as integer

	OryUITabsCollection[oryUITabsID].buttonReleased = -1
	if (GetSpriteExists(OryUITabsCollection[oryUITabsID].sprContainer))
		SetSpriteX(OryUITabsCollection[oryUITabsID].sprContainer, OryUITabsCollection[oryUITabsID].minPosition#[1])
		if (GetViewOffsetY() > OryUITabsCollection[oryUITabsID].originalPosition#[2] - OryUITabsCollection[oryUITabsID].minPosition#[2])
			SetSpriteY(OryUITabsCollection[oryUITabsID].sprContainer, GetViewOffsetY() + OryUITabsCollection[oryUITabsID].minPosition#[2])
			SetSpriteY(OryUITabsCollection[oryUITabsID].sprShadow, GetViewOffsetY() + OryUITabsCollection[oryUITabsID].minPosition#[2] + GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprContainer))
		else
			SetSpriteY(OryUITabsCollection[oryUITabsID].sprContainer, OryUITabsCollection[oryUITabsID].originalPosition#[2])
			SetSpriteY(OryUITabsCollection[oryUITabsID].sprShadow, GetViewOffsetY() + GetScreenBoundsTop() + OryUITabsCollection[oryUITabsID].originalPosition#[2] + GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprContainer))
		endif
		
		for oryUIForI = 0 to OryUITabsCollection[oryUITabsID].buttons.length
			if (GetSpriteExists(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].sprContainer))
				if (OryUITabsCollection[oryUITabsID].selected = oryUIForI + 1)
					SetTextColor(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].txtLabel, OryUITabsCollection[oryUITabsID].defaultActiveColor#[1], OryUITabsCollection[oryUITabsID].defaultActiveColor#[2], OryUITabsCollection[oryUITabsID].defaultActiveColor#[3], OryUITabsCollection[oryUITabsID].defaultActiveColor#[4])
					SetSpriteColor(OryUITabsCollection[oryUITabsID].sprActiveIndicator, OryUITabsCollection[oryUITabsID].defaultActiveColor#[1], OryUITabsCollection[oryUITabsID].defaultActiveColor#[2], OryUITabsCollection[oryUITabsID].defaultActiveColor#[3], OryUITabsCollection[oryUITabsID].defaultActiveColor#[4])
					SetSpriteSize(OryUITabsCollection[oryUITabsID].sprActiveIndicator, GetSpriteWidth(OryUITabsCollection[oryUITabsID].buttons[OryUITabsCollection[oryUITabsID].selected - 1].sprContainer), GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprActiveIndicator))
					//SetSpritePositionByOffset(OryUITabsCollection[oryUITabsID].sprActiveIndicator, GetSpriteX(OryUITabsCollection[oryUITabsID].buttons[OryUITabsCollection[oryUITabsID].selected - 1].sprContainer), ScreenToWorldY(GetSpriteY(OryUITabsCollection[oryUITabsID].buttons[OryUITabsCollection[oryUITabsID].selected - 1].sprContainer)) + GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprContainer) - GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprActiveIndicator))
				else
					SetTextColor(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].txtLabel, OryUITabsCollection[oryUITabsID].defaultInactiveColor#[1], OryUITabsCollection[oryUITabsID].defaultInactiveColor#[2], OryUITabsCollection[oryUITabsID].defaultInactiveColor#[3], 128)
				endif
				if (OryUIGetSwipingVertically() = 0)
					oryUITabsSprite = GetSpriteHitTest(OryUITabsCollection[oryUITabsID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (GetPointerPressed())
						if (oryUITabsSprite = 1)
							oryUITouchingTabs = 1
						else
							oryUITouchingTabs = 0
						endif
						oryUITabsButtonSprite = GetSpriteHitTest(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						if (oryUITabsButtonSprite = 1)
							OryUITabsCollection[oryUITabsID].buttons[oryUIForI].pressed = 1
						endif
					else
						if (GetPointerState())
							if (oryUITabsSprite = 1)
								oryUITouchingTabs = 1
							else
								oryUITouchingTabs = 0
							endif
							oryUITabsButtonSprite = GetSpriteHitTest(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							if (OryUITabsCollection[oryUITabsID].buttons[oryUIForI].pressed)
								if (oryUITabsButtonSprite = 0)
									OryUITabsCollection[oryUITabsID].buttons[oryUIForI].pressed = 0
								endif
							endif
						endif
						if (GetPointerReleased())						
							oryUITabsButtonSprite = GetSpriteHitTest(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							if (OryUITabsCollection[oryUITabsID].buttons[oryUIForI].pressed)
								if (oryUITabsButtonSprite = 1)
									OryUITabsCollection[oryUITabsID].buttonReleased = oryUIForI
									OryUITabsCollection[oryUITabsID].selected = oryUIForI + 1
								endif
							endif
							OryUITabsCollection[oryUITabsID].buttons[oryUIForI].pressed = 0
							oryUITouchingTabs = 0
						endif
					endif
				endif
			endif
		next
	endif

	OryUIUpdateTabs(oryUITabsID, "")
endfunction

function OryUIPositionButtonsInTabs(oryUITabsID as integer)
	local oryUIForI as integer
	local oryUITabsOffsetX# as float
	local oryUITabsWidth# as float
	local oryUITabsX# as float
	
	for oryUIForI = 0 to OryUITabsCollection[oryUITabsID].buttons.length
		if (OryUITabsCollection[oryUITabsID].scrollable = 0)
			SetSpriteSize(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].sprContainer, GetSpriteWidth(OryUITabsCollection[oryUITabsID].sprContainer) / OryUIGetTabsButtonCount(oryUITabsID), GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprContainer))
			SetSpritePositionByOffset(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].sprContainer, GetSpriteX(OryUITabsCollection[oryUITabsID].sprContainer) + oryUITabsX#, GetSpriteY(OryUITabsCollection[oryUITabsID].sprContainer))
		else
			oryUITabsOffsetX# = 6.67 / GetDisplayAspect()
			oryUITabsWidth# = GetTextTotalWidth(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].txtLabel) + (4 / GetDisplayAspect())
			if (oryUITabsWidth# < 25) then oryUITabsWidth# = 25
			SetSpriteSize(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].sprContainer, oryUITabsWidth#, GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprContainer))
			SetSpritePositionByOffset(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].sprContainer, GetSpriteX(OryUITabsCollection[oryUITabsID].sprContainer) + oryUITabsX# + oryUITabsOffsetX#, GetSpriteY(OryUITabsCollection[oryUITabsID].sprContainer))
		endif
		SetSpriteDepth(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].sprContainer, GetSpriteDepth(OryUITabsCollection[oryUITabsID].sprContainer) - 1)
		OryUIPinTextToCentreOfSprite(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].txtLabel, OryUITabsCollection[oryUITabsID].buttons[oryUIForI].sprContainer, 0, 0)
		SetTextScissor(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].txtLabel, GetSpriteX(OryUITabsCollection[oryUITabsID].sprContainer), GetSpriteY(OryUITabsCollection[oryUITabsID].sprContainer), GetSpriteX(OryUITabsCollection[oryUITabsID].sprContainer) + GetSpriteWidth(OryUITabsCollection[oryUITabsID].sprContainer), GetSpriteY(OryUITabsCollection[oryUITabsID].sprContainer) + GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprContainer))
		SetTextDepth(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].txtLabel, GetSpriteDepth(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].sprContainer) - 1)
		oryUITabsX# = oryUITabsX# + GetSpriteWidth(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].sprContainer)	
		if (OryUITabsCollection[oryUITabsID].selected = oryUIForI + 1)
			OryUIPinSpriteToBottomLeftOfSprite(OryUITabsCollection[oryUITabsID].sprActiveIndicator, OryUITabsCollection[oryUITabsID].buttons[oryUIForI].sprContainer, 0, 0)
		endif
	next
endfunction

function OryUISetTabsButtonCount(oryUITabsID as integer, oryUINewTabsButtonCount as integer)
	local oryUIForI as integer
	local oryUIOldTabsButtonCount as integer
	
	oryUIOldTabsButtonCount = OryUIGetTabsButtonCount(oryUITabsID) - 1
	while (OryUIGetTabsButtonCount(oryUITabsID) - 1 > oryUINewTabsButtonCount - 1)
		OryUIDeleteTabsButton(oryUITabsID, OryUIGetTabsButtonCount(oryUITabsID) - 1)
	endwhile
	for oryUIForI = 0 to oryUINewTabsButtonCount - 1
		if (oryUIForI > oryUIOldTabsButtonCount)
			OryUIInsertTabsButton(oryUITabsID, -1, "")
		endif
	next
endfunction

function OryUISetTabsButtonSelected(oryUITabsID as integer, oryUITabsButtonID as integer)
	OryUITabsCollection[oryUITabsID].selected = oryUITabsButtonID
endfunction

function OryUISetTabsButtonSelectedByName(oryUITabsID as integer, oryUITabsButtonName$ as string)
	local oryUIForI as integer
	
	for oryUIForI = 0 to OryUIGetTabsButtonCount(oryUITabsID) - 1
		if (lower(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].name$) = lower(oryUITabsButtonName$))
			OryUITabsCollection[oryUITabsID].selected = oryUIForI + 1
		endif
	next
endfunction

function OryUIUpdateTabs(oryUITabsID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUITabsCollection[oryUITabsID].sprContainer))

		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
		if (oryUIParameters.size#[1] > -999999)
			SetSpriteSize(OryUITabsCollection[oryUITabsID].sprContainer, oryUIParameters.size#[1], GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprContainer))
			SetSpriteSize(OryUITabsCollection[oryUITabsID].sprShadow, oryUIParameters.size#[1], GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprShadow))
		endif
		if (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUITabsCollection[oryUITabsID].sprContainer, oryUIParameters.position#[1], oryUIParameters.position#[2])
			OryUITabsCollection[oryUITabsID].originalPosition#[1] = oryUIParameters.position#[1]
			OryUITabsCollection[oryUITabsID].originalPosition#[2] = oryUIParameters.position#[2]
		elseif (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(OryUITabsCollection[oryUITabsID].sprContainer, oryUIParameters.position#[1], GetSpriteYByOffset(OryUITabsCollection[oryUITabsID].sprContainer))
			OryUITabsCollection[oryUITabsID].originalPosition#[1] = oryUIParameters.position#[1]
		elseif (oryUIParameters.position#[1] = -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUITabsCollection[oryUITabsID].sprContainer, GetSpriteXByOffset(OryUITabsCollection[oryUITabsID].sprContainer), oryUIParameters.position#[2])
			OryUITabsCollection[oryUITabsID].originalPosition#[2] = oryUIParameters.position#[2]
		endif
		SetSpritePositionByOffset(OryUITabsCollection[oryUITabsID].sprShadow, GetSpriteX(OryUITabsCollection[oryUITabsID].sprContainer), GetSpriteY(OryUITabsCollection[oryUITabsID].sprContainer) + GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprContainer))

		// THE REST OF THE PARAMETERS NEXT
		if (oryUIParameters.activeColor#[1] > -999999 or oryUIParameters.activeColor#[2] > -999999 or oryUIParameters.activeColor#[3] > -999999 or oryUIParameters.activeColor#[4] > -999999)
			OryUITabsCollection[oryUITabsID].defaultActiveColor#[1] = oryUIParameters.activeColor#[1]
			OryUITabsCollection[oryUITabsID].defaultActiveColor#[2] = oryUIParameters.activeColor#[2]
			OryUITabsCollection[oryUITabsID].defaultActiveColor#[3] = oryUIParameters.activeColor#[3]
			OryUITabsCollection[oryUITabsID].defaultActiveColor#[4] = oryUIParameters.activeColor#[4]
		endif
		if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999 or oryUIParameters.color#[4] > -999999)
			if (oryUIParameters.color#[1] > -999999) then OryUITabsCollection[oryUITabsID].color#[1] = oryUIParameters.color#[1]
			if (oryUIParameters.color#[2] > -999999) then OryUITabsCollection[oryUITabsID].color#[2] = oryUIParameters.color#[2]
			if (oryUIParameters.color#[3] > -999999) then OryUITabsCollection[oryUITabsID].color#[3] = oryUIParameters.color#[3]
			if (oryUIParameters.color#[4] > -999999) then OryUITabsCollection[oryUITabsID].color#[4] = oryUIParameters.color#[4]
			SetSpriteColor(OryUITabsCollection[oryUITabsID].sprContainer, OryUITabsCollection[oryUITabsID].color#[1], OryUITabsCollection[oryUITabsID].color#[2], OryUITabsCollection[oryUITabsID].color#[3], OryUITabsCollection[oryUITabsID].color#[4])
		endif
		if (oryUIParameters.depth > -999999)
			SetSpriteDepth(OryUITabsCollection[oryUITabsID].sprContainer, oryUIParameters.depth)
		endif
		remstart
		if (oryUIParameters.iconColor#[1] > -999999 or oryUIParameters.iconColor#[2] > -999999 or oryUIParameters.iconColor#[3] > -999999 or oryUIParameters.iconColor#[4] > -999999)
			OryUITabsCollection[oryUITabsID].defaultIconColor#[1] = oryUIParameters.iconColor#[1]
			OryUITabsCollection[oryUITabsID].defaultIconColor#[2] = oryUIParameters.iconColor#[2]
			OryUITabsCollection[oryUITabsID].defaultIconColor#[3] = oryUIParameters.iconColor#[3]
			OryUITabsCollection[oryUITabsID].defaultIconColor#[4] = oryUIParameters.iconColor#[4]
			for oryUIForI = 0 to OryUITabsCollection[oryUITabsID].buttons.length
				SetSpriteColor(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].sprIcon, oryUIParameters.iconColor#[1], oryUIParameters.iconColor#[2], oryUIParameters.iconColor#[3], oryUIParameters.iconColor#[4])
			next
		endif
		remend
		if (oryUIParameters.imageID > -999999)
			SetSpriteImage(OryUITabsCollection[oryUITabsID].sprContainer, oryUIParameters.imageID)
		endif
		if (oryUIParameters.inactiveColor#[1] > -999999 or oryUIParameters.inactiveColor#[2] > -999999 or oryUIParameters.inactiveColor#[3] > -999999 or oryUIParameters.inactiveColor#[4] > -999999)
			OryUITabsCollection[oryUITabsID].defaultInactiveColor#[1] = oryUIParameters.inactiveColor#[1]
			OryUITabsCollection[oryUITabsID].defaultInactiveColor#[2] = oryUIParameters.inactiveColor#[2]
			OryUITabsCollection[oryUITabsID].defaultInactiveColor#[3] = oryUIParameters.inactiveColor#[3]
			OryUITabsCollection[oryUITabsID].defaultInactiveColor#[4] = oryUIParameters.inactiveColor#[4]
		endif
		if (oryUIParameters.minPosition#[1] >- 999999) then OryUITabsCollection[oryUITabsID].minPosition#[1] = oryUIParameters.minPosition#[1]
		if (oryUIParameters.minPosition#[2] >- 999999) then OryUITabsCollection[oryUITabsID].minPosition#[2] = oryUIParameters.minPosition#[2]
		
		remstart
		if (oryUIParameters.navigationIcon$ <> "") then OryUITabsCollection[oryUITabsID].icon$ = lower(oryUIParameters.navigationIcon$)
		if (lower(oryUIParameters.navigationIcon$) = "add") then SetSpriteImage(OryUITabsCollection[oryUITabsID].sprNavigationIcon, oryUIIconAddImage)
		if (lower(oryUIParameters.navigationIcon$) = "back") then SetSpriteImage(OryUITabsCollection[oryUITabsID].sprNavigationIcon, oryUIIconBackImage)
		if (lower(oryUIParameters.navigationIcon$) = "camera") then SetSpriteImage(OryUITabsCollection[oryUITabsID].sprNavigationIcon, oryUIIconCameraImage)
		if (lower(oryUIParameters.navigationIcon$) = "menu") then SetSpriteImage(OryUITabsCollection[oryUITabsID].sprNavigationIcon, oryUIIconMenuImage)
		if (lower(oryUIParameters.navigationIcon$) = "profile") then SetSpriteImage(OryUITabsCollection[oryUITabsID].sprNavigationIcon, oryUIIconProfileImage)
		if (lower(oryUIParameters.navigationIcon$) = "refresh") then SetSpriteImage(OryUITabsCollection[oryUITabsID].sprNavigationIcon, oryUIIconRefreshImage)
		if (lower(oryUIParameters.navigationIcon$) = "save") then SetSpriteImage(OryUITabsCollection[oryUITabsID].sprNavigationIcon, oryUIIconSaveImage)
		if (oryUIParameters.text$ <> "")
			SetTextString(OryUITabsCollection[oryUITabsID].txtTitle, oryUIParameters.text$)
		endif
		remend
		if (oryUIParameters.scrollable > -999999) then OryUITabsCollection[oryUITabsID].scrollable = oryUIParameters.scrollable
	endif

	OryUIPositionButtonsInTabs(oryUITabsID)
endfunction

function OryUIUpdateTabsButton(oryUITabsID as integer, oryUITabsButtonID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID - 1].sprContainer))
		if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999 or oryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID - 1].sprContainer, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], oryUIParameters.color#[4])
		endif
		if (oryUIParameters.name$ <> "")
			if (lower(oryUIParameters.name$) = "null") then oryUIParameters.name$ = ""
			OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID - 1].name$ = oryUIParameters.name$
		endif
		if (oryUIParameters.text$ <> "")
			if (lower(oryUIParameters.text$) = "null") then oryUIParameters.text$ = ""
			OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID - 1].label$ = oryUIParameters.text$
			SetTextString(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID - 1].txtLabel, upper(oryUIParameters.text$))
		endif
		remstart
		if (oryUIParameters.icon$ <> "") then OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID - 1].icon$ = lower(oryUIParameters.icon$)
		if (lower(oryUIParameters.icon$) = "add") then SetSpriteImage(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID - 1].sprIcon, oryUIIconAddImage)
		if (lower(oryUIParameters.icon$) = "back") then SetSpriteImage(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID - 1].sprIcon, oryUIIconBackImage)
		if (lower(oryUIParameters.icon$) = "camera") then SetSpriteImage(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID - 1].sprIcon, oryUIIconCameraImage)
		if (lower(oryUIParameters.icon$) = "menu") then SetSpriteImage(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID - 1].sprIcon, oryUIIconMenuImage)
		if (lower(oryUIParameters.icon$) = "profile") then SetSpriteImage(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID - 1].sprIcon, oryUIIconProfileImage)
		if (lower(oryUIParameters.icon$) = "refresh") then SetSpriteImage(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID - 1].sprIcon, oryUIIconRefreshImage)
		if (lower(oryUIParameters.icon$) = "save") then SetSpriteImage(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID - 1].sprIcon, oryUIIconSaveImage)
		remend
	endif

	OryUIPositionButtonsInTabs(oryUITabsID)
endfunction


foldend
