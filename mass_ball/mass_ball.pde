private static final PVector WIND_LEFT = new PVector(0.1, 0);
private static final PVector WIND_RIGHT = new PVector(-0.1, 0);

private static final int BALL_COUNT = 10;

boolean windFromLeft = false;
boolean windFromRight = false;
boolean hasDownForce = false;

PVector downForce;

Ball[] balls;

void setup() {
  size(600, 600);
  
  balls = new Ball[BALL_COUNT];
  
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();  
  }
}

void draw() {
  background(255);
  
  fill(0);
  text("windFromLeft (Press small Q to toggle): " + windFromLeft, 20, 20);
  text("windFromRight (Press small E to toggle): " + windFromRight, 20, 40);
  text("downward force (not gravity!) (Press space): " + hasDownForce, 20, 60);
  
  for (Ball ball : balls) {
    if (windFromLeft) {
      ball.applyForce(WIND_LEFT);
    }
    
    if (windFromRight) {
      ball.applyForce(WIND_RIGHT);
    }
    
    if (hasDownForce) {
      downForce = new PVector(0, 0.1);
      
      /**
      * gravity force formula is: (mass1 * mass2 * G) / distance^2
      *
      * mass1 being the earth, mass2 being the object, G is constant (we can define the gravity),
      * assuming distance between earth and you doesn't matter that much (because earth is so massive,
      * we just assume that it is something 0.0000.... because we're so tiny compare to earth),
      * then our new formula is:
      * 
      * gravity force = (mass1 * mass2 * G) / 1, we can erase 1 (because anything divided by 1 duh),
      * 
      * Then mass1 (earth), is another constant, we can say that our earth's mass here is something number,
      * also the G is constant, we can say that:
      *
      * gravity force = mass1 * BIG CONSTANT (the earth and the gravity pull)
      *
      * so we just multiply the ball's mass to our gravity (BIG CONSTANT):
      */
      downForce.mult(ball.mass);
      
      ball.applyForce(downForce);
    }
    
    ball.update();
    ball.toggleEdges();
    ball.display();
  }
}

void keyPressed() {
  if (key == 'q') {
    windFromLeft = !windFromLeft;
  }
  
  if (keyCode == 32) {
    hasDownForce = !hasDownForce;
  }
  
  if (key == 'e') {
    windFromRight = !windFromRight;
  }
}
