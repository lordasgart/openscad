// Fold 4
$fn = 36;

t=2.97;

width1=66;
width2=132;

//depth1=17.4; //with Camera
depth1=16.5; //without
depth2=7.5;

heightp=155;
heighth=90;

//holder
widthh = width2+t*2;
depthh = depth1+t*2;

module foldWithoutCameraClosed() {
    color("#AAAAAA")
    cube([width1, depth1, heightp]);
}

module foldWithoutCameraOpened() {
    color("#888888")
    cube([width2, depth2, heightp]);
}

module bothPhones() {
    
    foldWithoutCameraClosed();
    
    translate([0,depth1-depth2,0])
    foldWithoutCameraOpened();
}

module phonesInHolder() {
    translate([t,t,t])
    bothPhones();
}

module holder() {
    difference() {
        cube([widthh, depthh, heighth]);
        
        phonesInHolder();
    }
}

//holder();

//Set front deeper to be able to reach the hole(s!)

module frontcutbox() {
    translate([t,0,t+heighth/2])
    cube([width2, depth1, heightp]);
}

module holderWithDeeperFront() {
    difference() {
        holder();
        frontcutbox();
    }
}

holderWithDeeperFront();

//Hole(s!)

module hole() {
    color("#FF0000")
    rotate([270,0,0])
    cylinder(t,t*2,t);
}

translate([widthh * 0.25,depthh-t,heighth*0.75])
hole();

translate([widthh * 0.75,depthh-t,heighth*0.75])
hole();

//Less to print

//USB
