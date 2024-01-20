PImage img;
int res = 14;

float sizeMult = 1;

void settings() {
  img = loadImage(sketchPath() + "/src/totoro.jpg");
  
  if(sizeMult > 1) img.resize((int)(img.width *sizeMult), (int)(img.height *sizeMult));
  size(img.width, img.height);
}

void setup() {
  PFont mono;
  mono = createFont("CONSOLA.TTF", res);
  background(0);
  textFont(mono);
  textLeading(0);
  noLoop();
}

String letters = "$@B%8&WM#*oahkbdpqwmZO0QLCJUYXzcvunxrjft/|()1{}[]?";
String add = "-_+~<>i!lI;:,\"^`'. ";

void draw() {
  background(0);
  for (int b = 0; b < 10; b++) {
    for (int y = res; y < img.height; y += res -ceil(res/10)) {
      for (int x = res; x < img.width; x += res -ceil(res/5)) {
        color c = img.get(x, y);
        int d = (int)((red(c) + green(c) + blue(c)) / 3);
        int l = (int)map(d, 0, 255, 0, letters.length() -1);
        fill(c);
        text(letters.charAt(l), x -res/2, y);
      }
    }
  }
}

void keyPressed() {
  if (key == ENTER) {
    speichern();
    println("saved");
  }
}
void speichern() {
  String name = sketchPath() + "/out/" + res + "_text_" + random(20, 400) * Integer.MAX_VALUE/random(100) + ".png";
  save(name);
}
