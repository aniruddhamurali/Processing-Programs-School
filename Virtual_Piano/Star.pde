/** Star class
 * This class draws the stars. 
 * In this program, they are drawn only when in the night setting.
 *
 * @author Aniruddha Murali
 */
 
class Star {
  float x;
  float y;
  
  /** Star()
   * This is the constructor class for the stars
   *
   * @param ix(float) - the x-coordinate of the star
   * @param iy(float) - the y-coordinate of the star
   * @return none
   */
  Star(float ix, float iy) {
    x = ix;
    y = iy;
  }
  
  /** drawStar()
   * This method draws the star
   *
   * @param none
   * @return none
   */
  void drawStar() {
    fill(255);
    stroke(0);
    beginShape();
    vertex(x,y-5);
    vertex(x-1,y-1);
    vertex(x-5,y-1);
    vertex(x-2,y+1);
    vertex(x-3,y+5);
    vertex(x,y+3);
    vertex(x+3,y+5);
    vertex(x+2,y+1);
    vertex(x+5,y-1);
    vertex(x+1,y-1);
    endShape(CLOSE);
  }
  
}