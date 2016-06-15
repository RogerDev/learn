r := RECORD 
	REAL elevation; 
	REAL aspect; 
	REAL slope; 
	REAL hydro_h; 
	REAL hydro_v; 
	REAL road_h;
	REAL shade9;
	REAL shade12;
	REAL shade15;
	REAL fire_h;
	STRING ftype;
END;

forest := DATASET('forest_csv', r, CSV(HEADING(1)));
spruce := forest(forest.ftype='Spruce');
spruce_min_elev := MIN(spruce, spruce.elevation);
spruce_max_elev := MAX(spruce, spruce.elevation);
sumrec := RECORD
	ftype := forest.ftype;
	minelev := MIN(GROUP, forest.elevation);
	maxelev := MAX(GROUP, forest.elevation);
	avgelev := AVE(GROUP, forest.elevation);
END;

sumtbl := TABLE(forest, sumrec, forest.ftype);

sumtbl;