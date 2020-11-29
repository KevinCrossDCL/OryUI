
foldstart // OryUITooltip Component (Updated 01/03/2020)

type typeOryUITooltip
	id as integer
	sprContainer as integer
	sprTween as integer
	timeVisible# as float
	txtLabel as integer
	txtTween as integer
	visible as integer
endtype

global OryUITooltipCollection as typeOryUITooltip[]
OryUITooltipCollection.length = 1

function OryUIAnimateTooltip(oryUITooltipID as integer)
	if (OryUITooltipCollection[oryUITooltipID].visible = 1)
		if (GetSpriteExists(OryUITooltipCollection[oryUITooltipID].sprContainer))
			if (GetSpriteColorAlpha(OryUITooltipCollection[oryUITooltipID].sprContainer) > 0)
				if (Timer() - OryUITooltipCollection[oryUITooltipID].timeVisible# >= 1.5)
					SetSpriteColorAlpha(OryUITooltipCollection[oryUITooltipID].sprContainer, GetSpriteColorAlpha(OryUITooltipCollection[oryUITooltipID].sprContainer) - 15)
					SetTextColorAlpha(OryUITooltipCollection[oryUITooltipID].txtLabel, GetTextColorAlpha(OryUITooltipCollection[oryUITooltipID].txtLabel) - 15)
				endif
			else
				OryUITooltipCollection[oryUITooltipID].visible = 0
				SetSpritePosition(OryUITooltipCollection[oryUITooltipID].sprContainer, -999999, -999999)
				SetTextPosition(OryUITooltipCollection[oryUITooltipID].txtLabel, -999999, -999999)
			endif
		endif
	endif
endfunction

function OryUICreateTooltip(oryUIComponentParameters$ as string)
	local oryUITooltipID as integer
	OryUITooltipCollection.length = OryUITooltipCollection.length + 1
	oryUITooltipID = OryUITooltipCollection.length
	OryUITooltipCollection[oryUITooltipID].id = oryUITooltipID

	// DEFAULT SETTINGS
	OryUITooltipCollection[oryUITooltipID].visible = 0

	OryUITooltipCollection[oryUITooltipID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUITooltipCollection[oryUITooltipID].sprContainer, 0, oryUIDefaults.tooltipHeight#)
	SetSpriteDepth(OryUITooltipCollection[oryUITooltipID].sprContainer, oryUIDefaults.tooltipDepth)
	SetSpriteColor(OryUITooltipCollection[oryUITooltipID].sprContainer, oryUIDefaults.tooltipColor#[1], oryUIDefaults.tooltipColor#[2], oryUIDefaults.tooltipColor#[3], oryUIDefaults.tooltipColor#[4])
	SetSpriteOffset(OryUITooltipCollection[oryUITooltipID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUITooltipCollection[oryUITooltipID].sprContainer, -999999, -999999)
	SetSpritePhysicsOff(OryUITooltipCollection[oryUITooltipID].sprContainer)

	OryUITooltipCollection[oryUITooltipID].txtLabel = CreateText("")
	SetTextSize(OryUITooltipCollection[oryUITooltipID].txtLabel, oryUIDefaults.tooltipTextSize#)
	SetTextBold(OryUITooltipCollection[oryUITooltipID].txtLabel, oryUIDefaults.tooltipTextBold)
	SetTextColor(OryUITooltipCollection[oryUITooltipID].txtLabel, oryUIDefaults.tooltipTextColor#[1], oryUIDefaults.tooltipTextColor#[2], oryUIDefaults.tooltipTextColor#[3], oryUIDefaults.tooltipTextColor#[4])
	SetTextAlignment(OryUITooltipCollection[oryUITooltipID].txtLabel, oryUIDefaults.tooltipTextAlignment)
	SetTextDepth(OryUITooltipCollection[oryUITooltipID].txtLabel, GetSpriteDepth(OryUITooltipCollection[oryUITooltipID].sprContainer) - 1)
	SetTextPosition(OryUITooltipCollection[oryUITooltipID].txtLabel, -999999, -999999)
	
	if (oryUIComponentParameters$ <> "") then OryUIUpdateTooltip(oryUITooltipID, oryUIComponentParameters$)
endfunction oryUITooltipID

function OryUIDeleteTooltip(oryUITooltipID as integer)
	DeleteSprite(OryUITooltipCollection[oryUITooltipID].sprContainer)
	DeleteText(OryUITooltipCollection[oryUITooltipID].txtLabel)
endfunction

function OryUIGetTooltipVisible(oryUITooltipID as integer)

endfunction OryUITooltipCollection[oryUITooltipID].visible

function OryUIHideTooltip(oryUITooltipID as integer)
	//oryUIBlockScreenScrolling = 0
	OryUITooltipCollection[oryUITooltipID].visible = 0
	SetSpritePositionByOffset(OryUITooltipCollection[oryUITooltipID].sprContainer, -999999, -999999)
	SetTextPosition(OryUITooltipCollection[oryUITooltipID].txtLabel, -999999, -999999)
endfunction

function OryUIShowTooltip(oryUITooltipID as integer, oryUITooltipX#, oryUITooltipY#)
	//oryUIBlockScreenScrolling = 1
	OryUITooltipCollection[oryUITooltipID].visible = 1

	SetSpriteColorAlpha(OryUITooltipCollection[oryUITooltipID].sprContainer, 255)
	SetTextColorAlpha(OryUITooltipCollection[oryUITooltipID].txtLabel, 255)
	SetSpriteSize(OryUITooltipCollection[oryUITooltipID].sprContainer, GetTextTotalWidth(OryUITooltipCollection[oryUITooltipID].txtLabel) + 4, GetSpriteHeight(OryUITooltipCollection[oryUITooltipID].sprContainer))
	SetSpriteOffset(OryUITooltipCollection[oryUITooltipID].sprContainer, GetSpriteWidth(OryUITooltipCollection[oryUITooltipID].sprContainer) / 2, GetSpriteHeight(OryUITooltipCollection[oryUITooltipID].sprContainer) / 2)
	SetSpritePositionByOffset(OryUITooltipCollection[oryUITooltipID].sprContainer, oryUITooltipX#, oryUITooltipY#)

	if (GetTextAlignment(OryUITooltipCollection[oryUITooltipID].txtLabel) = 0)
		OryUIPinTextToCentreLeftOfSprite(OryUITooltipCollection[oryUITooltipID].txtLabel, OryUITooltipCollection[oryUITooltipID].sprContainer, 2, 0)
	elseif (GetTextAlignment(OryUITooltipCollection[oryUITooltipID].txtLabel) = 1)
		OryUIPinTextToCentreOfSprite(OryUITooltipCollection[oryUITooltipID].txtLabel, OryUITooltipCollection[oryUITooltipID].sprContainer, 0, 0)
	elseif (GetTextAlignment(OryUITooltipCollection[oryUITooltipID].txtLabel) = 2)
		OryUIPinTextToCentreRightOfSprite(OryUITooltipCollection[oryUITooltipID].txtLabel, OryUITooltipCollection[oryUITooltipID].sprContainer, 2, 0)
	endif

	OryUITooltipCollection[oryUITooltipID].timeVisible# = Timer()
endfunction

function OryUIUpdateTooltip(oryUITooltipID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUITooltipCollection[oryUITooltipID].sprContainer))
		// THE REST OF THE PARAMETERS NEXT
		if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999 or oryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUITooltipCollection[oryUITooltipID].sprContainer, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], oryUIParameters.color#[4])
		endif
		if (oryUIParameters.depth > -999999)
			SetSpriteDepth(OryUITooltipCollection[oryUITooltipID].sprContainer, oryUIParameters.depth)
			SetTextDepth(OryUITooltipCollection[oryUITooltipID].txtLabel, oryUIParameters.depth - 1)
		endif
		if (oryUIParameters.text$ <> "")
			if (lower(oryUIParameters.text$) = "null") then oryUIParameters.text$ = ""
			SetTextString(OryUITooltipCollection[oryUITooltipID].txtLabel, oryUIParameters.text$)
		endif
		if (oryUIParameters.textAlignment > -999999)
			SetTextAlignment(OryUITooltipCollection[oryUITooltipID].txtLabel, oryUIParameters.textAlignment)
		endif
		if (oryUIParameters.textBold > -999999)
			SetTextBold(OryUITooltipCollection[oryUITooltipID].txtLabel, oryUIParameters.textBold)
		endif
		if (oryUIParameters.textColor#[1] > -999999 or oryUIParameters.textColor#[2] > -999999 or oryUIParameters.textColor#[3] > -999999 or oryUIParameters.textColor#[4] > -999999)
			SetTextColor(OryUITooltipCollection[oryUITooltipID].txtLabel, oryUIParameters.textColor#[1], oryUIParameters.textColor#[2], oryUIParameters.textColor#[3], oryUIParameters.textColor#[4])
		endif
		if (oryUIParameters.textSize# > -999999)
			SetTextSize(OryUITooltipCollection[oryUITooltipID].txtLabel, oryUIParameters.textSize#)
		endif
	endif
endfunction

foldend
