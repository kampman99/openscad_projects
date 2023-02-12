include <pyle_pha40_constants.scad>;

// High resolution cylinders
$fs = .01;

// main base
color(green)
    cube([main_base_x, main_base_y, base_z], true);

// left mounting wing
translate([(-main_base_x/2 + -mount_wing_x/2),
    (main_base_y/2 - mount_wing_y/2 - ((main_base_y - mount_wing_y) /2)),
    0]) {
    color(red)
        difference() {
        cube([mount_wing_x, mount_wing_y, base_z], true, .6, "zmax");
        translate([0, 0, -base_z/2-.1])
            cylinder(base_z + .2, r = screw_hole_r, true);
        }
    }   

// right mounting wing
translate([(main_base_x/2 + mount_wing_x/2),
    (main_base_y/2 - mount_wing_y/2 - ((main_base_y - mount_wing_y) /2)),
    0]) {
    color(blue)
        difference() {
        cube([mount_wing_x, mount_wing_y, base_z], true, .6, "x");
        translate([0, 0, -base_z/2-.1])
            cylinder(base_z + .2, r = screw_hole_r, true);
        }
    }

// front wall
translate([0, -main_base_y/2 + front_rear_wall_y / 2, front_wall_z / 2 + base_z / 2])
    cube([front_rear_wall_x, front_rear_wall_y, front_wall_z], true);

// rear wall
translate([0, main_base_y/2 - front_rear_wall_y / 2, rear_wall_z / 2 + base_z / 2])
    cube([front_rear_wall_x, front_rear_wall_y, rear_wall_z], true);

// left wall
translate([main_base_x/2 - side_wall_x / 2, 0, side_wall_z / 2 + base_z / 2])
    cube([side_wall_x, side_wall_y, side_wall_z], true);

// right wall
translate([-main_base_x/2 + side_wall_x / 2, 0, side_wall_z / 2 + base_z / 2])
    cube([side_wall_x, side_wall_y, side_wall_z], true);
