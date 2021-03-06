* Goal: Scores the Welsh Anxiety Inventory (WAI).
* Author: dgm.
* Last edited: dgm 1/27/02.
* Assumes 1 = 'True' 2= 'False'.
* TO DO: 1) not sure about duplicate sysmis lines. 2) get weird error due to sort command at end. 
* Program makes a score SYSMIS if more than 50% of the items for the scale weren't answered.

VALUE LABELS wai1 TO wai39 1 'True' 2 'False'.

*COUNT THE NUMBER OF VALID ITEMS FOR EACH SCALE.
COUNT WELSHN =  wai1 to wai39 (1,2).

* SCORE THE SCALES.
COUNT welshT = wai1 to wai38 (1).
COUNT WELSHF = wai39 (2).

* Compute scores if there are 50% or more valid answers for that scale.
DO IF (WELSHN >=20).
 COMPUTE WELSH = WELSHT + WELSHF. 
 * Prorate.
 COMPUTE WELSH = RND(WELSH * (39/WELSHN)).
END IF.

VARIABLE LABELS WELSH 'Welsh Anxiety'.

FORMATS IDNUM (F5.0) WELSH (F4.0).
EXECUTE.





