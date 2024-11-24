$fn=100;

module triangle(o_len, a_len, depth, center=false)
{
    centroid = center ? [-a_len/3, -o_len/3, -depth/2] : [0, 0, 0];
    translate(centroid) linear_extrude(height=depth)
    {
        polygon(points=[[0,0],[a_len,0],[0,o_len]], paths=[[0,1,2]]);
    }
}

module diamond(r=0.2)
{
   polygon(points=[
           [0,1],
           [r,0],
           [0,-1],
           [-r,0]
         ]);
}

module star()
{
diamond(0.25);
rotate([0,0,90]) diamond(0.25);
//rotate([0,0,45]) scale([0.66,0.66]) diamond(0.3);
//rotate([0,0,-45]) scale([0.66,0.66]) diamond(0.3);
}

module arrow()
{
  difference(){
  union(){  
    translate([0,0,-0.8]) cylinder(1.6,2,2);
    cube([8,2,1.6], center=true);
    translate([5,0,0]) hull(){
      translate([0,0.7,0]) triangle(2, 3, 1.6, center=true);
      translate([0,-0.7,0]) mirror([0,1,0]) triangle(2, 3, 1.6, center=true);
    }
    
    translate([-3.5,0,0])  hull(){
      translate([0,0.7,0]) triangle(2, 3, 1.6, center=true);
      translate([0,-0.7,0]) mirror([0,1,0]) triangle(2, 3, 1.6, center=true);
    }

    translate([-5,0,0])  hull(){
      translate([0,0.7,0]) triangle(2, 3, 1.6, center=true);
      translate([0,-0.7,0]) mirror([0,1,0]) triangle(2, 3, 1.6, center=true);
    }
  }
  
  translate([-7,0,0])  hull(){
      translate([0,0.7,0]) triangle(2, 3, 1.6, center=true);
      translate([0,-0.7,0]) mirror([0,1,0]) triangle(2, 3, 1.6, center=true);
    }
    
  translate([0,0,-1]) cylinder(3,1.2,1.2);
    
  }
  
}

module base(){
difference(){
   cylinder(3.5,10,10);
   translate([0,0,1.2]) cylinder(3.5,8.8,8.8);
   translate([0,0,0.6]) scale([8,8]) linear_extrude(1) scale([1.1,1.1]) star();
    
    // N,E,S,W
    translate([-4.5,4.5,0.8]) scale([0.25,0.25]) linear_extrude(0.6) 
      rotate([0,0,45]) text("W", font="Arial", halign="center", valign="center");
    translate([4.5,4.5,0.8]) scale([0.25,0.25]) linear_extrude(0.6) 
      rotate([0,0,-45]) text("N",font="Arial", halign="center", valign="center");
    translate([4.5,-4.5,0.8]) scale([0.25,0.25]) linear_extrude(0.6) 
      rotate([0,0,-135]) text("E",font="Arial", halign="center", valign="center");
    translate([-4.5,-4.5,0.8]) scale([0.25,0.25]) linear_extrude(0.6) 
      rotate([0,0,135]) text("S",font="Arial", halign="center", valign="center");
}

cylinder(3,1,1);
}


base();
//translate([0,0,2]) arrow();

// print a seperate star in other color to add to model
//translate([25,0,0]) difference(){
//  scale([7,7]) linear_extrude(1) scale([1.1,1.1]) star();
//  translate([0,0,-1]) cylinder(3,1.2,1.2);
//}
