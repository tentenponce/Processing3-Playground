Ball ball;
Ball ball2;
Ball ball3;

void setup() {
  size(600, 1000);
  
  ball = new Ball(new PVector(width / 2, 0), 20);
  ball2 = new Ball(new PVector(ball.location.x, ball.location.y), 5);
  ball3 = new Ball(new PVector(ball2.location.x, ball2.location.y), 10);
}

void draw() {
  background(255);
  
  ball.update();
  ball.show();
  
  ball2.origin = ball.location.copy();
  
  ball2.update();
  ball2.show();
  
  ball3.origin = ball2.location.copy();
  
  ball3.update();
  ball3.show();
}

void mouseDragged() {
  ball.isDragging = true;
  
  PVector mouse = new PVector(mouseX, mouseY);
  
  PVector diff = PVector.sub(mouse, ball.origin);
  
  ball.location = mouse;
  ball.r = diff.mag();
  ball.angle = atan2(-1*diff.y, diff.x) - radians(90);  
  ball.aVel = 0;
}

void mouseReleased() {
  ball.isDragging = false;
}
