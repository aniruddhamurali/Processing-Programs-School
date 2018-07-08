/** Building class
 * class for all buildings
 *
 * @author Aniruddha Murali
 */
 
 
class Building {
  float x, y, w, h; 
  String type;
  
  /** Building()
   * This is the constructor class for the building
   *
   * @param ix(float) - the initial x coordinate of the building
   * @param iy(float) - the initial y coordinate of the building
   * @param type(String) - the building type
   * @return none
   */
  Building(float ix, float iy, String itype) {
    x = ix;
    y = iy;
    type = itype;
    h = buildingGround - y;
  }
  
  /** display()
   * This method displays the building according to its type
   *
   * @param none
   * @return none
   */
  void display() {
    if (mouseX <= width/2) fill(180);
    else fill(10,20,120);
    
    if (type == "t1") {
      beginShape();
      vertex(x,y);
      vertex(x-10,y+h);
      vertex(x+w+10,y+h);
      vertex(x+w,y);
      vertex(x,y);
      endShape();
    }
    else if (type == "t2") {
      rect(x,y,w,h);
      rect(x+w/4, y-h/3, w/2, h/3);
      rect(x+w/4+w/6, y-h/3-h/6,w/6,h/6);
    }
    else if (type == "t3") {
      rect(x, y, w, h);
      rect(x+w/2, y-h/5, w/2,6*h/5);
    }
  }
  
  /** setVariables()
   * This method sets the width of each type of building
   *
   * @param none
   * @return none
   */
  void setVariables() {
    if (type == "t1") w = h/5;
    else if (type == "t2") w = h/3;
    else if (type == "t3") w = h/3;
  }
}