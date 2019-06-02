import java.util.Random;

class Ball {
  
  final Random random = new Random();
  static final float BALL_SCALE = 20;
  
  float mass = random.nextInt(3) + 1;
  float ballSize = mass * BALL_SCALE;
  
  PVector location = new PVector(random.nextInt(width), height / 2);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  /**
  * formula for force is:
  * F = mass / acceleration
  * 
  * so if we are to get acceleration:
  * 
  * acceleration = F / mass
  *
  * then we just need to divide our ball's mass to the force to
  * get the proper acceleration we need.
  */
  void applyForce(PVector force) {
    acceleration.add(PVector.div(force, mass));
  }
  
  void display() {
    fill(0, 5);
    ellipse(location.x, location.y, ballSize, ballSize);
  }
  
  void toggleEdges() {
    if (location.x < 0 + ballSize / 2) {
      location.x = ballSize / 2;
      velocity.x *= -1;
    }
    
    if (location.x > width - ballSize / 2) {
      location.x = width - ballSize / 2;
      velocity.x *= -1;
    }
    
    if (location.y < 0 +  - ballSize / 2) {
      location.y = ballSize / 2;
      velocity.y *= -1;
    }
    
    if (location.y > height - ballSize / 2) {
      location.y = height - ballSize / 2;
      velocity.y *= -1;
    }
  }
}
