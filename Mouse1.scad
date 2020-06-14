$fn=36*2;
$topinner=28;
$height = 35+16;

module top()
{
cylinder(r=$topinner,h=$height);
translate([-$topinner,0,0])
cube([$topinner*2,$topinner/2,$height]);
}

difference()
{
top();
  
translate([-$topinner,$topinner/2,0])
cube([$topinner*2,$topinner/2,$height]);
}