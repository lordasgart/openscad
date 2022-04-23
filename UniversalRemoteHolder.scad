$fn=36;

//Remote Control

//Remote Control width
rcw=40;
//Remote Control height
rch=86;
//Remote Control thickness
rct=7.2;

//Holder

//Holder thickness
ht=2.12; //5 lines in PrusaSlicer
//Holder height
hh=rch/2;

module remote_control()
{
    color("#777777")
    cube([rcw,rct,rch]);
}

remote_control();

module holder_front_and_back()
{
    cube([rcw,ht,hh]);
}

module holder_bottom()
{
    translate([0,0,-ht])
    cube([rcw,rct,ht]);
}

module holder_left_and_right()
{
    cube([ht,rct+ht*2,hh]);
}

module holder()
{
    //bottom
    holder_bottom();
    //back
    translate([0,rct,-ht])
    holder_front_and_back();
    //left
    translate([-ht,-ht,-ht])
    holder_left_and_right();
    //right
    translate([rcw,-ht,-ht])
    holder_left_and_right();
    //front
    translate([0,-ht,-ht])
    holder_front_and_back();
}

holder();
