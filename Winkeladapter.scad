$fn=36;

//Abstand zwischen zwei Winkeln
d2=3.6;
d=d2/2;

//Länge von außen bis zum Eck
l=38.8;
b=35;

//Breite Schlitz
bs=9;
//Breite Nippel
bn=8;
//y Nippel 1 (Eck)
yn1a=1;
yn1b=6;
tn1=yn1b-yn1a;

//yh (von hinten) Nippel 2
yn2a=2;
yn2b=6.5;
tn2=yn2b-yn2a;

//cube([b,l,d2]);

//Original-Breite Nut
obn=7.5;
//Soll Nut Füller
bnf=5;
//Abstand Nut Rand
anr=3;

difference() {
cube([b,l,d]);

translate([b/2-bn/2,yn1a,0])
cube([bn,tn1,d]);
    
    
translate([b/2-bn/2,l-tn2-yn2a,0])
    cube([bn,tn2,d]);
}

//nut a tiefe (die am eck)
nay=7;
nat=13-nay;
tn=2;

module poebbel(xn) {

translate([xn,nay,d])
cube([bnf,nat,tn]);

nby=17;
nbt=25-nby;

translate([xn,nby,d])
cube([bnf,nbt,tn]);

ncy=29.5;
nct=35.5-ncy;
translate([xn,ncy,d])
cube([bnf,nct,tn]);
}

xnl=anr+(obn-bnf)/2;
xnr=b-bnf-xnl;

poebbel(xnl);
color("green")
poebbel(xnr);

bss=bs*0.9;

k=13;
j=29.5;
dw=4.5;
translate([b/2-bss/2,k,d])
color("blue")
cube([bss,j-k,dw]);

//Loch Durchmesser
ld=6;
//Panel oben 
po=23;
//Panel oben total
pot=32;

color("red")
translate([b/2,pot-po+po/2,0])
cylinder(h=d+dw, d=ld);



