/** Tic-Tac-Toe
 * 
 * Tic-Tac-Toe game
 * @author Aniruddha Murali
 * @since 9/6/15
 * modification history
 * 9/6/15 - Initial version
 * 9/7/15 - Home screen and exit button added
 * @copyright Aniruddha Murali
 *
 */


int toggle = round(random(0,1)); // switches between X's and O's -> X = 0 and O = 1

// cell values are equal to either one of the toggle values, or
// beginning cell value is 9(none)
int cell1 = 9;
int cell2 = 9;
int cell3 = 9;
int cell4 = 9;
int cell5 = 9;
int cell6 = 9;
int cell7 = 9;
int cell8 = 9;
int cell9 = 9;

// boolean variables to check whether each cell has a shape or not in it
boolean cell1_filled = false;
boolean cell2_filled = false;
boolean cell3_filled = false;
boolean cell4_filled = false;
boolean cell5_filled = false;
boolean cell6_filled = false;
boolean cell7_filled = false;
boolean cell8_filled = false;
boolean cell9_filled = false;

//indicates whether or not screen 2 is being displayed
boolean homeScreen = true;
boolean playScreen = false;
boolean gameOverScreen = false;

int loopCount = 0;

boolean debug = false;

//font for text
PFont calibriFont;



void setup(){
  size(800,800);
  calibriFont = createFont("Calibri-Bold", 50, true);
  background(255);
}


void draw(){
  if (playScreen == true){
    play();
  }
  else if (homeScreen == true){
    home_screen();
  }
  else if (gameOverScreen == true){
    //game_over();
  }
  else{
    println("No screen to display");
  }
}


void reset(){
  background(200);
  toggle = round(random(0,1)); // switches between X's and O's -> X = 0 and O = 1

  // cell values are equal to either one of the toggle values, or
  // beginning cell value is 9(none)
  cell1 = 9;
  cell2 = 9;
  cell3 = 9;
  cell4 = 9;
  cell5 = 9;
  cell6 = 9;
  cell7 = 9;
  cell8 = 9;
  cell9 = 9;
  
  // boolean variables to check whether each cell has a shape or not in it
  cell1_filled = false;
  cell2_filled = false;
  cell3_filled = false;
  cell4_filled = false;
  cell5_filled = false;
  cell6_filled = false;
  cell7_filled = false;
  cell8_filled = false;
  cell9_filled = false;
  
  loopCount = 0;
  if (toggle == 0){
  println("Player X goes first.");
  }
  else if (toggle == 1){
    println("Player O goes first.");
  }
}


void play(){
  strokeWeight(10);
  line(800/3, 0, 800/3, 800);
  line(800*2/3, 0, 800*2/3, 800);
  line(0, 800/3, 800, 800/3);
  line(0, 800*2/3, 800, 800*2/3);
  
  
  //cell1 = cell2 = cell3
  if (cell1 == cell2 && cell2 == cell3){
    if (cell1 == 0){
        game_over(0);
    }
    else if (cell1 == 1){
        game_over(1);
    }
  }
  
  //cell4 = cell5 = cell6
  else if (cell4 == cell5 && cell5 == cell6){
    if (cell4 == 0){
        game_over(0);
    }
    else if (cell4 == 1){
        game_over(1);
    }
  }
  
  //cell7 = cell8 = cell 9
  else if (cell7 == cell8 && cell8 == cell9){
    if (cell7 == 0){
        game_over(0);
    }
    else if (cell7 == 1){
        game_over(1);
    }
  }
  
  //cell1 = cell4 = cell7
  else if (cell1 == cell4 && cell4 == cell7){
    if (cell1 == 0){
        game_over(0);
    }
    else if (cell1 == 1){
        game_over(1);
    }
  }
  
  //cell2 = cell5 = cell8
  else if (cell2 == cell5 && cell5 == cell8){
    if (cell2 == 0){
        game_over(0);
    }
    else if (cell2 == 1){
        game_over(1);
    }
  }
  
  //cell3 = cell6 = cell9
  else if (cell3 == cell6 && cell6 == cell9){
    if (cell3 == 0){
        game_over(0);
    }
    else if (cell3 == 1){
        game_over(1);
    }

  }
  
  //cell1 = cell5 = cell9
  else if (cell1 == cell5 && cell5 == cell9){
    if (cell1 == 0){
        game_over(0);
    }
    else if (cell1 == 1){
        game_over(1);
    }
  }
  
  //cell3 = cell5 = cell7
  else if (cell3 == cell5 && cell5 == cell7){
    if (cell3 == 0){
        game_over(0);
    }
    else if (cell3 == 1){
        game_over(1);
    }
  }
  
  //no one wins
  else {
    if (loopCount == 9){
        game_over(2);
    }
  }
}





void mouseClicked(){
  //drawing X's
  if (toggle == 0){
    //cell 1
    if (mouseX > 0 && mouseX < 800/3 && mouseY > 0 && mouseY < 800/3 && cell1_filled == false){
      line(width/6, height/6, width/12, height/12);
      line(width/6, height/6, width/4, height/12);
      line(width/6, height/6, width/4, height/4);
      line(width/6, height/6, width/12, height/4);
      cell1 = 0;
      cell1_filled = true;
      toggle = 1;
      loopCount = loopCount + 1;
    }
    //cell 2
    else if (mouseX > 800/3 && mouseX < 1600/3 && mouseY > 0 && mouseY < 800/3 && cell2_filled == false){
      line(width/6 + 800/3, height/6, width/12 + 800/3, height/12);
      line(width/6 + 800/3, height/6, width/4 + 800/3, height/12);
      line(width/6 + 800/3, height/6, width/4 + 800/3, height/4);
      line(width/6 + 800/3, height/6, width/12 + 800/3, height/4);
      cell2 = 0;
      cell2_filled = true;
      toggle = 1;
      println(loopCount);
      loopCount = loopCount + 1;
    }
    //cell 3
    else if (mouseX > 1600/3 && mouseX < 800 && mouseY > 0 && mouseY < 800/3 && cell3_filled == false){
      line(width/6 + 1600/3, height/6, width/12 + 1600/3, height/12);
      line(width/6 + 1600/3, height/6, width/4 + 1600/3, height/12);
      line(width/6 + 1600/3, height/6, width/4 + 1600/3, height/4);
      line(width/6 + 1600/3, height/6, width/12 + 1600/3, height/4);
      cell3 = 0;
      cell3_filled = true;
      toggle = 1;
      println(loopCount);
      loopCount = loopCount + 1;
    }
    //cell 4
    else if (mouseX > 0 && mouseX < 800/3 && mouseY > 800/3 && mouseY < 1600/3 && cell4_filled == false){
      line(width/6, height/6 + 800/3, width/12, height/12 + 800/3);
      line(width/6, height/6 + 800/3, width/4, height/12 + 800/3);
      line(width/6, height/6 + 800/3, width/4, height/4 + 800/3);
      line(width/6, height/6 + 800/3, width/12, height/4 + 800/3);
      cell4 = 0;
      cell4_filled = true;
      toggle = 1;
      println(loopCount);
      loopCount = loopCount + 1;
    }
    //cell 5
    else if (mouseX > 800/3 && mouseX < 1600/3 && mouseY > 800/3 && mouseY < 1600/3 && cell5_filled == false){
      line(width/6 + 800/3, height/6 + 800/3, width/12 + 800/3, height/12 + 800/3);
      line(width/6 + 800/3, height/6 + 800/3, width/4 + 800/3, height/12 + 800/3);
      line(width/6 + 800/3, height/6 + 800/3, width/4 + 800/3, height/4 + 800/3);
      line(width/6 + 800/3, height/6 + 800/3, width/12 + 800/3, height/4 + 800/3);
      cell5 = 0;
      cell5_filled = true;
      toggle = 1;
      println(loopCount);
      loopCount = loopCount + 1;
    }
    //cell 6
    else if (mouseX > 1600/3 && mouseX < 800 && mouseY > 800/3 && mouseY < 1600/3 && cell6_filled == false){
      line(width/6 + 1600/3, height/6 + 800/3, width/12 + 1600/3, height/12 + 800/3);
      line(width/6 + 1600/3, height/6 + 800/3, width/4 + 1600/3, height/12 + 800/3);
      line(width/6 + 1600/3, height/6 + 800/3, width/4 + 1600/3, height/4 + 800/3);
      line(width/6 + 1600/3, height/6 + 800/3, width/12 + 1600/3, height/4 + 800/3);
      cell6 = 0; 
      cell6_filled = true;
      toggle = 1;
      println(loopCount);
      loopCount = loopCount + 1;
    }
    //cell 7
    else if (mouseX > 0 && mouseX < 800/3 && mouseY > 1600/3 && mouseY < 800 && cell7_filled == false){
      line(width/6, height/6 + 1600/3, width/12, height/12 + 1600/3);
      line(width/6, height/6 + 1600/3, width/4, height/12 + 1600/3);
      line(width/6, height/6 + 1600/3, width/4, height/4 + 1600/3);
      line(width/6, height/6 + 1600/3, width/12, height/4 + 1600/3);
      cell7 = 0;
      cell7_filled = true;
      toggle = 1;
      println(loopCount);
      loopCount = loopCount + 1;
    }
    //cell 8
    else if (mouseX > 800/3 && mouseX < 1600/3 && mouseY > 1600/3 && mouseY < 800 && cell8_filled == false){
      line(width/6 + 800/3, height/6 + 1600/3, width/12 + 800/3, height/12 + 1600/3);
      line(width/6 + 800/3, height/6 + 1600/3, width/4 + 800/3, height/12 + 1600/3);
      line(width/6 + 800/3, height/6 + 1600/3, width/4 + 800/3, height/4 + 1600/3);
      line(width/6 + 800/3, height/6 + 1600/3, width/12 + 800/3, height/4 + 1600/3);
      cell8 = 0;
      cell8_filled = true;
      toggle = 1;
      println(loopCount);
      loopCount = loopCount + 1;
    }
    //cell 9
    else if (mouseX > 1600/3 && mouseX < 800 && mouseY > 1600/3 && mouseY < 800 && cell9_filled == false){
      line(width/6 + 1600/3, height/6 + 1600/3, width/12 + 1600/3, height/12 + 1600/3);
      line(width/6 + 1600/3, height/6 + 1600/3, width/4 + 1600/3, height/12 + 1600/3);
      line(width/6 + 1600/3, height/6 + 1600/3, width/4 + 1600/3, height/4 + 1600/3);
      line(width/6 + 1600/3, height/6 + 1600/3, width/12 + 1600/3, height/4 + 1600/3);
      cell9 = 0;
      cell9_filled = true;
      toggle = 1;
      println(loopCount);
      loopCount = loopCount + 1;
    }
  }
    
  //drawing O's
  else if (toggle == 1){
    ellipseMode(CENTER);
    fill(200);
    //cell 1
    if (mouseX > 0 && mouseX < 800/3 && mouseY > 0 && mouseY < 800/3 && cell1_filled == false){
      ellipse(width/6, height/6, 400/3, 400/3);
      cell1 = 1;
      cell1_filled = true;
      toggle = 0;
      println(loopCount);
      loopCount = loopCount + 1;
    }
    //cell 2
    else if (mouseX > 800/3 && mouseX < 1600/3 && mouseY > 0 && mouseY < 800/3 && cell2_filled == false){
      ellipse(width/6 + 800/3, height/6, 400/3, 400/3);
      cell2 = 1;
      cell2_filled = true;
      toggle = 0;
      println(loopCount);
      loopCount = loopCount + 1;
    }
    //cell 3
    else if (mouseX > 1600/3 && mouseX < 800 && mouseY > 0 && mouseY < 800/3 && cell3_filled == false){
      ellipse(width/6 + 1600/3, height/6, 400/3, 400/3);
      cell3 = 1;
      cell3_filled = true;
      toggle = 0;
      println(loopCount);
      loopCount = loopCount + 1;
    }
    //cell4
    else if (mouseX > 0 && mouseX < 800/3 && mouseY > 800/3 && mouseY < 1600/3 && cell4_filled == false){
      ellipse(width/6, height/6 + 800/3, 400/3, 400/3);
      cell4 = 1;
      cell4_filled = true;
      toggle = 0;
      println(loopCount);
      loopCount = loopCount + 1;
    }
    else if (mouseX > 800/3 && mouseX < 1600/3 && mouseY > 800/3 && mouseY < 1600/3 && cell5_filled == false){
      ellipse(width/6 + 800/3, height/6 + 800/3, 400/3, 400/3);
      cell5 = 1;
      cell5_filled = true;
      toggle = 0;
      println(loopCount);
      loopCount = loopCount + 1;
    }
    else if (mouseX > 1600/3 && mouseX < 800 && mouseY > 800/3 && mouseY < 1600/3 && cell6_filled == false){
      ellipse(width/6 + 1600/3, height/6 + 800/3, 400/3, 400/3);
      cell6 = 1; 
      cell6_filled = true;
      toggle = 0;
      println(loopCount);
      loopCount = loopCount + 1;
    }
    else if (mouseX > 0 && mouseX < 800/3 && mouseY > 1600/3 && mouseY < 800 && cell7_filled == false){
      ellipse(width/6, height/6 + 1600/3, 400/3, 400/3);
      cell7 = 1;
      cell7_filled = true;
      toggle = 0;
      println(loopCount);
      loopCount = loopCount + 1;
    }
    else if (mouseX > 800/3 && mouseX < 1600/3 && mouseY > 1600/3 && mouseY < 800 && cell8_filled == false){
      ellipse(width/6 + 800/3, height/6 + 1600/3, 400/3, 400/3);
      cell8 = 1;
      cell8_filled = true;
      toggle = 0;
      println(loopCount);
      loopCount = loopCount + 1;
    }
    else if (mouseX > 1600/3 && mouseX < 800 && mouseY > 1600/3 && mouseY < 800 && cell9_filled == false){
      ellipse(width/6 + 1600/3, height/6 + 1600/3, 400/3, 400/3);
      cell9 = 1;
      cell9_filled = true;
      toggle = 0;
      println(loopCount);
      loopCount = loopCount + 1;
    }
  }
  
  //play button on home screen
  if (homeScreen == true){
    if (mouseX > 275 && mouseX < 525 && mouseY > 400 && mouseY < 500){
      reset();
      homeScreen = false;
      playScreen = true;
      gameOverScreen = false;
      loop();
      
    }
  }
  //buttons on game over screen
  if (gameOverScreen == true){
    //reset button
    if (mouseX > 75 && mouseX < 325 && mouseY > 400 && mouseY < 500){
      reset();
      homeScreen = false;
      playScreen = true;
      gameOverScreen = false;
      loop();
    }
    
    //exit button
    if (mouseX > 475 && mouseX < 725 && mouseY > 400 && mouseY < 500){
      reset();
      homeScreen = true;
      playScreen = false;
      gameOverScreen = false;
      loop();
    }
  }  
  
}



void keyPressed(){
  if (key == 'r' || key == 'R'){
    reset();
    homeScreen = false;
    playScreen = true;
    gameOverScreen = false;
    loop();
  }
  
  if (key == 'p' || key == 'P'){
    reset();
    homeScreen = false;
    playScreen = true;
    gameOverScreen = false;
    loop();
  }
  
  if (key == 'e' || key == 'E'){
    reset();
    homeScreen = true;
    playScreen = false;
    gameOverScreen = false;
    loop();
  }
}


// constructs home screen with play button
void home_screen(){
  homeScreen = true;
  playScreen = false;
  gameOverScreen = false;
  
  background(245);
  fill(0);
  strokeWeight(10);
  stroke(100);
  rectMode(CENTER);
  rect(408,125,600,125);
  textFont(calibriFont,100);
  textAlign(CENTER,CENTER);
  fill(0,0,255);
  text("Tic",200,100);
  fill(245,230,18);
  text("-",300,100);
  fill(255,0,0);
  text("Tac",400,100);
  fill(245,130,18);
  text("-",500,100);
  fill(0,255,0);
  text("Toe",600,100);
  
  //play button
  fill(0);
  rectMode(CENTER);
  rect(400,450,250,100);
  fill(255);
  textFont(calibriFont,50);
  textAlign(CENTER,CENTER);
  text("Play",400,440);
  
  //instructions
  textFont(calibriFont,30);
  fill(0);
  text("(Click PLAY or Press 'p' to play)", 400,540);
  
  stroke(0);
  noLoop();
}



//constructs game over screen with winner(or tie), the reset button, and the exit button
void game_over(int winner){
  homeScreen = false;
  playScreen = false;
  gameOverScreen = true;
  
  String message;
  if (winner == 0){
    message = "Player X Wins!";
  }
  else if (winner == 1){
    message = "Player O Wins!";
  }
  else if (winner == 2){
    message = "It's a tie...";
  }
  else{
    message = "An error occured...";
  }
  
  // winner or tied message
  background(245);
  fill(0);
  textFont(calibriFont);
  textAlign(CENTER, CENTER);
  text(message, 400, 300);
  
  //reset button
  rectMode(CENTER);
  rect(200,450,250,100);
  fill(255);
  textFont(calibriFont,50);
  textAlign(CENTER,CENTER);
  text("RESET",200,440);
  
  //exit to home screen button
  fill(0);
  rectMode(CENTER);
  rect(600,450,250,100);
  fill(255);
  textFont(calibriFont,50);
  textAlign(CENTER,CENTER);
  text("EXIT",600,440);
  
  //instructions
  textFont(calibriFont,30);
  fill(0);
  text("(Click RESET, Click EXIT, Press 'r' to reset, or Press 'e' to exit)", 400,540);
  
  noLoop();
}
