include <../src/plant_shelf.scad>;

shelf_y=50+(sin($t*360)/2+0.5)*500;

// RENDER gif
module demo() {
    assembled();
}

assembled();
