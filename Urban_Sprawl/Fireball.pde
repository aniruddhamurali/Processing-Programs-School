/** Fireball class
 * class for all fireballs thrown by Mario
 *
 * @author Aniruddha Murali
 */
 
 
class Fireball {
  float x, y, w, h;
  float dx;
  int frame = 1;
  boolean fireballTemp = false;
  
  
  /** Fireball()
   * This is the constructor method for the fireball
   *
   * @param ix(float) - the initial x coordinate of the fireball
   * @param iy(float) - the initial y coordinate of the fireball
   * @return none
   */
  Fireball(float ix, float iy) {
    x = ix;
    y = iy;
    w = 16;
    h = 16;
  }
  
  
  
  /** display()
   * This method displays the fireball
   *
   * @param none
   * @return none
   */
  void display() {
    imageMode(CORNER);
    
    if (frameCount % 5 == 0) frame++;
    if (frame > 4) frame = 1;
    
    if (frame == 1) image(fireball1, x, y, w, h);
    else if (frame == 2) image(fireball2, x, y, w, h);
    else if (frame == 3) image(fireball3, x, y, w, h);
    else if (frame == 4) image(fireball4, x, y, w, h);
    
    if (fireballTemp == false) {
      if (mario.dir == "right" ) dx = 4;
      else if (mario.dir == "left") dx -= 4;
      fireballTemp = true;
    }
    
    x += dx;
    
  }
  
}