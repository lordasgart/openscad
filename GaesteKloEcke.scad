a=4;
b=8;
c=72;

linear_extrude(height=b)
    polygon(points=[[0,a], [a,0], [c,0], [0,c]]);
