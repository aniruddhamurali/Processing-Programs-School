PImage img;

void setup() {
  size(400,400);
  //img = loadImage("iron-puzzle.png");
  img = loadImage("copper-puzzle.png");
  int dimension = img.width * img.height;
  img.loadPixels();
  //iron(img,dimension);
  copper(img,dimension);
}

void draw() {
  image(img,0,0);
}


void iron(PImage iron, int dimension) {
  for (int i = 0; i < dimension; i++) {
    float red = red(iron.pixels[i])*10;
    img.pixels[i] = color(red,0,0);
  }
  img.updatePixels();
}


void copper(PImage copper, int dimension) {
  for (int i = 0; i < dimension; i++) {
    float blue = blue(copper.pixels[i])*20;
    float green = blue(copper.pixels[i])*20;
    img.pixels[i] = color(0,green,blue);
  }
  img.updatePixels();
}


void west(PImage west, int dimension) {
  for (int i = 0; i < dimension; i++) {
    
  }
}