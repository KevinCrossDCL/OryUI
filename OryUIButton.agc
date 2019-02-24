
foldstart // OryUIButton Component (Updated 23/02/2019)

type typeOryUIButton
	id as integer
	pressed as integer
	sprContainer as integer
	txtLabel as integer
endtype

global OryUIButtonCollection as typeOryUIButton[]
OryUIButtonCollection.length = 1

function OryUICreateButton(oryUIComponentParameters$ as string)
	local oryUIButtonID as integer
	OryUIButtonCollection.length = OryUIButtonCollection.length + 1
	oryUIButtonID = OryUIButtonCollection.length
	OryUIButtonCollection[oryUIButtonID].id = oryUIButtonID

	OryUIButtonCollection[oryUIButtonID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUIButtonCollection[oryUIButtonID].sprContainer, 30, 5)
	SetSpriteColor(OryUIButtonCollection[oryUIButtonID].sprContainer, 255, 255, 255, 255)
	SetSpriteOffset(OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)

	OryUIButtonCollection[oryUIButtonID].txtLabel = CreateText("Button")
	SetTextSize(OryUIButtonCollection[oryUIButtonID].txtLabel, 3)
	SetTextColor(OryUIButtonCollection[oryUIButtonID].txtLabel, 0, 0, 0, 255)
	SetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel, 1)
	SetTextDepth(OryUIButtonCollection[oryUIButtonID].txtLabel, GetSpriteDepth(OryUIButtonCollection[oryUIButtonID].sprContainer) - 1)
	OryUIPinTextToCentreOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)

	if (oryUIComponentParameters$ <> "") then OryUIUpdateButton(oryUIButtonID, oryUIComponentParameters$)
endfunction oryUIButtonID

function OryUIDeleteButton(oryUIButtonID as integer)
	DeleteSprite(OryUIButtonCollection[oryUIButtonID].sprContainer)
	DeleteText(OryUIButtonCollection[oryUIButtonID].txtLabel)
endfunction

function OryUIGetButtonHeight(oryUIButtonID as integer)
	local oryUIButtonHeight#
	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		oryUIButtonHeight# = GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprContainer)
	endif
endfunction oryUIButtonHeight#

function OryUIGetButtonPressed(oryUIButtonID as integer)
	local oryUIButtonPressed as integer
	local oryUIButtonSprite as integer
	local oryUIButtonText as integer
	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		if (OryUIGetSwipingVertically() = 0)
			if (GetPointerPressed())
				oryUIButtonSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIButtonText = GetTextHitTest(OryUIButtonCollection[oryUIButtonID].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				if (oryUIButtonSprite = 1 or oryUIButtonText = 1)
					OryUIButtonCollection[oryUIButtonID].pressed = 1
				else
					OryUIButtonCollection[oryUIButtonID].pressed = 0
				endif
			elseif (OryUIButtonCollection[oryUIButtonID].pressed = 1)
				if (GetPointerState())
					oryUIButtonSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIButtonText = GetTextHitTest(OryUIButtonCollection[oryUIButtonID].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (oryUIButtonSprite = 1 or oryUIButtonText = 1)
						OryUIButtonCollection[oryUIButtonID].pressed = 1
					else
						OryUIButtonCollection[oryUIButtonID].pressed = 0
					endif
				endif
			endif
		endif
		oryUIButtonPressed = OryUIButtonCollection[oryUIButtonID].pressed					
	endif
endfunction oryUIButtonPressed

function OryUIGetButtonReleased(oryUIButtonID as integer)
	local oryUIButtonReleased as integer
	local oryUIButtonSprite as integer
	local oryUIButtonText as integer
	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		if (OryUIGetSwipingVertically() = 0)
			if (GetPointerPressed())
				oryUIButtonSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIButtonText = GetTextHitTest(OryUIButtonCollection[oryUIButtonID].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				if (oryUIButtonSprite = 1 or oryUIButtonText = 1)
					OryUIButtonCollection[oryUIButtonID].pressed = 1
				endif
			else
				if (GetPointerState())
					oryUIButtonSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIButtonText = GetTextHitTest(OryUIButtonCollection[oryUIButtonID].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (OryUIButtonCollection[oryUIButtonID].pressed)
						if (oryUIButtonSprite = 0 and oryUIButtonText = 0)
							OryUIButtonCollection[oryUIButtonID].pressed = 0
						endif
					endif
				endif
				if (GetPointerReleased())
					oryUIButtonSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIButtonText = GetTextHitTest(OryUIButtonCollection[oryUIButtonID].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (OryUIButtonCollection[oryUIButtonID].pressed)
						if (oryUIButtonSprite = 1 or oryUIButtonText = 1)
							oryUIButtonReleased = 1
						else
							oryUIButtonReleased = 0
						endif
					endif
					OryUIButtonCollection[oryUIButtonID].pressed = 0
				endif
			endif
		endif
	endif
endfunction oryUIButtonReleased

function OryUIGetButtonWidth(oryUIButtonID as integer)
	local oryUIButtonWidth#
	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		oryUIButtonWidth# = GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprContainer)
	endif
endfunction oryUIButtonWidth#

function OryUIUpdateButton(oryUIButtonID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		
		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
		if (OryUIParameters.size#[1] > -999999 and OryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIParameters.size#[1], OryUIParameters.size#[2])
		elseif (OryUIParameters.size#[1] > -999999 and OryUIParameters.size#[2] = -999999)
			SetSpriteSize(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIParameters.size#[1], GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprContainer))
		elseif (OryUIParameters.size#[1] = -999999 and OryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIButtonCollection[oryUIButtonID].sprContainer, GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprContainer), OryUIParameters.size#[2])
		endif
		if (OryUIParameters.text$ <> "")
			SetTextString(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIParameters.text$)
		endif
		if (OryUIParameters.textAlignment = 0)
			OryUIPinTextToCentreLeftOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprContainer, 2, 0)
		elseif (OryUIParameters.textAlignment = 1)
			OryUIPinTextToCentreOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)
		elseif (OryUIParameters.textAlignment = 2)
			OryUIPinTextToCentreRightOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprContainer, 2, 0)
		endif
		if (OryUIParameters.textBold > -999999)
			SetTextBold(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIParameters.textBold)
		endif
		if (OryUIParameters.textSize# > -999999)
			SetTextSize(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIParameters.textSize#)
		endif
		if (OryUIParameters.offsetCenter = 1)
			SetSpriteOffset(OryUIButtonCollection[oryUIButtonID].sprContainer, GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprContainer) / 2, GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprContainer) / 2)
		else
			if (OryUIParameters.offset#[1] > -999999 or OryUIParameters.offset#[2] > -999999)
				SetSpriteOffset(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIParameters.offset#[1], OryUIParameters.offset#[2])
			endif
		endif
		if (OryUIParameters.position#[1] > -999999 and OryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIParameters.position#[1], OryUIParameters.position#[2])
			OryUIPinTextToCentreOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)
		elseif (OryUIParameters.position#[1] > -999999 and OryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIParameters.position#[1], GetSpriteYByOffset(OryUIButtonCollection[oryUIButtonID].sprContainer))
			OryUIPinTextToCentreOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)
		elseif (OryUIParameters.position#[1] = -999999 and OryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUIButtonCollection[oryUIButtonID].sprContainer, GetSpriteXByOffset(OryUIButtonCollection[oryUIButtonID].sprContainer), OryUIParameters.position#[2])
			OryUIPinTextToCentreOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)
		endif

		// THE REST OF THE PARAMETERS NEXT
		if (OryUIParameters.color#[1] > -999999 or OryUIParameters.color#[2] > -999999 or OryUIParameters.color#[3] > -999999 or OryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIParameters.color#[1], OryUIParameters.color#[2], OryUIParameters.color#[3], OryUIParameters.color#[4])
		endif
		if (OryUIParameters.depth > -999999)
			SetSpriteDepth(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIParameters.depth)
			SetTextDepth(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIParameters.depth - 1)
		endif
		if (OryUIParameters.fixToScreen = 1)
			FixSpriteToScreen(OryUIButtonCollection[oryUIButtonID].sprContainer, 1)
		endif
		if (OryUIParameters.imageID > -999999)
			SetSpriteImage(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIParameters.imageID)
		endif
		if (OryUIParameters.textColor#[1] > -999999 or OryUIParameters.textColor#[2] > -999999 or OryUIParameters.textColor#[3] > -999999 or OryUIParameters.textColor#[4] > -999999)
			SetTextColor(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIParameters.textColor#[1], OryUIParameters.textColor#[2], OryUIParameters.textColor#[3], OryUIParameters.textColor#[4])
		endif
	endif
endfunction

foldend
