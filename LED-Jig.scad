/*
    LED Jig - Panelmount, Soldering, etc
    https://github.com/GeoffMaciolek/led-jig
*/

/*  *********************
    Customizable Settings
    ********************* */

led_diameter_mm=10; // Diameter in mm

led_cols=5; // Define the grid of LEDs.
led_rows=2; // Typically 1 row?
 
// How far from the panel do you want the
// LEDs to protrude?
led_protrusion_mm = 5;

// Spacing between LEDs, as measured from
// center-center or same-edge to same-edge.
led_spacing_mm = 10; 
// Max width of jig in mm
max_width_mm = 40;


/* **************************
   End Settings, Begin Script
   ************************** */
 
module led(){
    translate([0,0,(led_diameter_mm/2)-led_protrusion_mm]) {
        sphere(d = led_diameter_mm);
        cylinder(d = led_diameter_mm, h = led_protrusion_mm);
    }
}

led();

$fa = 1;
$fs = 0.4;
// sphere(d=led_diameter_mm);
