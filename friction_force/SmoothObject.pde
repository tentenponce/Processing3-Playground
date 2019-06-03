class SmoothObject extends VirtualObject {
  private static final float MASS = 1;
  private static final float ROUGH_LEVEL = 0.05;
  
  private static final float WIDTH_SCALE = 20;
  private static final float HEIGHT_SCALE = 35;
 
  SmoothObject() {
    super(MASS, ROUGH_LEVEL, WIDTH_SCALE, HEIGHT_SCALE);
  }
}
