$fn = 256;
radius = 4;
length = 225;
width = 125;

sensorBorder = 10;
fingerprintSensorDiameter = 25;


upperLength = 100;

thickness = 2;
keypadWidth=46.2;
keypadLength=57;
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


module plates() {
	// lower plate
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


	// upper plate
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
}

difference() {
	plates();
	keypadSensor();
	fingerprintSensor();
	bellSensor();
}
