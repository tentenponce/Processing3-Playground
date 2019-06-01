import java.util.Random;

Random r = new Random();

int[] lines;

static final int LINE_HEIGHT = 5; // adjust me!

void setup() {
  background(255);
  size(600, 600);
  
  lines = new int[width];
}

void draw() {
  int randomLineIndex = monteCarlo(lines.length);
  
  lines[randomLineIndex] += LINE_HEIGHT;
  
  if (lines[randomLineIndex] >= height) {
    noLoop();
  }
  
  for (int i = 0; i < lines.length; i++) {
    stroke(0);
    line(i, height, i, height - lines[i]);
  }
}

int monteCarlo(int max) {
  while (true) {
    int r1 = r.nextInt(max);
    int r2 = r.nextInt(max);
    
    if (r2 < r1) {
      return r1;
    }
  }
}
