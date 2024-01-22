//saved theme.txt move from out/ to ---> processing-4.x.x/lib/theme/
//save with ENTER

PImage template;

PFont font;
int margin = 10;

color origBgCol = #2c2c2c;
color bgCol;

int tw, th;
void settings() { 
  template = loadImage("template.png");
  tw = template.width;
  th = template.height;
  size(tw +margin + tw/3, th);
} 
int numBoxes = 13;

Box b[];

void setup() { 
  image(template, 0, 0);
  bgCol = origBgCol;

  b = new Box[numBoxes];

  b[0] = new Box(125, 0, 100, 35, #c9ad96, "NULL (Text)");
  
  b[1] = new Box(70, 425, 172, 35, #f92672, "Function1");
  b[2] = new Box(40, 145, 70, 35, #66d9ef, "Function2");
  b[3] = new Box(40, 178, 55, 35, #f92672, "Function3");
  b[4] = new Box(90, 105, 88, 35, #98e12e, "Function4");
  
  b[5] = new Box(5, 105, 75, 35, #f92672, "Keyword1");
  b[6] = new Box(70, 248, 42, 35, #f92672, "Keyword3");
  b[7] = new Box(268, 178, 90, 35, #10cb84, "Keyword4");
  b[8] = new Box(5, 0, 110, 35, #f92672, "Keyword5");
  b[9] = new Box(70, 213, 72, 35, #f92672, "Keyword6");
  
  b[10] = new Box(270, 0, 150, 35, #d1da73, "Literal1");
  b[11] = new Box(5, 70, 125, 35, #98e12e, "Literal2");
  
  b[12] = new Box(5, 35, 110, 35, #629755, "Comment1");

  font = createFont("Iosevka-Regular.TTF", 40);
  textFont(font);
} 

void draw() { 
  //background(bgCol);
  image(template, 0, 0);
  for(int i = 0; i < numBoxes; i++) { 
    b[i].display();
    b[i].checkHover();
  }
  drawOverlay(tw +margin, 0, width -margin -tw, th +margin);
} 

String input = "";

void drawOverlay(int x_, int y_, int w_, int h_) {
  
  fill(#212121);
  noStroke();
  rect(x_, y_, w_, h_);
  
  for(int i = 0; i < numBoxes; i++) { 
    if (b[i].togglePressed) {
      
      fill(#e2e2e2);
      text(b[i].name, x_ +margin, y_ +margin +font.getSize());
      fill(b[i].col);
      
      rect(x_ +margin, y_ -margin*1.5 +font.getSize()*7, w_ -margin*2, +font.getSize()*2);
      fill(#e2e2e2);
      text("new color: ", x_ +margin, y_ +margin +font.getSize()*6);
      
      fill(#323232);
      rect(x_ +margin, y_ +margin +font.getSize()*10, w_ -margin*2, +font.getSize());
      fill(#e2e2e2); 
      text(input, x_ +margin*3, y_ +0.5*margin +font.getSize()*11);
      text("(0xrrggbb) ", x_ +margin, y_ -margin +font.getSize()*10);
      
      if(mouseX > x_ +margin && mouseX < x_ +margin +font.getSize()*4.5 && mouseY > y_ +margin +font.getSize()*11.5 && mouseY < y_ +margin +font.getSize()*12.5) {
        fill(#00ff00);
        if(mousePressed) b[i].col = getColValue(input);
      }
      text("(CONFIRM) ", x_ +margin, y_ -margin +font.getSize()*13);
    }
  }
}

color getColValue(String s) {
  s = s.toUpperCase();
  String out = "FF";
  for(int i = 0; i < 6; i++) { 
    out += s.charAt(s.length() -(6 -i));
  }
  return unhex(out);
}

void deleteInputCar() {
  String s = input;
  input = "";
  for(int i = 0; i < input.length() -1; i++) { 
    input += s.charAt(i);
  }
}

String insertCol(String s, color col) {
  String str = "";
  int tmp = 0;
  for(int i = 0; i < s.length(); i++) { 
    if(s.charAt(i) == '#' && tmp == 0) {
      str += "#" + hex(col, 6);
      tmp = 1;
      i += 6;
    } else str += s.charAt(i);
  }
  return str;
}

void saveConfig() {//                                                         | buttons (play/ stop)
  int arr[] = {133, 317, 318, 319, 320, 322, 324, 325, 326, 327, 329, 330, 336, 39, 41, 42, 44, 45};
  String[] strings = loadStrings("themeTemplate.txt");
  for(int i = 0; i < arr.length; i++) { 
    if(i == 5) strings[arr[i] +1] = insertCol(strings[arr[i] +1], b[i].col);
    if(i == 12) strings[arr[i] +1] = insertCol(strings[arr[i] +1], b[i].col);
    if(i == 13) {strings[arr[i]] = insertCol(strings[arr[i]], b[4].col); strings[arr[i] +16] = insertCol(strings[arr[i] +16], b[4].col);}
    if(i == 14) {strings[arr[i]] = insertCol(strings[arr[i]], b[8].col); strings[arr[i] +16] = insertCol(strings[arr[i] +16], b[8].col);}
    if(i == 15) {strings[arr[i]] = insertCol(strings[arr[i]], b[4].col); strings[arr[i] +16] = insertCol(strings[arr[i] +16], b[4].col);}
    if(i == 16) {strings[arr[i]] = insertCol(strings[arr[i]], b[7].col); strings[arr[i] +16] = insertCol(strings[arr[i] +16], b[7].col);}
    if(i == 17) {strings[arr[i]] = insertCol(strings[arr[i]], b[8].col); strings[arr[i] +16] = insertCol(strings[arr[i] +16], b[8].col);}
    if(i < 12 ) strings[arr[i]] = insertCol(strings[arr[i]], b[i].col);
  }
  saveStrings("out\\theme.txt", strings);
  println("Theme saved");
}

void keyPressed() {
  if(key == ENTER) saveConfig();
  else if(key == BACKSPACE) {
    input = "";
  } else {
    input += key;
    delay(80);
  }
}
