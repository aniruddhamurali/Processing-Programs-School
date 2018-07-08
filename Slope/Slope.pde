float gridSpacing = 20;

int numberPointsClicked = 0;

float x1;
float y1;
float x2;
float y2;

float labelX1;
float labelY1;
float labelX2;
float labelY2;


float x3;
float y3;
float x4;
float y4;

float originX;
float originY;

PFont f;

void setup(){
  size(800, 800);
  originX = width / 2;
  originY = height / 2;
  f = createFont("Calibiri-Bold", 30, true);
  frame.setResizable(true);
  drawGrid(gridSpacing, originX, originY);
}


void draw() {
  // the gridSpacing and origin[XY] variables control the grid spacing and location of origin
  //float gridSpacing = 20;
  if (keyPressed){
    if (key == 'z') gridSpacing++;
    else if (key == 'a') gridSpacing--;
  }
  
  float slope;
  String outputText;
  
  // draw the grid
  drawGrid(gridSpacing, originX, originY);
  
  
  // if one point clicked, draw the point and label it
  if (numberPointsClicked==1) {
      noStroke();
      fill(255,0,0);
      ellipse(x1, y1, 9, 9);  
      labelCoordinate(x1, y1, gridSpacing);
  }
  
  // if two points clicked, draw both points, a line connecting them, and label both points
  else if (numberPointsClicked==2) {
      stroke(0);
      strokeWeight(1);
      line(x1, y1, x2, y2);
            
      fill(255,0,0);
      noStroke();
      ellipse(x1, y1, 9, 9);
      ellipse(x2, y2, 9, 9);
      //labelCoordinate(x1, y1, gridSpacing);    
      labelCoordinate(x2, y2, gridSpacing);    

      // compute the slope and print it to the canvas      
      slope = computeSlope(x1, y1, x2, y2);
      outputText = "The slope is approximately " + slope;
      printMessage(outputText);
  }
  
}



void mousePressed(){
  
  //Mouse 1st time clicked
  if (numberPointsClicked == 0){
    x1 = mouseX;
    y1 = mouseY;
    numberPointsClicked = 1;
  }
  
  //Mouse 2nd time clicked
  else if (numberPointsClicked == 1){
    x2 = mouseX;
    y2 = mouseY;
    numberPointsClicked = 2;
  }
  
  //Mouse 3rd time clicked..resetting to 1
  else if (numberPointsClicked == 2){
    x1 = mouseX;
    y1 = mouseY;
    numberPointsClicked = 1;
  }
}


//draws grid
void drawGrid(float gridSpacing, float originX, float originY){
  background(250);
  stroke(150);
  strokeWeight(1);
  
  for (int i = 0; i < gridSpacing; i = i + 1){
    line(0, i * height/gridSpacing, width, i * height/gridSpacing);
    line(i * width/gridSpacing, 0, i * width/gridSpacing, height);
  }
  
  stroke(0);
  strokeWeight(3);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  strokeWeight(1);
}


// labels the point with its x and y coordinates
void labelCoordinate(float x, float y, float gridSpacing){
  coordinates(x, y);
  textAlign(RIGHT, UP);
  textFont(f, 15);
  
  text("(" + str(labelX1) + ", " + str(labelY1) + ")", x1, y1);
  if (numberPointsClicked == 1){
  }
  else if (numberPointsClicked == 2 || numberPointsClicked == 0){    
    text("(" + str(labelX2) + ", " + str(labelY2) + ")", x2 + 40, y2 + 25);
  }
}


// computes the slope
float computeSlope(float x1, float y1, float x2, float y2){
  float slope = -(y2 - y1)/(x2 - x1); // negative because y values and slope increase as it goes downward
  
  if (slope == 0) return 0;
  
  return slope;
}


// prints the slope on the canvas
void printMessage(String message){
  rectMode(CENTER);
  fill(220);
  stroke(0);
  strokeWeight(2);
  rect(width/2, 0.9 * height, 0.6 * width, height/20);
  
  if (x1 == x2 && y1 == y2){
    message = "The slope does not exist";
  }
  
  textAlign(CENTER, CENTER);
  textFont(f, height * 9/400);
  fill(0,0,255);
  text(message, width/2, 0.9 * height);
}


// calculates x and y coordinates on grid using pixel values
void coordinates(float x, float y){
  float xcoord = ((x - width/2)/(gridSpacing/2))/4;
  float ycoord = -((y - height/2)/(gridSpacing/2))/4;
  
  if (numberPointsClicked == 1){
    labelX1 = xcoord;
    labelY1 = ycoord;
  }
  else {
    labelX2 = xcoord;
    labelY2 = ycoord;
  }
}
