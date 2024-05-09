class Letter {
  int w, h;
  char letter;
  
  PImage img;
  
  Letter(char letter_, int w_, int h_, PImage src) {
    w = w_;
    h = h_;
    img = src;
    letter = letter_;
  }
}
