/** Moon class
 * This class draws the moon. 
 * In this program, the moon is drawn only when in the night setting.
 *
 * @author Aniruddha Murali
 */
 
class Moon {
  float x, y;
  float r;
  
  /** Moon()
   * This is the constructor class for the moon
   *
   * @param ix(float) - the x-coordinate of the moon
   * @param iy(float) - the y-coordinate of the moon
   * @param r(float) - the radius of the moon
   * @return none
   */
  Moon(float ix, float iy, float ir) {
    x = ix;
    y = iy;
    r = ir;
  }
  
  /** drawMoon()
   * This method draws the moon
   *
   * @param none
   * @return none
   */
  void drawMoon() {
    fill(0);
    stroke(0);
    ellipse(x, y, 2*(r+10), 2*(r+10));
    fill(255,255,220); // whitish-yellow
    ellipse(x, y, 2*r, 2*r);
  }
}