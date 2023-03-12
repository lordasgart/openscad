// Briefkastenblende.scad

t=1.6;
h=5.0;
t2=1.67;

w=27.2;

//s=0.204;
s=0.2;

module main()
{
scale([s,s,1])
linear_extrude(height = 1, scale=1.0)
    import(file = "/home/lordasgart/Projects/openscad/svg/briefkasten.svg", center = true);
}

module both()
{
scale([1,1,h])
main();

translate([0,0,-t])
scale([1.16,1.38,t])
main();
}

difference()
{
    both();
translate([0,0,0])
color("blue")
scale([0.92,0.7,h])
main();
}

//color("blue")
//cube([w,w,w], center=true);