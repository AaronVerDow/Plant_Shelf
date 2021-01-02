include <../src/plant_shelf.scad>;

side_gap=100+(sin($t*360)/2+0.5)*800;

// RENDER gif 
module demo() {
    assembled();
}

assembled();
