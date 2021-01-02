include <../src/plant_shelf.scad>;

shelf_offset=(sin($t*360)/2+0.5)*300;

// RENDER gif
module demo() {
    assembled();
}

assembled();
