$topwidth=52;
$middlewidth=43;

$toptomiddley=5;
$xholder = ($topwidth-$middlewidth)/2;
$xsmall = $xholder / 2;

$depth = 16;

$thickness = 2;

linear_extrude(height = $thickness)
square([$middlewidth+$xholder*2,$toptomiddley*2]);

translate([0,0,$thickness])
hull()
{
    translate([$xsmall/2,$xsmall,0])
    linear_extrude(height = 0.1)
    polygon([[0,0],[$xsmall,$xsmall],[0,$xholder]]);

    translate([0,0,$depth])
    linear_extrude(height = 0.1)
    polygon([[0,0],[$xholder,$xholder],[0,$xholder*2]]);
}

translate([$middlewidth+$xholder,0,$thickness])
hull()
{
    translate([$xsmall/2,$xsmall,0])
    linear_extrude(height = 0.1)
    polygon([[0,$xsmall],[$xsmall,0],[$xsmall,$xholder]]);

    translate([0,0,$depth])
    linear_extrude(height = 0.1)
    polygon([[0,$xholder],[$xholder,0],[$xholder,$xholder*2]]);
}