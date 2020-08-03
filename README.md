# openscad-rocket-fins

OpenSCAD (https://www.openscad.org/) design that allows you to easily create a fin assembly for a model rocket that can be 3D printed

## Variables

### Fins
* $finNumber - the number of fins you require
* $finThickness - thickness in mm of the fins
* $finHeight - total height in mm of the fins at the point where it joins the cylindrical body
* $finWidth - total length in mm of the bottom edge of the fins;
* $finCornerRadius - how much radius you want on the corners of the fins. Only really affects 'point' of the fins and has to be greater than 0. 
* $finOffsetFromBottom - measurement in mm from bottom of cylindrical body to bottom of the fins. 
* $finAngle - adds or subtracts angle in degrees to the fins. The fins pivot from the bottom so 10 degrees would have the leading edge of the fin over 10 degrees from the bottom. There are some janky calculations that try to account for fin angle and fin length to keep the fin top attached to the surface of the body, but currently these work by moving the fins in without accounting for it so the fin length will change slightly depending on the angle. 

### Body cylinder
The cylinderDiameter is the ID (Inner Diameter) of the cylinder in mm, so if the rocket you are using is 40mm then this needs to be something like 40.2 mm to slide over it.
* $cylinderDiameter - ID (Inner Diameter) of the cylinder in mm
* $cylinderHeight - cylinder height in mm
* $wallThickness - cylinder wall thickness in mm

### To Do
Fix the corner radius function so it understands 0 is ok and means no radius.
Put smarter calculations in for keeping tops of fins attached when you add an angle. Needs to be smarter about the distance it moves the fin and ideally add this difference back onto the length of the fin so that remains constant.
