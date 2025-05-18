class Leaf {
  PVector position, speed;
  float rotation, rotationSpeed, leafSize;
  PImage leafImage;
  
  Leaf(float x, float y, PImage leafImg) {
    position = new PVector(x, y);
    speed = new PVector(random(-0.5, 0.5), random(1, 3));
    rotation = random(TWO_PI);
    rotationSpeed = random(-0.05, 0.05);
    leafSize = random(0.1, 0.4);
    leafImage = leafImg;
  }
  
  void drawLeaf() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(rotation);
    scale(leafSize);
    imageMode(CENTER);
    image(leafImage, 0, 0);
    popMatrix();
  }
  
  void updateLeaf(float volume, float direction) {
    
   float wind = map(volume, 0, 0.3, 0, 3);
   speed.x += random(-0.2, 0.2) + wind * direction;
   speed.y += random(0.1, 0.3);
    
    //Adiciona um pouco de movimento lateral oscilante
    speed.x = constrain(speed.x, -5, 5);
    speed.y = constrain(speed.x, 3, 15);
    
    position.add(speed);
    rotation += rotationSpeed + speed.x * 0.02;
  }
  
  boolean isOffScreen() {
    return position.y > height + leafSize;
  }
}