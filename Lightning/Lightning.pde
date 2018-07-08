
void setup() {
  size(800,600); 
  background(10, 5, 30);
  
  drawLightning(200, 0);
}


void drawLightning(int xi, int yi) {
  int x = xi;
  int y = yi;
  int sparkWidth = 6 - y/100;
  
  if (sparkWidth <= 0) {
    // do nothing, let the function return 
  }
  else {
    strokeWeight(sparkWidth);
    stroke(200,200,50);
    int xf = x + (int)random(-40,40);
    int yf = y + (int)random(0,40);
    line(x,y,xf,yf);
    
    drawLightning(xf,yf);
    
    float fork = random(0,1);
    if (fork < 0.2) {
      drawLightning(xf, yi); 
    }
  }
}