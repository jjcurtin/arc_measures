/* filename = sq_mpq276.cpp
	3/28/00 - fixed error in prorating of VRIN
	Created by John Curtin

	Questionnaire scoring program for MPQ (276 items).

*/

#include "TQFile.cpp"

void main()
{
////////////////////////////////////////////////////////////////////////////

	cout	<<	"Scoring Program for the MPQ (276 item version)\n\n";

////////////////////////////////////////////////////////////////////////////

	//Declares a Questionnaire Object.
	//Must put the low end of rating scale and high end of rating scale as it should
	//be scored (i.e., the way the rating scale was originally designed
	//as parameters (lowend, highend).

	TQFile	Q(0,1);


	cout	<<	"Please verify that your data is scored:\n"
			<<	"True  = 0\n"
			<<	"False = 1\n\n";


////////////////////////////////////////////////////////////////////////////
	//Declare a variable for each scale that will be scored.
	//Below there are two scales (Scale1 and Scale2).  Change the names to the
	//names of the scales that you are using.
	//You will need one declaration for each scale that you will be scoring,
	//so you may need to add more declarations

	float Wellbeing;
	float WellbeingAbr;
	float SocialPotency;
	float Achieve;
	float SocialClose;
	float StressReact;
	float StressReactAbr;
	float Alienation;
	float Aggression;
	float Control;
	float HarmAvoid;
	float Tradition;
	float Absorption;
	float PEMAG;
	float PEMCO;
	float NEMAG;
	float NEMAL;
	float PEM;
	float NEM;
	float CONSTRAINT;
	float UnlikeVirtue;
	float TRIN;
	float VRIN;
	float Invalid;

////////////////////////////////////////////////////////////////////////////
	//You need to record the names of the scales in the order that you will score
	//them below(in next section).  Below, scale1 is scored first and scale2 is
	//scored second.
	//Between the quotes put a name (up to 8 charaters) for each scale
	//You need to have one Insert_Scale_Name for each scale,

	Q.Insert_Scale_Name("MP2_WEL");
	Q.Insert_Scale_Name("MP2_WAB");
	Q.Insert_Scale_Name("MP2_SPT");
	Q.Insert_Scale_Name("MP2_ACH");
	Q.Insert_Scale_Name("MP2_SCL");
	Q.Insert_Scale_Name("MP2_STR");
	Q.Insert_Scale_Name("MP2_SAB");
	Q.Insert_Scale_Name("MP2_ALN");
	Q.Insert_Scale_Name("MP2_AGG");
	Q.Insert_Scale_Name("MP2_CTL");
	Q.Insert_Scale_Name("MP2_HAV");
	Q.Insert_Scale_Name("MP2_TRD");
	Q.Insert_Scale_Name("MP2_ABS");
	Q.Insert_Scale_Name("MP2_PAG");
	Q.Insert_Scale_Name("MP2_PCO");
	Q.Insert_Scale_Name("MP2_NAG");
	Q.Insert_Scale_Name("MP2_NAL");
	Q.Insert_Scale_Name("MP2_PEM");
	Q.Insert_Scale_Name("MP2_NEM");
	Q.Insert_Scale_Name("MP2_CON");
	Q.Insert_Scale_Name("MP2_UVT");
	Q.Insert_Scale_Name("MP2_TRI");
	Q.Insert_Scale_Name("MP2_VRI");
	Q.Insert_Scale_Name("MP2_INV");
	Q.Output_File_Header();

///////////////////////////////////////////////////////////////////////////
	//In this section you will insert the equations to compute each scale
	//use the normal mathematical operators (+, -, *, /).
	//Q.Q.Item(Q.ItemNumber,Weight) and Q.Rev_Q.Item(Q.ItemNumber,Weight) return the value
	//of that Q.ItemNumber multiplied by Weight (can use decimal for weighting
	//of less than 1. i.e., .5). If no weight is provided, 1.0 (no weigting)
	//is assumed.  Q.Item returns regular value, Rev_Q.Item returns reverse scored
	//value.
	//Q.Reset_Q.Item_Counts() and Q.Prorate_Scale() are used to correct for missing values
	//They should be used in the same place in the scoring sequence for each scale
	//Remember to write the equations for the scale in the order that you inserted
	//their names in the above section
	//There are two examples given below.

	while (Q.Get_Subjects_Items())     //Do not touch this line
	{
		//scoring system for Wellbeing
		Q.Set_Missing_Percent(.25);   //set max number of Q.Items missing for valid scale
		Q.Reset_Item_Counts();
		Wellbeing = Q.Rev_Item(8) + Q.Rev_Item(17) + Q.Rev_Item(32)
		+ Q.Rev_Item(42) + Q.Rev_Item(51) + Q.Rev_Item (61)
		+ Q.Rev_Item(82) + Q.Rev_Item(96)
		+ Q.Rev_Item(110) + Q.Rev_Item(120) + Q.Rev_Item(133)
		+ Q.Item(144) + Q.Rev_Item(153) + Q.Rev_Item(167)
		+ Q.Rev_Item(176) + Q.Rev_Item(191) + Q.Rev_Item(205)
		+ Q.Rev_Item(211) + Q.Rev_Item(227) + Q.Rev_Item(235)
		+ Q.Rev_Item(250) + Q.Rev_Item(261) + Q.Rev_Item(272);
		Wellbeing = Q.Prorate_Scale(Wellbeing);
		Q.Insert_Scale_Score(Wellbeing);

		//scoring system for Abbreviated Wellbeing
		Q.Set_Missing_Percent(.25);  //set max number of Q.Items missing for valid scale
		Q.Reset_Item_Counts();
		WellbeingAbr = Q.Rev_Item(32) + Q.Rev_Item(42) + Q.Rev_Item(51)
		+ Q.Rev_Item(61) + Q.Rev_Item(120) + Q.Rev_Item(167) 
		+ Q.Rev_Item(176) + Q.Rev_Item(191) + Q.Rev_Item(205)
		+ Q.Rev_Item(235) + Q.Rev_Item(272);
		WellbeingAbr = Q.Prorate_Scale(WellbeingAbr);
		Q.Insert_Scale_Score(WellbeingAbr);

		//scoring system for Social Potency
		Q.Set_Missing_Percent(.25);  //set max number of Q.Items missing for valid scale
		Q.Reset_Item_Counts();
		SocialPotency = Q.Rev_Item(1) + Q.Item(15) + Q.Rev_Item(23) 
		+ Q.Rev_Item(33) + Q.Item(43) + Q.Rev_Item(54)
		+ Q.Rev_Item(63) + Q.Rev_Item(83)
		+ Q.Rev_Item(93) + Q.Item(105) + Q.Rev_Item(115)
		+ Q.Rev_Item(128) + Q.Item(135) + Q.Rev_Item(148)
		+ Q.Rev_Item(157) + Q.Item(199) + Q.Rev_Item(179)
		+ Q.Rev_Item(188) + Q.Item(170) + Q.Rev_Item(213)
		+ Q.Rev_Item(224) + Q.Item(236) + Q.Rev_Item(244)
		+ Q.Rev_Item(255) + Q.Item(264);
		SocialPotency = Q.Prorate_Scale(SocialPotency);
		Q.Insert_Scale_Score(SocialPotency);

		//scoring system for Achievement
		Q.Set_Missing_Percent(.25);  //set max number of Q.Items missing for valid scale
		Q.Reset_Item_Counts();
		Achieve = Q.Rev_Item(10) + Q.Item(22) + Q.Rev_Item(34)
		+ Q.Rev_Item(50) + Q.Rev_Item(71)
		+ Q.Rev_Item(87) + Q.Item(98) + Q.Rev_Item(111)
		+ Q.Rev_Item(122) + Q.Item(138) + Q.Rev_Item(150)
		+ Q.Rev_Item(163) + Q.Item(178) + Q.Rev_Item(194)
		+ Q.Rev_Item(204) + Q.Item(220) + Q.Rev_Item(232)
		+ Q.Rev_Item(245) + Q.Item(259) + Q.Rev_Item(271);
		Achieve = Q.Prorate_Scale(Achieve);
		Q.Insert_Scale_Score(Achieve);

		//scoring system for Social Closeness
		Q.Set_Missing_Percent(.25);  //set max number of Q.Items missing for valid scale
		Q.Reset_Item_Counts();
		SocialClose = Q.Rev_Item(4) + Q.Item(16) + Q.Rev_Item(29)
		+ Q.Item(41) + Q.Rev_Item(55) + Q.Item(67)
		+ Q.Rev_Item(75) + Q.Item(88) + Q.Item(101)
		+ Q.Item(126) + Q.Rev_Item(137)
		+ Q.Item(152) + Q.Rev_Item(164) + Q.Item(177)
		+ Q.Rev_Item(190) + Q.Item(202) + Q.Rev_Item(216) 
		+ Q.Item(229) + Q.Item(241) + Q.Rev_Item(253)
		+ Q.Item(268);
		SocialClose = Q.Prorate_Scale(SocialClose);
		Q.Insert_Scale_Score(SocialClose);

		//scoring system for Stress Reaction
		Q.Set_Missing_Percent(.25);  //set max number of Q.Items missing for valid scale
		Q.Reset_Item_Counts();
		StressReact = Q.Rev_Item(3) + Q.Rev_Item(14) + Q.Rev_Item(25)
		+ Q.Rev_Item(36) + Q.Rev_Item(44)
		+ Q.Item(64) + Q.Rev_Item(74) + Q.Rev_Item(84)
		+ Q.Rev_Item(95) + Q.Rev_Item(106) + Q.Rev_Item(117)
		+ Q.Rev_Item(127) + Q.Rev_Item(139)
		+ Q.Rev_Item(158) + Q.Rev_Item(171) + Q.Rev_Item(180)
		+ Q.Rev_Item(193) + Q.Item(203) + Q.Rev_Item(214)
		+ Q.Rev_Item(225) + Q.Rev_Item(248)
		+ Q.Rev_Item(258) + Q.Rev_Item(269);
		StressReact = Q.Prorate_Scale(StressReact);
		Q.Insert_Scale_Score(StressReact);

		//scoring system for Abbreviated Stress Reaction
		Q.Set_Missing_Percent(.25);  //set max number of Q.Items missing for valid scale
		Q.Reset_Item_Counts();
		StressReactAbr = Q.Rev_Item(3) + Q.Rev_Item(14) + Q.Rev_Item(36) 
		+ Q.Rev_Item(44) + Q.Rev_Item(84) + Q.Rev_Item(95)
		+ Q.Rev_Item(117) + Q.Rev_Item(127) + Q.Rev_Item(158)
		+ Q.Rev_Item(193) + Q.Rev_Item(214) + Q.Rev_Item(248)
		+ Q.Rev_Item(258) + Q.Rev_Item(269);
		StressReactAbr = Q.Prorate_Scale(StressReactAbr);
		Q.Insert_Scale_Score(StressReactAbr);

		//scoring system for Alienation
		Q.Set_Missing_Percent(.25);  //set max number of Q.Items missing for valid scale
		Q.Reset_Item_Counts();
		Alienation = Q.Rev_Item(11) + Q.Rev_Item(27) + Q.Rev_Item(39)
		+ Q.Rev_Item(52) + Q.Rev_Item(66) + Q.Item(77)
		+ Q.Rev_Item(91) + Q.Rev_Item(104) + Q.Rev_Item(119)
		+ Q.Rev_Item(132) + Q.Rev_Item(146) + Q.Rev_Item(161)
		+ Q.Rev_Item(174) + Q.Item(187) + Q.Rev_Item(207)
		+ Q.Rev_Item(218) + Q.Rev_Item(230) + Q.Rev_Item(246)
		+ Q.Rev_Item(260) + Q.Rev_Item(274);
		Alienation = Q.Prorate_Scale(Alienation);
		Q.Insert_Scale_Score(Alienation);

		//scoring system for Aggression
		Q.Set_Missing_Percent(.25);  //set max number of Q.Items missing for valid scale
		Q.Reset_Item_Counts();
		Aggression = Q.Rev_Item(7) + Q.Rev_Item(20) + Q.Rev_Item(35)
		+ Q.Rev_Item(59) + Q.Rev_Item(72)
		+ Q.Rev_Item(86) + Q.Rev_Item(100) + Q.Item(113)
		+ Q.Rev_Item(129) + Q.Rev_Item(143) + Q.Rev_Item(155)
		+ Q.Rev_Item(168) + Q.Rev_Item(184) + Q.Item(198)
		+ Q.Rev_Item(212) + Q.Rev_Item(226) + Q.Rev_Item(239)
		+ Q.Item(254) + Q.Rev_Item(270);
		Aggression = Q.Prorate_Scale(Aggression);
		Q.Insert_Scale_Score(Aggression);

		//scoring system for Control
		Q.Set_Missing_Percent(.25);  //set max number of Q.Items missing for valid scale
		Q.Reset_Item_Counts();
		Control = Q.Rev_Item(2) + Q.Item(12) + Q.Rev_Item(24)
		+ Q.Item(38) + Q.Rev_Item(47) + Q.Item(57)
		+ Q.Rev_Item(70) + Q.Rev_Item(79) + Q.Item(92)
		+ Q.Rev_Item(103) + Q.Item(112) + Q.Rev_Item(124)
		+ Q.Item(136) + Q.Rev_Item(147) + Q.Item(159)
		+ Q.Rev_Item(172) + Q.Item(185) + Q.Rev_Item(195)
		+ Q.Rev_Item(209) + Q.Item(219) + Q.Rev_Item(234)
		+ Q.Item(243) + Q.Rev_Item(251) + Q.Item(266);
		Control = Q.Prorate_Scale(Control);
		Q.Insert_Scale_Score(Control);

		//scoring system for Harm Avoidance
		Q.Set_Missing_Percent(.25);  //set max number of Q.Items missing for valid scale
		Q.Reset_Item_Counts();
		HarmAvoid = Q.Rev_Item(19) + Q.Item(31)
		+ Q.Item(49) + Q.Rev_Item(58)
		+ Q.Item(69) + Q.Item(76) + Q.Rev_Item(85)
		+ Q.Item(94) + Q.Rev_Item(107) + Q.Item(114)
		+ Q.Rev_Item(125) + Q.Item(134) + Q.Rev_Item(145)
		+ Q.Item(154) + Q.Rev_Item(166) + Q.Item(175)
		+ Q.Rev_Item(186) + Q.Item(196) + Q.Rev_Item(206)
		+ Q.Item(217) + Q.Item(228) + Q.Rev_Item(237)
		+ Q.Item(247) + Q.Rev_Item(256) + Q.Item(267)
		+ Q.Item(276);
		HarmAvoid = Q.Prorate_Scale(HarmAvoid);
		Q.Insert_Scale_Score(HarmAvoid);

		//scoring system for Traditionalism
		Q.Set_Missing_Percent(.25);  //set max number of Q.Items missing for valid scale
		Q.Reset_Item_Counts();
		Tradition = Q.Rev_Item(9) + Q.Rev_Item(18) + Q.Item(28)
		+ Q.Rev_Item(40) + Q.Rev_Item(48) + Q.Rev_Item(56)
		+ Q.Rev_Item(65) + Q.Rev_Item(78) + Q.Item(89)
		+ Q.Rev_Item(97) + Q.Rev_Item(109) + Q.Rev_Item(118)
		+ Q.Item(130) + Q.Rev_Item(140) + Q.Rev_Item(151)
		+ Q.Rev_Item(160) + Q.Rev_Item(169) + Q.Rev_Item(181)
		+ Q.Item(192) + Q.Rev_Item(201) + Q.Rev_Item(210)
		+ Q.Rev_Item(222) + Q.Rev_Item(233) + Q.Rev_Item(240)
		+ Q.Item(252) + Q.Rev_Item(262) + Q.Rev_Item(275);
		Tradition = Q.Prorate_Scale(Tradition);
		Q.Insert_Scale_Score(Tradition);

		//scoring system for Absorption
		Q.Set_Missing_Percent(.25);  //set max number of Q.Items missing for valid scale
		Q.Reset_Item_Counts();
		Absorption = Q.Rev_Item(5) + Q.Rev_Item(13) + Q.Rev_Item(21)
		+ Q.Rev_Item(30) + Q.Rev_Item(37) + Q.Rev_Item(45)
		+ Q.Rev_Item(53) + Q.Rev_Item(60) + Q.Rev_Item(68)
		+ Q.Rev_Item(73) + Q.Rev_Item(81) + Q.Rev_Item(90)
		+ Q.Rev_Item(99) + Q.Rev_Item(108) + Q.Rev_Item(116)
		+ Q.Rev_Item(123) + Q.Rev_Item(131) + Q.Rev_Item(141)
		+ Q.Rev_Item(149) + Q.Rev_Item(156) + Q.Rev_Item(165)
		+ Q.Rev_Item(173) + Q.Rev_Item(182) + Q.Rev_Item(189)
		+ Q.Rev_Item(197) + Q.Rev_Item(208) + Q.Rev_Item(215)
		+ Q.Rev_Item(223) + Q.Rev_Item(231) + Q.Rev_Item(238)
		+ Q.Rev_Item(249) + Q.Rev_Item(257) + Q.Rev_Item(265)
		+ Q.Rev_Item(273);
		Absorption = Q.Prorate_Scale(Absorption);
		Q.Insert_Scale_Score(Absorption);


		//scoring system for PEM, NEM and CONSTRAINT

		//check if any scales are missing.  If so all factors are set to missing
		if(Wellbeing == Q.Return_Missing_Code()      || SocialPotency == Q.Return_Missing_Code() ||
			Achieve == Q.Return_Missing_Code()        || SocialClose == Q.Return_Missing_Code() ||
			StressReact == Q.Return_Missing_Code()    || Alienation == Q.Return_Missing_Code() ||
			Aggression == Q.Return_Missing_Code()     || Control == Q.Return_Missing_Code() ||
			HarmAvoid == Q.Return_Missing_Code()      || Tradition == Q.Return_Missing_Code())
		{
			PEMAG = Q.Return_Missing_Code();
			Q.Insert_Scale_Score(PEMAG);
			PEMCO = Q.Return_Missing_Code();
			Q.Insert_Scale_Score(PEMCO);
			NEMAG = Q.Return_Missing_Code();
			Q.Insert_Scale_Score(NEMAG);
			NEMAL = Q.Return_Missing_Code();
			Q.Insert_Scale_Score(NEMAL);
			PEM = Q.Return_Missing_Code();
			Q.Insert_Scale_Score(PEM);
			NEM = Q.Return_Missing_Code();
			Q.Insert_Scale_Score(NEM);
			CONSTRAINT = Q.Return_Missing_Code();
			Q.Insert_Scale_Score(CONSTRAINT);

		}
		else   //otherwise score factors
		{
			//the second constant at end of each equation is a correction provided by
			//tellegen to prevent negative scores.
			PEMAG = .987*Wellbeing + .773*SocialPotency + 2.442*Achieve - .301*SocialClose
			+ .006* StressReact + .022*Alienation - .001*Aggression + .008*Control
			+ .007*HarmAvoid + .007*Tradition -  9.684 + 17;
			Q.Insert_Scale_Score(PEMAG);

			PEMCO = 1.003*Wellbeing + .788*SocialPotency - .322*Achieve + 2.407*SocialClose
			+ .065* StressReact + .192*Alienation + .032*Aggression - .008*Control
			- .007*HarmAvoid - .007*Tradition -  5.541 + 13;
			Q.Insert_Scale_Score(PEMCO);

			NEMAG = .011*Wellbeing + .009*SocialPotency - .003*Achieve + .026*SocialClose
			+ 1.055* StressReact - .821*Alienation + 4.089*Aggression + .100*Control
			+ .092*HarmAvoid + .093*Tradition +  0.224 + 17;
			Q.Insert_Scale_Score(NEMAG);

			NEMAL = .082*Wellbeing + .065*SocialPotency + .022*Achieve + .151*SocialClose
			+ .873* StressReact + 3.826*Alienation - .683*Aggression - .041*Control
			- .038*HarmAvoid - .038*Tradition +  2.331 + 16;
			Q.Insert_Scale_Score(NEMAL);

			PEM = 1.242*Wellbeing + .975*SocialPotency + 1.311*Achieve + 1.330*SocialClose
			+ .122* StressReact + .369*Alienation + .052*Aggression + .000*Control
			+ .000*HarmAvoid + .000*Tradition -  27.258 + 28;
			Q.Insert_Scale_Score(PEM);

			NEM = .129*Wellbeing + .101*SocialPotency + .028*Achieve + .243*SocialClose
			+ 1.185*StressReact + 2.072*Alienation + 1.890*Aggression + .065*Control
			+ .060*HarmAvoid + .060*Tradition  - 4.241 + 5;
			Q.Insert_Scale_Score(NEM);

			CONSTRAINT = .000*Wellbeing + .000*SocialPotency + .026*Achieve - .025*SocialClose
			+ .062* StressReact - .159*Alienation + .339*Aggression + 1.556*Control
			+ 1.430*HarmAvoid + 1.438*Tradition -  21.589 + 26;
			Q.Insert_Scale_Score(CONSTRAINT);

		}

		//scoring system for Unlikely Virtues
		Q.Set_Missing_Percent(.25);  //set max number of Q.Items missing for valid scale
		Q.Reset_Item_Counts();
		UnlikeVirtue = Q.Item(6) + Q.Rev_Item(26) + Q.Item(46)
		+ Q.Rev_Item(62) + Q.Item(80) + Q.Rev_Item(102)
		+ Q.Item(121) + Q.Rev_Item(142) + Q.Item(162)
		+ Q.Rev_Item(183) + Q.Item(200) + Q.Rev_Item(221)
		+ Q.Item(242) + Q.Rev_Item(263);
		UnlikeVirtue = Q.Prorate_Scale(UnlikeVirtue);
		Q.Insert_Scale_Score(UnlikeVirtue);




		//scoring system for TRIN
		//if both Q.Items are not missing and both are true, give a point
		//if both Q.Items are not missing and both are false, subtract a point

		float TRINTRUE =0;
		if(!Q.Missing_Item(4) && !Q.Missing_Item(241) && (Q.Rev_Item(4)==1) && (Q.Rev_Item(241)==1))
		{TRINTRUE++;}
		if(!Q.Missing_Item(16) && !Q.Missing_Item(164) && (Q.Rev_Item(16)==1) && (Q.Rev_Item(164)==1))
		{TRINTRUE++;}
		if(!Q.Missing_Item(20) && !Q.Missing_Item(113) && (Q.Rev_Item(20)==1) && (Q.Rev_Item(113)==1))
		{TRINTRUE++;}
		if(!Q.Missing_Item(23) && !Q.Missing_Item(135) && (Q.Rev_Item(23)==1) && (Q.Rev_Item(135)==1))
		{TRINTRUE++;}
		if(!Q.Missing_Item(57) && !Q.Missing_Item(195) && (Q.Rev_Item(57)==1) && (Q.Rev_Item(195)==1))
		{TRINTRUE++;}
		if(!Q.Missing_Item(67) && !Q.Missing_Item(216) && (Q.Rev_Item(67)==1) && (Q.Rev_Item(216)==1))
		{TRINTRUE++;}
		if(!Q.Missing_Item(71) && !Q.Missing_Item(178) && (Q.Rev_Item(71)==1) && (Q.Rev_Item(178)==1))
		{TRINTRUE++;}
		if(!Q.Missing_Item(78) && !Q.Missing_Item(252) && (Q.Rev_Item(78)==1) && (Q.Rev_Item(252)==1))
		{TRINTRUE++;}
		if(!Q.Missing_Item(98) && !Q.Missing_Item(122) && (Q.Rev_Item(98)==1) && (Q.Rev_Item(122)==1))
		{TRINTRUE++;}
		if(!Q.Missing_Item(105) && !Q.Missing_Item(224) && (Q.Rev_Item(105)==1) && (Q.Rev_Item(224)==1))
		{TRINTRUE++;}
		if(!Q.Missing_Item(172) && !Q.Missing_Item(219) && (Q.Rev_Item(172)==1) && (Q.Rev_Item(219)==1))
		{TRINTRUE++;}
		if(!Q.Missing_Item(179) && !Q.Missing_Item(170) && (Q.Rev_Item(179)==1) && (Q.Rev_Item(170)==1))
		{TRINTRUE++;}
		if(!Q.Missing_Item(204) && !Q.Missing_Item(220) && (Q.Rev_Item(204)==1) && (Q.Rev_Item(220)==1))
		{TRINTRUE++;}
		if(!Q.Missing_Item(213) && !Q.Missing_Item(236) && (Q.Rev_Item(213)==1) && (Q.Rev_Item(236)==1))
		{TRINTRUE++;}

		//count missing true pairs.  Pair is missing if a) both items are missing, or
		//b) one item missing, other item true.

		int MISSTRUE=0;
		if((Q.Missing_Item(4) && Q.Missing_Item(241)) || (Q.Missing_Item(4) && Q.Rev_Item(241)==1) ||
						 (Q.Missing_Item(241) && Q.Rev_Item(4) ==1))
		{MISSTRUE++;}
		if((Q.Missing_Item(16) && Q.Missing_Item(164)) || (Q.Missing_Item(16) && Q.Rev_Item(164)==1) ||
						 (Q.Missing_Item(164) && Q.Rev_Item(16) ==1))
		{MISSTRUE++;}
		if((Q.Missing_Item(20) && Q.Missing_Item(113)) || (Q.Missing_Item(20) && Q.Rev_Item(113)==1) ||
						 (Q.Missing_Item(113) && Q.Rev_Item(20) ==1))
		{MISSTRUE++;}
		if((Q.Missing_Item(23) && Q.Missing_Item(135)) || (Q.Missing_Item(23) && Q.Rev_Item(135)==1) ||
						 (Q.Missing_Item(135) && Q.Rev_Item(23) ==1))
		{MISSTRUE++;}
		if((Q.Missing_Item(57) && Q.Missing_Item(195)) || (Q.Missing_Item(57) && Q.Rev_Item(195)==1) ||
						 (Q.Missing_Item(195) && Q.Rev_Item(57) ==1))
		{MISSTRUE++;}
		if((Q.Missing_Item(67) && Q.Missing_Item(216)) || (Q.Missing_Item(67) && Q.Rev_Item(216)==1) ||
						 (Q.Missing_Item(216) && Q.Rev_Item(67) ==1))
		{MISSTRUE++;}
		if((Q.Missing_Item(71) && Q.Missing_Item(178)) || (Q.Missing_Item(71) && Q.Rev_Item(178)==1) ||
						 (Q.Missing_Item(178) && Q.Rev_Item(71) ==1))
		{MISSTRUE++;}
		if((Q.Missing_Item(78) && Q.Missing_Item(252)) || (Q.Missing_Item(78) && Q.Rev_Item(252)==1) ||
						 (Q.Missing_Item(252) && Q.Rev_Item(78) ==1))
		{MISSTRUE++;}
		if((Q.Missing_Item(98) && Q.Missing_Item(122)) || (Q.Missing_Item(98) && Q.Rev_Item(122)==1) ||
						 (Q.Missing_Item(122) && Q.Rev_Item(98) ==1))
		{MISSTRUE++;}
		if((Q.Missing_Item(105) && Q.Missing_Item(224)) || (Q.Missing_Item(105) && Q.Rev_Item(224)==1) ||
						 (Q.Missing_Item(224) && Q.Rev_Item(105) ==1))
		{MISSTRUE++;}
		if((Q.Missing_Item(172) && Q.Missing_Item(219)) || (Q.Missing_Item(172) && Q.Rev_Item(219)==1) ||
						 (Q.Missing_Item(219) && Q.Rev_Item(172) ==1))
		{MISSTRUE++;}
		if((Q.Missing_Item(179) && Q.Missing_Item(170)) || (Q.Missing_Item(179) && Q.Rev_Item(170)==1) ||
						 (Q.Missing_Item(170) && Q.Rev_Item(179) ==1))
		{MISSTRUE++;}
		if((Q.Missing_Item(204) && Q.Missing_Item(220)) || (Q.Missing_Item(204) && Q.Rev_Item(220)==1) ||
						 (Q.Missing_Item(220) && Q.Rev_Item(204) ==1))
		{MISSTRUE++;}
		if((Q.Missing_Item(213) && Q.Missing_Item(236)) || (Q.Missing_Item(213) && Q.Rev_Item(236)==1) ||
						 (Q.Missing_Item(236) && Q.Rev_Item(213) ==1))
		{MISSTRUE++;}


		//prorate true pair score
		TRINTRUE = TRINTRUE * (14.0/(14.0-MISSTRUE));

		float TRINFALSE =0;
		if(!Q.Missing_Item(1) && !Q.Missing_Item(43) && (Q.Rev_Item(1)==0) && (Q.Rev_Item(43)==0))
		{TRINFALSE++;}
		if(!Q.Missing_Item(4) && !Q.Missing_Item(241) && (Q.Rev_Item(4)==0) && (Q.Rev_Item(241)==0))
		{TRINFALSE++;}
		if(!Q.Missing_Item(14) && !Q.Missing_Item(203) && (Q.Rev_Item(14)==0) && (Q.Rev_Item(203)==0))
		{TRINFALSE++;}
		if(!Q.Missing_Item(16) && !Q.Missing_Item(164) && (Q.Rev_Item(16)==0) && (Q.Rev_Item(164)==0))
		{TRINFALSE++;}
		if(!Q.Missing_Item(20) && !Q.Missing_Item(113) && (Q.Rev_Item(20)==0) && (Q.Rev_Item(113)==0))
		{TRINFALSE++;}
		if(!Q.Missing_Item(23) && !Q.Missing_Item(135) && (Q.Rev_Item(23)==0) && (Q.Rev_Item(135)==0))
		{TRINFALSE++;}
		if(!Q.Missing_Item(29) && !Q.Missing_Item(229) && (Q.Rev_Item(29)==0) && (Q.Rev_Item(229)==0))
		{TRINFALSE++;}
		if(!Q.Missing_Item(38) && !Q.Missing_Item(47) && (Q.Rev_Item(38)==0) && (Q.Rev_Item(47)==0))
		{TRINFALSE++;}
		if(!Q.Missing_Item(52) && !Q.Missing_Item(187) && (Q.Rev_Item(52)==0) && (Q.Rev_Item(187)==0))
		{TRINFALSE++;}
		if(!Q.Missing_Item(55) && !Q.Missing_Item(202) && (Q.Rev_Item(55)==0) && (Q.Rev_Item(202)==0))
		{TRINFALSE++;}
		if(!Q.Missing_Item(59) && !Q.Missing_Item(198) && (Q.Rev_Item(59)==0) && (Q.Rev_Item(198)==0))
		{TRINFALSE++;}
		if(!Q.Missing_Item(75) && !Q.Missing_Item(152) && (Q.Rev_Item(75)==0) && (Q.Rev_Item(152)==0))
		{TRINFALSE++;}
		if(!Q.Missing_Item(106) && !Q.Missing_Item(250) && (Q.Rev_Item(106)==0) && (Q.Rev_Item(250)==0))
		{TRINFALSE++;}
		if(!Q.Missing_Item(110) && !Q.Missing_Item(144) && (Q.Rev_Item(110)==0) && (Q.Rev_Item(144)==0))
		{TRINFALSE++;}
		if(!Q.Missing_Item(125) && !Q.Missing_Item(134) && (Q.Rev_Item(125)==0) && (Q.Rev_Item(134)==0))
		{TRINFALSE++;}
		if(!Q.Missing_Item(136) && !Q.Missing_Item(147) && (Q.Rev_Item(136)==0) && (Q.Rev_Item(147)==0))
		{TRINFALSE++;}
		if(!Q.Missing_Item(138) && !Q.Missing_Item(271) && (Q.Rev_Item(138)==0) && (Q.Rev_Item(271)==0))
		{TRINFALSE++;}
		if(!Q.Missing_Item(188) && !Q.Missing_Item(264) && (Q.Rev_Item(188)==0) && (Q.Rev_Item(264)==0))
		{TRINFALSE++;}
		if(!Q.Missing_Item(213) && !Q.Missing_Item(236) && (Q.Rev_Item(213)==0) && (Q.Rev_Item(236)==0))
		{TRINFALSE++;}

		//count missing falsepairs.  Pair is missing if a) both items are missing, or
		//b) one item missing, other item false.

		int MISSFALSE=0;
		if((Q.Missing_Item(1) && Q.Missing_Item(43)) || (Q.Missing_Item(1) && Q.Rev_Item(43)==0) ||
						 (Q.Missing_Item(43) && Q.Rev_Item(1) ==0))
		{MISSFALSE++;}
		if((Q.Missing_Item(4) && Q.Missing_Item(241)) || (Q.Missing_Item(4) && Q.Rev_Item(241)==0) ||
						 (Q.Missing_Item(241) && Q.Rev_Item(4) ==0))
		{MISSFALSE++;}
		if((Q.Missing_Item(14) && Q.Missing_Item(20)) || (Q.Missing_Item(14) && Q.Rev_Item(20)==0) ||
						 (Q.Missing_Item(20) && Q.Rev_Item(14) ==0))
		{MISSFALSE++;}
		if((Q.Missing_Item(16) && Q.Missing_Item(164)) || (Q.Missing_Item(16) && Q.Rev_Item(164)==0) ||
						 (Q.Missing_Item(164) && Q.Rev_Item(16) ==0))
		{MISSFALSE++;}
		if((Q.Missing_Item(20) && Q.Missing_Item(113)) || (Q.Missing_Item(20) && Q.Rev_Item(113)==0) ||
						 (Q.Missing_Item(113) && Q.Rev_Item(20) ==0))
		{MISSFALSE++;}
		if((Q.Missing_Item(23) && Q.Missing_Item(135)) || (Q.Missing_Item(23) && Q.Rev_Item(135)==0) ||
						 (Q.Missing_Item(135) && Q.Rev_Item(23) ==0))
		{MISSFALSE++;}
		if((Q.Missing_Item(29) && Q.Missing_Item(229)) || (Q.Missing_Item(29) && Q.Rev_Item(229)==0) ||
						 (Q.Missing_Item(229) && Q.Rev_Item(29) ==0))
		{MISSFALSE++;}
		if((Q.Missing_Item(38) && Q.Missing_Item(47)) || (Q.Missing_Item(38) && Q.Rev_Item(47)==0) ||
						 (Q.Missing_Item(47) && Q.Rev_Item(38) ==0))
		{MISSFALSE++;}
		if((Q.Missing_Item(52) && Q.Missing_Item(187)) || (Q.Missing_Item(52) && Q.Rev_Item(187)==0) ||
						 (Q.Missing_Item(187) && Q.Rev_Item(52) ==0))
		{MISSFALSE++;}
		if((Q.Missing_Item(55) && Q.Missing_Item(202)) || (Q.Missing_Item(55) && Q.Rev_Item(202)==0) ||
						 (Q.Missing_Item(202) && Q.Rev_Item(55) ==0))
		{MISSFALSE++;}
		if((Q.Missing_Item(59) && Q.Missing_Item(198)) || (Q.Missing_Item(59) && Q.Rev_Item(198)==0) ||
						 (Q.Missing_Item(198) && Q.Rev_Item(59) ==0))
		{MISSFALSE++;}
		if((Q.Missing_Item(75) && Q.Missing_Item(152)) || (Q.Missing_Item(75) && Q.Rev_Item(152)==0) ||
						 (Q.Missing_Item(152) && Q.Rev_Item(75) ==0))
		{MISSFALSE++;}
		if((Q.Missing_Item(106) && Q.Missing_Item(250)) || (Q.Missing_Item(106) && Q.Rev_Item(250)==0) ||
						 (Q.Missing_Item(250) && Q.Rev_Item(106) ==0))
		{MISSFALSE++;}
		if((Q.Missing_Item(110) && Q.Missing_Item(144)) || (Q.Missing_Item(110) && Q.Rev_Item(144)==0) ||
						 (Q.Missing_Item(144) && Q.Rev_Item(110) ==0))
		{MISSFALSE++;}
		if((Q.Missing_Item(125) && Q.Missing_Item(134)) || (Q.Missing_Item(125) && Q.Rev_Item(134)==0) ||
						 (Q.Missing_Item(134) && Q.Rev_Item(125) ==0))
		{MISSFALSE++;}
		if((Q.Missing_Item(136) && Q.Missing_Item(147)) || (Q.Missing_Item(136) && Q.Rev_Item(147)==0) ||
						 (Q.Missing_Item(147) && Q.Rev_Item(136) ==0))
		{MISSFALSE++;}
		if((Q.Missing_Item(138) && Q.Missing_Item(271)) || (Q.Missing_Item(138) && Q.Rev_Item(271)==0) ||
						 (Q.Missing_Item(271) && Q.Rev_Item(138) ==0))
		{MISSFALSE++;}
		if((Q.Missing_Item(188) && Q.Missing_Item(264)) || (Q.Missing_Item(188) && Q.Rev_Item(264)==0) ||
						 (Q.Missing_Item(264) && Q.Rev_Item(188) ==0))
		{MISSFALSE++;}
		if((Q.Missing_Item(213) && Q.Missing_Item(236)) || (Q.Missing_Item(213) && Q.Rev_Item(236)==0) ||
						 (Q.Missing_Item(236) && Q.Rev_Item(213) ==0))
		{MISSFALSE++;}

		//prorate false pair score for missing pairs
		TRINFALSE = TRINFALSE * (19.0/(19.0-MISSFALSE));

		//score total trin
		if((MISSTRUE <=4) && (MISSFALSE <=5)) //make sure not too many missing pairs
		{
			 TRIN = TRINTRUE - TRINFALSE + 19;   //TRINTRUE are cancelled by TRINFALSE
		}                                       //19 is a correction from Tellegan to
		else                                    //prevent negative scores
		{
			 TRIN =  Q.Return_Missing_Code();
		}
		Q.Insert_Scale_Score(TRIN);



		//scoring system for VRIN
		VRIN = 0;
		if(!Q.Missing_Item(1) && !Q.Missing_Item(148) && (Q.Rev_Item(1)!=Q.Rev_Item(148)))
		{VRIN++;}
		if(!Q.Missing_Item(4) && !Q.Missing_Item(216) && (Q.Rev_Item(4)!=Q.Rev_Item(216)))
		{VRIN++;}
		if(!Q.Missing_Item(17) && !Q.Missing_Item(227) && (Q.Rev_Item(17)!=Q.Rev_Item(227)))
		{VRIN++;}
		if(!Q.Missing_Item(20) && !Q.Missing_Item(239) && (Q.Rev_Item(20)!=Q.Rev_Item(239)))
		{VRIN++;}
		if(!Q.Missing_Item(24) && !Q.Missing_Item(147) && (Q.Rev_Item(24)!=Q.Rev_Item(147)))
		{VRIN++;}
		if(!Q.Missing_Item(44) && !Q.Missing_Item(139) && (Q.Rev_Item(44)!=Q.Rev_Item(139)))
		{VRIN++;}
		if(!Q.Missing_Item(54) && !Q.Missing_Item(179) && (Q.Rev_Item(54)!=Q.Rev_Item(179)))
		{VRIN++;}
		if(!Q.Missing_Item(83) && !Q.Missing_Item(213) && (Q.Rev_Item(83)!=Q.Rev_Item(213)))
		{VRIN++;}
		if(!Q.Missing_Item(87) && !Q.Missing_Item(204) && (Q.Rev_Item(87)!=Q.Rev_Item(204)))
		{VRIN++;}
		if(!Q.Missing_Item(95) && !Q.Missing_Item(117) && (Q.Rev_Item(95)!=Q.Rev_Item(117)))
		{VRIN++;}
		if(!Q.Missing_Item(98) && !Q.Missing_Item(259) && (Q.Rev_Item(98)!=Q.Rev_Item(259)))
		{VRIN++;}
		if(!Q.Missing_Item(172) && !Q.Missing_Item(195) && (Q.Rev_Item(172)!=Q.Rev_Item(195)))
		{VRIN++;}

		if(!Q.Missing_Item(3) && !Q.Missing_Item(225) && (Q.Rev_Item(3)==0) && (Q.Rev_Item(225)==1))
		{VRIN++;}
		if(!Q.Missing_Item(11) && !Q.Missing_Item(207) && (Q.Rev_Item(11)==0) && (Q.Rev_Item(207)==1))
		{VRIN++;}
		if(!Q.Missing_Item(14) && !Q.Missing_Item(258) && (Q.Rev_Item(14)==0) && (Q.Rev_Item(258)==1))
		{VRIN++;}
		if(!Q.Missing_Item(15) && !Q.Missing_Item(199) && (Q.Rev_Item(15)==1) && (Q.Rev_Item(199)==0))
		{VRIN++;}
		if(!Q.Missing_Item(22) && !Q.Missing_Item(220) && (Q.Rev_Item(22)==0) && (Q.Rev_Item(220)==1))
		{VRIN++;}
		if(!Q.Missing_Item(23) && !Q.Missing_Item(33) && (Q.Rev_Item(23)==0) && (Q.Rev_Item(33)==1))
		{VRIN++;}
		if(!Q.Missing_Item(35) && !Q.Missing_Item(212) && (Q.Rev_Item(35)==0) && (Q.Rev_Item(212)==1))
		{VRIN++;}
		if(!Q.Missing_Item(36) && !Q.Missing_Item(193) && (Q.Rev_Item(36)==1) && (Q.Rev_Item(193)==0))
		{VRIN++;}
		if(!Q.Missing_Item(41) && !Q.Missing_Item(229) && (Q.Rev_Item(41)==1) && (Q.Rev_Item(229)==0))
		{VRIN++;}
		if(!Q.Missing_Item(43) && !Q.Missing_Item(264) && (Q.Rev_Item(43)==1) && (Q.Rev_Item(264)==0))
		{VRIN++;}
		if(!Q.Missing_Item(50) && !Q.Missing_Item(122) && (Q.Rev_Item(50)==1) && (Q.Rev_Item(122)==0))
		{VRIN++;}
		if(!Q.Missing_Item(51) && !Q.Missing_Item(191) && (Q.Rev_Item(51)==0) && (Q.Rev_Item(191)==1))
		{VRIN++;}
		if(!Q.Missing_Item(52) && !Q.Missing_Item(66) && (Q.Rev_Item(52)==0) && (Q.Rev_Item(66)==1))
		{VRIN++;}
		if(!Q.Missing_Item(55) && !Q.Missing_Item(190) && (Q.Rev_Item(55)==1) && (Q.Rev_Item(190)==0))
		{VRIN++;}
		if(!Q.Missing_Item(56) && !Q.Missing_Item(151) && (Q.Rev_Item(56)==1) && (Q.Rev_Item(151)==0))
		{VRIN++;}
		if(!Q.Missing_Item(57) && !Q.Missing_Item(219) && (Q.Rev_Item(57)==0) && (Q.Rev_Item(219)==1))
		{VRIN++;}
		if(!Q.Missing_Item(61) && !Q.Missing_Item(120) && (Q.Rev_Item(61)==1) && (Q.Rev_Item(120)==0))
		{VRIN++;}
		if(!Q.Missing_Item(67) && !Q.Missing_Item(241) && (Q.Rev_Item(67)==1) && (Q.Rev_Item(241)==0))
		{VRIN++;}
		if(!Q.Missing_Item(71) && !Q.Missing_Item(194) && (Q.Rev_Item(71)==0) && (Q.Rev_Item(194)==1))
		{VRIN++;}
		if(!Q.Missing_Item(74) && !Q.Missing_Item(214) && (Q.Rev_Item(74)==1) && (Q.Rev_Item(214)==0))
		{VRIN++;}
		if(!Q.Missing_Item(91) && !Q.Missing_Item(146) && (Q.Rev_Item(91)==0) && (Q.Rev_Item(146)==1))
		{VRIN++;}
		if(!Q.Missing_Item(93) && !Q.Missing_Item(128) && (Q.Rev_Item(93)==0) && (Q.Rev_Item(128)==1))
		{VRIN++;}
		if(!Q.Missing_Item(101) && !Q.Missing_Item(202) && (Q.Rev_Item(101)==0) && (Q.Rev_Item(202)==1))
		{VRIN++;}
		if(!Q.Missing_Item(108) && !Q.Missing_Item(249) && (Q.Rev_Item(108)==0) && (Q.Rev_Item(249)==1))
		{VRIN++;}
		if(!Q.Missing_Item(133) && !Q.Missing_Item(205) && (Q.Rev_Item(133)==1) && (Q.Rev_Item(205)==0))
		{VRIN++;}
		if(!Q.Missing_Item(136) && !Q.Missing_Item(266) && (Q.Rev_Item(136)==0) && (Q.Rev_Item(266)==1))
		{VRIN++;}
		if(!Q.Missing_Item(167) && !Q.Missing_Item(272) && (Q.Rev_Item(167)==0) && (Q.Rev_Item(272)==1))
		{VRIN++;}


		//handle counting missing pairs so can prorate. 
		//two types of decisions.  1) for not equal item pairs, pair is missing if either
		//item is missing.  2) for specific value pairs, pair is missing if both missing, or if single missing
		//item is equal to target value.  (i.e., for 3, 245 pair, if 3 missing and 245 =1, then missing.  However,
		//if 3 is missing and 245 = 0, pair is not missing b/c couldnt get a point.)

		int	VRINMISS=0;
		//type 1
		if(Q.Missing_Item(1) || Q.Missing_Item(148))
		{VRINMISS++;}
		if(Q.Missing_Item(4) || Q.Missing_Item(216))
		{VRINMISS++;}
		if(Q.Missing_Item(17) || Q.Missing_Item(227))
		{VRINMISS++;}
		if(Q.Missing_Item(20) || Q.Missing_Item(239))
		{VRINMISS++;}
		if(Q.Missing_Item(24) || Q.Missing_Item(147))
		{VRINMISS++;}
		if(Q.Missing_Item(44) || Q.Missing_Item(139))
		{VRINMISS++;}
		if(Q.Missing_Item(54) || Q.Missing_Item(179))
		{VRINMISS++;}
		if(Q.Missing_Item(83) || Q.Missing_Item(213))
		{VRINMISS++;}
		if(Q.Missing_Item(87) || Q.Missing_Item(204))
		{VRINMISS++;}
		if(Q.Missing_Item(95) || Q.Missing_Item(117))
		{VRINMISS++;}
		if(Q.Missing_Item(98) || Q.Missing_Item(259))
		{VRINMISS++;}
		if(Q.Missing_Item(172) || Q.Missing_Item(195))
		{VRINMISS++;}

		//type 2
		if((Q.Missing_Item(3) && Q.Missing_Item(225)) || ((Q.Rev_Item(3)==0) && (Q.Missing_Item(225)))
			|| ((Q.Rev_Item(225)==1) && (Q.Missing_Item(3))))
		{VRINMISS++;}
		if((Q.Missing_Item(11) && Q.Missing_Item(207)) || ((Q.Rev_Item(11)==0) && (Q.Missing_Item(207)))
			|| ((Q.Rev_Item(207)==1) && (Q.Missing_Item(11))))
		{VRINMISS++;}
		if((Q.Missing_Item(14) && Q.Missing_Item(258)) || ((Q.Rev_Item(14)==0) && (Q.Missing_Item(258)))
			|| ((Q.Rev_Item(258)==1) && (Q.Missing_Item(14))))
		{VRINMISS++;}
		if((Q.Missing_Item(15) && Q.Missing_Item(199)) || ((Q.Rev_Item(15)==1) && (Q.Missing_Item(199)))
			|| ((Q.Rev_Item(199)==0) && (Q.Missing_Item(15))))
		{VRINMISS++;}
		if((Q.Missing_Item(22) && Q.Missing_Item(220)) || ((Q.Rev_Item(22)==0) && (Q.Missing_Item(220)))
			|| ((Q.Rev_Item(220)==1) && (Q.Missing_Item(22))))
		{VRINMISS++;}
		if((Q.Missing_Item(23) && Q.Missing_Item(33)) || ((Q.Rev_Item(23)==0) && (Q.Missing_Item(33)))
			|| ((Q.Rev_Item(33)==1) && (Q.Missing_Item(23))))
		{VRINMISS++;}
		if((Q.Missing_Item(35) && Q.Missing_Item(212)) || ((Q.Rev_Item(35)==0) && (Q.Missing_Item(212)))
			|| ((Q.Rev_Item(212)==1) && (Q.Missing_Item(35))))
		{VRINMISS++;}
		if((Q.Missing_Item(36) && Q.Missing_Item(193)) || ((Q.Rev_Item(36)==1) && (Q.Missing_Item(193)))
			|| ((Q.Rev_Item(193)==0) && (Q.Missing_Item(36))))
		{VRINMISS++;}
		if((Q.Missing_Item(41) && Q.Missing_Item(229)) || ((Q.Rev_Item(41)==1) && (Q.Missing_Item(229)))
			|| ((Q.Rev_Item(229)==0) && (Q.Missing_Item(41))))
		{VRINMISS++;}
		if((Q.Missing_Item(43) && Q.Missing_Item(264)) || ((Q.Rev_Item(43)==1) && (Q.Missing_Item(264)))
			|| ((Q.Rev_Item(264)==0) && (Q.Missing_Item(43))))
		{VRINMISS++;}
		if((Q.Missing_Item(50) && Q.Missing_Item(122)) || ((Q.Rev_Item(50)==1) && (Q.Missing_Item(122)))
			|| ((Q.Rev_Item(122)==0) && (Q.Missing_Item(50))))
		{VRINMISS++;}
		if((Q.Missing_Item(51) && Q.Missing_Item(191)) || ((Q.Rev_Item(51)==0) && (Q.Missing_Item(191)))
			|| ((Q.Rev_Item(191)==1) && (Q.Missing_Item(51))))
		{VRINMISS++;}
		if((Q.Missing_Item(52) && Q.Missing_Item(66)) || ((Q.Rev_Item(52)==0) && ( Q.Missing_Item(66)))
			|| ((Q.Rev_Item(66)==1) && (Q.Missing_Item(52))))
		{VRINMISS++;}
		if((Q.Missing_Item(55) && Q.Missing_Item(190)) || ((Q.Rev_Item(55)==1) && (Q.Missing_Item(190)))
			|| ((Q.Rev_Item(190)==0) && (Q.Missing_Item(55))))
		{VRINMISS++;}
		if((Q.Missing_Item(56) && Q.Missing_Item(151)) || ((Q.Rev_Item(56)==1) && (Q.Missing_Item(151)))
			|| ((Q.Rev_Item(151)==0) && (Q.Missing_Item(56))))
		{VRINMISS++;}
		if((Q.Missing_Item(57) && Q.Missing_Item(219)) || ((Q.Rev_Item(57)==0) && (Q.Missing_Item(219)))
			|| ((Q.Rev_Item(219)==1) && (Q.Missing_Item(57))))
		{VRINMISS++;}
		if((Q.Missing_Item(61) && Q.Missing_Item(120)) || ((Q.Rev_Item(61)==1) && (Q.Missing_Item(120)))
			|| ((Q.Rev_Item(120)==0) && (Q.Missing_Item(61))))
		{VRINMISS++;}
		if((Q.Missing_Item(67) && Q.Missing_Item(241)) || ((Q.Rev_Item(67)==1) && (Q.Missing_Item(241)))
			|| ((Q.Rev_Item(241)==0) && (Q.Missing_Item(67))))
		{VRINMISS++;}
		if((Q.Missing_Item(71) && Q.Missing_Item(194)) || ((Q.Rev_Item(71)==0) && (Q.Missing_Item(194)))
			|| ((Q.Rev_Item(194)==1) && (Q.Missing_Item(71))))
		{VRINMISS++;}
		if((Q.Missing_Item(74) && Q.Missing_Item(214)) || ((Q.Rev_Item(74)==1) && (Q.Missing_Item(214)))
			|| ((Q.Rev_Item(214)==0) && (Q.Missing_Item(74))))
		{VRINMISS++;}
		if((Q.Missing_Item(91) && Q.Missing_Item(146)) || ((Q.Rev_Item(91)==0) && (Q.Missing_Item(146)))
			|| ((Q.Rev_Item(146)==1) && (Q.Missing_Item(91))))
		{VRINMISS++;}
		if((Q.Missing_Item(93) && Q.Missing_Item(128)) || ((Q.Rev_Item(93)==0) && (Q.Missing_Item(128)))
			|| ((Q.Rev_Item(128)==1) && (Q.Missing_Item(93))))
		{VRINMISS++;}
		if((Q.Missing_Item(101) && Q.Missing_Item(202)) || ((Q.Rev_Item(101)==0) && (Q.Missing_Item(202)))
			|| ((Q.Rev_Item(202)==1) && (Q.Missing_Item(101))))
		{VRINMISS++;}
		if((Q.Missing_Item(108) && Q.Missing_Item(249)) || ((Q.Rev_Item(108)==0) && (Q.Missing_Item(249)))
			|| ((Q.Rev_Item(249)==1) && (Q.Missing_Item(108))))
		{VRINMISS++;}
		if((Q.Missing_Item(133) && Q.Missing_Item(205)) || ((Q.Rev_Item(133)==1) && (Q.Missing_Item(205)))
			|| ((Q.Rev_Item(205)==0) && (Q.Missing_Item(114))))
		{VRINMISS++;}
		if((Q.Missing_Item(136) && Q.Missing_Item(266)) || ((Q.Rev_Item(136)==0) && (Q.Missing_Item(266)))
			|| ((Q.Rev_Item(266)==1) && (Q.Missing_Item(136))))
		{VRINMISS++;}
		if((Q.Missing_Item(167) && Q.Missing_Item(274)) || ((Q.Rev_Item(167)==0) && (Q.Missing_Item(272)))
			|| ((Q.Rev_Item(272)==1) && (Q.Missing_Item(167))))
		{VRINMISS++;}


		if(VRINMISS >=10)
		{
			  VRIN = Q.Return_Missing_Code();  // more than 25% of item pairs are missing
		}
		else			//prorate for missing item pairs
		{
			  VRIN = VRIN * (39.0/(39.0-VRINMISS));
		}
		Q.Insert_Scale_Score(VRIN);

		//scoring system for Invalid
		Invalid =0;
		if(TRIN>= 25.6420 || TRIN <=12.6752)
		{Invalid =1;}
		if(VRIN>= 11.19)
		{Invalid =1;}
		if(VRIN>= 8.9729 && (TRIN>=23.7660 || TRIN <=14.4412))
		{Invalid =1;}
		Q.Insert_Scale_Score(Invalid);

		Q.Output_Scale_Scores();   //Do not touch this line
	}
}

//END OF PROGRAM
