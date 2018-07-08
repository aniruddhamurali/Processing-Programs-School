/* ***********************************************************
 * * AP COMPUTER SCIENCE PRINCIPLES - 2017 SUMMER ASSIGNMENT * 
 * * THEME: MUSIC                                            *
 * * PROJECT: VIRTUAL PIANO                                  *
 * ***********************************************************
 * Project files list (Virtual_Piano.zip):
 * -------------------
 * Virtual_Piano.pde  - Main file
 * Button.pde         - Button Class
 * Cloud.pde          - Cloud Class
 * Key.pde            - Key Class
 * Note.pde           - Note Class
 * Star.pde           - Star Class
 * Sun.pde            - Sun Class
 * white-note.png     - White Music Note (Image)
 * black-note.png     - Black Music Note (Image)
 *
 * Required libraries:
 * -------------------
 * Minim - Library for audio
 *
 * Installing "Minim": 
 * -----------------
 * Step 1: Launch Processing Application
 * Step 2: Select Sketch --> Import Library --> Add Library
 * Step 3: Search for "Minim" and install the library
 * Step 4: You can now run the program
 * ***********************************************************
 */

/** Virtual Piano
 * User can play the piano
 * Theme: Music
 *
 * @author Aniruddha Murali
 * @version 1.0
 * @since August 31, 2017
 *
 */

// importing minim libraries
// the Minim library is used to play sounds
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out; // creating an AudioOutput object

// create ArrayLists to store all instances of keys, notes, or stars
ArrayList<Key> keys = new ArrayList<Key>();
ArrayList<Note> notes = new ArrayList<Note>();
ArrayList<Star> stars = new ArrayList<Star>();


PImage blacknote; // image of the black note
PImage whitenote; // image of the white note
Note note;
PFont f;


Sun sun = new Sun(150, 150, 100);
Moon moon = new Moon(1130, 150, 90);
Cloud cloud1 = new Cloud(450, 120, 150, 50, 3);
Cloud cloud2 = new Cloud(1150, 200, 150, 50, 6);


int noteloop = 1;                    // variable to regulate the frequency of the note images when the mouse is clicked
boolean playSongThreadOn = false;    // boolean variable that regulates when to create new threads to autoplay songs


// song arrays contain the keys needed to play the song
char[] song1 = {'f','f','k','k','l','l','k',' ','j','j','h','h','g','g','f',' ','k','k','j','j','h','h','g',' ','k','k','j','j','h','h','g',' ','f','f','k','k','l','l','k',' ','j','j','h','h','g','g','f'};
char[] song2 = {' ','j','y','p','c','h','g',' ','f','a','w','3','9','1','d',' ','5','n','i','o','2',' ','z'};


Button btnTwinkle = new Button(415, 210, 450, 50, "Play \" Twinkle Twinkle Little Star \"");
Button btnTwinkle2 = new Button(415, 280, 450, 50, "Play \" Random Mess \"");



void setup() {
  size(1280,720);
  background(0);
  f = createFont("Arial", 20);
  
  minim = new Minim(this);
  out = minim.getLineOut();
  out.setTempo(50);
  
  blacknote = loadImage("black-note.png");
  whitenote = loadImage("white-note.png");
  
  
  for (float i = 1; i <= 21; i++) {
    keys.add(new Key(126+49*(i-1), 695, "white")); // create the white keys
  }
  for (float i = 1; i <= 20; i++) {
    if (i == 3 || i == 7 || i == 10 || i == 14 || i == 17) continue;
    else {
      keys.add(new Key(160.5+49*(i-1), 620, "black")); // create the black keys
    }
  }
  
  for (int i = 0; i < 100; i++){
    float x = random(20,1200);
    float y = random(50,500);
    stars.add(new Star(x, y)); // create the instances of the stars
  }
  
}



/** draw()
 * This method is the main method that executes the whole program
 *
 * @param none
 * @return none
 */
void draw() {
  
  // when either of the buttons are pressed and there is only one thread, go into autoplay
  // creating a separate thread to play the song to avoid interference with the animation thread
  // note: in Processing, thread() can only work with functions that do not require a parameter
  if (btnTwinkle.pressed() == true && playSongThreadOn == false) { 
    thread("playSong"); 
    playSongThreadOn = true;
  }
  if (btnTwinkle2.pressed() == true && playSongThreadOn == false) { 
    thread("playSong2"); 
    playSongThreadOn = true;
  }
  
  // conditionals to switch between day setting and night setting
  if (mouseX < width/2) dayScreen(); 
  else nightScreen(); 
  
  // write text on the screen and draw the buttons
  if (mouseX < width/2) fill(0);
  else fill(255);
  textAlign(CENTER, CENTER);
  textFont(f,42);
  text("Virtual Piano v1.0", 640, 40);
  textFont(f, 27);
  fill(90);
  text("by Aniruddha Murali", 640, 90);
  fill(0);
  if (mouseX > width/2) fill(255);
  text("Songs:", 640, 160);
  strokeWeight(3);
  stroke(0);
  line(580, 180, 700, 180);
  strokeWeight(1);
  btnTwinkle.drawButton();
  btnTwinkle2.drawButton();
  textSize(20);
  fill(50);
  text("(Press any number key or letter key to play!)", 640, 450);
  
  strokeWeight(1);
  
  // when user clicks and holds on mouse, a stream of note images will appear
  if (mousePressed && mouseY < 480) {
    if (noteloop % 8 == 0) notes.add(new Note(mouseX, mouseY));
    for (int j = 0; j < notes.size(); j++) {
      Note n = notes.get(j);
      n.drawNote();
    }
  }
  
  // draw all the piano keys
  for (int i = 0; i < keys.size(); i++) {
    Key k = keys.get(i);
    k.drawKey();
  }
  
  // everytime a key is pressed, play the note that corresponds with it
  if (keyPressed) {
    playKey(key, 0, false);
  }
  
  noteloop += 1;
}



/** keyReleased()
 * This method executes whenever a key is released. It resets all the keys to their original states.
 *
 * @param none
 * @return none
 */
void keyReleased() {
  if (key == 'y' || key == 'Y') keys.get(0).type = "white";
  else if (key == 'u' || key == 'U') keys.get(1).type = "white";
  else if (key == 'i' || key == 'I') keys.get(2).type = "white";
  else if (key == 'o' || key == 'O') keys.get(3).type = "white";
  else if (key == 'p' || key == 'P') keys.get(4).type = "white";
  else if (key == 'a' || key == 'A') keys.get(5).type = "white";
  else if (key == 's' || key == 'S') keys.get(6).type = "white";
  else if (key == 'd' || key == 'D') keys.get(7).type = "white";
  else if (key == 'f' || key == 'F') keys.get(8).type = "white";
  else if (key == 'g' || key == 'G') keys.get(9).type = "white";
  else if (key == 'h' || key == 'H') keys.get(10).type = "white";
  else if (key == 'j' || key == 'J') keys.get(11).type = "white";
  else if (key == 'k' || key == 'K') keys.get(12).type = "white";
  else if (key == 'l' || key == 'L') keys.get(13).type = "white";
  else if (key == 'z' || key == 'Z') keys.get(14).type = "white";
  else if (key == 'x' || key == 'X') keys.get(15).type = "white";
  else if (key == 'c' || key == 'C') keys.get(16).type = "white";
  else if (key == 'v' || key == 'V') keys.get(17).type = "white";
  else if (key == 'b' || key == 'B') keys.get(18).type = "white";
  else if (key == 'n' || key == 'N') keys.get(19).type = "white";
  else if (key == 'm' || key == 'M') keys.get(20).type = "white";
  else if (key == '1' || key == '!') keys.get(21).type = "black";
  else if (key == '2' || key == '@') keys.get(22).type = "black";
  else if (key == '3' || key == '#') keys.get(23).type = "black";
  else if (key == '4' || key == '$') keys.get(24).type = "black";
  else if (key == '5' || key == '%') keys.get(25).type = "black";
  else if (key == '6' || key == '^') keys.get(26).type = "black";
  else if (key == '7' || key == '&') keys.get(27).type = "black";
  else if (key == '8' || key == '*') keys.get(28).type = "black";
  else if (key == '9' || key == '(') keys.get(29).type = "black";
  else if (key == '0' || key == ')') keys.get(30).type = "black";
  else if (key == 'q' || key == 'Q') keys.get(31).type = "black";
  else if (key == 'w' || key == 'W') keys.get(32).type = "black";
  else if (key == 'e' || key == 'E') keys.get(33).type = "black";
  else if (key == 'r' || key == 'R') keys.get(34).type = "black";
  else if (key == 't' || key == 'T') keys.get(35).type = "black";
}



/** playKey()
 * This method plays a note whenever a piano key is played
 * If the program is on autoplay, this method will reset the keys to their original state after being played
 *
 * @param keyNote(char) - the key/character that activates a piano key
 * @param delayTime(int) - delay time in milliseconds to pause between notes
 * @param autoPlay(boolean) - if the program is on autoplay, reset the keys after playing them
 * @return none
 */
void playKey(char keyNote, int delayTime, boolean autoPlay) {
    if (keyNote == 'y' || keyNote == 'Y') { keys.get(0).type = "red"; out.playNote("C3"); myDelay(delayTime); if (autoPlay) keys.get(0).type = "white"; }
    if (keyNote == 'u' || keyNote == 'U') { keys.get(1).type = "red"; out.playNote("E3"); myDelay(delayTime); if (autoPlay) keys.get(1).type = "white"; }
    if (keyNote == 'i' || keyNote == 'I') { keys.get(2).type = "red"; out.playNote("F3"); myDelay(delayTime); if (autoPlay) keys.get(2).type = "white"; }
    if (keyNote == 'o' || keyNote == 'O') { keys.get(3).type = "red"; out.playNote("G3"); myDelay(delayTime); if (autoPlay) keys.get(3).type = "white"; }
    if (keyNote == 'p' || keyNote == 'P') { keys.get(4).type = "red"; out.playNote("A3"); myDelay(delayTime); if (autoPlay) keys.get(4).type = "white"; }
    if (keyNote == 'a' || keyNote == 'A') { keys.get(5).type = "red"; out.playNote("B3"); myDelay(delayTime); if (autoPlay) keys.get(5).type = "white"; }
    if (keyNote == 's' || keyNote == 'S') { keys.get(6).type = "red"; out.playNote("C4"); myDelay(delayTime); if (autoPlay) keys.get(6).type = "white"; }
    if (keyNote == 'd' || keyNote == 'D') { keys.get(7).type = "red"; out.playNote("D4"); myDelay(delayTime); if (autoPlay) keys.get(7).type = "white"; }
    if (keyNote == 'f' || keyNote == 'F') { keys.get(8).type = "red"; out.playNote("E4"); myDelay(delayTime); if (autoPlay) keys.get(8).type = "white";}
    if (keyNote == 'g' || keyNote == 'G') { keys.get(9).type = "red"; out.playNote("F4"); myDelay(delayTime); if (autoPlay) keys.get(9).type = "white";}
    if (keyNote == 'h' || keyNote == 'H') { keys.get(10).type = "red"; out.playNote("G4"); myDelay(delayTime); if (autoPlay) keys.get(10).type = "white"; }
    if (keyNote == 'j' || keyNote == 'J') { keys.get(11).type = "red"; out.playNote("A4"); myDelay(delayTime); if (autoPlay) keys.get(11).type = "white"; }
    if (keyNote == 'k' || keyNote == 'K') { keys.get(12).type = "red"; out.playNote("B4"); myDelay(delayTime); if (autoPlay) keys.get(12).type = "white"; }
    if (keyNote == 'l' || keyNote == 'L') { keys.get(13).type = "red"; out.playNote("C5"); myDelay(delayTime); if (autoPlay) keys.get(13).type = "white"; }
    if (keyNote == 'z' || keyNote == 'Z') { keys.get(14).type = "red"; out.playNote("D5"); myDelay(delayTime); if (autoPlay) keys.get(14).type = "white"; }
    if (keyNote == 'x' || keyNote == 'X') { keys.get(15).type = "red"; out.playNote("E5"); myDelay(delayTime); if (autoPlay) keys.get(15).type = "white"; }
    if (keyNote == 'c' || keyNote == 'C') { keys.get(16).type = "red"; out.playNote("F5"); myDelay(delayTime); if (autoPlay) keys.get(16).type = "white"; }
    if (keyNote == 'v' || keyNote == 'V') { keys.get(17).type = "red"; out.playNote("G5"); myDelay(delayTime); if (autoPlay) keys.get(17).type = "white"; }
    if (keyNote == 'b' || keyNote == 'B') { keys.get(18).type = "red"; out.playNote("A5"); myDelay(delayTime); if (autoPlay) keys.get(18).type = "white"; }
    if (keyNote == 'n' || keyNote == 'N') { keys.get(19).type = "red"; out.playNote("B5"); myDelay(delayTime); if (autoPlay) keys.get(19).type = "white"; }
    if (keyNote == 'm' || keyNote == 'M') { keys.get(20).type = "red"; out.playNote("C6"); myDelay(delayTime); if (autoPlay) keys.get(20).type = "white"; }
    if (keyNote == '1' || keyNote == '!') { keys.get(21).type = "blue"; out.playNote("Db3"); myDelay(delayTime); if (autoPlay) keys.get(21).type = "black"; }
    if (keyNote == '2' || keyNote == '@') { keys.get(22).type = "blue"; out.playNote("Eb3"); myDelay(delayTime); if (autoPlay) keys.get(22).type = "black"; }
    if (keyNote == '3' || keyNote == '#') { keys.get(23).type = "blue"; out.playNote("Gb3"); myDelay(delayTime); if (autoPlay) keys.get(23).type = "black"; }
    if (keyNote == '4' || keyNote == '$') { keys.get(24).type = "blue"; out.playNote("Ab3"); myDelay(delayTime); if (autoPlay) keys.get(24).type = "black"; }
    if (keyNote == '5' || keyNote == '%') { keys.get(25).type = "blue"; out.playNote("Bb3"); myDelay(delayTime); if (autoPlay) keys.get(25).type = "black"; }
    if (keyNote == '6' || keyNote == '^') { keys.get(26).type = "blue"; out.playNote("Db4"); myDelay(delayTime); if (autoPlay) keys.get(26).type = "black"; }
    if (keyNote == '7' || keyNote == '&') { keys.get(27).type = "blue"; out.playNote("Eb4"); myDelay(delayTime); if (autoPlay) keys.get(27).type = "black"; }
    if (keyNote == '8' || keyNote == '*') { keys.get(28).type = "blue"; out.playNote("Gb4"); myDelay(delayTime); if (autoPlay) keys.get(28).type = "black"; }
    if (keyNote == '9' || keyNote == '(') { keys.get(29).type = "blue"; out.playNote("Ab4"); myDelay(delayTime); if (autoPlay) keys.get(29).type = "black"; }
    if (keyNote == '0' || keyNote == ')') { keys.get(30).type = "blue"; out.playNote("Bb4"); myDelay(delayTime); if (autoPlay) keys.get(30).type = "black"; }
    if (keyNote == 'q' || keyNote == 'Q') { keys.get(31).type = "blue"; out.playNote("Db5"); myDelay(delayTime); if (autoPlay) keys.get(31).type = "black"; }
    if (keyNote == 'w' || keyNote == 'W') { keys.get(32).type = "blue"; out.playNote("Eb5"); myDelay(delayTime); if (autoPlay) keys.get(32).type = "black"; }
    if (keyNote == 'e' || keyNote == 'E') { keys.get(33).type = "blue"; out.playNote("Fb5"); myDelay(delayTime); if (autoPlay) keys.get(33).type = "black"; }
    if (keyNote == 'r' || keyNote == 'r') { keys.get(34).type = "blue"; out.playNote("Ab5"); myDelay(delayTime); if (autoPlay) keys.get(34).type = "black"; }
    if (keyNote == 't' || keyNote == 'T') { keys.get(35).type = "blue"; out.playNote("Bb5"); myDelay(delayTime); if (autoPlay) keys.get(35).type = "black"; }
    if (keyNote == ' ') { myDelay(delayTime); }
}



/** myDelay()
 * This method delays a specific aspect of the program (in this case, to pause between notes)
 *
 * @param delayVal(int) - delay time in milliseconds
 * @return none
 */
void myDelay(int delayVal) {
  int start = millis();
  while (millis() - start <= delayVal) continue;
}



/** playSong()
 * This method plays song1 (Twinkle Twinkle Little Star) in autoplay
 *
 * @param none
 * @return none
 */
void playSong() {
  for (int n = 0; n < song1.length; n++) {
    playKey(song1[n], 500, true);
  }
  playSongThreadOn = false;
}



/** playSong2()
 * This method plays song2 (Random Mess) in autoplay
 *
 * @param none
 * @return none
 */
void playSong2() {
  for (int n = 0; n < song2.length; n++) {
    playKey(song2[n], 500, true);
  }
  playSongThreadOn = false;
}



/** mouseReleased()
 * This method clears the notes ArrayList when the mouse is released
 *
 * @param none
 * @return none
 */
void mouseReleased() {
  notes.clear(); 
}


/** dayScreen()
 * This method creates a morning setting
 *
 * @param none
 * @return none
 */
void dayScreen(){
  background(0,255,240);
  
  cloud1.drawCloud();
  cloud2.drawCloud();
  
  sun.drawSun();
  noStroke();
}



/** nightScreen()
 * This method creates a night setting
 *
 * @param none
 * @return none
 */
void nightScreen(){
  background(20,0,80);
  randomSeed(0); // keeps stars in the same position and same sequence
  
  for (int j = 0; j < stars.size(); j++) {
    Star s = stars.get(j);
    s.drawStar();
  }
  
  cloud1.drawCloud();
  cloud2.drawCloud();
  
  moon.drawMoon();
}