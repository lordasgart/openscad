w=19.2;

a=1.5;
b=0.75;

c=0.87; //2lines

d=4;




//translate([12.5,-w/2,115.71])
//rotate([0,50,0])
//{
//    sensor3_holder();
//}

module sensor3_holder()
{
    cube([d,w,c]);
    cube([d,b,a]);
    translate([0,w,0])
    cube([d,b,a]);
}

module head() 
{
	difference() 
	{
		union()
		 {
			//cylinder(r=5,h=100,$fn=30);
			//translate([0,0,0])sphere(r=5,$fn=30);

			//translate([0,0,100])sphere(r=5,$fn=30);
             
			difference() 
			{
				translate([0,-7,100]) rotate([0,-40,0]) cube([20,14,4]);
				translate([0,4,98]) rotate([0,-40,12]) cube([20,14,8]);
				translate([-3,-18,98]) rotate([0,-40,-12]) cube([20,14,8]);
			}
		}
	
		translate([-14.5,-5,-5]) cube([10,10,120]);
        
        
	}
}

module grip() 
{
	
		union()
		 {
			cylinder(r=5,h=100,$fn=9);
			translate([0,0,0])sphere(r=5,$fn=9);

			translate([0,0,100])sphere(r=5,$fn=9);
             
			//difference() 
			//{
			//	translate([0,-7,100]) rotate([0,-40,0]) cube([20,14,4]);
			//	translate([0,4,98]) rotate([0,-40,12]) cube([20,14,8]);
			//	translate([-3,-18,98]) rotate([0,-40,-12]) cube([20,14,8]);
			//}
		}
	
		//translate([-14.5,-5,-5]) cube([10,10,120]);
  
}

difference()
{
grip();
    head();
}