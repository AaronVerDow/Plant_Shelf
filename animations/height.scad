include <../src/plant_shelf.scad>;

height=200+(sin($t*360)/2+0.5)*3000;

// RENDER gif
module demo() {
    assembled();
}

assembled();
