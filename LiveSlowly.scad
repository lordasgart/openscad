$fn=24;

zitat="To live long, live slowly.";
urheber="Marcus Tullius Cicero";

linear_extrude(3)
text(zitat, size=8, halign="center");

translate([0,-20,0])
linear_extrude(1.5)
text(urheber, size=6, halign="center");

