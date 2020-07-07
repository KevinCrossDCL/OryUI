
foldstart // OryUISprite (Updated 07/07/2020)

function OryUICreateSprite(oryUIComponentParameters$ as string)
	local oryUISpriteID as integer
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
		if (oryUIParameters.offsetCenter = 1)
			SetSpriteOffset(oryUISpriteID, GetSpriteWidth(oryUISpriteID) / 2, GetSpriteHeight(oryUISpriteID) / 2)
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
