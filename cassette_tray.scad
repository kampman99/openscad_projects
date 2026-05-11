include <BOSL2/std.scad>;

// Tray should be max length 260mm to fit in BCW cardboard storage box.
// 3d printer bed is 220x220mm so have to print two smaller parts.
// Width in BCW box is 109mm.

cassette_w = 106;
cassette_d = 13.4;
wall_thickness = 1;
number_of_slots = 9;
wall_height = 30;
spaces = 30;
space_spacing = cassette_w / spaces;

total_length = wall_thickness + number_of_slots * (wall_thickness + cassette_d);
echo(total_length * 2);

// floor
cube([cassette_w + wall_thickness * 2, number_of_slots * (cassette_d + wall_thickness) + wall_thickness, wall_thickness]);

// west wall
color_this("blue")
translate([0, 0, wall_thickness]) {
    cube([wall_thickness, number_of_slots * (cassette_d + wall_thickness) + wall_thickness, wall_height]);
}

// east wall
color_this("blue")
translate([wall_thickness + cassette_w, 0, wall_thickness]) {
    cube([wall_thickness, number_of_slots * (cassette_d + wall_thickness) + wall_thickness, wall_height]);
}

color_this("red")
for (slot_num = [0:number_of_slots - 1]) {

    // wall
    translate([wall_thickness, slot_num * (wall_thickness + cassette_d), wall_thickness]) {
        difference() {
            cube([cassette_w, wall_thickness, wall_height]);
            
            for (space_num = [0:spaces - 1]) {
                translate([space_spacing * space_num + space_spacing / 4, -.5, wall_height * .1]) {
                    cube([space_spacing / 2,wall_thickness + 1,wall_height * .8]);
                }
            }
        }
    }



}

// north wall
color_this("green")
translate([wall_thickness, number_of_slots * (cassette_d + wall_thickness), wall_thickness]) {
    difference() {
        cube([cassette_w, wall_thickness, wall_height]);
        for (space_num = [0:spaces - 1]) {
            translate([space_spacing * space_num + space_spacing / 4, -.5, wall_height * .1]) {
                cube([space_spacing / 2,wall_thickness + 1,wall_height * .8]);
            }
        }
    }
}
    