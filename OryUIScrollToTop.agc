
foldstart // OryUIScrollToTop Component (Updated 19/08/2019)

type typeOryUIScrollToTop
	id as integer
	placement$ as string
	pressed as integer
	showShadow as integer
	sprContainer as integer
	sprIcon as integer
	sprShadow as integer
	startY# as float
	visible as integer
endtype

global OryUIScrollToTopCollection as typeOryUIScrollToTop[]
OryUIScrollToTopCollection.length = 1

function OryUICreateScrollToTop(oryUIComponentParameters$ as string)
	local oryUIScrollToTopID as integer
	OryUIScrollToTopCollection.length = OryUIScrollToTopCollection.length + 1
	oryUIScrollToTopID = OryUIScrollToTopCollection.length
	OryUIScrollToTopCollection[oryUIScrollToTopID].id = oryUIScrollToTopID

	// DEFAULT SETTINGS
	OryUIScrollToTopCollection[oryUIScrollToTopID].placement$ = oryUIDefaults.scrollToTopPlacement$
	OryUIScrollToTopCollection[oryUIScrollToTopID].showShadow = oryUIDefaults.scrollToTopShowShadow
	OryUIScrollToTopCollection[oryUIScrollToTopID].startY# = oryUIDefaults.scrollToTopStartY#
	OryUIScrollToTopCollection[oryUIScrollToTopID].visible = 0

	OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow = CreateSprite(0)
	SetSpriteImage(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow, oryUIScrollToTopButtonShadowImage)
	SetSpriteSize(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow, oryUIDefaults.scrollToTopWidth#, oryUIDefaults.scrollToTopHeight#)
	SetSpriteColor(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow, 255, 255, 255, 255)
	SetSpriteDepth(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow, oryUIDefaults.scrollToTopDepth)
	SetSpriteOffset(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow, GetSpriteWidth(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow) / 2, GetSpriteHeight(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow))
	SetSpritePositionByOffset(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow, GetViewOffsetX() + 50, GetViewOffsetY() + 97.5)
	//FixSpriteToScreen(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow, 1)

	OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer = CreateSprite(0)
	SetSpriteImage(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, oryUIScrollToTopButtonImage)
	SetSpriteSize(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, oryUIDefaults.scrollToTopWidth#, oryUIDefaults.scrollToTopHeight#)
	SetSpriteColor(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, oryUIDefaults.scrollToTopColor#[1], oryUIDefaults.scrollToTopColor#[2], oryUIDefaults.scrollToTopColor#[3], oryUIDefaults.scrollToTopColor#[4])
	SetSpriteDepth(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, GetSpriteDepth(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow) - 1)
	SetSpriteOffset(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, GetSpriteWidth(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer) / 2, GetSpriteHeight(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer))
	SetSpritePositionByOffset(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, GetViewOffsetX() + 50, GetViewOffsetY() + 97)
	//FixSpriteToScreen(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, 1)

	OryUIScrollToTopCollection[oryUIScrollToTopID].sprIcon = CreateSprite(0)
	SetSpriteSize(OryUIScrollToTopCollection[oryUIScrollToTopID].sprIcon, oryUIDefaults.scrollToTopIconWidth#, oryUIDefaults.scrollToTopIconHeight#)
	SetSpriteImage(OryUIScrollToTopCollection[oryUIScrollToTopID].sprIcon, oryUIDefaults.scrollToTopIconImage)
	SetSpriteColor(OryUIScrollToTopCollection[oryUIScrollToTopID].sprIcon, oryUIDefaults.scrollToTopIconColor#[1], oryUIDefaults.scrollToTopIconColor#[2], oryUIDefaults.scrollToTopIconColor#[3], oryUIDefaults.scrollToTopIconColor#[4])
	SetSpriteDepth(OryUIScrollToTopCollection[oryUIScrollToTopID].sprIcon, GetSpriteDepth(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow) - 1)
	SetSpriteOffset(OryUIScrollToTopCollection[oryUIScrollToTopID].sprIcon, GetSpriteWidth(OryUIScrollToTopCollection[oryUIScrollToTopID].sprIcon) / 2, GetSpriteHeight(OryUIScrollToTopCollection[oryUIScrollToTopID].sprIcon) / 2)
	OryUIPinSpriteToCentreOfSprite(OryUIScrollToTopCollection[oryUIScrollToTopID].sprIcon, OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, 0, 0)
	//FixSpriteToScreen(OryUIScrollToTopCollection[oryUIScrollToTopID].sprIcon, 1)

	if (oryUIComponentParameters$ <> "") then OryUIUpdateScrollToTop(oryUIScrollToTopID, oryUIComponentParameters$)
	OryUIHideScrollToTop(oryUIScrollToTopID)
endfunction oryUIScrollToTopID

function OryUIDeleteScrollToTop(oryUIScrollToTopID as integer)
	if (oryUIScrollToTopID <= OryUIScrollToTopCollection.length)
		DeleteSprite(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow)
		DeleteSprite(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer)
		DeleteSprite(OryUIScrollToTopCollection[oryUIScrollToTopID].sprIcon)
	endif
endfunction

function OryUIGetScrollToTopReleased(oryUIScrollToTopID as integer)
	local oryUIScrollToTopReleased as integer
	local oryUIScrollToTopContainerSprite as integer
	local oryUIScrollToTopIconSprite as integer
	if (GetSpriteExists(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer))
		if (OryUIGetSwipingVertically() = 0)
			if (GetPointerPressed())
				oryUIScrollToTopContainerSprite = GetSpriteHitTest(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIScrollToTopIconSprite = GetSpriteHitTest(OryUIScrollToTopCollection[oryUIScrollToTopID].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				if (oryUIScrollToTopContainerSprite = 1 or oryUIScrollToTopIconSprite = 1)
					OryUIScrollToTopCollection[oryUIScrollToTopID].pressed = 1
				endif
			else
				if (GetPointerState())
					oryUIScrollToTopContainerSprite = GetSpriteHitTest(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIScrollToTopIconSprite = GetSpriteHitTest(OryUIScrollToTopCollection[oryUIScrollToTopID].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (OryUIScrollToTopCollection[oryUIScrollToTopID].pressed = 1)
						if (oryUIScrollToTopContainerSprite = 0 and oryUIScrollToTopIconSprite = 0)
							OryUIScrollToTopCollection[oryUIScrollToTopID].pressed = 0
						endif
					endif
				endif
				if (GetPointerReleased())
					oryUIScrollToTopContainerSprite = GetSpriteHitTest(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIScrollToTopIconSprite = GetSpriteHitTest(OryUIScrollToTopCollection[oryUIScrollToTopID].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (OryUIScrollToTopCollection[oryUIScrollToTopID].pressed = 1)
						if (oryUIScrollToTopContainerSprite = 1 or oryUIScrollToTopIconSprite = 1)
							oryUIScrollToTopReleased = 1
						else
							oryUIScrollToTopReleased = 0
						endif
					endif
					OryUIScrollToTopCollection[oryUIScrollToTopID].pressed = 0
				endif
			endif
		endif
	endif

	if (oryUIScrimVisible = 1) then oryUIScrollToTopReleased = 0
endfunction oryUIScrollToTopReleased

function OryUIGetScrollToTopVisible(oryUIScrollToTopID as integer)

endfunction OryUIScrollToTopCollection[oryUIScrollToTopID].visible

function OryUIHideScrollToTop(oryUIScrollToTopID as integer)
	OryUIScrollToTopCollection[oryUIScrollToTopID].visible = 0
	SetSpritePositionByOffset(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow, -999999, -999999)
	SetSpritePositionByOffset(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, -999999, -999999)
	OryUIPinSpriteToCentreOfSprite(OryUIScrollToTopCollection[oryUIScrollToTopID].sprIcon, OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, 0, 0)
endfunction

function OryUIInsertScrollToTopListener(oryUIScrollToTopID as integer)
	local oryUIShowScrollToTop as integer
	if (GetViewOffsetY() > OryUIScrollToTopCollection[oryUIScrollToTopID].startY#) then oryUIShowScrollToTop = 1
	if (oryUIScrimVisible = 1) then oryUIShowScrollToTop = 0
	if (OryUIAnyTextfieldFocused() = 1 and (GetDeviceBaseName() = "android" or GetDeviceBaseName() = "ios")) then oryUIShowScrollToTop = 0
	if (oryUIShowScrollToTop = 0)
		if (OryUIGetScrollToTopVisible(oryUIScrollToTopID) = 1)
			OryUIHideScrollToTop(oryUIScrollToTopID)
		endif
	else
		//if (OryUIGetScrollToTopVisible(oryUIScrollToTopID) = 0)
			OryUIShowScrollToTop(oryUIScrollToTopID)
		//endif
	endif

	if (OryUIGetScrollToTopVisible(oryUIScrollToTopID) = 1)
		if (OryUIGetScrollToTopReleased(oryUIScrollToTopID))
			SetViewOffset(GetViewOffsetX(), OryUIScrollToTopCollection[oryUIScrollToTopID].startY#)
		endif
	endif
endfunction

function OryUISetScrollToTopStartY(oryUIScrollToTopID as integer, oryUIScrollToTopStartY#)
	OryUIScrollToTopCollection[oryUIScrollToTopID].startY# = oryUIScrollToTopStartY#
endfunction

function OryUIShowScrollToTop(oryUIScrollToTopID as integer)
	OryUIScrollToTopCollection[oryUIScrollToTopID].visible = 1
	if (lower(OryUIScrollToTopCollection[oryUIScrollToTopID].placement$) = "bottomleft") then oryUIScrollToTopX# = GetViewOffsetX() + 3.5
	if (lower(OryUIScrollToTopCollection[oryUIScrollToTopID].placement$) = "bottomcenter") then oryUIScrollToTopX# = GetViewOffsetX() + 50
	if (lower(OryUIScrollToTopCollection[oryUIScrollToTopID].placement$) = "bottomright") then oryUIScrollToTopX# = GetViewOffsetX() + 96.5
	oryUIScrollToTopY# = GetViewOffsetY() + 97
	if (oryUIBottomBannerAdOnScreen = 1) then oryUIScrollToTopY# = GetViewOffsetY() + 90
	SetSpritePositionByOffset(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow, oryUIScrollToTopX#, oryUIScrollToTopY# + 0.5)
	SetSpritePositionByOffset(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, oryUIScrollToTopX#, oryUIScrollToTopY#)
	OryUIPinSpriteToCentreOfSprite(OryUIScrollToTopCollection[oryUIScrollToTopID].sprIcon, OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, 0, 0)
endfunction

function OryUIUpdateScrollToTop(oryUIScrollToTopID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer))
		if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999 or oryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], oryUIParameters.color#[4])
		endif
		if (oryUIParameters.depth > -999999)
			SetSpriteDepth(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow, oryUIParameters.depth)
			SetSpriteDepth(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, oryUIParameters.depth - 1)
			SetSpriteDepth(OryUIScrollToTopCollection[oryUIScrollToTopID].sprIcon, oryUIParameters.depth - 1)
		endif
		if (oryUIParameters.iconColor#[1] > -999999 or oryUIParameters.iconColor#[2] > -999999 or oryUIParameters.iconColor#[3] > -999999 or oryUIParameters.iconColor#[4] > -999999)
			SetSpriteColor(OryUIScrollToTopCollection[oryUIScrollToTopID].sprIcon, oryUIParameters.iconColor#[1], oryUIParameters.iconColor#[2], oryUIParameters.iconColor#[3], oryUIParameters.iconColor#[4])
		endif
		if (oryUIParameters.iconID > -999999) then SetSpriteImage(OryUIScrollToTopCollection[oryUIScrollToTopID].sprIcon, oryUIParameters.iconID)
		if (lower(oryUIParameters.placement$) = "bottomright")
			OryUIScrollToTopCollection[oryUIScrollToTopID].placement$ = "bottomRight"
			SetSpriteOffset(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow, GetSpriteWidth(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow), GetSpriteHeight(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow))
			SetSpriteOffset(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, GetSpriteWidth(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer), GetSpriteHeight(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer))
		endif
		if (lower(oryUIParameters.placement$) = "bottomcenter" or lower(oryUIParameters.placement$) = "bottomcentre")
			OryUIScrollToTopCollection[oryUIScrollToTopID].placement$ = "bottomCenter"
			SetSpriteOffset(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow, GetSpriteWidth(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow) / 2, GetSpriteHeight(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow))
			SetSpriteOffset(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, GetSpriteWidth(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer) / 2, GetSpriteHeight(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer))
		endif
		if (lower(oryUIParameters.placement$) = "bottomleft")
			OryUIScrollToTopCollection[oryUIScrollToTopID].placement$ = "bottomLeft"
			SetSpriteOffset(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow, 0, GetSpriteHeight(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow))
			SetSpriteOffset(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer, 0, GetSpriteHeight(OryUIScrollToTopCollection[oryUIScrollToTopID].sprContainer))
		endif
		if (oryUIParameters.shadow >= 0)
			OryUIScrollToTopCollection[oryUIScrollToTopID].showShadow = oryUIParameters.shadow
			if (oryUIParameters.shadow = 0) then SetSpriteColorAlpha(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow, 0)
			if (oryUIParameters.shadow = 1) then SetSpriteColorAlpha(OryUIScrollToTopCollection[oryUIScrollToTopID].sprShadow, 255)
		endif
		if (oryUIParameters.startY# > -999999)
			OryUIScrollToTopCollection[oryUIScrollToTopID].startY# = oryUIParameters.startY#
		endif
	endif
endfunction

foldend
