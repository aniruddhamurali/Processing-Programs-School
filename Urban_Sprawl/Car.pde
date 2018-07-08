/** Car class
 * class for all cars
 *
 * @author Aniruddha Murali
 */
 
 
class Car {
  float x, y, w, h;
  float dx;
  int carNum;
  
  /** Car()
   * This is the constructor class for the car
   *
   * @param ix(float) - the initial x coordinate of the car
   * @param iy(float) - the initial y coordinate of the car
   * @param icarNum(int) - integer used to determine the type of car
   * @return none
   */
  Car (float ix, float iy, int icarNum) {
    x = ix;
    y = iy;
    carNum = icarNum;
  }
  
  /** display()
   * This method displays the car according to its carNum
   *
   * @param none
   * @return none
   */
  void display() {
    if (carNum == 0) {
      w = 7122*60/2615;
      h = 60;
      image(redCarLeft,x, y, w, h);  
    }
    if (carNum == 1) {
      w = 120;
      h = 60;
      image(redCar2Left,x, y, w, h);  
    }
    if (carNum == 2) {
      w = 7122*60/2615;
      h = 60;
      image(redCarRight,x, y, w, h);  
    }
    if (carNum == 3) {
      w = 120;
      h = 60;
      image(redCar2Right,x, y, w, h);  
    }
    
  }
  
  /** move()
   * This method moves the car according to where it is on the road
   *
   * @param none
   * @return none
   */
  void move() {
    if (y < 410) dx = -4; //-random(1,6);
    else if (y >= 410) dx = 7; //random(5,10);
    
    x += dx;
    
    if (x <= 0) x = width;
    else if (x >= width) x = 0;
  }
  
  
  /** checkCollision()
   * This method checks collision between
   *
   * @param none
   * @return none
   */
  boolean checkCollision() {
    Car c;
    
    // cars on the top of the road
    if (y >= 410) {
      int index = rightCars.indexOf(this);
      if (index <= rightCars.size()-2) c = rightCars.get(index+1);
      else c = rightCars.get(0);
      
      if (c.dx >= this.dx) return false;
      if (this.x + this.w >= c.x) {
        carHonk.rewind();
        carHonk.play();
        this.dx *= .9;
        return true;
      }
      else return false;
    }
    
    // cars on the bottom of the road
    else if (y < 410) {
      int index = leftCars.indexOf(this);
      if (index >= 1) c = leftCars.get(index-1);
      else c = leftCars.get(leftCars.size()-1);
      
      if (abs(c.dx) >= abs(this.dx)) return false;
      if (this.x <= c.x + c.w) {
        carHonk.rewind();
        carHonk.play();
        this.dx *= 1.1;
        return true;
      }
      else return false;
    }
    
    return false;
  }
   
}