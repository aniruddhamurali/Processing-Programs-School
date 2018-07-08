float x;
float y;
float n = 0;

void setup(){
  size(800,800);
  background(200);
  //frameRate(5);
}

void draw(){
  background(200);
  fill(0);
  ellipseMode(CENTER);
  ellipse(400,400,400,400);
  
  x = 200 * cos(degrees(n)) + 400;
  y = 200 * sin(degrees(n)) + 400;
  ellipseMode(CENTER);
  fill(255);
  ellipse(x,y,50,50);
  n = n + 0.0008;
  
}
    
  
    

