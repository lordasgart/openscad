innerwidth = 86;
innerdepth = 33;
frontwallwitdh=14;
height=128;
t=4;

difference()
{
    cube([innerwidth+t+t, innerdepth+t+t, height+t]);   
    
    translate([t,t,t])
    cube([innerwidth, innerdepth, height]);
    
    translate([frontwallwitdh,0,0])
    cube([innerwidth+t+t-frontwallwitdh*2, t, height+t]);
}