float amplitude;
float angle = 0.01;
float acc = 0;

void setup() {
  size(600, 600);
  
  amplitude = height / 2;
}

void draw() {
  background(255);
  
  float y = amplitude * sin(angle);
  
  translate(width / 2, height / 2);
  fill(0);
  line(0,0, 0, y);
  ellipse(0, y, 30, 30);
  
  acc += 0.001;
  acc = constrain(acc, 0, 0.1);
  
  angle += acc;
}
