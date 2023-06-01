# LED-Jig

## Overview

The LED Jig is a 3d printable "jig" to hold LEDs in place or against a panel,
to help ensure the LEDs are installed / soldered with a consistent depth.

## Details

### Settings

| Name | Default | Description                                 | Notes        |
|------|---------|---------------------------------------------|--------------|
| **Component Specs** ||||
| `led_diameter_mm` | 3 | LED diameter (mm) ||
| **Layout** ||||
|`led_cols`|3|Num. of LEDs in column / "across"||
|`led_rows`|1|Num. of LED rows (Often 1)||
|`led_spacing_mm`|10.16|Spacing between LEDs (mm), measured center-center or same-edge to same-edge. 10.16mm=0.400"||
|`led_protrusion_mm`|1.5| How far from the panel the LEDs should protrude (Suggestion: 1/2 of led_diameter_mm)||
| **Jig Size** ||||
|`jig_thickness_mm`|3||How thick is the jig/platform?| Stepping 0.1|
|`automatic_border_size`| false | Automatically pick the jig's outer border size||
|`jig_outer_border_mm`| 5.0 | Jig's outer border/edge size (Ignored if automatic_border_size is used)| Stepping 0.1 |

## Status

This should work just fine directly in OpenSCAD! It has not yet been tested on
Thingiverse - some customization is still needed.

## TODO

- Add appropriate metadata for Thingiverse customizer
- Take screenshots
- Improve documentation
  - Better explanation of purpose
  - Photos or videos of use
- Add functionality
  - Legs?

