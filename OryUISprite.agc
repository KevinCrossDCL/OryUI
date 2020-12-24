
foldstart // OryUISprite

function OryUICreateSprite(oryUIWidgetParameters$ as string)
	local oryUISpriteID as integer
	oryUISpriteID = CreateSprite(0)

	oryUICreatedWidgets.insert(OryUIAddCreatedWidget(oryUISpriteID, "Sprite"))

	SetSpriteOffset(oryUISpriteID, 0, 0)
	SetSpritePhysicsOff(oryUISpriteID)
	
	if (oryUIWidgetParameters$ <> "") then OryUIUpdateSprite(oryUISpriteID, oryUIWidgetParameters$)
endfunction oryUISpriteID

function OryUIPinSpriteToBottomCenterOfSprite(oryUISpriteA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	OryUIPinSpriteToBottomCentreOfSprite(oryUISpriteA, oryUISpriteB, oryUIOffsetX#, oryUIOffsetY#)
endfunction

function OryUIPinSpriteToBottomCentreOfSprite(oryUISpriteA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetSpriteExists(oryUISpriteA) and GetSpriteExists(oryUISpriteB))
		SetSpritePositionByOffset(oryUISpriteA, GetSpriteX(oryUISpriteB) + (GetSpriteWidth(oryUISpriteB) / 2), GetSpriteY(oryUISpriteB) + GetSpriteHeight(oryUISpriteB) - oryUIOffsetY#)
	endif
endfunction

function OryUIPinSpriteToBottomLeftOfSprite(oryUISpriteA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetSpriteExists(oryUISpriteA) and GetSpriteExists(oryUISpriteB))
		SetSpritePositionByOffset(oryUISpriteA, GetSpriteX(oryUISpriteB) + oryUIOffsetX#, (GetSpriteY(oryUISpriteB) + GetSpriteHeight(oryUISpriteB)) - (GetSpriteHeight(oryUISpriteA) + oryUIOffsetY#))
	endif
endfunction

function OryUIPinSpriteToBottomRightOfSprite(oryUISpriteA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetSpriteExists(oryUISpriteA) and GetSpriteExists(oryUISpriteB))
		SetSpritePositionByOffset(oryUISpriteA, (GetSpriteX(oryUISpriteB) + GetSpriteWidth(oryUISpriteB)) - (GetSpriteWidth(oryUISpriteA) + oryUIOffsetX#), (GetSpriteY(oryUISpriteB) + GetSpriteHeight(oryUISpriteB)) - (GetSpriteHeight(oryUISpriteA) + oryUIOffsetY#))
	endif
endfunction

function OryUIPinSpriteToCenterLeftOfSprite(oryUISpriteA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	OryUIPinSpriteToCentreLeftOfSprite(oryUISpriteA, oryUISpriteB, oryUIOffsetX#, oryUIOffsetY#)
endfunction

function OryUIPinSpriteToCenterOfSprite(oryUISpriteA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	OryUIPinSpriteToCentreOfSprite(oryUISpriteA, oryUISpriteB, oryUIOffsetX#, oryUIOffsetY#)
endfunction

function OryUIPinSpriteToCenterRightOfSprite(oryUISpriteA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	OryUIPinSpriteToCentreRightOfSprite(oryUISpriteA, oryUISpriteB, oryUIOffsetX#, oryUIOffsetY#)
endfunction

function OryUIPinSpriteToCentreLeftOfSprite(oryUISpriteA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetSpriteExists(oryUISpriteA) and GetSpriteExists(oryUISpriteB))
		SetSpritePositionByOffset(oryUISpriteA, GetSpriteX(oryUISpriteB) + oryUIOffsetX#, GetSpriteY(oryUISpriteB) + (GetSpriteHeight(oryUISpriteB) / 2) + oryUIOffsetY#)
	endif
endfunction

function OryUIPinSpriteToCentreOfSprite(oryUISpriteA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetSpriteExists(oryUISpriteA) and GetSpriteExists(oryUISpriteB))
		SetSpritePositionByOffset(oryUISpriteA, GetSpriteX(oryUISpriteB) + (GetSpriteWidth(oryUISpriteB) / 2) + oryUIOffsetX#, GetSpriteY(oryUISpriteB) + (GetSpriteHeight(oryUISpriteB) / 2) + oryUIOffsetY#)
	endif
endfunction

function OryUIPinSpriteToCentreRightOfSprite(oryUISpriteA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetSpriteExists(oryUISpriteA) and GetSpriteExists(oryUISpriteB))
		SetSpritePositionByOffset(oryUISpriteA, GetSpriteX(oryUISpriteB) + GetSpriteWidth(oryUISpriteB) + oryUIOffsetX#, GetSpriteY(oryUISpriteB) + (GetSpriteHeight(oryUISpriteB) / 2) + oryUIOffsetY#)
	endif
endfunction

//function OryUIPinSpriteToCentreTopOfSprite(oryUISpriteA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
//	if (GetSpriteExists(oryUISpriteA) and GetSpriteExists(oryUISpriteB))
//		SetSpritePositionByOffset(oryUISpriteA, GetSpriteX(oryUISpriteB) + (GetSpriteWidth(oryUISpriteB) / 2), GetSpriteY(oryUISpriteB) + oryUIOffsetY#)
//	endif
//endfunction

function OryUIPinSpriteToSprite(oryUISpriteA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetSpriteExists(oryUISpriteA) and GetSpriteExists(oryUISpriteB))
		SetSpritePositionByOffset(oryUISpriteA, GetSpriteX(oryUISpriteB) + oryUIOffsetX#, GetSpriteY(oryUISpriteB) + oryUIOffsetY#)
	endif
endfunction

function OryUIPinSpriteToTopCenterOfSprite(oryUISpriteA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	OryUIPinSpriteToTopCentreOfSprite(oryUISpriteA, oryUISpriteB, oryUIOffsetX#, oryUIOffsetY#)
endfunction

function OryUIPinSpriteToTopCentreOfSprite(oryUISpriteA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetSpriteExists(oryUISpriteA) and GetSpriteExists(oryUISpriteB))
		SetSpritePositionByOffset(oryUISpriteA, GetSpriteX(oryUISpriteB) + (GetSpriteWidth(oryUISpriteB) / 2) + oryUIOffsetX#, GetSpriteY(oryUISpriteB) + oryUIOffsetY#)
	endif
endfunction

function OryUIPinSpriteToTopLeftOfSprite(oryUISpriteA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetSpriteExists(oryUISpriteA) and GetSpriteExists(oryUISpriteB))
		SetSpritePositionByOffset(oryUISpriteA, GetSpriteX(oryUISpriteB) + oryUIOffsetX#, GetSpriteY(oryUISpriteB) + oryUIOffsetY#)
	endif
endfunction

function OryUIPinSpriteToTopRightOfSprite(oryUISpriteA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetSpriteExists(oryUISpriteA) and GetSpriteExists(oryUISpriteB))
		SetSpritePositionByOffset(oryUISpriteA, (GetSpriteX(oryUISpriteB) + GetSpriteWidth(oryUISpriteB)) - (GetSpriteWidth(oryUISpriteA) + oryUIOffsetX#), GetSpriteY(oryUISpriteB) + oryUIOffsetY#)
	endif
endfunction

function OryUIUpdateSprite(oryUISpriteID as integer, oryUIWidgetParameters$ as string)
	OryUISetParametersType(oryUIWidgetParameters$)

	if (GetSpriteExists(oryUISpriteID))
		if (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(oryUISpriteID, oryUIParameters.size#[1], oryUIParameters.size#[2])
		elseif (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] = -999999)
			SetSpriteSize(oryUISpriteID, oryUIParameters.size#[1], GetSpriteHeight(oryUISpriteID))
		elseif (oryUIParameters.size#[1] = -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(oryUISpriteID, GetSpriteWidth(oryUISpriteID), oryUIParameters.size#[2])
		endif
		if (oryUIParameters.angle# > -999999)
			SetSpriteAngle(oryUISpriteID, oryUIParameters.angle#)
		endif
		if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999)
			SetSpriteColor(oryUISpriteID, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], GetSpriteColorAlpha(oryUISpriteID))
		endif
		if (oryUIParameters.color#[4] > -999999)
			SetSpriteColorAlpha(oryUISpriteID, oryUIParameters.color#[4])
		endif
		if (oryUIParameters.depth > -999999)
			SetSpriteDepth(oryUISpriteID, oryUIParameters.depth)
		endif
		if (oryUIParameters.fixToScreen > -999999)
			FixSpriteToScreen(oryUISpriteID, oryUIParameters.fixToScreen)
		endif
		if (oryUIParameters.group > -999999)
			SetSpriteGroup(oryUISpriteID, oryUIParameters.group)
		endif
		if (oryUIParameters.imageID > 0)
			SetSpriteImage(oryUISpriteID, oryUIParameters.imageID)
		endif

		if (oryUIParameters.offsetTopLeft = 1)
			SetSpriteOffset(oryUISpriteID, 0, 0)
		elseif (oryUIParameters.offsetTopCenter = 1)
			SetSpriteOffset(oryUISpriteID, GetSpriteWidth(oryUISpriteID) / 2.0, 0)
		elseif (oryUIParameters.offsetTopRight = 1)
			SetSpriteOffset(oryUISpriteID, GetSpriteWidth(oryUISpriteID), 0)
		elseif (oryUIParameters.offsetCenterLeft = 1)
			SetSpriteOffset(oryUISpriteID, 0, GetSpriteHeight(oryUISpriteID) / 2.0)
		elseif (oryUIParameters.offsetCenter = 1)
			SetSpriteOffset(oryUISpriteID, GetSpriteWidth(oryUISpriteID) / 2.0, GetSpriteHeight(oryUISpriteID) / 2.0)
		elseif (oryUIParameters.offsetCenterRight = 1)
			SetSpriteOffset(oryUISpriteID, GetSpriteWidth(oryUISpriteID), GetSpriteHeight(oryUISpriteID) / 2.0)
		elseif (oryUIParameters.offsetBottomLeft = 1)
			SetSpriteOffset(oryUISpriteID, 0, GetSpriteHeight(oryUISpriteID))
		elseif (oryUIParameters.offsetBottomCenter = 1)
			SetSpriteOffset(oryUISpriteID, GetSpriteWidth(oryUISpriteID) / 2.0, GetSpriteHeight(oryUISpriteID))
		elseif (oryUIParameters.offsetBottomRight = 1)
			SetSpriteOffset(oryUISpriteID, GetSpriteWidth(oryUISpriteID), GetSpriteHeight(oryUISpriteID))
		else
			if (oryUIParameters.offset#[1] > -999999 or oryUIParameters.offset#[2] > -999999)
				SetSpriteOffset(oryUISpriteID, oryUIParameters.offset#[1], oryUIParameters.offset#[2])
			endif
		endif
		if (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(oryUISpriteID, oryUIParameters.position#[1], oryUIParameters.position#[2])
		elseif (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(oryUISpriteID, oryUIParameters.position#[1], GetSpriteYByOffset(oryUISpriteID))
		elseif (oryUIParameters.position#[1] = -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(oryUISpriteID, GetSpriteXByOffset(oryUISpriteID), oryUIParameters.position#[2])
		endif
		if (oryUIParameters.spriteShader > -999999)
			SetSpriteShader(oryUISpriteID, oryUIParameters.spriteShader)
		endif
	endif
endfunction

foldend
