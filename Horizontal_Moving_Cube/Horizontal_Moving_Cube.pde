float x = 400;
boolean xIncrease = true;
float y = 400;
float z = 400;

void setup(){
  size(800,800,P3D);
  background(200);
}

void draw(){
 background(200);
 translate(x,y,z);
 noFill();
 //rotateY(radians(45));
 //rotateX(0.5);
 //rotateX(radians(30));
 box(100); 
 //x = x + 0.5;
 //y = y + 0.5;
 //z = z + 0.5;
 if (x == 600){
   x = x - 0.5;
   xIncrease = false;
 }
 
 else if (x == 200){
   x = x + 0.5;
   xIncrease = true;
 }
 
 else if (xIncrease == true){
   x = x + 0.5;
 }
 
 else if (xIncrease == false){
   x = x - 0.5;
 }
}
