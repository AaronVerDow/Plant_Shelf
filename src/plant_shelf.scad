use <joints.scad>;
in=25.4;
pad=0.1;

shelf_x=800;
shelf_y=180;

wood=in/2;

shelf_wood=wood;

side_wood=wood;

side_gap=400;

side_angle=5;
side_back_angle=side_angle/3;
height=2000;
side_wall=60;

back_wood=wood;

shelf_overhang=side_wall/2;
side_min=shelf_y-shelf_overhang+back_wood;

shelves=5;
shelf_wall=side_wall*2;

brace=side_wall;
bit=in/4;

ear=bit;
ear_extra=0;

shelf_slot=shelf_y/3;


shelf_start=120;
shelf_end=height-side_wall;
shelf_spacing=(shelf_end-shelf_start)/(shelves-1);
echo(shelf_spacing=shelf_spacing);

side_base=side_min+y(height);

inner_side_round=15;
shelf_round=inner_side_round;
brace_wood=wood;

echo(side_base=side_base);

plywood_x=12*8*in;
plywood_y=12*4*in;

bit=in/4;

cutgap=bit*3;

back_pins=4;
pintail_gap=in/16;
pintail_hole=bit*1.1;

module shelf() {
    difference() {
        round_corners(shelf_round)
        square([shelf_x,shelf_y],center=true);

        dirror_x()
        translate([side_gap/2-side_wood/2,shelf_y*1.5-shelf_slot])
        dirror_x(side_wood)
        mirror([0,1])
        negative_slot(shelf_y,side_wood,ear,ear_extra);
    }
}

function y(z)=tan(side_angle)*z;
function back_y(z)=tan(side_back_angle)*z;
function back_z(z)=z/cos(side_back_angle);

module shelf_3d(z) {
    translate([0,y(z)+shelf_y/2-shelf_overhang,z-shelf_wood/2])
    linear_extrude(height=shelf_wood)
    shelf();
}

function fibonacci(nth) = 
    nth == 0 || nth == 1 ? nth : (
        fibonacci(nth - 1) + fibonacci(nth - 2)
    );

function fibsum(nth,count=0) =
    nth == 0 ? count : fibsum(nth-1, count+fibonacci(nth));

function count(nth,count=0) =
    nth == 0 ? count : count(nth-1, count+nth);

echo(fibsum=count(3));

fib_offset=8;
shelf_offset=100;
total=shelf_end-shelf_start-shelf_offset*count(shelves-1);
shelf_gap=total/(shelves-1);

module shelves() {
    for(n=[0:1:shelves-1]) {
        z=shelf_end-shelf_gap*n-shelf_offset*count(n);
        echo(z=z-shelf_start);
        shelf_3d(z);
    }

}

module side_body() {
    hull() {
        translate([0,height-0.01])
        square([side_min,0.01]);
        translate([back_y(height),0])
        square([side_min+y(height)-back_y(height),0.01]);
    }
    
}


module round_corners(r) {
    offset(r)
    offset(-r)
    children();
}

module side_negative() {
    round_corners(inner_side_round)
    difference() {
        offset(-side_wall)
        side_body();
        for(n=[0:1:shelves-1])
        translate([0,shelf_end-shelf_gap*n-shelf_offset*count(n)-shelf_wall/2])
        square([side_base,shelf_wall]);
    }
    for(n=[0:1:shelves-1]) {
        z=shelf_end-shelf_gap*n-shelf_offset*count(n);
        translate([shelf_y+shelf_slot+y(height)-y(z),z-shelf_wood/2])
        mirror([1,0])
        dirror_y(shelf_wood)
        negative_slot(shelf_wood,shelf_y,ear,ear_extra);
    }
    translate([0,back_z(height)])
    rotate([0,0,side_back_angle])
    translate([-pad,-back_z(height)])
    negative_pins(back_z(height),side_wood+pad,back_pins,pintail_gap,bit,ear,ear_extra);
}

//brace_h=shelf_spacing*(shelves-1);
brace_h=height+brace*2;

module crossbrace() {
    translate([0,height/2-brace_h/2])
    intersection() {
        hull() {
            translate([-side_gap/2,brace/2])
            circle(d=brace);

            translate([side_gap/2,brace_h-brace/2])
            circle(d=brace);
        }
        translate([-side_gap/2-side_wood/2,0])
        square([side_gap+side_wood,brace_h]);
    }
}

module crossbraces() {
    dirror_x()
    translate([0,side_base])
    rotate([90,0,0])
    linear_extrude(height=brace_wood)
    crossbrace();
}

module brace() {
    square([side_gap+side_wood,shelf_wall],center=true);
}


module braces() {
    for(z=[shelf_start:shelf_spacing:shelf_end])
    translate([0,side_base,z])
    rotate([90,0])
    linear_extrude(height=brace_wood)
    brace();
}

module back_negative() {
    round_corners(inner_side_round)
    difference() {
        offset(-brace)
        back_body();
        //translate([0,-height/2])
        //crossbrace();
        //for(z=[shelf_start:shelf_spacing:shelf_end]) translate([0,back_z(-height/2+z)]) brace();
        translate([0,back_z(-height/2+shelf_start)])
        brace();
        translate([0,back_z(-height/2+shelf_end)])
        brace();

    }

    dirror_x()
    translate([-side_gap/2-side_wood/2-pad,-back_z(height)/2])
    negative_tails(back_z(height),side_wood+pad,back_pins,pintail_gap,bit,ear,ear_extra);
}

module back_body() {
    square([side_gap+side_wood,back_z(height)],center=true);
}

module back() {
    difference() {
        back_body();
        back_negative();
    }
}

module side() {
    difference() {
        side_body();
        side_negative();
    }
}

module dirror_y(y=0) {
    children();
    translate([0,y])
    mirror([0,1])
    children();
}


module dirror_x(x=0) {
    children();
    translate([x,0])
    mirror([1,0])
    children();
}

module assembled() {

    color("red")
    shelves();

    color("blue")
    dirror_x()
    translate([side_gap/2,y(height)+side_min,0])
    rotate([90,0,-90])
    translate([0,0,-side_wood/2])
    linear_extrude(height=side_wood)
    side();

    color("lime")
    translate([0,side_base,height])
    rotate([-side_back_angle,0])
    translate([0,0,back_z(-height/2)])
    rotate([90,0])
    linear_extrude(height=brace_wood)
    back();
}

module shelf_cutsheet() {
    //translate([0,0,-1]) #square([plywood_x,plywood_y]);

    translate([plywood_x/2,plywood_y-side_gap/2])
    rotate([0,0,90])
    back();

    translate([plywood_x/2,plywood_y-side_gap-cutgap*1.5-shelf_y])
    dirror_y()
    dirror_x()
    translate([shelf_x/2+cutgap/2,-shelf_y/2-cutgap/2])
    shelf();
}


module dirror() {
    children();
    mirror([1,0])
    mirror([0,1])
    children();
}

// RENDER svg
module side_cutsheet() {
    //translate([0,0,-1]) #square([plywood_x,plywood_y]);

    translate([height/2,plywood_y/2-60])
    dirror()
    translate([0,-side_min/2-cutgap])
    rotate([0,0,90-side_back_angle])
    translate([-side_base/2,-height/2])
    side();

    translate([height/2,plywood_y-side_gap/2]) rotate([0,0,90]) back();

    translate([shelf_x+cutgap*1.5+back_z(shelf_start),plywood_y-side_gap/2])
    dirror_x()
    translate([cutgap/2+shelf_x/2,0])
    shelf();

    translate([100+shelf_x+cutgap*1.5+back_z(shelf_start),shelf_y/2+100])
    dirror_x()
    translate([cutgap/2+shelf_x/2,0])
    shelf();

    translate([back_z(height)+shelf_y/2+cutgap,plywood_y/2])
    rotate([0,0,90])
    shelf();
}

//side_cutsheet();

//side();
//shelf();
//back();
//assembled();
