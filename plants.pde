class Plant{
  PVector pos, previousPos;
  float rootAlpha, rootWeight, speed;
  int rootFading;
  color rootColor;
  PImage leafImage;
  
  Plant(float previousX, float previousY, float x, float y, color plantColor, PImage leafImg) {
    previousPos = new PVector(previousX, previousY);
    pos = new PVector(x, y);
    speed = dist(x, y, previousX, previousY);
    rootAlpha = 255;
    rootWeight = 4;
    rootFading = 15;
    rootColor = plantColor;
    leafImage = leafImg; 
  }
  
  void drawRootTrail() {
    /*
    Esta funcao desenha 
    */
    if (rootAlpha >= 0) {
      rootAlpha -= rootFading;
      
      //para velocidade nao se exceder muito
      if (speed <= 6){
        rootWeight = speed;
      } else {
        speed = 6;
      }
      
      //alterar a espessura da raiz consoante a velocidade do rato
      rootWeight = min(speed, 6);
      stroke(rootColor, rootAlpha);
      strokeWeight(rootWeight);
      line(previousPos.x, previousPos.y, pos.x, pos.y);
  
      //decidir se desenha a folha
      if (random(1) < 0.3) {
        //calcula o angulo da raiz
        float dx = pos.x - previousPos.x;
        float dy = pos.y - previousPos.y;
        float angle = atan2(dy, dx);
        
        //se tiver completamente "deitada", rodasse num angulo de 90º
        if (abs(degrees(angle)) < 45 || abs(degrees(angle)) > 135) {
          angle += HALF_PI;
        }
        
        //desenhar a folha
        pushMatrix();
        translate(pos.x, pos.y);
        rotate(angle);
        imageMode(CENTER);
        tint(255, rootAlpha);
        image(leafImage, 0, 0, 16, 16);
        popMatrix();
        
      }
    }
  }
}
