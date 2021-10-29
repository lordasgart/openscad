//22.2 //durchmesser kreis bruchstueck, brauch ich gerade nicht, hab es mit inkscape von einem Foto als Polygon, Bezier gesetzt
h2=2.35; //Die Spitze ist 1.65 dick und hinten ist es 2.35
db=1.5; //Durchmesser vom Haltebobbel
dh=1.5; //Dicke Haltebobbel

sb=(h2-dh)/2;//Shift z von Haltebobel

$fn=90;

linear_extrude(h2)
//linear_extrude(1.65)
hull(){
 import("/home/lordasgart/Nextcloud/Documents/3D/SVG/Pizzaschneider.svg");
}

translate([0.65,3,sb])
cylinder(h=dh,d=db);