$fn = 256;
radius = 4;
length = 235;
width = 135;

sensorBorder = 10;
fingerprintSensorDiameter = 25.5;

upperLength = 120;

upperGap = 1;

thickness = 2;
keypadWidth=46.8;
keypadLength=57.6;

streetNumber = "38";
name = "Walser";

font = "Liberation Sans";
fontSize = 60;
//#cube([length, width, thickness]);
//#translate([0, 0, 2])cube([length/2, width, thickness]);


module keypadSensor() {
	translate([upperLength - keypadLength + radius*2 - sensorBorder, width - keypadWidth - sensorBorder - 10, -5])
	color("green") hull() {
		// top left
		translate([radius, radius, 0])
		cylinder(r=radius, h=20);

		// top right
		translate([radius, keypadWidth - radius, 0])
		cylinder(r=radius, h=20);


		// bottom left
		translate([keypadLength - radius, radius, 0])
		cylinder(r=radius, h=20);

		// bottom right
		translate([keypadLength - radius, keypadWidth - radius, 0])
		cylinder(r=radius, h=20);
	}
}

module fingerprintSensor() {

	//translate([length/5, width/2, -5])
	translate([fingerprintSensorDiameter/2 + sensorBorder + 2 + 10, width - sensorBorder - keypadWidth/2 - 10, -5])
	
	color("purple") cylinder(d=fingerprintSensorDiameter, h=20);
}

module bellSensor() {
	translate([upperLength/2 + radius, (width - radius - sensorBorder - keypadWidth) / 2, -5])
	color("purple") cylinder(d=7, h=20);
}


module number() {

	translate([length - 20, width - 15, -5])
	linear_extrude(height = 40)
	rotate([0, 0, -90])text(text = streetNumber, font = font, size = fontSize, valign = "top", halign = "left");

}

module screwHole(height = 2, thickness = 2) {
	screwHole = thickness + 0.4;
	threadHole = thickness + 0.5;
	translate([screwHole/2, screwHole/2, height]) {
		cylinder(d=threadHole, h=height);
		translate([0, 0, -height*2])
		cylinder(d=screwHole, h=height*2);
	}
}

module cableBox() {
	translate([15, 20, -40]) {
		// box
		difference() {
			cube([128, 100, 40]);
			translate([2, 2, -1])
			cube([124, 96, 56]);
		}

		// lid
		//difference() {
		//	translate([2, 2, 0])
		//	cube([124, 96, 2]);
//
		//	// bottom left screw hole
		//	translate([20,0, 0]) {
		//		translate([4, 4, 0])
		//		screwHole(8);
		//	}
//
		//	// bottom right screw hole
		//	translate([20, 100 - 10, 0]) {
		//		translate([4, 4, 0])
		//		screwHole(8);
		//	}
//
//
		//	// top left screw hole
		//	translate([108 - 10, 0, 0]) {
		//		translate([4, 4, 0])
		//		screwHole(8);
		//	}
//
		//	// top right screw hole
		//	translate([108 - 10, 100 - 10, 0]) {
		//		translate([4, 4, -8.2])
		//		screwHole(8);
		//	}
//
		//}

		// box laces
		translate([0, 0, 36]) {

			// bottom left
			translate([2, 2, 0])
			difference() {
				cube([10, 10, 4]);
				translate([4, 4, 0])
				screwHole(4);
			}
			
			// bottom right
			translate([2, 100 - 12, 0])
			difference() {
				cube([10, 10, 4]);
				translate([4, 4, 0])
				screwHole(4);
			}

			// top left
			translate([128 - 12, 2, 0])
			difference() {
				cube([10, 10, 4]);
				translate([4, 4, 0])
				screwHole(4);
			}
			// top right
			translate([128 - 12, 100 - 12, 0])
			difference() {
				cube([10, 10, 4]);
				translate([4, 4, 0])
				screwHole(4);
			}
		}

		// lid laces
		translate([0, 0, 2]) {
			// bottom left
			translate([20,0, 0]) {
				difference() {
				
					hull() {
						cube([10, 10, 4]);
						translate([0, 0, 20])
						cube([10, 1, 4]);
					}

					translate([4, 4, -8.2])
					screwHole(8);
				}


			}
			// bottom right
			translate([20, 100 - 10, 0]) {
				difference() {
				
					hull() {
						cube([10, 10, 4]);
						translate([0, 9, 20])
						cube([10, 1, 4]);
					}

					translate([4, 4, -8.2])
					screwHole(8);
				}

			}

			// top left
			translate([108 - 10, 0, 0]) {
				difference() {
				
					hull() {
						cube([10, 10, 4]);
						translate([0, 0, 20])
						cube([10, 1, 4]);
					}

					translate([4, 4, -8.2])
					screwHole(8);
				}

			}

			// top right
			translate([108 - 10, 100 - 10, 0]) {
				difference() {
				
					hull() {
						cube([10, 10, 4]);
						translate([0, 9, 20])
						cube([10, 1, 4]);
					}

					translate([4, 4, -8.2])
					screwHole(8);
				}
			}

		}


	}


}





module plates() {

	// lower plate
	color("green") hull() {
		// top left
		translate([radius, radius, 0])
		cylinder(r=radius, h=thickness);

		// top right
		translate([radius, width - radius, 0])
		cylinder(r=radius, h=thickness);


		// bottom left
		translate([length - radius, radius, 0])
		cylinder(r=radius, h=thickness);

		// bottom right
		translate([length - radius, width - radius, 0])
		cylinder(r=radius, h=thickness);
	}


	// upper bottom plate
	color("blue") translate([0, 0, thickness])
	hull() {
		// top left
		translate([radius, radius, 0])
		cylinder(r=radius, h=thickness);

		// top right
		translate([radius, width - radius, 0])
		cylinder(r=radius, h=thickness);


		// bottom left
		translate([upperLength, 0, 0])
		cube([8, 8, 2]);
		//#cylinder(r=radius, h=thickness);

		// bottom right
		translate([upperLength, width - radius * 2, 0])
		cube([8, 8, 2]);
		//cylinder(r=radius, h=thickness);
	}



	// upper top plate
	
	difference() {
		color("red") translate([upperLength + upperGap + radius*2, 0, thickness])
		hull() {

			// bottom left
			translate([0, 0, 0])
			cube([8, 8, 2]);
			//#cylinder(r=radius, h=thickness);

			// bottom right
			translate([0, width - radius * 2, 0])
			cube([8, 8, 2]);




			// bottom left
			translate([length - radius - upperLength - upperGap - radius*2, radius, 0])
			cylinder(r=radius, h=thickness);

			// bottom right
			translate([length - radius - upperLength - upperGap - radius*2, width - radius, 0])
			cylinder(r=radius, h=thickness);

		}
 		number();
 	}
 	color("red") translate([150, 49, 2])
 	cube([70, 5, 2]);

}

difference() {
	plates();
	keypadSensor();
	fingerprintSensor();
	bellSensor();
}

cableBox();