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
        cube([width2+t*2, depth1+t*2, heighth]);
        
        phonesInHolder();
    }
}

holder();
