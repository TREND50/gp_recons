# gp_recons
This software reconstructs the wave associated to coincidences between antenna triggers. Two different hypothesis are considered: a plane wavefront and a spherical one (point source).

Input files: 
R[RunId]coinctable.txt
Format = [UnixSec UnitId EvtNb CoincNb TiggerTime]
with one line per trigger, EvtNb being the trigger ID on that specific unit, and TriggerTime being given in ns wrt first unit triggered in the coincidence.

positions_GP35.txt
Format: [UnitID x y z] 
x is measured from Eastwards, y Northwards. z is altitude asl. 
Note that ALL units have to be given in file, in incremental order!

Output files: 
R[RunId]sphrecons.txt
Format: [CoincId UnixSec Mult x y z t0 Chi2 Significance]
One line per reconstructed coincidence. x is the West-East coordinate of the reconstructed point source, y its North-South coordinate and z its altitude, ts the time of emission (wrt the first antenna trigger hence ts<0). At this stage, Chi2 and significance are not reliable.
R[RunId]planerecons.txt
Format: [CoincId UnixSec Mult Theta Theta_err Phi Phi_err Chi2 Significance]
One line per reconstructed coincidence. Angles are given in degrees. Theta = 0° is zenith, 90° is horizon. Phi conventions still to be checked :-).  At this stage, errors, Chi2 and significance ar enot reliable.
