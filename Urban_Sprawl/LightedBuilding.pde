/** LightedBuilding class
 * class for all lighted buildings
 * extends from the Building class
 *
 * @author Aniruddha Murali
 */
 
 
class LightedBuilding extends Building {
  int rand;
  int windowLength;
  
  /** LightedBuilding()
   * This is the constructor class for the lighted building
   *
   * @param ix(float) - the initial x coordinate of the building
   * @param iy(float) - the initial y coordinate of the building
   * @param type(String) - the building type
   * @return none
   */
  LightedBuilding(float ix, float iy, String itype) {
    super(ix, iy, itype); // goes to the Building constructor
    windowLength = 8;
  }
  
  
  /** display()
   * This method uses the Building superclass to display the building
   *
   * @param none
   * @return none
   */
  void display() {
     super.display();
  }
  
  
  /** displayLights()
   * This method displays the lights on the building randomly
   *
   * @param none
   * @return none
   */
  void displayLights() {
    setVariables();
    
    for (int i = 0; i < (int)(h/10)-7; i++) { // row
      for (int j = 0; j < (int)(w/10)-1; j++) { // column
        rand = round(random(0,1));
        
        if (rand == 0) {
          fill(150);
        }
        else if (rand == 1) {
          fill(255,255,0);
          if (mouseX <= width/2) { strokeWeight(1); stroke(0); }
          else noStroke();
          rect(x+11*j+5, y+12*i+20, windowLength, windowLength);
        }
      }
    }
    noStroke();
    randomSeed(1);
  }
}