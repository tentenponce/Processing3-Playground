PVector location;
PVector velocity;
PVector acceleration;

void setup() {
  size(600, 600);
  location = new PVector(0, 0);
  acceleration = new PVector(0, 0);
  velocity = new PVector(0, 0);
}

void draw() {
  PVector mouse = new PVector(mouseX, mouseY);
  
  mouse.sub(location);
  mouse.setMag(1);
  
  velocity.add(mouse);
  velocity.limit(10);
  
  location.add(velocity);
  
  background(255);
  fill(0);
  ellipse(location.x, location.y, 20, 20);
}
