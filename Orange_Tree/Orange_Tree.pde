/** Orange Tree Program
 * Draws an orange tree and allows user to interact with it
 *
 * @author Aniruddha Murali
 * @school Staples High School
 * @version 1.0.0
 *
 */
 
PFont f;

float buttonX = 120;
float buttonY = 750;
float buttonXStep = 170;

Button grow = new Button(buttonX, buttonY, "Grow");
Button shrink = new Button(buttonX + buttonXStep, buttonY, "Shrink");
Button addOranges = new Button(buttonX + 2*buttonXStep, buttonY, "Add Oranges");
Button dropOranges = new Button(buttonX + 3*buttonXStep, buttonY, "Drop Oranges");
Button increaseWind = new Button(buttonX + 4*buttonXStep, buttonY, "+Wind");
Button decreaseWind = new Button(buttonX + 5*buttonXStep, buttonY, "-Wind");

Tree orangeTree = new Tree(500, 720, 90, 0);

/** setup()
 * This method sets up the program
 *
 * @param none
 * @return none
 */
void setup(){
  size(1300,800);
  orangeTree.setting();
  f = createFont("Calibiri", 30, true);
  orangeTree.drawTree(500, 720, 90, 0);
}


/** draw()
 * This method is the main method that executes the whole program
 *
 * @param none
 * @return none
 */
void draw() {
  
  drawButtons();
  
  if (grow.pressed() == true) {
    orangeTree.setting();
    orangeTree.growTree();
  }
  
  if (shrink.pressed() == true) {
    orangeTree.setting();
    orangeTree.shrinkTree();
  }
  
  if (addOranges.pressed() == true) {
    orangeTree.setting();
    orangeTree.addOranges();
  }
  
  if (dropOranges.pressed() == true){
    orangeTree.setting();
    orangeTree.dropOranges();
  }
  
  if (increaseWind.pressed() == true) {
    orangeTree.setting();
    orangeTree.increaseWind();
  }
  
  if (decreaseWind.pressed() == true) {
    orangeTree.setting();
    orangeTree.decreaseWind();
  }
  
  drawButtons();
  
}

/** drawButtons()
 * This method draws all Buttons that are listed in the method
 *
 * @param none
 * @return none
 */
void drawButtons(){
  grow.drawIt();
  shrink.drawIt();
  addOranges.drawIt();
  dropOranges.drawIt();
  increaseWind.drawIt();
  decreaseWind.drawIt();
}


  
class Tree {
  float x1;
  float y1;
  float x2;
  float y2;
  float size;
  float angle;
  float growSpeed = 5;
  boolean addOranges = false;
  boolean dropOranges = false;
  float[] orangeX = new float[100];
  float[] orangeY = new float[100];
  float index = 0;
  int values = 0;

  
  /** Tree()
   * Constructor method that creates a tree
   *
   * @param x(float) - the starting x-coordinate of the tree
   * @param y(float) - the starting y-coordinate of the tree
   * @param treeSize(float) - the size of the tree
   * @param branchAngle(float) - angle at which the tree slants
   * @return none
   */
  Tree(float x, float y, float treeSize, float branchAngle){
    x1 = x;
    y1 = y;
    size = treeSize;
    angle = branchAngle;
  }
  
  /** setting()
   * This method draws the setting, which includes the background and the ground
   *
   * @param none
   * @return none
   */
  void setting(){
    background(145,210,255);
    fill(120,40,40);
    rectMode(CORNERS);
    rect(0,0.9*height, width, height);
  }
  
  
  /** drawTree()
   * This method uses the recursion of branches to draw a tree
   *
   * @param x1(float) - the starting x-coordinate of the tree
   * @param y1(float) - the starting y-coordinate of the tree
   * @param size(float) - the size of the tree
   * @param angle(float) - angle at which the tree slants
   * @return none
   */
  void drawTree(float x1, float y1, float size, float angle) {
    
    if (size <= 5. || abs(angle)>80) return; 
    else {
  
      // the color transitions from brown for large branch sizes
      // to green for small branch sizes
      float h = random(0, 30);
      float r = size/200 * 165 + h;
      float g = 42 + h;
      float b = size/200 * 42 + h;
      stroke(r, g, b);
      
      // the line thickness depends on the branch size
      float n = size/8.0;
      if (n<1) n = 1;
      strokeWeight(n);
  
      // define the starting/ending locations of this branch
      float x2 = x1 - size*sin(angle*PI/180.);
      float y2 = y1 - size*cos(angle*PI/180.);
      line(x1,y1,x2,y2);
      
      
      if (addOranges == true && values < 100){
        
        int toggle = int(round(random(0,100)));
        if (toggle == 1) {
          fill(255,128,0);
          ellipse(x2,y2,10,10);
          orangeX[values] = x2;
          //println(orangeX[0]);
          //println(x2);
          //println(orangeX);
          orangeY[values] = y2;
          values = values + 1;
        }
      }
      
      
      if (dropOranges == true && values >= 100){
        
        for (int i = 0; i < values; i++) {
          //println("I'm here at dropOranges");
          for (float j = orangeY[i]; j < 720; j++){
            fill(255,128,0);
            stroke(0);
            strokeWeight(1);
            ellipse(orangeX[i], j, 10, 10);
            //println(orangeX[i]);
            //println(j);
            //println("I'm here at dropOranges");
          }
          //println(i);
        }
        values = 0;
        //dropOranges = false;
        //addOranges = false;
      }
      
      //if (dropOranges == false) values = 0;
      
      // recursively call three more branches that start where the current branch ends
      drawTree(x2,y2, size*0.73, angle-10);
      drawTree(x2,y2, size*0.73, angle+35);
      drawTree(x2,y2, size*0.73, angle-35);
      
    }
  }
 
 
  /** growTree()
   * This method increases the size of the tree
   *
   * @param none
   * @return none
   */
  void growTree(){
    if (size < 180) size += growSpeed;
    else {
      textFont(f, 30);
      textAlign(CENTER, CENTER);
      fill(0,150,0);
      text("The tree can't grow any more than this...", width/2, 40);
    }
    orangeTree.drawTree(500, 720, size, -angle);
  }
  
  
  /** shrinkTree()
   * This method decreases the size of the tree
   *
   * @param none
   * @return none
   */
  void shrinkTree(){
    if (size > 40) size -= growSpeed;
    else {
      textFont(f, 30);
      textAlign(CENTER, CENTER);
      fill(0,150,0);
      text("The tree can't shrink any more than this...", width/2, 40);
    }
    orangeTree.drawTree(500, 720, size, -angle);
  }
  
  
  /** increaseWind()
   * This method increases the angle at which the tree is drawn
   *
   * @param none
   * @return none
   */
  void increaseWind(){
    if (angle < 70) angle = angle + random(0,2*PI);
    else {
      textFont(f, 30);
      textAlign(CENTER, CENTER);
      fill(0,150,0);
      text("The wind reached its limit!", width/2, 40);
    }
    orangeTree.drawTree(500, 720, size, -angle);
  }
  
  
  /** decreaseWind()
   * This method decreases the angle at which the tree is drawn
   *
   * @param none
   * @return none
   */
  void decreaseWind(){
    if (angle > 5) angle = angle + random(-10,-1);
    else {
      textFont(f, 30);
      textAlign(CENTER, CENTER);
      fill(0,150,0);
      text("There is no wind.", width/2, 40);
    }
    //println(angle);
    orangeTree.drawTree(500, 720, size, -angle);
  }
  
  
  /** addOranges()
   * This method makes addOranges = true, which is used in the drawTree() function to add oranges
   *
   * @param none
   * @return none
   */
  void addOranges() {
    addOranges = true;
    dropOranges = false;
    orangeTree.drawTree(500, 720, size, -angle);
  }
  
  
  /** dropOranges()
   * This method makes dropOranges = true, which is used in the drawTree() function to drop the oranges
   *
   * @param none
   * @return none
   */
  void dropOranges() {
    addOranges = false;
    dropOranges = true;
    orangeTree.drawTree(500, 720, size, -angle);
  }
  
  /*void generateOranges() {
    for (int i = 0; i < 100; i++) {
      float x2 = x1 - size*sin(angle*PI/180.);
      float y2 = y1 - size*cos(angle*PI/180.);
    }
  }*/
}




// This is the button class definition
class Button {
  float x, y, w, h;    // stores the location and geometry of the button
  String label;        // stores the label to printinside the button
  boolean pressed;     // stores a boolean (true or false) for if the button is being pressed
  
  /** Tree()
   * Constructor method that creates a button
   *
   * @param initialx(float) - x-coordinate of button
   * @param initialy(float) - y-coordinate of button
   * @param initialLabel(float) - text in the button
   * @return none
   */
  Button(float initialx, float initialy, String initialLabel) {
   x = initialx;
   y = initialy;
   w = 140;
   h = 35;  
   label = initialLabel;
   pressed = false; 
  }
  
  /** drawIt()
   * This method draws the button
   *
   * @param none
   * @return none
   */
  void drawIt() {
    
    // backgrond fill of button
    fill(240);
    noStroke();
    rectMode(CORNER);
    rect(x,y,w,h);
    
    // draw shading with shadow in the lower right side of the box
    if (pressed == false) {
     stroke(190);
     strokeWeight(3);
     line(x, y+h, x, y);
     line(x, y, x+w, y);
     stroke(0);
     line(x, y+h, x+w, y+h);
     line(x+w, y, x+w, y+h);
     strokeWeight(1);
    }
    
    // draw shading with shadow in the upper left side of the box
    if (pressed == true) {
     stroke(0);
     strokeWeight(3);
     line(x, y+h, x, y);
     line(x, y, x+w, y);
     stroke(190);
     line(x, y+h, x+w, y+h);
     line(x+w, y, x+w, y+h);
     strokeWeight(1);
    }
    
    // print the label
    fill(0);
    textAlign(CENTER, CENTER);
    textFont(f,20);
    text(label, x+w/2., y+h/2.-1.); 
  }
  
  /** drawTree()
   * This method checks whether or not the button was pressed
   *
   * @param none
   * @return none
   */
  boolean pressed() {
   float mx = mouseX;
   float my = mouseY;
   if (mx>=x && mx<=x+w && my>=y && my<=my+h && mousePressed==true) {
     this.pressed = true;
     return true;
   } else {
    this.pressed = false; 
    return false;
    } 
  }
  
  
} 
