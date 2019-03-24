
foldstart // OryUIProgressIndicator Component (Updated 23/03/2019)

type typeOryUIProgressIndicator
	id as integer
	progressType$ as string
	sprTrack as integer
	sprIndicator as integer
endtype

global OryUIProgressIndicatorCollection as typeOryUIProgressIndicator[]
OryUIProgressIndicatorCollection.length = 1

function OryUIAnimateProgressIndicator(oryUIProgressIndicatorID as integer)
	local oryUIProgressSpeed as integer
	if (GetSpriteExists(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
		if (oryUIProgressSpeed = 0) then oryUIProgressSpeed = random(1, 6)
		SetSpriteX(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, GetSpriteX(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator) + oryUIProgressSpeed)
		if (GetSpriteX(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator) > GetSpriteX(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) + GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
			oryUIProgressSpeed = random(1, 6)
			SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator) + random2(-5, 5), GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator))
			if (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator) < (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 30)
				SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 30, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator))
			elseif (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator) > (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 70)
				SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 70, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator))
			endif	
			SetSpriteX(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, GetSpriteX(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) - GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator))
		endif
	endif
endfunction

function OryUICreateProgressIndicator(oryUIComponentParameters$ as string)
	local oryUIProgressIndicatorID as integer
	OryUIProgressIndicatorCollection.length = OryUIProgressIndicatorCollection.length + 1
	oryUIProgressIndicatorID = OryUIProgressIndicatorCollection.length
	OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].id = oryUIProgressIndicatorID

	// DEFAULT SETTINGS
	OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$ = "Determinate"
	
	OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack = CreateSprite(0)
	SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, 66, 1)
	SetSpriteColor(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, 229, 229, 229, 64)
	SetSpriteOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, 0, 0)
	SetSpritePositionByOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, 0, 0)

	OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator = CreateSprite(0)
	SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, 40, 1)
	SetSpriteDepth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, GetSpriteDepth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) - 1)
	SetSpriteColor(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, 229, 229, 229, 255)
	SetSpriteOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, 0, 0)
	SetSpritePositionByOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, 0, 0)

	if (oryUIComponentParameters$ <> "") then OryUIUpdateProgressIndicator(oryUIProgressIndicatorID, oryUIComponentParameters$)
endfunction oryUIProgressIndicatorID

function OryUIDeleteProgressIndicator(oryUIProgressIndicatorID as integer)
	DeleteSprite(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack)
	DeleteSprite(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator)
endfunction

function OryUIGetProgressIndicatorHeight(oryUIProgressIndicatorID as integer)
	local oryUIProgressIndicatorHeight#
	if (GetSpriteExists(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
		oryUIProgressIndicatorHeight# = GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack)
	endif
endfunction oryUIProgressIndicatorHeight#

function OryUISetProgressIndicatorPercentage(OryUIProgressIndicatorID as integer, oryUIPercentage# as float)
	if (GetSpriteExists(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
		SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100.0) * oryUIPercentage#, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator))
	endif
endfunction

function OryUIUpdateProgressIndicator(oryUIProgressIndicatorID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
		
		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
		if (OryUIParameters.progressType$ <> "")
			OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$ = OryUIParameters.progressType$
		endif
		if (OryUIParameters.size#[1] > -999999 and OryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, OryUIParameters.size#[1], OryUIParameters.size#[2])
			if (lower(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$) = "determinate") then SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 60, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
			if (lower(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$) = "indeterminate") then SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 45, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
		elseif (OryUIParameters.size#[1] > -999999 and OryUIParameters.size#[2] = -999999)
			SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, OryUIParameters.size#[1], GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
			if (lower(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$) = "determinate") then SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 60, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
			if (lower(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$) = "indeterminate") then SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 45, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
		elseif (OryUIParameters.size#[1] = -999999 and OryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack), OryUIParameters.size#[2])
			if (lower(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$) = "determinate") then SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 60, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
			if (lower(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$) = "indeterminate") then SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 45, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
		endif
		if (OryUIParameters.offsetCenter = 1)
			SetSpriteOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 2, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 2)
		else
			if (OryUIParameters.offset#[1] > -999999 or OryUIParameters.offset#[2] > -999999)
				SetSpriteOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, OryUIParameters.offset#[1], OryUIParameters.offset#[2])
			endif
		endif
		if (OryUIParameters.position#[1] > -999999 and OryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, OryUIParameters.position#[1], OryUIParameters.position#[2])
			OryUIPinSpriteToSprite(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, 0, 0)
		elseif (OryUIParameters.position#[1] > -999999 and OryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, OryUIParameters.position#[1], GetSpriteYByOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
			OryUIPinSpriteToSprite(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, 0, 0)
		elseif (OryUIParameters.position#[1] = -999999 and OryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, GetSpriteXByOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack), OryUIParameters.position#[2])
			OryUIPinSpriteToSprite(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, 0, 0)
		endif

		// THE REST OF THE PARAMETERS NEXT
		if (OryUIParameters.color#[1] > -999999 or OryUIParameters.color#[2] > -999999 or OryUIParameters.color#[3] > -999999 or OryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, OryUIParameters.color#[1], OryUIParameters.color#[2], OryUIParameters.color#[3], 64)
			SetSpriteColor(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, OryUIParameters.color#[1], OryUIParameters.color#[2], OryUIParameters.color#[3], 255)
		endif
		if (OryUIParameters.depth > -999999)
			SetSpriteDepth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, OryUIParameters.depth)
			SetSpriteDepth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, OryUIParameters.depth - 1)
		endif
		if (OryUIParameters.fixToScreen = 1)
			FixSpriteToScreen(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, 1)
			FixSpriteToScreen(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, 1)
		endif

		SetSpriteScissor(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, GetSpriteX(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack), GetSpriteY(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack), GetSpriteX(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) + GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack), GetSpriteY(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) + GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
	endif
endfunction

foldend
