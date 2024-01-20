int w = 0;
int h = 0;
int cols = 0;
int cellspacing = 0;

boolean save = false;

color[][] colors =  {
                      {#051047, #00818f, #00a4b3, #ffc62e, #ff87a4, #ff87a4, #ff5e2c, #ffffff},
                      {#f6e3ce, #ff8b5f, #f43069, #00868f, #23344c, #000000},
                      {#a53860, #ee4266, #a1fcdf, #61c9a8 },  
                      {#1fa278, #8a0fff, #fb1843, #e5e1de, #f2c81e, #ffa3af },
                      {#00405c, #56508c, #bb5191, #fe6464, #fea702 },
                      {#ffbe0b, #fb5607, #ff006e, #8338ec, #3a86ff },
                      {#264653, #2a9d8f, #e9c46a, #f4a261, #e76f51 },
                      {#003049, #d62828, #f77f00, #fcbf49, #eae2b7 },
                      {#cdb4db, #ffc8dd, #ffafcc, #bde0fe, #a2d2ff },
                      {#e63946, #f1faee, #a8dadc, #457b9d, #1d3557 },
                      {#dad7cd, #a3b18a, #588157, #3a5a40, #344e41 },
                      {#f6bd60, #f7ede2, #f5cac3, #84a59d, #f28482 },
                      {#ff595e, #ffca3a, #8ac926, #1982c4, #6a4c93 },
                      {#001524, #15616d, #ffecd1, #ff7d00, #78290f },
                      {#006ba6, #0496ff, #ffbc42, #d81159, #8f2d56 },
                      {#071e22, #1d7874, #679289, #f4c095, #ee2e31 },
                      {#5fad56, #f2c14e, #f78154, #4d9078, #b4436c },
                      {#ea7070, #fdc4b6, #e59572, #2694ab, #4dbedf },
                      {#6980d4, #453cab, #67b4a3, #dbc1b2, #ee7c87 },
                      {#a31e21, #ea5e51, #94c8d8, #35838d, #032e34 },
                      {#173f5f, #20639b, #3caea3, #f6d55c, #ed553b },
                      {#83082f, #a5251f, #fa8a22, #e6650c, #104c5c },
                      {#07d2c3, #9e7be3, #fb5da5, #ff9a34, #6891ff },
                      {#ee4535, #f38442, #f7f194, #77bd56, #0492cf },
                      {#fc32d2, #fbff18, #0ce1f6, #26fdda, #fa4b80 },
                      {#e32121, #d9d927, #2bdb3d, #2d34dd, #be24d7 },
                      {#ff1234, #ffc107, #120b37, #212121, #fd5202 },
                      {#c6d7b9, #f6b9ad, #ee6f68, #f68f3c, #5e8d5a },
                      {#aaf6ff, #77d6ff, #fff3b9, #ffde38, #ff6f56 },
                      {#390099, #9e0059, #ff0054, #ff5400, #ffbd00 },
                      {#3d348b, #7678ed, #f7b801, #f18701, #f35b04 },
                      {#031d44, #04395e, #70a288, #dab785, #d5896f },
                      {#071e22, #1d7874, #679289, #f4c095, #ee2e31 },
                      {#eac435, #345995, #03cea4, #fb4d3d, #ca1551 },
                      {#f1fffa, #ccfccb, #96e6b3, #568259, #464e47 },
                      {#fabc3c, #e03616, #770058, #ffb238, #08415c },
                      {#b72798, #ff758d, #fcbe54, #f74c97, #65309e, #051978 },
                      {#4bbfe6, #266cdd, #2b20bc, #ffcc33, #a01ca3, #fa1085 },
                      {#ff0000, #ff8700, #ffd300, #deff0a, #a1ff0a, #0aff99, #0aefff, #147df5, #580aff, #be0aff },
                      {#99e2b4, #88d4ab, #78c6a3, #67b99a, #56ab91, #469d89, #358f80, #248277, #14746f, #036666 },
                      {#f94144, #f3722c, #f8961e, #f9844a, #f9c74f, #90be6d, #43aa8b, #4d908e, #577590, #277da1 },
                      {#f72585, #b5179e, #7209b7, #560bad, #480ca8, #3a0ca3, #3f37c9, #4361ee, #4895ef, #4cc9f0 },
                      {#03071e, #370617, #6a040f, #9d0208, #d00000, #dc2f02, #e85d04, #f48c06, #faa307, #ffba08 } };
                                                                                               

void settings() {
  w = 1080;
  h = 1080;
  
  size(w, h);
}

void setup() {
  background(0);
  frameRate(1);
}

int bild = 0;

int colorindex = 0;
void draw() {
  
  int ran0 = (int)random(8);
  if(ran0 == 0) cols = 40;
  else if(ran0 == 1) cols = 10;
  else if(ran0 == 2) cols = 5;
  else cols = 20;
  cellspacing = width/ cols;
  
  colorindex = (int)random(colors.length);
  int[][] rechteckcol = new int[width][height];
  int[][] formcol = new int[width][height];
  noStroke();
  for (int y = 0; y < height; y += cellspacing) {
    for (int x = 0; x < width; x += cellspacing) {
      int index = (int)random(colors[colorindex].length);
      rechteckcol[x][y] = index;
      rechteck(x, y, cellspacing, colors[colorindex][index]);
    }
  }
  for (int y = 0; y < height; y += cellspacing) {
    for (int x = 0; x < width; x += cellspacing) {
      int index2 = (int)random(colors[colorindex].length);
      if (index2 == rechteckcol[x][y]) {
        boolean found = false;
        while (!found) {
          index2 = (int)random(colors[colorindex].length);
          if (index2 != rechteckcol[x][y]) {
            found = true;
          }
        }
      }
      int index = (int)random(colors[colorindex].length);
      formcol[x][y] = index;
      int ran = (int)random(5);
      if (ran == 0) {
        int rot = (int)random(4);
        deckkreis(x, y, cellspacing, colors[colorindex][index], rot);
        int ran2 = (int)random(2);
        if (ran2 == 0) {
          int ran3 = (int)random(4);
          if (ran3 == 0) {
            if (rot %2 == 0 || rot == 0) {
              auge(x, y + cellspacing / 4, x + cellspacing, y + cellspacing / 4, colors[colorindex][index2], 1);
            } else auge(x + cellspacing / 4, y, x + cellspacing /4, y + cellspacing, colors[colorindex][index2], 0);
          } else if (ran3 == 1) {
            if (rot %2 == 0 || rot == 0) {
              auge(x, y + cellspacing / 1.25 - cellspacing/cols, x + cellspacing, y + cellspacing / 1.25 - cellspacing/cols, colors[colorindex][index2], 1);
            } else auge(x + cellspacing / 1.25 - cellspacing/cols, y, x + cellspacing / 1.25 - cellspacing/cols, y + cellspacing, colors[colorindex][index2], 0);
          } else if (ran3 == 2) {
            if (rot %2 == 0 || rot == 0) {
              auge(x, y + cellspacing / 4, x + cellspacing, y + cellspacing / 4, colors[colorindex][index2], 1);
              auge(x, y + cellspacing / 1.25 - cellspacing/cols, x + cellspacing, y + cellspacing / 1.25 - cellspacing/cols, colors[colorindex][index2], 1);
            } else {
              auge(x + cellspacing / 1.25 - cellspacing/cols, y, x + cellspacing / 1.25 - cellspacing/cols, y + cellspacing, colors[colorindex][index2], 0);
              auge(x + cellspacing / 4, y, x + cellspacing /4, y + cellspacing, colors[colorindex][index2], 0);
            }
          }
        }
      } else if (ran == 1) {
        int rot = (int)random(4);
        halbkreis(x, y, cellspacing, colors[colorindex][index], rot);
        int ran2 = (int)random(2);
        if (ran2 == 0) {
          int ran3 = (int)random(4);
          if (ran3 == 0) {
            if (rot %2 == 0 || rot == 0) {
              auge(x, y + cellspacing / 4, x + cellspacing, y + cellspacing / 4, colors[colorindex][index2], 1);
            } else auge(x + cellspacing / 4, y, x + cellspacing /4, y + cellspacing, colors[colorindex][index2], 0);
          } else if (ran3 == 1) {
            if (rot %2 == 0 || rot == 0) {
              auge(x, y + cellspacing / 1.25 - cellspacing/cols, x + cellspacing, y + cellspacing / 1.25 - cellspacing/cols, colors[colorindex][index2], 1);
            } else auge(x + cellspacing / 1.25 - cellspacing/cols, y, x + cellspacing / 1.25 - cellspacing/cols, y + cellspacing, colors[colorindex][index2], 0);
          } else if (ran3 == 2) {
            if (rot %2 == 0 || rot == 0) {
              auge(x, y + cellspacing / 4, x + cellspacing, y + cellspacing / 4, colors[colorindex][index2], 1);
              auge(x, y + cellspacing / 1.25 - cellspacing/cols, x + cellspacing, y + cellspacing / 1.25 - cellspacing/cols, colors[colorindex][index2], 1);
            } else {
              auge(x + cellspacing / 1.25 - cellspacing/cols, y, x + cellspacing / 1.25 - cellspacing/cols, y + cellspacing, colors[colorindex][index2], 0);
              auge(x + cellspacing / 4, y, x + cellspacing /4, y + cellspacing, colors[colorindex][index2], 0);
            }
          }
        }
      } else if (ran == 2) {
        kreis(x, y, cellspacing, colors[colorindex][index]);
        int ran2 = (int)random(2);
        if (ran2 == 0) {
          int ran3 = (int)random(4);
          if (ran3 == 0) rechteck(x, y, cellspacing /2, colors[colorindex][index]);
          else if (ran3 == 1) rechteck(x + cellspacing /2, y, cellspacing /2, colors[colorindex][index]);
          else if (ran3 == 2) rechteck(x + cellspacing /2, y + cellspacing /2, cellspacing /2, colors[colorindex][index]);
          else {
            rechteck(x, y, cellspacing /2, colors[colorindex][index]);
            int ran4 = (int)random(4);
            int rot = (int)random(4);
            if (ran4 == 0) {
              if (rot %2 == 0 || rot == 0) {
                auge(x, y + cellspacing / 4, x + cellspacing, y + cellspacing / 4, colors[colorindex][index2], 1);
              } else auge(x + cellspacing / 4, y, x + cellspacing /4, y + cellspacing, colors[colorindex][index2], 0);
            } else if (ran4 == 1) {
              if (rot %2 == 0 || rot == 0) {
                auge(x, y + cellspacing / 1.25 - cellspacing/cols, x + cellspacing, y + cellspacing / 1.25 - cellspacing/cols, colors[colorindex][index2], 1);
              } else auge(x + cellspacing / 1.25 - cellspacing/cols, y, x + cellspacing / 1.25 - cellspacing/cols, y + cellspacing, colors[colorindex][index2], 0);
            } else if (ran4 == 2) {
              if (rot %2 == 0 || rot == 0) {
                auge(x, y + cellspacing / 4, x + cellspacing, y + cellspacing / 4, colors[colorindex][index2], 1);
                auge(x, y + cellspacing / 1.25 - cellspacing/cols, x + cellspacing, y + cellspacing / 1.25 - cellspacing/cols, colors[colorindex][index2], 1);
              } else {
                auge(x + cellspacing / 1.25 - cellspacing/cols, y, x + cellspacing / 1.25 - cellspacing/cols, y + cellspacing, colors[colorindex][index2], 0);
                auge(x + cellspacing / 4, y, x + cellspacing /4, y + cellspacing, colors[colorindex][index2], 0);
              }
            }
          }
        } else {
          formcol[x][y] = index2;
          int ran4 = (int)random(4);
          int rot = (int)random(4);
          if (ran4 == 0) {
            if (rot %2 == 0 || rot == 0) {
              auge(x, y + cellspacing / 4, x + cellspacing, y + cellspacing / 4, colors[colorindex][index2], 1);
            } else auge(x + cellspacing / 4, y, x + cellspacing /4, y + cellspacing, colors[colorindex][index2], 0);
          } else if (ran4 == 1) {
            if (rot %2 == 0 || rot == 0) {
              auge(x, y + cellspacing / 1.25 - cellspacing/cols, x + cellspacing, y + cellspacing / 1.25 - cellspacing/cols, colors[colorindex][index2], 1);
            } else auge(x + cellspacing / 1.25 - cellspacing/cols, y, x + cellspacing / 1.25 - cellspacing/cols, y + cellspacing, colors[colorindex][index2], 0);
          } else if (ran4 == 2) {
            if (rot %2 == 0 || rot == 0) {
              auge(x, y + cellspacing / 4, x + cellspacing, y + cellspacing / 4, colors[colorindex][index2], 1);
              auge(x, y + cellspacing / 1.25 - cellspacing/cols, x + cellspacing, y + cellspacing / 1.25 - cellspacing/cols, colors[colorindex][index2], 1);
            } else {
              auge(x + cellspacing / 1.25 - cellspacing/cols, y, x + cellspacing / 1.25 - cellspacing/cols, y + cellspacing, colors[colorindex][index2], 0);
              auge(x + cellspacing / 4, y, x + cellspacing /4, y + cellspacing, colors[colorindex][index2], 0);
            }
          }
        }
      }
    }
  }
  for (int y = 0; y < height; y += cellspacing) {
    for (int x = 0; x < width; x += cellspacing) {
      int index2 = (int)random(colors[colorindex].length);
      int index = (int)random(colors[colorindex].length);
      if (index2 == rechteckcol[x][y]) {
        boolean found = false;
        while (!found) {
          index2 = (int)random(colors[colorindex].length);
          if (index2 != rechteckcol[x][y]) {
            found = true;
          }
        }
      }
      if (index == formcol[x][y]) {
        boolean found = false;
        while (!found) {
          index = (int)random(colors[colorindex].length);
          if (index != formcol[x][y]) {
            found = true;
          }
        }
      }
      int ran = (int)random(cols);
      if (ran == 0) {
        kreisklein(x + cellspacing /2, y + cellspacing /2, (int)cellspacing/2, colors[colorindex][index2]);
      } else if (ran == 1) {
        blatt(x, y + cellspacing/2, x + cellspacing/2, y, colors[colorindex][index], 1);
        int ran2 = (int)random(8);
        if (ran2 == 1) {
          blatt(x, y + cellspacing/2, x + cellspacing/2, y, colors[colorindex][index], 1);
        } else if (ran2 == 2) {
          blatt(x + cellspacing/2, y, x, y + cellspacing/2, colors[colorindex][index], 0);
        } else if (ran2 == 3) {
          blatt(x + cellspacing /2, y + cellspacing, x + cellspacing, y + cellspacing /2, colors[colorindex][index], 1);
        } else if (ran2 == 4) {
          blatt(x + cellspacing /2, y + cellspacing, x, y + cellspacing/2, colors[colorindex][index], 0);
        }
      } else if (ran == 2) {
        blatt(x + cellspacing/2, y, x, y + cellspacing/2, colors[colorindex][index], 0);
        int ran2 = (int)random(8);
        if (ran2 == 1) {
          blatt(x, y + cellspacing/2, x + cellspacing/2, y, colors[colorindex][index], 1);
        } else if (ran2 == 2) {
          blatt(x + cellspacing/2, y, x, y + cellspacing/2, colors[colorindex][index], 0);
        } else if (ran2 == 3) {
          blatt(x + cellspacing /2, y + cellspacing, x + cellspacing, y + cellspacing /2, colors[colorindex][index], 1);
        } else if (ran2 == 4) {
          blatt(x + cellspacing /2, y + cellspacing, x, y + cellspacing/2, colors[colorindex][index], 0);
        }
      } else if (ran == 3) {
        blatt(x + cellspacing /2, y + cellspacing, x + cellspacing, y + cellspacing /2, colors[colorindex][index], 1);
        int ran2 = (int)random(8);
        if (ran2 == 1) {
          blatt(x, y + cellspacing/2, x + cellspacing/2, y, colors[colorindex][index], 1);
        } else if (ran2 == 2) {
          blatt(x + cellspacing/2, y, x, y + cellspacing/2, colors[colorindex][index], 0);
        } else if (ran2 == 3) {
          blatt(x + cellspacing /2, y + cellspacing, x + cellspacing, y + cellspacing /2, colors[colorindex][index], 1);
        } else if (ran2 == 4) {
          blatt(x + cellspacing /2, y + cellspacing, x, y + cellspacing/2, colors[colorindex][index], 0);
        }
      } else if (ran == 4) {
        blatt(x + cellspacing /2, y + cellspacing, x, y + cellspacing/2, colors[colorindex][index], 0);
        int ran2 = (int)random(8);
        if (ran2 == 1) {
          blatt(x, y + cellspacing/2, x + cellspacing/2, y, colors[colorindex][index], 1);
        } else if (ran2 == 2) {
          blatt(x + cellspacing/2, y, x, y + cellspacing/2, colors[colorindex][index], 0);
        } else if (ran2 == 3) {
          blatt(x + cellspacing /2, y + cellspacing, x + cellspacing, y + cellspacing /2, colors[colorindex][index], 1);
        } else if (ran2 == 4) {
          blatt(x + cellspacing /2, y + cellspacing, x, y + cellspacing/2, colors[colorindex][index], 0);
        }
      }
    }
  }
  bild++;
  println(bild);
  if(save) speichern();
  //noLoop();
}

void blatt(int x1, int y1, int x2, int y2, color col, int gerade) {
  fill(col);
  int off1 = 1;
  int off2 = 0;
  if (gerade == 0) {
    off1 = 0;
    off2 = 1;
  }
  bezier(x1 +off2, y1, ((x2 -x1)*0.6) +x1 +off2, y1, x2 +off2, ((y2 -y1)*0.4) + y1, x2 +off2, y2);
  bezier(x1 +off1, y1, x1 + off1, ((y2-y1)*0.6) + y1, ((x2-x1)*0.4) + x1 +off1, y2, x2 +off1, y2);
}

void halbkreis(int x, int y, int size, color col, int rotation) {
  ellipseMode(CORNER);
  fill(col);
  int ran = (int)random(1.2);
  if (rotation == 0) {
    if (ran == 0) arc(x, y - cellspacing/2, size, size, 0, PI);
    else arc(x, y, size, size, 0, PI);
  } else if (rotation == 1) {
    if (ran == 0) arc(x, y, size, size, HALF_PI, PI + HALF_PI);
    else arc(x + cellspacing/2, y, size, size, HALF_PI, PI + HALF_PI);
  } else if (rotation == 2) {
    if (ran == 0) arc(x, y, size, size, -PI, 0);
    else arc(x, y + cellspacing/2, size, size, -PI, 0);
  } else {
    if (ran == 0) arc(x, y, size, size, -HALF_PI, HALF_PI);
    else arc(x - cellspacing/2, y, size, size, -HALF_PI, HALF_PI);
  }
}

void deckkreis(int x, int y, int size, color col, int rotation) {
  ellipseMode(CORNER);
  fill(col);
  if (rotation == 0) {
    arc(x, y, size, size, 0, PI);
    rect(x, y, size, size/2);
  } else if (rotation == 1) {
    arc(x, y, size, size, HALF_PI, PI + HALF_PI);
    rect(x + size/2, y, size/2, size);
  } else if (rotation == 2) {
    arc(x, y, size, size, -PI, 0);
    rect(x, y +size/2, size, size/2);
  } else {
    arc(x, y, size, size, -HALF_PI, HALF_PI);
    rect(x, y, size/2, size);
  }
}

void rechteck(int x, int y, int size, color col) {
  fill(col);
  rect(x, y, size, size);
}

void kreis(int x, int y, int size, color col) {
  ellipseMode(CORNER);
  fill(col);
  ellipse(x, y, size, size);
}

void kreisklein(int x, int y, int size, color col) {
  ellipseMode(CENTER);
  fill(col);
  ellipse(x, y, size, size);
}

void auge(float x1, float y1, float x2, float y2, color col, int rotation) {
  fill(col);
  int abstand = (int)cellspacing / 3;
  int padding = (int)cellspacing /15;
  if (rotation == 0) {
    bezier(x1, y1 + padding, x1 - abstand, (y2 -y1) *0.25 +y1, x1 - abstand, (y2 -y1) *0.75 +y1, x2, y2 - padding);
    bezier(x1, y1 + padding, x1 + abstand, (y2 -y1) *0.25 +y1, x1 + abstand, (y2 -y1) *0.75 +y1, x2, y2 - padding);
  } else {
    bezier(x1 + padding, y1, (x2 -x1) *0.25 +x1, y1 - abstand, (x2 -x1) *0.75 +x1, y1 - abstand, x2 - padding, y2);
    bezier(x1 + padding, y1, (x2 -x1) *0.25 +x1, y1 + abstand, (x2 -x1) *0.75 +x1, y1 + abstand, x2 - padding, y2);
  }
}

void keyPressed() {
  if (key == ENTER) {
    speichern();
  }
}
void speichern() {
  save(sketchPath() + "\\out\\" + colorindex + "_" + "_" + cols + "_" + width + "_" + height + "_image_" + (int)random(Integer.MAX_VALUE) +".png");
}
