/** OutputBox class
 * class for all the output box
 *
 * @author Aniruddha Murali
 */
 
class OutputBox {
  float x, y, w, h;
 
  /** OutputBox()
   * This is the constructor class for the output box
   *
   * @param ix(float) - the initial x coordinate of the output box
   * @param iy(float) - the initial y coordinate of the output box
   * @param iw(float) - the initial width of the output box
   * @param ih(float) - the initial height of the output box
   * @return none
   */
  OutputBox(float ix, float iy, float iw, float ih) {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
  }
  
  /** display()
   * This method displays the output box
   *
   * @param none
   * @return none
   */
  void display() {
    fill(255);
    textAlign(CENTER, CENTER);
    textFont(f,20);
    text("Spelling Errors", x+w/2, y-20);
    noStroke();
    rect(x, y, w, h); 
  }
  
  /** printErrors()
   * This method displays spelling errors within the output box
   *
   * @param none
   * @return none
   */
  void printErrors() {
    if (userText != null) {
      String[] errors = checkSpelling();
      printArray(errors);
      for (int i = 0; i < errors.length; i++) {
        textAlign(LEFT, CENTER);
        textFont(f, 20);
        text(errors[i], x+8, y+10+20*i);
      }
    }
  }
  
}