
foldstart // OryUIProgressIndicator Widget

type typeOryUIProgressIndicator
	id as integer
	percentage# as float
	progressType$ as string
	sprTrack as integer
	sprIndicator as integer
endtype

global OryUIProgressIndicatorCollection as typeOryUIProgressIndicator[]
OryUIProgressIndicatorCollection.length = 1

function OryUIAnimateProgressIndicator(oryUIProgressIndicatorID as integer)
	local oryUIProgressSpeed as integer
	if (GetSpriteExists(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
		if (lower(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$) = "indeterminate")
			if (oryUIProgressSpeed = 0) then oryUIProgressSpeed = random(1, 6)
			SetSpriteX(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, GetSpriteX(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator) + oryUIProgressSpeed)
			if (GetSpriteX(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator) > GetSpriteX(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) + GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
				oryUIProgressSpeed = random(1, 6)
				SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator) + random2(-5, 5), GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
				if (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator) < (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 30)
					SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 30, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
				elseif (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator) > (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 70)
					SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 70, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
				endif	
				SetSpriteX(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, GetSpriteX(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) - GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator))
			endif
		endif
	endif
endfunction

function OryUICreateProgressIndicator(oryUIWidgetParameters$ as string)
	local oryUIProgressIndicatorID as integer
	OryUIProgressIndicatorCollection.length = OryUIProgressIndicatorCollection.length + 1
	oryUIProgressIndicatorID = OryUIProgressIndicatorCollection.length
	OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].id = oryUIProgressIndicatorID

	oryUICreatedWidgets.insert(OryUIAddCreatedWidget(oryUIProgressIndicatorID, "ProgressIndicator"))

	// DEFAULT SETTINGS
	OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$ = "Determinate"
	
	OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack = CreateSprite(0)
	SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, oryUIDefaults.progressIndicatorTrackWidth#, oryUIDefaults.progressIndicatorTrackHeight#)
	SetSpriteColor(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, oryUIDefaults.progressIndicatorTrackColor#[1], oryUIDefaults.progressIndicatorTrackColor#[2], oryUIDefaults.progressIndicatorTrackColor#[3], oryUIDefaults.progressIndicatorTrackColor#[4])
	SetSpriteOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, 0, 0)
	SetSpritePositionByOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, 0, 0)
	SetSpritePhysicsOff(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack)
	SetSpriteShapeBox(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, 0, 0, 0, 0, 0)

	OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator = CreateSprite(0)
	SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, 0, oryUIDefaults.progressIndicatorTrackHeight#)
	SetSpriteDepth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, GetSpriteDepth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) - 1)
	SetSpriteColor(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, oryUIDefaults.progressIndicatorColor#[1], oryUIDefaults.progressIndicatorColor#[2], oryUIDefaults.progressIndicatorColor#[3], oryUIDefaults.progressIndicatorColor#[4])
	SetSpriteOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, 0, 0)
	SetSpritePositionByOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, 0, 0)
	SetSpritePhysicsOff(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator)
	SetSpriteShapeBox(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, 0, 0, 0, 0, 0)
	
	if (oryUIWidgetParameters$ <> "") then OryUIUpdateProgressIndicator(oryUIProgressIndicatorID, oryUIWidgetParameters$)
endfunction oryUIProgressIndicatorID

function OryUIDeleteProgressIndicator(oryUIProgressIndicatorID as integer)
	DeleteSprite(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack)
	DeleteSprite(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator)
endfunction

function OryUIGetProgressIndicatorHeight(oryUIProgressIndicatorID as integer)
	local oryUIProgressIndicatorHeight# as float
	if (GetSpriteExists(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
		oryUIProgressIndicatorHeight# = GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack)
	endif
endfunction oryUIProgressIndicatorHeight#

function OryUIGetProgressIndicatorPercentage(oryUIProgressIndicatorID as integer)
	
endfunction OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].percentage#

function OryUIGetProgressIndicatorWidth(oryUIProgressIndicatorID as integer)
	local oryUIProgressIndicatorWidth# as float
	if (GetSpriteExists(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
		oryUIProgressIndicatorWidth# = GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack)
	endif
endfunction oryUIProgressIndicatorWidth#

function OryUIGetProgressIndicatorX(oryUIProgressIndicatorID as integer)
	local oryUIProgressIndicatorX# as float
	if (GetSpriteExists(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
		oryUIProgressIndicatorX# = GetSpriteX(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack)
	endif
endfunction oryUIProgressIndicatorX#

function OryUIGetProgressIndicatorY(oryUIProgressIndicatorID as integer)
	local oryUIProgressIndicatorY# as float
	if (GetSpriteExists(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
		oryUIProgressIndicatorY# = GetSpriteY(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack)
	endif
endfunction oryUIProgressIndicatorY#

function OryUISetProgressIndicatorPercentage(oryUIProgressIndicatorID as integer, oryUIPercentage# as float)
	if (oryUIPercentage# < 0) then oryUIPercentage# = 0
	if (oryUIPercentage# > 100) then oryUIPercentage# = 100
	OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].percentage# = oryUIPercentage#
	if (GetSpriteExists(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
		SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100.0) * oryUIPercentage#, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator))
	endif
endfunction

function OryUIUpdateProgressIndicator(oryUIProgressIndicatorID as integer, oryUIWidgetParameters$ as string)
	OryUISetParametersType(oryUIWidgetParameters$)

	local oryUIForI as integer
	
	if (GetSpriteExists(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
		
		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE WIDGET
		if (oryUIParameters.progressType$ <> "")
			OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$ = oryUIParameters.progressType$
			if (lower(oryUIParameters.progressType$) = "circular")
				SetSpriteColorAlpha(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, 0)
				ClearSpriteAnimationFrames(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator)
				for oryUIForI = 1 to 100
					if (oryUIDefaults.progressIndicatorAnimationFrame[oryUIForI] > 0)
						AddSpriteAnimationFrame(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, oryUIDefaults.progressIndicatorAnimationFrame[oryUIForI])
					endif
				next
				PlaySprite(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, oryUIDefaults.progressIndicatorAnimationFPS)
			endif
		endif
		if (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, oryUIParameters.size#[1], oryUIParameters.size#[2])
			if (lower(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$) = "circular") then SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack), GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
			if (lower(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$) = "determinate") then SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 60, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
			if (lower(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$) = "indeterminate") then SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 45, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
		elseif (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] = -999999)
			SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, oryUIParameters.size#[1], GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
			if (lower(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$) = "circular") then SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack), GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
			if (lower(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$) = "determinate") then SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 60, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
			if (lower(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$) = "indeterminate") then SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 45, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
		elseif (oryUIParameters.size#[1] = -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack), oryUIParameters.size#[2])
			if (lower(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$) = "circular") then SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack), GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
			if (lower(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$) = "determinate") then SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 60, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
			if (lower(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$) = "indeterminate") then SetSpriteSize(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, (GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 100) * 45, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
		endif
		if (oryUIParameters.offsetCenter = 1)
			SetSpriteOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 2, GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) / 2)
		else
			if (oryUIParameters.offset#[1] > -999999 or oryUIParameters.offset#[2] > -999999)
				SetSpriteOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, oryUIParameters.offset#[1], oryUIParameters.offset#[2])
			endif
		endif
		if (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, oryUIParameters.position#[1], oryUIParameters.position#[2])
			OryUIPinSpriteToSprite(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, 0, 0)
		elseif (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, oryUIParameters.position#[1], GetSpriteYByOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
			OryUIPinSpriteToSprite(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, 0, 0)
		elseif (oryUIParameters.position#[1] = -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, GetSpriteXByOffset(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack), oryUIParameters.position#[2])
			OryUIPinSpriteToSprite(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, 0, 0)
		endif

		// THE REST OF THE PARAMETERS NEXT
		if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999 or oryUIParameters.color#[4] > -999999)
			if (lower(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$) = "circular")
				SetSpriteColor(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], 0)
				SetSpriteColor(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], 255)
			else
				SetSpriteColor(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], 64)
				SetSpriteColor(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], 255)
			endif	
		endif
		if (oryUIParameters.depth > -999999)
			SetSpriteDepth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, oryUIParameters.depth)
			SetSpriteDepth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, oryUIParameters.depth - 1)
		endif
		if (oryUIParameters.fixToScreen = 1)
			FixSpriteToScreen(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, 1)
			FixSpriteToScreen(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, 1)
		endif
		if (oryUIParameters.indicatorColor#[1] > -999999 or oryUIParameters.indicatorColor#[2] > -999999 or oryUIParameters.indicatorColor#[3] > -999999 or oryUIParameters.indicatorColor#[4] > -999999)
			SetSpriteColor(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, oryUIParameters.indicatorColor#[1], oryUIParameters.indicatorColor#[2], oryUIParameters.indicatorColor#[3], oryUIParameters.indicatorColor#[4])
		endif
		if (oryUIParameters.trackColor#[1] > -999999 or oryUIParameters.trackColor#[2] > -999999 or oryUIParameters.trackColor#[3] > -999999 or oryUIParameters.trackColor#[4] > -999999)
			//if (lower(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].progressType$) <> "circular")
			SetSpriteColor(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack, oryUIParameters.trackColor#[1], oryUIParameters.trackColor#[2], oryUIParameters.trackColor#[3], oryUIParameters.trackColor#[4])
			//endif	
		endif

		SetSpriteScissor(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprIndicator, GetSpriteX(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack), GetSpriteY(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack), GetSpriteX(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) + GetSpriteWidth(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack), GetSpriteY(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack) + GetSpriteHeight(OryUIProgressIndicatorCollection[oryUIProgressIndicatorID].sprTrack))
	endif
endfunction

foldend
