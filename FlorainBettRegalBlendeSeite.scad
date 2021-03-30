$thickness = 1.8;
$wall_thinkness = 0.12;


//Ohne Ecke => ohne zusätzliche wall_thinkness und Größe für hinten noch außmeßen / Menge der benötigten Teile => dass man auf einen Werte der gerade so für das Druckbrett passt kommt, aber genau x gleiche Teile davon drucken kann!

//=> Mit Ecke am einen Ende, wo noch keine ist? (hinten beim Kabelkanal)

$length = (19 / 2);
//$length = ??//(19 / 2);// + $wall_thinkness; //Hälfte weil sonst zu groß für Druckbrett


$depth = 0.5;//1.0;



//Rückwand
translate([0,0,0])
cube([$length, $wall_thinkness, $thickness+(1*$wall_thinkness)]);

//Seitenwand unten
translate([$0,0,0])
cube([$length, $depth + $wall_thinkness, $wall_thinkness]);

//Seitenwand oben
translate([0,0,$thickness+(1*$wall_thinkness)])
cube([$length, $depth + $wall_thinkness, $wall_thinkness]);

//Ecke
//translate([0,0,0])
//cube([$wall_thinkness, $depth + $wall_thinkness, $thickness+(2*$wall_thinkness)]);