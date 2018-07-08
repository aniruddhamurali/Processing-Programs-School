/** Scene class
 * class for all scenery
 *
 * @author Aniruddha Murali
 */
 
 
class Scene {
  String type;
  float x, y;
  
  
  /** Scene()
   * This is the constructor class for each scene
   *
   * @param ix(float) - the initial x coordinate of the scene
   * @param iy(float) - the initial y coordinate of the scene
   * @param t(String) - the type of scene
   * @return none
   */
  Scene(float ix, float iy, String t) {
    x = ix;
    y = iy;
    type = t;
  }
  
  
  
  /** display()
   * This method displays the scene according to its type
   *
   * @param none
   * @return none
   */
  void display() {
    imageMode(CORNER);
    if (type == "big hill") image(hill1, x, y, 160, 70);
    else if (type == "small hill") image(hill2, x, y, 96, 38);
    else if (type == "bush1") image(bush1, x, y, 64, 32);
    else if (type == "bush2") image(bush2, x, y, 96, 32);
    else if (type == "bush3") image(bush3, x, y, 128, 32);
  }
  
  
}