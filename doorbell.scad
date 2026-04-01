$fn = 256;
radius = 4;
length = 225;
width = 125;

sensorBorder = 10;
fingerprintSensorDiameter = 25;

upperLength = 110;

upperGap = 1;

thickness = 2;
keypadWidth=46.2;
keypadLength=57;

streetNumber = "38";
name = "Walser";

font = "Liberation Sans";
fontSize = 60;
//#cube([length, width, thickness]);
//#translate([0, 0, 2])cube([length/2, width, thickness]);


module keypadSensor() {
	translate([upperLength - keypadLength + radius*2 - sensorBorder, width - keypadWidth - sensorBorder, -5])
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
	translate([fingerprintSensorDiameter/2 + sensorBorder, width - sensorBorder - keypadWidth/2, -5])
	
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



module plates() {

//	// lower plate
//	color("green") hull() {
//		// top left
//		translate([radius, radius, 0])
//		cylinder(r=radius, h=thickness);
//
//		// top right
//		translate([radius, width - radius, 0])
//		cylinder(r=radius, h=thickness);
//
//
//		// bottom left
//		translate([length - radius, radius, 0])
//		cylinder(r=radius, h=thickness);
//
//		// bottom right
//		translate([length - radius, width - radius, 0])
//		cylinder(r=radius, h=thickness);
//	}
//
//
//	// upper bottom plate
//	color("blue") translate([0, 0, thickness])
//	hull() {
//		// top left
//		translate([radius, radius, 0])
//		cylinder(r=radius, h=thickness);
//
//		// top right
//		translate([radius, width - radius, 0])
//		cylinder(r=radius, h=thickness);
//
//
//		// bottom left
//		translate([upperLength, 0, 0])
//		cube([8, 8, 2]);
//		//#cylinder(r=radius, h=thickness);
//
//		// bottom right
//		translate([upperLength, width - radius * 2, 0])
//		cube([8, 8, 2]);
//		//cylinder(r=radius, h=thickness);
//	}



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
 		//number();
 	}

}

difference() {
	plates();
	keypadSensor();
	fingerprintSensor();
	bellSensor();
}
