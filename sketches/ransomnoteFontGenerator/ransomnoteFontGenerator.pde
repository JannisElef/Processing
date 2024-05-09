
boolean random = true;
boolean randomSize;
boolean randomY;
boolean randomX;

String sentence = "hello world";
int padding = 0;

int avgHeight = 0;
int avgWidth = 0;

int[] letterCount = new int[26];
ArrayList<Letter> letters = new ArrayList<Letter>();

void settings() {
  setup();
  loadLetters("\\src\\");
  size(avgWidth *sentence.length() +200, avgHeight +100);
}

void setup() { 
  if(random) loadJSONPreset("settings.json");
  //noLoop();
} 

boolean run = true;
void draw() {
  if(run) {
    background(#ffffff);
    displayLetters(sentence, 50, 50);
    run = false;
  } 
}

void loadLetters(String directory) {
  print("\nLoading letters from: " + sketchPath() + directory);
  PImage tmp;
  Letter l;
  File folder = new File(sketchPath() + directory);
  File[] listOfFiles = folder.listFiles();
  if (listOfFiles != null) {
    for (int i = 0; i < listOfFiles.length; i++) {
      if (listOfFiles[i].isFile()) {
        tmp = loadImage(directory + listOfFiles[i].getName());
        char c = listOfFiles[i].getName().toLowerCase().charAt(0);
        letterCount[c -97]++;
        l = new Letter(c, tmp.width, tmp.height, tmp);
        letters.add(l);
        avgHeight += tmp.height;
        avgWidth += tmp.width;
      } 
    }
  }
  avgHeight /= letters.size();
  avgWidth /= letters.size();
  float d;
  for(Letter lr : letters) {
    d = (float)(avgHeight *1.0f/lr.h *1.0f);
    //println(avgHeight + " /" + lr.h + " = " + d);
    lr.h = (int)(lr.h *d *1.0f);
    lr.w = (int)(lr.w *d *1.0f);
    
    lr.img.resize(lr.w, lr.h);
  }
  print(" - complete.");
}

void displayLetters(String s, int x, int y) {
  s = s.toLowerCase();
  int space = 0;
  int index = 0;
  
  int randomOffsetX = 0;
  int randomOffsetY = 0;
  float randomSizeMult = 1;
  
  for (int i = 0; i < s.length(); i++) {
    if(s.charAt(i) != ' ') {
      if(!random) {
        index = getSumBefore(s.charAt(i) -97) +(int)random(letterCount[s.charAt(i) -97]);
        image(letters.get(index).img, x +space +(i *padding), y);
        space += letters.get(index).w;
      } else {
        if(randomX) randomOffsetX = (int)(random(-(letters.get(index).w/7), letters.get(index).w/7));
        if(randomY) randomOffsetY = (int)(random(-(letters.get(index).h/9), letters.get(index).h/9));
        index = getSumBefore(s.charAt(i) -97) +(int)random(letterCount[s.charAt(i) -97]);
        PImage tmp = letters.get(index).img;
        tmp.resize((int)(letters.get(index).w *randomSizeMult), (int)(letters.get(index).h *randomSizeMult));
        image(tmp, x +(int)(random(-randomOffsetX, randomOffsetX)) +space +(i *padding), y +(int)(random(-randomOffsetY, randomOffsetY)));
        space += letters.get(index).w;
        space += randomOffsetX;
      }
    } else {
      space += letters.get((int)random(letters.size() -1)).w;
    }
  }
}

int getSumBefore(int index) {
  int sum = 0;
  for(int i = 0; i < index; i++) {
    sum += letterCount[i];
  }
  return sum;
}

void loadJSONPreset(String path) {
  print("\nLoading JSON file: " +path);
  JSONObject json;
  json = loadJSONObject(path);
  
  randomSize = json.getBoolean("randomSize");
  randomY = json.getBoolean("randomYVariation");
  randomX = json.getBoolean("randomXVariation");
  
  print(" - complete.");
}

void keyPressed() {
  if(keyCode == ENTER) {
    save("out/" + sentence + "-" + hex((int)(random(Integer.MAX_VALUE))) + ".png");
    print("\nsaved.");
  } else if(keyCode == TAB) run = true;
}
