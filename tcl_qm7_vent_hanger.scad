pin_h = 4;
pin_l = 3;
pin_w = 1;
pins_qty = 4;
pin_spacing = 4;
plate_z = 2;
space_between_top_of_plate_and_top_of_pin = 0;

translate([0, .2, 1.3])
rotate([-15, 0, 0]) {
    // pin plate
    cube([(pins_qty - 1) * pin_spacing + 1, pin_h * 1.25, plate_z]);

    // pins
    for (i = [0:1:pins_qty - 1])
        translate([i * pin_spacing, space_between_top_of_plate_and_top_of_pin, plate_z])
            cube([pin_w, pin_h, pin_l]);

}

translate([0, pin_h * 1.25, 0])
    cube([(pins_qty -1) * pin_spacing + 1, 5, plate_z]);