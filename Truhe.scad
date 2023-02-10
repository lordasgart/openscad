//Enter OpenSCAD code here.
echo("Version:",version());

t=3.8;

w=240;

//front height
fh=52;
th=40;

//griff tiefe
gt=52;
gh=gt/3;

//hoehe griff
hg=fh-gh+t;

//griffversatz nach innen
gv=gh;
module truhe()
{
cube([w,t,fh]);

translate([0,0,fh])
cube([w,th,t]);

translate([gv,-gt,hg])
cube([gh,gt,gh]);

translate([w-gh-gv,-gt,hg])
cube([gh,gt,gh]);

translate([0,-gt-gh,hg])
cube([w,gh,gh]);
}

difference()
{
truhe();
//translate([w/2,-w/2,0])
translate([-w/2,-w/2,0])
cube([w,w,w]);
}