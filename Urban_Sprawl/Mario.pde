/** Mario class
 * class for Mario
 *
 * @author Aniruddha Murali
 */
 
/**
 * Key controls:
 * --------------------
 * left arrow: move left
 * right arrow: move right
 * up arrow: jump
 * down arrow: crouch if you're not small
 * f key: shoot fireballs when you have the fire flower power-up
 * shift: increase Mario's speed
 */
 
 
class Mario {
  float x, y, w, h;
  String dir = "right";
  String size = "small";
  boolean move = false;
  boolean slide = false;
  boolean inAir = false;
  int frame = 1;
  float dx;
  float dy;
  float scaleVal = 1.2;
  
  /** Mario()
   * This is the constructor class for Mario
   *
   * @param ix(float) - the initial x coordinate of Mario
   * @param iy(float) - the initial y coordinate of Mario
   * @return none
   */
  Mario(float ix, float iy) {
    x = ix;
    y = iy;
    dx = 0;
    dy = 0;
    w = 32;
    h = 32;
  }
  
  
  /** display()
   * This method displays Mario according to his size and power-ups
   *
   * @param none
   * @return none
   */
  void display() {
    imageMode(CORNER);
    
    if (frameCount % 5 == 0) frame++;
    if (frame > 3 && move == true) frame = 1;
    else if (frame > 2 && slide == true) frame = 1;
    
    if (keyPressed) {
      if (keyCode == LEFT) { dir = "left"; dx = -3.5; move = true; }        // if the left arrow is pressed, move left
      else if (keyCode == RIGHT) { dir = "right"; dx = 3.5; move = true; }  // if the right arrow is pressed, move right
      if (keyCode == SHIFT && abs(dx) < 4.7) dx = 1.02*dx;                  // if the Shift key is pressed, increase Mario's speed
    }
    
    
    // mario's neutral position
    else if (inAir == false){
      dx = 0;
      move = false;
      if (dir == "left" && size == "small") image(rMarioSNeutral, x, y, w, h);
      else if (dir == "right" && size == "small") image(marioSNeutral, x, y, w, h); 
      else if (dir == "left" && size == "medium") image(rMarioMNeutral, x, y, w, h);
      else if (dir == "right" && size == "medium") image(marioMNeutral, x, y, w, h); 
      else if (dir == "right" && size == "fire medium") image(fireMarioNeutral, x, y, w, h);
      else if (dir == "left" && size == "fire medium") image(rfireMarioNeutral, x, y, w, h);
    }
    
    if (!keyPressed) dx = 0;
    
    // if mario is small size
    if (size == "small") {
      w = 32*scaleVal;
      h = 32*scaleVal;
      
      if (slide == true) {
        if (frame == 1) image(marioSSlide1, x, y, 28, 32);
        else if (frame == 2) image(marioSSlide2, x, y, 26, 30);
      }
      
      else if (dir == "right" && move == true && inAir == false) {
        if (frame == 1) image(marioSRun1, x, y, w, h);
        else if (frame == 2) image(marioSRun2, x, y, w, h);
        else if (frame == 3) image(marioSRun3, x, y, w, h);
      }
      
      else if (dir == "left" && move == true && inAir == false) {
        if (frame == 1) image(rMarioSRun1, x, y, w, h);
        else if (frame == 2) image(rMarioSRun2, x, y, w, h);
        else if (frame == 3) image(rMarioSRun3, x, y, w, h);
      } 
      
      else if (dir == "right" && inAir == true) image(marioSJump, x, y, w, h);
      else if (dir == "left" && inAir == true) image(rMarioSJump, x, y, w, h);

    }
    
    
    // if mario is medium sized
    else if (size == "medium") {
      w = 32*scaleVal;
      h = 64*scaleVal;
      if (dir == "right" && move == true && inAir == false) {
        if (frame == 1) image(marioMRun1, x, y, w, h);
        else if (frame == 2) image(marioMRun2, x, y, w, h);
        else if (frame == 3) image(marioMRun3, x, y, w, h);
        
      }
      
      else if (dir == "left" && move == true && inAir == false) {
        if (frame == 1) image(rMarioMRun1, x, y, w, h);
        else if (frame == 2) image(rMarioMRun2, x, y, w, h);
        else if (frame == 3) image(rMarioMRun3, x, y, w, h);
      }
      
      if (dir == "right" && inAir == true) image(marioMJump, x, y, w, h);
      else if (dir == "left" && inAir == true) image(rMarioMJump, x, y, w, h);
      
      if (dir == "right" && keyPressed == true) {
        if (keyCode == DOWN) { image(marioMCrouch, x, y+h*11/32, w, h*22/32); if (dx > 0) dx *= 0.97; }
      }
      else if (dir == "left" && keyPressed == true) {
        if (keyCode == DOWN) { image(rMarioMCrouch, x, y+h*11/32, w, h*22/32); if (dx < 0) dx *= 0.97; }
      }
      
    }
    
    // if mario has fire power
    else if (size == "fire medium") {
      w = 32*scaleVal;
      h = 64*scaleVal;
      if (dir == "right" && move == true && inAir == false && keyPressed && key != DOWN) {
        if (frame == 1) image(fireMarioRun1, x, y, w, h);
        else if (frame == 2) image(fireMarioRun2, x, y, w, h);
        else if (frame == 3) image(fireMarioRun2, x, y, w, h);
        
      }
      
      else if (dir == "left" && move == true && inAir == false) {
        if (frame == 1) image(rfireMarioRun1, x, y, w, h);
        else if (frame == 2) image(rfireMarioRun2, x, y, w, h);
        else if (frame == 3) image(rfireMarioRun3, x, y, w, h);
      }
      
      if (dir == "right" && inAir == true) image(fireMarioJump, x, y, w, h);
      else if (dir == "left" && inAir == true) image(rfireMarioJump, x, y, w, h);
      
      if (dir == "right" && keyPressed == true) {
        if (keyCode == DOWN) { image(fireMarioCrouch, x, y+h*11/32, w, h*22/32); if (dx > 0) dx *= 0.97; }
      }
      else if (dir == "left" && keyPressed == true) {
        if (keyCode == DOWN) { image(rfireMarioCrouch, x, y+h*11/32, w, h*22/32); if (dx < 0) dx *= 0.97; }
      }
      
    }
    
    x += dx;
  }
  
  
  /** fall()
   * This method drops Mario while he is in the air
   *
   * @param none
   * @return none
   */
  void fall() {
    y += dy;
    dy += 0.4; // 0.3
  }
  
  
  /** jump()
   * This method allows Mario to jump off an object
   *
   * @param none
   * @return none
   */
  void jump() {
    dy = -10.2; // -9.2
    inAir = true;
  }
  
}