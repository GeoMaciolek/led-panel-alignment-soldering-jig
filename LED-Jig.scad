/*
    LED Jig - Panelmount, Soldering, etc
    https://github.com/GeoffMaciolek/led-jig
*/

/*  *********************
    Customizable Settings
    ********************* */

led_diameter_mm=3; // Diameter in mm

led_cols=4; // Define the grid of LEDs.
led_rows=2; // Typically 1 row?

// How far from the panel do you want the
// LEDs to protrude?
led_protrusion_mm = 2.2;

// Spacing between LEDs, as measured from
// center-center or same-edge to same-edge.
led_spacing_mm = 10.16; // 10.16mm = 0.400"

jig_thickness_mm = 3; // How thick is the jig/platform?

// Border settings
automatic_border_size = false; // If true, ignore the following:
jig_outer_border_mm = 5; // How much space around the edge?



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
