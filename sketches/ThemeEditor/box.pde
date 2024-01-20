class Box {
  int x;
  int y;
  int w;
  int h;
  color originalColor;
  color col;
  String name;
  boolean isActive = false;
  boolean togglePressed = false;
  
  Box(int x_, int y_, int w_, int h_, color orig, String name_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    originalColor = orig;
    col = orig;
    name = name_;
  }
  
  public void display() {
    
    fill(bgCol);
    noStroke();
    rect(x +1, y +1, w -1, h -1);
    
    if(isActive || togglePressed) {
      noFill();
      stroke(#ffffff);
      strokeWeight(2);
      rect(x, y, w, h);
    }
    
    PImage img = template.get(x, y, w, h);
    
    fill(col);
    noStroke();
    
    for(int i = 0; i < img.width; i++) { 
      for(int j = 0; j < img.height; j++) { 
        if(img.get(i, j) == originalColor || img.get(i, j) != origBgCol) {
          rect(x +i, y +j, 1, 1);
        }
      }
    }
  }
  
  public void checkHover() {
    if(mouseX > x && mouseX < x +w && mouseY > y && mouseY < y +h) {
      isActive = true;
      if(mousePressed) {
        println(name + " \tcolor ( #" + hex(originalColor, 6) + " ) -> ( #" + hex(col, 6) + " )");
        togglePressed = !togglePressed;
        delay(80);
      }
    }
    else {
      if(mousePressed && mouseX <= tw) togglePressed = false;
      isActive = false;
    }
  }
}
