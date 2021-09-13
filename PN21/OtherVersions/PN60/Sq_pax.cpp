/* filename = sq_pax.cpp
	9/14/97
	Created by Emily Daughtrey

	Questionnaire scoring program For PANAS-X, 60 item (PAX)

*/

#include "TQFile.cpp"

void main()
{
////////////////////////////////////////////////////////////////////////////

		cout	<<	"Scoring Program for PANAS-X, 60 item (PAX)\n";

////////////////////////////////////////////////////////////////////////////

	TQFile	Q(1,5);

////////////////////////////////////////////////////////////////////////////
	//PAX includes 2 higher order scale scores (Positive Affect and
	//Negative Affect) and 11 lower order scale scores.  There is no total score.

	float	PositiveAffect;
	float NegativeAffect;
	float	Attentiveness;
	float Shyness;
	float Fatigue;
	float Serenity;
	float Surprise;
	float Fear;
	float	Hostility;
	float Guilt;
	float Sadness;
	float Joviality;
	float SelfAssurance;


////////////////////////////////////////////////////////////////////////////

	Q.Insert_Scale_Name("PAX_PAF");
	Q.Insert_Scale_Name("PAX_NAF");
	Q.Insert_Scale_Name("PAX_ATT");
	Q.Insert_Scale_Name("PAX_SHY");
	Q.Insert_Scale_Name("PAX_FAT");
	Q.Insert_Scale_Name("PAX_SRN");
	Q.Insert_Scale_Name("PAX_SUR");
	Q.Insert_Scale_Name("PAX_FER");
	Q.Insert_Scale_Name("PAX_HOS");
	Q.Insert_Scale_Name("PAX_GLT");
	Q.Insert_Scale_Name("PAX_SAD");
	Q.Insert_Scale_Name("PAX_JOV");
	Q.Insert_Scale_Name("PAX_SAS");

	Q.Output_File_Header();

///////////////////////////////////////////////////////////////////////////

	while (Q.Get_Subjects_Items())     //Do not touch this line
	{
		//Calculates Positive Affect higher order scale score.
		Q.Reset_Item_Counts();
		PositiveAffect = Q.Item(3) + Q.Item(8) + Q.Item(13) + Q.Item(25) +
		Q.Item(31) + Q.Item(37) + Q.Item(39) + Q.Item(47) + Q.Item(52) +
		Q.Item(55);
		PositiveAffect = Q.Prorate_Scale(PositiveAffect);
		Q.Insert_Scale_Score(PositiveAffect);

		 //Calculates Negative Affect higher order scale score.
		Q.Reset_Item_Counts();
		NegativeAffect = Q.Item(11) + Q.Item(18) + Q.Item(26) + Q.Item(32) +
		Q.Item(34) + Q.Item(38) + Q.Item(40) + Q.Item(42) + Q.Item(44) +
		Q.Item(50);
		NegativeAffect = Q.Prorate_Scale(NegativeAffect);
		Q.Insert_Scale_Score(NegativeAffect);

		//Calculates Attentiveness lower order scale score.
      Q.Reset_Item_Counts();
		Attentiveness = Q.Item(3) + Q.Item(25) + Q.Item(52) + Q.Item(59);
		Attentiveness = Q.Prorate_Scale(Attentiveness);
		Q.Insert_Scale_Score(Attentiveness);

		//Calculates Shyness lower order scale score.
      Q.Reset_Item_Counts();
		Shyness = Q.Item(4) + Q.Item(23) + Q.Item(30) + Q.Item(49);
		Shyness = Q.Prorate_Scale(Shyness);
		Q.Insert_Scale_Score(Shyness);

		//Calculates Fatigue lower order scale score.
      Q.Reset_Item_Counts();
		Fatigue = Q.Item(5) + Q.Item(19) + Q.Item(36) + Q.Item(45);
		Fatigue = Q.Prorate_Scale(Fatigue);
		Q.Insert_Scale_Score(Fatigue);

		//Calculates Serenity lower order scale score.
      Q.Reset_Item_Counts();
		Serenity = Q.Item(10) + Q.Item(17) + Q.Item(43);
		Serenity = Q.Prorate_Scale(Serenity);
		Q.Insert_Scale_Score(Serenity);

		//Calculates Surprise lower order scale score.
		Q.Reset_Item_Counts();
		Surprise = Q.Item(7) + Q.Item(20) + Q.Item(54);
		Surprise = Q.Prorate_Scale(Surprise);
		Q.Insert_Scale_Score(Surprise);

		//Calculates Fear lower order scale score.
		Q.Reset_Item_Counts();
		Fear = Q.Item(18) + Q.Item(21) + Q.Item(34) + Q.Item(40) +
		Q.Item(44) + Q.Item(53);
		Fear = Q.Prorate_Scale(Fear);
		Q.Insert_Scale_Score(Fear);

		//Calculates Hostility lower order scale score.
      Q.Reset_Item_Counts();
		Hostility = Q.Item(2) + Q.Item(9) + Q.Item(11) + Q.Item(27) +
		Q.Item(38) + Q.Item(56);
		Hostility = Q.Prorate_Scale(Hostility);
		Q.Insert_Scale_Score(Hostility);

		//Calculates Guilt lower order scale score.
      Q.Reset_Item_Counts();
		Guilt = Q.Item(15) + Q.Item(32) + Q.Item(42) + Q.Item(46) +
		Q.Item(51) + Q.Item(60);
		Guilt = Q.Prorate_Scale(Guilt);
		Q.Insert_Scale_Score(Guilt);

		//Calculates Sadness lower order scale score.
		Q.Reset_Item_Counts();
		Sadness = Q.Item(16) + Q.Item(24) + Q.Item(29) + Q.Item(35) +
		Q.Item(48);
		Sadness = Q.Prorate_Scale(Sadness);
		Q.Insert_Scale_Score(Sadness);

		//Calculates Joviality lower order scale score.
      Q.Reset_Item_Counts();
		Joviality = Q.Item(1) + Q.Item(12) + Q.Item(22) + Q.Item(33) +
		Q.Item(37) + Q.Item(41) + Q.Item(47) + Q.Item(58);
		Joviality = Q.Prorate_Scale(Joviality);
		Q.Insert_Scale_Score(Joviality);

      //Calculates Self Assurance lower order scale score.
      Q.Reset_Item_Counts();
		SelfAssurance = Q.Item(6) + Q.Item(8) + Q.Item(14) + Q.Item(28) +
		Q.Item(39) + Q.Item(57);
		SelfAssurance = Q.Prorate_Scale(SelfAssurance);
		Q.Insert_Scale_Score(SelfAssurance);


		Q.Output_Scale_Scores();   //Do not touch this line
	}
}

//END OF PROGRAM
