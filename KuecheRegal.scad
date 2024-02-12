c=348;//35
a=30;//35
b=sqrt(c*c-a*a);
h=21;
y=40;//Solche stückla in y richtung

echo("b:");
echo(b);


difference()
{
linear_extrude(h)
polygon([[0,0],[0,b],[a,b]]);


cube([a,b-y,h]);
}

ls=34.25;
ds=1.2;//DURCHMESSER schraube
dk=8;//Durchmesser Kopf#
hk=2.75;//Hoehe kopf

dw=15;//Dicke Holzwand
cylinder([h=ls-lb/2, ds]);