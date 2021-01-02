include <../src/plant_shelf.scad>;

wood=1+(sin($t*360)/2+0.5)*100;

// RENDER gif
module demo() {
    assembled();
}

assembled();
