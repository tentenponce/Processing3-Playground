float restLength = 150;
float stretchForce = 0.01;

PVector origin;

Ball ball;

void setup() {
  size(600, 800);
  
  origin = new PVector(width / 2, 0);
  ball = new Ball(new PVector(width / 2, 150));
}

void draw() {
  background(255);
  
  /* apply spring force */
  PVector springForce = PVector.sub(ball.location, origin);
  float currentLength = springForce.mag();
  
  float displacement = currentLength - restLength;
  springForce.normalize();
  springForce.mult(-stretchForce * displacement);
  springForce.mult(.99);
  
  ball.applyForce(springForce);
  
  /* apply gravity */
  PVector gravity = new PVector(0, 0.2);
  ball.applyForce(gravity);
  
  ball.update();
  ball.display();
  
  fill(0);
  line(origin.x, origin.y, ball.location.x, ball.location.y);
}

void mouseDragged() {
  ball.clicked(mouseX, mouseY);
}
  
void mouseReleased() {
  ball.released();
}
