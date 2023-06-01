/*
    LED Jig - Panelmount, Soldering, etc
    https://github.com/GeoffMaciolek/led-jig
*/

/*  *********************
    Customizable Settings
    ********************* */

/* [Component Specs] */

// LED diameter (mm)
led_diameter_mm=3; // 0.1

/* [Layout] */

// Num. of LEDs in column / "across"
led_cols=3;

// Num. of LED rows (Often 1)
led_rows=1;

// Spacing between LEDs (mm), measured center-center or same-edge to same-edge. 10.16mm=0.400"
led_spacing_mm = 10.16; 

// How far from the panel the LEDs should protrude (Suggestion: 1/2 of led_diameter_mm)
led_protrusion_mm = 1.5;


/* [Jig Size] */

// How thick is the jig/platform?
jig_thickness_mm = 3; // 0.1

// Automatically pick the jig's outer border size
automatic_border_size = false;

// Jig's outer border/edge size (Ignored if automatic_border_size is used)
jig_outer_border_mm = 5.0; // 0.1


/* **************************
   End Settings, Begin Script
   ************************** */

module led(){  // Simple LED - (Hemi)sphere on the end of a column
    translate([0,0,(led_diameter_mm/2)-led_protrusion_mm]) {
        union() {
            sphere(d = led_diameter_mm);
            cylinder(d = led_diameter_mm, h = led_protrusion_mm);
}   }   }

module led_strip() {
    // Set y_count to `led_rows` if valid, else 1
    y_count = (led_rows > 0) ? led_rows:1;
    x_count = (led_cols > 0) ? led_cols:1;
    for (y_index=[0:1:y_count - 1]){        
        for (x_index=[0:1:x_count - 1]){
            translate([x_index * led_spacing_mm, y_index * led_spacing_mm, 0])
                led();
}   }   }   

module support_platform() {
    // Platform size based on LED spacing, plus one (as a guess)
    edge_offset = (automatic_border_size) ? (led_spacing_mm * 0.5):(jig_outer_border_mm + led_diameter_mm / 2);
    size_x = (led_spacing_mm * (led_cols - 1))+ (edge_offset * 2);
    size_y = (led_spacing_mm * (led_rows - 1)) + (edge_offset * 2);
    
    /* Move it flush with the 'surface' via -jig_thickness, and
    offset it by the edge offset (+/-?) */
    translate([-edge_offset, -edge_offset, -jig_thickness_mm])
        cube([size_x, size_y, jig_thickness_mm]);
}

// Make the thing - the "LED Strip" carved (difference) from the platform
difference() {
    support_platform(); 
        led_strip();
}

$fa = 1; $fs = 0.2;
