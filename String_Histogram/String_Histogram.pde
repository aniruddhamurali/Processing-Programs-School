// HashMap with keys being characters and values being frequencies
HashMap<String, Integer> frequencies = new HashMap<String, Integer>(); 
// characters is an array with characters of interest
String[] characters = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", 
"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"};

// String that is being evaluated; this is the input
String input = "ajskbjkfbajvbadvnljv hdafgkgp[so'f'\fjkdbsblfnclal\fyjr]perj2"; 

ArrayList<Bar> bars = new ArrayList<Bar>();
String character;
int val;
int maxFreq = 0;   // highest frequency of any character is used to scale the y-axis
int top = 50;      // y-coordinate of the top of the histogram
int xAxis = 450;   // y-coordinate of x-axis
int yAxis = 100;   // x-coordinate of y-axis
int barWidth = 22;



void setup() {
  size(960, 540);
  background(0);
  for (int i = 0; i < characters.length; i++) {
    frequencies.put(characters[i], 0); // initialize the frequencies HashMap
  }
  frequencies.put("Other", 0);
}



/** draw()
 * This method is the main method that executes the whole program
 *
 * @param none
 * @return none
 */
void draw() {
  for (int i = 0; i < input.length(); i++) {
    character = str(input.charAt(i)).toLowerCase();
    
    // if character is a specific character of interest
    if (search(characters, character) == true) {
      val = frequencies.get(character);
      frequencies.put(character, val+1);
    }
    // otherwise, just add one to the "Other" category
    else frequencies.put("Other", frequencies.get("Other")+1);
    
    if (val+1 > maxFreq) maxFreq = val+1; // update the maximum frequency
    else if (frequencies.get("Other") > maxFreq) maxFreq = frequencies.get("Other"); 
  }
  
  histogram();
  println(frequencies);
  println(maxFreq);
  noLoop();
}
  
  
/** histogram()
 * This method draws the histogram for frequency of characters in a String
 *
 * @param none
 * @return none
 */
void histogram() {
  textSize(13);
  
  // create bar instances
  for (int i = 0; i < frequencies.size()-1; i++) {
    bars.add(new Bar(yAxis+barWidth*i, xAxis-(xAxis-top)/maxFreq * frequencies.get(characters[i])));
  }
  bars.add(new Bar(yAxis+barWidth*(frequencies.size()-1) + 10, xAxis-(xAxis-top)/maxFreq * frequencies.get("Other"))); // Other bar
  
  // draw bars
  for (int j = 0; j < bars.size(); j++) {
    Bar b = bars.get(j);
    b.drawBar();
  }
  
  // draw axes
  stroke(255);
  line(yAxis,top,yAxis,xAxis);
  line(yAxis,xAxis,930,xAxis);
  
  // y-axis labels
  for (int k = 0; k <= maxFreq; k++) {
    fill(0,0,255);
    textAlign(CENTER, CENTER);
    text(str(k), yAxis-20, xAxis-k*400/maxFreq);
    line(yAxis-10, xAxis-k*400/maxFreq, yAxis, xAxis-k*(xAxis-top)/maxFreq);
    
  }
  
  // x-axis labels
  for (int l = 0; l < bars.size()-1; l++) {
    fill(255,125,20);
    line(yAxis+barWidth/2 + barWidth*l, xAxis, yAxis+barWidth/2 + barWidth*l, xAxis+10);
    text(characters[l], yAxis+barWidth/2 + barWidth*l, xAxis+20);
  }
  line(yAxis+barWidth/2 + barWidth*(bars.size()-1)+10, xAxis, yAxis+barWidth/2 + barWidth*(bars.size()-1)+10, xAxis+10);
  text("Other", yAxis+barWidth/2 + barWidth*(bars.size()-1)+10, xAxis+20);
}



/** Bar class
 * class for all bars in the histogram
 *
 * @param none
 * @return none
 */
class Bar {
  int x, y; // bottom left coordinates
  int w;
  
  /** Bar()
  * Constructor method for the bar
  *
  * @param ix(int) - the initial x coordinate of the bar
  * @param iy(int) - the initial y coordinate of the bar
  *
  * @return none
  */
  Bar(int ix, int iy) {
    x = ix;
    y = iy;
    w = barWidth;
  }
  
  /** drawBar()
  * This method draws the bar
  *
  * @param none
  * @return none
  */
  void drawBar() {
    stroke(0);
    fill(255,0,0);
    rectMode(CORNERS);
    rect(x, xAxis, x+w, y);
  }
}


/** search()
  * This method searches for a string in a string array
  *
  * @param array(String[]) - the array of strings
  * @param string(String) - string to be searched
  *
  * @return - returns whether string of interest is in array
  */
boolean search(String[] array, String string) {
  for (int i = 0; i < array.length; i++) {
    if (array[i].equals(string)) return true;
  }
  return false;
}




  