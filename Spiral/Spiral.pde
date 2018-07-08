float r = 0;
float theta = 90;

void setup(){
  size(700,700);
  background(255); 
  frameRate(50);
}

void draw(){
  float x = r * cos(theta);
  float y = r * sin(theta);
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(x+width/2,y+height/2,50,50);
  
  theta = theta + 0.01;
  r = r + 0.1;
}
