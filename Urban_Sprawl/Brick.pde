/** Brick class
 * class for all bricks
 *
 * @author Aniruddha Murali
 */

 
class Brick {
  float x, y;
  float w, h;
  String type;
  String item;
  boolean hit;
  boolean visible; // important for invisible blocks
  boolean hitTemp = false;
  boolean itemTemp = false;
  boolean musicTemp = false;
  int frame = 1;
  
  
  /** Brick()
   * This is the constructor class for the brick
   *
   * @param ix(float) - the initial x coordinate of the brick
   * @param iy(float) - the initial y coordinate of the brick
   * @param t(String) - the brick type
   * @param i(String) - the item in the brick
   * @return none
   */
  Brick (float ix, float iy, String t, String i) {
    x = ix;
    y = iy;
    type = t;
    item = i;
    hit = false;
    w = 32;
    h = 32;
  }
  
  
  
  /** display()
   * This method displays the brick according to its type
   *
   * @param none
   * @return none
   */
  void display() {
    imageMode(CORNER);
    
    if (frameCount % 5 == 0) frame++;
    if (frame > 4) frame = 1;
    
    // flashes mystery blocks
    if (type == "mystery") {
      visible = true;
      if (frame == 1) image(itemBrick1, x, y, w, h);
      else if (frame == 2) image(itemBrick2, x, y, w, h);
      else if (frame == 3) image(itemBrick3, x, y, w, h);
      else if (frame == 4) image(itemBrick4, x, y, w, h);
    }
    
    // shows "block" bricks
    else if (type == "block") {
      visible = true;
      if (hit == false) image(blockBrick, x, y, w, h); // if the bricks wasn't hit, show it 
    }
    
    else if (type == "ground") { visible = true; image(groundBrick, x, y, w, h); }  // shows the ground bricks
    
    else if (type == "step") {visible = true; image(stepBrick, x, y, w, h); } // shows the "step" bricks
    
    // shows invisible bricks
    else if (type == "invisible") {
      if (hit == false) {
       visible = false; 
        noStroke();
        noFill();
        rect(x - 1, y - 1, 33, 33); 
      }
      else if (hit == true) visible = true;
    }
    
  }
  
  
  
  /** checkCollision()
   * This method check collision between mario and the brick
   *
   * @param m(Mario) - mario of class Mario
   * @return none
   */
  void checkCollision(Mario m) {
    if (m.y > y + h/2 && m.y < y + h && m.x + w - 5 >= x && m.x + 5 <= x + w) hit = true; // if there was collision, the bricks was hit
  }
  
  
  
  /** itemDisplay()
   * This method displays the item according to the brick's designated item
   *
   * @param none
   * @return none
   */
  void itemDisplay() {
    imageMode(CORNER);
    
    if (frameCount % 5 == 0) frame++;
    if (frame > 4) frame = 1;
    
    // flashes coin and adds to coin count
    if (item == "coin" && itemTemp == false) {
      coinMusic.play();
      coinMusic.loop(0);
      if (frame == 1) image(coin1, x, y - h, 32, 32);
      else if (frame == 2) image(coin2, x, y - h, 32, 32);
      else if (frame == 3) image(coin3, x, y - h, 32, 32);
      else if (frame == 4) image(coin4, x, y - h, 32, 32);
      
      //coins += 1;
      //score += 200;
      itemTemp = true;
    }
    
    
    // displays mushroom and grows mario
    else if (item == "mushroom") {
      if (itemTemp == false) { 
        image(mushroom, x, y - h, 32, 32); 
        if (musicTemp == false) { powerUpAppearsMusic.rewind(); powerUpAppearsMusic.play(); musicTemp = true; }
      }
      
      if (mario.x + mario.w > x && mario.x < x + 32 && mario.y + mario.h > y - h && mario.y < y) {
        if (musicTemp == true) { powerUpMusic.rewind(); powerUpMusic.play(); musicTemp = false; }
        if (mario.size == "small") { mario.size = "medium"; mario.y = mario.y - 32; }
        stroke(107, 140, 255);
        fill(107,140,255); 
        rect(x - 1, y - h - 1, 33, 33);
        
        //if (itemTemp == false) score += 1000;
        itemTemp = true;
      }
    }
    
    
    else if (item == "poison mushroom") {
      if (itemTemp == false) {
        image(poisonMushroom, x, y - h, 32, 32); 
        if (musicTemp == false) { powerUpAppearsMusic.rewind(); powerUpAppearsMusic.play(); musicTemp = true; }
      }
      
      // if mario is in contact with the poison mushroom, give it to him
      if (mario.x + mario.w > x && mario.x < x + 32 && mario.y + mario.h > y - h && mario.y < y) {
        if (musicTemp == true) { powerUpMusic.rewind(); powerUpMusic.play(); musicTemp = false; }
        //lives -= 1;
        stroke(107, 140, 255);
        fill(107,140,255); 
        rect(x - 1, y - h - 1, 33, 33);
        itemTemp = true;
      }
    }
    
    
    // flashes fire flower and gives mario fire powers
    else if (item == "fire flower") {
      if (itemTemp == false) {
        if (frame == 1) image(fireFlower1, x, y - h, 32, 32);
        else if (frame == 2) image(fireFlower2, x, y - h, 32, 32);
        else if (frame == 3) image(fireFlower3, x, y - h, 32, 32);
        else if (frame == 4) image(fireFlower4, x, y - h, 32, 32);
        
        if (musicTemp == false) { powerUpAppearsMusic.rewind(); powerUpAppearsMusic.play(); musicTemp = true; }
      }
      
      // if mario is in contact with the fire flower, give him the power-up
      if (mario.x + mario.w > x && mario.x < x + 32 && mario.y + mario.h > y - h && mario.y < y) {
        if (musicTemp == true) { powerUpMusic.rewind(); powerUpMusic.play(); musicTemp = false; }
        if (mario.size == "small" || mario.size == "medium") { mario.size = "fire medium"; mario.y = mario.y - 32; }
        stroke(107, 140, 255);
        fill(107,140,255); 
        rect(x - 1, y - h - 1, 33, 33);
        
        //if (itemTemp == false) score += 1000;
        itemTemp = true;
      }
    }
    
    // displays 1-Up mushroom and adds one life
    else if (item == "1 Up") {
      if (itemTemp == false) { 
        image(oneUp, x, y - h, 32, 32); 
        if (musicTemp == false) { powerUpAppearsMusic.rewind(); powerUpAppearsMusic.play(); musicTemp = true; }
      }
      
      if (mario.x + mario.w > x && mario.x < x + 32 && mario.y + mario.h > y - h && mario.y < y) {
        if (itemTemp == false) {
          //lives += 1; 
          if (musicTemp == true) { oneUpMusic.rewind(); oneUpMusic.play(); musicTemp = false; }
        }
        stroke(107, 140, 255);
        fill(107,140,255); 
        rect(x - 1, y - h - 1, 33, 33);
        itemTemp = true;
      }
    }
    
  }
  
} 