ArrayList<PVector> dataPoints = new ArrayList<PVector>();

float m = 1;
float b = 0;

void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  
  for (int i = 0; i < dataPoints.size(); i++) {
    PVector dataPoint = dataPoints.get(i);
    
    float x = map(dataPoint.x, 0, 1, 0, width);
    float y = map(dataPoint.y, 0, 1, height , 0);
    
    fill(0);
    ellipse(x, y, 5, 5);
  }
  
  if (dataPoints.size() >= 2) {
    m = calculateSlope();
    b = calculateYIntercept(m);
    drawLine();
  }
}

void mousePressed() {
  float x = map(mouseX, 0, width, 0, 1);
  float y = map(mouseY, 0, height, 1, 0);
  
  dataPoints.add(new PVector(x, y));
}

void drawLine() {
  float x1 = 0;
  float y1 = m * x1 + b;
  float x2 = 1;
  float y2 = m * x2 + b;
  
  x1 = map(x1, 0, 1, 0, width);
  y1 = map(y1, 0, 1, height, 0);
  x2 = map(x2, 0, 1, 0, width);
  y2 = map(y2, 0, 1, height, 0);
  
  stroke(0);
  line(x1, y1, x2, y2);
}

/**
* this is the "m"
*/
float calculateSlope() {
  float numerator = 0;
  float denominator = 0;
  
  for (int i = 0; i < dataPoints.size(); i++) {
    float x = dataPoints.get(i).x;
    float y = dataPoints.get(i).y;
    
    numerator += (x - getXMean()) * (y - getYMean());
    denominator += (x - getXMean()) * (x - getXMean());
  }
  
  return numerator / denominator;
}

/**
* this is the "b"
*/
float calculateYIntercept(float m) {
  return getYMean() - m * getXMean();
}

float getXMean() {
  float sum = 0;
  for (int i = 0; i < dataPoints.size(); i++) {
    sum += dataPoints.get(i).x;
  }
  
  return sum / dataPoints.size();
}

float getYMean() {
  float sum = 0;
  for (int i = 0; i < dataPoints.size(); i++) {
    sum += dataPoints.get(i).y;
  }
  
  return sum / dataPoints.size();
}
