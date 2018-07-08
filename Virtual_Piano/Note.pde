/** Note class
 * This class draws and animates the dropping music notes. 
 * In this program, these notes are drawn and animated when the mouse is pressed.
 *
 * @author Aniruddha Murali
 */
 
class Note {
  float x, y;
  float dy = 5;
  
  /** Note()
   * This is the constructor class for the note images
   *
   * @param ix(float) - the x-coordinate of the note(image)
   * @param iy(float) - the y-coordinate of the note(image)
   * @return none
   */
  Note(float ix, float iy) {
    x = ix;
    y = iy;
  }
  
  /** drawNote()
   * This method draws the note(image)
   *
   * @param none
   * @return none
   */
  void drawNote() {
    if (x < width/2) image(whitenote, x, y, 64.8, 119.8); // original dimensions: 324, 599
    else image(blacknote, x, y, 64.56, 111.67); // original dimensions: 581, 1005
    
    dy += 1;
    y += dy;
  }
  
}