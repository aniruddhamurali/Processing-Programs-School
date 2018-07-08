/** Button class
 * class for all buttons
 *
 * @author Aniruddha Murali
 */

class Button {
  float x, y, w, h;
  String label;
  boolean pressed;
  
  /** Button()
   * This is the constructor class for the button
   *
   * @param ix(float) - the initial x coordinate of the button
   * @param iy(float) - the initial y coordinate of the button
   * @param iw(float) - the initial width of the button
   * @param ih(float) - the initial height of the button
   * @param ilabel(String) - the text displayed on the button
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
  
  
  /** display()
   * This method displays the button
   *
   * @param none
   * @return none
   */
  void display() {
    noStroke();
    fill(0,255,255);
    rectMode(CORNER);
    rect(x,y,w,h);
    
    fill(0);
    textAlign(CENTER, CENTER);
    textFont(f,20);
    text(label, x+w/2., y+h/2.-1.); 
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
    if (mx >= x && mx <= x+w && my >= y && my <= my+h && mousePressed == true) {
      this.pressed = true;
      return true;
    } 
    else {
     this.pressed = false; 
     return false;
    } 
  }
  
} 