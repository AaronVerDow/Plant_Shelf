include <../src/plant_shelf.scad>;

shelf_end=height-(sin($t*360)/2+0.5)*1000;

// RENDER gif
module demo() {
    assembled();
}

assembled();
