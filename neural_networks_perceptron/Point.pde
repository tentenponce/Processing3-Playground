class Point {
  PVector location;
  int label;
  
  Point() {
    location = new PVector(random(0, 1), random(0, 1));
    
    if (location.x > location.y) {
      label = 1;
    } else {
      label = -1;
    }
  }
  
  void show() {
    stroke(0);
    if (label == 1) {
      fill(255);
    } else {
      fill(0);
    }
    
    ellipse(location.x, location.y, 10, 10);
  }
}
