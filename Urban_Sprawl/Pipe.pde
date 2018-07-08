/** Pipe class
 * class for all pipes
 *
 * @author Aniruddha Murali
 */
 

class Pipe {
  float x, y, w, h;
  boolean hit;
  
  
  /** Pipe()
   * This is the constructor class for the pipe
   *
   * @param ix(float) - the initial x coordinate of the pipe
   * @param iy(float) - the initial y coordinate of the pipe
   * @param ih(float) - the initial height of the pipe
   * @return none
   */
  Pipe (float ix, float iy, float ih) {
    x = ix;
    y = iy;
    h = ih;
    w = 64;
  }
  
  
  
  /** display()
   * This method displays the pipe
   *
   * @param none
   * @return none
   */
  void display() {
    imageMode(CORNER);
    image(pipeEntry, x, y, 64, 64);
    
    // adds height to the pipes
    for (int i = 0; i < h; i++) {
      image(pipeLeft, x, y+64, 32, i*32);
      image(pipeRight, x+32, y+64, 32, i*32);
    }
    
  }
  
}