//Variaveis
import processing.sound.*; 
PImage leafImage;
float posX, posY;
color frontl, ambl, subSphere;

void setup() {
  //Iniciar janela e atributos de janela
  //fullScreen(P2D, 1);
  size(720, 600, P2D);
  frameRate(25);
  background(255);
  
  frontl = color(255, 250, 240);
  ambl = color(0, 11, 31);
  subSphere = color(255, 249, 71);
  
  leafImage = loadImage("leaf.png");
}

void draw() {
  //ambientLight(255, 255, 255);
  //ambient(red(ambl), green(ambl), blue(ambl));
  if (darkMode) {
    background(0, 25);
    fill(255);
    stroke(frontl, 0);
    ellipse(600, 40, 45, 45);
  } else {
    background(255, 5);
    fill(subSphere);
    stroke(frontl, 0);
    ellipse(600, 40, 45, 45);
  }
  
  strokeWeight(2);
  if (blur) {
    filter(BLUR, 1);
  }
  
  
  for (Tree tree : trees){
    tree.growTree();
  }
  
  for (Flower flower : flowers){
    flower.updateRoot();
    flower.drawRoot();
  }
  
  /*
  for (Plant plant : plants) {
    plant.drawRootTrail();
  }*/
  
}
