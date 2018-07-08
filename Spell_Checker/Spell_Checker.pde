 /* **************************************************
 * * AP COMPUTER SCIENCE PRINCIPLES - PROBLEM SET 04 *
 * * PROJECT: SPELL CHECKER                          *
 * ***************************************************
 * Program files list (Spell_Checker.zip):
 * -------------------
 * Spell_Checker.pde      - Main program file
 * Button.pde             - Button Class
 * HashStruct.pde         - HashTable class
 * outputBox.pde          - OutputBox Class
 *
 * Required libraries:
 * -------------------
 * g4p - Library for 2D GUI controls
 *
 * ***********************************************************
 */
 
/** Spell_Checker
 * User can check for any spelling errors in either file or textbox
 *
 * @author Aniruddha Murali
 */


// importing g4p_control libraries
// the g4p library is used to make the textbox
import g4p_controls.*;
import g4p_controls.GCScheme;
GTextArea textArea;

String[] words;
String[] userText;

HashTable dictionary = new HashTable(100); // hash table that consists of all correctly spelled words

PFont f;
Button spellCheck;
Button openFile;
boolean pressTemp = false; // makes sure that there is no more than one window when selectInput() is called
OutputBox output;



void setup() {
  size(640,360);
  f = createFont("Calibri", 30);
  textArea = new GTextArea(this, width/2 - 300, height/5, 250, 200, G4P.SCROLLBARS_NONE);
  textArea.setText("");
  
  spellCheck = new Button(280, 200, 70, 70, "Check");
  openFile = new Button(width/2 - 60, 300, 120, 50, "Select File");
  output = new OutputBox(400, 72, 200, 200);
  
  words = loadStrings("words.txt");
  for (int i = 0; i < words.length; i++) {
      dictionary.put(words[i].toLowerCase(), "");
  }
}



/** draw()
 * This method is the main method that executes the whole program
 *
 * @param none
 * @return none
 */
void draw() {
  background(0);
  fill(255);
  textAlign(CENTER, CENTER);
  textFont(f,20);
  text("Type here or select file", 145, 52);
  fill(0,100,255);
  textFont(f,25);
  text("Spell Checker", width/2, 22);
  stroke(0,0,255);
  line(250, 38, 385, 38);
  
  output.display();
  openFile.display();
  spellCheck.display();
  if (spellCheck.pressed() == true) userText = split(textArea.getText(), " ");
  if (openFile.pressed() == true && pressTemp == false) { 
    selectInput("Select a file to process:", "fileSelected"); 
    pressTemp = true; 
  }
  output.printErrors();
}


/** keyPressed()
 * This method executes whenever a key is pressed
 *
 * @param none
 * @return none
 */
void keyPressed() {
  if (keyCode == ENTER) userText = split(textArea.getText(), " ");
}



/** fileSelected()
 * This function gets the file the user selected
 *
 * @param selection(File) - the file the user selected
 * @return none
 */
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } 
  else {
    println("User selected " + selection.getAbsolutePath());
    userText = loadStrings(selection);
  }
  
  pressTemp = false;
}



/** checkSpelling()
 * This checks the spelling of words stored in the userText variable and returns all spelling errors
 *
 * @param none
 * @return errors(String[]) - array of spelling errors
 */
String[] checkSpelling() {
  String[] errors = {};
  String[] line;
  
  for (int i = 0; i < userText.length; i++) {
     line = split(userText[i], " ");
     
     for (int j = 0; j < line.length; j++) {
       for (int k = 0; k < line[j].length(); k++) {
         if (line[j].charAt(k) == ' ' || line[j].charAt(k) == ',' || line[j].charAt(k) == '.' || line[j].charAt(k) == '-'|| 
         line[j].charAt(k) == '.') { 
           line[j] = line[j].replace(str(line[j].charAt(k)), ""); 
         }
       }
       
       if (dictionary.find(line[j]) == false && line[j].length() != 0) errors = append(errors, line[j]);
     }
  }
  return errors;
}