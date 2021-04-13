//Spaltmaß, max. Spalt 3.5 mm
b=3.2;
//Höhe Messlatte
h=95.25-5-b;//80.25 (Schiebler) 95.25 Schiebler aber das hintere Teil => passt genau auf Unterkante (sind auch 5mm wie die Schieblerdifferenz) => 5mm niedriger, und da wir dann Oberkante brauchen -b noch

//Abstand nach hinten bis Gewindestange, mind. 16 nach hinten
t=16; //war 5 im Orig, aber einfach weil wir Symetrie lieben b*2

cube([t,b,h]);

translate([-t,0,0])
cube([t*3,t+b,b]);

translate([0,0,h-b])
cube([t,t+b,b]);
