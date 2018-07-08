/**
* Truck
* Illustration of Project Still Life
*
* @author Aniruddha Murali 
* @since 9/1/15
*/



PFont f;

void setup(){
  size(600,600);
  background(120,255,255);
  f = createFont("Arial", 30, true);
}


void draw(){
  //dark gray road
  fill(150);
  rectMode(CORNERS);
  rect(0,350,600,500);
  
  //white dashes on the road
  fill(255);
  rectMode(CENTER);
  for(int xcoord = 75; xcoord < 600; xcoord = xcoord + 200){
    rect(xcoord,425,100,25);
  }
  
  //truck structure
  rectMode(CORNERS);
  fill(220);
  stroke(255);
  rect(0,150,350,400);
  triangle(350,200,350,400,500,400);
  rect(500,400,462,350);
  stroke(220);
  line(462,350,462,400);
  stroke(225);
  fill(120,255,255);
  rect(355,270,395,315);
  
  //truck wheels
  ellipseMode(CENTER);
  fill(0);
  ellipse(75,425,75,75);
  ellipse(350,425,75,75);
  fill(100);
  ellipse(75,425,50,50);
  ellipse(350,425,50,50);
  
  //UPS Text
  fill(220);
  stroke(0);
  rect(160,365,220,400);
  textFont(f,20);
  fill(0);
  text("UPS",170,390);

  //UPS
  //U
  fill(220);
  stroke(147,132,89);
  line(30,200,30,350);
  arc(67.5, 350, 75, 25, radians(0), radians(180), OPEN);
  line(105,350,105,200);
  line(105,200,85,200);
  line(85,200,85,330);
  arc(67.5, 330, 35, 15, radians(0), radians(180), OPEN);
  line(50,330,50,200);
  line(50,200,30,200);
  
  //P
  line(135,200,135,360);
  line(135,360,155,360);
  line(155,360,155,280);
  arc(155, 240, 90, 80, radians(-90), radians(90), OPEN);
  line(155,200,135,200);
  line(150,210,150,270);
  arc(150, 240, 67.5, 60, radians(-90), radians(90), CLOSE);
  
  //S
  arc(265, 240, 90, 90, radians(-225), radians(0), OPEN);
  arc(265, 240, 60, 60, radians(-225), radians(0), OPEN);
  arc(265, 320, 90, 90, radians(-45), radians(180), OPEN);
  arc(265, 320, 60, 60, radians(-45), radians(180), OPEN);
  line(231,270,288,299);
  line(241,260,299,290);
  line(220,320,235,320);
  line(295,240,310,240);
}


