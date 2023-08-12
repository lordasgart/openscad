$fn=36;

db=9.5;
l=25;
df=4;
diff=1.25;

s1=7;
s2=3.5;

module fuss()
{
cube([db, l, df]);

cube([l, db, df]);

translate([db, 0, -diff])
cube([l-db, db, df]);
}
module schraube(hs)
{
    color("blue")
rotate([0,180,0])
cylinder(h=hs, d1=s1, d2=s2);
}

module schrauben()
{
translate([l-((l-db)/2),db/2,df])
schraube(df+diff);

translate([db/2,db/2,df])
schraube(df);

translate([db/2,l-((l-db)/2),df])
schraube(df);
}

difference()
{
    fuss();
    schrauben();
}
