
foldstart // OryUISwitch Widget

type typeOryUISwitch
	id as integer
	checked as integer
	checkedChange as integer
	held as integer
	pressed as integer
	released as integer
	sprContainer as integer
	sprSwitch as integer
	sprTrack as integer
	switchCheckedColor# as float[4]
	switchCheckedImageID as integer
	switchSize# as float[2]
	switchUncheckedColor# as float[4]
	switchUncheckedImageID as integer
	timePressed# as float
	trackCheckedColor# as float[4]
	trackCheckedImageID as integer
	trackSize# as float[2]
	trackUncheckedColor# as float[4]
	trackUncheckedImageID as integer
	visible as integer
endtype

global OryUISwitchCollection as typeOryUISwitch[]
OryUISwitchCollection.length = 1

function OryUIColorAndPositionSwitch(oryUISwitchID as integer)
	if (GetSpriteExists(OryUISwitchCollection[oryUISwitchID].sprContainer))
		SetSpriteOffset(OryUISwitchCollection[oryUISwitchID].sprTrack, GetSpriteWidth(OryUISwitchCollection[oryUISwitchID].sprTrack) / 2.0, GetSpriteHeight(OryUISwitchCollection[oryUISwitchID].sprTrack) / 2.0)
		OryUIPinSpriteToCenterOfSprite(OryUISwitchCollection[oryUISwitchID].sprTrack, OryUISwitchCollection[oryUISwitchID].sprContainer, 0, 0)
		if (OryUISwitchCollection[oryUISwitchID].checked = 0)
			SetSpriteOffset(OryUISwitchCollection[oryUISwitchID].sprSwitch, 0, GetSpriteHeight(OryUISwitchCollection[oryUISwitchID].sprSwitch) / 2.0)
			OryUIPinSpriteToCenterLeftOfSprite(OryUISwitchCollection[oryUISwitchID].sprSwitch, OryUISwitchCollection[oryUISwitchID].sprTrack, 0, 0)
			SetSpriteColor(OryUISwitchCollection[oryUISwitchID].sprTrack, OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[1], OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[2], OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[3], OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[4])
			SetSpriteColor(OryUISwitchCollection[oryUISwitchID].sprSwitch, OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[1], OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[2], OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[3], OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[4])
			if (OryUISwitchCollection[oryUISwitchID].trackUncheckedImageID > 0 and OryUISwitchCollection[oryUISwitchID].switchUncheckedImageID > 0 and OryUISwitchCollection[oryUISwitchID].trackUncheckedImageID <> OryUISwitchCollection[oryUISwitchID].switchUncheckedImageID)
				SetSpriteColor(OryUISwitchCollection[oryUISwitchID].sprTrack, 255, 255, 255, 255)
				SetSpriteImage(OryUISwitchCollection[oryUISwitchID].sprTrack, OryUISwitchCollection[oryUISwitchID].trackUncheckedImageID)
				SetSpriteColor(OryUISwitchCollection[oryUISwitchID].sprSwitch, 255, 255, 255, 255)
				SetSpriteImage(OryUISwitchCollection[oryUISwitchID].sprSwitch, OryUISwitchCollection[oryUISwitchID].switchUncheckedImageID)
			endif
		else
			SetSpriteOffset(OryUISwitchCollection[oryUISwitchID].sprSwitch, GetSpriteWidth(OryUISwitchCollection[oryUISwitchID].sprSwitch), GetSpriteHeight(OryUISwitchCollection[oryUISwitchID].sprSwitch) / 2.0)
			OryUIPinSpriteToCenterRightOfSprite(OryUISwitchCollection[oryUISwitchID].sprSwitch, OryUISwitchCollection[oryUISwitchID].sprTrack, 0, 0)
			SetSpriteColor(OryUISwitchCollection[oryUISwitchID].sprTrack, OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[1], OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[2], OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[3], OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[4])
			SetSpriteColor(OryUISwitchCollection[oryUISwitchID].sprSwitch, OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[1], OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[2], OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[3], OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[4])
			if (OryUISwitchCollection[oryUISwitchID].trackCheckedImageID > 0 and OryUISwitchCollection[oryUISwitchID].switchCheckedImageID > 0 and OryUISwitchCollection[oryUISwitchID].trackCheckedImageID <> OryUISwitchCollection[oryUISwitchID].switchCheckedImageID)
				SetSpriteColor(OryUISwitchCollection[oryUISwitchID].sprTrack, 255, 255, 255, 255)
				SetSpriteImage(OryUISwitchCollection[oryUISwitchID].sprTrack, OryUISwitchCollection[oryUISwitchID].trackCheckedImageID)
				SetSpriteColor(OryUISwitchCollection[oryUISwitchID].sprSwitch, 255, 255, 255, 255)
				SetSpriteImage(OryUISwitchCollection[oryUISwitchID].sprSwitch, OryUISwitchCollection[oryUISwitchID].switchCheckedImageID)
			endif
		endif
	endif
endfunction

function OryUICreateSwitch(oryUIWidgetParameters$ as string)
	local oryUISwitchID as integer
	OryUISwitchCollection.length = OryUISwitchCollection.length + 1
	oryUISwitchID = OryUISwitchCollection.length
	OryUISwitchCollection[oryUISwitchID].id = oryUISwitchID

	oryUICreatedWidgets.insert(OryUIAddCreatedWidget(oryUISwitchID, "Switch"))

	// DEFAULT SETTINGS
	OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[1] = oryUIDefaults.switchCheckedColor#[1]
	OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[2] = oryUIDefaults.switchCheckedColor#[2]
	OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[3] = oryUIDefaults.switchCheckedColor#[3]
	OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[4] = oryUIDefaults.switchCheckedColor#[4]
	OryUISwitchCollection[oryUISwitchID].switchSize#[1] = oryUIDefaults.switchWidth#
	OryUISwitchCollection[oryUISwitchID].switchSize#[2] = oryUIDefaults.switchHeight#
	OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[1] = oryUIDefaults.switchUncheckedColor#[1]
	OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[2] = oryUIDefaults.switchUncheckedColor#[2]
	OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[3] = oryUIDefaults.switchUncheckedColor#[3]
	OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[4] = oryUIDefaults.switchUncheckedColor#[4]
	OryUISwitchCollection[oryUISwitchID].checked = 0
	OryUISwitchCollection[oryUISwitchID].held = 0
	OryUISwitchCollection[oryUISwitchID].pressed = 0
	OryUISwitchCollection[oryUISwitchID].released = 0
	OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[1] = oryUIDefaults.switchTrackCheckedColor#[1]
	OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[2] = oryUIDefaults.switchTrackCheckedColor#[2]
	OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[3] = oryUIDefaults.switchTrackCheckedColor#[3]
	OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[4] = oryUIDefaults.switchTrackCheckedColor#[4]
	OryUISwitchCollection[oryUISwitchID].trackSize#[1] = oryUIDefaults.switchTrackWidth#
	OryUISwitchCollection[oryUISwitchID].trackSize#[2] = oryUIDefaults.switchTrackHeight#
	OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[1] = oryUIDefaults.switchTrackUncheckedColor#[1]
	OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[2] = oryUIDefaults.switchTrackUncheckedColor#[2]
	OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[3] = oryUIDefaults.switchTrackUncheckedColor#[3]
	OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[4] = oryUIDefaults.switchTrackUncheckedColor#[4]
	OryUISwitchCollection[oryUISwitchID].visible = 1

	OryUISwitchCollection[oryUISwitchID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUISwitchCollection[oryUISwitchID].sprContainer, oryUIDefaults.switchTrackWidth#, oryUIDefaults.switchHeight#)
	SetSpriteDepth(OryUISwitchCollection[oryUISwitchID].sprContainer, oryUIDefaults.switchTrackDepth)
	SetSpriteColor(OryUISwitchCollection[oryUISwitchID].sprContainer, 0, 0, 0, 0)
	SetSpriteOffset(OryUISwitchCollection[oryUISwitchID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUISwitchCollection[oryUISwitchID].sprContainer, 0, 0)
	SetSpritePhysicsOff(OryUISwitchCollection[oryUISwitchID].sprContainer)

	OryUISwitchCollection[oryUISwitchID].sprTrack = CreateSprite(0)
	SetSpriteSize(OryUISwitchCollection[oryUISwitchID].sprTrack, oryUIDefaults.switchTrackWidth#, oryUIDefaults.switchTrackHeight#)
	SetSpriteDepth(OryUISwitchCollection[oryUISwitchID].sprTrack, oryUIDefaults.switchTrackDepth)
	SetSpriteColor(OryUISwitchCollection[oryUISwitchID].sprTrack, oryUIDefaults.switchTrackUncheckedColor#[1], oryUIDefaults.switchTrackUncheckedColor#[2], oryUIDefaults.switchTrackUncheckedColor#[3], oryUIDefaults.switchTrackUncheckedColor#[4])
	SetSpriteOffset(OryUISwitchCollection[oryUISwitchID].sprTrack, 0, 0)
	SetSpritePositionByOffset(OryUISwitchCollection[oryUISwitchID].sprTrack, 0, 0)
	SetSpritePhysicsOff(OryUISwitchCollection[oryUISwitchID].sprTrack)

	OryUISwitchCollection[oryUISwitchID].sprSwitch = CreateSprite(0)
	SetSpriteSize(OryUISwitchCollection[oryUISwitchID].sprSwitch, oryUIDefaults.switchWidth#, oryUIDefaults.switchHeight#)
	SetSpriteDepth(OryUISwitchCollection[oryUISwitchID].sprSwitch, oryUIDefaults.switchTrackDepth - 2)
	SetSpriteColor(OryUISwitchCollection[oryUISwitchID].sprSwitch, oryUIDefaults.switchUncheckedColor#[1], oryUIDefaults.switchUncheckedColor#[2], oryUIDefaults.switchUncheckedColor#[3], oryUIDefaults.switchUncheckedColor#[4])
	SetSpriteOffset(OryUISwitchCollection[oryUISwitchID].sprSwitch, 0, 0)
	SetSpritePositionByOffset(OryUISwitchCollection[oryUISwitchID].sprSwitch, 0, 0)
	SetSpritePhysicsOff(OryUISwitchCollection[oryUISwitchID].sprSwitch)

	if (oryUIWidgetParameters$ <> "") then OryUIUpdateSwitch(oryUISwitchID, oryUIWidgetParameters$)
endfunction oryUISwitchID

function OryUIDeleteSwitch(oryUISwitchID as integer)
	DeleteSprite(OryUISwitchCollection[oryUISwitchID].sprContainer)
	DeleteSprite(OryUISwitchCollection[oryUISwitchID].sprSwitch)
	DeleteSprite(OryUISwitchCollection[oryUISwitchID].sprTrack)
endfunction

function OryUIGetSwitchChecked(oryUISwitchID as integer)

endfunction OryUISwitchCollection[oryUISwitchID].checked

function OryUIGetSwitchHeight(oryUISwitchID as integer)
	local oryUISwitchHeight# as float

	if (GetSpriteExists(OryUISwitchCollection[oryUISwitchID].sprContainer))
		oryUISwitchHeight# = GetSpriteHeight(OryUISwitchCollection[oryUISwitchID].sprContainer)
	endif
endfunction oryUISwitchHeight#

function OryUIGetSwitchVisible(oryUISwitchID as integer)

endfunction OryUISwitchCollection[oryUISwitchID].visible

function OryUIGetSwitchWidth(oryUISwitchID as integer)
	local oryUISwitchWidth# as float

	if (GetSpriteExists(OryUISwitchCollection[oryUISwitchID].sprContainer))
		oryUISwitchWidth# = GetSpriteWidth(OryUISwitchCollection[oryUISwitchID].sprContainer)
	endif
endfunction oryUISwitchWidth#

function OryUIGetSwitchX(oryUISwitchID as integer)
	local oryUISwitchX# as float
	if (OryUISwitchCollection[oryUISwitchID].visible = 1)
		oryUISwitchX# = GetSpriteX(OryUISwitchCollection[oryUISwitchID].sprContainer)
	endif
endfunction oryUISwitchX#

function OryUIGetSwitchY(oryUISwitchID as integer)
	local oryUISwitchY# as float
	if (OryUISwitchCollection[oryUISwitchID].visible = 1)
		oryUISwitchY# = GetSpriteY(OryUISwitchCollection[oryUISwitchID].sprContainer)
	endif
endfunction oryUISwitchY#

function OryUIInsertSwitchListener(oryUISwitchID as integer)
	OryUISwitchListener(oryUISwitchID)
endfunction

function OryUISwitchListener(oryUISwitchID as integer)
	local oryUISwitchContainerSprite as integer
	local oryUISwitchTrackSprite as integer
	local oryUISwitchSwitchSprite as integer

	if (GetSpriteExists(OryUISwitchCollection[oryUISwitchID].sprTrack))
		if (OryUIGetSwipingVertically() = 0 and OryUIGetSwipingHorizontally() = 0 )
			oryUISwitchContainerSprite = GetSpriteHitTest(OryUISwitchCollection[oryUISwitchID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			oryUISwitchTrackSprite = GetSpriteHitTest(OryUISwitchCollection[oryUISwitchID].sprTrack, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			oryUISwitchSwitchSprite = GetSpriteHitTest(OryUISwitchCollection[oryUISwitchID].sprSwitch, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			OryUISwitchCollection[oryUISwitchID].released = 0	
			if (GetPointerPressed())
				OryUISwitchCollection[oryUISwitchID].held = 0
				OryUISwitchCollection[oryUISwitchID].pressed = 0
				if (oryUISwitchContainerSprite = 1 or oryUISwitchTrackSprite = 1 or oryUISwitchSwitchSprite = 1)
					OryUISwitchCollection[oryUISwitchID].pressed = 1
					OryUISwitchCollection[oryUISwitchID].timePressed# = timer()
				endif
			elseif (OryUISwitchCollection[oryUISwitchID].pressed)
				if (GetPointerState())
					if (timer() - OryUISwitchCollection[oryUISwitchID].timePressed# >= 0.4 and (oryUISwitchContainerSprite = 1 or oryUISwitchTrackSprite = 1 or oryUISwitchSwitchSprite = 1))
						OryUISwitchCollection[oryUISwitchID].held = 1
					endif
				endif
				if (GetPointerReleased())
					OryUISwitchCollection[oryUISwitchID].held = 0
					if (oryUISwitchContainerSprite = 1 or oryUISwitchTrackSprite = 1 or oryUISwitchSwitchSprite = 1)
						OryUISwitchCollection[oryUISwitchID].released = 1
						if (OryUISwitchCollection[oryUISwitchID].checked = 0)
							OryUISwitchCollection[oryUISwitchID].checked = 1
						else
							OryUISwitchCollection[oryUISwitchID].checked = 0
						endif
						OryUISwitchCollection[oryUISwitchID].checkedChange = 1
					else
						OryUISwitchCollection[oryUISwitchID].released = 0
					endif
				endif
			endif
		else
			OryUISwitchCollection[oryUISwitchID].pressed = 0
			OryUISwitchCollection[oryUISwitchID].held = 0
			OryUISwitchCollection[oryUISwitchID].released = 0
		endif
	
		if ((oryUIScrimVisible = 1 and GetSpriteDepth(OryUISwitchCollection[oryUISwitchID].sprContainer) >= oryUIScrimDepth) or oryUITouchingTopBar = 1 or oryUITouchingTabs = 1)
			OryUISwitchCollection[oryUISwitchID].pressed = 0
			OryUISwitchCollection[oryUISwitchID].held = 0
			OryUISwitchCollection[oryUISwitchID].released = 0
		endif
	endif

	OryUIColorAndPositionSwitch(oryUISwitchID)
endfunction

function OryUIUpdateSwitch(oryUISwitchID as integer, oryUIWidgetParameters$ as string)
	OryUISetParametersType(oryUIWidgetParameters$)

	if (GetSpriteExists(OryUISwitchCollection[oryUISwitchID].sprContainer))
		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE WIDGET
		if (lower(oryUIParameters.platformStyle$) = "android")
			SetSpriteSize(OryUISwitchCollection[oryUISwitchID].sprContainer, 12, 3.2)
			SetSpriteSize(OryUISwitchCollection[oryUISwitchID].sprTrack, 12, 3)
			SetSpriteImage(OryUISwitchCollection[oryUISwitchID].sprTrack, oryUISwitchTrackAndroidImage)
			OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[1] = 189
			OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[2] = 161
			OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[3] = 243
			OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[4] = 255
			OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[1] = 158
			OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[2] = 158
			OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[3] = 158
			OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[4] = 158
			SetSpriteSize(OryUISwitchCollection[oryUISwitchID].sprSwitch, -1, 3.2)
			SetSpriteImage(OryUISwitchCollection[oryUISwitchID].sprSwitch, oryUISwitchSwitchAndroidImage)
			OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[1] = 87
			OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[2] = 37
			OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[3] = 229
			OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[4] = 255
			OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[1] = 255
			OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[2] = 255
			OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[3] = 255
			OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[4] = 255
		endif
		if (lower(oryUIParameters.platformStyle$) = "ios")
			SetSpriteSize(OryUISwitchCollection[oryUISwitchID].sprContainer, 15, 4.2)
			SetSpriteSize(OryUISwitchCollection[oryUISwitchID].sprTrack, 15, 4.2)
			SetSpriteImage(OryUISwitchCollection[oryUISwitchID].sprTrack, oryUISwitchTrackIOSImage)
			OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[1] = 137
			OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[2] = 188
			OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[3] = 105
			OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[4] = 255
			OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[1] = 215
			OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[2] = 215
			OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[3] = 215
			OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[4] = 255
			SetSpriteSize(OryUISwitchCollection[oryUISwitchID].sprSwitch, -1, 4)
			SetSpriteImage(OryUISwitchCollection[oryUISwitchID].sprSwitch, oryUISwitchSwitchIOSImage)
			OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[1] = 255
			OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[2] = 255
			OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[3] = 255
			OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[4] = 255
			OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[1] = 255
			OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[2] = 255
			OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[3] = 255
			OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[4] = 255
		endif

		if (oryUIParameters.switchSize#[1] > -999999 and oryUIParameters.switchSize#[2] > -999999)
			SetSpriteSize(OryUISwitchCollection[oryUISwitchID].sprSwitch, oryUIParameters.switchSize#[1], oryUIParameters.switchSize#[2])
			SetSpriteSize(OryUISwitchCollection[oryUISwitchID].sprContainer, GetSpriteWidth(OryUISwitchCollection[oryUISwitchID].sprContainer), oryUIParameters.switchSize#[2])
		elseif (oryUIParameters.switchSize#[1] > -999999 and oryUIParameters.switchSize#[2] = -999999)
			SetSpriteSize(OryUISwitchCollection[oryUISwitchID].sprSwitch, oryUIParameters.switchSize#[1], GetSpriteHeight(OryUISwitchCollection[oryUISwitchID].sprSwitch))
		elseif (oryUIParameters.switchSize#[1] = -999999 and oryUIParameters.switchSize#[2] > -999999)
			SetSpriteSize(OryUISwitchCollection[oryUISwitchID].sprSwitch, GetSpriteWidth(OryUISwitchCollection[oryUISwitchID].sprSwitch), oryUIParameters.switchSize#[2])
			SetSpriteSize(OryUISwitchCollection[oryUISwitchID].sprContainer, GetSpriteWidth(OryUISwitchCollection[oryUISwitchID].sprContainer), oryUIParameters.switchSize#[2])
		endif
		if (oryUIParameters.trackSize#[1] > -999999 and oryUIParameters.trackSize#[2] > -999999)
			SetSpriteSize(OryUISwitchCollection[oryUISwitchID].sprTrack, oryUIParameters.trackSize#[1], oryUIParameters.trackSize#[2])
			SetSpriteSize(OryUISwitchCollection[oryUISwitchID].sprContainer, oryUIParameters.trackSize#[1], GetSpriteHeight(OryUISwitchCollection[oryUISwitchID].sprContainer))
		elseif (oryUIParameters.trackSize#[1] > -999999 and oryUIParameters.trackSize#[2] = -999999)
			SetSpriteSize(OryUISwitchCollection[oryUISwitchID].sprTrack, oryUIParameters.trackSize#[1], GetSpriteHeight(OryUISwitchCollection[oryUISwitchID].sprTrack))
			SetSpriteSize(OryUISwitchCollection[oryUISwitchID].sprContainer, oryUIParameters.trackSize#[1], GetSpriteHeight(OryUISwitchCollection[oryUISwitchID].sprContainer))
		elseif (oryUIParameters.trackSize#[1] = -999999 and oryUIParameters.trackSize#[2] > -999999)
			SetSpriteSize(OryUISwitchCollection[oryUISwitchID].sprTrack, GetSpriteWidth(OryUISwitchCollection[oryUISwitchID].sprTrack), oryUIParameters.trackSize#[2])
		endif
		if (oryUIParameters.offsetTopLeft = 1)
			SetSpriteOffset(OryUISwitchCollection[oryUISwitchID].sprContainer, 0, 0)
		elseif (oryUIParameters.offsetTopCenter = 1)
			SetSpriteOffset(OryUISwitchCollection[oryUISwitchID].sprContainer, GetSpriteWidth(OryUISwitchCollection[oryUISwitchID].sprContainer) / 2.0, 0)
		elseif (oryUIParameters.offsetTopRight = 1)
			SetSpriteOffset(OryUISwitchCollection[oryUISwitchID].sprContainer, GetSpriteWidth(OryUISwitchCollection[oryUISwitchID].sprContainer), 0)
		elseif (oryUIParameters.offsetCenterLeft = 1)
			SetSpriteOffset(OryUISwitchCollection[oryUISwitchID].sprContainer, 0, GetSpriteHeight(OryUISwitchCollection[oryUISwitchID].sprContainer) / 2.0)
		elseif (oryUIParameters.offsetCenter = 1)
			SetSpriteOffset(OryUISwitchCollection[oryUISwitchID].sprContainer, GetSpriteWidth(OryUISwitchCollection[oryUISwitchID].sprContainer) / 2.0, GetSpriteHeight(OryUISwitchCollection[oryUISwitchID].sprContainer) / 2.0)
		elseif (oryUIParameters.offsetCenterRight = 1)
			SetSpriteOffset(OryUISwitchCollection[oryUISwitchID].sprContainer, GetSpriteWidth(OryUISwitchCollection[oryUISwitchID].sprContainer), GetSpriteHeight(OryUISwitchCollection[oryUISwitchID].sprContainer) / 2.0)
		elseif (oryUIParameters.offsetBottomLeft = 1)
			SetSpriteOffset(OryUISwitchCollection[oryUISwitchID].sprContainer, 0, GetSpriteHeight(OryUISwitchCollection[oryUISwitchID].sprContainer))
		elseif (oryUIParameters.offsetBottomCenter = 1)
			SetSpriteOffset(OryUISwitchCollection[oryUISwitchID].sprContainer, GetSpriteWidth(OryUISwitchCollection[oryUISwitchID].sprContainer) / 2.0, GetSpriteHeight(OryUISwitchCollection[oryUISwitchID].sprContainer))
		elseif (oryUIParameters.offsetBottomRight = 1)
			SetSpriteOffset(OryUISwitchCollection[oryUISwitchID].sprContainer, GetSpriteWidth(OryUISwitchCollection[oryUISwitchID].sprContainer), GetSpriteHeight(OryUISwitchCollection[oryUISwitchID].sprContainer))
		else
			if (oryUIParameters.offset#[1] > -999999 or oryUIParameters.offset#[2] > -999999)
				SetSpriteOffset(OryUISwitchCollection[oryUISwitchID].sprContainer, oryUIParameters.offset#[1], oryUIParameters.offset#[2])
			endif
		endif
		if (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUISwitchCollection[oryUISwitchID].sprContainer, oryUIParameters.position#[1], oryUIParameters.position#[2])
		elseif (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(OryUISwitchCollection[oryUISwitchID].sprContainer, oryUIParameters.position#[1], GetSpriteYByOffset(OryUISwitchCollection[oryUISwitchID].sprContainer))
		elseif (oryUIParameters.position#[1] = -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUISwitchCollection[oryUISwitchID].sprContainer, GetSpriteXByOffset(OryUISwitchCollection[oryUISwitchID].sprContainer), oryUIParameters.position#[2])
		endif
		
		// THE REST OF THE PARAMETERS NEXT
		if (oryUIParameters.checkedColor#[1] > -999999 or oryUIParameters.checkedColor#[2] > -999999 or oryUIParameters.checkedColor#[3] > -999999 or oryUIParameters.checkedColor#[4] > -999999)
			OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[1] = oryUIParameters.checkedColor#[1]
			OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[2] = oryUIParameters.checkedColor#[2]
			OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[3] = oryUIParameters.checkedColor#[3]
			OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[4] = oryUIParameters.checkedColor#[4]
			OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[1] = oryUIParameters.checkedColor#[1]
			OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[2] = oryUIParameters.checkedColor#[2]
			OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[3] = oryUIParameters.checkedColor#[3]
			OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[4] = 150
		endif
		if (oryUIParameters.switchCheckedColor#[1] > -999999 or oryUIParameters.switchCheckedColor#[2] > -999999 or oryUIParameters.switchCheckedColor#[3] > -999999 or oryUIParameters.switchCheckedColor#[4] > -999999)
			OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[1] = oryUIParameters.switchCheckedColor#[1]
			OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[2] = oryUIParameters.switchCheckedColor#[2]
			OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[3] = oryUIParameters.switchCheckedColor#[3]
			OryUISwitchCollection[oryUISwitchID].switchCheckedColor#[4] = oryUIParameters.switchCheckedColor#[4]
		endif
		if (oryUIParameters.switchCheckedImageID > -999999)
			OryUISwitchCollection[oryUISwitchID].switchCheckedImageID = oryUIParameters.switchCheckedImageID
		endif
		if (oryUIParameters.switchImageID > -999999)
			OryUISwitchCollection[oryUISwitchID].switchCheckedImageID = oryUIParameters.switchImageID
			OryUISwitchCollection[oryUISwitchID].switchUncheckedImageID = oryUIParameters.switchImageID
			SetSpriteImage(OryUISwitchCollection[oryUISwitchID].sprSwitch, oryUIParameters.switchImageID)
		endif
		if (oryUIParameters.switchUncheckedImageID > -999999)
			OryUISwitchCollection[oryUISwitchID].switchUncheckedImageID = oryUIParameters.switchUncheckedImageID
		endif
		if (oryUIParameters.switchUncheckedColor#[1] > -999999 or oryUIParameters.switchUncheckedColor#[2] > -999999 or oryUIParameters.switchUncheckedColor#[3] > -999999 or oryUIParameters.switchUncheckedColor#[4] > -999999)
			OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[1] = oryUIParameters.switchUncheckedColor#[1]
			OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[2] = oryUIParameters.switchUncheckedColor#[2]
			OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[3] = oryUIParameters.switchUncheckedColor#[3]
			OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[4] = oryUIParameters.switchUncheckedColor#[4]
		endif
		if (oryUIParameters.trackCheckedColor#[1] > -999999 or oryUIParameters.trackCheckedColor#[2] > -999999 or oryUIParameters.trackCheckedColor#[3] > -999999 or oryUIParameters.trackCheckedColor#[4] > -999999)
			OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[1] = oryUIParameters.trackCheckedColor#[1]
			OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[2] = oryUIParameters.trackCheckedColor#[2]
			OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[3] = oryUIParameters.trackCheckedColor#[3]
			OryUISwitchCollection[oryUISwitchID].trackCheckedColor#[4] = oryUIParameters.trackCheckedColor#[4]
		endif
		if (oryUIParameters.trackCheckedImageID > -999999)
			OryUISwitchCollection[oryUISwitchID].trackCheckedImageID = oryUIParameters.trackCheckedImageID
		endif
		if (oryUIParameters.trackImageID > -999999)
			OryUISwitchCollection[oryUISwitchID].trackCheckedImageID = oryUIParameters.trackImageID
			OryUISwitchCollection[oryUISwitchID].trackUncheckedImageID = oryUIParameters.trackImageID
			SetSpriteImage(OryUISwitchCollection[oryUISwitchID].sprTrack, oryUIParameters.trackImageID)
		endif
		if (oryUIParameters.trackUncheckedImageID > -999999)
			OryUISwitchCollection[oryUISwitchID].trackUncheckedImageID = oryUIParameters.trackUncheckedImageID
		endif
		if (oryUIParameters.trackUncheckedColor#[1] > -999999 or oryUIParameters.trackUncheckedColor#[2] > -999999 or oryUIParameters.trackUncheckedColor#[3] > -999999 or oryUIParameters.trackUncheckedColor#[4] > -999999)
			OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[1] = oryUIParameters.trackUncheckedColor#[1]
			OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[2] = oryUIParameters.trackUncheckedColor#[2]
			OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[3] = oryUIParameters.trackUncheckedColor#[3]
			OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[4] = oryUIParameters.trackUncheckedColor#[4]
		endif
		if (oryUIParameters.uncheckedColor#[1] > -999999 or oryUIParameters.uncheckedColor#[2] > -999999 or oryUIParameters.uncheckedColor#[3] > -999999 or oryUIParameters.uncheckedColor#[4] > -999999)
			OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[1] = oryUIParameters.uncheckedColor#[1]
			OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[2] = oryUIParameters.uncheckedColor#[2]
			OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[3] = oryUIParameters.uncheckedColor#[3]
			OryUISwitchCollection[oryUISwitchID].switchUncheckedColor#[4] = oryUIParameters.uncheckedColor#[4]
			OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[1] = oryUIParameters.uncheckedColor#[1]
			OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[2] = oryUIParameters.uncheckedColor#[2]
			OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[3] = oryUIParameters.uncheckedColor#[3]
			OryUISwitchCollection[oryUISwitchID].trackUncheckedColor#[4] = 150
		endif

		if (oryUIParameters.depth > -999999)
			SetSpriteDepth(OryUISwitchCollection[oryUISwitchID].sprContainer, oryUIParameters.depth)
			SetSpriteDepth(OryUISwitchCollection[oryUISwitchID].sprTrack, oryUIParameters.depth)
			SetSpriteDepth(OryUISwitchCollection[oryUISwitchID].sprSwitch, oryUIParameters.depth - 1)
		endif
		if (oryUIParameters.fixToScreen = 1)
			FixSpriteToScreen(OryUISwitchCollection[oryUISwitchID].sprContainer, 1)
		endif

		OryUIColorAndPositionSwitch(oryUISwitchID)
	endif
endfunction

foldend
