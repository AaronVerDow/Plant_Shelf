# Instructions for new users

* Download the scad files and keep them in the same directory.  
  * joints.scad is a library that creates the pins for connecting parts
  * plant_shelf.scad contains the meat of the code
  * assembled.scad shows a 3D view of the assemlbed box
  * cutsheet.scad files are for generating the 2D output for actually cutting
* Open assembled.scad and optionally cutsheet.scad in OpenSCAD
* Make sure Design -> Automatic Reload and Compile is checked
* Edit plant_shelf.scad in a text editor.  After saving changes the OpenSCAD windows should update. 
* Play with the numbers to create the box you want.  A visual representation of what the different variables do is shown below.
* Once complete render the 2D files by pressing F6
* File -> Export DXF or SVG
* The cutsheets aren't smart enough to scale for all box sizes.  Some options to fix this:
  * Edit functions.scad
  * Try to drag the drawings in your CAM program.  Some will support this.
  * Open the DXF or SVG in Inkscape
  * Post a copy of variables.scad on the Maslow forums.  I *might* be able to post a fixed cutsheet module.  

# Variables

Below is a visual representation of changing some of the variables.

## height_demo
![](https://raw.githubusercontent.com/AaronVerDow/Plant_Shelf/master/animations/output/height_demo.gif)
## shelf_x_demo
![](https://raw.githubusercontent.com/AaronVerDow/Plant_Shelf/master/animations/output/shelf_x_demo.gif)
## shelf_y_demo
![](https://raw.githubusercontent.com/AaronVerDow/Plant_Shelf/master/animations/output/shelf_y_demo.gif)
## side_gap_demo
![](https://raw.githubusercontent.com/AaronVerDow/Plant_Shelf/master/animations/output/side_gap_demo.gif)
## shelf_offset_demo
![](https://raw.githubusercontent.com/AaronVerDow/Plant_Shelf/master/animations/output/shelf_offset_demo.gif)
## side_angle_demo
![](https://raw.githubusercontent.com/AaronVerDow/Plant_Shelf/master/animations/output/side_angle_demo.gif)
## side_back_angle_demo
![](https://raw.githubusercontent.com/AaronVerDow/Plant_Shelf/master/animations/output/side_back_angle_demo.gif)
## side_wall_demo
![](https://raw.githubusercontent.com/AaronVerDow/Plant_Shelf/master/animations/output/side_wall_demo.gif)
## wood_demo
![](https://raw.githubusercontent.com/AaronVerDow/Plant_Shelf/master/animations/output/wood_demo.gif)
## shelves_demo
![](https://raw.githubusercontent.com/AaronVerDow/Plant_Shelf/master/animations/output/shelves_demo.gif)
## shelf_start_demo
![](https://raw.githubusercontent.com/AaronVerDow/Plant_Shelf/master/animations/output/shelf_start_demo.gif)
## shelf_end_demo
![](https://raw.githubusercontent.com/AaronVerDow/Plant_Shelf/master/animations/output/shelf_end_demo.gif)
