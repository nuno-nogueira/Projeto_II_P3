class Bird {
  float x, y;
  float speedX;
  int frame = 0;
  int frameDelay = 5;
  int frameCounter = 0;

  Bird(float startX, float startY) {
    x = startX;
    y = startY;
    speedX = random(2, 4);
  }

  void update() {
    x += speedX;
    frameCounter++;
    if (frameCounter >= frameDelay) {
      frame = (frame + 1) % 8; // 8 animation frames for wing flap
      frameCounter = 0;
    }
  }

  void display() {
    pushMatrix();
    pushStyle();

    translate(x, y);
    scale(0.7);

    // Body
    fill(80, 80, 120);
    noStroke();
    ellipse(0, 0, 30, 14);

    // Head
    fill(80, 80, 120);
    ellipse(14, -2, 12, 12);

    // Beak
    fill(255, 200, 50);
    triangle(20, -2, 26, 0, 20, 2);

    // Wing (flap with frame for animation)
    fill(70, 70, 100);
    float wingAngle = map(sin(frame * PI / 4), -1, 1, -PI/3, PI/3);
    pushMatrix();
    rotate(wingAngle);
    ellipse(-5, -10, 24, 10);
    popMatrix();

    // Tail
    fill(60, 60, 90);
    triangle(-15, 2, -22, 0, -15, -2);

    // Eye
    fill(0);
    ellipse(17, -4, 2, 2);

    popStyle();
    popMatrix();
  }
}