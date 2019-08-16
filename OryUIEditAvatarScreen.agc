
foldstart // OryUIEditAvatarScreen (Updated 16/08/2019)

type typeOryUIEditAvatarScreen
	id as integer
	cancelButtonPressed as integer
	cancelButtonReleased as integer
	frameShape$ as string
	imageAspect# as float
	imageInID as integer
	imageOutID as integer
	maxZoom# as float
	originalMaxViewX# as float
	originalMaxViewY# as float
	originalMaxViewZoom# as float
	originalMinViewX# as float
	originalMinViewY# as float
	originalMinViewZoom# as float
	originalOffsetX# as float
	originalOffsetY# as float
	originalZoom# as float
	rotateButtonPressed as integer
	rotateButtonReleased as integer
	saveButtonPressed as integer
	saveButtonReleased as integer
	screenX# as float
	screenY# as float
	sprAvatar as integer
	sprAvatarFrame as integer
	sprBackground as integer
	sprCancelButtonContainer as integer
	sprOverlayBottom as integer
	sprOverlayLeft as integer
	sprOverlayRight as integer
	sprOverlayTop as integer
	sprRotateButtonContainer as integer
	sprRotateButtonIcon as integer
	sprSaveButtonContainer as integer
	txtCancelButtonLabel as integer
	txtSaveButtonLabel as integer
endtype

global OryUIEditAvatarScreenCollection as typeOryUIEditAvatarScreen[]
OryUIEditAvatarScreenCollection.length = 1

function OryUICreateEditAvatarScreen(oryUIComponentParameters$ as string)
	local oryUIEditAvatarScreenID as integer
	OryUIEditAvatarScreenCollection.length = OryUIEditAvatarScreenCollection.length + 1
	oryUIEditAvatarScreenID = OryUIEditAvatarScreenCollection.length
	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].id = oryUIEditAvatarScreenID

	// DEFAULT SETTINGS
	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].frameShape$ = "Square"
	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].maxZoom# = 4
	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalMaxViewX# = OryUITouchCollection[0].maxViewX#
	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalMaxViewY# = OryUITouchCollection[0].maxViewY#
	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalMaxViewZoom# = OryUITouchCollection[0].maxViewZoom#
	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalMinViewX# = OryUITouchCollection[0].minViewX#
	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalMinViewY# = OryUITouchCollection[0].minViewY#
	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalMinViewZoom# = OryUITouchCollection[0].minViewZoom#
	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalOffsetX# = GetViewOffsetX()
	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalOffsetY# = GetViewOffsetY()
	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalZoom# = GetViewZoom()
	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# = -999999
	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# = -999999
	OryUISetScreenZoomLimits(1, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].maxZoom#)
	
	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground = CreateSprite(0)
	SetSpriteSize(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground, 100, 150)
	SetSpriteColor(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground, 0, 0, 0, 255)
	SetSpriteOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground, 50, 75)
	SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground, 50, 50)

	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar = CreateSprite(0)
	SetSpriteSize(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar, 90, 90)
	SetSpriteColor(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar, 255, 255, 255, 255)
	SetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar, GetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground) - 1)
	SetSpriteOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar, 45, 45)
	SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar, 50, 50)

	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame = CreateSprite(0)
	SetSpriteSize(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame, 90, -1)
	SetSpriteColor(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame, 0, 0, 0, 0)
	SetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame, GetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground) - 2)
	SetSpriteOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame, 45, GetSpriteHeight(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame) / 2)
	SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame, 50, 50)
	//FixSpriteToScreen(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame, 1)

	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayLeft = CreateSprite(0)
	SetSpriteSize(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayLeft, 5, GetSpriteHeight(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame))
	SetSpriteColor(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayLeft, 0, 0, 0, 190)
	SetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayLeft, GetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground) - 2)
	SetSpriteOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayLeft, 0, GetSpriteHeight(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame) / 2)
	SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayLeft, 0, 50)
	//FixSpriteToScreen(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayLeft, 1)

	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayRight = CreateSprite(0)
	SetSpriteSize(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayRight, 5, GetSpriteHeight(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame))
	SetSpriteColor(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayRight, 0, 0, 0, 190)
	SetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayRight, GetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground) - 2)
	SetSpriteOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayRight, 5, GetSpriteHeight(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame) / 2)
	SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayRight, 100, 50)
	//FixSpriteToScreen(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayRight, 1)

	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayTop = CreateSprite(0)
	SetSpriteSize(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayTop, 100, (100 - GetSpriteHeight(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame)) / 2)
	SetSpriteColor(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayTop, 0, 0, 0, 190)
	SetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayTop, GetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground) - 2)
	SetSpriteOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayTop, 50, 0)
	SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayTop, 50, 0)
	//FixSpriteToScreen(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayTop, 1)

	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayBottom = CreateSprite(0)
	SetSpriteSize(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayBottom, 100, (100 - GetSpriteHeight(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame)) / 2)
	SetSpriteColor(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayBottom, 0, 0, 0, 190)
	SetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayBottom, GetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground) - 2)
	SetSpriteOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayBottom, 50, GetSpriteHeight(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayBottom))
	SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayBottom, 50, 100)
	//FixSpriteToScreen(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayBottom, 1)

	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer = CreateSprite(0)
	SetSpriteSize(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer, 40, 8)
	SetSpriteColor(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer, 0, 0, 0, 255)
	SetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer, GetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground) - 3)
	SetSpriteOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer, 0, 0)
	SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer, 0, 92)
	//FixSpriteToScreen(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer, 1)

	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtCancelButtonLabel = CreateText("Cancel")
	SetTextSize(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtCancelButtonLabel, 4)
	SetTextBold(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtCancelButtonLabel, 1)
	SetTextColor(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtCancelButtonLabel, 255, 255, 255, 255)
	SetTextDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtCancelButtonLabel, GetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer) - 1)
	SetTextAlignment(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtCancelButtonLabel, 1)
	SetTextDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtCancelButtonLabel, GetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer) - 1)
	OryUIPinTextToCentreOfSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtCancelButtonLabel, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer, 0, 0)
	//FixTextToScreen(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtCancelButtonLabel, 1)

	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonContainer = CreateSprite(0)
	SetSpriteSize(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonContainer, 20, 8)
	SetSpriteColor(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonContainer, 0, 0, 0, 255)
	SetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonContainer, GetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground) - 3)
	SetSpriteOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonContainer, 0, 0)
	SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonContainer, 40, 92)
	//FixSpriteToScreen(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonContainer, 1)

	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonIcon = CreateSprite(0)
	SetSpriteSize(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonIcon, -1, 4)
	SetSpriteImage(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonIcon, oryUIIconRotateImageImage)
	SetSpriteColor(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonIcon, 255, 255, 255, 255)
	SetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonIcon, GetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonContainer) - 1)
	SetSpriteOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonIcon, GetSpriteWidth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonIcon) / 2, 2)
	SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonIcon, 0, 0)
	OryUIPinSpriteToCentreOfSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonIcon, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonContainer, 0, 0)
	//FixSpriteToScreen(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonIcon, 1)
		
	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer = CreateSprite(0)
	SetSpriteSize(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer, 40, 8)
	SetSpriteColor(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer, 0, 0, 0, 255)
	SetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer, GetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground) - 3)
	SetSpriteOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer, 0, 0)
	SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer, 60, 92)
	//FixSpriteToScreen(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer, 1)

	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtSaveButtonLabel = CreateText("Save")
	SetTextSize(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtSaveButtonLabel, 4)
	SetTextBold(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtSaveButtonLabel, 1)
	SetTextColor(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtSaveButtonLabel, 255, 255, 255, 255)
	SetTextDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtSaveButtonLabel, GetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer) - 1)
	SetTextAlignment(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtSaveButtonLabel, 1)
	SetTextDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtSaveButtonLabel, GetSpriteDepth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer) - 1)
	OryUIPinTextToCentreOfSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtSaveButtonLabel, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer, 0, 0)
	//FixTextToScreen(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtSaveButtonLabel, 1)

	if (oryUIComponentParameters$ <> "") then OryUIUpdateEditAvatarScreen(oryUIEditAvatarScreenID, oryUIComponentParameters$)
endfunction oryUIEditAvatarScreenID

function OryUIDeleteEditAvatarScreen(oryUIEditAvatarScreenID as integer)
	DeleteSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar)
	DeleteSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame)
	DeleteSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground)
	DeleteSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer)
	DeleteSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayLeft)
	DeleteSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayRight)
	DeleteSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayTop)
	DeleteSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayBottom)
	DeleteSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonContainer)
	DeleteSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonIcon)
	DeleteSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer)
	DeleteText(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtCancelButtonLabel)
	DeleteText(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtSaveButtonLabel)
endfunction

function OryUIGetFinalAvatar(oryUIEditAvatarScreenID as integer)
	
endfunction OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].imageOutID

function OryUIGetEditAvatarCancelButtonReleased(oryUIEditAvatarScreenID as integer)

endfunction OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].cancelButtonReleased

function OryUIGetEditAvatarSaveButtonReleased(oryUIEditAvatarScreenID as integer)

endfunction OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].saveButtonReleased

function OryUIInsertEditAvatarScreenListener(oryUIEditAvatarScreenID as integer)
	if (oryUIScrimVisible = 1) then exitfunction

	local oryUIMaxPanX# as float
	local oryUIMaxPanY# as float
	local oryUIMinPanX# as float
	local oryUIMinPanY# as float
	local oryUIEditAvatarHeight# as float
	local oryUIEditAvatarWidth# as float

	if (GetViewOffsetX() >= OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# - 100 and GetViewOffsetX() <= OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# + 100 and GetViewOffsetY() >= OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# - 100 and GetViewOffsetY() <= OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# + 100)
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# + 50, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# + 50)
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# + 50, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# + 50)
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame, GetViewOffsetX() + 50, GetViewOffsetY() + 50)
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayLeft, GetViewOffsetX() + 0, GetViewOffsetY() + 50)
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayRight, GetViewOffsetX() + 100, GetViewOffsetY() + 50)
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayTop, GetViewOffsetX() + 50, GetViewOffsetY() + 0)
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayBottom, GetViewOffsetX() + 50, GetViewOffsetY() + 100)
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer, GetViewOffsetX() + 0, GetViewOffsetY() + 92)
		OryUIPinTextToCentreOfSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtCancelButtonLabel, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer, 0, 0)
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonContainer, GetViewOffsetX() + 40, GetViewOffsetY() + 92)
		OryUIPinSpriteToCentreOfSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonIcon, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonContainer, 0, 0)
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer, GetViewOffsetX() + 60, GetViewOffsetY() + 92)
		OryUIPinTextToCentreOfSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtSaveButtonLabel, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer, 0, 0)
	else
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground, -999999, -999999)
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar, -999999, -999999)
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame, -999999, -999999)
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayLeft, -999999, -999999)
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayRight, -999999, -999999)
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayTop, -999999, -999999)
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayBottom, -999999, -999999)
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer, -999999, -999999)
		OryUIPinTextToCentreOfSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtCancelButtonLabel, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer, 0, 0)
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonContainer, -999999, -999999)
		OryUIPinSpriteToCentreOfSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonIcon, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonContainer, 0, 0)
		SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer, -999999, -999999)
		OryUIPinTextToCentreOfSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtSaveButtonLabel, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer, 0, 0)
	endif

	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].cancelButtonReleased = 0
	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].rotateButtonReleased = 0
	OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].saveButtonReleased = 0
	if (GetSpriteExists(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar))
		if (GetPointerPressed())
			oryUIEditAvatarCancelButtonContainerSprite = GetSpriteHitTest(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			oryUIEditAvatarCancelButtonLabelText = GetTextHitTest(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtCancelButtonLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			oryUIEditAvatarRotateButtonContainerSprite = GetSpriteHitTest(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			oryUIEditAvatarRotateButtonIconSprite = GetSpriteHitTest(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			oryUIEditAvatarSaveButtonContainerSprite = GetSpriteHitTest(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			oryUIEditAvatarSaveButtonLabelText = GetTextHitTest(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtSaveButtonLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			if (oryUIEditAvatarCancelButtonContainerSprite = 1 or oryUIEditAvatarCancelButtonLabelText = 1)
				OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].cancelButtonPressed = 1
			endif
			if (oryUIEditAvatarRotateButtonContainerSprite = 1 or oryUIEditAvatarRotateButtonIconSprite = 1)
				OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].rotateButtonPressed = 1
			endif
			if (oryUIEditAvatarSaveButtonContainerSprite = 1 or oryUIEditAvatarSaveButtonLabelText = 1)
				OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].saveButtonPressed = 1
			endif
		else
			if (GetPointerState())
				oryUIEditAvatarCancelButtonContainerSprite = GetSpriteHitTest(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIEditAvatarCancelButtonLabelText = GetTextHitTest(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtCancelButtonLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIEditAvatarRotateButtonContainerSprite = GetSpriteHitTest(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIEditAvatarRotateButtonIconSprite = GetSpriteHitTest(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIEditAvatarSaveButtonContainerSprite = GetSpriteHitTest(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIEditAvatarSaveButtonLabelText = GetTextHitTest(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtSaveButtonLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				if (OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].cancelButtonPressed)
					if (oryUIEditAvatarCancelButtonContainerSprite = 0 and oryUIEditAvatarCancelButtonLabelText = 0)
						OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].cancelButtonPressed = 0
					endif
				endif
				if (OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].rotateButtonPressed)
					if (oryUIEditAvatarRotateButtonContainerSprite = 0 and oryUIEditAvatarRotateButtonIconSprite = 0)
						OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].rotateButtonPressed = 0
					endif
				endif
				if (OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].saveButtonPressed)
					if (oryUIEditAvatarSaveButtonContainerSprite = 0 and oryUIEditAvatarSaveButtonLabelText = 0)
						OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].saveButtonPressed = 0
					endif
				endif
			endif
			if (GetPointerReleased())
				oryUIEditAvatarCancelButtonContainerSprite = GetSpriteHitTest(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIEditAvatarCancelButtonLabelText = GetTextHitTest(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtCancelButtonLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIEditAvatarRotateButtonContainerSprite = GetSpriteHitTest(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIEditAvatarRotateButtonIconSprite = GetSpriteHitTest(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIEditAvatarSaveButtonContainerSprite = GetSpriteHitTest(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				oryUIEditAvatarSaveButtonLabelText = GetTextHitTest(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtSaveButtonLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				if (OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].cancelButtonPressed)
					if (oryUIEditAvatarCancelButtonContainerSprite = 1 or oryUIEditAvatarCancelButtonLabelText = 1)
						//OryUIDeleteEditAvatarScreen(oryUIEditAvatarScreenID)
						OryUISetScreenScrollLimits(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalMinViewX#, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalMaxViewX#, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalMinViewY#, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalMaxViewY#)
						OryUISetScreenZoomLimits(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalMinViewZoom#, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalMaxViewZoom#)
						//SetViewOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalOffsetX#, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalOffsetY#)
						SetViewZoom(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalZoom#)
						//OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].rotateButtonPressed = 0
						OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].saveButtonPressed = 0
						OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].cancelButtonReleased = 1
					endif
				endif
				if (OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].rotateButtonPressed)
					if (oryUIEditAvatarRotateButtonContainerSprite = 1 or oryUIEditAvatarRotateButtonIconSprite = 1)
						oryUIEditAvatarHeight# = GetSpriteHeight(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar)
						oryUIEditAvatarWidth# = GetSpriteWidth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar)
						SetSpriteAngle(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar, GetSpriteAngle(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar) - 90)
						//SetViewOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX#, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY#)
						//SetViewZoom(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalZoom#)
						OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].rotateButtonReleased = 1
					endif
					OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].cancelButtonPressed = 0
					OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].rotateButtonPressed = 0
					OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].saveButtonPressed = 0
				endif
				if (OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].saveButtonPressed)
					if (oryUIEditAvatarSaveButtonContainerSprite = 1 or oryUIEditAvatarSaveButtonLabelText = 1)
						SetSpriteColorAlpha(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame, 0)
						Render()
						OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].imageOutID = GetImage(GetSpriteX(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame), GetSpriteY(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame), GetSpriteWidth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame), GetSpriteHeight(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame))
						SetSpriteColorAlpha(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame, 190)
						//OryUIDeleteEditAvatarScreen(oryUIEditAvatarScreenID)
						OryUISetScreenScrollLimits(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalMinViewX#, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalMaxViewX#, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalMinViewY#, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalMaxViewY#)
						OryUISetScreenZoomLimits(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalMinViewZoom#, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalMaxViewZoom#)
						//SetViewOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalOffsetX#, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalOffsetY#)
						SetViewZoom(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].originalZoom#)
						OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].cancelButtonPressed = 0
						OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].saveButtonReleased = 1
					endif
				endif
			endif
		endif
	endif
	if (GetSpriteExists(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar))
		if (GetSpriteAngle(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar) = 0 or GetSpriteAngle(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar) = 180)
			oryUIMaxPanX# = OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# + (GetSpriteWidth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar) / 2) - (45 / GetViewZoom())
			oryUIMaxPanY# = OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# + (GetSpriteHeight(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar) / 2) - ((GetSpriteHeight(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame) / 2) / GetViewZoom())
			oryUIMinPanX# = OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# + (-(GetSpriteWidth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar) / 2)) + (45 / GetViewZoom())
			oryUIMinPanY# = OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# + (-((GetSpriteHeight(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar) / 2))) + ((GetSpriteHeight(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame) / 2) / GetViewZoom())
		else
			oryUIMaxPanX# = OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# + ((GetSpriteWidth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar) / OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].imageAspect#) / 2) - (45 / GetViewZoom())
			oryUIMaxPanY# = OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# + (((GetSpriteHeight(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar) * OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].imageAspect#) / 2) - ((GetSpriteHeight(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame) / 2) / GetViewZoom()))
			oryUIMinPanX# = OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# + (-((GetSpriteWidth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar) / OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].imageAspect#) / 2)) + (45 / GetViewZoom())
			oryUIMinPanY# = OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# + ((-(((GetSpriteHeight(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar) * OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].imageAspect#) / 2))) + ((GetSpriteHeight(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame) / 2) / GetViewZoom()))
		endif
		//if (GetSpriteAngle(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar) = 0 or GetSpriteAngle(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar) = 180)
			OryUISetScreenScrollLimits(oryUIMinPanX#, oryUIMaxPanX#, oryUIMinPanY#, oryUIMaxPanY#)
		//else
		//	OryUISetScreenScrollLimits(oryUIMinPanY# * GetDisplayAspect(), oryUIMaxPanY# * GetDisplayAspect(), oryUIMinPanX# * GetDisplayAspect(), oryUIMaxPanX# * GetDisplayAspect())
		//endif
	endif
endfunction

function OryUIUpdateEditAvatarScreen(oryUIEditAvatarScreenID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground))
		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
		if (OryUIParameters.position#[1] > -999999 and OryUIParameters.position#[2] > -999999)
			if (OryUIParameters.position#[1] <> OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# and OryUIParameters.position#[2] <> OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY#)
				OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# = OryUIParameters.position#[1]
				OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# = OryUIParameters.position#[2]
				//SetViewOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX#, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY#)
				SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# + 50, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# + 50)
				SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# + 50, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# + 50)
				SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# + 50, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# + 50)
				SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayLeft, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# + 0, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# + 50)
				SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayRight, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# + 100, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# + 50)
				SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayTop, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# + 50, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY#+ 0)
				SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprOverlayBottom, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# + 50, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# + 100)
				SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# + 0, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# + 92)
				OryUIPinTextToCentreOfSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtCancelButtonLabel, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprCancelButtonContainer, 0, 0)
				SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonContainer, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# + 40, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# + 92)
				OryUIPinSpriteToCentreOfSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonIcon, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprRotateButtonContainer, 0, 0)
				SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# + 60, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# + 92)
				OryUIPinTextToCentreOfSprite(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtSaveButtonLabel, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprSaveButtonContainer, 0, 0)
			endif
		endif

		// THE REST OF THE PARAMETERS NEXT
		if (OryUIParameters.backgroundColor#[1] > -999999 or OryUIParameters.backgroundColor#[2] > -999999 or OryUIParameters.backgroundColor#[3] > -999999 or OryUIParameters.backgroundColor#[4] > -999999)
			SetSpriteColor(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground, OryUIParameters.backgroundColor#[1], OryUIParameters.backgroundColor#[2], OryUIParameters.backgroundColor#[3], OryUIParameters.backgroundColor#[4])
		endif
		if (OryUIParameters.cancelText$ <> "")
			SetTextString(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtCancelButtonLabel, OryUIParameters.cancelText$)
		endif
		if (lower(OryUIParameters.frameShape$) = "circle")
			SetSpriteImage(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame, oryUICircleFrameImage)
			SetSpriteColor(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame, 0, 0, 0, 190)
		endif
		if (lower(OryUIParameters.frameShape$) = "square")
			SetSpriteImage(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame, 0)
			SetSpriteColor(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatarFrame, 0, 0, 0, 0)
		endif
		if (OryUIParameters.imageID > -999999)
			SetSpriteImage(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar, OryUIParameters.imageID)
			if (GetImageWidth(OryUIParameters.imageID) > GetImageHeight(OryUIParameters.imageID))
				OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].imageAspect# = GetImageWidth(OryUIParameters.imageID) / GetImageHeight(OryUIParameters.imageID)
				SetSpriteSize(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground, 200, 200)
				SetSpriteSize(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar, -1, 60)
				SetSpriteOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar, GetSpriteWidth(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar) / 2, 30)
				SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# + 50, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# + 50)
			else
				OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].imageAspect# = GetImageWidth(OryUIParameters.imageID) / GetImageHeight(OryUIParameters.imageID)
				SetSpriteSize(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprBackground, 200, 200)
				SetSpriteSize(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar, 90, -1)
				SetSpriteOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar, 45, GetSpriteHeight(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar) / 2)
				SetSpritePositionByOffset(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].sprAvatar, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenX# + 50, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].screenY# + 50)
			endif
		endif
		if (OryUIParameters.maxZoom# > -999999)
			OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].maxZoom# = OryUIParameters.maxZoom#
			OryUISetScreenZoomLimits(1, OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].maxZoom#)
		endif
		if (OryUIParameters.saveText$ <> "")
			SetTextString(OryUIEditAvatarScreenCollection[oryUIEditAvatarScreenID].txtSaveButtonLabel, OryUIParameters.saveText$)
		endif
	endif
endfunction

foldend
