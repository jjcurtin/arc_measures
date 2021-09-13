/* filename = q_p12.cpp
	9/27/97
	Created by Emily Daughtrey & John Curtin

	Scoring program for the short PANAS-12 item (P12)
	it provides scales scores for PA, NA (five items each)
	and Anger, Control (1 item each)
*/

#include "TQFile.cpp"

void main()
{

	cout	<<	"Scoring Program for the PANAS-12 item (P12)\n";

////////////////////////////////////////////////////////////////////////////
	//Declares a Questionnaire Object.
	//Must put the low end of rating scale and high end of rating scale as per
	//standard scoring for the questionnaire as parameters (lowend, highend).
	//The example below is for a five point likert scale with 1 and 5 as anchors
	//Note: the actual items may be scored on a different scale, but that correction
	//is handled automatically

	TQFile	Q(1,5);

////////////////////////////////////////////////////////////////////////////
	//Declare a variable for each scale that will be scored.

	float	PA;
	float   NA;
	float	Control;
	float	Anger;

////////////////////////////////////////////////////////////////////////////
	//You need to record the names of the scales in the order that you will score
	//them below(in next section).  Below, scale1 is scored first and scale2 is
	//scored second.
	//Between the quotes put a name (up to 8 charaters) for each scale
	//You need to have one Insert_Scale_Name for each scale, so you may need
	//to add more.

	Q.Insert_Scale_Name("P12_PAF");
	Q.Insert_Scale_Name("P12_NAF");
	Q.Insert_Scale_Name("P12_CON");
	Q.Insert_Scale_Name("P12_ANG");
	Q.Output_File_Header();

///////////////////////////////////////////////////////////////////////////
	//In this section you will insert the equations to compute each scale
	//use the normal mathematical operators (+, -, *, /).
	//Q.Item(ItemNumber,Weight) and Q.Rev_Item(ItemNumber,Weight) return the value
	//of that ItemNumber multiplied by Weight (can use decimal for weighting
	//of less than 1. i.e., .5). If no weight is provided, 1.0 (no weigting)
	//is assumed.  Item returns regular value, Rev_Item returns reverse scored
	//value.
	//Remember to write the equations for the scale in the order that you inserted
	//their names in the above section
	//There are two examples given below.

	while (Q.Get_Subjects_Items())     //Do not touch this line
	{
		//scoring of the PA Scale
		Q.Reset_Item_Counts();

		PA = Q.Item(1) + Q.Item(3) + Q.Item(6) + Q.Item(8) + Q.Item(10);
		PA = Q.Prorate_Scale(PA);

		Q.Insert_Scale_Score(PA);

		//scoring of NA Scale
		Q.Reset_Item_Counts();
		NA = Q.Item(2)+Q.Item(5) + Q.Item(7) + Q.Item(11) + Q.Item(12);
		NA = Q.Prorate_Scale(NA);
		Q.Insert_Scale_Score(NA);

		//scoring of Control Scale
		Q.Reset_Item_Counts();
		Control = Q.Item(4);
		Control = Q.Prorate_Scale(Control);
		Q.Insert_Scale_Score(Control);

		//scoring of Anger Scale
		Q.Reset_Item_Counts();
		Anger = Q.Item(9);
      Anger = Q.Prorate_Scale(Anger);
		Q.Insert_Scale_Score(Anger);

		Q.Output_Scale_Scores();   //Do not touch this line
	}
}

//END OF PROGRAM
