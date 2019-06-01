int yPath;
float verticalPath = 0;

void setup() {
  background(255);
  size(600, 600);
  
  yPath = height;
}

void draw() {
  float noise = noise(verticalPath);
  noise = map(noise, 0, 1, 0, width);
  
  fill(0);
  ellipse(noise, yPath, 20, 20);
  
  yPath--;
  verticalPath += 0.01;
  
  if (yPath <= 0) {
    noLoop();
  }
}
