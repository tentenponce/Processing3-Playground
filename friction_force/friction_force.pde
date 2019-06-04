PVector INITIAL_VELOCITY = new PVector(10, 0); // adjust me! (well, only X value)

RoughObject roughObject;
SmoothObject smoothObject;

void setup() {
  size(600, 600);
  
  roughObject = new RoughObject();
  smoothObject = new SmoothObject();
  
  roughObject.setInitialVelocity(INITIAL_VELOCITY);
  smoothObject.setInitialVelocity(INITIAL_VELOCITY);
}

void draw() {
  background(255);
  roughObject.applyForce(getFrictionForce(roughObject));
  smoothObject.applyForce(getFrictionForce(smoothObject));
  
  smoothObject.update();
  smoothObject.display();
  smoothObject.toggleEdges();
  
  roughObject.update();
  roughObject.display();
  roughObject.toggleEdges();
}

/**
* formula for friction is:
*
* friction = coefficient of friction * normal force * velocity * -1
*
* coefficient of friction is strength of friction force of a surface,
* therefore, rock, sandpaper, and any rough object has greater coefficient of
* friction, while soap, smooth watery thing lol, has lesser coefficient of friction.
*
* normal force is the force that aligns (or perpendicular, can't understand this word lol) 
* with the object's motion along a surface. Eg: the perpendicular force of a object on earth
* is gravity. Therefore, greater mass will experience much more friction than lightweight objects.
*
* velocity * -1, it is just the inverted of the object's velocity.
*/
PVector getFrictionForce(VirtualObject obj) {
  PVector friction = obj.velocity.copy();
  //System.out.println("friction not normalized: " + friction.x);
  friction.setMag(-1);
  //System.out.println("friction normalized: " + friction.x);
  
  friction.mult(obj.roughLevel);
  friction.mult(obj.mass); // being the normal force
  
  //System.out.println("calculated friction: " + friction.x);
  return friction;
}
