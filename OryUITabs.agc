
foldstart // OryUITabs Component (Updated 23/03/2019)

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

	OryUITabsCollection[oryUITabsID].sprActiveIndicator = CreateSprite(0)
	SetSpriteSize(OryUITabsCollection[oryUITabsID].sprActiveIndicator, 100, 0.4)
	SetSpriteDepth(OryUITabsCollection[oryUITabsID].sprActiveIndicator, GetSpriteDepth(OryUITabsCollection[oryUITabsID].sprContainer) - 2)
	SetSpriteColor(OryUITabsCollection[oryUITabsID].sprActiveIndicator, 255, 255, 255, 255)
	SetSpriteOffset(OryUITabsCollection[oryUITabsID].sprActiveIndicator, 0, 0)
	SetSpritePositionByOffset(OryUITabsCollection[oryUITabsID].sprActiveIndicator, -999999, -999999)

	OryUITabsCollection[oryUITabsID].sprShadow = CreateSprite(0)
	SetSpriteSize(OryUITabsCollection[oryUITabsID].sprShadow, 100, 1)
	SetSpriteDepth(OryUITabsCollection[oryUITabsID].sprShadow, GetSpriteDepth(OryUITabsCollection[oryUITabsID].sprContainer))
	SetSpriteImage(OryUITabsCollection[oryUITabsID].sprShadow, oryUITopBarShadowImage)
	SetSpriteOffset(OryUITabsCollection[oryUITabsID].sprShadow, 0, 0)
	SetSpritePositionByOffset(OryUITabsCollection[oryUITabsID].sprShadow, GetSpriteX(OryUITabsCollection[oryUITabsID].sprContainer), GetSpriteY(OryUITabsCollection[oryUITabsID].sprContainer) + GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprContainer))

	if (oryUIComponentParameters$ <> "") then OryUIUpdateTabs(oryUITabsID, oryUIComponentParameters$)
endfunction oryUITabsID

function OryUIDeleteTabs(oryUITabsID as integer)
	DeleteSprite(OryUITabsCollection[oryUITabsID].sprActiveIndicator)
	DeleteSprite(OryUITabsCollection[oryUITabsID].sprContainer)
	DeleteSprite(OryUITabsCollection[oryUITabsID].sprShadow)
	while (OryUITabsCollection[oryUITabsID].buttons.length > 0)
		OryUIDeleteTabsButton(oryUITabsID, 0)
	endwhile
endfunction

function OryUIDeleteTabsButton(oryUITabsID as integer, oryUIButtonID as integer)
	DeleteSprite(OryUITabsCollection[oryUITabsID].buttons[oryUIButtonID].sprIcon)
	DeleteText(OryUITabsCollection[oryUITabsID].buttons[oryUIButtonID].txtLabel)
endfunction

function OryUIGetTabsButtonCount(oryUITabsID as integer)
	local oryUITabsButtonCount
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

function OryUIGetTabsButtonReleasedText(oryUITabsID as integer)
	local oryUITabsButtonText$ as string
	if (OryUITabsCollection[oryUITabsID].buttonReleased > -1)
		oryUITabsButtonText$ = OryUITabsCollection[oryUITabsID].buttons[OryUITabsCollection[oryUITabsID].buttonReleased].label$
	endif
endfunction oryUITabsButtonText$

function OryUIGetTabsHeight(oryUITabsID as integer)
	local oryUITabsHeight#
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

	if (oryUIComponentParameters$ <> "") then OryUIUpdateTabsButton(oryUITabsID, oryUITabsButtonID, oryUIComponentParameters$)
endfunction

function OryUIInsertTabsListener(oryUITabsID as integer)
	local oryUITabsButtonReleased as integer
	local oryUITabsButtonSprite as integer

	OryUITabsCollection[oryUITabsID].buttonReleased = -1
	if (GetSpriteExists(OryUITabsCollection[oryUITabsID].sprContainer))
		SetSpriteX(OryUITabsCollection[oryUITabsID].sprContainer, OryUITabsCollection[oryUITabsID].minPosition#[1])
		if (GetViewOffsetY() > OryUITabsCollection[oryUITabsID].originalPosition#[2] - OryUITabsCollection[oryUITabsID].minPosition#[2])
			SetSpriteY(OryUITabsCollection[oryUITabsID].sprContainer, GetViewOffsetY() + OryUITabsCollection[oryUITabsID].minPosition#[2])
			SetSpriteY(OryUITabsCollection[oryUITabsID].sprShadow, GetViewOffsetY() + OryUITabsCollection[oryUITabsID].minPosition#[2] + GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprContainer))
		else
			SetSpriteY(OryUITabsCollection[oryUITabsID].sprContainer, OryUITabsCollection[oryUITabsID].originalPosition#[2])
			SetSpriteY(OryUITabsCollection[oryUITabsID].sprShadow, GetViewOffsetY() + OryUITabsCollection[oryUITabsID].originalPosition#[2] + GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprContainer))
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
					if (GetPointerPressed())
						oryUITabsButtonSprite = GetSpriteHitTest(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						if (oryUITabsButtonSprite = 1)
							OryUITabsCollection[oryUITabsID].buttons[oryUIForI].pressed = 1
						endif
					else
						if (GetPointerState())
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
						endif
					endif
				endif
			endif
		next
	endif

	OryUIUpdateTabs(oryUITabsID, "")
endfunction

function OryUIPositionButtonsInTabs(oryUITabsID as integer)
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
	local oryUIOldTabsButtonCount
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

function OryUIUpdateTabs(oryUITabsID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUITabsCollection[oryUITabsID].sprContainer))

		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
		if (OryUIParameters.size#[1] > -999999)
			SetSpriteSize(OryUITabsCollection[oryUITabsID].sprContainer, OryUIParameters.size#[1], GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprContainer))
			SetSpriteSize(OryUITabsCollection[oryUITabsID].sprShadow, OryUIParameters.size#[1], GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprShadow))
		endif
		if (OryUIParameters.position#[1] > -999999 and OryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUITabsCollection[oryUITabsID].sprContainer, OryUIParameters.position#[1], OryUIParameters.position#[2])
			OryUITabsCollection[oryUITabsID].originalPosition#[1] = OryUIParameters.position#[1]
			OryUITabsCollection[oryUITabsID].originalPosition#[2] = OryUIParameters.position#[2]
		elseif (OryUIParameters.position#[1] > -999999 and OryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(OryUITabsCollection[oryUITabsID].sprContainer, OryUIParameters.position#[1], GetSpriteYByOffset(OryUITabsCollection[oryUITabsID].sprContainer))
			OryUITabsCollection[oryUITabsID].originalPosition#[1] = OryUIParameters.position#[1]
		elseif (OryUIParameters.position#[1] = -999999 and OryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUITabsCollection[oryUITabsID].sprContainer, GetSpriteXByOffset(OryUITabsCollection[oryUITabsID].sprContainer), OryUIParameters.position#[2])
			OryUITabsCollection[oryUITabsID].originalPosition#[2] = OryUIParameters.position#[2]
		endif
		SetSpritePositionByOffset(OryUITabsCollection[oryUITabsID].sprShadow, GetSpriteX(OryUITabsCollection[oryUITabsID].sprContainer), GetSpriteY(OryUITabsCollection[oryUITabsID].sprContainer) + GetSpriteHeight(OryUITabsCollection[oryUITabsID].sprContainer))

		// THE REST OF THE PARAMETERS NEXT
		if (OryUIParameters.activeColor#[1] > -999999 or OryUIParameters.activeColor#[2] > -999999 or OryUIParameters.activeColor#[3] > -999999 or OryUIParameters.activeColor#[4] > -999999)
			OryUITabsCollection[oryUITabsID].defaultActiveColor#[1] = OryUIParameters.activeColor#[1]
			OryUITabsCollection[oryUITabsID].defaultActiveColor#[2] = OryUIParameters.activeColor#[2]
			OryUITabsCollection[oryUITabsID].defaultActiveColor#[3] = OryUIParameters.activeColor#[3]
			OryUITabsCollection[oryUITabsID].defaultActiveColor#[4] = OryUIParameters.activeColor#[4]
		endif
		if (OryUIParameters.color#[1] > -999999 or OryUIParameters.color#[2] > -999999 or OryUIParameters.color#[3] > -999999 or OryUIParameters.color#[4] > -999999)
			if (OryUIParameters.color#[1] > -999999) then OryUITabsCollection[oryUITabsID].color#[1] = OryUIParameters.color#[1]
			if (OryUIParameters.color#[2] > -999999) then OryUITabsCollection[oryUITabsID].color#[2] = OryUIParameters.color#[2]
			if (OryUIParameters.color#[3] > -999999) then OryUITabsCollection[oryUITabsID].color#[3] = OryUIParameters.color#[3]
			if (OryUIParameters.color#[4] > -999999) then OryUITabsCollection[oryUITabsID].color#[4] = OryUIParameters.color#[4]
			SetSpriteColor(OryUITabsCollection[oryUITabsID].sprContainer, OryUITabsCollection[oryUITabsID].color#[1], OryUITabsCollection[oryUITabsID].color#[2], OryUITabsCollection[oryUITabsID].color#[3], OryUITabsCollection[oryUITabsID].color#[4])
		endif
		if (OryUIParameters.depth > -999999)
			SetSpriteDepth(OryUITabsCollection[oryUITabsID].sprContainer, OryUIParameters.depth)
		endif
		remstart
		if (OryUIParameters.iconColor#[1] > -999999 or OryUIParameters.iconColor#[2] > -999999 or OryUIParameters.iconColor#[3] > -999999 or OryUIParameters.iconColor#[4] > -999999)
			OryUITabsCollection[oryUITabsID].defaultIconColor#[1] = OryUIParameters.iconColor#[1]
			OryUITabsCollection[oryUITabsID].defaultIconColor#[2] = OryUIParameters.iconColor#[2]
			OryUITabsCollection[oryUITabsID].defaultIconColor#[3] = OryUIParameters.iconColor#[3]
			OryUITabsCollection[oryUITabsID].defaultIconColor#[4] = OryUIParameters.iconColor#[4]
			for oryUIForI = 0 to OryUITabsCollection[oryUITabsID].buttons.length
				SetSpriteColor(OryUITabsCollection[oryUITabsID].buttons[oryUIForI].sprIcon, OryUIParameters.iconColor#[1], OryUIParameters.iconColor#[2], OryUIParameters.iconColor#[3], OryUIParameters.iconColor#[4])
			next
		endif
		remend
		if (OryUIParameters.imageID > -999999)
			SetSpriteImage(OryUITabsCollection[oryUITabsID].sprContainer, OryUIParameters.imageID)
		endif
		if (OryUIParameters.inactiveColor#[1] > -999999 or OryUIParameters.inactiveColor#[2] > -999999 or OryUIParameters.inactiveColor#[3] > -999999 or OryUIParameters.inactiveColor#[4] > -999999)
			OryUITabsCollection[oryUITabsID].defaultInactiveColor#[1] = OryUIParameters.inactiveColor#[1]
			OryUITabsCollection[oryUITabsID].defaultInactiveColor#[2] = OryUIParameters.inactiveColor#[2]
			OryUITabsCollection[oryUITabsID].defaultInactiveColor#[3] = OryUIParameters.inactiveColor#[3]
			OryUITabsCollection[oryUITabsID].defaultInactiveColor#[4] = OryUIParameters.inactiveColor#[4]
		endif
		if (OryUIParameters.minPosition#[1] >- 999999) then OryUITabsCollection[oryUITabsID].minPosition#[1] = OryUIParameters.minPosition#[1]
		if (OryUIParameters.minPosition#[2] >- 999999) then OryUITabsCollection[oryUITabsID].minPosition#[2] = OryUIParameters.minPosition#[2]
		
		remstart
		if (OryUIParameters.navigationIcon$ <> "") then OryUITabsCollection[oryUITabsID].icon$ = lower(OryUIParameters.navigationIcon$)
		if (lower(OryUIParameters.navigationIcon$) = "add") then SetSpriteImage(OryUITabsCollection[oryUITabsID].sprNavigationIcon, oryUIIconAddImage)
		if (lower(OryUIParameters.navigationIcon$) = "back") then SetSpriteImage(OryUITabsCollection[oryUITabsID].sprNavigationIcon, oryUIIconBackImage)
		if (lower(OryUIParameters.navigationIcon$) = "camera") then SetSpriteImage(OryUITabsCollection[oryUITabsID].sprNavigationIcon, oryUIIconCameraImage)
		if (lower(OryUIParameters.navigationIcon$) = "menu") then SetSpriteImage(OryUITabsCollection[oryUITabsID].sprNavigationIcon, oryUIIconMenuImage)
		if (lower(OryUIParameters.navigationIcon$) = "profile") then SetSpriteImage(OryUITabsCollection[oryUITabsID].sprNavigationIcon, oryUIIconProfileImage)
		if (lower(OryUIParameters.navigationIcon$) = "refresh") then SetSpriteImage(OryUITabsCollection[oryUITabsID].sprNavigationIcon, oryUIIconRefreshImage)
		if (lower(OryUIParameters.navigationIcon$) = "save") then SetSpriteImage(OryUITabsCollection[oryUITabsID].sprNavigationIcon, oryUIIconSaveImage)
		if (OryUIParameters.text$ <> "")
			SetTextString(OryUITabsCollection[oryUITabsID].txtTitle, OryUIParameters.text$)
		endif
		remend
		if (OryUIParameters.scrollable > -999999) then OryUITabsCollection[oryUITabsID].scrollable = OryUIParameters.scrollable
	endif

	OryUIPositionButtonsInTabs(oryUITabsID)
endfunction

function OryUIUpdateTabsButton(oryUITabsID as integer, oryUITabsButtonID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprContainer))
		if (OryUIParameters.color#[1] > -999999 or OryUIParameters.color#[2] > -999999 or OryUIParameters.color#[3] > -999999 or OryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprContainer, OryUIParameters.color#[1], OryUIParameters.color#[2], OryUIParameters.color#[3], OryUIParameters.color#[4])
		endif
		if (OryUIParameters.text$ <> "")
			SetTextString(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].txtLabel, upper(OryUIParameters.text$))
		endif
		remstart
		if (OryUIParameters.icon$ <> "") then OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].icon$ = lower(OryUIParameters.icon$)
		if (lower(OryUIParameters.icon$) = "add") then SetSpriteImage(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprIcon, oryUIIconAddImage)
		if (lower(OryUIParameters.icon$) = "back") then SetSpriteImage(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprIcon, oryUIIconBackImage)
		if (lower(OryUIParameters.icon$) = "camera") then SetSpriteImage(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprIcon, oryUIIconCameraImage)
		if (lower(OryUIParameters.icon$) = "menu") then SetSpriteImage(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprIcon, oryUIIconMenuImage)
		if (lower(OryUIParameters.icon$) = "profile") then SetSpriteImage(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprIcon, oryUIIconProfileImage)
		if (lower(OryUIParameters.icon$) = "refresh") then SetSpriteImage(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprIcon, oryUIIconRefreshImage)
		if (lower(OryUIParameters.icon$) = "save") then SetSpriteImage(OryUITabsCollection[oryUITabsID].buttons[oryUITabsButtonID].sprIcon, oryUIIconSaveImage)
		remend
	endif

	OryUIPositionButtonsInTabs(oryUITabsID)
endfunction


foldend
