# LED-Panel-Alignment-Soldering-Jig

## Overview

The LED Panel Alignment Soldering Jig is a 3D-Printable "jig" to hold LEDs in
place or against a panel, to help ensure the LEDs are installed / soldered with
a consistent depth.

## Details

When assembling certain DIY projects (especially
[Eurorack](https://en.wikipedia.org/wiki/Eurorack) modular synthesizer
projects), or performing certain repairs, one often needs to align one or more
LEDs - often a row or grid - to a panel. Getting this spacing consistent can be
tricky; this jig is designed to be placed up against the panel (held with a
spacer, or tape), allowing the LEDs to nestle into it, at the exact depth
specified!

See also the
[Thingiverse Customizable object](https://www.thingiverse.com/thing:6056979)

### Screenshots

OpenSCAD preview image, showing the customizer settiings.
![OpenSCAD Screenshot showing customizer settings](images/jed-jig-openscad-poly-and-settings.png?raw=True)

Here, we have increased `led_protrusion_mm` in a wireframe view to illustrate
how these jigs work.
![Screenshot showing "deeper" LEDs (for LEDs spaced far from the panel)](images/jed-jig-openscad-wireframe-deeper.png?raw=True)

### Settings

| Name | Default | Description                                 | Notes        |
|------|---------|---------------------------------------------|--------------|
| **Component Specs** ||||
| `led_diameter_mm` | 3 | LED diameter (mm) ||
| **Layout** ||||
|`led_cols`|3|Num. of LEDs in column / "across"||
|`led_rows`|1|Num. of LED rows (Often 1)||
|`led_spacing_mm`|10.16|Spacing between LEDs (mm), measured center-center or same-edge to same-edge. 10.16mm=0.400"| See [LED Spacings](#led-spacings)|
|`led_protrusion_mm`|1.5| How far from the panel the LEDs should protrude (Suggestion: 1/2 of led_diameter_mm)||
| **Jig Size** ||||
|`jig_thickness_mm`|3||How thick is the jig/platform?| Stepping 0.1|
|`automatic_border_size`| false | Automatically pick the jig's outer border size||
|`jig_outer_border_mm`| 5.0 | Jig's outer border/edge size (Ignored if automatic_border_size is used)| Stepping 0.1 |

### LED Spacings

These are some LED spacings I have used. Please submit spacings you encounter!

| Inches | mm    | Examples                   | Notes                           |
|--------|-------|----------------------------|---------------------------------|
| 0.400" | 10.16 | [Tesseract Modular Sweet Sixteen Faderbank](https://www.tesseractmodular.com/eurorack-modules/sweet-sixteen-mkii) ||
| 0.500" | 12.7 | [Westlicht PER\|FORMER Sequencer](https://westlicht.github.io/performer/) | aka Westlicht Performer|

## Status

This should work fine in OpenSCAD! It has only been partially tested on
Thingiverse.

## TODO

- Improve documentation
  - Better explanation of purpose
  - Photos or videos of use
- Add functionality
  - Legs for "taller" jigs?

## Links

- [Official / Original Github reposistory](https://github.com/GeoMaciolek/led-panel-alignment-soldering-jig)
- [Thingiverse Customizable object](https://www.thingiverse.com/thing:6056979)
