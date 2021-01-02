include <../src/plant_shelf.scad>;
in=25.4;

shelf_x=15*in+(sin($t*360)/2+0.5)*20*in;

// RENDER gif
module demo() {
    assembled();
}

assembled();
