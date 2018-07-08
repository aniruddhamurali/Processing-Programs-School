
PImage marioMNeutral;
PImage marioMJump;
PImage marioMCrouch;
PImage marioMRun1;
PImage marioMRun2;
PImage marioMRun3;
PImage marioMSlide1;
PImage marioMSlide2;
PImage marioSNeutral;
PImage marioSJump;
PImage marioSRun1;
PImage marioSRun2;
PImage marioSRun3;
PImage marioSSlide1;
PImage marioSSlide2;

PImage rMarioMNeutral;
PImage rMarioMJump;
PImage rMarioMCrouch;
PImage rMarioMRun1;
PImage rMarioMRun2;
PImage rMarioMRun3;
PImage rMarioSNeutral;
PImage rMarioSJump;
PImage rMarioSRun1;
PImage rMarioSRun2;
PImage rMarioSRun3;


PImage fireMarioNeutral;
PImage fireMarioJump;
PImage fireMarioRun1;
PImage fireMarioRun2;
PImage fireMarioRun3;
PImage fireMarioCrouch;

PImage rfireMarioNeutral;
PImage rfireMarioJump;
PImage rfireMarioRun1;
PImage rfireMarioRun2;
PImage rfireMarioRun3;
PImage rfireMarioCrouch;

PImage itemBrick1;
PImage itemBrick2;
PImage itemBrick3;
PImage itemBrick4;
PImage blockBrick;
PImage hitBrick;
PImage groundBrick;
PImage stepBrick;

PImage coin1;
PImage coin2;
PImage coin3;
PImage coin4;
PImage mushroom;
PImage poisonMushroom;
PImage fireFlower1;
PImage fireFlower2;
PImage fireFlower3;
PImage fireFlower4;
PImage oneUp;
PImage fireball1;
PImage fireball2;
PImage fireball3;
PImage fireball4;
PImage fireballBreaks;

PImage pipeEntry;
PImage pipeLeft;
PImage pipeRight;

PImage goomba1;
PImage goomba2;
PImage goombaSquashed;

PImage koopa1;
PImage koopa2;
PImage koopaShell1;
PImage koopaShell2;


PImage redCarLeft;
PImage redCarRight;
PImage redCar2Left;
PImage redCar2Right;


PImage hill1;
PImage hill2;
PImage bush1;
PImage bush2;
PImage bush3;


/** images()
   * This method loads all the images needed for the program
   *
   * @param none
   * @return none
   */
void images() { 
  // forward
  
  // medium mario
  marioMNeutral = loadImage("MarioNeutral.png");
  marioMJump = loadImage("MarioJump.png");   
  marioMCrouch = loadImage("MarioCrouch.png");
  marioMRun1 = loadImage("MarioRun1.png");
  marioMRun2 = loadImage("MarioRun2.png");
  marioMRun3 = loadImage("MarioRun3.png");
  
  // small mario
  marioSNeutral = loadImage("MarioS Neutral.png");
  marioSJump = loadImage("MarioS Jump.png");
  marioSRun1 = loadImage("MarioS Run1.png");
  marioSRun2 = loadImage("MarioS Run2.png");
  marioSRun3 = loadImage("MarioS Run3.png");
  marioSSlide1 = loadImage("MarioS Slide1.png");
  marioSSlide2 = loadImage("MarioS Slide2.png");
  
  
  // reverse 
  
  // medium mario
  rMarioMNeutral = loadImage("rMarioNeutral.png");
  rMarioMJump = loadImage("rMarioJump.png");   
  rMarioMCrouch = loadImage("rMarioCrouch.png");
  rMarioMRun1 = loadImage("rMarioRun1.png");
  rMarioMRun2 = loadImage("rMarioRun2.png");
  rMarioMRun3 = loadImage("rMarioRun3.png");
  
  // small mario
  rMarioSNeutral = loadImage("rMarioS Neutral.png");
  rMarioSJump = loadImage("rMarioS Jump.png");
  rMarioSRun1 = loadImage("rMarioS Run1.png");
  rMarioSRun2 = loadImage("rMarioS Run2.png");
  rMarioSRun3 = loadImage("rMarioS Run3.png");
  
  
  // fire mario
  fireMarioNeutral = loadImage("FireMarioNeutral.png");
  fireMarioJump = loadImage("FireMarioJump.png");
  fireMarioRun1 = loadImage("FireMarioRun1.png");
  fireMarioRun2 = loadImage("FireMarioRun2.png");
  fireMarioRun3 = loadImage("FireMarioRun3.png");
  fireMarioCrouch = loadImage("FireMarioCrouch.png");
  
  // reverse
  rfireMarioNeutral = loadImage("rFireMarioNeutral.png");
  rfireMarioJump = loadImage("rFireMarioJump.png");
  rfireMarioRun1 = loadImage("rFireMarioRun1.png");
  rfireMarioRun2 = loadImage("rFireMarioRun2.png");
  rfireMarioRun3 = loadImage("rFireMarioRun3.png");
  rfireMarioCrouch = loadImage("rFireMarioCrouch.png");
  
  //bricks
  itemBrick1 = loadImage("Tile 5-1.png");
  itemBrick2 = loadImage("Tile 5-2.png");
  itemBrick3 = loadImage("Tile 5-3.png");
  itemBrick4 = loadImage("Tile 5-4.png");
  hitBrick = loadImage("Tile 3.png");
  blockBrick = loadImage("Tile 2.png");
  groundBrick = loadImage("Tile 1.png");
  stepBrick = loadImage("Tile 4.png");
  
  //items
  coin1 = loadImage("Coin-1.png");
  coin2 = loadImage("Coin-2.png");
  coin3 = loadImage("Coin-3.png");
  coin4 = loadImage("Coin-4.png");
  mushroom = loadImage("Mushroom.png");
  poisonMushroom = loadImage("PoisonMushroom.png");
  fireFlower1 = loadImage("Fire-Flower 1.png");
  fireFlower2 = loadImage("Fire-Flower 2.png");
  fireFlower3 = loadImage("Fire-Flower 3.png");
  fireFlower4 = loadImage("Fire-Flower 4.png");
  oneUp = loadImage("1-Up.png");
  fireball1 = loadImage("fireball1.png");
  fireball2 = loadImage("fireball2.png");
  fireball3 = loadImage("fireball3.png");
  fireball4 = loadImage("fireball4.png");
  fireballBreaks = loadImage("fireballBreaks.png");
  
  // pipes
  pipeEntry = loadImage("Pipe Full.png");
  pipeLeft = loadImage("Pipe 3.png");
  pipeRight = loadImage("Pipe 4.png");
  
  // enemies
  goomba1 = loadImage("goomba1.png");
  goomba2 = loadImage("goomba2.png");
  goombaSquashed = loadImage("goomba-squashed.png");
  
  koopa1 = loadImage("koopa1.png");
  koopa2 = loadImage("koopa2.png");
  koopaShell1 = loadImage("koopaShell1.png");
  koopaShell2 = loadImage("koopaShell2.png");
  
  
  //vehicles
  redCarLeft = loadImage("red-carLeft.png");
  redCar2Right = loadImage("red-car2Right.png");
  redCarRight = loadImage("red-carRight.png");
  redCar2Left = loadImage("red-car2Left.png");
  
  
  // scenery
  hill1 = loadImage("hill1.png");
  hill2 = loadImage("hill2.png");
  bush1 = loadImage("bush1.png");
  bush2 = loadImage("bush2.png");
  bush3 = loadImage("bush3.png");
}