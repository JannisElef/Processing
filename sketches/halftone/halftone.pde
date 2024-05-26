
PImage img;
PGraphics result;
Agent C;
Agent M;
Agent Y;
Agent K;

int cnt_x = 700;
int cnt_y = 700; 

int add = 0;

float scale = 1;

int orig_w, orig_h;
void settings() { 
  smooth(8);
  img = loadImage("image.png");
  int s = img.width;
  if(img.height > s) s = img.height;
  
  orig_w = img.width;
  orig_h = img.height;
  size(int(s *scale *2), int(s *scale *2));
} 

void setup() { 
  img = makeSquare(img);
  img.resize(int(img.width *scale), int(img.height *scale));
  
  
  cnt_x *= scale;
  cnt_y *= scale;
  
  C = new Agent();
  M = new Agent();
  Y = new Agent();
  K = new Agent();
  noLoop();
} 

void draw() { 
  int t = millis();
  //background(#ffffff);
  
  result = createGraphics(width, height);
  result.beginDraw();
  result.background(#ffffff);
  
  result.image(drawGrid(width/9.13, -height/11.2215, cnt_x, cnt_y, img, 0.2, C, #00ffff), 0, 0);
  result.image(drawGrid(-width/11.2215, height/9.13, cnt_x, cnt_y, img, -0.2, M, #ff00ff), 0, 0);
  result.image(drawGrid(-width/6.46, height/4.26, cnt_x, cnt_y, img, -0.4, Y, #ffff00), 0, 0);
  result.image(drawGrid(width/4.26, -height/6.46, cnt_x, cnt_y, img, 0.4, K, #000000), 0, 0);
  
  result.endDraw();
  
  image(result, 0, 0);
  //noFill();
  //stroke(#00ff00);
  //strokeWeight(2);
  //rect(width /4, height /4, width /2, height /2);
  println("(" + (millis()-t)/1000.0 + "s)");
} 

PGraphics drawGrid(float x, float y, int w, int h, PImage src, float angle, Agent a, color c) {
  PGraphics pg = createGraphics(src.width *2, src.height *2);
  pg.beginDraw();
  pg.background(#ffffff);
  pg.translate(width/2, height/2);
  pg.rotate(-angle);
  pg.image(src, -src.width/2, -src.height/2);
  pg.endDraw();

  int dx = (pg.width /w);
  int dy = (pg.height /h);
  
  PGraphics pg2 = createGraphics(src.width *2, src.height *2);
  pg2.beginDraw();
  for(int y_ = 0; y_ < h; y_++) { 
    for(int x_ = 0; x_ < w; x_++) { 
      a.move((x_ *dx), (y_ *dy));
      a.display(pg, pg2, dx +1, angle, c);
    }
  }
  pg2.endDraw();
  PGraphics out = createGraphics(src.width *2, src.height *2);
  out.beginDraw();
  out.image(pg2, x, y);
  out.endDraw();
  
  return out;
}    

PImage makeSquare(PImage src) {
  int s = src.width;
  if(src.height > s) s = src.height;
  PGraphics pg = createGraphics(s, s);
  pg.beginDraw();
  pg.background(#ffffff);
  pg.imageMode(CENTER);
  pg.image(src, pg.width/2, pg.height/2);
  pg.endDraw();
  return pg.get();
}

void export() {
  PImage out = get(width/5, height/5, width -((width/5)*2), height -((height/5)*2));
  String msg = "" + img.width + "x" + img.height + "x" + scale + "+" + add + "_" + cnt_x + "." + cnt_y + "_" + hex(int(random(Integer.MAX_VALUE))) + ".png";
  out.save(sketchPath() + "\\out\\" + msg);
  println("exported: " + msg);
}

void keyPressed() {
  if(keyCode == ENTER) {
    export();
  }
}
