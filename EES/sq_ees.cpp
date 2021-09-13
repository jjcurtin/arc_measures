/* filename = sq_ees.cpp
	9/14/97
	Created by Emily Daughtrey

	Questionnaire scoring program for Emotional Empathy Scale

*/

#include "TQFile.cpp"

void main()
{
////////////////////////////////////////////////////////////////////////////

	cout	<<	"Scoring Program for Emotional Empathy Scale (EES)\n";

////////////////////////////////////////////////////////////////////////////

	TQFile	Q(-4,4);

////////////////////////////////////////////////////////////////////////////
	//Emotional Empathy Scale includes a total score.

	float EESTotal;
	

////////////////////////////////////////////////////////////////////////////

	Q.Insert_Scale_Name("EES_TOT");
	Q.Output_File_Header();

///////////////////////////////////////////////////////////////////////////
	
	while (Q.Get_Subjects_Items())     //Do not touch this line
	{
		//Calculates Emotional Empathy total score.
		Q.Reset_Item_Counts();
		EESTotal = Q.Item(1) + Q.Item(5) + Q.Item(7) + Q.Item(8) + Q.Item(9) +
		Q.Item(10) + Q.Item(12) + Q.Item(14) + Q.Item(16) + Q.Item(17) +
		Q.Item(18) + Q.Item(19) + Q.Item(25) + Q.Item(27) + Q.Item(29) +
		Q.Item(31) + Q.Rev_Item(2) + Q.Rev_Item(3) + Q.Rev_Item(4) + 
		Q.Rev_Item(6) + Q.Rev_Item(11) + Q.Rev_Item(13) + Q.Rev_Item(15) + 
		Q.Rev_Item(20) + Q.Rev_Item(21) + Q.Rev_Item(22) + Q.Rev_Item(23) + 
		Q.Rev_Item(24) + Q.Rev_Item(26) + Q.Rev_Item(28) + Q.Rev_Item(30) + 
		Q.Rev_Item(32) + Q.Rev_Item(33);
		EESTotal = Q.Prorate_Scale(EESTotal);
		Q.Insert_Scale_Score(EESTotal);


		Q.Output_Scale_Scores();   //Do not touch this line
	}
}

//END OF PROGRAM
