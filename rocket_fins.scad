// Rocket Fin Maker

// Fins
$finNumber = 5;
$finThickness = 2;
$finHeight = 70;
$finWidth = 45;
$finCornerRadius = 1; // Has to be > 0
$finOffsetFromBottom = 0;
$finAngle = 10; // Workable max fin angle is dictated by fin length

// Body cylinder
// This is defined by inner cylinder, so if the rocket is 40mm then this needs to be something like 40.2mm
$cylinderDiameter = 40.2;
$cylinderHeight = 80; //
$wallThickness = 1;

// *******************************************************************

// Leave these variables alone!
$fn=100;
$finOffsetForAngle = $finAngle*0.05; // This tries to keep the top of the fins in the cylinder, betterer maths would work betterer. Something something exponential or log probabbly.
$finInsertDepth = abs($finAngle) * 0.25;
$cylinderOuterRadius = $cylinderDiameter/2 + $wallThickness;
$incrementDegrees = 360/$finNumber;
$cylinderRadius = $cylinderDiameter/2;
$caclulatedFinWidth = $finWidth + $finInsertDepth;

difference() {
    // Outer Cylinder
    cylinder($cylinderHeight,$cylinderOuterRadius,$cylinderOuterRadius, true);

    // Inner Cylinder
    cylinder($cylinderHeight+1000,$cylinderRadius,$cylinderRadius, true);

}

difference() {
    for (a =[$incrementDegrees:$incrementDegrees:360]) {
        rotate([0,0,a]) {
            createFin();
        }
    }

    // Inner Cylinder
    cylinder($cylinderHeight+990,$cylinderRadius,$cylinderRadius, true);
}

module createFin() {
 rotate([90,0,0]) {
        translate([$cylinderRadius-($finCornerRadius*2)-$finInsertDepth,-(($finHeight/2)+(($cylinderHeight-$finHeight)/2)-$finOffsetForAngle-$finOffsetFromBottom),-$finThickness/2]) {
            rotate([$finAngle,0,0]) {
                right_triangle($caclulatedFinWidth,$finHeight,$finCornerRadius,$finThickness);

                }
            }
    }
}

module right_triangle(side1,side2,corner_radius,triangle_height){
  translate([corner_radius,corner_radius,0]){
    hull(){
    cylinder(r=corner_radius,h=triangle_height);
      translate([side1 - corner_radius * 2,0,0])cylinder(r=corner_radius,h=triangle_height);
          translate([0,side2 - corner_radius * 2,0])cylinder(r=corner_radius,h=triangle_height);
    }
  }

}
