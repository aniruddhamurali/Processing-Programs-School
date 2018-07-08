/** Sun class
 * This class draws the sun. 
 * In this program, the sun is drawn only when in the day setting.
 *
 * @author Aniruddha Murali
 */
 
class Sun {
  float x, y;
  float r;
  
  /** Sun()
   * This is the constructor class for the sun
   *
   * @param ix(float) - the x-coordinate of the sun
   * @param iy(float) - the y-coordinate of the sun
   * @param r(float) - the radius of the sun
   * @return none
   */
  Sun(float ix, float iy, float ir) {
    x = ix;
    y = iy;
    r = ir;
  }
  
  /** drawStar()
   * This method draws the sun
   *
   * @param none
   * @return none
   */
  void drawSun() {
    fill(255,255,18); // fill yellow
    stroke(255,255,100); //stroke yellow
    strokeWeight(3);
    for (int d = 0; d < 360; d = d + 30){
      line(x, y, 1.3*r*cos(radians(d)) + x, 1.3*r*sin(radians(d)) + y); // draw lines coming from sun
    }
    stroke(0);
    ellipse(x, y, 2*r, 2*r);
  }
  
}