Perceptron perceptron;

Point[] points = new Point[100];

void setup() {
  size(600, 600);
  
  perceptron = new Perceptron();
  
  for (int i = 0; i < points.length; i++) {
    points[i] = new Point();
  }
}

void draw() {
  background(255);
  /* train the perceptron */
  for (int i = 0; i < points.length; i++) {
    PVector location = points[i].location;
    
    perceptron.train(new float[]{location.x, location.y}, points[i].label);
  }
  
  /* show the training output */
  for (Point point : points) {
    PVector location = point.location;
    
    int guess = perceptron.guess(new float[]{location.x, location.y});
    
    stroke(0);
    if (guess == 1) {
      fill(0);
    } else {
      fill(255);
    }
    
    float x = map(location.x, 0, 1, 0, width);
    float y = map(location.y, 0, 1, 0, height);
    
    ellipse(x, y, 10, 10);
  }
  
  /* just show a line */
  line(0, 0, width, height);
}
