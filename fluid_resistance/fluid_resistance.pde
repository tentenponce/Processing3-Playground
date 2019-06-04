import java.util.Random;

int OBJ_COUNT = 10;

Random random = new Random();

VirtualObject[] virtualObjects;

void setup() {
  size(600, 600);
  
  virtualObjects = new VirtualObject[OBJ_COUNT];
  
  for (int i = 0; i < virtualObjects.length; i++) {
    virtualObjects[i] = new VirtualObject(random.nextInt(3) + 1, random.nextInt(20) + 5, random.nextInt(20) + 5);
  }
}

void draw() {
  background(255);
  
  for (VirtualObject virtualObject : virtualObjects) {
    PVector gravity = new PVector(0, 0.1 * virtualObject.mass);
    virtualObject.applyForce(gravity);
    
    if (virtualObject.location.y >= height / 2) {
      virtualObject.applyForce(getLiquidForce(virtualObject));
    }
    
    virtualObject.update();
    virtualObject.display();
    virtualObject.toggleEdges();
  }
  
  fill(0);
  line(0, height / 2, width, height / 2);
}

/**
* formula for drag force is:
* 
* drag force = -0.5 * liquid density * coefficient of drag * frontal area * velocity magnitude squared * normalized velocity.
*
* 0.5, liquid density, and coefficient of drag are just constants. For the sake of simplicity, we can just make a big constant
* that represents these 3 variables. (If you want to create different liquid densities, different coefficient of drag, 
* then you can make it as separate variables).
*
* frontal area, it means that flat objects has more drag force to receive than pointed objects.
*
* velocity magnitude squared, get the object's magnitude of velocity, and square it.
*
* normalized velocity, is normalized velocity.... (means that magnitude was reduced to 1). 
*/
PVector getLiquidForce(VirtualObject obj) {
  PVector liquidForce = obj.velocity.copy();
  
  float squaredMag = obj.velocity.magSq(); // velocity magnitude squared
  float bigConstant = -0.3; // 0.5, liquid density, and coefficient of drag.
  
  liquidForce.normalize(); // normalized velocity
  liquidForce.mult(bigConstant);
  liquidForce.mult(squaredMag);
  liquidForce.mult(obj.objectWidth * 0.01); // frontal area
  
  return liquidForce;
}
