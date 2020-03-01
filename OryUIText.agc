
foldstart // OryUIText (Updated 01/03/2020)

function OryUICreateText(oryUIComponentParameters$ as string)
	local oryUITextID
	oryUITextID = CreateText("")
	
	if (oryUIComponentParameters$ <> "") then OryUIUpdateText(oryUITextID, oryUIComponentParameters$)
endfunction oryUITextID

function OryUIPinTextToBottomCentreOfSprite(oryUITextA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetTextExists(oryUITextA) and GetSpriteExists(oryUISpriteB))
		SetTextPosition(oryUITextA, GetSpriteX(oryUISpriteB) + (GetSpriteWidth(oryUISpriteB) / 2.0) + oryUIOffsetX#, ((GetSpriteY(oryUISpriteB) + GetSpriteHeight(oryUISpriteB)) - GetTextTotalHeight(oryUITextA)) + oryUIOffsetY#)
		SetTextAlignment(oryUITextA, 1)
	endif
endfunction

function OryUIPinTextToBottomLeftOfSprite(oryUITextA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetTextExists(oryUITextA) and GetSpriteExists(oryUISpriteB))
		SetTextPosition(oryUITextA, GetSpriteX(oryUISpriteB) + oryUIOffsetX#, ((GetSpriteY(oryUISpriteB) + GetSpriteHeight(oryUISpriteB)) - GetTextTotalHeight(oryUITextA)) + oryUIOffsetY#)
		SetTextAlignment(oryUITextA, 0)
	endif
endfunction

function OryUIPinTextToBottomRightOfSprite(oryUITextA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetTextExists(oryUITextA) and GetSpriteExists(oryUISpriteB))
		SetTextPosition(oryUITextA, GetSpriteX(oryUISpriteB) + GetSpriteWidth(oryUISpriteB) + oryUIOffsetX#, ((GetSpriteY(oryUISpriteB) + GetSpriteHeight(oryUISpriteB)) - GetTextTotalHeight(oryUITextA)) + oryUIOffsetY#)
		SetTextAlignment(oryUITextA, 2)
	endif
endfunction

function OryUIPinTextToCentreLeftOfSprite(oryUITextA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetTextExists(oryUITextA) and GetSpriteExists(oryUISpriteB))
		SetTextPosition(oryUITextA, GetSpriteX(oryUISpriteB) + oryUIOffsetX#, ((GetSpriteY(oryUISpriteB) + (GetSpriteHeight(oryUISpriteB) / 2.0)) - (GetTextTotalHeight(oryUITextA) / 2.0)) + oryUIOffsetY#)
		SetTextAlignment(oryUITextA, 0)
	endif
endfunction

function OryUIPinTextToCentreOfSprite(oryUITextA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetTextExists(oryUITextA) and GetSpriteExists(oryUISpriteB))
		SetTextPosition(oryUITextA, GetSpriteX(oryUISpriteB) + (GetSpriteWidth(oryUISpriteB) / 2.0) + oryUIOffsetX#, ((GetSpriteY(oryUISpriteB) + (GetSpriteHeight(oryUISpriteB) / 2.0)) - (GetTextTotalHeight(oryUITextA) / 2.0)) + oryUIOffsetY#)
		SetTextAlignment(oryUITextA, 1)
	endif
endfunction

function OryUIPinTextToCentreRightOfSprite(oryUITextA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetTextExists(oryUITextA) and GetSpriteExists(oryUISpriteB))
		SetTextPosition(oryUITextA, GetSpriteX(oryUISpriteB) + GetSpriteWidth(oryUISpriteB) + oryUIOffsetX#, ((GetSpriteY(oryUISpriteB) + (GetSpriteHeight(oryUISpriteB) / 2.0)) - (GetTextTotalHeight(oryUITextA) / 2.0)) + oryUIOffsetY#)
		SetTextAlignment(oryUITextA, 2)
	endif
endfunction

function OryUIPinTextToTopCentreOfSprite(oryUITextA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetTextExists(oryUITextA) and GetSpriteExists(oryUISpriteB))
		SetTextPosition(oryUITextA, GetSpriteX(oryUISpriteB) + (GetSpriteWidth(oryUISpriteB) / 2.0) + oryUIOffsetX#, GetSpriteY(oryUISpriteB) + oryUIOffsetY#)
		SetTextAlignment(oryUITextA, 1)
	endif
endfunction

function OryUIPinTextToTopLeftOfSprite(oryUITextA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetTextExists(oryUITextA) and GetSpriteExists(oryUISpriteB))
		SetTextPosition(oryUITextA, GetSpriteX(oryUISpriteB) + oryUIOffsetX#, GetSpriteY(oryUISpriteB) + oryUIOffsetY#)
		SetTextAlignment(oryUITextA, 0)
	endif
endfunction

function OryUIPinTextToTopRightOfSprite(oryUITextA as integer, oryUISpriteB as integer, oryUIOffsetX# as float, oryUIOffsetY# as float)
	if (GetTextExists(oryUITextA) and GetSpriteExists(oryUISpriteB))
		SetTextPosition(oryUITextA, GetSpriteX(oryUISpriteB) + GetSpriteWidth(oryUISpriteB) + oryUIOffsetX#, GetSpriteY(oryUISpriteB) + oryUIOffsetY#)
		SetTextAlignment(oryUITextA, 2)
	endif
endfunction

function OryUIUpdateText(oryUITextID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetTextExists(oryUITextID))
		if (oryUIParameters.alignment > -999999)
			SetTextAlignment(oryUITextID, oryUIParameters.alignment)
		endif
		if (oryUIParameters.angle# > -999999)
			SetTextAngle(oryUITextID, oryUIParameters.angle#)
		endif
		if (oryUIParameters.bold > -999999)
			SetTextBold(oryUITextID, oryUIParameters.bold)
		endif
		if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999)
			SetTextColor(oryUITextID, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], GetTextColorAlpha(oryUITextID))
		endif
		if (oryUIParameters.color#[4] > -999999)
			SetTextColorAlpha(oryUITextID, oryUIParameters.color#[4])
		endif
		if (oryUIParameters.depth > -999999)
			SetTextDepth(oryUITextID, oryUIParameters.depth)
		endif
		if (oryUIParameters.fixToScreen = 1)
			FixTextToScreen(oryUITextID, 1)
		endif
		if (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] > -999999)
			SetTextPosition(oryUITextID, oryUIParameters.position#[1], oryUIParameters.position#[2])
		elseif (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] = -999999)
			SetTextPosition(oryUITextID, oryUIParameters.position#[1], GetTextY(oryUITextID))
		elseif (oryUIParameters.position#[1] = -999999 and oryUIParameters.position#[2] > -999999)
			SetTextPosition(oryUITextID, GetTextX(oryUITextID), oryUIParameters.position#[2])
		endif
		if (oryUIParameters.size#[1] > -999999)
			SetTextSize(oryUITextID, oryUIParameters.size#[1])
		endif
		if (oryUIParameters.text$ <> "")
			if (lower(oryUIParameters.text$) = "null") then oryUIParameters.text$ = ""
			SetTextString(oryUITextID, oryUIParameters.text$)
		endif
	endif
endfunction

function OryUIWrapText(oryUIText$ as string, oryUISize# as float, oryUIMaxWidth# as float)
	local oryUIFinalText$ as string
	local oryUILength as integer
	local oryUISpace as integer
	local oryUITmpText as integer
	local oryUITmpText2 as integer
	oryUITmpText = CreateText(oryUIText$)
	SetTextSize(oryUITmpText, oryUISize#)
	SetTextPosition(oryUITmpText, -10000, -10000)
	if (GetTextTotalWidth(oryUITmpText) >= oryUIMaxWidth#)
		while (GetTextTotalWidth(oryUITmpText) >= oryUIMaxWidth#)
			oryUILength = len(oryUIText$)
			oryUISpace = 0
			for oryUIForI = 1 to oryUILength
				if (mid(oryUIText$, oryUIForI, 1) = " ") then oryUISpace = oryUIForI
				oryUITmpText2 = CreateText(left(oryUIText$, oryUIForI))
				SetTextSize(oryUITmpText2, oryUISize#)
				SetTextPosition(oryUITmpText2, -10000, -10000)
				if (GetTextTotalWidth(oryUITmpText2) > oryUIMaxWidth#)
					DeleteText(oryUITmpText2)
					exit
				endif
				DeleteText(oryUITmpText2)
			next
			oryUIFinalText$ = oryUIFinalText$ + left(oryUIText$, (oryUISpace - 1)) + chr(10)
			oryUIText$ = right(oryUIText$, (len(oryUIText$) - oryUISpace))
			DeleteText(oryUITmpText)
			oryUITmpText = CreateText(oryUIText$)
			SetTextSize(oryUITmpText, oryUISize#)
			SetTextPosition(oryUITmpText, -10000, -10000)
			if (oryUISpace = 0) then exit
		endwhile
		if (len(oryUIText$) > 0) then oryUIFinalText$ = oryUIFinalText$ + oryUIText$
	else
		oryUIFinalText$ = oryUIText$
	endif
	DeleteText(oryUITmpText)
endfunction oryUIFinalText$

foldend
