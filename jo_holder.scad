$holder_tickness = 5;

$diameter_jo = 26.2;
$outer_diameter_jo = $diameter_jo + $holder_tickness * 2;

$bokken_thick = 25;
$bokken_thin = 21.5;

$bokken_height = 15.0;

module jo_holder_jopart()
{
    linear_extrude(height=$diameter_jo)
    difference()
    {
        circle(d = $outer_diameter_jo, $fn=360);
        circle(d = $diameter_jo, $fn = 360);
    }
}


module jo_cutblock()
{
    linear_extrude(height=$diameter_jo+2)
    translate([-$outer_diameter_jo,-$outer_diameter_jo/2,-1])
    square($outer_diameter_jo);
}

module jopart()
{
    difference()
    {
        jo_holder_jopart();
        jo_cutblock();
    }
}

module connector()
{
    //verbinder zum wandstück
    linear_extrude(height=$diameter_jo)
    translate([0,$outer_diameter_jo/2-$holder_tickness/2-1,0])
    square([$holder_tickness,$holder_tickness+$holder_tickness/2]);
}

module wallpart()
{
    //wandstück
    linear_extrude(height=$diameter_jo)
    translate([-$outer_diameter_jo/2,$outer_diameter_jo/2-$holder_tickness/2+$holder_tickness+$holder_tickness/2-1,0])
    square([$outer_diameter_jo/2+$holder_tickness,$holder_tickness]);
}

module bokkenpart()
{
    difference()
    {
        linear_extrude(height=$diameter_jo)
        difference()
        {   
            resize([$bokken_height*2+$holder_tickness*2, $bokken_thick+$holder_tickness*2]) circle(d=$bokken_thick+$holder_tickness, $fn=360);
            
            resize([$bokken_height*2, $bokken_thick]) circle(d=$bokken_thick, $fn=360);
        }
        
        bokken_cutblock();
    }
}

module bokkenpart_thin()
{
    difference()
    {
        linear_extrude(height=$diameter_jo)
        difference()
        {   
            resize([$bokken_height*2+$holder_tickness*2, $bokken_thin+$holder_tickness*2]) circle(d=$bokken_thin+$holder_tickness, $fn=360);
            
            resize([$bokken_height*2, $bokken_thin]) circle(d=$bokken_thin, $fn=360);
        }
        
        bokken_cutblock();
    }
}

module bokken_cutblock()
{
    linear_extrude(height=$diameter_jo+2)
    translate([-$outer_diameter_jo,-$outer_diameter_jo/2,-1])
    square($outer_diameter_jo);
}

module wholepart()
{
//jopart();
//bokkenpart();
bokkenpart_thin();
connector();
wallpart();
}

difference()
{
    $y = 22.1;
    wholepart();
    
    
translate([-8.5,$y,$diameter_jo/2])
rotate([270,0,0])
cylinder(h=$holder_tickness, d1 = 4.5, d2 = 4.5, $fn = 360);
    
    
    translate([-8.5,$y,$diameter_jo/2])
    rotate([270,0,0])
cylinder(h=3, d1 = 9, d2 = 4.5, $fn = 360);
}
