private static final PVector DOWN_FORCE = new PVector(0, 0.1);
private static final PVector WIND_LEFT = new PVector(0.1, 0);
private static final PVector WIND_RIGHT = new PVector(-0.1, 0);

boolean windFromLeft = false;
boolean windFromRight = false;
boolean downForce = false;

Ball ball;

void setup() {
  size(600, 600);
  
  ball = new Ball();
}

void draw() {
  background(255);
  
  text("windFromLeft (Press small Q to toggle): " + windFromLeft, 20, 20);
  text("windFromRight (Press small E to toggle): " + windFromRight, 20, 40);
  text("downward force (not gravity!) (Press space): " + downForce, 20, 60);
  
  if (windFromLeft) {
    ball.applyForce(WIND_LEFT);
  }
  
  if (windFromRight) {
    ball.applyForce(WIND_RIGHT);
  }
  
  if (downForce) {
    ball.applyForce(DOWN_FORCE);
  }
  
  ball.update();
  ball.toggleEdges();
  ball.display();
}

void keyPressed() {
  if (key == 'q') {
    windFromLeft = !windFromLeft;
  }
  
  if (keyCode == 32) {
    downForce = !downForce;
  }
  
  if (key == 'e') {
    windFromRight = !windFromRight;
  }
}
