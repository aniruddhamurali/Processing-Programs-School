float tri1x1, tri1x2, tri1x3, tri1y1, tri1y2, tri1y3;
float tri2x1, tri2x2, tri2x3, tri2y1, tri2y2, tri2y3;
float tri3x1, tri3x2, tri3x3, tri3y1, tri3y2, tri3y3;
float tri4x1, tri4x2, tri4x3, tri4y1, tri4y2, tri4y3;

int screenWidth = 1440;
int screenHeight = 900;

PFont f;

void setup(){
  size(screenWidth, screenHeight); 
  reset();
  f = createFont("Calibiri", 30, true);
}

void reset(){
  tri1x1 = 100;
  tri1x2 = 600;
  tri1x3 = 200;
  tri1y1 = 100;
  tri1y2 = 350;
  tri1y3 = 300;
  
  tri2x1 = 850;
  tri2x2 = 1100;
  tri2x3 = 925;
  tri2y1 = 250;
  tri2y2 = 100;
  tri2y3 = 325;
  
  tri3x1 = 100;
  tri3x2 = 300;
  tri3x3 = 500;
  tri3y1 = 800;
  tri3y2 = 500;
  tri3y3 = 650;
  
  tri4x1 = 900;
  tri4x2 = 1300;
  tri4x3 = 750;
  tri4y1 = 500;
  tri4y2 = 800;
  tri4y3 = 600;
}


void draw() {
  float area;
  background(255);
  
  // draws the four triangles on the screen
  drawTriangles();
  
  // checks for mouse location and computes the corresponding
  // triangle area and displays a message to the user
  if (mouseLocation()=="upper left") {
      area = computeTriangleArea(tri1x1, tri1y1, tri1x2, tri1y2, tri1x3, tri1y3);
      printMessage("Area is " + area);
  } 
  
  if (mouseLocation()=="upper right") {
      area = computeTriangleArea(tri2x1, tri2y1, tri2x2, tri2y2, tri2x3, tri2y3);
      printMessage("Area is " + area);
  } 

  if (mouseLocation()=="lower left") {
      area = computeTriangleArea(tri3x1, tri3y1, tri3x2, tri3y2, tri3x3, tri3y3);
      printMessage("Area is " + area);
  } 

  if (mouseLocation()=="lower right") {
      area = computeTriangleArea(tri4x1, tri4y1, tri4x2, tri4y2, tri4x3, tri4y3);
      printMessage("Area is " + area);
  } 
   
}



void mousePressed(){
  tri1x1 = tri1x1 + random(-20,20);
  tri1x2 = tri1x2 + random(-20,20);
  tri1x3 = tri1x3 + random(-20,20);
  tri1y1 = tri1y1 + random(-20,20);
  tri1y2 = tri1y2 + random(-20,20);
  tri1y3 = tri1y3 + random(-20,20);
  
  tri2x1 = tri2x1 + random(-20,20);
  tri2x2 = tri2x2 + random(-20,20);
  tri2x3 = tri2x3 + random(-20,20);
  tri2y1 = tri2y1 + random(-20,20);
  tri2y2 = tri2y2 + random(-20,20);
  tri2y3 = tri2y3 + random(-20,20);
  
  tri3x1 = tri3x2 + random(-20,20);
  tri3x2 = tri3x2 + random(-20,20);
  tri3x3 = tri3x3 + random(-20,20);
  tri3y1 = tri3y1 + random(-20,20);
  tri3y2 = tri3y2 + random(-20,20);
  tri3y3 = tri3y3 + random(-20,20);
  
  tri4x1 = tri4x1 + random(-20,20);
  tri4x2 = tri4x2 + random(-20,20);
  tri4x3 = tri4x3 + random(-20,20);
  tri4y1 = tri4y1 + random(-20,20);
  tri4y2 = tri4y2 + random(-20,20);
  tri4y3 = tri4y3 + random(-20,20);
}



void drawTriangles(){
  fill(0, 255, 255);
  if (tri1x1 < 0 || tri1x1 > screenWidth/2 || tri1x2 < 0 || tri1x2 > screenWidth/2 || tri1x3 < 0 || tri1x3 > screenWidth/2) reset(); 
  if (tri1y1 < 0 || tri1y1 > screenHeight/2 || tri1y2 < 0 || tri1y2 > screenHeight/2 || tri1y3 < 0 || tri1y3 > screenHeight/2) reset(); 
  triangle(tri1x1, tri1y1, tri1x2, tri1y2, tri1x3, tri1y3);
  
  fill(255, 0, 0);
  if (tri2x1 < screenWidth/2 || tri2x1 > screenWidth || tri2x2 < screenWidth/2 || tri2x2 > screenWidth || tri2x3 < screenWidth/2 || tri2x3 > screenWidth) reset(); 
  if (tri2y1 < 0 || tri2y1 > screenHeight/2 || tri2y2 < 0 || tri2y2 > screenHeight/2 || tri2y3 < 0 || tri2y3 > screenHeight/2) reset(); 
  triangle(tri2x1, tri2y1, tri2x2, tri2y2, tri2x3, tri2y3);
  
  fill(0, 255, 0);
  if (tri3x1 < 0 || tri3x1 > screenWidth/2 || tri3x2 < 0 || tri3x2 > screenWidth/2 || tri3x3 < 0 || tri3x3 > screenWidth/2) reset(); 
  if (tri3y1 < screenHeight/2 || tri3y1 > screenHeight || tri3y2 < screenHeight/2 || tri3y2 > screenHeight || tri3y3 < screenHeight/2 || tri3y3 > screenHeight) reset(); 
  triangle(tri3x1, tri3y1, tri3x2, tri3y2, tri3x3, tri3y3);
  
  fill(0, 0, 255);
  if (tri4x1 < screenWidth/2 || tri4x1 > screenWidth || tri4x2 < screenWidth/2 || tri4x2 > screenWidth || tri4x3 < screenWidth/2 || tri4x3 > screenWidth) reset(); 
  if (tri4y1 < screenHeight/2 || tri4y1 > screenHeight || tri4y2 < screenHeight/2 || tri4y2 > screenHeight || tri4y3 < screenHeight/2 || tri4y3 > screenHeight) reset(); 
  triangle(tri4x1, tri4y1, tri4x2, tri4y2, tri4x3, tri4y3);
}



String mouseLocation(){
  String result = "";
  
  if (mouseX < screenWidth/2 && mouseY < screenHeight/2) result = "upper left";
  if (mouseX > screenWidth/2 && mouseY < screenHeight/2) result = "upper right";
  if (mouseX < screenWidth/2 && mouseY > screenHeight/2) result = "lower left";
  if (mouseX > screenWidth/2 && mouseY > screenHeight/2) result = "lower right";
  
  return result;
}

void printMessage(String message){
  textAlign(CENTER, CENTER);
  textFont(f, 20);
  fill(0);
  text(message, screenWidth/2, screenHeight/2);
}



float computeTriangleArea(float trix1, float triy1, float trix2, float triy2, float trix3, float triy3){
  float a = dist(trix1, triy1, trix2, triy2);
  float b = dist(trix1, triy1, trix3, triy3);
  float c = dist(trix2, triy2, trix3, triy3);
  float s = (a + b + c)/2;
  
  float area = sqrt(s * (s - a) * (s - b) * (s - c));
  return area;
}
