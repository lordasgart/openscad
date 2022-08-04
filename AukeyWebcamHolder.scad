 //Dicke
 d=10.5;
 //Top width
 tw=36;
 //Bottom width
 bw=44;
 //Durchmesser Stopfen
 ds=4.8;
 //Height
 h=40;
 //Thickness
 t=2;
 //Breite Brett
 bb=35;
 //Tiefe Stopfen (Zentrum)
 ts=19.8;
 
 module webcam() {
     translate([t,t,t])
     color("#777777")
     cube([bw, d, h]);
 }
 
 webcam();
 
 //Halter linke Wand 
 cube([bw-tw, t , h]);
 
 
 //Brett
 module brett() {
     color("#AA6600")
     cube([bb, ts*4, h]);
 }
 
 brett();