class Agent {
 PVector pos;
 
 Agent() {
   pos = new PVector();
 }
 
 void move(int x, int y) {
   pos.x = x;
   pos.y = y;
 }
  
  void display(PImage src, PGraphics target, int maxSize, float angle, color col) {
    target.pushMatrix();
    target.stroke(col);
    color c = src.get((int)pos.x, (int)pos.y);
    int weight = rgbtoCMYK(c, col, maxSize);
    target.strokeWeight(weight +add);
    target.rotate(angle);
    if(weight > 0) target.point(pos.x, pos.y);
    target.popMatrix();
  }
  
  int rgbtoCMYK(color c, color col, int maxSize) {
    float result = 0;
    float r_ = red(c) /255.0;
    float g_ = green(c) /255.0;
    float b_ = blue(c) /255.0;
    //https://www.rapidtables.com/convert/color/rgb-to-cmyk.html
    float k = 1.0 -max(r_, g_, b_);
    switch(col) {
      case #00ffff: //C
        result = (1.0 -r_ -k) /(1.0 -k);
        break;
      case #ff00ff: //M
        result = (1.0 -g_ -k) /(1.0 -k);
        break;
      case #ffff00: //Y
        result = (1.0 -b_ -k) /(1.0 -k);
        break;
      case #000000: //K
        result = k;
        break;
    }
    return int(result *maxSize);
  }
}
