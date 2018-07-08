/** Cloud class
 * This class draws and animates the motion of clouds. 
 * In this program, the clouds are drawn and animated in the day and night settings.
 *
 * @author Aniruddha Murali
 */
 
class Cloud {
  float x, y;
  float a, b;
  float vx;
  
  /** Cloud()
   * This is the constructor class for the clouds
   *
   * @param ix(float) - the x-coordinate of the cloud
   * @param iy(float) - the y-coordinate of the cloud
   * @param ia(float) - length of semi-major axis of the middle ellipse
   * @param ib(float) - length of semi-minor axis of the middle ellipse
   * @param ivx(float) - velocity of the cloud
   * @return none
   */
  Cloud(float ix, float iy, float ia, float ib, float ivx) {
    x = ix; 
    y = iy;
    a = ia;
    b = ib;
    vx = ivx;
  }
  
  /** drawCloud()
   * This method draws the clouds
   *
   * @param none
   * @return none
   */
  void drawCloud() {
    noStroke();
    if (mouseX < width/2) fill(255); 
    else fill(90);
    
    ellipse(x, y-20, a-50, b-20);
    ellipse(x, y, a, b);
    ellipse(x, y+20, a-50, b-20);
    
    x += vx;
    if (x > width) x = 0;
  }
  
}