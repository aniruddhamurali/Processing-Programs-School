/** Goomba class
 * class for all goombas
 * extends from the Enemy class
 *
 * @author Aniruddha Murali
 */
 
 
class Goomba extends Enemy {  
  
  /** Goomba()
   * This is the constructor class for the goomba
   *
   * @param ix(float) - the initial x coordinate of the goomba
   * @param iy(float) - the initial y coordinate of the goomba
   * @return none
   */
  Goomba(float ix, float iy) {
    super(ix, iy);
    w = 32;
    h = 32;
    img1 = goomba1;
    img2 = goomba2;
  }
  
  
  
  /** display()
   * This method uses the Enemy superclass to display the goomba
   *
   * @param none
   * @return none
   */
  void display() {
    super.display();
  }
  
  
  /** checkCollision()
   * This method uses the Enemy superclass to check collision between the goomba and Mario
   *
   * @param none
   * @return none
   */
  void checkCollision() {
    super.checkCollision();
  }
  
}