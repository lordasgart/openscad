a=4;
b=8;
c=72;
d=3.5;

linear_extrude(height=b)
    polygon(points=[[0,a], [a,0], [c+d,0], [-d,c]]);
