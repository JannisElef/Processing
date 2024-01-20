//Video in frames
//ffmpeg -i "eoa hdexaxea.mp4" -pix_fmt rgb24 "C:/Users/Jannis Eleftherakis/Desktop/processing/minecraft_mosaic/src/animation/frame_%04d.png"

String path = "\\z_data\\blocks_16_clean\\";

PImage[] textures;
color[] avgColors;

String name = "chameleon.jpg";
String frameName = "frame_";

boolean animation = true;
boolean printInfo = false;
PImage image;

PVector res;
int w, h;

float origImgMult = 1;

void settings() { 
  if(!animation) image = loadImage(sketchPath() + "/src/" + name);
  else {
    image = loadImage(sketchPath() + "/src/animation/" + frameName + "0001.png");
  }
  
  if(origImgMult > 1) {
    image.resize((int)(image.width *origImgMult), (int)(image.height *origImgMult));
  }
  
  res = new PVector(image.width +(16 -image.width %16), image.height +(16 -image.height %16));
  
  size((int)res.x, (int)res.y);
  w = (int)res.x/16;
  h = (int)res.y/16;
  
  println("Original (" + image.width + "x" + image.height + ") -> (" + width + "x" + height + ") -> " + w + "x" + h + " tiles.");
} 

void setup() { 
  frameRate(1);
  loadTextures();
  calculateAverageColor();
  
  noLoop();
} 

int cnt = 1;
void draw() { 
  long t = millis();
  /*
  drawLayer(8 - (cnt));
  cnt++;
  if(cnt == 8) {
    cnt = 1;
  }
  */
  makeImageSequence(sketchPath() + "/src/animation/");
  println("---- rendered in " + ((millis() -t) /1000.0) + "s ----");
  if(animation) exit();
} 

void makeImageSequence(String s) {
  if(printInfo) print("Drawing Image Sequence...");
  long time = millis();
  
  File folder = new File(s);
  File[] listOfFiles = folder.listFiles();
  
  for (int i = 0; i < listOfFiles.length; i++) {
    if (listOfFiles[i].isFile()) {
      PImage frame = loadImage(s + listOfFiles[i].getName());
      if(origImgMult > 1) {
        frame.resize((int)(frame.width *origImgMult), (int)(frame.height *origImgMult));
      }
      drawFrame(frame, 1);
      save(sketchPath() + "/out/animation/frame_" + (i +1) + ".png");
      if(printInfo) println("Frame(" + (i +1) + "/" + listOfFiles.length + "): " + listOfFiles[i].getName());
    } 
  }  
  if(printInfo) print("(in " + (float)((millis() -time) /1000.0f) + "s).\n");
}

void drawFrame(PImage img, int scale) {
 background(getAvgImgCol(img, img.width, img.height));
 drawLayer(img, scale); 
}

void drawLayer(PImage img, int sizeMult) {
  if(printInfo) print("Drawing Layer with size " + sizeMult + "...");
  long time = millis();
  for(int y_ = 0; y_ < h /sizeMult; y_++) { 
    for(int x_ = 0; x_ < w /sizeMult; x_++) { 
      color col = getAvgImgCol(img.get(x_ *sizeMult *16, y_ *sizeMult *16, sizeMult *16, sizeMult *16), 16, 16);
      drawImage(getMatchingTexture(col), x_ *sizeMult *16, y_ *sizeMult *16, sizeMult);
    }
  }
  if(printInfo) print(" done (in " + (float)((millis() -time) /1000.0f) + "s).\n");
}

void drawImage(PImage img, int x, int y, int mult) {
  noStroke();
  for(int y_ = 0; y_ < 16; y_++) { 
    for(int x_ = 0; x_ < 16; x_++) { 
      fill(img.get(x_, y_));
      rect(x + x_*mult, y + y_*mult, mult, mult);
    }
  }
}

PImage getMatchingTexture(color c) {
  int index = 0;
  float dist = 100;
  for (int i = 0; i < textures.length; i++) {
    float newDist = calcDistance(c, avgColors[i]);
    if(newDist < dist) {
      dist = newDist;
      index = i;
    }
  }
  return textures[index];
}

float calcDistance(color c1, color c2) {
  return ((abs(red(c1) -red(c2))) +(abs(green(c1) -green(c2))) +(abs(blue(c1) -blue(c2)))) /3;
}

void calculateAverageColor() {
  print("Calculating average colors...");
  long time = millis();
  for (int i = 0; i < textures.length; i++) {
    avgColors[i] = getAvgImgCol(textures[i], 16, 16);
  }
  print(" done (in " + (float)((millis() -time) /1000.0f) + "s).\n");
}

color getAvgImgCol(PImage img, int w_, int h_) {
  float r = 0, g = 0, b = 0;
  for(int y_ = 0; y_ < h_; y_++) { 
    for(int x_ = 0; x_ < w_; x_++) { 
      color c = img.get(x_, y_);
      r += red(c);
      g += green(c);
      b += blue(c);
    }
  }
  return color((int)(r /(w_ *h_)), (int)(g /(w_ *h_)), (int)(b /(w_ *h_)));
}

void loadTextures() {
  print("Loading textures...");
  long time = millis();
  File folder = new File(sketchPath() + path);
  File[] listOfFiles = folder.listFiles();
  
  textures = new PImage[listOfFiles.length];
  avgColors = new color[listOfFiles.length];
  
  for (int i = 0; i < listOfFiles.length; i++) {
    if (listOfFiles[i].isFile()) {
      textures[i] = loadImage(sketchPath() + path + listOfFiles[i].getName());
    } 
  }  
  print(" done (in " + (float)((millis() -time) /1000.0f) + "s).\n");
}

void keyPressed() {
  if(key == ENTER) {
    save(sketchPath() + "/out/" + year() + "." + month() + "." + day() + " " + name + "_" + hex((int)random(Integer.MAX_VALUE)) +".png");
    println("saved");
  }
}
