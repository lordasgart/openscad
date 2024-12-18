dicke=1.6; //4 x 0.4mm Nozzle
tiefe=55; //?
hoehe=100;

cube([dicke,tiefe,hoehe]);

//Front
breite=dicke*2; //~3mm

translate([-breite,-dicke,0])
cube([breite+dicke, dicke, hoehe]);

//Irgendeinen Halter daraus machen z.B. Stifte, Kopfhörer, Kabel, Kassette, ...

/*
translate([0,-dicke,0])
{
    cube([50,tiefe+dicke,dicke]);
    translate([50,0,0])
    cube([dicke,tiefe+dicke,20]);
}
*/
