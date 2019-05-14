
foldstart // OryUISprite (Updated 21/04/2019)

function OryUICreateSprite(oryUIComponentParameters$ as string)
	local oryUISpriteID
	oryUISpriteID = CreateSprite(0)
	SetSpriteOffset(oryUISpriteID, 0, 0)
	
	if (oryUIComponentParameters$ <> "") then OryUIUpdateSprite(oryUISpriteID, oryUIComponentParameters$)
endfunction oryUISpriteID

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

function OryUIPinSpriteToCentreTopOfSprite(oryUISpriteA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetSpriteExists(oryUISpriteA) and GetSpriteExists(oryUISpriteB))
		SetSpritePositionByOffset(oryUISpriteA, GetSpriteX(oryUISpriteB) + (GetSpriteWidth(oryUISpriteB) / 2), GetSpriteY(oryUISpriteB) + oryUIOffsetY#)
	endif
endfunction

function OryUIPinSpriteToSprite(oryUISpriteA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetSpriteExists(oryUISpriteA) and GetSpriteExists(oryUISpriteB))
		SetSpritePositionByOffset(oryUISpriteA, GetSpriteX(oryUISpriteB) + oryUIOffsetX#, GetSpriteY(oryUISpriteB) + oryUIOffsetY#)
	endif
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

function OryUIUpdateSprite(oryUISpriteID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(oryUISpriteID))
		if (OryUIParameters.size#[1] > -999999 and OryUIParameters.size#[2] > -999999)
			SetSpriteSize(oryUISpriteID, OryUIParameters.size#[1], OryUIParameters.size#[2])
		elseif (OryUIParameters.size#[1] > -999999 and OryUIParameters.size#[2] = -999999)
			SetSpriteSize(oryUISpriteID, OryUIParameters.size#[1], GetSpriteHeight(oryUISpriteID))
		elseif (OryUIParameters.size#[1] = -999999 and OryUIParameters.size#[2] > -999999)
			SetSpriteSize(oryUISpriteID, GetSpriteWidth(oryUISpriteID), OryUIParameters.size#[2])
		endif
		if (OryUIParameters.angle# > -999999)
			SetSpriteAngle(oryUISpriteID, OryUIParameters.angle#)
		endif
		if (OryUIParameters.color#[1] > -999999 or OryUIParameters.color#[2] > -999999 or OryUIParameters.color#[3] > -999999)
			SetSpriteColor(oryUISpriteID, OryUIParameters.color#[1], OryUIParameters.color#[2], OryUIParameters.color#[3], GetSpriteColorAlpha(oryUISpriteID))
		endif
		if (OryUIParameters.color#[4] > -999999)
			SetSpriteColorAlpha(oryUISpriteID, OryUIParameters.color#[4])
		endif
		if (OryUIParameters.depth > -999999)
			SetSpriteDepth(oryUISpriteID, OryUIParameters.depth)
		endif
		if (OryUIParameters.fixToScreen > -999999)
			FixSpriteToScreen(oryUISpriteID, OryUIParameters.fixToScreen)
		endif
		if (OryUIParameters.group > -999999)
			SetSpriteGroup(oryUISpriteID, OryUIParameters.group)
		endif
		if (OryUIParameters.imageID > 0)
			SetSpriteImage(oryUISpriteID, OryUIParameters.imageID)
		endif
		if (OryUIParameters.offsetCenter = 1)
			SetSpriteOffset(oryUISpriteID, GetSpriteWidth(oryUISpriteID) / 2, GetSpriteHeight(oryUISpriteID) / 2)
		else
			if (OryUIParameters.offset#[1] > -999999 or OryUIParameters.offset#[2] > -999999)
				SetSpriteOffset(oryUISpriteID, OryUIParameters.offset#[1], OryUIParameters.offset#[2])
			endif
		endif
		if (OryUIParameters.position#[1] > -999999 and OryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(oryUISpriteID, OryUIParameters.position#[1], OryUIParameters.position#[2])
		elseif (OryUIParameters.position#[1] > -999999 and OryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(oryUISpriteID, OryUIParameters.position#[1], GetSpriteYByOffset(oryUISpriteID))
		elseif (OryUIParameters.position#[1] = -999999 and OryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(oryUISpriteID, GetSpriteXByOffset(oryUISpriteID), OryUIParameters.position#[2])
		endif
		if (OryUIParameters.spriteShader > -999999)
			SetSpriteShader(oryUISpriteID, OryUIParameters.spriteShader)
		endif
	endif
endfunction

foldend
