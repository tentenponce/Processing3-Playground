class Ball {
  
  private static final int BALL_SIZE = 20;
  
  PVector location;
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  
  boolean isDragging = false;
  
  Ball(PVector l) {
    location = l.copy();
  }
  
  void update() {
    if (!isDragging) {
      velocity.add(acceleration);
      location.add(velocity);
      acceleration.mult(0);
    }
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void display() {
    fill(0);
    ellipse(location.x, location.y, BALL_SIZE, BALL_SIZE);
  }
  
  void clicked(float mx, float my) {
    isDragging = true;
    location.x = mx;
    location.y = my;
    velocity.mult(0);
    acceleration.mult(0);
  }
  
  void released() {
    isDragging = false;
  }
}
