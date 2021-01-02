include <../src/plant_shelf.scad>;

shelves=floor(2+(sin($t*360)/2+0.5)*6);

// RENDER gif
module demo() {
    assembled();
}

assembled();
