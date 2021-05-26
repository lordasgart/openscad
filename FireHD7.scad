//width
w=191;
//height
h=115;
//thickness
t=10.5;
//border lr
blr=17;
//border tb
btb=10;

//connector thickness (spax-bohrungen beachten!)
tc=2.96;
//connector breite
cb=50; //wie Holder
//höhe connector
hc=20; //wie holder
module spax()
{
    import("MiniSpax.stl", convexity=3);
}
//thickness querstrebe
tq=2.54;
//breite querstrebe
bq=36-0.3;

module firehd7()
{
    color("#282828")
    cube([w,t,h], center=true);
}

//firehd7();

module total()
{
//connector
color("#696969")
translate([0,t/2+tc/2,0])
cube([cb/2,tc,hc], center=true);

//querstrebe
translate([0,t/2+tq/2,0])
cube([bq,tq,h*1.03], center=true);

//oben
translate([0,-t*0.03/2,h*1.03/2])
cube([bq,tq+t+tq+t*0.03, tq], center=true);

shifty=6.85;
shiftz=55.5;
//oben vorne
translate([0,-shifty,shiftz])
cube([bq,tq,btb], center=true);

//unten
translate([0,-t*0.03/2,-h*1.03/2])
cube([bq,tq+t+tq+t*0.03, tq], center=true);

//unten vorne
translate([0,-shifty,-shiftz])
cube([bq,tq,btb], center=true);
}

module spaxg()
{
    translate([0,5.2,0])
    rotate([-90,0,0])
    spax();
}

difference()
{
total();

translate([-cb/8,0,-hc/4])
spaxg();

translate([cb/8,0,-hc/4])
spaxg();

translate([cb/8,0,hc/4])
spaxg();

translate([-cb/8,0,hc/4])
spaxg();
}