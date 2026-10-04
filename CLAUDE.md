# OpenSCAD Project Rules

## Rounding edges

When applying any rounding to an object (minkowski, offset, rotate_extrude, etc.):

1. **Preserve overall dimensions** — the final x, y, z extents must match the original. Compensate by shrinking the inner shape by the rounding radius so the result fills the same bounding box.
2. **Check for gaps** — verify that adjacent objects still share faces without empty space. `minkowski()` with a sphere shifts the object's z-origin by `-r`; always compensate with `translate([0,0,r])` so the bottom stays at z=0 and the top at the intended height.
