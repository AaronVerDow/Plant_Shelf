include <../src/plant_shelf.scad>;

side_angle=0+(sin($t*360)/2+0.5)*30;

// RENDER gif 
module demo() {
    assembled();
}

assembled();
