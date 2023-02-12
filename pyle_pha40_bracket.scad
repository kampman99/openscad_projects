include <pyle_pha40_constants.scad>;
include <roundedcorners.scad>;

// High resolution cylinders
$fs = .01;

// main base
color(green)
    // roundedcube zmax rounds the top and vertical corners. Basically everything
    // visible from the positive Z direction. The vertical walls are sunk into the base by 1mm
    // to hide the rounding where the walls meet the base.
    roundedcube([main_base_x, main_base_y, base_z], true, .5, "zmax");

// left mounting wing
// Made the wing 1mm wider and then moved it to the right .5 to hide the rounding where
// it meets the base.
translate([(-main_base_x/2 + .5 + -mount_wing_x/2),
    (main_base_y/2 - mount_wing_y/2 - ((main_base_y - mount_wing_y) /2)),
    0]) {
    color(red)
        // Make the wing and subtract out a hole for the screw.
        difference() {
        // roundedcube zmax rounds everything visible from the positive Z direction.
        roundedcube([mount_wing_x + 1, mount_wing_y, base_z], true, .5, "zmax");
        translate([0, 0, -base_z/2-.1])
            cylinder(base_z + .2, r = screw_hole_r, true);
        }
    }   

// right mounting wing
// Made the wing 1mm wider and then moved it to the left .5 to hide the rounding where
// it meets the base.
translate([(main_base_x/2 - .5 + mount_wing_x/2),
    (main_base_y/2 - mount_wing_y/2 - ((main_base_y - mount_wing_y) /2)),
    0]) {
    color(blue)
        // Make the wing and subtract out a hole for the screw.
        difference() {
        // roundedcube zmax rounds everything visible from the positive Z direction.
        roundedcube([mount_wing_x + 1, mount_wing_y, base_z], true, .5, "zmax");
        translate([0, 0, -base_z/2-.1])
            cylinder(base_z + .2, r = screw_hole_r, true);
        }
    }

// front wall
// Added 1 to the height and dropped position .5 to hide the rounded corners where it
// meets the base.
// roundedcube ymin rounds everything visible from the negative Y direction.
translate([0, -main_base_y/2 + front_rear_wall_y / 2, front_wall_z / 2 + base_z / 2 - .5])
    roundedcube([front_rear_wall_x, front_rear_wall_y, front_wall_z + 1], true, .5, "ymin");

// rear wall
// Added 1 to the height and dropped position .5 to hide the rounded corners where it
// meets the base.
// roundedcube ymax rounds everything visible from the positive Y direction. 
translate([0, main_base_y/2 - front_rear_wall_y / 2, rear_wall_z / 2 + base_z / 2 - .5])
    roundedcube([front_rear_wall_x, front_rear_wall_y, rear_wall_z + 1], true, .5, "ymax");

// left wall
// Added 1 to the height and dropped position .5 to hide the rounded corners where it
// meets the base.
// roundedcube xmax rounds everything visible from the positive X direction.
translate([main_base_x/2 - side_wall_x / 2, 0, side_wall_z / 2 + base_z / 2 - .5])
    roundedcube([side_wall_x, side_wall_y, side_wall_z + 1], true, .5, "xmax");

// right wall
// Added 1 to the height and dropped position .5 to hide the rounded corners where it
// meets the base.
// roundedcube xmin rounds everything visible from the negative X direction.
translate([-main_base_x/2 + side_wall_x / 2, 0, side_wall_z / 2 + base_z / 2 - .5])
    roundedcube([side_wall_x, side_wall_y, side_wall_z + 1], true, .5, "xmin");
