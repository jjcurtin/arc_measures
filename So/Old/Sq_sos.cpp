/* filename = sq_sos.cpp
	9/14/97
	Created by Emily Daughtrey

	Questionnaire scoring program for Socialization Scale (SOS)
	currently data is coded 1=false, 0=true
*/

#include "TQFile.cpp"

void main()
{
////////////////////////////////////////////////////////////////////////////

	cout	<<	"Scoring Program for Socialization Scale (SOS)\n";

////////////////////////////////////////////////////////////////////////////

	TQFile	Q(0,1);

////////////////////////////////////////////////////////////////////////////
	//SOS Scale includes a total score.

	float	Totalso;


////////////////////////////////////////////////////////////////////////////

	Q.Insert_Scale_Name("SOS_TOT");
	Q.Output_File_Header();

///////////////////////////////////////////////////////////////////////////

	while (Q.Get_Subjects_Items())     //Do not touch this line
	{
		//Calculates SOS total score.
     		Q.Reset_Item_Counts();
		Totalso = Q.Rev_Item(3) + Q.Rev_Item(6) + Q.Rev_Item(7) + Q.Rev_Item(10) +
		Q.Rev_Item(12) + Q.Rev_Item(15) + Q.Rev_Item(16) + Q.Rev_Item(17) + 
		Q.Rev_Item(19) + Q.Rev_Item(20) + Q.Rev_Item(22) + Q.Rev_Item(24) +
		Q.Rev_Item(25) + Q.Rev_Item(27) + Q.Rev_Item(32) + Q.Rev_Item(34) + 
		Q.Rev_Item(37) + Q.Rev_Item(39) + Q.Rev_Item(40) + Q.Rev_Item(44) + 
		Q.Rev_Item(48) + Q.Rev_Item(52) + Q.Item(1) + Q.Item(2) + Q.Item(4) + 
		Q.Item(5) + Q.Item(8) + Q.Item(9) + Q.Item(11) + Q.Item(13) + Q.Item(14) + 
		Q.Item(18) + Q.Item(21) + Q.Item(23) + Q.Item(26) + Q.Item(28) +
		Q.Item(29) + Q.Item(30) + Q.Item(31) + Q.Item(33) + Q.Item(35) + 
		Q.Item(36) + Q.Item(38) + Q.Item(41) + Q.Item(42) + Q.Item(43) + 
		Q.Item(45) + Q.Item(46) + Q.Item(47) + Q.Item(49) + Q.Item(50) + 
		Q.Item(51) + Q.Item(53) +Q.Item(54);
		Totalso = Q.Prorate_Scale(Totalso);
		Q.Insert_Scale_Score(Totalso);

		Q.Output_Scale_Scores();   //Do not touch this line
	}
}

//END OF PROGRAM
