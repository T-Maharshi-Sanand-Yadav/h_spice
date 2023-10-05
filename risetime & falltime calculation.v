//How to calculate rise time and fall time in command line cadence i.e. by modifying input.scs

//original
.MEAS TRAN vmax 	MAX 	V(out) FROM=TDval TO=Tstop
.MEAS TRAN vmin 	MIN 	V(out) FROM=TDval TO=Tstop
.MEAS TRAN Trise 	TRIG 	V(out) 	val=’vmin+0.1*vmax’ TD=TDval RISE=1 TARG V(out) val=’0.9*vmax’ 		RISE=1
.MEAS TRAN Tfall 	TRIG 	V(out) 	val=’0.9*vmax’ 		TD=TDval FALL=2 TARG V(out) val=’vmin+0.1*vmax’ FALL=2
.MEAS TRAN Tdelay 	TRIG 	V(in) 	val=2.5 			TD=TDval FALL=1 TARG V(out) val=2.5 			FALL=2



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////CORRECT/////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
.MEAS TRAN vmin_a MIN V(a) FROM=0 TO=1n
.MEAS TRAN vmax_a MAX V(a) FROM=0 TO=1n
.MEAS TRAN vmin_y MIN V(y) FROM=0 TO=1n
.MEAS TRAN vmax_y MAX V(y) FROM=0 TO=1n
.MEAS TRAN Trise_10%_to_90% 	TRIG 	V(y) 	val=’vmin_y+0.1*vmax_y’ TD=12.7n RISE=1 TARG V(y) val=’0.9*vmax_y’ 		    RISE=1
.MEAS TRAN Tfall_10%_to_90% 	TRIG 	V(y) 	val=’0.9*vmax_y’ 		TD=25n 	 FALL=2 TARG V(y) val=’vmin_y+0.1*vmax_y’   FALL=2
.MEAS TRAN Trise_20%_to_80% 	TRIG 	V(y) 	val=’vmin_y+0.2*vmax_y’ TD=12.7n RISE=1 TARG V(y) val=’0.8*vmax_y’ 		    RISE=1
.MEAS TRAN Tfall_20%_to_80% 	TRIG 	V(y) 	val=’0.8*vmax_y’ 		TD=25n 	 FALL=2 TARG V(y) val=’vmin_y+0.2*vmax_y’   FALL=2
.MEAS TRAN Trise_30%_to_70% 	TRIG 	V(y) 	val=’vmin_y+0.3*vmax_y’ TD=12.7n RISE=1 TARG V(y) val=’0.7*vmax_y’ 		    RISE=1
.MEAS TRAN Tfall_30%_to_70% 	TRIG 	V(y) 	val=’0.7*vmax_y’ 		TD=25n 	 FALL=2 TARG V(y) val=’vmin_y+0.3*vmax_y’   FALL=2
.MEAS TRAN Trise_40%_to_60% 	TRIG 	V(y) 	val=’vmin_y+0.4*vmax_y’ TD=12.7n RISE=1 TARG V(y) val=’0.6*vmax_y’ 		    RISE=1
.MEAS TRAN Tfall_40%_to_60% 	TRIG 	V(y) 	val=’0.6*vmax_y’ 		TD=25n 	 FALL=2 TARG V(y) val=’vmin_y+0.4*vmax_y’   FALL=2
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////RESULT/////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Measurement Name: Transient1
Analysis Type: TRAN
vmin_a = 0
vmax_a = 1.2
vmin_y = 0.503188
vmax_y = 1.20026
Tfall_10%_to_90% = 3.6749e-10
Tfall_20%_to_80% = 1.61206e-10
Tfall_30%_to_70% = -1.68863e-11
Tfall_40%_to_60% = -1.97113e-10

Trise_10%_to_90% = 3.44231e-10
Trise_20%_to_80% = 1.46566e-10
Trise_30%_to_70% = -1.52181e-11
Trise_40%_to_60% = -1.79935e-10

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////WRONG/////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//10% to 90%
.MEAS TRAN Trise TRIG V(a) val=’vmin_a+0.1*vmax_a’ 	TD=12.5n FALL=1 TARG V(y) val=’0.9*vmax_a’ 			RISE=1
.MEAS TRAN Tfall TRIG V(a) val=’0.9*vmax_a’ 		TD=25n 	 RISE=2 TARG V(y) val=’vmin_a+0.1*vmax_a’ 	FALL=2

//20% to 80%
.MEAS TRAN Trise TRIG V(a) val=’vmin_a+0.2*vmax_a’ 	TD=12.5n FALL=1 TARG V(y) val=’0.8*vmax_a’ 			RISE=1
.MEAS TRAN Tfall TRIG V(a) val=’0.8*vmax_a’ 		TD=25n 	 RISE=2 TARG V(y) val=’vmin_a+0.2*vmax_a’ 	FALL=2

//30% to 70%
.MEAS TRAN Trise TRIG V(a) val=’vmin_a+0.3*vmax_a’ 	TD=12.5n FALL=1 TARG V(y) val=’0.7*vmax_a’ 			RISE=1
.MEAS TRAN Tfall TRIG V(a) val=’0.7*vmax_a’ 		TD=25n 	 RISE=2 TARG V(y) val=’vmin_a+0.3*vmax_a’ 	FALL=2

//40% to 60%
.MEAS TRAN Trise TRIG V(a) val=’vmin_a+0.4*vmax_a’ 	TD=12.5n FALL=1 TARG V(y) val=’0.6*vmax_a’ 			RISE=1
.MEAS TRAN Tfall TRIG V(a) val=’0.6*vmax_a’ 		TD=25n 	 RISE=2 TARG V(y) val=’vmin_a+0.4*vmax_a’ 	FALL=2

//50%
.meas tran tfall_50% trig v(a) val='0.5*vdd' rise=1 targ v(y) val='0.5*vdd' fall=1
.meas tran trise_50% trig v(a) val='0.5*vdd' fall=2 targ v(y) val='0.5*vdd' rise=2


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////WRONG/////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//10% to 90%
.meas tran tfall_10%_to_90% trig v(a) val='0.1*vdd' rise=1 targ v(y) val='0.9*vdd' fall=1
.meas tran trise_10%_to_90% trig v(a) val='0.1*vdd' fall=2 targ v(y) val='0.9*vdd' rise=2
//20% to 80%
.meas tran tfall_20%_to_80% trig v(a) val='0.2*vdd' rise=1 targ v(y) val='0.8*vdd' fall=1
.meas tran trise_20%_to_80% trig v(a) val='0.2*vdd' fall=2 targ v(y) val='0.8*vdd' rise=2
//30% to 70%
.meas tran tfall_30%_to_70% trig v(a) val='0.3*vdd' rise=1 targ v(y) val='0.7*vdd' fall=1
.meas tran trise_30%_to_70% trig v(a) val='0.3*vdd' fall=2 targ v(y) val='0.7*vdd' rise=2
//40% to 60%
.meas tran tfall_40%_to_60% trig v(a) val='0.4*vdd' rise=1 targ v(y) val='0.6*vdd' fall=1
.meas tran trise_40%_to_60% trig v(a) val='0.4*vdd' fall=2 targ v(y) val='0.6*vdd' rise=2
//50%
.meas tran tfall_50%		 trig v(a) val='0.5*vdd' rise=1 targ v(y) val='0.5*vdd' fall=1
.meas tran trise_50%		 trig v(a) val='0.5*vdd' fall=2 targ v(y) val='0.5*vdd' rise=2
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////WRONG/////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
