int colorSquares_x = 30;
int first_square_y = 180;
int colorSquare_length = 100;
int second_colorSquares_x = 150;

int strokeRect_x = 30;
int strokeRect_y = 30;
int stroke_weight = 1;
int first_stroke_x = 80;
int stroke_y1 = 50;
int stroke_y2 = 110;

int stroke_color1 = 0;
int stroke_color2 = 0;
int stroke_color3 = 0;

int current_stroke_weight;


void setup(){
  size(displayWidth,displayHeight);
  background(170);
  strokeWeight(1);
}


void draw(){
  rectMode(CORNER);
  strokeWeight(8);
  stroke(0);
  
  //color squares setup
  //first column of color squares
  fill(0);
  rect(colorSquares_x, first_square_y, colorSquare_length, colorSquare_length);
  fill(255,0,0);
  rect(colorSquares_x, first_square_y + 120, colorSquare_length, colorSquare_length);
  fill(250,243,18);
  rect(colorSquares_x, first_square_y + 240, colorSquare_length, colorSquare_length);
  fill(0,0,255);
  rect(colorSquares_x, first_square_y + 360, colorSquare_length, colorSquare_length);
  
  //second column of color squares
  fill(255);
  rect(second_colorSquares_x, first_square_y, colorSquare_length, colorSquare_length);
  fill(245,130,22);
  rect(second_colorSquares_x, first_square_y + 120, colorSquare_length, colorSquare_length);
  fill(0,255,0);
  rect(second_colorSquares_x, first_square_y + 240, colorSquare_length, colorSquare_length);
  fill(133,22,245);
  rect(second_colorSquares_x, first_square_y + 360, colorSquare_length, colorSquare_length);
  
  
  //eraser setup
  fill(170);
  rect(90,680,100,100);
  strokeWeight(1);
  fill(255);
  rect(110,740,35,20);
  beginShape();
  vertex(110,740);
  vertex(140,700);
  vertex(175,700);
  vertex(145,740);
  endShape(CLOSE);
  beginShape();
  vertex(175,700);
  vertex(175,720);
  vertex(145,760);
  vertex(145,740);
  endShape(CLOSE);

  
  
  //line strokes setup
  //squares for areas where you can click to choose the stroke weight
  for (int i = 1; i <= 10; i = i + 1){
    fill(50,0);
    rect(strokeRect_x, strokeRect_y, 100, 100);
    strokeRect_x = strokeRect_x + 140;
  }
  strokeRect_x = 30;
  
  //strokes for selection
  strokeWeight(1);

  for (int n = 1; n <= 10; n = n + 1){
    strokeWeight(stroke_weight);
    line(first_stroke_x + 140 * (n-1), stroke_y1, first_stroke_x + 140 * (n-1), stroke_y2);
    stroke_weight = stroke_weight + 1;
  }
  int first_stroke_x = 80;
  int stroke_y1 = 40;
  int stroke_y2 = 90;
  stroke_weight = 1;
  
  
  //line drawing
  if (mousePressed == true) {
    stroke(stroke_color1, stroke_color2, stroke_color3);
    strokeWeight(current_stroke_weight);
    
    //non-drawing regions
    if (mouseX < 270 || mouseY < 150){
      stroke(170);
    }
    
    //eraser
    else if (stroke_color1 == 170 && stroke_color2 == 170 && stroke_color3 == 170){
      strokeWeight(100);
      line(pmouseX,pmouseY,mouseX,mouseY);
    }
    
    //drawing line
    else{
      line(pmouseX,pmouseY,mouseX,mouseY);
    }
  }
  stroke_weight = 1;
  
}


void mouseClicked(){
  //line color selection
  //black line color selection
  if (mouseX > colorSquares_x && mouseX < colorSquares_x + 100 && mouseY > first_square_y && mouseY < first_square_y + 100){
    stroke_color1 = 0;
    stroke_color2 = 0;
    stroke_color3 = 0;

  }
  //white line color selection
  else if (mouseX > second_colorSquares_x && mouseX < second_colorSquares_x + 100  && mouseY > first_square_y && mouseY < first_square_y + 100){
    stroke_color1 = 255;
    stroke_color2 = 255;
    stroke_color3 = 255;
  }

  //red line color selection
  else if (mouseX > colorSquares_x && mouseX < colorSquares_x + 100 && mouseY > first_square_y + 120 && mouseY < first_square_y + 220){
    stroke_color1 = 255;
    stroke_color2 = 0;
    stroke_color3 = 0;
  }
 
  //orange line color selection
  else if (mouseX > second_colorSquares_x && mouseX < second_colorSquares_x + 100  && mouseY > first_square_y + 120 && mouseY < first_square_y + 220){
    stroke_color1 = 245;
    stroke_color2 = 130;
    stroke_color3 = 22;
  }

  //yellow line color selection
  else if (mouseX > colorSquares_x && mouseX < colorSquares_x + 100 && mouseY > first_square_y + 240 && mouseY < first_square_y + 340){
    stroke_color1 = 250;
    stroke_color2 = 243;
    stroke_color3 = 18;
  }  
  
  //green line color selection
  else if (mouseX > second_colorSquares_x && mouseX < second_colorSquares_x + 100 && mouseY > first_square_y + 240 && mouseY < first_square_y + 340){
    stroke_color1 = 0;
    stroke_color2 = 255;
    stroke_color3 = 0;
  }
  
  //blue line color selection
  else if (mouseX > colorSquares_x && mouseX < colorSquares_x + 100 && mouseY > first_square_y + 360 && mouseY < first_square_y + 460){
    stroke_color1 = 0;
    stroke_color2 = 0;
    stroke_color3 = 255;
  }
  
  //purple line color selection
  else if (mouseX > second_colorSquares_x && mouseX < second_colorSquares_x + 100 && mouseY > first_square_y + 360 && mouseY < first_square_y + 460){
    stroke_color1 = 133;
    stroke_color2 = 22;
    stroke_color3 = 245;
  }
  
  
  //stroke weight selection
  //stroke weight 1 selection
  if (mouseX > strokeRect_x && mouseX < strokeRect_x + 100 && mouseY > strokeRect_y && mouseY < strokeRect_y + 100){
    current_stroke_weight = 1;
  }
  
  //stroke weight 2 selection
  if (mouseX > strokeRect_x + 140 && mouseX < strokeRect_x + 240 && mouseY > strokeRect_y && mouseY < strokeRect_y + 100){
    current_stroke_weight = 2;
  }
  
  //stroke weight 3 selection
  if (mouseX > strokeRect_x + 280 && mouseX < strokeRect_x + 380 && mouseY > strokeRect_y && mouseY < strokeRect_y + 100){
    current_stroke_weight = 3;
  }
  
  //stroke weight 4 selection
  if (mouseX > strokeRect_x + 420 && mouseX < strokeRect_x + 520 && mouseY > strokeRect_y && mouseY < strokeRect_y + 100){
    current_stroke_weight = 4;
  }
  
  //stroke weight 5 selection
  if (mouseX > strokeRect_x + 560 && mouseX < strokeRect_x + 660 && mouseY > strokeRect_y && mouseY < strokeRect_y + 100){
    current_stroke_weight = 5;
  }
  
  //stroke weight 6 selection
  if (mouseX > strokeRect_x + 700 && mouseX < strokeRect_x + 800 && mouseY > strokeRect_y && mouseY < strokeRect_y + 100){
    current_stroke_weight = 6;
  }
  
  //stroke weight 7 selection
  if (mouseX > strokeRect_x + 840 && mouseX < strokeRect_x + 940 && mouseY > strokeRect_y && mouseY < strokeRect_y + 100){
    current_stroke_weight = 7;
  }
  
  //stroke weight 8 selection
  if (mouseX > strokeRect_x + 980 && mouseX < strokeRect_x + 1080 && mouseY > strokeRect_y && mouseY < strokeRect_y + 100){
    current_stroke_weight = 8;
  }
  
  //stroke weight 9 selection
  if (mouseX > strokeRect_x + 1120 && mouseX < strokeRect_x + 1220 && mouseY > strokeRect_y && mouseY < strokeRect_y + 100){
    current_stroke_weight = 9;
  }
  
  //stroke weight 10 selection
  if (mouseX > strokeRect_x + 1260 && mouseX < strokeRect_x + 1360 && mouseY > strokeRect_y && mouseY < strokeRect_y + 100){
    current_stroke_weight = 10;
  }
  
  
  //eraser selection
  if (mouseX > 90 && mouseX < 190 && mouseY > 680 && mouseY < 780){
    stroke_color1 = 170;
    stroke_color2 = 170;
    stroke_color3 = 170;
  }
}

