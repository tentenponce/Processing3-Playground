class Bubble {
  
  private static final int BUBBLE_SIZE = 20;
  
  private float x = 0;
  private float y = 0;
  
  private int alpha = 10;
  
  public Bubble(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void drawBubble() {
    noStroke();
    fill(0, alpha);
    
    ellipse(x, y, BUBBLE_SIZE, BUBBLE_SIZE);
  }
}
