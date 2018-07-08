/** Key class
 * This class draws the piano keys.
 *
 * @author Aniruddha Murali
 */
 
class Key {
  float x, y;
  float w, h;
  String type;
  
  /** Key()
   * This is the constructor class for the piano keys
   *
   * @param ix(float) - the x-coordinate of the key
   * @param iy(float) - the y-coordinate of the key
   * @param t(String) - type/color of the key
   * @return none
   */
  Key(float ix, float iy, String t) {
    x = ix;
    y = iy;
    type = t;
  }
  
  /** drawKey()
   * This method draws the keys
   *
   * @param none
   * @return none
   */
  void drawKey() {
    if (type == "white" || type == "red") {
      w = 48;
      h = 215;
      if (type == "white") fill(255);
      else fill(255,0,0);
      beginShape();
      vertex(x,y);
      vertex(x, y-h);
      vertex(x+w, y-h);
      vertex(x+w, y);
      vertex(x+w-9, y+10);
      vertex(x+9, y+10);
      vertex(x,y);
      endShape(CLOSE);
    }
    
    else if (type == "black" || type == "blue") {
      w = 28;
      h = 140;
      if (type == "black") fill(0);
      else fill(0,0,255);
      beginShape();
      vertex(x,y);
      vertex(x, y-h);
      vertex(x+w, y-h);
      vertex(x+w, y);
      vertex(x+w-4, y+5);
      vertex(x+4, y+5);
      vertex(x,y);
      endShape(CLOSE);
    }
    
  }
}