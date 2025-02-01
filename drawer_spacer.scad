// Inside width of drawer is 15.75 inches.
// Space between tray and back of drawer is about 4-7/8 inches.
// Printer bed is 220x220 but Cura maybe doesn't allow printing all the way to the edge.

width = 400;
depth = 124;
max_width = 210;
bar_width = 10;
bar_height = 20;

// left bar
translate([0 - max_width/2, 0, 0]) {
    cube([bar_width, depth, bar_height]);
}

// right bar    
translate([0 + max_width/2 - bar_width, 0, 0]) {
    cube([bar_width, depth, bar_height]);
}

// rear bar
translate([0 - max_width/2, 0, 0]) {
    cube([max_width, bar_width, bar_height]);
}

// front bar
translate([0 - max_width/2, depth - bar_width, 0]) {
    cube([max_width, bar_width, bar_height]);
}

