
foldstart // OryUIFloatingActionButton Component (Updated 16/08/2019)

type typeOryUIFloatingActionButton
	id as integer
	attachToSpriteID as integer
	mini as integer
	placement$ as string
	pressed as integer
	shadow as integer
	sprContainer as integer
	sprIcon as integer
	sprShadow as integer
	txtLabel as integer
	visible as integer
endtype

global OryUIFloatingActionButtonCollection as typeOryUIFloatingActionButton[]
OryUIFloatingActionButtonCollection.length = 1

function OryUICreateFloatingActionButton(oryUIComponentParameters$ as string)
	local oryUIFloatingActionButtonID as integer
	OryUIFloatingActionButtonCollection.length = OryUIFloatingActionButtonCollection.length + 1
	oryUIFloatingActionButtonID = OryUIFloatingActionButtonCollection.length
	OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].id = oryUIFloatingActionButtonID

	// DEFAULT SETTINGS
	OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].mini = 0
	OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].placement$ = "bottomRight"
	OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].shadow = 1
	OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].visible = 1
	
	OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow = CreateSprite(0)
	SetSpriteImage(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow, oryUIFloatingActionButtonShadowImage)
	SetSpriteSize(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow, -1, 9.5) //8.63
	SetSpriteColor(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow, 255, 255, 255, 255)
	SetSpriteOffset(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow, GetSpriteWidth(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow), GetSpriteHeight(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow))
	SetSpritePositionByOffset(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow, 98, 98)
	FixSpriteToScreen(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow, 1)
	
	OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer = CreateSprite(0)
	SetSpriteImage(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, oryUIFloatingActionButtonImage)
	SetSpriteSize(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, -1, 9.5) //8.63
	SetSpriteColor(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, 255, 255, 255, 255)
	SetSpriteDepth(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, GetSpriteDepth(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow) - 1)
	SetSpriteOffset(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, GetSpriteWidth(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer), GetSpriteHeight(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer))
	SetSpritePositionByOffset(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, 98, 98)
	FixSpriteToScreen(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, 1)
	
	OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon = CreateSprite(0)
	SetSpriteSize(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, -1, 3) //2.87
	SetSpriteImage(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, oryUIIconAddImage)
	SetSpriteColor(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, 255, 255, 255, 255)
	SetSpriteDepth(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, GetSpriteDepth(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow) - 2)
	SetSpriteOffset(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, GetSpriteWidth(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon) / 2, GetSpriteHeight(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon) / 2)
	OryUIPinSpriteToCentreOfSprite(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, 0, 0)
	FixSpriteToScreen(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, 1)

	if (oryUIComponentParameters$ <> "") then OryUIUpdateFloatingActionButton(oryUIFloatingActionButtonID, oryUIComponentParameters$)
endfunction oryUIFloatingActionButtonID

function OryUIDeleteFloatingActionButton(oryUIFloatingActionButtonID as integer)
	DeleteSprite(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer)
	DeleteSprite(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon)
	DeleteSprite(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow)
endfunction

function OryUIGetFloatingActionButtonPressed(oryUIFloatingActionButtonID as integer)
	local oryUIFloatingActionButtonPressed as integer
	local oryUIFloatingActionButtonContainerSprite as integer
	local oryUIFloatingActionButtonIconSprite as integer
	if (GetSpriteExists(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer))
		if (OryUIGetSwipingVertically() = 0)
			if (GetPointerPressed())
				oryUIFloatingActionButtonContainerSprite = GetSpriteHitTest(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIFloatingActionButtonIconSprite = GetSpriteHitTest(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				if (oryUIFloatingActionButtonContainerSprite = 1 or oryUIFloatingActionButtonIconSprite = 1)
					OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].pressed = 1
				else
					OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].pressed = 0
				endif
			elseif (OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].pressed = 1)
				if (GetPointerState())
					oryUIFloatingActionButtonContainerSprite = GetSpriteHitTest(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIFloatingActionButtonIconSprite = GetSpriteHitTest(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (oryUIFloatingActionButtonContainerSprite = 1 or oryUIFloatingActionButtonIconSprite = 1)
						OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].pressed = 1
					else
						OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].pressed = 0
					endif
				endif
			endif
		endif
		oryUIFloatingActionButtonPressed = OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].pressed				
	endif

	if (oryUIScrimVisible = 1) then oryUIFloatingActionButtonPressed = 0
endfunction oryUIFloatingActionButtonPressed
	
function OryUIGetFloatingActionButtonReleased(oryUIFloatingActionButtonID as integer)
	local oryUIFloatingActionButtonReleased as integer
	local oryUIFloatingActionButtonContainerSprite as integer
	local oryUIFloatingActionButtonIconSprite as integer
	if (GetSpriteExists(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer))
		if (OryUIGetSwipingVertically() = 0)
			if (GetPointerPressed())
				oryUIFloatingActionButtonContainerSprite = GetSpriteHitTest(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIFloatingActionButtonIconSprite = GetSpriteHitTest(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				if (oryUIFloatingActionButtonContainerSprite = 1 or oryUIFloatingActionButtonIconSprite = 1)
					OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].pressed = 1
				endif
			else
				if (GetPointerState())
					oryUIFloatingActionButtonContainerSprite = GetSpriteHitTest(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIFloatingActionButtonIconSprite = GetSpriteHitTest(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].pressed = 1)
						if (oryUIFloatingActionButtonContainerSprite = 0 and oryUIFloatingActionButtonIconSprite = 0)
							OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].pressed = 0
						endif
					endif
				endif
				if (GetPointerReleased())
					oryUIFloatingActionButtonContainerSprite = GetSpriteHitTest(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIFloatingActionButtonIconSprite = GetSpriteHitTest(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].pressed = 1)
						if (oryUIFloatingActionButtonContainerSprite = 1 or oryUIFloatingActionButtonIconSprite = 1)
							oryUIFloatingActionButtonReleased = 1
						else
							oryUIFloatingActionButtonReleased = 0
						endif
					endif
					OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].pressed = 0
				endif
			endif
		endif
	endif
	
	if (oryUIScrimVisible = 1) then oryUIFloatingActionButtonReleased = 0
endfunction oryUIFloatingActionButtonReleased

function OryUIGetFloatingActionButtonVisible(oryUIFloatingActionButtonID as integer)

endfunction OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].visible

function OryUIHideFloatingActionButton(oryUIFloatingActionButtonID as integer)
	OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].visible = 0
	SetSpritePositionByOffset(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow, -999999, -999999)
	SetSpritePositionByOffset(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, -999999, -999999)
	OryUIPinSpriteToCentreOfSprite(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, 0, 0)
endfunction

function OryUIShowFloatingActionButton(oryUIFloatingActionButtonID as integer)
	local oryUIFloatingActionButtonX# as float
	local oryUIFloatingActionButtonY# as float
	OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].visible = 1
	if (OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].attachToSpriteID > 0)
		if (left(lower(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].placement$), 6) = "bottom")
			if (lower(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].placement$) = "bottomleft")
				oryUIFloatingActionButtonX# = WorldToScreenX(GetSpriteX(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].attachToSpriteID))
				oryUIFloatingActionButtonY# = WorldToScreenY(GetSpriteY(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].attachToSpriteID)) + GetSpriteHeight(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].attachToSpriteID)
			endif
			if (lower(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].placement$) = "bottomcenter")
				oryUIFloatingActionButtonX# = WorldToScreenX(GetSpriteX(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].attachToSpriteID)) + (GetSpriteWidth(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].attachToSpriteID) / 2)
				oryUIFloatingActionButtonY# = WorldToScreenY(GetSpriteY(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].attachToSpriteID)) + GetSpriteHeight(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].attachToSpriteID)
			endif
			if (lower(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].placement$) = "bottomright")
				oryUIFloatingActionButtonX# = WorldToScreenX(GetSpriteX(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].attachToSpriteID)) + GetSpriteWidth(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].attachToSpriteID)
				oryUIFloatingActionButtonY# = WorldToScreenY(GetSpriteY(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].attachToSpriteID)) + GetSpriteHeight(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].attachToSpriteID)
			endif
		endif
	else
		if (left(lower(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].placement$), 6) = "bottom")
			if (lower(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].placement$) = "bottomleft") then oryUIFloatingActionButtonX# = 3.5
			if (lower(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].placement$) = "bottomcenter") then oryUIFloatingActionButtonX# = 50
			if (lower(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].placement$) = "bottomright") then oryUIFloatingActionButtonX# = 96.5
			oryUIFloatingActionButtonY# = 97
			if (oryUIBottomBannerAdOnScreen = 1) then oryUIFloatingActionButtonY# = 90
			if (OryUIAnyTextfieldFocused() = 1 and (GetDeviceBaseName() = "android" or GetDeviceBaseName() = "ios")) then oryUIFloatingActionButtonY# = 50
		endif
	endif
	SetSpritePositionByOffset(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow, oryUIFloatingActionButtonX#, oryUIFloatingActionButtonY# + 0.5)
	SetSpritePositionByOffset(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, oryUIFloatingActionButtonX#, oryUIFloatingActionButtonY#)
	OryUIPinSpriteToCentreOfSprite(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, 0, 0)
endfunction

function OryUIUpdateFloatingActionButton(oryUIFloatingActionButtonID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer))
		if (OryUIParameters.attachToSpriteID > 0) then OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].attachToSpriteID = OryUIParameters.attachToSpriteID
		if (OryUIParameters.color#[1] > -999999 or OryUIParameters.color#[2] > -999999 or OryUIParameters.color#[3] > -999999 or OryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, OryUIParameters.color#[1], OryUIParameters.color#[2], OryUIParameters.color#[3], OryUIParameters.color#[4])
		endif
		if (OryUIParameters.depth > -999999)
			SetSpriteDepth(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow, OryUIParameters.depth)
			SetSpriteDepth(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, OryUIParameters.depth - 1)
			SetSpriteDepth(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, OryUIParameters.depth - 1)
		endif
		if (OryUIParameters.iconColor#[1] > -999999 or OryUIParameters.iconColor#[2] > -999999 or OryUIParameters.iconColor#[3] > -999999 or OryUIParameters.iconColor#[4] > -999999)
			SetSpriteColor(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, OryUIParameters.iconColor#[1], OryUIParameters.iconColor#[2], OryUIParameters.iconColor#[3], OryUIParameters.iconColor#[4])
		endif
		if (OryUIParameters.iconID > -999999) then SetSpriteImage(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, OryUIParameters.iconID)
		if (OryUIParameters.mini >= 0)
			OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].mini = OryUIParameters.mini
			if (OryUIParameters.mini = 0)
				SetSpriteSize(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow, -1, 9.5)
				SetSpriteSize(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, -1, 9.5)
				SetSpriteSize(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, -1, 3)
			else
				SetSpriteSize(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow, -1, 6.78)
				SetSpriteSize(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, -1, 6.78)
				SetSpriteSize(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, -1, 3)
			endif
		endif
		if (lower(OryUIParameters.placement$) = "bottomright")
			OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].placement$ = "bottomRight"
			SetSpriteOffset(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow, GetSpriteWidth(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow), GetSpriteHeight(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow))
			SetSpriteOffset(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, GetSpriteWidth(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer), GetSpriteHeight(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer))
			OryUIPinSpriteToCentreOfSprite(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, 0, 0)
		endif
		if (lower(OryUIParameters.placement$) = "bottomcenter" or lower(OryUIParameters.placement$) = "bottomcentre")
			OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].placement$ = "bottomCenter"
			SetSpriteOffset(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow, GetSpriteWidth(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow) / 2, GetSpriteHeight(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow))
			SetSpriteOffset(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, GetSpriteWidth(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer) / 2, GetSpriteHeight(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer))
			OryUIPinSpriteToCentreOfSprite(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, 0, 0)
		endif
		if (lower(OryUIParameters.placement$) = "bottomleft")
			OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].placement$ = "bottomLeft"
			SetSpriteOffset(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow, 0, GetSpriteHeight(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow))
			SetSpriteOffset(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, 0, GetSpriteHeight(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer))
			OryUIPinSpriteToCentreOfSprite(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprIcon, OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprContainer, 0, 0)
		endif
		if (OryUIParameters.shadow >= 0)
			OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].shadow = OryUIParameters.shadow
			if (OryUIParameters.shadow = 0) then SetSpriteColorAlpha(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow, 0)
			if (OryUIParameters.shadow = 1) then SetSpriteColorAlpha(OryUIFloatingActionButtonCollection[oryUIFloatingActionButtonID].sprShadow, 255)
		endif
	endif
endfunction

foldend
