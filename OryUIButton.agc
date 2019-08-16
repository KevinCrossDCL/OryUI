
foldstart // OryUIButton Component (Updated 16/08/2019)

type typeOryUIButton
	id as integer
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
	held as integer
	icon$ as string
	iconPlacement$ as string
	pressed as integer
	released as integer
	sprContainer as integer
	sprIcon as integer
	timePressed# as float
	txtLabel as integer
endtype

global OryUIButtonCollection as typeOryUIButton[]
OryUIButtonCollection.length = 1

function OryUIButtonListener(oryUIButtonID as integer)
	local oryUIButtonIconSprite as integer
	local oryUIButtonSprite as integer
	local oryUIButtonText as integer
	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		oryUIButtonIconSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
		oryUIButtonSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
		oryUIButtonText = GetTextHitTest(OryUIButtonCollection[oryUIButtonID].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
		OryUIButtonCollection[oryUIButtonID].released = 0
		if (GetPointerPressed())
			OryUIButtonCollection[oryUIButtonID].held = 0
			OryUIButtonCollection[oryUIButtonID].pressed = 0
			if (oryUIButtonIconSprite = 1 or oryUIButtonSprite = 1 or oryUIButtonText = 1)
				OryUIButtonCollection[oryUIButtonID].pressed = 1
				OryUIButtonCollection[oryUIButtonID].timePressed# = timer()
			endif	
		elseif (OryUIButtonCollection[oryUIButtonID].pressed = 1)
			if (GetPointerState())
				if (timer() - OryUIButtonCollection[oryUIButtonID].timePressed# >= 0.4 and (oryUIButtonIconSprite = 1 or oryUIButtonSprite = 1 or oryUIButtonText = 1))
					OryUIButtonCollection[oryUIButtonID].held = 1
				endif
			endif
			if (GetPointerReleased())
				OryUIButtonCollection[oryUIButtonID].held = 0
				if (oryUIButtonIconSprite = 1 or oryUIButtonSprite = 1 or oryUIButtonText = 1)
					OryUIButtonCollection[oryUIButtonID].released = 1
				else
					OryUIButtonCollection[oryUIButtonID].released = 0
				endif
			endif
		endif
	endif
	
	if (OryUIButtonCollection[oryUIButtonID].enabled = 0 or oryUIScrimVisible = 1)
		OryUIButtonCollection[oryUIButtonID].pressed = 0
		OryUIButtonCollection[oryUIButtonID].held = 0
		OryUIButtonCollection[oryUIButtonID].released = 0
	endif
endfunction

function OryUICreateButton(oryUIComponentParameters$ as string)
	local oryUIButtonID as integer
	OryUIButtonCollection.length = OryUIButtonCollection.length + 1
	oryUIButtonID = OryUIButtonCollection.length
	OryUIButtonCollection[oryUIButtonID].id = oryUIButtonID
	
	// DEFAULT SETTINGS
	OryUIButtonCollection[oryUIButtonID].disabledColor#[1] = oryUIDefaults.buttonDisabledColor#[1]
	OryUIButtonCollection[oryUIButtonID].disabledColor#[2] = oryUIDefaults.buttonDisabledColor#[2]
	OryUIButtonCollection[oryUIButtonID].disabledColor#[3] = oryUIDefaults.buttonDisabledColor#[3]
	OryUIButtonCollection[oryUIButtonID].disabledColor#[4] = oryUIDefaults.buttonDisabledColor#[4]
	OryUIButtonCollection[oryUIButtonID].disabledIconColor#[1] = oryUIDefaults.buttonDisabledIconColor#[1]
	OryUIButtonCollection[oryUIButtonID].disabledIconColor#[2] = oryUIDefaults.buttonDisabledIconColor#[2]
	OryUIButtonCollection[oryUIButtonID].disabledIconColor#[3] = oryUIDefaults.buttonDisabledIconColor#[3]
	OryUIButtonCollection[oryUIButtonID].disabledIconColor#[4] = oryUIDefaults.buttonDisabledIconColor#[4]
	OryUIButtonCollection[oryUIButtonID].disabledIconSize#[1] = oryUIDefaults.buttonDisabledIconSize#[1]
	OryUIButtonCollection[oryUIButtonID].disabledIconSize#[2] = oryUIDefaults.buttonDisabledIconSize#[2]
	OryUIButtonCollection[oryUIButtonID].disabledTextAlignment = oryUIDefaults.buttonDisabledTextAlignment
	OryUIButtonCollection[oryUIButtonID].disabledTextBold = oryUIDefaults.buttonDisabledTextBold
	OryUIButtonCollection[oryUIButtonID].disabledTextColor#[1] = oryUIDefaults.buttonDisabledTextColor#[1]
	OryUIButtonCollection[oryUIButtonID].disabledTextColor#[2] = oryUIDefaults.buttonDisabledTextColor#[2]
	OryUIButtonCollection[oryUIButtonID].disabledTextColor#[3] = oryUIDefaults.buttonDisabledTextColor#[3]
	OryUIButtonCollection[oryUIButtonID].disabledTextColor#[4] = oryUIDefaults.buttonDisabledTextColor#[4]
	OryUIButtonCollection[oryUIButtonID].disabledTextSize# = oryUIDefaults.buttonDisabledTextSize#
	OryUIButtonCollection[oryUIButtonID].enabled = 1
	OryUIButtonCollection[oryUIButtonID].enabledColor#[1] = oryUIDefaults.buttonEnabledColor#[1]
	OryUIButtonCollection[oryUIButtonID].enabledColor#[2] = oryUIDefaults.buttonEnabledColor#[2]
	OryUIButtonCollection[oryUIButtonID].enabledColor#[3] = oryUIDefaults.buttonEnabledColor#[3]
	OryUIButtonCollection[oryUIButtonID].enabledColor#[4] = oryUIDefaults.buttonEnabledColor#[4]
	OryUIButtonCollection[oryUIButtonID].enabledIconColor#[1] = oryUIDefaults.buttonEnabledIconColor#[1]
	OryUIButtonCollection[oryUIButtonID].enabledIconColor#[2] = oryUIDefaults.buttonEnabledIconColor#[2]
	OryUIButtonCollection[oryUIButtonID].enabledIconColor#[3] = oryUIDefaults.buttonEnabledIconColor#[3]
	OryUIButtonCollection[oryUIButtonID].enabledIconColor#[4] = oryUIDefaults.buttonEnabledIconColor#[4]
	OryUIButtonCollection[oryUIButtonID].enabledIconSize#[1] = oryUIDefaults.buttonEnabledIconSize#[1]
	OryUIButtonCollection[oryUIButtonID].enabledIconSize#[2] = oryUIDefaults.buttonEnabledIconSize#[2]
	OryUIButtonCollection[oryUIButtonID].enabledTextAlignment = oryUIDefaults.buttonEnabledTextAlignment
	OryUIButtonCollection[oryUIButtonID].enabledTextBold = oryUIDefaults.buttonEnabledTextBold
	OryUIButtonCollection[oryUIButtonID].enabledTextColor#[1] = oryUIDefaults.buttonEnabledTextColor#[1]
	OryUIButtonCollection[oryUIButtonID].enabledTextColor#[2] = oryUIDefaults.buttonEnabledTextColor#[2]
	OryUIButtonCollection[oryUIButtonID].enabledTextColor#[3] = oryUIDefaults.buttonEnabledTextColor#[3]
	OryUIButtonCollection[oryUIButtonID].enabledTextColor#[4] = oryUIDefaults.buttonEnabledTextColor#[4]
	OryUIButtonCollection[oryUIButtonID].enabledTextSize# = oryUIDefaults.buttonEnabledTextSize#
	
	OryUIButtonCollection[oryUIButtonID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUIButtonCollection[oryUIButtonID].sprContainer, oryUIDefaults.buttonSize#[1], oryUIDefaults.buttonSize#[2])
	SetSpriteColor(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIButtonCollection[oryUIButtonID].enabledColor#[1], OryUIButtonCollection[oryUIButtonID].enabledColor#[2], OryUIButtonCollection[oryUIButtonID].enabledColor#[3], OryUIButtonCollection[oryUIButtonID].enabledColor#[4])
	SetSpriteOffset(OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)
	
	OryUIButtonCollection[oryUIButtonID].enabledIcon$ = ""
	OryUIButtonCollection[oryUIButtonID].icon$ = ""
	OryUIButtonCollection[oryUIButtonID].sprIcon = CreateSprite(0)
	SetSpriteSize(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].enabledIconSize#[1], OryUIButtonCollection[oryUIButtonID].enabledIconSize#[2])
	SetSpriteColor(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].enabledIconColor#[1], OryUIButtonCollection[oryUIButtonID].enabledIconColor#[2], OryUIButtonCollection[oryUIButtonID].enabledIconColor#[3], OryUIButtonCollection[oryUIButtonID].enabledIconColor#[4])
	SetSpriteDepth(OryUIButtonCollection[oryUIButtonID].sprIcon, GetSpriteDepth(OryUIButtonCollection[oryUIButtonID].sprContainer) - 1)
	SetSpriteOffset(OryUIButtonCollection[oryUIButtonID].sprIcon, GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprIcon) / 2, GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprIcon) / 2)
	OryUIPinSpriteToCentreOfSprite(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)

	OryUIButtonCollection[oryUIButtonID].txtLabel = CreateText("")
	SetTextSize(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].enabledTextSize#)
	SetTextColor(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].enabledTextColor#[1], OryUIButtonCollection[oryUIButtonID].enabledTextColor#[2], OryUIButtonCollection[oryUIButtonID].enabledTextColor#[3], OryUIButtonCollection[oryUIButtonID].enabledTextColor#[4])
	SetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel, 1)
	SetTextDepth(OryUIButtonCollection[oryUIButtonID].txtLabel, GetSpriteDepth(OryUIButtonCollection[oryUIButtonID].sprContainer) - 1)
	OryUIPinTextToCentreOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)

	if (oryUIComponentParameters$ <> "") then OryUIUpdateButton(oryUIButtonID, oryUIComponentParameters$)
endfunction oryUIButtonID

function OryUIDeleteButton(oryUIButtonID as integer)
	DeleteSprite(OryUIButtonCollection[oryUIButtonID].sprContainer)
	DeleteSprite(OryUIButtonCollection[oryUIButtonID].sprIcon)
	DeleteText(OryUIButtonCollection[oryUIButtonID].txtLabel)
endfunction

function OryUIDisableButton(oryUIButtonID as integer)
	if (OryUIButtonCollection[oryUIButtonID].enabled = 1)
		OryUIButtonCollection[oryUIButtonID].enabled = 0
		OryUIUpdateButton(oryUIButtonID, "enabled:false")
	endif
endfunction

function OryUIEnableButton(oryUIButtonID as integer)
	if (OryUIButtonCollection[oryUIButtonID].enabled = 0)
		OryUIButtonCollection[oryUIButtonID].enabled = 1
		OryUIUpdateButton(oryUIButtonID, "enabled:true")
	endif
endfunction

function OryUIGetButtonHeight(oryUIButtonID as integer)
	local oryUIButtonHeight#
	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		oryUIButtonHeight# = GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprContainer)
	endif
endfunction oryUIButtonHeight#

function OryUIGetButtonHeld(oryUIButtonID as integer)
	OryUIButtonListener(oryUIButtonID)
	remstart
	local oryUIButtonIconSprite as integer
	local oryUIButtonHeld as integer
	local oryUIButtonSprite as integer
	local oryUIButtonText as integer
	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		if (OryUIGetSwipingVertically() = 0)
			if (GetPointerPressed())
				oryUIButtonIconSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIButtonSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIButtonText = GetTextHitTest(OryUIButtonCollection[oryUIButtonID].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				OryUIButtonCollection[oryUIButtonID].held = 0
				OryUIButtonCollection[oryUIButtonID].pressed = 0
				if (oryUIButtonIconSprite = 1 or oryUIButtonSprite = 1 or oryUIButtonText = 1)
					OryUIButtonCollection[oryUIButtonID].pressed = 1
					OryUIButtonCollection[oryUIButtonID].timePressed# = timer()
				endif
			elseif (OryUIButtonCollection[oryUIButtonID].pressed = 1)
				if (GetPointerState())
					oryUIButtonIconSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIButtonSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIButtonText = GetTextHitTest(OryUIButtonCollection[oryUIButtonID].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (oryUIButtonIconSprite = 1 or oryUIButtonSprite = 1 or oryUIButtonText = 1)
						if (timer() - OryUIButtonCollection[oryUIButtonID].timePressed# >= 0.4)
							OryUIButtonCollection[oryUIButtonID].held = 1
						endif
					else
						OryUIButtonCollection[oryUIButtonID].pressed = 0
						OryUIButtonCollection[oryUIButtonID].held = 0
					endif
				endif
			endif
		endif
		oryUIButtonHeld = OryUIButtonCollection[oryUIButtonID].held			
	endif
	
	if (oryUIScrimVisible = 1) then oryUIButtonHeld = 0
	remend
endfunction OryUIButtonCollection[oryUIButtonID].held

function OryUIGetButtonPressed(oryUIButtonID as integer)
	OryUIButtonListener(oryUIButtonID)
	remstart
	local oryUIButtonIconSprite as integer
	local oryUIButtonPressed as integer
	local oryUIButtonSprite as integer
	local oryUIButtonText as integer
	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		if (OryUIGetSwipingVertically() = 0)
			if (GetPointerPressed())
				oryUIButtonIconSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIButtonSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIButtonText = GetTextHitTest(OryUIButtonCollection[oryUIButtonID].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				if (oryUIButtonIconSprite = 1 or oryUIButtonSprite = 1 or oryUIButtonText = 1)
					OryUIButtonCollection[oryUIButtonID].pressed = 1
				else
					OryUIButtonCollection[oryUIButtonID].pressed = 0
				endif
			elseif (OryUIButtonCollection[oryUIButtonID].pressed = 1)
				if (GetPointerState())
					oryUIButtonIconSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIButtonSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIButtonText = GetTextHitTest(OryUIButtonCollection[oryUIButtonID].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (oryUIButtonIconSprite = 1 or oryUIButtonSprite = 1 or oryUIButtonText = 1)
						OryUIButtonCollection[oryUIButtonID].pressed = 1
					else
						OryUIButtonCollection[oryUIButtonID].pressed = 0
					endif
				endif
			endif
		endif
		oryUIButtonPressed = OryUIButtonCollection[oryUIButtonID].pressed					
	endif
	
	if (oryUIScrimVisible = 1) then oryUIButtonPressed = 0
	remend
endfunction OryUIButtonCollection[oryUIButtonID].pressed

function OryUIGetButtonReleased(oryUIButtonID as integer)
	OryUIButtonListener(oryUIButtonID)
	remstart
	local oryUIButtonIconSprite as integer
	local oryUIButtonReleased as integer
	local oryUIButtonSprite as integer
	local oryUIButtonText as integer
	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		if (OryUIGetSwipingVertically() = 0)
			if (GetPointerPressed())
				oryUIButtonIconSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIButtonSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIButtonText = GetTextHitTest(OryUIButtonCollection[oryUIButtonID].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				if (oryUIButtonIconSprite = 1 or oryUIButtonSprite = 1 or oryUIButtonText = 1)
					OryUIButtonCollection[oryUIButtonID].pressed = 1
				endif
			else
				if (GetPointerState())
					oryUIButtonIconSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIButtonSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIButtonText = GetTextHitTest(OryUIButtonCollection[oryUIButtonID].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (OryUIButtonCollection[oryUIButtonID].pressed)
						if (oryUIButtonIconSprite = 0 and oryUIButtonSprite = 0 and oryUIButtonText = 0)
							OryUIButtonCollection[oryUIButtonID].pressed = 0
						endif
					endif
				endif
				if (GetPointerReleased())
					oryUIButtonIconSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIButtonSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIButtonText = GetTextHitTest(OryUIButtonCollection[oryUIButtonID].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (OryUIButtonCollection[oryUIButtonID].pressed)
						if (oryUIButtonIconSprite = 1 or oryUIButtonSprite = 1 or oryUIButtonText = 1)
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
	
	if (oryUIScrimVisible = 1) then oryUIButtonReleased = 0
	remend
endfunction OryUIButtonCollection[oryUIButtonID].released

function OryUIGetButtonWidth(oryUIButtonID as integer)
	local oryUIButtonWidth#
	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		oryUIButtonWidth# = GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprContainer)
	endif
endfunction oryUIButtonWidth#

function OryUIGetButtonX(oryUIButtonID as integer)
	local oryUIButtonX#
	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		oryUIButtonX# = GetSpriteX(OryUIButtonCollection[oryUIButtonID].sprContainer)
	endif
endfunction oryUIButtonX#

function OryUIGetButtonY(oryUIButtonID as integer)
	local oryUIButtonY#
	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		oryUIButtonY# = GetSpriteY(OryUIButtonCollection[oryUIButtonID].sprContainer)
	endif
endfunction oryUIButtonY#

function OryUIUpdateButton(oryUIButtonID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		
		// PARAMETERS FOR SINGLE STATE
		if (OryUIParameters.color#[1] > -999999 or OryUIParameters.color#[2] > -999999 or OryUIParameters.color#[3] > -999999 or OryUIParameters.color#[4] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledColor#[1] = OryUIParameters.color#[1]
			OryUIButtonCollection[oryUIButtonID].disabledColor#[2] = OryUIParameters.color#[2]
			OryUIButtonCollection[oryUIButtonID].disabledColor#[3] = OryUIParameters.color#[3]
			OryUIButtonCollection[oryUIButtonID].disabledColor#[4] = OryUIParameters.color#[4]
			OryUIButtonCollection[oryUIButtonID].enabledColor#[1] = OryUIParameters.color#[1]
			OryUIButtonCollection[oryUIButtonID].enabledColor#[2] = OryUIParameters.color#[2]
			OryUIButtonCollection[oryUIButtonID].enabledColor#[3] = OryUIParameters.color#[3]
			OryUIButtonCollection[oryUIButtonID].enabledColor#[4] = OryUIParameters.color#[4]
		endif
		if (OryUIParameters.enabled > -999999)
			OryUIButtonCollection[oryUIButtonID].enabled = OryUIParameters.enabled
		endif
		if (OryUIParameters.icon$ <> "" and OryUIParameters.iconID > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIcon$ = OryUIParameters.icon$
			OryUIButtonCollection[oryUIButtonID].disabledIconID = OryUIParameters.iconID
			OryUIButtonCollection[oryUIButtonID].enabledIcon$ = OryUIParameters.icon$
			OryUIButtonCollection[oryUIButtonID].enabledIconID = OryUIParameters.iconID
		elseif (OryUIParameters.iconID > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIcon$ = "custom"
			OryUIButtonCollection[oryUIButtonID].disabledIconID = OryUIParameters.iconID
			OryUIButtonCollection[oryUIButtonID].enabledIcon$ = "custom"
			OryUIButtonCollection[oryUIButtonID].enabledIconID = OryUIParameters.iconID
		endif
		if (OryUIParameters.iconColor#[1] > -999999 or OryUIParameters.iconColor#[2] > -999999 or OryUIParameters.iconColor#[3] > -999999 or OryUIParameters.iconColor#[4] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIconColor#[1] = OryUIParameters.iconColor#[1]
			OryUIButtonCollection[oryUIButtonID].disabledIconColor#[2] = OryUIParameters.iconColor#[2]
			OryUIButtonCollection[oryUIButtonID].disabledIconColor#[3] = OryUIParameters.iconColor#[3]
			OryUIButtonCollection[oryUIButtonID].disabledIconColor#[4] = OryUIParameters.iconColor#[4]
			OryUIButtonCollection[oryUIButtonID].enabledIconColor#[1] = OryUIParameters.iconColor#[1]
			OryUIButtonCollection[oryUIButtonID].enabledIconColor#[2] = OryUIParameters.iconColor#[2]
			OryUIButtonCollection[oryUIButtonID].enabledIconColor#[3] = OryUIParameters.iconColor#[3]
			OryUIButtonCollection[oryUIButtonID].enabledIconColor#[4] = OryUIParameters.iconColor#[4]
		endif
		if (OryUIParameters.iconPlacement$ <> "")
			OryUIButtonCollection[oryUIButtonID].disabledIconPlacement$ = OryUIParameters.iconPlacement$
			OryUIButtonCollection[oryUIButtonID].enabledIconPlacement$ = OryUIParameters.iconPlacement$
		endif
		if (OryUIParameters.iconSize#[1] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIconSize#[1] = OryUIParameters.iconSize#[1]
			OryUIButtonCollection[oryUIButtonID].enabledIconSize#[1] = OryUIParameters.iconSize#[1]
		endif
		if (OryUIParameters.iconSize#[2] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIconSize#[2] = OryUIParameters.iconSize#[2]
			OryUIButtonCollection[oryUIButtonID].enabledIconSize#[2] = OryUIParameters.iconSize#[2]
		endif
		if (OryUIParameters.imageID > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledImageID = OryUIParameters.imageID
			OryUIButtonCollection[oryUIButtonID].enabledImageID = OryUIParameters.imageID
		endif
		if (OryUIParameters.text$ <> "")
			OryUIButtonCollection[oryUIButtonID].disabledText$ = OryUIParameters.text$
			OryUIButtonCollection[oryUIButtonID].enabledText$ = OryUIParameters.text$
		endif
		if (OryUIParameters.textAlignment > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledTextAlignment = OryUIParameters.textAlignment
			OryUIButtonCollection[oryUIButtonID].enabledTextAlignment = OryUIParameters.textAlignment
		endif
		if (OryUIParameters.textBold > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledTextBold = OryUIParameters.textBold
			OryUIButtonCollection[oryUIButtonID].enabledTextBold = OryUIParameters.textBold
		endif
		if (OryUIParameters.textColor#[1] > -999999 or OryUIParameters.textColor#[2] > -999999 or OryUIParameters.textColor#[3] > -999999 or OryUIParameters.textColor#[4] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledTextColor#[1] = OryUIParameters.textColor#[1]
			OryUIButtonCollection[oryUIButtonID].disabledTextColor#[2] = OryUIParameters.textColor#[2]
			OryUIButtonCollection[oryUIButtonID].disabledTextColor#[3] = OryUIParameters.textColor#[3]
			OryUIButtonCollection[oryUIButtonID].disabledTextColor#[4] = OryUIParameters.textColor#[4]
			OryUIButtonCollection[oryUIButtonID].enabledTextColor#[1] = OryUIParameters.textColor#[1]
			OryUIButtonCollection[oryUIButtonID].enabledTextColor#[2] = OryUIParameters.textColor#[2]
			OryUIButtonCollection[oryUIButtonID].enabledTextColor#[3] = OryUIParameters.textColor#[3]
			OryUIButtonCollection[oryUIButtonID].enabledTextColor#[4] = OryUIParameters.textColor#[4]
		endif
		if (OryUIParameters.textSize# > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledTextSize# = OryUIParameters.textSize#
			OryUIButtonCollection[oryUIButtonID].enabledTextSize# = OryUIParameters.textSize#
		endif
		
		// PARAMETERS FOR DISABLED STATE
		if (OryUIParameters.disabledColor#[1] > -999999 or OryUIParameters.disabledColor#[2] > -999999 or OryUIParameters.disabledColor#[3] > -999999 or OryUIParameters.disabledColor#[4] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledColor#[1] = OryUIParameters.disabledColor#[1]
			OryUIButtonCollection[oryUIButtonID].disabledColor#[2] = OryUIParameters.disabledColor#[2]
			OryUIButtonCollection[oryUIButtonID].disabledColor#[3] = OryUIParameters.disabledColor#[3]
			OryUIButtonCollection[oryUIButtonID].disabledColor#[4] = OryUIParameters.disabledColor#[4]
		endif
		if (OryUIParameters.disabledIconColor#[1] > -999999 or OryUIParameters.disabledIconColor#[2] > -999999 or OryUIParameters.disabledIconColor#[3] > -999999 or OryUIParameters.disabledIconColor#[4] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIconColor#[1] = OryUIParameters.disabledIconColor#[1]
			OryUIButtonCollection[oryUIButtonID].disabledIconColor#[2] = OryUIParameters.disabledIconColor#[2]
			OryUIButtonCollection[oryUIButtonID].disabledIconColor#[3] = OryUIParameters.disabledIconColor#[3]
			OryUIButtonCollection[oryUIButtonID].disabledIconColor#[4] = OryUIParameters.disabledIconColor#[4]
		endif
		if (OryUIParameters.disabledIcon$ <> "" and OryUIParameters.disabledIconID > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIcon$ = OryUIParameters.disabledIcon$
			OryUIButtonCollection[oryUIButtonID].disabledIconID = OryUIParameters.disabledIconID
		elseif (OryUIParameters.disabledIconID > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIcon$ = "custom"
			OryUIButtonCollection[oryUIButtonID].disabledIconID = OryUIParameters.disabledIconID
		endif
		if (OryUIParameters.disabledIconPlacement$ <> "")
			OryUIButtonCollection[oryUIButtonID].disabledIconPlacement$ = OryUIParameters.disabledIconPlacement$
		endif
		if (OryUIParameters.disabledIconSize#[1] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIconSize#[1] = OryUIParameters.disabledIconSize#[1]
		endif
		if (OryUIParameters.disabledIconSize#[2] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIconSize#[2] = OryUIParameters.disabledIconSize#[2]
		endif
		if (OryUIParameters.disabledImageID > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledImageID = OryUIParameters.disabledImageID
		endif
		if (OryUIParameters.disabledText$ <> "")
			OryUIButtonCollection[oryUIButtonID].disabledText$ = OryUIParameters.disabledText$
		endif
		if (OryUIParameters.disabledTextAlignment > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledTextAlignment = OryUIParameters.disabledTextAlignment
		endif
		if (OryUIParameters.disabledTextBold > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledTextBold = OryUIParameters.disabledTextBold
		endif
		if (OryUIParameters.disabledTextColor#[1] > -999999 or OryUIParameters.disabledTextColor#[2] > -999999 or OryUIParameters.disabledTextColor#[3] > -999999 or OryUIParameters.disabledTextColor#[4] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledTextColor#[1] = OryUIParameters.disabledTextColor#[1]
			OryUIButtonCollection[oryUIButtonID].disabledTextColor#[2] = OryUIParameters.disabledTextColor#[2]
			OryUIButtonCollection[oryUIButtonID].disabledTextColor#[3] = OryUIParameters.disabledTextColor#[3]
			OryUIButtonCollection[oryUIButtonID].disabledTextColor#[4] = OryUIParameters.disabledTextColor#[4]
		endif
		if (OryUIParameters.disabledTextSize# > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledTextSize# = OryUIParameters.disabledTextSize#
		endif
		
		// PARAMETERS FOR ENABLED STATE
		if (OryUIParameters.enabledColor#[1] > -999999 or OryUIParameters.enabledColor#[2] > -999999 or OryUIParameters.enabledColor#[3] > -999999 or OryUIParameters.enabledColor#[4] > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledColor#[1] = OryUIParameters.enabledColor#[1]
			OryUIButtonCollection[oryUIButtonID].enabledColor#[2] = OryUIParameters.enabledColor#[2]
			OryUIButtonCollection[oryUIButtonID].enabledColor#[3] = OryUIParameters.enabledColor#[3]
			OryUIButtonCollection[oryUIButtonID].enabledColor#[4] = OryUIParameters.enabledColor#[4]
		endif
		if (OryUIParameters.enabledIconColor#[1] > -999999 or OryUIParameters.enabledIconColor#[2] > -999999 or OryUIParameters.enabledIconColor#[3] > -999999 or OryUIParameters.enabledIconColor#[4] > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledIconColor#[1] = OryUIParameters.enabledIconColor#[1]
			OryUIButtonCollection[oryUIButtonID].enabledIconColor#[2] = OryUIParameters.enabledIconColor#[2]
			OryUIButtonCollection[oryUIButtonID].enabledIconColor#[3] = OryUIParameters.enabledIconColor#[3]
			OryUIButtonCollection[oryUIButtonID].enabledIconColor#[4] = OryUIParameters.enabledIconColor#[4]
		endif
		if (OryUIParameters.enabledIcon$ <> "" and OryUIParameters.enabledIconID > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledIcon$ = OryUIParameters.enabledIcon$
			OryUIButtonCollection[oryUIButtonID].enabledIconID = OryUIParameters.enabledIconID
		elseif (OryUIParameters.enabledIconID > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledIcon$ = "custom"
			OryUIButtonCollection[oryUIButtonID].enabledIconID = OryUIParameters.enabledIconID
		endif
		if (OryUIParameters.enabledIconPlacement$ <> "")
			OryUIButtonCollection[oryUIButtonID].enabledIconPlacement$ = OryUIParameters.enabledIconPlacement$
		endif
		if (OryUIParameters.enabledIconSize#[1] > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledIconSize#[1] = OryUIParameters.enabledIconSize#[1]
		endif
		if (OryUIParameters.enabledIconSize#[2] > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledIconSize#[2] = OryUIParameters.enabledIconSize#[2]
		endif
		if (OryUIParameters.enabledImageID > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledImageID = OryUIParameters.enabledImageID
		endif
		if (OryUIParameters.enabledText$ <> "")
			OryUIButtonCollection[oryUIButtonID].enabledText$ = OryUIParameters.enabledText$
		endif
		if (OryUIParameters.enabledTextAlignment > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledTextAlignment = OryUIParameters.enabledTextAlignment
		endif
		if (OryUIParameters.enabledTextBold > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledTextBold = OryUIParameters.enabledTextBold
		endif
		if (OryUIParameters.enabledTextColor#[1] > -999999 or OryUIParameters.enabledTextColor#[2] > -999999 or OryUIParameters.enabledTextColor#[3] > -999999 or OryUIParameters.enabledTextColor#[4] > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledTextColor#[1] = OryUIParameters.enabledTextColor#[1]
			OryUIButtonCollection[oryUIButtonID].enabledTextColor#[2] = OryUIParameters.enabledTextColor#[2]
			OryUIButtonCollection[oryUIButtonID].enabledTextColor#[3] = OryUIParameters.enabledTextColor#[3]
			OryUIButtonCollection[oryUIButtonID].enabledTextColor#[4] = OryUIParameters.enabledTextColor#[4]
		endif
		if (OryUIParameters.enabledTextSize# > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledTextSize# = OryUIParameters.enabledTextSize#
		endif
		
		// IMPORTANT PARAMETERS WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
		if (OryUIParameters.size#[1] > -999999 and OryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIParameters.size#[1], OryUIParameters.size#[2])
		elseif (OryUIParameters.size#[1] > -999999 and OryUIParameters.size#[2] = -999999)
			SetSpriteSize(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIParameters.size#[1], GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprContainer))
		elseif (OryUIParameters.size#[1] = -999999 and OryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIButtonCollection[oryUIButtonID].sprContainer, GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprContainer), OryUIParameters.size#[2])
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
		elseif (OryUIParameters.position#[1] > -999999 and OryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIParameters.position#[1], GetSpriteYByOffset(OryUIButtonCollection[oryUIButtonID].sprContainer))
		elseif (OryUIParameters.position#[1] = -999999 and OryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUIButtonCollection[oryUIButtonID].sprContainer, GetSpriteXByOffset(OryUIButtonCollection[oryUIButtonID].sprContainer), OryUIParameters.position#[2])
		endif
		
		// DISABLED STATE
		if (OryUIButtonCollection[oryUIButtonID].enabled = 0)
			SetSpriteColor(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIButtonCollection[oryUIButtonID].disabledColor#[1], OryUIButtonCollection[oryUIButtonID].disabledColor#[2], OryUIButtonCollection[oryUIButtonID].disabledColor#[3], OryUIButtonCollection[oryUIButtonID].disabledColor#[4])
			if (OryUIButtonCollection[oryUIButtonID].disabledImageID > 0) then SetSpriteImage(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIButtonCollection[oryUIButtonID].disabledImageID)
			SetSpriteColor(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].disabledIconColor#[1], OryUIButtonCollection[oryUIButtonID].disabledIconColor#[2], OryUIButtonCollection[oryUIButtonID].disabledIconColor#[3], OryUIButtonCollection[oryUIButtonID].disabledIconColor#[4])
			SetSpriteSize(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].disabledIconSize#[1], OryUIButtonCollection[oryUIButtonID].disabledIconSize#[2])
			if (OryUIButtonCollection[oryUIButtonID].disabledIconID > 0) then SetSpriteImage(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].disabledIconID)
			SetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].disabledTextAlignment)
			SetTextBold(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].disabledTextBold)
			SetTextColor(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].disabledTextColor#[1], OryUIButtonCollection[oryUIButtonID].disabledTextColor#[2], OryUIButtonCollection[oryUIButtonID].disabledTextColor#[3], OryUIButtonCollection[oryUIButtonID].disabledTextColor#[4])
			SetTextSize(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].disabledTextSize#)
			SetTextString(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].disabledText$)
			OryUIButtonCollection[oryUIButtonID].icon$ = OryUIButtonCollection[oryUIButtonID].disabledIcon$
			OryUIButtonCollection[oryUIButtonID].iconPlacement$ = OryUIButtonCollection[oryUIButtonID].disabledIconPlacement$
		endif
		
		// ENABLED STATE
		if (OryUIButtonCollection[oryUIButtonID].enabled = 1)
			SetSpriteColor(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIButtonCollection[oryUIButtonID].enabledColor#[1], OryUIButtonCollection[oryUIButtonID].enabledColor#[2], OryUIButtonCollection[oryUIButtonID].enabledColor#[3], OryUIButtonCollection[oryUIButtonID].enabledColor#[4])
			if (OryUIButtonCollection[oryUIButtonID].enabledImageID > 0) then SetSpriteImage(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIButtonCollection[oryUIButtonID].enabledImageID)
			SetSpriteColor(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].enabledIconColor#[1], OryUIButtonCollection[oryUIButtonID].enabledIconColor#[2], OryUIButtonCollection[oryUIButtonID].enabledIconColor#[3], OryUIButtonCollection[oryUIButtonID].enabledIconColor#[4])
			SetSpriteSize(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].enabledIconSize#[1], OryUIButtonCollection[oryUIButtonID].enabledIconSize#[2])
			if (OryUIButtonCollection[oryUIButtonID].enabledIconID > 0) then SetSpriteImage(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].enabledIconID)
			SetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].enabledTextAlignment)
			SetTextBold(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].enabledTextBold)
			SetTextColor(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].enabledTextColor#[1], OryUIButtonCollection[oryUIButtonID].enabledTextColor#[2], OryUIButtonCollection[oryUIButtonID].enabledTextColor#[3], OryUIButtonCollection[oryUIButtonID].enabledTextColor#[4])
			SetTextSize(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].enabledTextSize#)
			SetTextString(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].enabledText$)
			OryUIButtonCollection[oryUIButtonID].icon$ = OryUIButtonCollection[oryUIButtonID].enabledIcon$
			OryUIButtonCollection[oryUIButtonID].iconPlacement$ = OryUIButtonCollection[oryUIButtonID].enabledIconPlacement$
		endif
		
		// THE REST OF THE PARAMETERS NEXT
		if (OryUIParameters.angle# > -999999)
			SetSpriteAngle(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIParameters.angle#)
		endif
		if (OryUIParameters.depth > -999999)
			SetSpriteDepth(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIParameters.depth)
			SetSpriteDepth(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIParameters.depth - 1)
			SetTextDepth(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIParameters.depth - 1)
		endif
		if (OryUIParameters.fixToScreen = 1)
			FixSpriteToScreen(OryUIButtonCollection[oryUIButtonID].sprContainer, 1)
		endif

		// POSITION EVERYTHING INSIDE CONTAINER
		if (GetTextString(OryUIButtonCollection[oryUIButtonID].txtLabel) = "" and OryUIButtonCollection[oryUIButtonID].icon$ = "")
		
		elseif (GetTextString(OryUIButtonCollection[oryUIButtonID].txtLabel) <> "" and OryUIButtonCollection[oryUIButtonID].icon$ = "")
			OryUIPinSpriteToCentreOfSprite(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)
			if (GetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel) = 0)
				OryUIPinTextToCentreLeftOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprContainer, 2, 0)
			elseif (GetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel)  = 1)
				OryUIPinTextToCentreOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)
			elseif (GetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel)  = 2)
				OryUIPinTextToCentreRightOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprContainer, -2, 0)
			endif
			OryUIPinSpriteToCentreOfSprite(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)
			SetSpriteColorAlpha(OryUIButtonCollection[oryUIButtonID].sprIcon, 0)
		elseif (OryUIButtonCollection[oryUIButtonID].icon$ <> "" and GetTextString(OryUIButtonCollection[oryUIButtonID].txtLabel) = "")
			SetSpriteOffset(OryUIButtonCollection[oryUIButtonID].sprIcon, GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprIcon) / 2, GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprIcon) / 2)
			OryUIPinSpriteToCentreOfSprite(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)
			//SetSpriteDepth(OryUIButtonCollection[oryUIButtonID].sprIcon, GetSpriteDepth(OryUIButtonCollection[oryUIButtonID].sprContainer) - 1)		
		else
			oryUIIconAndLabelWidth# = GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprIcon) + 1 + GetTextTotalWidth(OryUIButtonCollection[oryUIButtonID].txtLabel)
			oryUIIconAndLabelOffsetX# = (GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprContainer) - oryUIIconAndLabelWidth#) / 2
			oryUIIconAndLabelHeight# = GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprIcon) + 1 + GetTextTotalHeight(OryUIButtonCollection[oryUIButtonID].txtLabel)
			oryUIIconAndLabelOffsetY# = (GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprContainer) - oryUIIconAndLabelHeight#) / 2
			if (lower(OryUIButtonCollection[oryUIButtonID].iconPlacement$) = "left")
				SetSpriteOffset(OryUIButtonCollection[oryUIButtonID].sprIcon, 0, GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprIcon))
				OryUIPinSpriteToCentreLeftOfSprite(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].sprContainer, oryUIIconAndLabelOffsetX#, GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprIcon) / 2)
				OryUIPinTextToCentreRightOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprIcon, 1, 0)
				SetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel, 0)
			elseif (lower(OryUIButtonCollection[oryUIButtonID].iconPlacement$) = "right")
				SetSpriteOffset(OryUIButtonCollection[oryUIButtonID].sprIcon, GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprIcon), GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprIcon))
				OryUIPinSpriteToCentreRightOfSprite(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].sprContainer, -oryUIIconAndLabelOffsetX#, GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprIcon) / 2)
				OryUIPinTextToCentreLeftOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprIcon, -1, 0)
				SetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel, 2)
			elseif (lower(OryUIButtonCollection[oryUIButtonID].iconPlacement$) = "top")
				SetSpriteOffset(OryUIButtonCollection[oryUIButtonID].sprIcon, GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprIcon) / 2, 0)
				OryUIPinSpriteToTopCentreOfSprite(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, oryUIIconAndLabelOffsetY#)
				OryUIPinTextToBottomCentreOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprIcon, 0, 1 + GetTextTotalHeight(OryUIButtonCollection[oryUIButtonID].txtLabel))
				SetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel, 1)
			elseif (lower(OryUIButtonCollection[oryUIButtonID].iconPlacement$) = "bottom")
				SetSpriteOffset(OryUIButtonCollection[oryUIButtonID].sprIcon, GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprIcon) / 2, GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprIcon))
				OryUIPinSpriteToBottomCentreOfSprite(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, oryUIIconAndLabelOffsetY#)
				OryUIPinTextToTopCentreOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprIcon, 0, -(1 + GetTextTotalHeight(OryUIButtonCollection[oryUIButtonID].txtLabel)))
				SetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel, 1)
			endif
		endif
	endif
endfunction

foldend
