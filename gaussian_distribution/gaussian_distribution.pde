import java.util.Random;

private final int SD = width; // adjust me!

private int BUBBLE_Y;
private int MEAN;

Random r = new Random();

void setup() {
  background(255);
  size(1000, 255);

  BUBBLE_Y = height / 2;
  MEAN = width / 2;
}

void draw() {
  float bubbleX = (float) r.nextGaussian();
  
  bubbleX *= SD;
  bubbleX += MEAN;
  
  Bubble bubble = new Bubble(bubbleX, BUBBLE_Y);
  
  bubble.drawBubble();
}
