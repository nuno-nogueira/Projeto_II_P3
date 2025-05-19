class Flower {
  PVector rootPos;
  ArrayList<PVector> flowerPath;
  float rootLength, growthSpeed, maxLength, flowerGrowthSpeed, fadeAlpha;
  int petalCount, petalSize, lifetime, currentLife;
  color rootColor, petalColor, centerpieceColor;
  boolean growing, isAlive, isFading;
  
  Flower(float x, float y, color flowerRoot, color leafColor1, color leafColor2) {
    rootPos = new PVector(x, y);
    flowerPath = new ArrayList<PVector>();
    flowerPath.add(rootPos.copy());
    rootLength = random(3, 8);
    growthSpeed = random(0.3, 1);
    maxLength = random(10, 20);
    flowerGrowthSpeed = random(0.3, 1);
    rootColor = flowerRoot;
    petalColor = leafColor1;
    centerpieceColor = leafColor2;
    petalCount = int(random(6, 13));
    petalSize = int(random(10, 16));
    lifetime = int(random(300, 600));
    fadeAlpha = 255;
    isFading = false;
    isAlive = true;
    growing = true;

  }
  
  
  void drawRoot() {
    /*
    Esta função vai buscar as coordenadas de cada ponto guardado no array da raiz (flowerPath)
    e desenha uma linha com essas coordenadas
    */
    if (!isAlive) {
      return;
    }          
    
    stroke(rootColor, fadeAlpha);
    strokeWeight(4);
    
    //Iterar sobre o array para desenhar a raiz com as posicoesS
    for (int i = 1; i < flowerPath.size(); i++) {
      PVector position0 = flowerPath.get(i - 1);
      PVector position1 = flowerPath.get(i);
      line(position1.x, position1.y, position0.x, position0.y);
    }   
  }
  
  void updateRoot() {
    /*
    Esta função adicionando novas coordenadas para a raiz ser desenhada
    ate a raiz chegar a sua altura maxima
    */
    if(!isAlive) {
      return;
    }
    
    currentLife++;
    
    if (currentLife > lifetime && !isFading) {
      isFading = true;
    }
    
    if (isFading) {
      fadeAlpha -= 10;
      if (fadeAlpha <= 0) {
        isAlive = false;
        return;
      }
    }
    
    
    if (growing) {
      //Fazer a raiz da planta crescer ate chegar a sua altura maxima
      for (int i = 0; i < growthSpeed; i++) {
        if (flowerPath.size() >= maxLength) {
          growing = false;
          break;
        }
      }
      
      PVector lastPathPoint = flowerPath.get(flowerPath.size() - 1);
      float angle = -PI/2 + random(-PI/6, PI/6);
      float dx = cos(angle) * rootLength;
      float dy = sin(angle) * rootLength;
      flowerPath.add(new PVector(lastPathPoint.x + dx, lastPathPoint.y + dy));
    } else {
      drawFlower();
  } }

  void drawFlower() {
    /*
    Esta funcao desenha a flor depois de a raiz ser toda desenhada
    */
    PVector rootTip = flowerPath.get(flowerPath.size() - 1);
    pushMatrix();
    translate(rootTip.x, rootTip.y);
    
    //petalas
    stroke(petalColor, fadeAlpha);
    
    for (int i = 0; i < petalCount; i++){
      float petalAngle = TWO_PI / petalCount * i;
      float petalX = cos(petalAngle) * 10;
      float petalY = sin(petalAngle) * 10;
      pushMatrix();
      translate(petalX, petalY);
      rotate(petalAngle + PI/2);
      
      beginShape();
      vertex(0, 0);
      bezierVertex(8, -8, 16, 0, 8, 8);
      bezierVertex(16, 0, 8, -8, 0, 0);
      endShape();
      
      popMatrix();
    }
    
    //centro da flor
    fill(centerpieceColor, fadeAlpha);
    stroke(centerpieceColor, fadeAlpha);
    ellipse(0, 0, 10, 10);
    popMatrix();

  }  
}
