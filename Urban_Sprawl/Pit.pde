/** Pit class
 * class for all pits
 *
 * @author Aniruddha Murali
 */
 
 
class Pit {
  float x, y, w, h;
  
  
  /** Pit()
   * This is the constructor class for the pit
   *
   * @param ix(float) - the initial x coordinate of the pit
   * @param iy(float) - the initial y coordinate of the pit
   * @param iw(float) - the initial width of the pit
   * @param ih(float) - the initial height of the pit
   * @return none
   */
  Pit(float ix, float iy, float iw/*, float ih*/) {
    x = ix;
    y = iy;
    w = iw;
    //h = ih;
    h = height-y;
  }  
  
  
  void display() {
    if (mouseX <= width/2) fill(0,255,240);
    else fill(20,0,80);
    rect(x,y,w,h);
  }
  
  /** checkIntersection()
   * This method checks the intersection between mario and the pit
   *
   * @param none
   * @return none
   */
  void checkIntersection(Mario m) {
    if (m.x > x && m.x < x + w && m.y > (y - mario.h - 10)) {
      mario.fall();
      mario.inAir = true;
      mario.dy += 9;
    }
  }
  
  
  
  /** checkIntersection()
   * This method checks the intersection between a goomba and the pit
   *
   * @param none
   * @return none
   */
  void checkIntersection(Goomba g) {
    if (g.x > x && g.x < x + w && g.y > (y - g.h - 10)) {
      g.dy += 1;
    }
  }
   
}