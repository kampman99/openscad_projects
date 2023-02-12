mount_wing_x = 16;
mount_wing_y = 48;
screw_hole_r = 2;

front_rear_wall_x = 50;
front_rear_wall_y = 3;
front_wall_z = 20;
rear_wall_z = 12;

side_wall_x = 3;
side_wall_y = 50;
side_wall_z = 25;

base_z = 3;

// Main base is the footprint of the PHA40 + the thickness of the vertical walls.
main_base_x = 104 + side_wall_x * 2;
main_base_y = 58 + front_rear_wall_y * 2;

// Colors used for display in OpenSCAD for development.
red = [1, 0, 0];
green = [0, 1, 0];
blue = [0, 0, 1];