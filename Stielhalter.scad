t=3;

difference() {
    cylinder(h=20, d=15);
    translate([0,0,0])
    cylinder(h=20-t, d=15-t*2);
    # cylinder innen als kern optional für hole rohre
    # ohne kern ist dann für stöcke
    
}

# vorteil einzelfertigung mit wenigen prototypen...
# ich muss nicht am material sparen wie große konzerne mit ihren produkten um umsatz zu erzielen
