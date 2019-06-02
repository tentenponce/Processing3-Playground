PVector location;
PVector velocity;
PVector acceleration;

void setup() {
  size(600, 600);
  location = new PVector(0, 0);
  velocity = new PVector(0, 0);
  acceleration = new PVector(1, 1);
}

void draw() {
  PVector mouse = new PVector(mouseX, mouseY);
  
  PVector direction = mouse.sub(location);
  direction.setMag(1);
  
  velocity.add(direction);
  velocity.limit(10);
  
  location.add(velocity);
  
  background(255);
  fill(0);
  ellipse(location.x, location.y, 20, 20);
}
