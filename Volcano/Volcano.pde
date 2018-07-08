/** Volcano Active Life Project
 * Simulates a volcano that can explode
 * 
 * @author Aniruddha Murali
 * @school Staples High School
 * @version 1.0.0
 * @since 9/11/15
 *
 * Modification History
 *  9/11/15 - Implemented shape of the volcano
 *  9/12/15 - Added day and night backgrounds
 *  9/13/15 - Implemented volcanic explosion with lava falling from the air
 */


int curveX1 = 265;
int curveX2 = 1175;

float screenWidth = 1440;
float screenHeight = 900;

boolean night = false;  // boolean that changes between day and night without affecting other parts of the program
boolean volcano_erupted = false;

int greenValue;

float lavaDrop_opacity = 0;

int time;

float sphereX = random(0,screenWidth);;
float sphereY = 0;

float yspeed = 0;
float xspeed = 0;
float gravity = 0.1;


/** setup()
 * This method sets up the program
 *
 * @param none
 * @return none
 */
void setup(){
  size(1440,900, P3D);
  background(0,225,240); // daylight
  fill(230,150,70);
  rectMode(CORNER);
  rect(0,500,screenWidth,400);
}


/** draw()
 * This method is the main method that executes the whole program
 *
 * @param none
 * @return none
 */
void draw(){
  if (volcano_erupted == false){
    volcanoShape();
    drawPath("Black");
  }
  
  if (mouseX < screenWidth/2){
    dayScreen();
  }
  else if (mouseX >= screenWidth/2){
    nightScreen();
  }
  
  if (volcano_erupted == true){
    volcanoErupt();
    drawPath("Orange");
    lavaDrop();
  }
}


/** mouseClicked()
 * This method is for handling the mouse click event
 *
 * @param none
 * @return none
 */
void mouseClicked(){
  if (volcano_erupted == false){
    //noLoop();
    volcanoErupt();
    //delay(1000);
    drawPath("Orange");
    lavaDrop();
    //delay(3000);
    if (night == false){
      dayScreen();
    }
    else if (night == true){
      nightScreen();
    }
    //noLoop();
  }

}


/** volcanoShape()
 * This method constructs the shape of the volcano
 *
 * @param none
 * @return none
 */
void volcanoShape(){
  fill(131,87,57); // outer structure is a medium brown
  stroke(0);
  
  // structure of volcano
  beginShape();
  
  // left curve
  curveVertex(curveX1, screenHeight);
  curveVertex(curveX1 + 50 - 100, screenHeight * 590/600);
  curveVertex(curveX1 + 100 - 100, screenHeight * 560/600);
  curveVertex(curveX1 + 150 - 80, screenHeight * 520/600);
  curveVertex(curveX1 + 200 - 40, screenHeight * 410/600);
  curveVertex(curveX1 + 250, screenHeight * 290/600);
  curveVertex(curveX1 + 300, screenHeight * 180/600);
  curveVertex(curveX1 + 350, 210);
  
  // right curve
  curveVertex(curveX2 - 350, 210);
  curveVertex(curveX2 - 300, screenHeight * 180/600);
  curveVertex(curveX2 - 250, screenHeight * 290/600);
  curveVertex(curveX2 - 200 + 40, screenHeight * 410/600);
  curveVertex(curveX2 - 150 + 80, screenHeight * 520/600);
  curveVertex(curveX2 - 100 + 100, screenHeight * 560/600);
  curveVertex(curveX2 - 50 + 100, screenHeight * 590/600);
  curveVertex(curveX2, screenHeight);
  curveVertex(curveX1, screenHeight);
  
  endShape(CLOSE);
  
  // hole in volcano where lava erupts - uses darker brown for contrast
  fill(77,53,37); 
  arc(screenWidth/2, 228, 275, 55, 0, 2*PI);
}



/** drawPath()
 * This method draws a path where lava drips down the volcano
 *
 * @param fillColor(String) - draws the path orange/red if fillColor == orange. Otherwise, dark brown.
 * @return none
 */
void drawPath(String fillColor){
  // if fillColor is orange, indicating that the volcano erupted, path1 is filled with orange
  if (fillColor == "Orange"){
    greenValue = 150; // greenValue is used to make an orange-to-red gradient for the flow of lava
    fill(255,greenValue,0);
    stroke(255,greenValue,0);
  }
  // otherwise, it is filled with dark brown, it's normal color
  else{
    fill(80,60,50);
    stroke(80,60,50);
  }
  
  // in case any coordinates should be changed, it only has to be changed at one place thanks to the use of variables
  int startX = 640;
  int startY = 250;
  int xstep = 10;
  int ystep = 70;
  int xlength = 40;
  int ylength = 10;
  int shapeCount = 1;
  
  //creates zig-zag path for lava to flow on volcano
  beginShape();
  vertex(startX,startY);
  vertex(startX + xlength, startY + ylength - 6);
  vertex(startX + xlength - xstep, startY + ylength + ystep);
  vertex(startX - xstep, startY + ystep);
  endShape(CLOSE);

  if (fillColor == "Orange"){
    greenValue = greenValue - 10;
    fill(255,greenValue,0);
    stroke(255,greenValue,0);
  }
  shapeCount = shapeCount + 1;
  beginShape();
  vertex(startX - xstep, startY + ystep);
  vertex(startX + xlength - xstep, startY + ylength + ystep);
  vertex(startX + xlength, startY + ylength + shapeCount * ystep);
  vertex(startX, startY + shapeCount * ystep);
  endShape(CLOSE);
  
  if (fillColor == "Orange"){
    greenValue = greenValue - 10;
    fill(255,greenValue,0);
    stroke(255,greenValue,0);
  }  
  shapeCount = shapeCount + 1;
  beginShape();
  vertex(startX, startY + (shapeCount - 1) * ystep);
  vertex(startX + xlength, startY + ylength + (shapeCount - 1) * ystep);
  vertex(startX + xlength - xstep , startY + ylength + shapeCount * ystep);
  vertex(startX - xstep, startY + shapeCount * ystep);
  endShape(CLOSE);
  
  if (fillColor == "Orange"){
    greenValue = greenValue - 10;
    fill(255,greenValue,0);
    stroke(255,greenValue,0);
  }
  shapeCount = shapeCount + 1;
  beginShape();
  vertex(startX - xstep, startY + (shapeCount - 1) * ystep);
  vertex(startX + xlength - xstep, startY + ylength + (shapeCount - 1) * ystep);
  vertex(startX + xlength, startY + ylength + shapeCount * ystep);
  vertex(startX, startY + shapeCount * ystep);
  endShape(CLOSE);
  
  if (fillColor == "Orange"){
    greenValue = greenValue - 10;
    fill(255,greenValue,0);
    stroke(255,greenValue,0);
  }
  shapeCount = shapeCount + 1;
  beginShape();
  vertex(startX, startY + (shapeCount - 1) * ystep);
  vertex(startX + xlength, startY + ylength + (shapeCount - 1) * ystep);
  vertex(startX + xlength - xstep , startY + ylength + shapeCount * ystep);
  vertex(startX - xstep, startY + shapeCount * ystep);
  endShape(CLOSE);
  
  if (fillColor == "Orange"){
    greenValue = greenValue - 10;
    fill(255,greenValue,0);
    stroke(255,greenValue,0);
  }
  shapeCount = shapeCount + 1;
  beginShape();
  vertex(startX - xstep, startY + (shapeCount - 1) * ystep);
  vertex(startX + xlength - xstep, startY + ylength + (shapeCount - 1) * ystep);
  vertex(startX + xlength, startY + ylength + shapeCount * ystep);
  vertex(startX, startY + shapeCount * ystep);
  endShape(CLOSE);
  
  if (fillColor == "Orange"){
    greenValue = greenValue - 10;
    fill(255,greenValue,0);
    stroke(255,greenValue,0);
  }
  shapeCount = shapeCount + 1;
  beginShape();
  vertex(startX, startY + (shapeCount - 1) * ystep);
  vertex(startX + xlength, startY + ylength + (shapeCount - 1) * ystep);
  vertex(startX + xlength - xstep , startY + ylength + shapeCount * ystep);
  vertex(startX - xstep, startY + shapeCount * ystep);
  endShape(CLOSE);
  
  if (fillColor == "Orange"){
    greenValue = greenValue - 10;
    fill(255,greenValue,0);
    stroke(255,greenValue,0);
  }
  shapeCount = shapeCount + 1;
  beginShape();
  vertex(startX - xstep, startY + (shapeCount - 1) * ystep);
  vertex(startX + xlength - xstep, startY + ylength + (shapeCount - 1) * ystep);
  vertex(startX + xlength, startY + ylength + shapeCount * ystep);
  vertex(startX, startY + shapeCount * ystep);
  endShape(CLOSE);
  
  if (fillColor == "Orange"){
    greenValue = greenValue - 10;
    fill(255,greenValue,0);
    stroke(255,greenValue,0);
  }
  shapeCount = shapeCount + 1;
  beginShape();
  vertex(startX, startY + (shapeCount - 1) * ystep);
  vertex(startX + xlength, startY + ylength + (shapeCount - 1) * ystep);
  vertex(startX + xlength - xstep , startY + ylength + shapeCount * ystep);
  vertex(startX - xstep, startY + shapeCount * ystep);
  endShape(CLOSE);
      
}



/*void path2(String fillColor){
  fill(255,102,0);
  stroke(255,102,0);
  
  beginShape();
  vertex(640,250);
  vertex(640,250);
  vertex(680,254);
  vertex(670,320);
  vertex(630,310);
  endShape(CLOSE);

  beginShape();
  vertex(630,310);
  vertex(670,320);
  vertex(690,390);
  vertex(650,380);
  endShape(CLOSE);
    
  beginShape();
  vertex(650,380);
  vertex(690,390);
  vertex(680,450);
  vertex(640,460);
  endShape(CLOSE);

  beginShape();
  vertex(640,460);
  vertex(680,450);
  vertex(690,530);
  vertex(650,520);
  endShape(CLOSE);
      
  beginShape();
  vertex(650,520);
  vertex(690,530);
  vertex(680,600);
  vertex(640,590);
  endShape(CLOSE);

  beginShape();
  vertex(640,590);
  vertex(680,600);
  vertex(690,670);
  vertex(650,660);
  endShape(CLOSE);
        
  beginShape();
  vertex(650,660);
  vertex(690,670);
  vertex(680,740);
  vertex(640,730);
  endShape(CLOSE);

  beginShape();
  vertex(640,730);
  vertex(680,740);
  vertex(690,810);
  vertex(650,800);
  endShape(CLOSE);
          
  beginShape();
  vertex(650,800);
  vertex(690,810);
  vertex(670,880);
  vertex(630,870);
  endShape(CLOSE);
    
}*/



/** volcanoErupt()
 * This method starts a volcanic eruption.
 *
 * @param none
 * @return none
 */
void volcanoErupt(){
  fill(255,150,0); 
  arc(screenWidth/2, 228, 275, 55, 0, 2*PI);
  
  stroke(250,102,0); // stroke orange
  //creates 100 lines for explosion
  for (int j = 0; j < 100; j++){
    if (night == true && j % 2 == 0){
      stroke(80,0,220);
      //stroke(250,102,0);
    }
    else{
      stroke(250,102,0);
    }
    float lineX = random(585,850);
    
    //creates each line
    for (int k = 228; k > 0; k = k - 1){
      line(lineX,228,lineX,k);
    }
  }
  
  volcano_erupted = true;
  
}



/** delayTime()
 * This method delays the program for whatever the input number of milliseconds is.
 *
 * @param wait(int) - number of milliseconds to wait
 * @return none
 */
void delayTime(int wait){
  time = millis();
  
  if (millis() - time >= wait){
    println("tick");
  }
  
}



/** lavaDrop()
 * This method drops lava at random x-coordinates.
 *
 * @param none
 * @return none
 */
void lavaDrop(){
  for (int j = 0; j < 5; j++){
    for (int i = 0; i < 3; i++){
      translate(sphereX,sphereY);
      fill(255,255,18,lavaDrop_opacity);
      strokeWeight(5);
      stroke(250,102,0,lavaDrop_opacity);
      line(0,-30,0,-150);
      line(-15,-25,-15,-135);
      line(15,-25,15,-135);
      strokeWeight(1);
      stroke(250,102,0,lavaDrop_opacity);
      sphere(30);
      
      sphereY = sphereY + yspeed;
      yspeed = yspeed + gravity;
      
      lavaDrop_opacity = lavaDrop_opacity + 1;
      
      if (sphereY > screenHeight){
        lavaReset();
      }
    }
  }
    
}



/** lavaReset()
 * This method resets variables for lavaDrop().
 *
 * @param none
 * @return none
 */
void lavaReset(){
  sphereX = random(0,800);;
  sphereY = 0;

  yspeed = 0;
  xspeed = 0;
  gravity = 0.05;
  
  lavaDrop_opacity = 0;
}



/** dayScreen()
 * This method draw the sun and clouds for day time
 *
 * @param none
 * @return none
 */
void dayScreen(){
  background(0,255,240);
  
  // sun
  fill(255,255,18); // fill yellow
  stroke(255,255,100); //stroke yellow
  for (int d = 0; d < 360; d = d + 30){
    line(150, 150, 130 * cos(radians(d)) + 150, 130 * sin(radians(d)) + 150);
  }
  stroke(0);
  ellipse(150,150,200,200);
  
  // clouds
  noStroke();
  fill(255); 
  ellipse(450,100,100,30);
  ellipse(450,120,150,50);
  ellipse(450,140,100,30);
  
  ellipse(1150,120,100,30);
  ellipse(1150,140,150,50);
  ellipse(1150,160,100,30);
  
  volcanoShape();
  night = false;
  drawPath("Black");

}



/** nightScreen()
 * This method draws the moon and stars for night time
 *
 * @param none
 * @return none
 */
void nightScreen(){
  background(80,0,220);
  fill(245,241,131); // yellow
  stroke(0);
  randomSeed(0); // keeps stars in the same position and same sequence
  
  // stars
  for (int i = 0; i < 800; i++){
    float x = random(0,1440);
    float y = random(0,300);
    
    //if (
    beginShape();
    vertex(x,y-5);
    vertex(x-1,y-1);
    vertex(x-5,y-1);
    vertex(x-2,y+1);
    vertex(x-3,y+5);
    vertex(x,y+3);
    vertex(x+3,y+5);
    vertex(x+2,y+1);
    vertex(x+5,y-1);
    vertex(x+1,y-1);
    endShape(CLOSE);
  }
    
    // moon
    fill(0);
    stroke(0);
    ellipse(1290,150,200,200);
    fill(255,255,220); // whitish-yellow
    ellipse(1290,150,180,180);
    
    volcanoShape();
    drawPath("Black");
    night = true;

}