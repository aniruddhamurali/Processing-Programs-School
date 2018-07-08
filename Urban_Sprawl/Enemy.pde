/** Enemy class
 * class for enemies
 *
 * @author Aniruddha Murali
 */
 
 
class Enemy {
  float x, y, w, h;
  float dx, dy;
  int frame;
  boolean hitTemp, bounceTemp;
  boolean enemyHit;
  boolean xForward;
  float enemyTime, time;
  PImage img1;
  PImage img2;
  
  
  /** Enemy()
   * This is the constructor class for the enemy
   *
   * @param ix(float) - the initial x coordinate of the enemy
   * @param iy(float) - the initial y coordinate of the enemy
   * @return none
   */
  Enemy(float ix, float iy) {
    x = ix;
    y = iy;
    w = 32;
    h = 32;
    dx = 2;
    dy = 0;
    frame = 1;
    hitTemp = false;
    bounceTemp = false;
    enemyHit = false;
    xForward = true;
    enemyTime = millis();
  }
  
  
  
  /** display()
   * This method displays the enemy
   *
   * @param none
   * @return none
   */
  void display() {
    if (frameCount % 5 == 0) frame++;
    if (frame > 2) frame = 1;
    
    if (enemyHit == false) {
      if (frame == 1) image(img1, x, y, w, h);
      else if (frame == 2) image(img2, x, y, w, h);
      
      if (xForward == false) dx = -2;
      else if (xForward == true) dx = 2;
    }
    
    x += dx;  
    y += dy;
  }
  
  
  /** checkCollision()
   * This method checks collision between Mario and the enemy
   *
   * @param none
   * @return none
   */
  void checkCollision() {
    // if mario stomped on the enemy
    if (mario.y + mario.h <= y && mario.y >= (y - mario.h - 10) && mario.x + mario.w >= x && mario.x <= x + w) {
       enemyHit = true;
       enemyTime = millis();
    }
    
    // else if the enemy hit mario
    else if (mario.x + mario.w >= x && mario.x <= x + w && mario.y + mario.h > y && mario.y < y + h && hitTemp == false) {
      if (mario.size == "medium" || mario.size == "fire medium") { mario.size = "small"; mario.y += 32; }
      hitTemp = true;
      time = millis();
    }
    
    if (millis() - time > 2500) hitTemp = false;
    
  }
  
}