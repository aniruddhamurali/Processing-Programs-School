/** Button class
 * This class is used to draw buttons and check when those buttons are clicked on.
 *
 * @author Aniruddha Murali
 */
 
 
class Button {
  float x, y, w, h;    // stores the location and geometry of the button
  String label;        // stores the label to print inside the button
  boolean pressed;     // stores a boolean (true or false) for if the button is being pressed
  
  /** Button()
   * This is the constructor class for the buttons
   *
   * @param ix(float) - the x-coordinate of the button
   * @param iy(float) - the y-coordinate of the button
   * @param iw(float) - the width of the button
   * @param ih(float) - the height of the button
   * @param ilabel(String) - the string printed on the button
   * @return none
   */
  Button(float ix, float iy, float iw, float ih, String ilabel) {
   x = ix;
   y = iy;
   w = iw;
   h = ih;
   label = ilabel;
   pressed = false; 
  }
  
  /** drawButton()
   * This method draws the buttons
   *
   * @param none
   * @return none
   */
  void drawButton() {
    stroke(0);
    fill(188,68,15);
    rectMode(CORNER);
    rect(x,y,w,h);
    
    // print the label
    fill(0);
    textAlign(CENTER, CENTER);
    textFont(f,27);
    text(label, x+w/2, y+h/2); 
  }
  
  /** pressed()
   * This method checks whether or not a button has been pressed
   *
   * @param none
   * @return true/false - returns whether the button was pressed
   */
  boolean pressed() {
    float mx = mouseX;
    float my = mouseY;
    if (mx >= x && mx <= (x+w) && my >= y && my <= (y+h) && mousePressed) {
      this.pressed = true;
      return true;
    } 
    else {
     this.pressed = false; 
     return false;
    } 
  }
  
} 