float r = 200;
float angle = 0;
float angleVel = 0;
float angleAcc = 0;

void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  
  float x = cos(angle) * r;
  float y = sin(angle) * r;
  
  translate(width / 2, height / 2);
  fill(0);
  line(0, 0, x, y);
  ellipse(x, y, 30, 30);
  
  angleAcc += 0.001;
  angleVel += angleAcc;
  
  angleVel = constrain(angleVel, 0, 0.2);
  angle += angleVel;
}
