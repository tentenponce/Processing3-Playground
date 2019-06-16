class Ball {
  
  float r = 200;
  float angle = 20;
  
  float G = 0.01;
  
  float aVel = 0;
  float aAcc = 0;
  
  PVector origin;
  PVector location;
  
  boolean isDragging = false;
  
  Ball(PVector o, float a) {
    origin = o.copy();
    angle = a;
    location = new PVector(sin(angle) * r + origin.x, cos(angle) * r + origin.y);
  }
  
  void update() {
    if (!isDragging) {
      aAcc = sin(angle) * -G;
    
      aVel += aAcc;
      angle += aVel;
      
      aVel *= .99;
      
      location = new PVector(sin(angle) * r + origin.x, cos(angle) * r + origin.y);
    }
  }
  
  void show() {
    fill(0);
    line(origin.x, origin.y, location.x, location.y);
    ellipse(location.x, location.y, 30, 30);
  }
}
