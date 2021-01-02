include <../src/plant_shelf.scad>;

shelf_start=0+(sin($t*360)/2+0.5)*1000;

// RENDER gif
module demo() {
    assembled();
}

assembled();
