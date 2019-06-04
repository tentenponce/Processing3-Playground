class VirtualObject {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass, objectWidth, objectHeight, roughLevel;
 
  VirtualObject(float mass, float widthScale, float heightScale) {
    this.mass = mass;
    
    objectWidth = mass * widthScale;
    objectHeight = mass * heightScale;
    
    location = new PVector(random(width) - widthScale * 2, 0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void applyForce(PVector force) {
    force = force.copy();
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void update() {
    acceleration.mult(10);
    velocity.mult(10);
    velocity.add(acceleration);
    velocity.div(10);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    fill(0, 100);
    rect(location.x, location.y, objectWidth, objectHeight);
  }
  
  void toggleEdges() {
    if (location.x >= width) {
      location.x = 0;
    }
    
    if (location.y >= height - objectHeight) {
      location.y = height - objectHeight;
      velocity.mult(-1);
    }
  }
}
