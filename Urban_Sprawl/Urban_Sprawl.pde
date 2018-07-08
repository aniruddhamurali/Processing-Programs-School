/* *****************************************************************************
 * * AP COMPUTER SCIENCE PRINCIPLES - 2017 INTERACTING WITH CLASSES ASSIGNMENT * 
 * * THEME: URBAN SPRAWL                                                       *
 * * PROJECT: MARIO IN AN URBAN CITY                                           *
 * *****************************************************************************
 * Program files list (Urban_Sprawl.zip):
 * -------------------
 * Urban_Sprawl.pde       - Main program file
 * Brick.pde              - Brick Class
 * Building.pde           - Building Superclass
 * Car.pde                - Car Class
 * Cloud.pde              - Cloud Class
 * Enemy.pde              - Enemy Superclass
 * Fireball.pde           - Fireball Class
 * Goomba.pde             - Goomba Class
 * Images.pde             - Images Function
 * LightedBuilding.pde    - LightedBuilding Class
 * Mario.pde              - Mario Class
 * Moon.pde               - Moon Class
 * Pipe.pde               - Pipe Class
 * Pit.pde                - Pit Class
 * Scenery.pde            - Scenery Class
 * Sun.pde                - Sun Class
 *
 * Required libraries:
 * -------------------
 * Minim - Library for audio
 *
 * Installing "Minim": 
 * -----------------
 * Step 1: Launch Processing Application
 * Step 2: Select Sketch --> Import Library --> Add Library
 * Step 3: Search for "Minim" and install the library
 * Step 4: You can now run the program
 * ***********************************************************
 */
 
 /**
 * Controls:
 * --------------------
 * left arrow: move left
 * right arrow: move right
 * up arrow: jump
 * down arrow: crouch if you're not small
 * f key: shoot fireballs when you have the fire flower power-up
 * shift: increase Mario's speed
 * mouse clicked: toggles music on and off
 */
 

/** Urban_Sprawl
 * User can play Mario in an urban city
 * Theme: Urban Sprawl
 *
 * @author Aniruddha Murali
 * @version 1.0
 * @since September 24, 2017
 *
 */


// importing minim libraries
// the Minim library is used to play sounds
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer overworldMusic;
AudioPlayer hurryOverworldMusic;
AudioPlayer coinMusic;
AudioPlayer oneUpMusic;
AudioPlayer powerUpAppearsMusic;
AudioPlayer powerUpMusic;
AudioPlayer levelClearMusic;
AudioPlayer gameOverMusic;
AudioPlayer carHonk;


Mario mario;
int marioGround;    //576
int buildingGround; //360
boolean musicOn = true; // toggle variable to turn music on and off
int numberCars = 1; // number of cars on each side of the road
PFont f;

// ArrayLists of instances
ArrayList<LightedBuilding> buildings = new ArrayList<LightedBuilding>();
ArrayList<Brick> bricks = new ArrayList<Brick>();
ArrayList<Pipe> pipes = new ArrayList<Pipe>();
ArrayList<Goomba> goombas = new ArrayList<Goomba>();
ArrayList<Pit> pits = new ArrayList<Pit>();
ArrayList<Scene> scenes = new ArrayList<Scene>();
ArrayList<Fireball> fireballs = new ArrayList<Fireball>();
ArrayList<Car> leftCars = new ArrayList<Car>();
ArrayList<Car> rightCars = new ArrayList<Car>();



// instances for the setting
Sun sun = new Sun(110, 110, 70);
Moon moon = new Moon(1170, 110, 70);
Cloud cloud1 = new Cloud(450, 60, 150, 50, 3);
Cloud cloud2 = new Cloud(1150, 160, 150, 50, 6);



void setup() {
  background(107,140,255); 
  size(1280,720);
  f = createFont("Emulogic.vlw", 30);
  
  marioGround = height*4/5-3;
  buildingGround = 360;
  mario = new Mario(width/4, marioGround-32);
  images();
  instances();
  
  // open music files
  minim = new Minim(this);
  overworldMusic = minim.loadFile("OverworldTheme.mp3");
  hurryOverworldMusic = minim.loadFile("hurry-overworld.mp3");
  coinMusic = minim.loadFile("coin.wav");
  oneUpMusic = minim.loadFile("1-up.mp3");
  powerUpAppearsMusic = minim.loadFile("power-up_appears.wav");
  powerUpMusic = minim.loadFile("power-up.wav");
  carHonk = minim.loadFile("car-honk.mp3");
  
  // set the volume of each music file - reduces sound of overworld music compared to the other music files
  overworldMusic.setVolume(0.1);
  coinMusic.setVolume(0.5);
  oneUpMusic.setVolume(0.5);
  powerUpAppearsMusic.setVolume(0.5);
  powerUpMusic.setVolume(0.5);
  carHonk.setVolume(0.5);
  
  overworldMusic.play();
  overworldMusic.loop();

  // create building instances and add to buildings ArrayList
  for (int i = 0; i < 30; i++) {
    buildings.add(new LightedBuilding(200+round(random(200, 300)*i), round(random(50,210)), "t1"));
  }
  for (int i = 0; i < 30; i++) {
    buildings.add(new LightedBuilding(150+round(random(150, 250)*i), round(random(50,210)), "t2"));
  }
  for (int i = 0; i < 20; i++) {
    buildings.add(new LightedBuilding(100+round(random(250, 350)*i), round(random(50,210)), "t3"));
  }
  
  // create car instances and add to leftCars and rightCars ArrayLists
  for (int i = 0; i < 5; i++) {
    if (i % 2 == 0) leftCars.add(new Car(200+round(random(200, 600)*i), 370, round(random(0,1.4))));
    else leftCars.add(new Car(200+round(random(200, 600)*i), 320, round(random(0,1.4))));
  }
  for (int i = 0; i < 5; i++) {
    if (i % 2 == 0) rightCars.add(new Car(200+round(random(200, 600)*i), 480, round(random(1.6,3.4))));
    else rightCars.add(new Car(200+round(random(200, 600)*i), 430, round(random(1.6,3.4))));
  }
  
}



/** draw()
 * This method is the main method that executes the whole program
 *
 * @param none
 * @return none
 */
void draw() {
  
  // mouseX determines whether setting is day or night
  if (mouseX <= width/2) dayMode();
  else nightMode();
  
  translate(-mario.x+400, 0);
  pushMatrix();
  translate(mario.x-400, 0);
  popMatrix();

  // displays the buildings with lights
  for (int i = 0; i < buildings.size(); i++) {
    LightedBuilding b = buildings.get(i);
    b.display();
    b.displayLights();
  }
  
  // display and move cars on the road
  for (int i = 0; i < leftCars.size(); i++) {
    Car lc = leftCars.get(i);
    Car rc = rightCars.get(i);
    lc.display();
    lc.move();
    rc.display();
    rc.move();
    
    lc.checkCollision();
    rc.checkCollision();
  }
  
  // displays each scene (bushes and hills)
  for (Scene s: scenes) {
    s.display(); 
  }

  pitFunction();
  mario.display();
  
  // when the up arrow is pressed, mario jumps
  if (keyPressed && keyCode == UP && mario.inAir == false && mario.y <= marioGround) { 
    mario.jump();
    mario.inAir = true; 
  }
  if (mario.inAir == true) mario.fall();  // if mario is in the air, he should fall
  if (mario.y >= marioGround) mario.inAir = false;
  
  
  brickFunction();
  pipeFunction();
  fireballFunction();
  goombaFunction();
  
  textAlign(CENTER, CENTER);
  textFont(f,42);
  textSize(18);
  fill(0);
  text("Key Controls:", 640, 670);
  fill(50);
  textSize(15);
  text("Arrow keys: move   f key: shoot fireballs   Hold shift: speed up   Mouse click: toggle music on/off", 640, 695);
  //text("(Press any number key or letter key to play!)", 640, 680);
}



/** brickFunction()
 * This method performs all the functions of any brick
 *
 * @param none
 * @return none
 */
void brickFunction() {
  
  // check for each brick:
  for (int i = 0; i < bricks.size(); i++) {
    Brick b = bricks.get(i);
    b.display();
    b.checkCollision(mario);
    
    // if the brick is a block, it is hit, and mario is larger than small size, the brick breaks
    if (b.type == "block" && b.hit == true && (mario.size == "medium" || mario.size == "fire medium")) { 
      stroke(107, 140, 255);
      fill(107,140,255); 
      rect(b.x - 1, b.y - 1, 33, 33);
      if (b.hitTemp == false) mario.dy *= -1; // reverses mario's y direction
      b.hitTemp = true; 
      bricks.remove(b);
    }
    else if (b.type == "block" && mario.size == "small" && b.hit == true) {
      b.hit = false;
      mario.dy += 2;
    }
    
    else if (b.hit == true && b.hitTemp == true && mario.y <= b.y + b.h + 5 && mario.y > b.y && mario.x + mario.w > b.x && mario.x < b.x + b.w) mario.dy += 2;
    
    // if the block is a mystery block and it is hit, show that it is hit, and display the item
    else if ((b.type == "mystery" || b.type == "invisible") && b.hit == true && b.visible == true) {
      image(hitBrick, b.x, b.y, b.w, b.h); 
      if (b.hitTemp == false) mario.dy *= -1;
      b.itemDisplay();
      b.hitTemp = true;
    }
    
    
    // if mario is on top of a brick, keep him up there, else drop mario
    if (mario.y + mario.h < b.y + 10 && mario.y + mario.h >= b.y && abs(b.x - mario.x) < b.w && b.visible == true) {
      mario.inAir = false;  
      mario.y = b.y - mario.h; // mario's y is always set to the y value of the bricks on the ground
      
      if (keyPressed == true) {
        if (keyCode == UP) mario.jump();
      }
      else if (!keyPressed) mario.dy = 0;
    }
    else if (mario.y + mario.h >= marioGround) { mario.dy = 0; mario.inAir = false;}
    else if (mario.y + mario.h < b.y - 10 || mario.y > b.y + b.h) mario.inAir = true;
    
    // if mario is on steps, make sure mario can't go in them
    if (b.type == "step") {
      if (mario.y + 32 >= b.y + 8 && mario.x + 16 >= b.x && mario.x + 16 <= b.x + 8) mario.x = b.x - 17;
      else if (mario.y + 32 >= b.y + 8 && mario.x <= b.x + 16 && mario.x >= b.x + 8) mario.x = b.x + 15;
    } 
  }
  
}



/** pipeFunction()
 * This method displays and checks collisions with the pipes
 *
 * @param none
 * @return none
 */
void pipeFunction() {
  
  // check each pipe:
  for (Pipe p: pipes) {
    p.display();
    
    // if mario is on top of the pipe, keep him up there
    if (mario.y + mario.h <= p.y  && mario.y >= p.y - mario.h - 3 && abs(p.x + p.w/2 - mario.x) < p.w/2 - 2) {
      mario.dy = 0; 
      mario.inAir = false; 
    }
    
    if (mario.x > p.x && mario.x < p.x + p.w && mario.y + mario.h > p.y) mario.inAir = false;      // if mario is on the pipe, mario.inAir is false
    if (abs(p.x + 8 - mario.x) <= mario.w && mario.y + mario.h > p.y + 8) mario.x = p.x - mario.w; // make sure mario can't go in the pipe from the side
    else if (mario.x - p.x <= p.w && mario.x - p.x > 0 && mario.y + mario.h > p.y + 8) { mario.dx = 0; mario.x = p.x + p.w;}
    
  } 
}



/** pitFunction()
 * This method makes objects fall if they are in or over a pit
 *
 * @param none
 * @return none
 */
void pitFunction() {
  for (Pit s: pits) {
    s.display();
    s.checkIntersection(mario);  // check if Mario is above a pit
    
    // check if any of the goombas are above a pit
    for (int i = 0; i < goombas.size(); i++) {
      Goomba g = goombas.get(i);
      s.checkIntersection(g);
    }
  } 
}



/** fireballFunction()
 * This method displays fireballs and checks their collisions with pipes
 *
 * @param none
 * @return none
 */
void fireballFunction() {
  // check each fireball
  for (int i = 0; i < fireballs.size(); i++) {
    Fireball f = fireballs.get(i);
    f.display();
    
    // fireballs stop when they hit a pipe
    for (int j = 0; j < pipes.size(); j++) {
      Pipe p = pipes.get(j);
      
      if (p.x - f.x <= 16 && f.x < p.x && f.dx > 0) fireballs.remove(f);
      else if (f.x - p.x <= 64 && f.x > p.x && f.dx < 0) fireballs.remove(f);
    }
  } 
}



/** goombaFunction()
 * This method performs all the actions of a goomba
 *
 * @param none
 * @return none
 */
void goombaFunction() {
  for (int i = 0; i < goombas.size(); i++) {
    Goomba g = goombas.get(i);
    g.display();
    
    if (g.enemyHit == false) g.checkCollision();  // check if Mario collided with the goomba
    
    // if the goomba was hit
    else if (g.enemyHit == true) {
      g.dx = 0;
      if (g.bounceTemp == false) { mario.y -= 15; /*score += 100;*/ if (millis() - g.enemyTime >= 100) g.bounceTemp = true; } // bounces mario off the goomba
      if (millis() - g.enemyTime <= 500) image(goombaSquashed, g.x, g.y + g.h/2, g.w, g.h/2); // goomba is squashed
      else goombas.remove(g);
    }
    
    
    // goombas change direction when they hit a pipe
    for (int j = 0; j < pipes.size(); j++) {
      Pipe p = pipes.get(j);
      
      if (p.x - g.x <= 32 && g.x < p.x && g.dx > 0) g.xForward = false;
      else if (g.x - p.x <= 64 && g.x > p.x && g.dx < 0) g.xForward = true;
    }
    
    
    // if fireball hits goomba, get rid of both the goomba and the fireball
    for (int k = 0; k < fireballs.size(); k++) {
      Fireball f = fireballs.get(k);
      
      if (f.x + f.w >= g.x && f.x <= g.x + g.w && f.y >= g.y && f.y + f.h <= g.y + g.w) {
        //score += 600;
        goombas.remove(g);
        fireballs.remove(f); 
      } 
    }
    
    // if the goomba collides with another brick, reverse the goomba's direction
    for (int z = 0; z < bricks.size(); z++) {
      Brick b = bricks.get(z);
      
      if (g.y < b.y && g.y > (b.y - g.h - 10) && b.type != "ground" && abs(b.y - g.y) <= 5) {
        if (b.x - g.x <= 32 && g.x < b.x && g.dx > 0) g.xForward = false;
        else if (g.x - b.x <= 32 && g.x > b.x && g.dx < 0) g.xForward = true;
      }
    }
    
  } 
}




/** keyPressed()
 * This method executes whenever a key is pressed
 *
 * @param none
 * @return none
 */
void keyPressed() {
  // adds fireballs when mario has fire power
  if (mario.size == "fire medium" && key == 'f') {
    if (mario.dir == "right") fireballs.add(new Fireball(mario.x + mario.w, mario.y + mario.h/2+10)); 
    else if (mario.dir == "left") fireballs.add(new Fireball(mario.x, mario.y + mario.h/2+10));
  }
}



/** mouseClicked()
 * This method acts as a toggle for the presence of music when the mouse is clicked
 *
 * @param none
 * @return none
 */
void mouseClicked() {
  if (musicOn == true) {
    overworldMusic.pause();
    musicOn = false;
  }
  else if (musicOn == false) {
    overworldMusic.play();
    musicOn = true;
  }
}



/** dayMode()
 * This method creates a day setting
 *
 * @param none
 * @return none
 */
void dayMode() {
  background(0,255,240);
  road();
  cloud1.display();
  cloud2.display();
  sun.display();
}



/** nightMode()
 * This method creates a night setting
 *
 * @param none
 * @return none
 */
void nightMode() {
  background(20,0,80);
  road();
  cloud1.display();
  cloud2.display();
  moon.display();
}



/** road()
 * This method draws a road
 *
 * @param none
 * @return none
 */
void road() {
  //road
  noStroke();
  fill(150);
  rect(0,360,width,180);
  fill(255);
  rectMode(CENTER);
  for (int xcoord = 75; xcoord < 1280; xcoord = xcoord + 200){
    rect(xcoord,400,75,15);
  }
  fill(220,220,18);
  rect(0,440, 2*width, 10);
  rect(0,460, 2*width, 10);
  fill(255);
  for (int xcoord = 75; xcoord < 1280; xcoord = xcoord + 200){
    rect(xcoord,500,75,15);
  }
  rectMode(CORNER);
  
  if (mouseX < width/2) fill(20,255,20);
  else fill(20, 150, 20);
  rect(0,540,width,180);
  
}




/** instances()
 * This method creates all the instances of objects from the Mario game
 *
 * @param none
 * @return none
 */
void instances() {
  // mystery bricks
  bricks.add(new Brick(512, 450, "mystery", "coin"));
  bricks.add(new Brick(704, 322, "mystery", "coin"));
  bricks.add(new Brick(672, 450, "mystery", "mushroom"));
  bricks.add(new Brick(736, 450, "mystery", "coin"));
  bricks.add(new Brick(2496, 450, "mystery", "coin"));
  bricks.add(new Brick(3008, 322, "mystery", "coin"));
  bricks.add(new Brick(3392, 450, "mystery", "poison mushroom"));
  bricks.add(new Brick(3488, 322, "mystery", "fire flower"));
  bricks.add(new Brick(3488, 450, "mystery", "coin"));
  bricks.add(new Brick(3584, 450, "mystery", "poison mushroom"));
  bricks.add(new Brick(4128, 322, "mystery", "coin"));
  bricks.add(new Brick(4160, 322, "mystery", "mushroom"));
  bricks.add(new Brick(5440, 450, "mystery", "coin"));
  
  
  // block bricks
  bricks.add(new Brick(640, 450, "block", "none"));
  bricks.add(new Brick(704, 450, "block", "none"));
  bricks.add(new Brick(768, 450, "block", "none"));
  bricks.add(new Brick(2464, 450, "block", "none"));
  bricks.add(new Brick(2528, 450, "block", "none"));
  for (int i = 0; i < 8; i++) { bricks.add(new Brick(2560+i*32, 322, "block", "none")); }
  bricks.add(new Brick(2912, 322, "block", "none"));
  bricks.add(new Brick(2944, 322, "block", "none"));
  bricks.add(new Brick(2976, 322, "block", "none"));
  bricks.add(new Brick(3008, 450, "block", "none"));
  bricks.add(new Brick(3200, 450, "block", "none"));
  bricks.add(new Brick(3232, 450, "block", "none"));
  bricks.add(new Brick(3776, 450, "block", "none"));
  bricks.add(new Brick(3872, 322, "block", "none"));
  bricks.add(new Brick(3904, 322, "block", "none"));
  bricks.add(new Brick(3936, 322, "block", "none"));
  bricks.add(new Brick(4096, 322, "block", "none"));
  bricks.add(new Brick(4128, 450, "block", "none"));
  bricks.add(new Brick(4160, 450, "block", "none"));
  bricks.add(new Brick(4192, 322, "block", "none"));
  bricks.add(new Brick(5376, 450, "block", "none"));
  bricks.add(new Brick(5408, 450, "block", "none"));
  bricks.add(new Brick(5472, 450, "block", "none"));
  
  
  // invisible bricks
  bricks.add(new Brick(2048, 450, "invisible", "1 Up"));
  bricks.add(new Brick(2144, 450, "invisible", "coin"));
  bricks.add(new Brick(2208, 450, "invisible", "coin"));
  bricks.add(new Brick(2752, 450, "invisible", "coin"));
  bricks.add(new Brick(3424, 16, "invisible", "coin"));
  bricks.add(new Brick(3456, 16, "invisible", "coin"));
  bricks.add(new Brick(3488, 16, "invisible", "coin"));
  bricks.add(new Brick(3520, 16, "invisible", "coin"));
  bricks.add(new Brick(3552, 16, "invisible", "coin"));
  bricks.add(new Brick(4416, 448, "invisible", "coin"));
  bricks.add(new Brick(4448, 448, "invisible", "coin"));
  bricks.add(new Brick(4416, 322, "invisible", "coin"));
  bricks.add(new Brick(4448, 322, "invisible", "coin"));
  bricks.add(new Brick(6080, 448, "invisible", "coin"));
  
  
  //step bricks
  bricks.add(new Brick(4288, 544, "step", "none"));
  bricks.add(new Brick(4320, 544, "step", "none"));
  bricks.add(new Brick(4320, 512, "step", "none"));
  bricks.add(new Brick(4352, 544, "step", "none"));
  bricks.add(new Brick(4352, 512, "step", "none"));
  bricks.add(new Brick(4352, 480, "step", "none"));
  bricks.add(new Brick(4384, 544, "step", "none"));
  bricks.add(new Brick(4384, 512, "step", "none"));
  bricks.add(new Brick(4384, 480, "step", "none"));
  bricks.add(new Brick(4384, 448, "step", "none"));
  
  bricks.add(new Brick(4480, 448, "step", "none"));
  bricks.add(new Brick(4480, 480, "step", "none"));
  bricks.add(new Brick(4480, 512, "step", "none"));
  bricks.add(new Brick(4480, 544, "step", "none"));
  bricks.add(new Brick(4512, 480, "step", "none"));
  bricks.add(new Brick(4512, 512, "step", "none"));
  bricks.add(new Brick(4512, 544, "step", "none"));
  bricks.add(new Brick(4544, 512, "step", "none"));
  bricks.add(new Brick(4544, 544, "step", "none"));
  bricks.add(new Brick(4576, 544, "step", "none"));
  
  bricks.add(new Brick(4736, 544, "step", "none"));
  bricks.add(new Brick(4768, 544, "step", "none"));
  bricks.add(new Brick(4768, 512, "step", "none"));
  bricks.add(new Brick(4800, 544, "step", "none"));
  bricks.add(new Brick(4800, 512, "step", "none"));
  bricks.add(new Brick(4800, 480, "step", "none"));
  bricks.add(new Brick(4832, 544, "step", "none"));
  bricks.add(new Brick(4832, 512, "step", "none"));
  bricks.add(new Brick(4832, 480, "step", "none"));
  bricks.add(new Brick(4832, 448, "step", "none"));
  bricks.add(new Brick(4864, 544, "step", "none"));
  bricks.add(new Brick(4864, 512, "step", "none"));
  bricks.add(new Brick(4864, 480, "step", "none"));
  bricks.add(new Brick(4864, 448, "step", "none"));
  
  bricks.add(new Brick(4960, 448, "step", "none"));
  bricks.add(new Brick(4960, 480, "step", "none"));
  bricks.add(new Brick(4960, 512, "step", "none"));
  bricks.add(new Brick(4960, 544, "step", "none"));
  bricks.add(new Brick(4992, 480, "step", "none"));
  bricks.add(new Brick(4992, 512, "step", "none"));
  bricks.add(new Brick(4992, 544, "step", "none"));
  bricks.add(new Brick(5024, 512, "step", "none"));
  bricks.add(new Brick(5024, 544, "step", "none"));
  bricks.add(new Brick(5056, 544, "step", "none"));
  
  bricks.add(new Brick(5792, 544, "step", "none"));
  bricks.add(new Brick(5824, 544, "step", "none"));
  bricks.add(new Brick(5824, 512, "step", "none"));
  bricks.add(new Brick(5856, 544, "step", "none"));
  bricks.add(new Brick(5856, 512, "step", "none"));
  bricks.add(new Brick(5856, 480, "step", "none"));
  bricks.add(new Brick(5888, 544, "step", "none"));
  bricks.add(new Brick(5888, 512, "step", "none"));
  bricks.add(new Brick(5888, 480, "step", "none"));
  bricks.add(new Brick(5888, 448, "step", "none"));
  bricks.add(new Brick(5920, 544, "step", "none"));
  bricks.add(new Brick(5920, 512, "step", "none"));
  bricks.add(new Brick(5920, 480, "step", "none"));
  bricks.add(new Brick(5920, 448, "step", "none"));
  bricks.add(new Brick(5920, 416, "step", "none"));
  bricks.add(new Brick(5952, 544, "step", "none"));
  bricks.add(new Brick(5952, 512, "step", "none"));
  bricks.add(new Brick(5952, 480, "step", "none"));
  bricks.add(new Brick(5952, 448, "step", "none"));
  bricks.add(new Brick(5952, 416, "step", "none"));
  bricks.add(new Brick(5952, 384, "step", "none"));
  bricks.add(new Brick(5984, 544, "step", "none"));
  bricks.add(new Brick(5984, 512, "step", "none"));
  bricks.add(new Brick(5984, 480, "step", "none"));
  bricks.add(new Brick(5984, 448, "step", "none"));
  bricks.add(new Brick(5984, 416, "step", "none"));
  bricks.add(new Brick(5984, 384, "step", "none"));
  bricks.add(new Brick(5984, 352, "step", "none"));
  bricks.add(new Brick(6016, 544, "step", "none"));
  bricks.add(new Brick(6016, 512, "step", "none"));
  bricks.add(new Brick(6016, 480, "step", "none"));
  bricks.add(new Brick(6016, 448, "step", "none"));
  bricks.add(new Brick(6016, 416, "step", "none"));
  bricks.add(new Brick(6016, 384, "step", "none"));
  bricks.add(new Brick(6016, 352, "step", "none"));
  bricks.add(new Brick(6016, 320, "step", "none"));
  bricks.add(new Brick(6048, 544, "step", "none"));
  bricks.add(new Brick(6048, 512, "step", "none"));
  bricks.add(new Brick(6048, 480, "step", "none"));
  bricks.add(new Brick(6048, 448, "step", "none"));
  bricks.add(new Brick(6048, 416, "step", "none"));
  bricks.add(new Brick(6048, 384, "step", "none"));
  bricks.add(new Brick(6048, 352, "step", "none"));
  bricks.add(new Brick(6048, 320, "step", "none"));
  
  bricks.add(new Brick(6336, 544, "step", "none"));
  
  //ground bricks
  for (int i = 0; i < 69; i++) {
    bricks.add(new Brick(i*32, 578, "ground", "none"));
    bricks.add(new Brick(i*32, 610, "ground", "none"));
  }
  
  for (int i = 0; i < 15; i++) {
    bricks.add(new Brick(2272+i*32, 578, "ground", "none"));
    bricks.add(new Brick(2272+i*32, 610, "ground", "none"));
  }
  
  for (int i = 0; i < 64; i++) {
    bricks.add(new Brick(2848+i*32, 578, "ground", "none"));
    bricks.add(new Brick(2848+i*32, 610, "ground", "none"));
  }
  
  for (int i = 0; i < 57; i++) {
    bricks.add(new Brick(4960+i*32, 578, "ground", "none"));
    bricks.add(new Brick(4960+i*32, 610, "ground", "none"));
  }
  
  
  // pipes
  pipes.add(new Pipe(896, 514, 1));
  pipes.add(new Pipe(1216, 482, 2));
  pipes.add(new Pipe(1472, 450, 3));
  pipes.add(new Pipe(1824, 450, 3));
  pipes.add(new Pipe(5216, 514, 1));
  pipes.add(new Pipe(5728, 514, 1));
  
  
  // enemies 
  goombas.add(new Goomba(700, 546));
  goombas.add(new Goomba(800, 546));
  goombas.add(new Goomba(1300, 546));
  goombas.add(new Goomba(1400, 546));
  goombas.add(new Goomba(1600, 546));
  goombas.add(new Goomba(1700, 546));
  goombas.add(new Goomba(3000, 546));
  goombas.add(new Goomba(5300, 546));
  goombas.add(new Goomba(5450, 546));
  goombas.add(new Goomba(5600, 546));
  
  
  // pits
  pits.add(new Pit(2208, 578, 64));
  pits.add(new Pit(2752, 578, 96));
  pits.add(new Pit(4896, 578, 64));
  pits.add(new Pit(-500, 578, 500));
  pits.add(new Pit(6784, 578, 500));
  
  
  // scenery
  scenes.add(new Scene(0, 508, "big hill"));
  scenes.add(new Scene(368, 546, "bush3"));
  scenes.add(new Scene(512, 540, "small hill"));
  scenes.add(new Scene(624, 48, "cloud1"));
  scenes.add(new Scene(752, 546, "bush1"));
  scenes.add(new Scene(880, 80, "cloud3"));
  scenes.add(new Scene(1168, 48, "cloud2"));
  scenes.add(new Scene(1296, 546, "bush3"));
  scenes.add(new Scene(1536, 508, "big hill"));
  scenes.add(new Scene(1808, 80, "cloud1"));
  scenes.add(new Scene(1904, 546, "bush3"));
  scenes.add(new Scene(2048, 540, "small hill"));
  scenes.add(new Scene(2160, 48, "cloud1"));
  scenes.add(new Scene(2288, 546, "bush1"));
  scenes.add(new Scene(2416, 80, "cloud3"));
  scenes.add(new Scene(2704, 48, "cloud2"));
  scenes.add(new Scene(2864, 546, "bush2"));
  scenes.add(new Scene(3072, 508, "big hill"));
  scenes.add(new Scene(3344, 80, "cloud1"));
  scenes.add(new Scene(3440, 546, "bush3"));
  scenes.add(new Scene(3582, 540, "small hill"));
  scenes.add(new Scene(3696, 48, "cloud1"));
  scenes.add(new Scene(3824, 546, "bush1"));
  scenes.add(new Scene(3952, 80, "cloud3"));
  scenes.add(new Scene(4240, 48, "cloud2"));
  scenes.add(new Scene(4400, 546, "bush2"));
  scenes.add(new Scene(4608, 508, "big hill"));
  scenes.add(new Scene(4880, 80, "cloud1"));
  scenes.add(new Scene(5040, 546, "bush1"));
  scenes.add(new Scene(5120, 540, "small hill"));
  scenes.add(new Scene(5232, 48, "cloud1"));
  scenes.add(new Scene(5360, 546, "bush1"));
  scenes.add(new Scene(5488, 80, "cloud3"));
  scenes.add(new Scene(5776, 48, "cloud2"));
  scenes.add(new Scene(6144, 508, "big hill"));
  scenes.add(new Scene(6416, 80, "cloud1"));
  scenes.add(new Scene(6576, 546, "bush1"));
  scenes.add(new Scene(6656, 540, "small hill"));
  
  scenes.add(new Scene(200, 540, "tree"));
}