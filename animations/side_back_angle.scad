include <../src/plant_shelf.scad>;

side_back_angle=-10+(sin($t*360)/2+0.5)*19;

// RENDER gif
module demo() {
    assembled();
}

assembled();
