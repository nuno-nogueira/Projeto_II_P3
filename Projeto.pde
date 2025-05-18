//Variaveis
import processing.sound.*; 
PImage leafImage, bgImage, currentBg;
float posX, posY;
int lastLeafTime = 0, leafInterval = 1000;

SoundFile soundFile;
Amplitude amp;
AudioIn in;

void setup() {
  //Iniciar janela e atributos de janela
  //fullScreen(P2D, 1);
  size(720, 600, P2D);
  frameRate(25);
  
  soundFile = new SoundFile(this, "birdsSound.wav");
  soundFile.loop();
  
  amp = new Amplitude(this);
  amp.input(soundFile);
  
  leafImage = loadImage("green_leaf.png");
  bgImage = loadImage("green_plain.jpg");  
  currentBg = bgImage;
  
}

void draw() {  
  //background estatico
  //background(255, 5);
  
  image(currentBg, 0, 0, width, height);
  
  float volume = amp.analyze();
  float direction = map(mouseX, 0, width, -1.0, 1.0);
  soundFile.pan(direction);
  


   // Atualiza e desenha as árvores
  for (int i = trees.size() - 1; i >= 0; i--) {
    Tree t = trees.get(i);
    t.growTree();
    
    // Quando o ciclo de vida da arvore acabar, a arvore desaparece
    if (!t.isAlive) {
      trees.remove(i);
    }
  }
  
  //Atualiza e desenha as flores
  for (int i = flowers.size() - 1; i >= 0; i--) {
    Flower f = flowers.get(i);
    f.updateRoot();
    f.drawRoot();
  
    // Quando o ciclo de vida da flor acabar, a arvore desaparece
    if (!f.isAlive) {
      flowers.remove(i);
    }
}
  
  
  for (Plant plant : plants) {
    plant.drawRootTrail();
  }
 
  
  for (Leaf leaf : leaves) {
    leaf.drawLeaf();
  }
  
  for (int i = leaves.size() - 1; i >= 0; i--) {
    Leaf leaf = leaves.get(i);
    leaf.updateLeaf(volume, direction);
    
    if (leaf.isOffScreen()) {
      leaves.remove(i);
    }
  }
  
  // Cria novas folhas periodicamente
  if (millis() - lastLeafTime > leafInterval) {
    leaves.add(new Leaf(random(width), -20, leafImage));
    lastLeafTime = millis();
  }
}
