/* filename = sq_pan.cpp
	9/14/97
	Created by Emily Daughtrey

	Questionnaire scoring program for PANAS-20 item (PAN)

*/

#include "TQFile.cpp"

void main()
{
////////////////////////////////////////////////////////////////////////////

	cout	<<	"Scoring Program for PANAS-20 item (PAN)\n";

////////////////////////////////////////////////////////////////////////////

	TQFile	Q(1,5);

////////////////////////////////////////////////////////////////////////////
	//P20 item includes 2 scores.  There is no total score.

	float PositiveAffect;
	float NegativeAffect;

////////////////////////////////////////////////////////////////////////////

	Q.Insert_Scale_Name("PAN_PAF");
	Q.Insert_Scale_Name("PAN_NAF");
	Q.Output_File_Header();

///////////////////////////////////////////////////////////////////////////
	
	while (Q.Get_Subjects_Items())     //Do not touch this line
	{
		//Calculates Positive Affect score.
		Q.Reset_Item_Counts();
		PositiveAffect = Q.Item(1) + Q.Item(3) + Q.Item(5) + Q.Item(9) + Q.Item(10) +
		Q.Item(12) + Q.Item(14) + Q.Item(16) + Q.Item(17) + Q.Item(19);
		PositiveAffect = Q.Prorate_Scale(PositiveAffect);
		Q.Insert_Scale_Score(PositiveAffect);

		//Calculates Negative Affect score.
		Q.Reset_Item_Counts();
		NegativeAffect = Q.Item(2) + Q.Item(4) + Q.Item(6) + Q.Item(7) + Q.Item(8) +
		Q.Item(11) + Q.Item(13) + Q.Item(15) + Q.Item(18) + Q.Item(20);
		NegativeAffect = Q.Prorate_Scale(NegativeAffect);
		Q.Insert_Scale_Score(NegativeAffect);


		Q.Output_Scale_Scores();   //Do not touch this line
	}
}

//END OF PROGRAM
