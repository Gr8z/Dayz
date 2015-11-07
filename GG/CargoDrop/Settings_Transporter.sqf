//// Medium
if (
(_Transporter isKindOf "AN2_DZ") ||
(_Transporter isKindOf "An2_TK_EP1") ||
(_Transporter isKindOf "An2_2_TK_CIV_EP1") ||
(_Transporter isKindOf "An2_1_TK_CIV_EP1") ||
(_Transporter isKindOf "GNT_C185U") ||
(_Transporter isKindOf "GNT_C185") ||
(_Transporter isKindOf "GNT_C185R") ||
(_Transporter isKindOf "GNT_C185C") ||
(_Transporter isKindOf "CYBP_Camel_us") ||
(_Transporter isKindOf "CYBP_Camel_civ") ||
(_Transporter isKindOf "UH60M_MEV_EP1") ||
(_Transporter isKindOf "UH1H_DZE") ||
(_Transporter isKindOf "MH60S_DZE") ||
(_Transporter isKindOf "UH60M_EP1_DZE") ||
(_Transporter isKindOf "UH1Y_DZE") // No OR || after the last entry!!
) then { _SelectedTransporterTypeM = true; };

//// Large
if (
(_Transporter isKindOf "BAF_Merlin_DZE") ||
(_Transporter isKindOf "Mi17_Civilian_DZ") ||
(_Transporter isKindOf "CH_47F_EP1_DZE") ||
(_Transporter isKindOf "Mi17_DZE") // No OR || after the last entry!!
) then { _SelectedTransporterTypeL = true; };

//// XTRA Large
if (
(_Transporter isKindOf "CH53_DZE") ||
(_Transporter isKindOf "MV22_DZ") ||
(_Transporter isKindOf "C130J_US_EP1_DZ") // No OR || after the last entry!!
) then { _SelectedTransporterTypeXL = true; };