# gp_recons

This software reconstructs the wave associated to coincidences observed between antenna triggers, where a coincidence between two antennas is defined as a time interval between triggers shorter than the time it would take for an elecromagnetic wave to cover the distance between them. Two different hypothesis are considered: a plane wavefront and a spherical one (point source).
This program, written in C,   is an adaptation of the code developped by V. Niess for the TREND reconstruction, and is based on the [PORT subroutine library](http://www.netlib.org/port/) fiting tools.

## Input files: 
### RRunId_coinctable.txt
Format = UnixSec; UnitId; EvtNb; CoincNb; TiggerTime; 

with one line per trigger, EvtNb being the trigger ID on that specific unit, and TriggerTime being given in ns wrt first unit triggered in the coincidence. This file is produced through the build_coins() method of [readData.py](https://github.com/TREND50/gp_ana/blob/master/readData.py). The code will search for it in the ```$P35_TXT_PATH``` directory, or if this variable is not defined in your system, in the ```gp_recons``` directory.

### [positions_GP35.txt](https://github.com/TREND50/gp_recons/blob/master/positions_GP35.txt)
Format: UnitID; x; y; z 

x is measured from Eastwards, y Northwards. z is altitude asl. 
Note that ALL units have to be given in file, in incremental order! The code will search for this file in the ```$P35_TXT_PATH``` directory, or if this variable is not defined in your system, in the ```gp_recons``` directory.

## Output files: 

#### RRunId_sphrecons.txt
Format: CoincId; UnixSec; Mult; x; y; z; t0; Chi2; Significance

One line per reconstructed coincidence. x is the West-East coordinate of the reconstructed point source, y its North-South coordinate and z its altitude, ts the time of emission (wrt the first antenna trigger hence ts<0). At this stage, Chi2 and significance are not reliable. The code will write this file in the ```$P35_TXT_PATH``` directory, or if this variable is not defined in your system, in the ```gp_recons``` directory.

### RRunId_planerecons.txt
Format: CoincId; UnixSec; Mult; Theta; Theta_err; Phi; Phi_err; Chi2; Significance

One line per reconstructed coincidence. Angles are given in degrees. Theta = 0° is zenith, 90° is horizon. Phi conventions still to be checked :-).  At this stage, errors, Chi2 and significance ar enot reliable. The code will write this file in the ```$P35_TXT_PATH``` directory, or if this variable is not defined in your system, in the ```gp_recons``` directory.

## Running the program
SImply launch ./recons RunId in the ```gp_recons``` directory.
