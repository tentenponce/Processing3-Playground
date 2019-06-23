class Perceptron {
  private static final float LEARNING_RATE = 0.05; // adjust this for maximum learning rate
  float[] weights = new float[2];
  
  Perceptron() {
    initWeights();
  }
  
  /* init weights randomly */
  void initWeights() {
    for (int i = 0; i < weights.length; i++) {
      weights[i] = random(-1, 1);
    }
  }
  
  int guess(float[] inputs) {
    int sum = 0;
    for (int i = 0; i < inputs.length; i++) {
      sum += inputs[i] * weights[i];
    }
    
    return sign(sum);
  }
  
  void train(float[] inputs, int target) {
    int guess = guess(inputs);
    int error = target - guess;
    
    for (int i = 0; i < weights.length; i++) {
      weights[i] += error * inputs[i] * LEARNING_RATE;
    }
  }
  
  /* activation function */
  private int sign(float n) {
    if (n >= 0) {
      return 1;
    } else {
      return -1;
    }
  }
}
