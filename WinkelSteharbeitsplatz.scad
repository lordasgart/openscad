//C:\Users\marku\Projects\openscad\WinkelSteharbeitsplatz.scad

//Winkel 76° ist schon steiler als 75 vom Tisch selber
w=75;
gw=90-w;
//Nach 60cm fangen die Löcher an
al=600;
//Diese haben das Zentrum bei der 0
c=0;
//das Ende des nächsten Loches ist bei 5
enl=50;
//die Löcher selber habe 0,5 cm Durchmesser
dl=5;
//12 Löcher gesamt
lg=12;
//7=1.Platte
//12=2.Platte
//1. Platte 2 43 58
//2. Platte 2 25 58
//Breite Bretter
bb=580;
//Dicke Bretter
dib=20;
//Das Dreieck ist vorne 23
//nach hinten 36
//Das mittler Brett ist 48
mbw=480;
//Die Dreiecke sind 40 außereinander am äußeren Ende
//Das letzte Loch bis zum Ende des mittleren Brett sind 8
lle=80;
//Die Nut der Bretter ist 4.8 von hinten und dann 2.8 tief

//Loch zu Loch
lzl=enl+dl/2-dl;
//Höhe mittleres Brett
hmb=al+lzl*lg+dl+lle;

module Mittelbrett()
{   
    translate([(bb-mbw)/2,0,0])
    cube([mbw,dib,hmb]);
}

rotate([-gw,0,0])
Mittelbrett();
