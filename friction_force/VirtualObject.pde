class VirtualObject {
  private PVector location;
  private PVector velocity;
  private PVector acceleration;
  
  private float mass, roughLevel, objectWidth, objectHeight;
 
  VirtualObject(float mass, float roughLevel, float widthScale, float heightScale) {
    this.mass = mass;
    this.roughLevel = roughLevel;
    
    objectWidth = mass * widthScale;
    objectHeight = mass * heightScale;
    
    location = new PVector(0, height - objectHeight / 2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void setInitialVelocity(PVector velocity) {
    this.velocity = velocity.copy();
  }
  
  PVector getVelocity() {
    return velocity;
  }
  
  void applyForce(PVector force) {
    force = force.copy();
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
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
  }
}
