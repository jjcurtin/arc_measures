RENAME VARIABLE (DEM1 = DEM_Age).
EXECUTE .

VALUE LABELS DEM2 1 'Male' 0 'Female'.
RENAME VARIABLE (DEM2 = DEM_Sex).
EXECUTE.

VALUE LABELS DEM3 1 'American Indian/Alaska' 2 'Asian' 3 'Native Hawaaiian or Pac Islander' 4 'African American' 5 'Caucasin' .
RENAME VARIABLE (DEM3 = DEM_Race).
EXECUTE.

VALUE LABELS DEM4 0 'No' 1 'Yes'.
RENAME VARIABLE (DEM4 = DEM_HispanicOrigin).
EXECUTE.

VALUE LABELS DEM5 1 'Less than HS or GED' 2 'HS or GED' 3 'Some college' 4 '2-Year degree' 5 'College degree' 6 'Advanced degree' .
RENAME VARIABLE (DEM5 = DEM_Education).
EXECUTE.
