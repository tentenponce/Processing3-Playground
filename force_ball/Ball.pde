class Ball {
  
  private static final int BALL_SIZE = 20;
  
  PVector location = new PVector(width / 2, height / 2);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void display() {
    fill(0);
    ellipse(location.x, location.y, BALL_SIZE, BALL_SIZE);
  }
  
  void toggleEdges() {
    if (location.x < 0 + BALL_SIZE / 2) {
      location.x = BALL_SIZE / 2;
      velocity.x *= -1;
    }
    
    if (location.x > width - BALL_SIZE / 2) {
      location.x = width - BALL_SIZE / 2;
      velocity.x *= -1;
    }
    
    if (location.y < 0 +  - BALL_SIZE / 2) {
      location.y = BALL_SIZE / 2;
      velocity.y *= -1;
    }
    
    if (location.y > height - BALL_SIZE / 2) {
      location.y = height - BALL_SIZE / 2;
      velocity.y *= -1;
    }
  }
}
