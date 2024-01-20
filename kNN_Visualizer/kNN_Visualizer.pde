
int count = 100;

int kNN = 1;

PVector points[];

void setup() { 
  size(1000, 1000);
  background(#212121);
  
  points = new PVector[count];
  makePoints();
} 

void draw() { 
  background(#212121);
  
  PVector cursor = new PVector(mouseX, mouseY);
  PVector[] neighbours = getNearest(kNN, cursor);
  for(int i = 0; i < neighbours.length; i++) { 
    fill(#ffffff);
    stroke(#ffffff);
    strokeWeight(3);
    line(cursor.x, cursor.y, neighbours[i].x, neighbours[i].y);
  }
  displayPoints();
} 

PVector[] getNearest(int k, PVector v) {
  PVector pnts[] = new PVector[k];
  sortPoints(v);
  for(int i = 0; i < k; i++) { 
    pnts[i] = points[i];
  }
  return pnts;
}

boolean isSorted(float array[]) {
  boolean tmp = true;
  for(int i = 0; i < array.length -1; i++) { 
    if(array[i] > array[i+1]) tmp = false;
  }
  return tmp;
}

void sortPoints(PVector v) {
  //print("sorting...");
  float distances[] = new float[count];
  for(int i = 0; i < count; i++) { 
    distances[i] = dist(v.x, v.y, points[i].x, points[i].y);
  }
  while(!isSorted(distances)) {
    for(int i = 0; i < count -1; i++) { 
      if(distances[i] > distances[i +1]) {
        float f = distances[i];
        distances[i] = distances[i +1];
        distances[i +1] = f;
        
        PVector p = points[i];
        points[i] = points[i +1];
        points[i +1] = p;
      }
    }
  }
  //print("sorted.\n");
}

void makePoints() {
  for(int i = 0; i < count; i++) { 
    points[i] = new PVector((int)random(width), (int)random(height));
  }
}

void displayPoints() {
  int size = 5;
  noStroke();
  fill(#ff0000);
  for(int i = 0; i < count; i++) { 
    ellipse(points[i].x, points[i].y, size, size);
  }
}

void keyPressed() {
  if(keyCode == UP) {
    kNN++;
    println("k: " + kNN);
  }
  else if(keyCode == DOWN && kNN != 0) {
    kNN--;
    println("k: " + kNN);
  }
}
