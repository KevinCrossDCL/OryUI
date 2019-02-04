
//	Section For Parameters Type, Variables, and Functions
//
//		A list of parameters accepted in all of the different OryUI componenents.
//		When a new component is added, or an existing one is extended the extra
//		required parameters will need to be added to the types list, and functions.
//
//		Functions available:
//
//			OryUIResetParametersType()
//			OryUISetParametersType(parameters$ as string)
//
foldstart // Parameters

type typeOryUIParameters
	angle# as float
	autoHeight as integer
	color# as float[4]
	contentText$ as string
	contentTextAlignment as integer
	contentTextBold as integer
	contentTextColor# as float[4]
	contentTextSize# as float
	depth as integer
	fixToscreen as integer
	group as integer
	imageID as float
	//leftIconImageID as float
	leftLine1Text$ as string
	leftLine1TextAlignment as integer
	leftLine1TextBold as integer
	leftLine1TextColor# as float[4]
	leftLine1TextSize# as float
	leftLine2Text$ as string
	leftLine2TextAlignment as integer
	leftLine2TextBold as integer
	leftLine2TextColor# as float[4]
	leftLine2TextSize# as float
	//leftLine3Text$ as string
	//leftLine3TextAlignment as integer
	//leftLine3TextBold as integer
	//leftLine3TextColor# as float[4]
	//leftLine3TextSize# as float
	leftThumbnailImageID as float
	maxSize# as float[2]
	noOfLeftLines as integer
	noOfRightLines as integer
	offset# as float[2]
	offsetCenter as integer
	position# as float[2]
	//rightIconImageID as integer
	rightLine1Text$ as string
	rightLine1TextAlignment as integer
	rightLine1TextBold as integer
	rightLine1TextColor# as float[4]
	rightLine1TextSize# as float
	rightLine2Text$ as string
	rightLine2TextAlignment as integer
	rightLine2TextBold as integer
	rightLine2TextColor# as float[4]
	rightLine2TextSize# as float
	//rightLine3Text$ as string
	//rightLine3TextAlignment as integer
	//rightLine3TextBold as integer
	//rightLine3TextColor# as float[4]
	//rightLine3TextSize# as float
	//rightThumbnailImageID as integer
	//showLeftIcon as integer
	showLeftImage as integer
	showLeftLabel as integer
	showLeftSublabel as integer
	showLeftThumbnail as integer
	//showRightIcon as integer
	showRightLabel as integer
	//showRightThumbnail as integer
	size# as float[2]
	spriteShader as integer
	text$ as string
	textAlignment as integer
	textBold as integer
	textColor# as float[4]
	textSize# as float
	titleText$ as string
	titleTextAlignment as integer
	titleTextBold as integer
	titleTextColor# as float[4]
	titleTextSize# as float
endtype

global OryUIParameters as typeOryUIParameters

// OryUIResetParametersType() needs to be called in all component update functions.
//
function OryUIResetParametersType()
	OryUIParameters.angle# = -999999
	OryUIParameters.autoHeight = -999999
	OryUIParameters.contentText$ = ""
	OryUIParameters.contentTextAlignment = -999999
	OryUIParameters.contentTextBold = -999999
	OryUIParameters.contentTextSize# = -999999
	OryUIParameters.depth = -999999
	OryUIParameters.fixToscreen = -999999
	OryUIParameters.group = -999999
	OryUIParameters.imageID = -999999
	//OryUIParameters.leftIconImageID = -999999
	OryUIParameters.leftLine1Text$ = ""
	OryUIParameters.leftLine1TextAlignment = -999999
	OryUIParameters.leftLine1TextBold = -999999
	OryUIParameters.leftLine1TextSize# = -999999
	OryUIParameters.leftLine2Text$ = ""
	OryUIParameters.leftLine2TextAlignment = -999999
	OryUIParameters.leftLine2TextBold = -999999
	OryUIParameters.leftLine2TextSize# = -999999
	//OryUIParameters.leftLine3Text$ = ""
	//OryUIParameters.leftLine3TextAlignment = -999999
	//OryUIParameters.leftLine3TextBold = -999999
	//OryUIParameters.leftLine3TextSize# = -999999
	OryUIParameters.leftThumbnailImageID = -999999
	OryUIParameters.noOfLeftLines = -999999
	OryUIParameters.noOfRightLines = -999999
	OryUIParameters.offsetCenter = -999999
	//OryUIParameters.rightIconImageID = -999999
	OryUIParameters.rightLine1Text$ = ""
	OryUIParameters.rightLine1TextAlignment = -999999
	OryUIParameters.rightLine1TextBold = -999999
	OryUIParameters.rightLine1TextSize# = -999999
	OryUIParameters.rightLine2Text$ = ""
	OryUIParameters.rightLine2TextAlignment = -999999
	OryUIParameters.rightLine2TextBold = -999999
	OryUIParameters.rightLine2TextSize# = -999999
	//OryUIParameters.rightLine3Text$ = ""
	//OryUIParameters.rightLine3TextAlignment = -999999
	//OryUIParameters.rightLine3TextBold = -999999
	//OryUIParameters.rightLine3TextSize# = -999999
	//OryUIParameters.rightThumbnailImageID = -999999
	//OryUIParameters.showLeftIcon = -999999
	OryUIParameters.showLeftThumbnail = -999999
	//OryUIParameters.showRightIcon = -999999
	//OryUIParameters.showRightThumbnail = -999999
	OryUIParameters.spriteShader = -999999
	OryUIParameters.text$ = ""
	OryUIParameters.textAlignment = -999999
	OryUIParameters.textBold = -999999
	OryUIParameters.textSize# = -999999
	OryUIParameters.titleText$ = ""
	OryUIParameters.titleTextAlignment = -999999
	OryUIParameters.titleTextBold = -999999
	OryUIParameters.titleTextSize# = -999999	
	for i = 1 to 4
		if (i < 3)
			OryUIParameters.maxSize#[i] = -999999
			OryUIParameters.offset#[i] = -999999
			OryUIParameters.position#[i] = -999999
			OryUIParameters.size#[i] = -999999
		endif
		OryUIParameters.color#[i] = -999999
		OryUIParameters.contentTextColor#[i] = -999999
		OryUIParameters.leftLine1TextColor#[i] = -999999
		OryUIParameters.leftLine2TextColor#[i] = -999999
		//OryUIParameters.leftLine3TextColor#[i] = -999999
		OryUIParameters.rightLine1TextColor#[i] = -999999
		OryUIParameters.rightLine2TextColor#[i] = -999999
		//OryUIParameters.rightLine3TextColor#[i] = -999999
		OryUIParameters.textColor#[i] = -999999
		OryUIParameters.titleTextColor#[i] = -999999
	next
endfunction

// Every parameter that gets passed through to the different functions as parameters$
// needs to be included in this function
//
function OryUISetParametersType(parameters$ as string)
	local a as integer
	local parameter$ as string
	local value$ as string
	local variable$ as string
	for a = 1 to CountStringTokens(parameters$, ";")
		parameter$ = GetStringToken(parameters$, ";", a)
		variable$ = lower(TrimString(GetStringToken(parameter$, ":", 1), " "))
		value$ = GetStringToken(parameter$, ":", 2)
		value$ = ReplaceString(value$, "[colon]", ":", -1)
		if (variable$ = "alpha")
			OryUIParameters.color#[4] = valFloat(value$)
		elseif (variable$ = "angle")
			OryUIParameters.angle# = valFloat(value$)
		elseif (variable$ = "autoheight")
			if (value$ = "true" or value$ = "1")
				OryUIParameters.autoHeight = 1
			elseif (value$ = "false" or value$ = "0")
				OryUIParameters.autoHeight = 0
			endif
		elseif (variable$ = "color")
			if (CountStringTokens(value$, ",") >= 3)
				OryUIParameters.color#[1] = valFloat(GetStringToken(value$, ",", 1))
				OryUIParameters.color#[2] = valFloat(GetStringToken(value$, ",", 2))
				OryUIParameters.color#[3] = valFloat(GetStringToken(value$, ",", 3))
			endif
			if (CountStringTokens(value$, ",") = 4)
				OryUIParameters.color#[4] = valFloat(GetStringToken(value$, ",", 4))
			endif
		elseif (variable$ = "colorid")
			colorID = val(GetStringToken(value$, ",", 1))
			OryUIParameters.color#[1] = GetColorRed(colorID)
			OryUIParameters.color#[2] = GetColorGreen(colorID)
			OryUIParameters.color#[3] = GetColorBlue(colorID)
		elseif (variable$ = "contenttext")
			OryUIParameters.contentText$ = value$
		elseif (variable$ = "contenttextalignment")
			if (value$ = "left")
				OryUIParameters.contentTextAlignment = 0
			elseif (value$ = "center" or value$ = "centre")
				OryUIParameters.contentTextAlignment = 1
			elseif (value$ = "right")
				OryUIParameters.contentTextAlignment = 2
			endif
		elseif (variable$ = "contenttextbold")
			if (value$ = "true" or value$ = "1")
				OryUIParameters.contentTextBold = 1
			elseif (value$ = "false" or value$ = "0")
				OryUIParameters.contentTextBold = 0
			endif
		elseif (variable$ = "contenttextcolor")
			if (CountStringTokens(value$, ",") >= 3)
				OryUIParameters.contentTextColor#[1] = valFloat(GetStringToken(value$, ",", 1))
				OryUIParameters.contentTextColor#[2] = valFloat(GetStringToken(value$, ",", 2))
				OryUIParameters.contentTextColor#[3] = valFloat(GetStringToken(value$, ",", 3))
			endif
			if (CountStringTokens(value$, ",") = 4)
				OryUIParameters.contentTextColor#[4] = valFloat(GetStringToken(value$, ",", 4))
			endif
		elseif (variable$ = "contenttextcolorid")
			contentTextColorID = val(GetStringToken(value$, ",", 1))
			OryUIParameters.contentTextColor#[1] = GetColorRed(contentTextColorID)
			OryUIParameters.contentTextColor#[2] = GetColorGreen(contentTextColorID)
			OryUIParameters.contentTextColor#[3] = GetColorBlue(contentTextColorID)
		elseif (variable$ = "contenttextsize")
			OryUIParameters.contentTextSize# = valFloat(value$)
		elseif (variable$ = "depth")
			OryUIParameters.depth = val(value$)
		elseif (variable$ = "fixtoscreen")
			if (value$ = "true" or value$ = "1")
				OryUIParameters.fixToScreen = 1
			elseif (value$ = "false" or value$ = "0")
				OryUIParameters.fixToScreen = 0
			endif
		elseif (variable$ = "group")
			OryUIParameters.group = val(value$)
		elseif (variable$ = "height")
			OryUIParameters.size#[2] = valFloat(value$)
		elseif (variable$ = "image")
			OryUIParameters.imageID = val(value$)
		//elseif (variable$ = "lefticonimage")
			//OryUIParameters.leftIconImageID = val(value$)
		elseif (variable$ = "leftline1text")
			OryUIParameters.leftLine1Text$ = value$
		elseif (variable$ = "leftline1textbold")
			if (value$ = "true" or value$ = "1")
				OryUIParameters.leftLine1TextBold = 1
			elseif (value$ = "false" or value$ = "0")
				OryUIParameters.leftLine1TextBold = 0
			endif
		elseif (variable$ = "leftline1textcolor")
			if (CountStringTokens(value$, ",") >= 3)
				OryUIParameters.leftLine1TextColor#[1] = valFloat(GetStringToken(value$, ",", 1))
				OryUIParameters.leftLine1TextColor#[2] = valFloat(GetStringToken(value$, ",", 2))
				OryUIParameters.leftLine1TextColor#[3] = valFloat(GetStringToken(value$, ",", 3))
			endif
			if (CountStringTokens(value$, ",") = 4)
				OryUIParameters.leftLine1TextColor#[4] = valFloat(GetStringToken(value$, ",", 4))
			endif
		elseif (variable$ = "leftline1textcolorid")
			leftLine1TextColorID = val(GetStringToken(value$, ",", 1))
			OryUIParameters.leftLine1TextColor#[1] = GetColorRed(leftLine1TextColorID)
			OryUIParameters.leftLine1TextColor#[2] = GetColorGreen(leftLine1TextColorID)
			OryUIParameters.leftLine1TextColor#[3] = GetColorBlue(leftLine1TextColorID)
		elseif (variable$ = "leftline1textsize")
			OryUIParameters.leftLine1TextSize# = valFloat(value$)
		elseif (variable$ = "leftline2text")
			OryUIParameters.leftLine2Text$ = value$
		elseif (variable$ = "leftline2textbold")
			if (value$ = "true" or value$ = "1")
				OryUIParameters.leftLine2TextBold = 1
			elseif (value$ = "false" or value$ = "0")
				OryUIParameters.leftLine2TextBold = 0
			endif
		elseif (variable$ = "leftline2textcolor")
			if (CountStringTokens(value$, ",") >= 3)
				OryUIParameters.leftLine2TextColor#[1] = valFloat(GetStringToken(value$, ",", 1))
				OryUIParameters.leftLine2TextColor#[2] = valFloat(GetStringToken(value$, ",", 2))
				OryUIParameters.leftLine2TextColor#[3] = valFloat(GetStringToken(value$, ",", 3))
			endif
			if (CountStringTokens(value$, ",") = 4)
				OryUIParameters.leftLine2TextColor#[4] = valFloat(GetStringToken(value$, ",", 4))
			endif
		elseif (variable$ = "leftline2textcolorid")
			leftLine2TextColorID = val(GetStringToken(value$, ",", 1))
			OryUIParameters.leftLine2TextColor#[1] = GetColorRed(leftLine2TextColorID)
			OryUIParameters.leftLine2TextColor#[2] = GetColorGreen(leftLine2TextColorID)
			OryUIParameters.leftLine2TextColor#[3] = GetColorBlue(leftLine2TextColorID)
		elseif (variable$ = "leftline2textsize")
			OryUIParameters.leftLine2TextSize# = valFloat(value$)
		//elseif (variable$ = "leftline3text")
			//OryUIParameters.leftLine3Text$ = value$
		//elseif (variable$ = "leftline3textbold")
			//if (value$ = "true" or value$ = "1")
				//OryUIParameters.leftLine3TextBold = 1
			//elseif (value$ = "false" or value$ = "0")
				//OryUIParameters.leftLine3TextBold = 0
			//endif
		//elseif (variable$ = "leftline3textcolor")
			//if (CountStringTokens(value$, ",") >= 3)
				//OryUIParameters.leftLine3TextColor#[1] = valFloat(GetStringToken(value$, ",", 1))
				//OryUIParameters.leftLine3TextColor#[2] = valFloat(GetStringToken(value$, ",", 2))
				//OryUIParameters.leftLine3TextColor#[3] = valFloat(GetStringToken(value$, ",", 3))
			//endif
			//if (CountStringTokens(value$, ",") = 4)
				//OryUIParameters.leftLine3TextColor#[4] = valFloat(GetStringToken(value$, ",", 4))
			//endif
		//elseif (variable$ = "leftline3textcolorid")
			//leftLine3TextColorID = val(GetStringToken(value$, ",", 1))
			//OryUIParameters.leftLine3TextColor#[1] = GetColorRed(leftLine3TextColorID)
			//OryUIParameters.leftLine3TextColor#[2] = GetColorGreen(leftLine3TextColorID)
			//OryUIParameters.leftLine3TextColor#[3] = GetColorBlue(leftLine3TextColorID)
		//elseif (variable$ = "leftline3textsize")
			//OryUIParameters.leftLine3TextSize# = valFloat(value$)
		elseif (variable$ = "leftthumbnailimage")
			OryUIParameters.leftThumbnailImageID = val(value$)
		elseif (variable$ = "maxheight")
			OryUIParameters.maxSize#[1] = -1
			OryUIParameters.maxSize#[2] = valFloat(value$)
		elseif (variable$ = "maxsize")
			OryUIParameters.maxSize#[1] = valFloat(GetStringToken(value$, ",", 1))
			OryUIParameters.maxSize#[2] = valFloat(GetStringToken(value$, ",", 2))
		elseif (variable$ = "maxwidth")
			OryUIParameters.maxSize#[1] = valFloat(value$)
			OryUIParameters.maxSize#[2] = -1
		elseif (variable$ = "noofleftlines")
			OryUIParameters.noOfLeftLines = val(value$)
		elseif (variable$ = "noofrightlines")
			OryUIParameters.noOfRightLines = val(value$)	
		elseif (variable$ = "offset")
			if (value$ = "center" or value$ = "centre")
				OryUIParameters.offsetCenter = 1
			else
				OryUIParameters.offset#[1] = valFloat(GetStringToken(value$, ",", 1))
				OryUIParameters.offset#[2] = valFloat(GetStringToken(value$, ",", 2))
			endif
		elseif (variable$ = "position")
			OryUIParameters.position#[1] = valFloat(GetStringToken(value$, ",", 1))
			OryUIParameters.position#[2] = valFloat(GetStringToken(value$, ",", 2))
		//elseif (variable$ = "righticonimage")
			//OryUIParameters.rightIconImageID = val(value$)	
		elseif (variable$ = "rightline1text")
			OryUIParameters.rightLine1Text$ = value$
		elseif (variable$ = "rightline1textbold")
			if (value$ = "true" or value$ = "1")
				OryUIParameters.rightLine1TextBold = 1
			elseif (value$ = "false" or value$ = "0")
				OryUIParameters.rightLine1TextBold = 0
			endif
		elseif (variable$ = "rightline1textcolor")
			if (CountStringTokens(value$, ",") >= 3)
				OryUIParameters.rightLine1TextColor#[1] = valFloat(GetStringToken(value$, ",", 1))
				OryUIParameters.rightLine1TextColor#[2] = valFloat(GetStringToken(value$, ",", 2))
				OryUIParameters.rightLine1TextColor#[3] = valFloat(GetStringToken(value$, ",", 3))
			endif
			if (CountStringTokens(value$, ",") = 4)
				OryUIParameters.rightLine1TextColor#[4] = valFloat(GetStringToken(value$, ",", 4))
			endif
		elseif (variable$ = "rightline1textcolorid")
			rightLine1TextColorID = val(GetStringToken(value$, ",", 1))
			OryUIParameters.rightLine1TextColor#[1] = GetColorRed(rightLine1TextColorID)
			OryUIParameters.rightLine1TextColor#[2] = GetColorGreen(rightLine1TextColorID)
			OryUIParameters.rightLine1TextColor#[3] = GetColorBlue(rightLine1TextColorID)
		elseif (variable$ = "rightline1textsize")
			OryUIParameters.rightLine1TextSize# = valFloat(value$)
		elseif (variable$ = "rightline2text")
			OryUIParameters.rightLine2Text$ = value$
		elseif (variable$ = "rightline2textbold")
			if (value$ = "true" or value$ = "1")
				OryUIParameters.rightLine2TextBold = 1
			elseif (value$ = "false" or value$ = "0")
				OryUIParameters.rightLine2TextBold = 0
			endif
		elseif (variable$ = "rightline2textcolor")
			if (CountStringTokens(value$, ",") >= 3)
				OryUIParameters.rightLine2TextColor#[1] = valFloat(GetStringToken(value$, ",", 1))
				OryUIParameters.rightLine2TextColor#[2] = valFloat(GetStringToken(value$, ",", 2))
				OryUIParameters.rightLine2TextColor#[3] = valFloat(GetStringToken(value$, ",", 3))
			endif
			if (CountStringTokens(value$, ",") = 4)
				OryUIParameters.rightLine2TextColor#[4] = valFloat(GetStringToken(value$, ",", 4))
			endif
		elseif (variable$ = "rightline2textcolorid")
			rightLine2TextColorID = val(GetStringToken(value$, ",", 1))
			OryUIParameters.rightLine2TextColor#[1] = GetColorRed(rightLine2TextColorID)
			OryUIParameters.rightLine2TextColor#[2] = GetColorGreen(rightLine2TextColorID)
			OryUIParameters.rightLine2TextColor#[3] = GetColorBlue(rightLine2TextColorID)
		elseif (variable$ = "rightline2textsize")
			OryUIParameters.rightLine2TextSize# = valFloat(value$)
		//elseif (variable$ = "rightline3text")
			//OryUIParameters.rightLine3Text$ = value$
		//elseif (variable$ = "rightline3textbold")
			//if (value$ = "true" or value$ = "1")
				//OryUIParameters.rightLine3TextBold = 1
			//elseif (value$ = "false" or value$ = "0")
				//OryUIParameters.rightLine3TextBold = 0
			//endif
		//elseif (variable$ = "rightline3textcolor")
			//if (CountStringTokens(value$, ",") >= 3)
				//OryUIParameters.rightLine3TextColor#[1] = valFloat(GetStringToken(value$, ",", 1))
				//OryUIParameters.rightLine3TextColor#[2] = valFloat(GetStringToken(value$, ",", 2))
				//OryUIParameters.rightLine3TextColor#[3] = valFloat(GetStringToken(value$, ",", 3))
			//endif
			//if (CountStringTokens(value$, ",") = 4)
				//OryUIParameters.rightLine3TextColor#[4] = valFloat(GetStringToken(value$, ",", 4))
			//endif
		//elseif (variable$ = "rightline3textcolorid")
			//rightLine2TextColorID = val(GetStringToken(value$, ",", 1))
			//OryUIParameters.rightLine3TextColor#[1] = GetColorRed(rightLine3TextColorID)
			//OryUIParameters.rightLine3TextColor#[2] = GetColorGreen(rightLine3TextColorID)
			//OryUIParameters.rightLine3TextColor#[3] = GetColorBlue(rightLine3TextColorID)
		//elseif (variable$ = "rightline3textsize")
			//OryUIParameters.rightLine3TextSize# = valFloat(value$)
		//elseif (variable$ = "leftthumbnailimage")
			//OryUIParameters.leftThumbnailImageID = val(value$)
		//elseif (variable$ = "showlefticon")
			//OryUIParameters.showLeftIcon = val(value$)
		elseif (variable$ = "showleftthumbnail")
			if (value$ = "true" or value$ = "1")
				OryUIParameters.showLeftThumbnail = 1
			elseif (value$ = "false" or value$ = "0")
				OryUIParameters.showLeftThumbnail = 0
			endif
		//elseif (variable$ = "showrighticon")
			//OryUIParameters.showRightIcon = val(value$)
		//elseif (variable$ = "showrightthumbnail")
			//OryUIParameters.showRightThumbnail = val(value$)
		elseif (variable$ = "size")
			OryUIParameters.size#[1] = valFloat(GetStringToken(value$, ",", 1))
			OryUIParameters.size#[2] = valFloat(GetStringToken(value$, ",", 2))
		elseif (variable$ = "spriteshader")
			OryUIParameters.spriteShader = val(value$)
		elseif (variable$ = "string")
			OryUIParameters.text$ = value$
		elseif (variable$ = "text")
			OryUIParameters.text$ = value$
		elseif (variable$ = "textalignment")
			if (value$ = "left")
				OryUIParameters.textAlignment = 0
			elseif (value$ = "center" or value$ = "centre")
				OryUIParameters.textAlignment = 1
			elseif (value$ = "right")
				OryUIParameters.textAlignment = 2
			endif
		elseif (variable$ = "textbold")
			if (value$ = "true" or value$ = "1")
				OryUIParameters.textBold = 1
			elseif (value$ = "false" or value$ = "0")
				OryUIParameters.textBold = 0
			endif
		elseif (variable$ = "textcolor")
			if (CountStringTokens(value$, ",") >= 3)
				OryUIParameters.textColor#[1] = valFloat(GetStringToken(value$, ",", 1))
				OryUIParameters.textColor#[2] = valFloat(GetStringToken(value$, ",", 2))
				OryUIParameters.textColor#[3] = valFloat(GetStringToken(value$, ",", 3))
			endif
			if (CountStringTokens(value$, ",") = 4)
				OryUIParameters.textColor#[4] = valFloat(GetStringToken(value$, ",", 4))
			endif
		elseif (variable$ = "textcolorid")
			textColorID = val(GetStringToken(value$, ",", 1))
			OryUIParameters.textColor#[1] = GetColorRed(textColorID)
			OryUIParameters.textColor#[2] = GetColorGreen(textColorID)
			OryUIParameters.textColor#[3] = GetColorBlue(textColorID)
		elseif (variable$ = "textsize")
			OryUIParameters.textSize# = valFloat(value$)
		elseif (variable$ = "titletext")
			OryUIParameters.titleText$ = value$
		elseif (variable$ = "titletextalignment")
			if (value$ = "left")
				OryUIParameters.titleTextAlignment = 0
			elseif (value$ = "center" or value$ = "centre")
				OryUIParameters.titleTextAlignment = 1
			elseif (value$ = "right")
				OryUIParameters.titleTextAlignment = 2
			endif
		elseif (variable$ = "titletextbold")
			if (value$ = "true" or value$ = "1")
				OryUIParameters.titleTextBold = 1
			elseif (value$ = "false" or value$ = "0")
				OryUIParameters.titleTextBold = 0
			endif
		elseif (variable$ = "titletextcolor")
			if (CountStringTokens(value$, ",") >= 3)
				OryUIParameters.titleTextColor#[1] = valFloat(GetStringToken(value$, ",", 1))
				OryUIParameters.titleTextColor#[2] = valFloat(GetStringToken(value$, ",", 2))
				OryUIParameters.titleTextColor#[3] = valFloat(GetStringToken(value$, ",", 3))
			endif
			if (CountStringTokens(value$, ",") = 4)
				OryUIParameters.titleTextColor#[4] = valFloat(GetStringToken(value$, ",", 4))
			endif
		elseif (variable$ = "titletextcolorid")
			titleTextColorID = val(GetStringToken(value$, ",", 1))
			OryUIParameters.titleTextColor#[1] = GetColorRed(titleTextColorID)
			OryUIParameters.titleTextColor#[2] = GetColorGreen(titleTextColorID)
			OryUIParameters.titleTextColor#[3] = GetColorBlue(titleTextColorID)
		elseif (variable$ = "titletextsize")
			OryUIParameters.titleTextSize# = valFloat(value$)
		elseif (variable$ = "width")
			OryUIParameters.size#[1] = valFloat(value$)
		elseif (variable$ = "x")
			OryUIParameters.position#[1] = valFloat(value$)
		elseif (variable$ = "y")
			OryUIParameters.position#[2] = valFloat(value$)
		endif
	next	
endfunction

foldend










//	Section For The OryUI Button Component
//
//		Functions available:
//
//			OryUICreateButton(parameters$ as string) returns integer
//			OryUIDeleteButton(buttonID as integer)
//			OryUIGetButtonHeight(buttonID as integer) returns float
//			OryUIGetButtonWidth(buttonID as integer) returns float
//			OryUIGetButtonPressed(buttonID as integer) returns integer
//			OryUIGetButtonReleased(buttonID as integer) returns integer
//			OryUIUpdateButton(buttonID as integer, parameters$ as string)
//
//		Examples of usage:
//
//			button1 = OryUICreateButton("size:30,10;text:Press Me!;offset:center;position:50,50")
//
//			if (OryUIGetButtonReleased(button1) = 1)
//				// DO SOMETHING
//			endif
//
foldstart // OryUIButton Component

type typeOryUIButton
	id as integer
	pressed as integer
	sprBackground as integer
	txtLabel as integer
endtype

global OryUIButtonCollection as typeOryUIButton[]

function OryUICreateButton(parameters$ as string)
	local buttonID as integer
	OryUIButtonCollection.length = OryUIButtonCollection.length + 1
	buttonID = OryUIButtonCollection.length
	OryUIButtonCollection[buttonID].id = buttonID

	OryUIButtonCollection[buttonID].sprBackground = CreateSprite(0)
	SetSpriteSize(OryUIButtonCollection[buttonID].sprBackground, 30, 5)
	SetSpriteColor(OryUIButtonCollection[buttonID].sprBackground, 255, 255, 255, 255)
	SetSpriteOffset(OryUIButtonCollection[buttonID].sprBackground, 0, 0)
	SetSpritePositionByOffset(OryUIButtonCollection[buttonID].sprBackground, 0, 0)
	
	OryUIButtonCollection[buttonID].txtLabel = CreateText("Button")
	SetTextSize(OryUIButtonCollection[buttonID].txtLabel, 3)
	SetTextColor(OryUIButtonCollection[buttonID].txtLabel, 0, 0, 0, 255)
	SetTextAlignment(OryUIButtonCollection[buttonID].txtLabel, 1)
	SetTextDepth(OryUIButtonCollection[buttonID].txtLabel, GetSpriteDepth(OryUIButtonCollection[buttonID].sprBackground) - 1)
	SetTextPosition(OryUIButtonCollection[buttonID].txtLabel, GetSpriteX(OryUIButtonCollection[buttonID].sprBackground) + (GetSpriteWidth(OryUIButtonCollection[buttonID].sprBackground) / 2), (GetSpriteY(OryUIButtonCollection[buttonID].sprBackground) + (GetSpriteHeight(OryUIButtonCollection[buttonID].sprBackground) / 2)) - (GetTextTotalHeight(OryUIButtonCollection[buttonID].txtLabel) / 2))

	if (parameters$ <> "") then OryUIUpdateButton(buttonID, parameters$)
endfunction buttonID

function OryUIDeleteButton(buttonID as integer)
	DeleteSprite(OryUIButtonCollection[buttonID].sprBackground)
	DeleteText(OryUIButtonCollection[buttonID].txtLabel)
endfunction

function OryUIGetButtonHeight(buttonID as integer)
	local buttonHeight#
	if (GetSpriteExists(OryUIButtonCollection[buttonID].sprBackground))
		buttonHeight# = GetSpriteHeight(OryUIButtonCollection[buttonID].sprBackground)
	endif
endfunction buttonHeight#

function OryUIGetButtonWidth(buttonID as integer)
	local buttonWidth#
	if (GetSpriteExists(OryUIButtonCollection[buttonID].sprBackground))
		buttonWidth# = GetSpriteWidth(OryUIButtonCollection[buttonID].sprBackground)
	endif
endfunction buttonWidth#

function OryUIGetButtonPressed(buttonID as integer)
	local buttonPressed as integer
	local buttonSprite as integer
	local buttonText as integer
	if (GetSpriteExists(OryUIButtonCollection[buttonID].sprBackground))
		if (GetPointerPressed())
			buttonSprite = GetSpriteHitTest(OryUIButtonCollection[buttonID].sprBackground, ScreenToWorldX(GetPointerX()), ScreenToWorldX(GetPointerY()))
			buttonText = GetTextHitTest(OryUIButtonCollection[buttonID].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldX(GetPointerY()))
			if (buttonSprite = 1 or buttonText = 1)
				OryUIButtonCollection[buttonID].pressed = 1
			else
				OryUIButtonCollection[buttonID].pressed = 0
			endif
		elseif (OryUIButtonCollection[buttonID].pressed = 1)
			if (GetPointerState())
				buttonSprite = GetSpriteHitTest(OryUIButtonCollection[buttonID].sprBackground, ScreenToWorldX(GetPointerX()), ScreenToWorldX(GetPointerY()))
				buttonText = GetTextHitTest(OryUIButtonCollection[buttonID].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldX(GetPointerY()))
				if (buttonSprite = 1 or buttonText = 1)
					OryUIButtonCollection[buttonID].pressed = 1
				else
					OryUIButtonCollection[buttonID].pressed = 0
				endif
			endif
		endif
		buttonPressed = OryUIButtonCollection[buttonID].pressed
	endif
endfunction buttonPressed

function OryUIGetButtonReleased(buttonID as integer)
	local buttonReleased as integer
	local buttonSprite as integer
	local buttonText as integer
	if (GetSpriteExists(OryUIButtonCollection[buttonID].sprBackground))
		buttonSprite = GetSpriteHitTest(OryUIButtonCollection[buttonID].sprBackground, ScreenToWorldX(GetPointerX()), ScreenToWorldX(GetPointerY()))
		buttonText = GetTextHitTest(OryUIButtonCollection[buttonID].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldX(GetPointerY()))
		if (GetPointerReleased() and OryUIButtonCollection[buttonID].pressed = 1)
			if (buttonSprite = 1 or buttonText = 1)
				butonReleased = 1
			else
				butonReleased = 0
			endif
			OryUIButtonCollection[buttonID].pressed = 0
		endif
	endif
endfunction butonReleased

function OryUIUpdateButton(buttonID as integer, parameters$ as string)
	OryUIResetParametersType()

	if (GetSpriteExists(OryUIButtonCollection[buttonID].sprBackground))
		OryUIParameters.color#[1] = GetSpriteColorRed(OryUIButtonCollection[buttonID].sprBackground)
		OryUIParameters.color#[2] = GetSpriteColorGreen(OryUIButtonCollection[buttonID].sprBackground)
		OryUIParameters.color#[3] = GetSpriteColorBlue(OryUIButtonCollection[buttonID].sprBackground)
		OryUIParameters.color#[4] = GetSpriteColorAlpha(OryUIButtonCollection[buttonID].sprBackground)
		OryUIParameters.depth = GetSpriteDepth(OryUIButtonCollection[buttonID].sprBackground)
		OryUIParameters.imageID = GetSpriteImageID(OryUIButtonCollection[buttonID].sprBackground)
		OryUIParameters.offset#[1] = GetSpriteOffsetX(OryUIButtonCollection[buttonID].sprBackground)
		OryUIParameters.offset#[2] = GetSpriteOffsetY(OryUIButtonCollection[buttonID].sprBackground)
		OryUIParameters.position#[1] = GetSpriteXByOffset(OryUIButtonCollection[buttonID].sprBackground)
		OryUIParameters.position#[2] = GetSpriteYByOffset(OryUIButtonCollection[buttonID].sprBackground)
		OryUIParameters.size#[1] = GetSpriteWidth(OryUIButtonCollection[buttonID].sprBackground)
		OryUIParameters.size#[2] = GetSpriteHeight(OryUIButtonCollection[buttonID].sprBackground)
		OryUIParameters.text$ = GetTextString(OryUIButtonCollection[buttonID].txtLabel)
		OryUIParameters.textAlignment = GetTextAlignment(OryUIButtonCollection[buttonID].txtLabel)
		OryUIParameters.textColor#[1] = GetTextColorRed(OryUIButtonCollection[buttonID].txtLabel)
		OryUIParameters.textColor#[2] = GetTextColorGreen(OryUIButtonCollection[buttonID].txtLabel)
		OryUIParameters.textColor#[3] = GetTextColorBlue(OryUIButtonCollection[buttonID].txtLabel)
		OryUIParameters.textColor#[4] = GetTextColorAlpha(OryUIButtonCollection[buttonID].txtLabel)
		OryUIParameters.textSize# = GetTextSize(OryUIButtonCollection[buttonID].txtLabel)
		if (OryUIParameters.offset#[1] = OryUIParameters.size#[1] / 2 and OryUIParameters.offset#[2] = OryUIParameters.size#[2] / 2) then OryUIParameters.offsetCenter = 1
		
		OryUISetParametersType(parameters$)

		SetSpriteSize(OryUIButtonCollection[buttonID].sprBackground, OryUIParameters.size#[1], OryUIParameters.size#[2])
		SetSpriteColor(OryUIButtonCollection[buttonID].sprBackground, OryUIParameters.color#[1], OryUIParameters.color#[2], OryUIParameters.color#[3], OryUIParameters.color#[4])
		if (OryUIParameters.imageID > 0)
			SetSpriteImage(OryUIButtonCollection[buttonID].sprBackground, OryUIParameters.imageID)
		endif
		SetSpriteDepth(OryUIButtonCollection[buttonID].sprBackground, OryUIParameters.depth)
		if (OryUIParameters.offsetCenter = 1)
			SetSpriteOffset(OryUIButtonCollection[buttonID].sprBackground, OryUIParameters.size#[1], OryUIParameters.size#[2])
		else
			SetSpriteOffset(OryUIButtonCollection[buttonID].sprBackground, OryUIParameters.offset#[1], OryUIParameters.offset#[2])
		endif
		SetSpritePositionByOffset(OryUIButtonCollection[buttonID].sprBackground, OryUIParameters.position#[1], OryUIParameters.position#[2])
		if (OryUIParameters.fixToScreen = 1) then FixSpriteToScreen(OryUIButtonCollection[buttonID].sprBackground, 1)
		
		SetTextString(OryUIButtonCollection[buttonID].txtLabel, OryUIWrapText(OryUIParameters.text$, OryUIParameters.textSize#, OryUIParameters.size#[1]))
		SetTextSize(OryUIButtonCollection[buttonID].txtLabel, OryUIParameters.textSize#)
		if (OryUIParameters.textBold = 0)
			SetTextBold(OryUIButtonCollection[buttonID].txtLabel, 0)
		elseif (OryUIParameters.textBold = 1)
			SetTextBold(OryUIButtonCollection[buttonID].txtLabel, 1)
		endif
		SetTextColor(OryUIButtonCollection[buttonID].txtLabel, OryUIParameters.textColor#[1], OryUIParameters.textColor#[2], OryUIParameters.textColor#[3], OryUIParameters.textColor#[4])
		SetTextAlignment(OryUIButtonCollection[buttonID].txtLabel, 1)
		SetTextDepth(OryUIButtonCollection[buttonID].txtLabel, OryUIParameters.depth - 1)
		if (OryUIParameters.textAlignment = 0)
			OryUIPinTextToCentreLeftOfSprite(OryUIButtonCollection[buttonID].txtLabel, OryUIButtonCollection[buttonID].sprBackground, 2, 0)
		elseif (OryUIParameters.textAlignment = 1)
			OryUIPinTextToCentreOfSprite(OryUIButtonCollection[buttonID].txtLabel, OryUIButtonCollection[buttonID].sprBackground, 0, 0)
		elseif (OryUIParameters.textAlignment = 2)
			OryUIPinTextToCentreRightOfSprite(OryUIButtonCollection[buttonID].txtLabel, OryUIButtonCollection[buttonID].sprBackground, 2, 0)
		endif
	endif
endfunction

foldend










//	Section For The OryUI Card Component
//
//		Functions available:
//
//			OryUICreateCard(parameters$ as string) returns integer
//			OryUIDeleteCard(cardID as integer)
//			OryUIGetCardHeight(cardID as integer) returns float
//			OryUIGetCardWidth(cardID as integer) returns float
//			OryUIUpdateCard(cardID as integer, parameters$ as string)
//
//		Examples of usage:
//
//			card1 = OryUICreateCard("")
//			OryUIUpdateCard(card1, "titleText:Card 1;contentText:This is a card with the minimum settings")
//
//			card2 = OryUICreateCard("titleText:Card 2;titleTextAlignment:center;titleTextColor:255,0,0,255;contentText:This is a card created on one line with extra settings including resize to content." + chr(10) + chr(10) + "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sed nulla sed eros eleifend imperdiet vitae id lorem. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.;contentTextColor:0,0,255,255;position:3,10;color:142,246,170,255;autoHeight:true")
//
foldstart // OryUICard Component

type typeOryUICard
	id as integer
	autoHeight as integer
	sprBackground as integer
	txtContent as integer
	txtTitle as integer
endtype

global OryUICardCollection as typeOryUICard[]

function OryUICreateCard(parameters$ as string)
	local cardID as integer
	OryUICardCollection.length = OryUICardCollection.length + 1
	cardID = OryUICardCollection.length
	OryUICardCollection[cardID].id = cardID
	
	OryUICardCollection[cardID].autoHeight = 0
	
	OryUICardCollection[cardID].sprBackground = CreateSprite(0)
	SetSpriteSize(OryUICardCollection[cardID].sprBackground, 94, 20)
	SetSpriteColor(OryUICardCollection[cardID].sprBackground, 255, 255, 255, 255)
	SetSpriteOffset(OryUICardCollection[cardID].sprBackground, 0, 0)
	SetSpritePositionByOffset(OryUICardCollection[cardID].sprBackground, 0, 0)
	
	OryUICardCollection[cardID].txtTitle = CreateText("")
	SetTextSize(OryUICardCollection[cardID].txtTitle, 3.4)
	SetTextColor(OryUICardCollection[cardID].txtTitle, 0, 0, 0, 255)
	SetTextAlignment(OryUICardCollection[cardID].txtTitle, 0)
	SetTextDepth(OryUICardCollection[cardID].txtTitle, GetSpriteDepth(OryUICardCollection[cardID].sprBackground) - 1)
	SetTextPosition(OryUICardCollection[cardID].txtTitle, GetSpriteX(OryUICardCollection[cardID].sprBackground) + 2, GetSpriteY(OryUICardCollection[cardID].sprBackground) + 2)

	OryUICardCollection[cardID].txtContent = CreateText("")
	SetTextSize(OryUICardCollection[cardID].txtContent, 2.5)
	SetTextColor(OryUICardCollection[cardID].txtContent, 0, 0, 0, 255)
	SetTextAlignment(OryUICardCollection[cardID].txtContent, 0)
	SetTextDepth(OryUICardCollection[cardID].txtContent, GetSpriteDepth(OryUICardCollection[cardID].sprBackground) - 1)
	SetTextPosition(OryUICardCollection[cardID].txtContent, GetSpriteX(OryUICardCollection[cardID].sprBackground) + 2, GetSpriteY(OryUICardCollection[cardID].sprBackground) + 2 + GetTextTotalHeight(OryUICardCollection[cardID].txtTitle) + 2)
	
	if (parameters$ <> "") then OryUIUpdateCard(cardID, parameters$)
endfunction cardID

function OryUIDeleteCard(cardID as integer)
	DeleteSprite(OryUICardCollection[cardID].sprBackground)
	DeleteText(OryUICardCollection[cardID].txtTitle)
	DeleteText(OryUICardCollection[cardID].txtContent)
endfunction

function OryUIGetCardHeight(cardID as integer)
	local cardHeight#
	if (GetSpriteExists(OryUICardCollection[cardID].sprBackground))
		cardHeight# = GetSpriteHeight(OryUICardCollection[cardID].sprBackground)
	endif
endfunction cardHeight#

function OryUIGetCardWidth(cardID as integer)
	local cardWidth#
	if (GetSpriteExists(OryUICardCollection[cardID].sprBackground))
		cardWidth# = GetSpriteWidth(OryUICardCollection[cardID].sprBackground)
	endif
endfunction cardWidth#

function OryUIUpdateCard(cardID as integer, parameters$ as string)
	OryUIResetParametersType()

	if (GetSpriteExists(OryUICardCollection[cardID].sprBackground))
		OryUIParameters.color#[1] = GetSpriteColorRed(OryUICardCollection[cardID].sprBackground)
		OryUIParameters.color#[2] = GetSpriteColorGreen(OryUICardCollection[cardID].sprBackground)
		OryUIParameters.color#[3] = GetSpriteColorBlue(OryUICardCollection[cardID].sprBackground)
		OryUIParameters.color#[4] = GetSpriteColorAlpha(OryUICardCollection[cardID].sprBackground)
		OryUIParameters.contentText$ = GetTextString(OryUICardCollection[cardID].txtContent)
		OryUIParameters.contentTextAlignment = GetTextAlignment(OryUICardCollection[cardID].txtContent)
		OryUIParameters.contentTextColor#[1] = GetTextColorRed(OryUICardCollection[cardID].txtContent)
		OryUIParameters.contentTextColor#[2] = GetTextColorGreen(OryUICardCollection[cardID].txtContent)
		OryUIParameters.contentTextColor#[3] = GetTextColorBlue(OryUICardCollection[cardID].txtContent)
		OryUIParameters.contentTextColor#[4] = GetTextColorAlpha(OryUICardCollection[cardID].txtContent)
		OryUIParameters.contentTextSize# = GetTextSize(OryUICardCollection[cardID].txtContent)
		OryUIParameters.depth = GetSpriteDepth(OryUICardCollection[cardID].sprBackground)
		OryUIParameters.imageID = GetSpriteImageID(OryUICardCollection[cardID].sprBackground)
		OryUIParameters.offset#[1] = GetSpriteOffsetX(OryUICardCollection[cardID].sprBackground)
		OryUIParameters.offset#[2] = GetSpriteOffsetY(OryUICardCollection[cardID].sprBackground)
		OryUIParameters.position#[1] = GetSpriteXByOffset(OryUICardCollection[cardID].sprBackground)
		OryUIParameters.position#[2] = GetSpriteYByOffset(OryUICardCollection[cardID].sprBackground)
		OryUIParameters.size#[1] = GetSpriteWidth(OryUICardCollection[cardID].sprBackground)
		OryUIParameters.size#[2] = GetSpriteHeight(OryUICardCollection[cardID].sprBackground)
		OryUIParameters.titleText$ = GetTextString(OryUICardCollection[cardID].txtTitle)
		OryUIParameters.titleTextAlignment = GetTextAlignment(OryUICardCollection[cardID].txtTitle)
		OryUIParameters.titleTextColor#[1] = GetTextColorRed(OryUICardCollection[cardID].txtTitle)
		OryUIParameters.titleTextColor#[2] = GetTextColorGreen(OryUICardCollection[cardID].txtTitle)
		OryUIParameters.titleTextColor#[3] = GetTextColorBlue(OryUICardCollection[cardID].txtTitle)
		OryUIParameters.titleTextColor#[4] = GetTextColorAlpha(OryUICardCollection[cardID].txtTitle)
		OryUIParameters.titleTextSize# = GetTextSize(OryUICardCollection[cardID].txtTitle)
		if (OryUIParameters.offset#[1] = OryUIParameters.size#[1] / 2 and OryUIParameters.offset#[2] = OryUIParameters.size#[2] / 2) then OryUIParameters.offsetCenter = 1
		
		OryUISetParametersType(parameters$)
		
		if (OryUIParameters.autoHeight >= 0) then OryUICardCollection[cardID].autoHeight = OryUIParameters.autoHeight
		
		SetSpriteSize(OryUICardCollection[cardID].sprBackground, OryUIParameters.size#[1], OryUIParameters.size#[2])
		SetSpriteColor(OryUICardCollection[cardID].sprBackground, OryUIParameters.color#[1], OryUIParameters.color#[2], OryUIParameters.color#[3], OryUIParameters.color#[4])
		if (OryUIParameters.imageID > 0)
			SetSpriteImage(OryUICardCollection[cardID].sprBackground, OryUIParameters.imageID)
		endif
		SetSpriteDepth(OryUICardCollection[cardID].sprBackground, OryUIParameters.depth)
		if (OryUIParameters.offsetCenter = 1)
			SetSpriteOffset(OryUICardCollection[cardID].sprBackground, OryUIParameters.size#[1], OryUIParameters.size#[2])
		else
			SetSpriteOffset(OryUICardCollection[cardID].sprBackground, OryUIParameters.offset#[1], OryUIParameters.offset#[2])
		endif
		SetSpritePositionByOffset(OryUICardCollection[cardID].sprBackground, OryUIParameters.position#[1], OryUIParameters.position#[2])
		if (OryUIParameters.fixToScreen = 1) then FixSpriteToScreen(OryUICardCollection[cardID].sprBackground, 1)
		
		SetTextString(OryUICardCollection[cardID].txtTitle, OryUIWrapText(OryUIParameters.titleText$, OryUIParameters.titleTextSize#, OryUIParameters.size#[1]))
		SetTextSize(OryUICardCollection[cardID].txtTitle, OryUIParameters.titleTextSize#)
		if (OryUIParameters.titleTextBold = 0)
			SetTextBold(OryUICardCollection[cardID].txtTitle, 0)
		elseif (OryUIParameters.titleTextBold = 1)
			SetTextBold(OryUICardCollection[cardID].txtTitle, 1)
		endif
		SetTextColor(OryUICardCollection[cardID].txtTitle, OryUIParameters.titleTextColor#[1], OryUIParameters.titleTextColor#[2], OryUIParameters.titleTextColor#[3], OryUIParameters.titleTextColor#[4])
		SetTextAlignment(OryUICardCollection[cardID].txtTitle, OryUIParameters.titleTextAlignment)
		SetTextDepth(OryUICardCollection[cardID].txtTitle, OryUIParameters.depth - 1)
		if (OryUIParameters.titleTextAlignment = 0)
			OryUIPinTextToTopLeftOfSprite(OryUICardCollection[cardID].txtTitle, OryUICardCollection[cardID].sprBackground, 2, 0.5)
		elseif (OryUIParameters.titleTextAlignment = 1)
			OryUIPinTextToTopCentreOfSprite(OryUICardCollection[cardID].txtTitle, OryUICardCollection[cardID].sprBackground, 0, 0.5)
		elseif (OryUIParameters.titleTextAlignment = 2)
			OryUIPinTextToTopRightOfSprite(OryUICardCollection[cardID].txtTitle, OryUICardCollection[cardID].sprBackground, 2, 0.5)
		endif
		
		SetTextString(OryUICardCollection[cardID].txtContent, OryUIWrapText(OryUIParameters.contentText$, OryUIParameters.contentTextSize#, OryUIParameters.size#[1] - 4))
		SetTextSize(OryUICardCollection[cardID].txtContent, OryUIParameters.contentTextSize#)
		if (OryUIParameters.contentTextBold = 0)
			SetTextBold(OryUICardCollection[cardID].txtContent, 0)
		elseif (OryUIParameters.contentTextBold = 1)
			SetTextBold(OryUICardCollection[cardID].txtContent, 1)
		endif
		SetTextColor(OryUICardCollection[cardID].txtContent, OryUIParameters.contentTextColor#[1], OryUIParameters.contentTextColor#[2], OryUIParameters.contentTextColor#[3], OryUIParameters.contentTextColor#[4])
		SetTextAlignment(OryUICardCollection[cardID].txtContent, OryUIParameters.contentTextAlignment)
		SetTextDepth(OryUICardCollection[cardID].txtContent, OryUIParameters.depth - 1)
		if (OryUIParameters.contentTextAlignment = 0)
			OryUIPinTextToTopLeftOfSprite(OryUICardCollection[cardID].txtContent, OryUICardCollection[cardID].sprBackground, 2, 0.5 + GetTextTotalHeight(OryUICardCollection[cardID].txtTitle) + 1)
		elseif (OryUIParameters.contentTextAlignment = 1)
			OryUIPinTextToTopCentreOfSprite(OryUICardCollection[cardID].txtContent, OryUICardCollection[cardID].sprBackground, 0, 0.5 + GetTextTotalHeight(OryUICardCollection[cardID].txtTitle) + 1)
		elseif (OryUIParameters.contentTextAlignment = 2)
			OryUIPinTextToTopRightOfSprite(OryUICardCollection[cardID].txtContent, OryUICardCollection[cardID].sprBackground, 2, 0.5 + GetTextTotalHeight(OryUICardCollection[cardID].txtTitle) + 1)
		endif
		
		if (OryUICardCollection[cardID].autoHeight = 1)
			SetSpriteSize(OryUICardCollection[cardID].sprBackground, OryUIParameters.size#[1], 0.5 + GetTextTotalHeight(OryUICardCollection[cardID].txtTitle) + 1 + GetTextTotalHeight(OryUICardCollection[cardID].txtContent) + 1)
		endif
	endif
endfunction

foldend










//	Section For The OryUI List Component
//
//		To Do:
//
//			* Allow OryUIInsertListItem to insert a new item before or after any other item, not just at the end.
//			* Allow for 3 lines on the left and right side.
//			* Allow for icons on the left and right side.
//			* Allow for thumbnail on the right side.
//			* Allow for item height to be set.
//
//		Functions available:
//
//			OryUICreateList(parameters$ as string) returns integer
//			OryUIDeleteList(listID as integer)
//			OryUIDeleteListItem(listID as integer, id as integer)
//			OryUIGetListHeight(listID as integer) returns float
//			OryUIGetListItemCount(listID as integer) returns integer
//			OryUIInsertListItem(listID, index, parameters$ as string)
//			OryUISetListItemCount(listID as integer, newListItemCount as integer)
//			OryUIUpdateList(listID as integer, parameters$ as string)
//			OryUIUpdateListItem(listID, id as integer, parameters$ as string)
//
//		Examples of usage:
//
//			list1 = OryUICreateList("noOfLeftLines:1;position:0,20")
//			OryUIInsertListItem(list1, -1, "leftLine1Text:Sundae")
//			OryUIInsertListItem(list1, -1, "leftLine1Text:Snowball")
//
//			list2 = OryUICreateList("")
//			OryUIUpdateList(list2, "showLeftThumbnail:true;noOfLeftLines:2;noOfRightLines:1;position:0,20")
//			OryUIInsertListItem(list2, -1, "leftThumbnailImage:" + str(user[1].profileImage) + ";leftLine1Text:Agnes Talbot;leftLine2Text:I'm watching it now;rightLine1Text:3d;rightLine1TextColor:0,0,0,130")
//			OryUIInsertListItem(list2, -1, "leftThumbnailImage:" + str(user[2].profileImage) + ";leftLine1Text:Sophie Wade;leftLine2Text:Hey boo!;rightLine1Text:1h;rightLine1TextColor:0,0,0,130")
//			OryUIUpdateListItem(list2, 1, "leftLine2Text:Hope you're well xx;leftLine2TextBold:true;rightLine1Text:1s")
//
foldstart // OryUIList Component

type typeOryUIList
	// Variables for list container
	id as integer
	noOfLeftLines as integer
	noOfRightLines as integer
	//showLeftIcon as integer
	showLeftThumbnail as integer
	//showRightIcon as integer
	//showRightThumbnail as integer
	sprBackground as integer
	// Variables for each item in the list
	itemID as integer[]
	sprItemBackground as integer[]
	sprItemDivider as integer[]
	//sprItemLeftIcon as integer[]
	sprItemLeftThumbnail as integer[]
	//sprItemRightIcon as integer[]
	//sprItemRightThumbnail as integer[]
	txtItemLeftLine1 as integer[]
	txtItemLeftLine2 as integer[]
	//txtItemLeftLine3 as integer[]
	txtItemRightLine1 as integer[]
	txtItemRightLine2 as integer[]
	//txtItemRightLine3 as integer[]
endtype

global OryUIListCollection as typeOryUIList[]

function OryUICreateList(parameters$ as string)
	local listID as integer
	OryUIListCollection.length = OryUIListCollection.length + 1
	listID = OryUIListCollection.length
	OryUIListCollection[listID].id = listID

	OryUIListCollection[listID].noOfLeftLines = 1
	OryUIListCollection[listID].noOfRightLines = 0
	//OryUIListCollection[listID].showLeftIcon = 0
	OryUIListCollection[listID].showLeftThumbnail = 0
	//OryUIListCollection[listID].showRightIcon = 0
	//OryUIListCollection[listID].showRightThumbnail = 0

	OryUIListCollection[listID].sprBackground = CreateSprite(0)
	SetSpriteSize(OryUIListCollection[listID].sprBackground, 100, 0)
	SetSpriteColor(OryUIListCollection[listID].sprBackground, 204, 204, 204, 255)
	SetSpriteOffset(OryUIListCollection[listID].sprBackground, 0, 0)
	SetSpritePositionByOffset(OryUIListCollection[listID].sprBackground, 0, 0)

	if (parameters$ <> "") then OryUIUpdateList(listID, parameters$)
endfunction listID

function OryUIDeleteList(listID as integer)
	DeleteSprite(OryUIListCollection[listID].sprBackground)
	while (OryUIListCollection[listID].itemID.length > 0)
		OryUIDeleteListItem(listID, 0)
	endwhile
endfunction

function OryUIDeleteListItem(listID as integer, id as integer)
	DeleteSprite(OryUIListCollection[listID].sprItemBackground[id])
	DeleteSprite(OryUIListCollection[listID].sprItemDivider[id])
	//DeleteSprite(OryUIListCollection[listID].sprItemLeftIcon[id])
	DeleteSprite(OryUIListCollection[listID].sprItemLeftThumbnail[id])
	//DeleteSprite(OryUIListCollection[listID].sprItemRightIcon[id])
	//DeleteSprite(OryUIListCollection[listID].sprItemRightThumbnail[id])
	DeleteText(OryUIListCollection[listID].txtItemLeftLine1[id])
	DeleteText(OryUIListCollection[listID].txtItemLeftLine2[id])
	//DeleteText(OryUIListCollection[listID].txtItemLeftLine3[id])
	DeleteText(OryUIListCollection[listID].txtItemRightLine1[id])
	DeleteText(OryUIListCollection[listID].txtItemRightLine2[id])
	//DeleteText(OryUIListCollection[listID].txtItemRightLine3[id])
	OryUIListCollection[listID].itemID.remove(id)
	OryUIListCollection[listID].sprItemBackground.remove(id)
	OryUIListCollection[listID].sprItemDivider.remove(id)
	//OryUIListCollection[listID].sprItemLeftIcon.remove(id)
	OryUIListCollection[listID].sprItemLeftThumbnail.remove(id)
	//OryUIListCollection[listID].sprItemRightIcon.remove(id)
	//OryUIListCollection[listID].sprItemRightThumbnail.remove(id)
	OryUIListCollection[listID].txtItemLeftLine1.remove(id)
	OryUIListCollection[listID].txtItemLeftLine2.remove(id)
	//OryUIListCollection[listID].txtItemLeftLine3.remove(id)
	OryUIListCollection[listID].txtItemRightLine1.remove(id)
	OryUIListCollection[listID].txtItemRightLine2.remove(id)
	//OryUIListCollection[listID].txtItemRightLine3.remove(id)
endfunction

function OryUIGetListHeight(listID as integer)
	local listEndY#
	local listHeight#
	local listStartY#
	listStartY# = GetSpriteY(OryUIListCollection[listID].sprBackground)
	for i = OryUIGetListItemCount(listID) to 0 step -1
		if (GetSpriteExists(OryUIListCollection[listID].sprItemBackground[i]))
			listEndY# = GetSpriteY(OryUIListCollection[listID].sprItemBackground[i]) + GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[i])
			exit
		endif
	next
	listHeight# = listEndY# - listStartY#
endfunction listHeight#

function OryUIGetListItemCount(listID as integer)
	local listItemCount
	listItemCount = OryUIListCollection[listID].itemID.length
endfunction listItemCount

function OryUIInsertListItem(listID, index, parameters$ as string)
	local id as integer

	if (index = -1)
		OryUIListCollection[listID].itemID.length = OryUIListCollection[listID].itemID.length + 1
		OryUIListCollection[listID].sprItemBackground.length = OryUIListCollection[listID].sprItemBackground.length + 1
		OryUIListCollection[listID].sprItemDivider.length = OryUIListCollection[listID].sprItemDivider.length + 1
		//OryUIListCollection[listID].sprItemLeftIcon.length = OryUIListCollection[listID].sprItemLeftIcon.length + 1
		OryUIListCollection[listID].sprItemLeftThumbnail.length = OryUIListCollection[listID].sprItemLeftThumbnail.length + 1
		//OryUIListCollection[listID].sprItemRightIcon.length = OryUIListCollection[listID].sprItemRightIcon.length + 1
		//OryUIListCollection[listID].sprItemRightThumbnail.length = OryUIListCollection[listID].sprItemRightThumbnail.length + 1
		OryUIListCollection[listID].txtItemLeftLine1.length = OryUIListCollection[listID].txtItemLeftLine1.length + 1
		OryUIListCollection[listID].txtItemLeftLine2.length = OryUIListCollection[listID].txtItemLeftLine2.length + 1
		//OryUIListCollection[listID].txtItemLeftLine3.length = OryUIListCollection[listID].txtItemLeftLine3.length + 1
		OryUIListCollection[listID].txtItemRightLine1.length = OryUIListCollection[listID].txtItemRightLine1.length + 1
		OryUIListCollection[listID].txtItemRightLine2.length = OryUIListCollection[listID].txtItemRightLine2.length + 1
		//OryUIListCollection[listID].txtItemRightLine3.length = OryUIListCollection[listID].txtItemRightLine3.length + 1
		itemID = OryUIListCollection[listID].sprItemBackground.length
		OryUIListCollection[listID].itemID[itemID] = itemID
	endif

	OryUIListCollection[listID].sprItemBackground[itemID] = CreateSprite(0)
	SetSpriteSize(OryUIListCollection[listID].sprItemBackground[itemID], 100, 7)
	SetSpriteDepth(OryUIListCollection[listID].sprItemBackground[itemID], GetSpriteDepth(OryUIListCollection[listID].sprBackground) - 1)
	SetSpriteColor(OryUIListCollection[listID].sprItemBackground[itemID], 255, 255, 255, 255)
	SetSpriteOffset(OryUIListCollection[listID].sprItemBackground[itemID], 0, 0)
	SetSpritePositionByOffset(OryUIListCollection[listID].sprItemBackground[itemID], GetSpriteXByOffset(OryUIListCollection[listID].sprBackground), GetSpriteYByOffset(OryUIListCollection[listID].sprBackground) + 0.1 + (itemID * 7.0))

	OryUIListCollection[listID].txtItemLeftLine1[itemID] = CreateText(" ")
	SetTextSize(OryUIListCollection[listID].txtItemLeftLine1[itemID], 3)
	SetTextColor(OryUIListCollection[listID].txtItemLeftLine1[itemID], 0, 0, 0, 255)
	SetTextAlignment(OryUIListCollection[listID].txtItemLeftLine1[itemID], 0)
	SetTextDepth(OryUIListCollection[listID].txtItemLeftLine1[itemID], GetSpriteDepth(OryUIListCollection[listID].sprItemBackground[itemID]) - 1)
	//SetTextPosition(OryUIListCollection[listID].txtItemLeftLine1[itemID], GetSpriteX(OryUIListCollection[listID].sprItemBackground[itemID]) + 4, GetSpriteY(OryUIListCollection[listID].sprItemBackground[itemID]) + (GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[itemID]) / 2.0) - (GetTextTotalHeight(OryUIListCollection[listID].txtItemLeftLine1[itemID]) / 2.0))

	OryUIListCollection[listID].txtItemLeftLine2[itemID] = CreateText(" ")
	SetTextSize(OryUIListCollection[listID].txtItemLeftLine2[itemID], 2.6)
	SetTextColor(OryUIListCollection[listID].txtItemLeftLine2[itemID], 0, 0, 0, 255)
	SetTextAlignment(OryUIListCollection[listID].txtItemLeftLine2[itemID], 0)
	SetTextDepth(OryUIListCollection[listID].txtItemLeftLine2[itemID], GetSpriteDepth(OryUIListCollection[listID].sprItemBackground[itemID]) - 1)
	//SetTextPosition(OryUIListCollection[listID].txtItemLeftLine2[itemID], GetSpriteX(OryUIListCollection[listID].sprItemBackground[itemID]) + 4, GetSpriteY(OryUIListCollection[listID].sprItemBackground[itemID]) + (GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[itemID]) / 2.0) - (GetTextTotalHeight(OryUIListCollection[listID].txtItemLeftLine2[itemID]) / 2.0))

	//OryUIListCollection[listID].txtItemLeftLine3[itemID] = CreateText(" ")
	//SetTextSize(OryUIListCollection[listID].txtItemLeftLine3[itemID], 3)
	//SetTextColor(OryUIListCollection[listID].txtItemLeftLine3[itemID], 0, 0, 0, 255)
	//SetTextAlignment(OryUIListCollection[listID].txtItemLeftLine3[itemID], 0)
	//SetTextDepth(OryUIListCollection[listID].txtItemLeftLine3[itemID], GetSpriteDepth(OryUIListCollection[listID].sprItemBackground[itemID]) - 1)
	////SetTextPosition(OryUIListCollection[listID].txtItemLeftLine3[itemID], GetSpriteX(OryUIListCollection[listID].sprItemBackground[itemID]) + 4, GetSpriteY(OryUIListCollection[listID].sprItemBackground[itemID]) + (GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[itemID]) / 2.0) - (GetTextTotalHeight(OryUIListCollection[listID].txtItemLeftLine3[itemID]) / 2.0))

	OryUIListCollection[listID].txtItemRightLine1[itemID] = CreateText(" ")
	SetTextSize(OryUIListCollection[listID].txtItemRightLine1[itemID], 3)
	SetTextColor(OryUIListCollection[listID].txtItemRightLine1[itemID], 0, 0, 0, 255)
	SetTextAlignment(OryUIListCollection[listID].txtItemRightLine1[itemID], 2)
	SetTextDepth(OryUIListCollection[listID].txtItemRightLine1[itemID], GetSpriteDepth(OryUIListCollection[listID].sprItemBackground[itemID]) - 1)
	//SetTextPosition(OryUIListCollection[listID].txtItemRightLine1[itemID], (GetSpriteX(OryUIListCollection[listID].sprItemBackground[itemID]) + GetSpriteWidth(OryUIListCollection[listID].sprItemBackground[itemID])) - 4, GetSpriteY(OryUIListCollection[listID].sprItemBackground[itemID]) + (GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[itemID]) / 2.0) - (GetTextTotalHeight(OryUIListCollection[listID].txtItemRightLine1[itemID]) / 2.0))

	OryUIListCollection[listID].txtItemRightLine2[itemID] = CreateText(" ")
	SetTextSize(OryUIListCollection[listID].txtItemRightLine2[itemID], 2.6)
	SetTextColor(OryUIListCollection[listID].txtItemRightLine2[itemID], 0, 0, 0, 255)
	SetTextAlignment(OryUIListCollection[listID].txtItemRightLine2[itemID], 2)
	SetTextDepth(OryUIListCollection[listID].txtItemRightLine2[itemID], GetSpriteDepth(OryUIListCollection[listID].sprItemBackground[itemID]) - 1)
	//SetTextPosition(OryUIListCollection[listID].txtItemRightLine2[itemID], (GetSpriteX(OryUIListCollection[listID].sprItemBackground[itemID]) + GetSpriteWidth(OryUIListCollection[listID].sprItemBackground[itemID])) - 4, GetSpriteY(OryUIListCollection[listID].sprItemBackground[itemID]) + (GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[itemID]) / 2.0) - (GetTextTotalHeight(OryUIListCollection[listID].txtItemRightLine2[itemID]) / 2.0))

	//OryUIListCollection[listID].txtItemRightLine3[itemID] = CreateText(" ")
	//SetTextSize(OryUIListCollection[listID].txtItemRightLine3[itemID], 2.6)
	//SetTextColor(OryUIListCollection[listID].txtItemRightLine3[itemID], 0, 0, 0, 255)
	//SetTextAlignment(OryUIListCollection[listID].txtItemRightLine3[itemID], 2)
	//SetTextDepth(OryUIListCollection[listID].txtItemRightLine3[itemID], GetSpriteDepth(OryUIListCollection[listID].sprItemBackground[itemID]) - 1)
	////SetTextPosition(OryUIListCollection[listID].txtItemRightLine3[itemID], (GetSpriteX(OryUIListCollection[listID].sprItemBackground[itemID]) + GetSpriteWidth(OryUIListCollection[listID].sprItemBackground[itemID])) - 4, GetSpriteY(OryUIListCollection[listID].sprItemBackground[itemID]) + (GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[itemID]) / 2.0) - (GetTextTotalHeight(OryUIListCollection[listID].txtItemRightLine3[itemID]) / 2.0))

	OryUIListCollection[listID].sprItemDivider[itemID] = CreateSprite(0)
	SetSpriteSize(OryUIListCollection[listID].sprItemDivider[itemID], 100, 0.1)
	SetSpriteDepth(OryUIListCollection[listID].sprItemDivider[itemID], GetSpriteDepth(OryUIListCollection[listID].sprItemBackground[itemID]) - 1)
	SetSpriteColor(OryUIListCollection[listID].sprItemDivider[itemID], 204, 204, 204, 255)
	SetSpriteOffset(OryUIListCollection[listID].sprItemDivider[itemID], 0, 0.05)
	//SetSpritePositionByOffset(OryUIListCollection[listID].sprItemDivider[itemID], GetSpriteXByOffset(OryUIListCollection[listID].sprItemBackground[itemID]), GetSpriteYByOffset(OryUIListCollection[listID].sprItemBackground[itemID]) + GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[itemID]))

	//OryUIListCollection[listID].sprItemLeftIcon[itemID] = CreateSprite(0)
	//SetSpriteSize(OryUIListCollection[listID].sprItemLeftIcon[itemID], -1, 2)
	//SetSpriteDepth(OryUIListCollection[listID].sprItemLeftIcon[itemID], GetSpriteDepth(OryUIListCollection[listID].sprItemBackground[itemID]) - 1)
	//SetSpriteColor(OryUIListCollection[listID].sprItemLeftIcon[itemID], 255, 255, 255, 255)
	//SetSpriteOffset(OryUIListCollection[listID].sprItemLeftIcon[itemID], GetSpriteWidth(OryUIListCollection[listID].sprItemLeftIcon[itemID]) / 2, GetSpriteHeight(OryUIListCollection[listID].sprItemLeftIcon[itemID]) / 2)
	////SetSpritePositionByOffset(OryUIListCollection[listID].sprItemLeftIcon[itemID], GetSpriteXByOffset(OryUIListCollection[listID].sprItemBackground[itemID]) + 2 + (GetSpriteWidth(OryUIListCollection[listID].sprItemLeftIcon[itemID]) / 2), GetSpriteYByOffset(OryUIListCollection[listID].sprItemBackground[itemID]) + (GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[itemID]) / 2))

	OryUIListCollection[listID].sprItemLeftThumbnail[itemID] = CreateSprite(0)
	SetSpriteSize(OryUIListCollection[listID].sprItemLeftThumbnail[itemID], -1, 4)
	SetSpriteDepth(OryUIListCollection[listID].sprItemLeftThumbnail[itemID], GetSpriteDepth(OryUIListCollection[listID].sprItemBackground[itemID]) - 1)
	SetSpriteColor(OryUIListCollection[listID].sprItemLeftThumbnail[itemID], 255, 255, 255, 255)
	SetSpriteOffset(OryUIListCollection[listID].sprItemLeftThumbnail[itemID], GetSpriteWidth(OryUIListCollection[listID].sprItemLeftThumbnail[itemID]) / 2, GetSpriteHeight(OryUIListCollection[listID].sprItemLeftThumbnail[itemID]) / 2)
	//SetSpritePositionByOffset(OryUIListCollection[listID].sprItemLeftThumbnail[itemID], GetSpriteXByOffset(OryUIListCollection[listID].sprItemBackground[itemID]) + 2 + (GetSpriteWidth(OryUIListCollection[listID].sprItemLeftThumbnail[itemID]) / 2), GetSpriteYByOffset(OryUIListCollection[listID].sprItemBackground[itemID]) + (GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[itemID]) / 2))

	//OryUIListCollection[listID].sprItemRightIcon[itemID] = CreateSprite(0)
	//SetSpriteSize(OryUIListCollection[listID].sprItemRightIcon[itemID], -1, 2)
	//SetSpriteDepth(OryUIListCollection[listID].sprItemRightIcon[itemID], GetSpriteDepth(OryUIListCollection[listID].sprItemBackground[itemID]) - 1)
	//SetSpriteColor(OryUIListCollection[listID].sprItemRightIcon[itemID], 255, 255, 255, 255)
	//SetSpriteOffset(OryUIListCollection[listID].sprItemRightIcon[itemID], GetSpriteWidth(OryUIListCollection[listID].sprItemRightIcon[itemID]) / 2, GetSpriteHeight(OryUIListCollection[listID].sprItemRightIcon[itemID]) / 2)
	////SetSpritePositionByOffset(OryUIListCollection[listID].sprItemRightIcon[itemID], GetSpriteXByOffset(OryUIListCollection[listID].sprItemBackground[itemID]) + 2 + (GetSpriteWidth(OryUIListCollection[listID].sprItemRightIcon[itemID]) / 2), GetSpriteYByOffset(OryUIListCollection[listID].sprItemBackground[itemID]) + (GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[itemID]) / 2))

	//OryUIListCollection[listID].sprItemRightThumbnail[itemID] = CreateSprite(0)
	//SetSpriteSize(OryUIListCollection[listID].sprItemRightThumbnail[itemID], -1, 4)
	//SetSpriteDepth(OryUIListCollection[listID].sprItemRightThumbnail[itemID], GetSpriteDepth(OryUIListCollection[listID].sprItemRightThumbnail[itemID]) - 1)
	//SetSpriteColor(OryUIListCollection[listID].sprItemRightThumbnail[itemID], 255, 255, 255, 255)
	//SetSpriteOffset(OryUIListCollection[listID].sprItemRightThumbnail[itemID], GetSpriteWidth(OryUIListCollection[listID].sprItemRightThumbnail[itemID]) / 2, GetSpriteHeight(OryUIListCollection[listID].sprItemRightThumbnail[itemID]) / 2)
	////SetSpritePositionByOffset(OryUIListCollection[listID].sprItemRightThumbnail[itemID], GetSpriteXByOffset(OryUIListCollection[listID].sprItemBackground[itemID]) + 2 + (GetSpriteWidth(OryUIListCollection[listID].sprItemRightThumbnail[itemID]) / 2), GetSpriteYByOffset(OryUIListCollection[listID].sprItemBackground[itemID]) + (GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[itemID]) / 2))

	if (parameters$ <> "") then OryUIUpdateListItem(listID, itemID, parameters$)
endfunction

function OryUISetListItemCount(listID as integer, newListItemCount as integer)
	local oldListItemCount
	oldListItemCount = OryUIGetListItemCount(listID)
	while (OryUIGetListItemCount(listID) > newListItemCount)
		OryUIDeleteListItem(listID, OryUIGetListItemCount(listID))
	endwhile
	for i = 0 to newListItemCount
		if (i > oldListItemCount)
			OryUIInsertListItem(listID, -1, "")
		endif
	next
endfunction

function OryUIUpdateList(listID as integer, parameters$ as string)
	OryUIResetParametersType()

	if (GetSpriteExists(OryUIListCollection[listID].sprBackground))
		OryUIParameters.depth = GetSpriteDepth(OryUIListCollection[listID].sprBackground)
		OryUIParameters.noOfLeftLines = OryUIListCollection[listID].noOfLeftLines
		OryUIParameters.noOfRightLines = OryUIListCollection[listID].noOfRightLines
		OryUIParameters.position#[1] = GetSpriteXByOffset(OryUIListCollection[listID].sprBackground)
		OryUIParameters.position#[2] = GetSpriteYByOffset(OryUIListCollection[listID].sprBackground)
		//OryUIParameters.showLeftIcon = OryUIListCollection[listID].showLeftIcon
		OryUIParameters.showLeftThumbnail = OryUIListCollection[listID].showLeftThumbnail
		//OryUIParameters.showRightIcon = OryUIListCollection[listID].showRightIcon
		//OryUIParameters.showRightThumbnail = OryUIListCollection[listID].showRightThumbnail
		OryUIParameters.size#[1] = GetSpriteWidth(OryUIListCollection[listID].sprBackground)
		OryUIParameters.size#[2] = GetSpriteHeight(OryUIListCollection[listID].sprBackground)
		if (OryUIParameters.offset#[1] = (OryUIParameters.size#[1] / 2) and OryUIParameters.offset#[2] = (OryUIParameters.size#[2] / 2)) then OryUIParameters.offsetCenter = 1
	
		OryUISetParametersType(parameters$)

		if (OryUIParameters.noOfLeftLines > 0) then OryUIListCollection[listID].noOfLeftLines = OryUIParameters.noOfLeftLines
		if (OryUIParameters.noOfRightLines > 0) then OryUIListCollection[listID].noOfRightLines = OryUIParameters.noOfRightLines
		//if (OryUIParameters.showLeftIcon >= 0) then OryUIListCollection[listID].showLeftIcon = OryUIParameters.showLeftIcon
		if (OryUIParameters.showLeftThumbnail >= 0) then OryUIListCollection[listID].showLeftThumbnail = OryUIParameters.showLeftThumbnail
		//if (OryUIParameters.showRightIcon >= 0) then OryUIListCollection[listID].showRightIcon = OryUIParameters.showRightIcon
		//if (OryUIParameters.showRightThumbnail >= 0) then OryUIListCollection[listID].showRightThumbnail = OryUIParameters.showRightThumbnail
		
		SetSpriteDepth(OryUIListCollection[listID].sprBackground, OryUIParameters.depth)
		SetSpritePositionByOffset(OryUIListCollection[listID].sprBackground, OryUIParameters.position#[1], OryUIParameters.position#[2])
		SetSpriteSize(OryUIListCollection[listID].sprBackground, OryUIParameters.size#[1], 0)
	endif
endfunction

function OryUIUpdateListItem(listID, itemID as integer, parameters$ as string)
	OryUIResetParametersType()

	if (GetSpriteExists(OryUIListCollection[listID].sprItemBackground[itemID]))
		OryUIParameters.color#[1] = GetSpriteColorRed(OryUIListCollection[listID].sprItemBackground[itemID])
		OryUIParameters.color#[2] = GetSpriteColorGreen(OryUIListCollection[listID].sprItemBackground[itemID])
		OryUIParameters.color#[3] = GetSpriteColorBlue(OryUIListCollection[listID].sprItemBackground[itemID])
		OryUIParameters.color#[4] = GetSpriteColorAlpha(OryUIListCollection[listID].sprItemBackground[itemID])
		//OryUIParameters.leftIconImageID = GetSpriteImageID(OryUIListCollection[listID].sprItemLeftIcon[itemID])
		OryUIParameters.leftLine1Text$ = GetTextString(OryUIListCollection[listID].txtItemLeftLine1[itemID])
		OryUIParameters.leftLine1TextAlignment = GetTextAlignment(OryUIListCollection[listID].txtItemLeftLine1[itemID])
		OryUIParameters.leftLine1TextColor#[1] = GetTextColorRed(OryUIListCollection[listID].txtItemLeftLine1[itemID])
		OryUIParameters.leftLine1TextColor#[2] = GetTextColorGreen(OryUIListCollection[listID].txtItemLeftLine1[itemID])
		OryUIParameters.leftLine1TextColor#[3] = GetTextColorBlue(OryUIListCollection[listID].txtItemLeftLine1[itemID])
		OryUIParameters.leftLine1TextColor#[4] = GetTextColorAlpha(OryUIListCollection[listID].txtItemLeftLine1[itemID])
		OryUIParameters.leftLine1TextSize# = GetTextSize(OryUIListCollection[listID].txtItemLeftLine1[itemID])
		OryUIParameters.leftLine1Text$ = GetTextString(OryUIListCollection[listID].txtItemLeftLine1[itemID])
		OryUIParameters.leftLine2Text$ = GetTextString(OryUIListCollection[listID].txtItemLeftLine2[itemID])
		OryUIParameters.leftLine2TextAlignment = GetTextAlignment(OryUIListCollection[listID].txtItemLeftLine2[itemID])
		OryUIParameters.leftLine2TextColor#[1] = GetTextColorRed(OryUIListCollection[listID].txtItemLeftLine2[itemID])
		OryUIParameters.leftLine2TextColor#[2] = GetTextColorGreen(OryUIListCollection[listID].txtItemLeftLine2[itemID])
		OryUIParameters.leftLine2TextColor#[3] = GetTextColorBlue(OryUIListCollection[listID].txtItemLeftLine2[itemID])
		OryUIParameters.leftLine2TextColor#[4] = GetTextColorAlpha(OryUIListCollection[listID].txtItemLeftLine2[itemID])
		OryUIParameters.leftLine2TextSize# = GetTextSize(OryUIListCollection[listID].txtItemLeftLine2[itemID])
		OryUIParameters.leftLine2Text$ = GetTextString(OryUIListCollection[listID].txtItemLeftLine2[itemID])
		//OryUIParameters.leftLine3Text$ = GetTextString(OryUIListCollection[listID].txtItemLeftLine3[itemID])
		//OryUIParameters.leftLine3TextAlignment = GetTextAlignment(OryUIListCollection[listID].txtItemLeftLine3[itemID])
		//OryUIParameters.leftLine3TextColor#[1] = GetTextColorRed(OryUIListCollection[listID].txtItemLeftLine3[itemID])
		//OryUIParameters.leftLine3TextColor#[2] = GetTextColorGreen(OryUIListCollection[listID].txtItemLeftLine3[itemID])
		//OryUIParameters.leftLine3TextColor#[3] = GetTextColorBlue(OryUIListCollection[listID].txtItemLeftLine3[itemID])
		//OryUIParameters.leftLine3TextColor#[4] = GetTextColorAlpha(OryUIListCollection[listID].txtItemLeftLine3[itemID])
		//OryUIParameters.leftLine3TextSize# = GetTextSize(OryUIListCollection[listID].txtItemLeftLine3[itemID])
		//OryUIParameters.leftLine3Text$ = GetTextString(OryUIListCollection[listID].txtItemLeftLine3[itemID])
		OryUIParameters.leftThumbnailImageID = GetSpriteImageID(OryUIListCollection[listID].sprItemLeftThumbnail[itemID])
		//OryUIParameters.rightIconImageID = GetSpriteImageID(OryUIListCollection[listID].sprItemRightIcon[itemID])
		OryUIParameters.rightLine1Text$ = GetTextString(OryUIListCollection[listID].txtItemRightLine1[itemID])
		OryUIParameters.rightLine1TextAlignment = GetTextAlignment(OryUIListCollection[listID].txtItemRightLine1[itemID])
		OryUIParameters.rightLine1TextColor#[1] = GetTextColorRed(OryUIListCollection[listID].txtItemRightLine1[itemID])
		OryUIParameters.rightLine1TextColor#[2] = GetTextColorGreen(OryUIListCollection[listID].txtItemRightLine1[itemID])
		OryUIParameters.rightLine1TextColor#[3] = GetTextColorBlue(OryUIListCollection[listID].txtItemRightLine1[itemID])
		OryUIParameters.rightLine1TextColor#[4] = GetTextColorAlpha(OryUIListCollection[listID].txtItemRightLine1[itemID])
		OryUIParameters.rightLine1TextSize# = GetTextSize(OryUIListCollection[listID].txtItemRightLine1[itemID])
		OryUIParameters.rightLine1Text$ = GetTextString(OryUIListCollection[listID].txtItemRightLine1[itemID])
		OryUIParameters.rightLine2Text$ = GetTextString(OryUIListCollection[listID].txtItemRightLine2[itemID])
		OryUIParameters.rightLine2TextAlignment = GetTextAlignment(OryUIListCollection[listID].txtItemRightLine2[itemID])
		OryUIParameters.rightLine2TextColor#[1] = GetTextColorRed(OryUIListCollection[listID].txtItemRightLine2[itemID])
		OryUIParameters.rightLine2TextColor#[2] = GetTextColorGreen(OryUIListCollection[listID].txtItemRightLine2[itemID])
		OryUIParameters.rightLine2TextColor#[3] = GetTextColorBlue(OryUIListCollection[listID].txtItemRightLine2[itemID])
		OryUIParameters.rightLine2TextColor#[4] = GetTextColorAlpha(OryUIListCollection[listID].txtItemRightLine2[itemID])
		OryUIParameters.rightLine2TextSize# = GetTextSize(OryUIListCollection[listID].txtItemRightLine2[itemID])
		OryUIParameters.rightLine2Text$ = GetTextString(OryUIListCollection[listID].txtItemRightLine2[itemID])
		//OryUIParameters.rightLine3Text$ = GetTextString(OryUIListCollection[listID].txtItemRightLine3[itemID])
		//OryUIParameters.rightLine3TextAlignment = GetTextAlignment(OryUIListCollection[listID].txtItemRightLine3[itemID])
		//OryUIParameters.rightLine3TextColor#[1] = GetTextColorRed(OryUIListCollection[listID].txtItemRightLine3[itemID])
		//OryUIParameters.rightLine3TextColor#[2] = GetTextColorGreen(OryUIListCollection[listID].txtItemRightLine3[itemID])
		//OryUIParameters.rightLine3TextColor#[3] = GetTextColorBlue(OryUIListCollection[listID].txtItemRightLine3[itemID])
		//OryUIParameters.rightLine3TextColor#[4] = GetTextColorAlpha(OryUIListCollection[listID].txtItemRightLine3[itemID])
		//OryUIParameters.rightLine3TextSize# = GetTextSize(OryUIListCollection[listID].txtItemRightLine3[itemID])
		//OryUIParameters.rightLine3Text$ = GetTextString(OryUIListCollection[listID].txtItemRightLine3[itemID])
		//OryUIParameters.rightThumbnailImageID = GetSpriteImageID(OryUIListCollection[listID].sprItemRightThumbnail[itemID])
		
		OryUISetParametersType(parameters$)
		
		SetSpriteColor(OryUIListCollection[listID].sprItemBackground[itemID], OryUIParameters.color#[1], OryUIParameters.color#[2], OryUIParameters.color#[3], OryUIParameters.color#[4])
		
		if (OryUIListCollection[listID].showLeftThumbnail = 1)
			if (OryUIParameters.leftThumbnailImageID > 0)
				SetSpriteColor(OryUIListCollection[listID].sprItemLeftThumbnail[itemID], 255, 255, 255, 255)
				SetSpriteImage(OryUIListCollection[listID].sprItemLeftThumbnail[itemID], OryUIParameters.leftThumbnailImageID)
				SetSpriteSize(OryUIListCollection[listID].sprItemLeftThumbnail[itemID], -1, 4)
			else
				SetSpriteColor(OryUIListCollection[listID].sprItemLeftThumbnail[itemID], 204, 204, 204, 255)
				SetSpriteImage(OryUIListCollection[listID].sprItemLeftThumbnail[itemID], 0)
				SetSpriteSize(OryUIListCollection[listID].sprItemLeftThumbnail[itemID], -1, 4)
			endif
		else
			SetSpriteSize(OryUIListCollection[listID].sprItemLeftThumbnail[itemID], 0, 0)
		endif
		OryUIPinSpriteToCentreLeftOfSprite(OryUIListCollection[listID].sprItemLeftThumbnail[itemID], OryUIListCollection[listID].sprItemBackground[itemID], 2 + (GetSpriteWidth(OryUIListCollection[listID].sprItemLeftThumbnail[itemID]) / 2), 0)
		
		SetTextString(OryUIListCollection[listID].txtItemLeftLine1[itemID], OryUIParameters.leftLine1Text$)
		SetTextSize(OryUIListCollection[listID].txtItemLeftLine1[itemID], OryUIParameters.leftLine1TextSize#)
		if (OryUIParameters.leftLine1TextBold = 0)
			SetTextBold(OryUIListCollection[listID].txtItemLeftLine1[itemID], 0)
		elseif (OryUIParameters.leftLine1TextBold = 1)
			SetTextBold(OryUIListCollection[listID].txtItemLeftLine1[itemID], 1)
		endif
		SetTextColor(OryUIListCollection[listID].txtItemLeftLine1[itemID], OryUIParameters.leftLine1TextColor#[1], OryUIParameters.leftLine1TextColor#[2], OryUIParameters.leftLine1TextColor#[3], OryUIParameters.leftLine1TextColor#[4])
		if (OryUIListCollection[listID].noOfLeftLines = 1)
			SetTextPosition(OryUIListCollection[listID].txtItemLeftLine1[itemID], GetSpriteX(OryUIListCollection[listID].sprItemBackground[itemID]) + 4 + GetSpriteWidth(OryUIListCollection[listID].sprItemLeftThumbnail[itemID]), (GetSpriteY(OryUIListCollection[listID].sprItemBackground[itemID]) + (GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[itemID]) / 2.0)) - (GetTextTotalHeight(OryUIListCollection[listID].txtItemLeftLine1[itemID]) / 2.0))
		elseif (OryUIListCollection[listID].noOfLeftLines = 2)
			SetTextPosition(OryUIListCollection[listID].txtItemLeftLine1[itemID], GetSpriteX(OryUIListCollection[listID].sprItemBackground[itemID]) + 4 + GetSpriteWidth(OryUIListCollection[listID].sprItemLeftThumbnail[itemID]), (GetSpriteY(OryUIListCollection[listID].sprItemBackground[itemID]) + (GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[itemID]) / 2.0)) - GetTextTotalHeight(OryUIListCollection[listID].txtItemLeftLine1[itemID]) - 0.1)
		endif
			
		SetTextString(OryUIListCollection[listID].txtItemLeftLine2[itemID], OryUIParameters.leftLine2Text$)
		SetTextSize(OryUIListCollection[listID].txtItemLeftLine2[itemID], OryUIParameters.leftLine2TextSize#)
		if (OryUIParameters.leftLine2TextBold = 0)
			SetTextBold(OryUIListCollection[listID].txtItemLeftLine2[itemID], 0)
		elseif (OryUIParameters.leftLine2TextBold = 1)
			SetTextBold(OryUIListCollection[listID].txtItemLeftLine2[itemID], 1)
		endif
		SetTextColor(OryUIListCollection[listID].txtItemLeftLine2[itemID], OryUIParameters.leftLine2TextColor#[1], OryUIParameters.leftLine2TextColor#[2], OryUIParameters.leftLine2TextColor#[3], OryUIParameters.leftLine2TextColor#[4])
		if (OryUIListCollection[listID].noOfLeftLines = 1)
			SetTextPosition(OryUIListCollection[listID].txtItemLeftLine2[itemID], -10000, -10000)
		elseif (OryUIListCollection[listID].noOfLeftLines = 2)
			SetTextPosition(OryUIListCollection[listID].txtItemLeftLine2[itemID], GetSpriteX(OryUIListCollection[listID].sprItemBackground[itemID]) + 4 + GetSpriteWidth(OryUIListCollection[listID].sprItemLeftThumbnail[itemID]), GetSpriteY(OryUIListCollection[listID].sprItemBackground[itemID]) + (GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[itemID]) / 2.0) + 0.1)
		endif
			
		//SetTextString(OryUIListCollection[listID].txtItemLeftLine3[itemID], OryUIParameters.leftLine3Text$)
		//SetTextSize(OryUIListCollection[listID].txtItemLeftLine3[itemID], OryUIParameters.leftLine3TextSize#)
		//if (OryUIParameters.leftLine3TextBold = 0)
			//SetTextBold(OryUIListCollection[listID].txtItemLeftLine3[itemID], 0)
		//elseif (OryUIParameters.leftLine3TextBold = 1)
			//SetTextBold(OryUIListCollection[listID].txtItemLeftLine3[itemID], 1)
		//endif
		//SetTextColor(OryUIListCollection[listID].txtItemLeftLine3[itemID], OryUIParameters.leftLine3TextColor#[1], OryUIParameters.leftLine3TextColor#[2], OryUIParameters.leftLine3TextColor#[3], OryUIParameters.leftLine3TextColor#[4])
		//SetTextPosition(OryUIListCollection[listID].txtItemLeftLine3[itemID], GetSpriteX(OryUIListCollection[listID].sprItemBackground[itemID]) + 4 + GetSpriteWidth(OryUIListCollection[listID].sprItemLeftThumbnail[itemID]), GetSpriteY(OryUIListCollection[listID].sprItemBackground[itemID]) + (GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[itemID]) / 2.0) - (GetTextTotalHeight(OryUIListCollection[listID].txtItemLeftLine3[itemID]) / 2.0))

		SetTextString(OryUIListCollection[listID].txtItemRightLine1[itemID], OryUIParameters.rightLine1Text$)
		SetTextSize(OryUIListCollection[listID].txtItemRightLine1[itemID], OryUIParameters.rightLine1TextSize#)
		if (OryUIParameters.rightLine1TextBold = 0)
			SetTextBold(OryUIListCollection[listID].txtItemRightLine1[itemID], 0)
		elseif (OryUIParameters.rightLine1TextBold = 1)
			SetTextBold(OryUIListCollection[listID].txtItemRightLine1[itemID], 1)
		endif
		SetTextColor(OryUIListCollection[listID].txtItemRightLine1[itemID], OryUIParameters.rightLine1TextColor#[1], OryUIParameters.rightLine1TextColor#[2], OryUIParameters.rightLine1TextColor#[3], OryUIParameters.rightLine1TextColor#[4])
		if (OryUIListCollection[listID].noOfRightLines = 1)
			SetTextPosition(OryUIListCollection[listID].txtItemRightLine1[itemID], (GetSpriteX(OryUIListCollection[listID].sprItemBackground[itemID]) + GetSpriteWidth(OryUIListCollection[listID].sprItemBackground[itemID])) - 4, (GetSpriteY(OryUIListCollection[listID].sprItemBackground[itemID]) + (GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[itemID]) / 2.0)) - (GetTextTotalHeight(OryUIListCollection[listID].txtItemRightLine1[itemID]) / 2.0))
		elseif (OryUIListCollection[listID].noOfRightLines = 2)
			SetTextPosition(OryUIListCollection[listID].txtItemRightLine1[itemID], (GetSpriteX(OryUIListCollection[listID].sprItemBackground[itemID]) + GetSpriteWidth(OryUIListCollection[listID].sprItemBackground[itemID])) - 4, (GetSpriteY(OryUIListCollection[listID].sprItemBackground[itemID]) + (GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[itemID]) / 2.0)) - GetTextTotalHeight(OryUIListCollection[listID].txtItemLeftLine1[itemID]) - 0.1)
		endif
			
		SetTextString(OryUIListCollection[listID].txtItemRightLine2[itemID], OryUIParameters.rightLine2Text$)
		SetTextSize(OryUIListCollection[listID].txtItemRightLine2[itemID], OryUIParameters.rightLine2TextSize#)
		if (OryUIParameters.rightLine2TextBold = 0)
			SetTextBold(OryUIListCollection[listID].txtItemRightLine2[itemID], 0)
		elseif (OryUIParameters.rightLine2TextBold = 1)
			SetTextBold(OryUIListCollection[listID].txtItemRightLine2[itemID], 1)
		endif
		SetTextColor(OryUIListCollection[listID].txtItemRightLine2[itemID], OryUIParameters.rightLine2TextColor#[1], OryUIParameters.rightLine2TextColor#[2], OryUIParameters.rightLine2TextColor#[3], OryUIParameters.rightLine2TextColor#[4])
		if (OryUIListCollection[listID].noOfRightLines = 1)
			SetTextPosition(OryUIListCollection[listID].txtItemRightLine2[itemID], -10000, -10000)
		elseif (OryUIListCollection[listID].noOfRightLines = 2)
			SetTextPosition(OryUIListCollection[listID].txtItemRightLine2[itemID], GetSpriteX(OryUIListCollection[listID].sprItemBackground[itemID]) + 4, GetSpriteY(OryUIListCollection[listID].sprItemBackground[itemID]) + (GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[itemID]) / 2.0) + 0.1)
		endif
		
		//SetTextString(OryUIListCollection[listID].txtItemRightLine3[itemID], OryUIParameters.rightLine3Text$)
		//SetTextSize(OryUIListCollection[listID].txtItemRightLine3[itemID], OryUIParameters.rightLine3TextSize#)
		//if (OryUIParameters.rightLine3TextBold = 0)
			//SetTextBold(OryUIListCollection[listID].txtItemRightLine3[itemID], 0)
		//elseif (OryUIParameters.rightLine3TextBold = 1)
			//SetTextBold(OryUIListCollection[listID].txtItemRightLine3[itemID], 1)
		//endif
		//SetTextColor(OryUIListCollection[listID].txtItemRightLine3[itemID], OryUIParameters.rightLine3TextColor#[1], OryUIParameters.rightLine3TextColor#[2], OryUIParameters.rightLine3TextColor#[3], OryUIParameters.rightLine3TextColor#[4])
		//SetTextPosition(OryUIListCollection[listID].txtItemRightLine3[itemID], GetSpriteX(OryUIListCollection[listID].sprItemBackground[itemID]) + 4, GetSpriteY(OryUIListCollection[listID].sprItemBackground[itemID]) + (GetSpriteHeight(OryUIListCollection[listID].sprItemBackground[itemID]) / 2.0) - (GetTextTotalHeight(OryUIListCollection[listID].txtItemRightLine3[itemID]) / 2.0))
	endif
endfunction

foldend










//	Section For The Sprite Functions
//
//		Functions available:
//
//			OryUICreateSprite(parameters$ as string) returns integer
//			OryUIPinSpriteToBottomLeftOfSprite(spriteA as integer, spriteB as integer, xOffset as float, yOffset as float)
//			OryUIPinSpriteToBottomRightOfSprite(spriteA as integer, spriteB as integer, xOffset as float, yOffset as float)
//			OryUIPinSpriteToCentreBottomOfSprite(spriteA as integer, spriteB as integer, xOffset as float, yOffset as float)
//			OryUIPinSpriteToCentreLeftOfSprite(spriteA as integer, spriteB as integer, xOffset as float, yOffset as float)
//			OryUIPinSpriteToCentreOfSprite(spriteA as integer, spriteB as integer, xOffset as float, yOffset as float)
//			OryUIPinSpriteToCentreRightOfSprite(spriteA as integer, spriteB as integer, xOffset as float, yOffset as float)
//			OryUIPinSpriteToCentreTopOfSprite(spriteA as integer, spriteB as integer, xOffset as float, yOffset as float)
//			OryUIPinSpriteToSprite(spriteA as integer, spriteB as integer, xOffset as float, yOffset as float)
//			OryUIPinSpriteToTopRightOfSprite(spriteA as integer, spriteB as integer, xOffset as float, yOffset as float)
//			OryUIUpdateSprite(spriteID as integer, parameters$ as string)
//
//		Examples of usage:
//			
//			sprite1 = OryUICreateSprite("size:50,50;offset:center;position:30,30;color:255,255,0,255")
//			OryUIUpdateSprite(sprite1, "angle:30;alpha:100")
//
foldstart // OryUISprite

function OryUICreateSprite(parameters$ as string)
	local spriteID
	spriteID = CreateSprite(0)
	SetSpriteOffset(spriteID, 0, 0)
	
	if (parameters$ <> "") then OryUIUpdateSprite(spriteID, parameters$)
endfunction spriteID

function OryUIPinSpriteToBottomLeftOfSprite(spriteA as integer, spriteB as integer, xOffset as float, yOffset as float)
	if (GetSpriteExists(spriteA) and GetSpriteExists(spriteB))
		SetSpritePositionByOffset(spriteA, GetSpriteX(spriteB) + xOffset, (GetSpriteY(spriteB) + GetSpriteHeight(spriteB)) - (GetSpriteHeight(spriteA) + yOffset))
	endif
endfunction

function OryUIPinSpriteToBottomRightOfSprite(spriteA as integer, spriteB as integer, xOffset as float, yOffset as float)
	if (GetSpriteExists(spriteA) and GetSpriteExists(spriteB))
		SetSpritePositionByOffset(spriteA, (GetSpriteX(spriteB) + GetSpriteWidth(spriteB)) - (GetSpriteWidth(spriteA) + xOffset), (GetSpriteY(spriteB) + GetSpriteHeight(spriteB)) - (GetSpriteHeight(spriteA) + yOffset))
	endif
endfunction

function OryUIPinSpriteToCentreBottomOfSprite(spriteA as integer, spriteB as integer, xOffset as float, yOffset as float)
	if (GetSpriteExists(spriteA) and GetSpriteExists(spriteB))
		SetSpritePositionByOffset(spriteA, GetSpriteX(spriteB) + (GetSpriteWidth(spriteB) / 2), GetSpriteY(spriteB) + GetSpriteHeight(spriteB) - yOffset)
	endif
endfunction

function OryUIPinSpriteToCentreLeftOfSprite(spriteA as integer, spriteB as integer, xOffset as float, yOffset as float)
	if (GetSpriteExists(spriteA) and GetSpriteExists(spriteB))
		SetSpritePositionByOffset(spriteA, GetSpriteX(spriteB) + xOffset, GetSpriteY(spriteB) + (GetSpriteHeight(spriteB) / 2) + yOffset)
	endif
endfunction

function OryUIPinSpriteToCentreOfSprite(spriteA as integer, spriteB as integer, xOffset as float, yOffset as float)
	if (GetSpriteExists(spriteA) and GetSpriteExists(spriteB))
		SetSpritePositionByOffset(spriteA, GetSpriteX(spriteB) + (GetSpriteWidth(spriteB) / 2) + xOffset, GetSpriteY(spriteB) + (GetSpriteHeight(spriteB) / 2) + yOffset)
	endif
endfunction

function OryUIPinSpriteToCentreRightOfSprite(spriteA as integer, spriteB as integer, xOffset as float, yOffset as float)
	if (GetSpriteExists(spriteA) and GetSpriteExists(spriteB))
		SetSpritePositionByOffset(spriteA, GetSpriteX(spriteB) + GetSpriteWidth(spriteB) + xOffset, GetSpriteY(spriteB) + (GetSpriteHeight(spriteB) / 2) + yOffset)
	endif
endfunction

function OryUIPinSpriteToCentreTopOfSprite(spriteA as integer, spriteB as integer, xOffset as float, yOffset as float)
	if (GetSpriteExists(spriteA) and GetSpriteExists(spriteB))
		SetSpritePositionByOffset(spriteA, GetSpriteX(spriteB) + (GetSpriteWidth(spriteB) / 2), GetSpriteY(spriteB) + yOffset)
	endif
endfunction

function OryUIPinSpriteToSprite(spriteA as integer, spriteB as integer, xOffset as float, yOffset as float)
	if (GetSpriteExists(spriteA) and GetSpriteExists(spriteB))
		SetSpritePositionByOffset(spriteA, GetSpriteX(spriteB) + xOffset, GetSpriteY(spriteB) + yOffset)
	endif
endfunction

function OryUIPinSpriteToTopRightOfSprite(spriteA as integer, spriteB as integer, xOffset as float, yOffset as float)
	if (GetSpriteExists(spriteA) and GetSpriteExists(spriteB))
		SetSpritePositionByOffset(spriteA, (GetSpriteX(spriteB) + GetSpriteWidth(spriteB)) - (GetSpriteWidth(spriteA) + xOffset), GetSpriteY(spriteB) + yOffset)
	endif
endfunction

function OryUIUpdateSprite(spriteID as integer, parameters$ as string)
	OryUIResetParametersType()

	if (GetSpriteExists(spriteID))
		OryUIParameters.angle# = GetSpriteAngle(spriteID)
		OryUIParameters.color#[1] = GetSpriteColorRed(spriteID)
		OryUIParameters.color#[2] = GetSpriteColorGreen(spriteID)
		OryUIParameters.color#[3] = GetSpriteColorBlue(spriteID)
		OryUIParameters.color#[4] = GetSpriteColorAlpha(spriteID)
		OryUIParameters.depth = GetSpriteDepth(spriteID)
		OryUIParameters.group = GetSpriteGroup(spriteID)
		OryUIParameters.imageID = GetSpriteImageID(spriteID)
		OryUIParameters.offset#[1] = GetSpriteOffsetX(spriteID)
		OryUIParameters.offset#[2] = GetSpriteOffsetY(spriteID)
		OryUIParameters.position#[1] = GetSpriteXByOffset(spriteID)
		OryUIParameters.position#[2] = GetSpriteYByOffset(spriteID)
		OryUIParameters.size#[1] = GetSpriteWidth(spriteID)
		OryUIParameters.size#[2] = GetSpriteHeight(spriteID)
		if (OryUIParameters.offset#[1] = (OryUIParameters.size#[1] / 2) and OryUIParameters.offset#[2] = (OryUIParameters.size#[2] / 2)) then OryUIParameters.offsetCenter = 1
		
		OryUISetParametersType(parameters$)
		
		SetSpriteSize(spriteID, OryUIParameters.size#[1], OryUIParameters.size#[2])
		SetSpriteColor(spriteID, OryUIParameters.color#[1], OryUIParameters.color#[2], OryUIParameters.color#[3], OryUIParameters.color#[4])
		if (OryUIParameters.imageID > 0)
			SetSpriteImage(spriteID, OryUIParameters.imageID)
		endif
		SetSpriteDepth(spriteID, OryUIParameters.depth)
		if (OryUIParameters.offsetCenter = 1)
			SetSpriteOffset(spriteID, OryUIParameters.size#[1] / 2, OryUIParameters.size#[2] / 2)
		else
			SetSpriteOffset(spriteID, OryUIParameters.offset#[1], OryUIParameters.offset#[2])
		endif
		SetSpritePositionByOffset(spriteID, OryUIParameters.position#[1], OryUIParameters.position#[2])
		SetSpriteAngle(spriteID, OryUIParameters.angle#)
		if (OryUIParameters.fixToScreen = 1) then FixSpriteToScreen(spriteID, 1)
	endif
endfunction

foldend










//	Section For The Text Functions
//
//		Functions available:
//
//			OryUICreateText(parameters$ as string) returns integer
//			OryUIPinTextToBottomCentreOfSprite(textA as integer, spriteB as integer, xOffset as float, yOffset as float)
//			OryUIPinTextToBottomLeftOfSprite(textA as integer, spriteB as integer, xOffset as float, yOffset as float)
//			OryUIPinTextToBottomRightOfSprite(textA as integer, spriteB as integer, xOffset as float, yOffset as float)
//			OryUIPinTextToCentreLeftOfSprite(textA as integer, spriteB as integer, xOffset as float, yOffset as float)
//			OryUIPinTextToCentreOfSprite(textA as integer, spriteB as integer, xOffset as float, yOffset as float)
//			OryUIPinTextToCentreRightOfSprite(textA as integer, spriteB as integer, xOffset as float, yOffset as float)
//			OryUIPinTextToTopCentreOfSprite(textA as integer, spriteB as integer, xOffset as float, yOffset as float)
//			OryUIPinTextToTopLeftOfSprite(textA as integer, spriteB as integer, xOffset as float, yOffset as float)
//			OryUIPinTextToTopRightOfSprite(textA as integer, spriteB as integer, xOffset as float, yOffset as float)
//			OryUIUpdateText(textID as integer, parameters$ as string)
//			OryUIWrapText(text$ as string, size# as float, maxWidth# as float) returns string
//
//		Examples of usage:
//			
//			text1 = OryUICreateText("text:Hello World;textSize:5;textAlignment:center;textColor:255,0,0;position:50,50;")
//			OryUIUpdateText(text1, "text:Goodbye World;textColor:255,0,0")
//
foldstart // OryUIText

function OryUICreateText(parameters$ as string)
	local textID
	textID = CreateText("")
	
	if (parameters$ <> "") then OryUIUpdateText(textID, parameters$)
endfunction textID

function OryUIPinTextToBottomCentreOfSprite(textA as integer, spriteB as integer, xOffset as float, yOffset as float)
	if (GetTextExists(textA) and GetSpriteExists(spriteB))
		SetTextPosition(textA, GetSpriteX(spriteB) + (GetSpriteWidth(spriteB) / 2.0) + xOffset, ((GetSpriteY(spriteB) + GetSpriteHeight(spriteB)) - GetTextTotalHeight(textA)) + yOffset)
		SetTextAlignment(textA, 1)
	endif
endfunction

function OryUIPinTextToBottomLeftOfSprite(textA as integer, spriteB as integer, xOffset as float, yOffset as float)
	if (GetTextExists(textA) and GetSpriteExists(spriteB))
		SetTextPosition(textA, GetSpriteX(spriteB) + xOffset, ((GetSpriteY(spriteB) + GetSpriteHeight(spriteB)) - GetTextTotalHeight(textA)) + yOffset)
		SetTextAlignment(textA, 0)
	endif
endfunction

function OryUIPinTextToBottomRightOfSprite(textA as integer, spriteB as integer, xOffset as float, yOffset as float)
	if (GetTextExists(textA) and GetSpriteExists(spriteB))
		SetTextPosition(textA, GetSpriteX(spriteB) + GetSpriteWidth(spriteB) + xOffset, ((GetSpriteY(spriteB) + GetSpriteHeight(spriteB)) - GetTextTotalHeight(textA)) + yOffset)
		SetTextAlignment(textA, 2)
	endif
endfunction

function OryUIPinTextToCentreLeftOfSprite(textA as integer, spriteB as integer, xOffset as float, yOffset as float)
	if (GetTextExists(textA) and GetSpriteExists(spriteB))
		SetTextPosition(textA, GetSpriteX(spriteB) + xOffset, ((GetSpriteY(spriteB) + (GetSpriteHeight(spriteB) / 2.0)) - (GetTextTotalHeight(textA) / 2.0)) + yOffset)
		SetTextAlignment(textA, 0)
	endif
endfunction

function OryUIPinTextToCentreOfSprite(textA as integer, spriteB as integer, xOffset as float, yOffset as float)
	if (GetTextExists(textA) and GetSpriteExists(spriteB))
		SetTextPosition(textA, GetSpriteX(spriteB) + (GetSpriteWidth(spriteB) / 2.0) + xOffset, ((GetSpriteY(spriteB) + (GetSpriteHeight(spriteB) / 2.0)) - (GetTextTotalHeight(textA) / 2.0)) + yOffset)
		SetTextAlignment(textA, 1)
	endif
endfunction

function OryUIPinTextToCentreRightOfSprite(textA as integer, spriteB as integer, xOffset as float, yOffset as float)
	if (GetTextExists(textA) and GetSpriteExists(spriteB))
		SetTextPosition(textA, GetSpriteX(spriteB) + GetSpriteWidth(spriteB) + xOffset, ((GetSpriteY(spriteB) + (GetSpriteHeight(spriteB) / 2.0)) - (GetTextTotalHeight(textA) / 2.0)) + yOffset)
		SetTextAlignment(textA, 2)
	endif
endfunction

function OryUIPinTextToTopCentreOfSprite(textA as integer, spriteB as integer, xOffset as float, yOffset as float)
	if (GetTextExists(textA) and GetSpriteExists(spriteB))
		SetTextPosition(textA, GetSpriteX(spriteB) + (GetSpriteWidth(spriteB) / 2.0) + xOffset, GetSpriteY(spriteB) + yOffset)
		SetTextAlignment(textA, 1)
	endif
endfunction

function OryUIPinTextToTopLeftOfSprite(textA as integer, spriteB as integer, xOffset as float, yOffset as float)
	if (GetTextExists(textA) and GetSpriteExists(spriteB))
		SetTextPosition(textA, GetSpriteX(spriteB) + xOffset, GetSpriteY(spriteB) + yOffset)
		SetTextAlignment(textA, 0)
	endif
endfunction

function OryUIPinTextToTopRightOfSprite(textA as integer, spriteB as integer, xOffset as float, yOffset as float)
	if (GetTextExists(textA) and GetSpriteExists(spriteB))
		SetTextPosition(textA, GetSpriteX(spriteB) + GetSpriteWidth(spriteB) + xOffset, GetSpriteY(spriteB) + yOffset)
		SetTextAlignment(textA, 2)
	endif
endfunction

function OryUIUpdateText(textID as integer, parameters$ as string)
	OryUIResetParametersType()

	if (GetTextExists(textID))
		OryUIParameters.depth = GetTextDepth(textID)
		OryUIParameters.position#[1] = GetTextX(textID)
		OryUIParameters.position#[2] = GetTextY(textID)
		OryUIParameters.text$ = GetTextString(textID)
		OryUIParameters.textAlignment = GetTextAlignment(textID)
		OryUIParameters.textColor#[1] = GetTextColorRed(textID)
		OryUIParameters.textColor#[2] = GetTextColorGreen(textID)
		OryUIParameters.textColor#[3] = GetTextColorBlue(textID)
		OryUIParameters.textColor#[4] = GetTextColorAlpha(textID)
		OryUIParameters.textSize# = GetTextSize(textID)
		
		OryUISetParametersType(parameters$)

		SetTextString(textID, OryUIParameters.text$)
		SetTextSize(textID, OryUIParameters.textSize#)
		if (OryUIParameters.textBold = 0)
			SetTextBold(textID, 0)
		elseif (OryUIParameters.textBold = 1)
			SetTextBold(textID, 1)
		endif
		SetTextColor(textID, OryUIParameters.textColor#[1], OryUIParameters.textColor#[2], OryUIParameters.textColor#[3], OryUIParameters.textColor#[4])
		SetTextAlignment(textID, OryUIParameters.textAlignment)
		SetTextDepth(textID, OryUIParameters.depth)
		SetTextPosition(textID, OryUIParameters.position#[1], OryUIParameters.position#[2])
		if (OryUIParameters.fixToScreen = 1) then FixTextToScreen(textID, 1)
	endif
endfunction

function OryUIWrapText(text$ as string, size# as float, maxWidth# as float)
	local finalText$ as string
	local length as integer
	local space as integer
	local tmpText as integer
	local tmpText2 as integer
	tmpText = CreateText(text$)
	SetTextSize(tmpText, size#)
	SetTextPosition(tmpText, -10000, -10000)
	if (GetTextTotalWidth(tmpText) >= maxWidth#)
		while (GetTextTotalWidth(tmpText) >= maxWidth#)
			length = len(text$)
			space = 0
			for i = 1 to length
				if (mid(text$, i, 1) = " ") then space = i
				tmpText2 = CreateText(left(text$, i))
				SetTextSize(tmpText2, size#)
				SetTextPosition(tmpText2, -10000, -10000)
				if (GetTextTotalWidth(tmpText2) > maxWidth#)
					DeleteText(tmpText2)
					exit
				endif
				DeleteText(tmpText2)
			next
			finalText$ = finalText$ + left(text$, (space - 1)) + chr(10)
			text$ = right(text$, (len(text$) - space))
			DeleteText(tmpText)
			tmpText = CreateText(text$)
			SetTextSize(tmpText, size#)
			SetTextPosition(tmpText, -10000, -10000)
		endwhile
		if (len(text$) > 0) then finalText$ = finalText$ + text$
	else
		finalText$ = text$
	endif
	DeleteText(tmpText)
endfunction finalText$

foldend
