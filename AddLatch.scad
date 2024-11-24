$fn=30;

/* [Global] */

module RCube(x,y,z,ipR=4) {
    translate([-x/2,-y/2,0]) hull(){
      translate([ipR,ipR,ipR]) sphere(ipR);
      translate([x-ipR,ipR,ipR]) sphere(ipR);
      translate([ipR,y-ipR,ipR]) sphere(ipR);
      translate([x-ipR,y-ipR,ipR]) sphere(ipR);
      translate([ipR,ipR,z-ipR]) sphere(ipR);
      translate([x-ipR,ipR,z-ipR]) sphere(ipR);
      translate([ipR,y-ipR,z-ipR]) sphere(ipR);
      translate([x-ipR,y-ipR,z-ipR]) sphere(ipR);
      }  
} 

// Box Height
TotalX = 50.2;
TotalY = 48.3;
TotalZ = 30;
Lid = 2;

LatchNotch = 1.5;
NubExtend = 1;
SqrRoot2 = 1.4;
Gap = 0.3;

module lid(){

  // make a slot for the latch can flex         
  translate([TotalX/2,TotalY/2-2.5,-TotalZ/2]) RCube(18,1,TotalZ+1,0.4);
  translate([TotalX/2,-TotalY/2+2.5,-TotalZ/2]) RCube(18,1,TotalZ+1,0.4);
  translate([TotalX/2-8,TotalY/2-2,-TotalZ/2]) RCube(2,1,TotalZ+1,0.4);
  translate([TotalX/2-8,-TotalY/2+2,-TotalZ/2]) RCube(2,2,TotalZ+1,0.4);
    
  // Notches
  translate([TotalX/2-4,TotalY/2,0]) scale([1.5,1,1]) rotate([0,0,45]) cube ([LatchNotch,LatchNotch,TotalZ+3],center=true);        
  translate([TotalX/2-4,-TotalY/2,0]) scale([1.5,1,1]) rotate([0,0,45]) cube ([LatchNotch,LatchNotch,TotalZ+3],center=true);
    
  // Lead slant
  translate([TotalX/2,TotalY/2,0]) scale([1.5,1,1]) rotate([0,0,45]) cube ([LatchNotch,LatchNotch,TotalZ+3],center=true);        
  translate([TotalX/2,-TotalY/2,0]) scale([1.5,1,1]) rotate([0,0,45]) cube ([LatchNotch,LatchNotch,TotalZ+3],center=true);
    
}


module box () {
//  Main Box  
  // create the nubs for the latches
    translate([TotalX/2-4,TotalY/2+Gap,TotalZ/2]) scale([1.5,1,1]) difference(){
      rotate([0,0,45]) cube ([LatchNotch,LatchNotch,Lid],center=true);
      translate([0,2,0]) cube ([4,4,Lid],center=true);
      translate([0,-2,0])cube([2,2,Lid], center=true);
      }  
    translate([TotalX/2-4,TotalY/2+NubExtend/2+Gap,TotalZ/2]) scale([1.5,1,1]) cube ([LatchNotch*SqrRoot2,NubExtend,Lid+1],center=true);
      
    translate([TotalX/2-4,-TotalY/2-Gap,TotalZ/2]) scale([1.5,1,1]) difference(){
      rotate([0,0,45]) cube ([LatchNotch,LatchNotch,Lid],center=true);
      translate([0,-2,0]) cube ([4,4,Lid],center=true);
      translate([0,2,0])cube([2,2,Lid], center=true);
      }
      
    translate([TotalX/2-4,-TotalY/2-NubExtend/2-Gap,TotalZ/2]) scale([1.5,1,1]) cube ([LatchNotch*SqrRoot2,NubExtend,Lid],center=true);
      
} 

// Production Box
//translate([0,0,TotalZ/2+1]) box();
//    import("crate2.3mf");
//    box();

difference(){
    rotate([0,0,180]) import("arrowhead_lid2.stl");
    lid();
}


