/*
    LED Jig - Panelmount, Soldering, etc
    https://github.com/GeoffMaciolek/led-jig
*/

/*  *********************
    Customizable Settings
    ********************* */

led_diameter_mm=2; // Diameter in mm

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

module led_strip() {
    // Set y_count to `led_rows` if valid, else 1
    y_count = (led_rows > 0) ? led_rows:1;
    x_count = (led_cols > 0) ? led_cols:1;
    for (y_index=[0:1:y_count]){        
        for (x_index=[0:1:x_count]){
            translate([x_index * led_spacing_mm, y_index * led_spacing_mm, 0])
                led();
        }
    }
}

// led();
led_strip();

$fa = 1;
$fs = 0.4;
// sphere(d=led_diameter_mm);
