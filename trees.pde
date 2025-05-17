class Tree{
  PVector treePos;
  float treeHeight, currentHeight, growthSpeed;
  int branchesNumber, rootWidth;
  ArrayList<Branch> branches;
  color branchColor;
  PImage leafImage, leaf;
  
  Tree(float x, float y, color treeColor, PImage leafImage){
    treePos = new PVector(x, y);
    treeHeight = random(70, 150);
    currentHeight = 0;
    growthSpeed = random(1.5, 2.5);
    branches = new ArrayList<Branch>();
    branchesNumber = int(random(7, 10)); 
    rootWidth = int(random(6, 8));
    branchColor = treeColor;
    leaf = leafImage;
    
    //Criar o nº de ramos estipulado
    for (int i = 0; i < branchesNumber; i++){
      float branchHeight = random(30, treeHeight - 20);
      float branchAngle = random(-PI/4, 0); //angulo entre 0 e 45
      float branchLength = random(30, 60);
      
      branches.add(new Branch(branchHeight, branchAngle, branchLength, branchColor, leafImage));
    
    }
  }
  
  void growTree(){
    /*
    Esta função desenha a parte do tronco da arvore
    */
    //Incrementar a velocidade de crescimento a altura da arvore ate a currentHeight chegaar à treeHeight
    if (currentHeight < treeHeight){
      currentHeight += growthSpeed;
    } else {
      currentHeight = treeHeight;
    }
    
    //Desenhar o tronco
    pushMatrix();
    translate(treePos.x, treePos.y);
    
    fill(80, 42, 42);
    stroke(80, 42, 42);
    strokeWeight(rootWidth);
    line(0, 0, 0, -currentHeight);
    
    
    //Desenhar ramos
    for (Branch b : branches){
      if (currentHeight >= b.treeHeight){
        b.growBranch();
      }
    
    }
    
    popMatrix();
  }
}


class Branch{
  float treeHeight, branchLength, currentLength, growthSpeed, branchAngle;
  int branchSide;
  boolean grown;
  ArrayList<SubBranch> subBranches;
  color branchColor;
  PImage leafImage;
  
  Branch(float height, float angle, float length, color treeColor, PImage leaf){
    treeHeight = height;
    branchAngle = angle;
    branchLength = length;
    currentLength = 0;
    growthSpeed = random(2.5, 4.0);
    branchSide = int(random(0, 2));
    grown = false;
    subBranches = new ArrayList<SubBranch>();
    branchColor = treeColor;
    leafImage = leaf;
  }
  
  void growBranch(){
    /*
    Esta funcao desenha um ramo primario (depois do desenho do tronco da arvore)
    */
    if (currentLength < branchLength){
      currentLength += growthSpeed;
    } else {
      currentLength = branchLength;
      if (!grown){
        //Quando o ramo estiver todo desenhado, criar sub-ramos no final do ramo
        int subBranchesNumber = int(random(4, 6));
        for (int i = 0; i < subBranchesNumber; i++){
          float angle = random(-20, 20);
          float length = random(10, 20);
          subBranches.add(new SubBranch(angle, length, branchColor, leafImage));
        }
        grown = true;
      }
    }
    
    
    //Desenhar o ramo
    pushMatrix();
    translate(0, -treeHeight);
    
    //Verificar se o ramo vai crescer para o lado direito ou para o lado esquerdo
    if (branchSide == 0){
      rotate(branchAngle);
    } else {
      rotate(branchAngle - PI/2);
    }  
    
    fill(80, 42, 42);
    stroke(80, 42, 42);
    strokeWeight(3);
    line(0, 0, currentLength, 0);
    
    //Mover para a ponta do ramo para desenhar os sub-ramos
    translate(currentLength, 0);
    for (SubBranch branch : subBranches){
      branch.growSubBranch();
    }
    
    popMatrix();
  }
  
} 

class SubBranch{
  float branchLength, currentLength, growthSpeed, branchAngle, leafRotation, leafSize;
  color branchColor;
  PImage leafImage;
  
  SubBranch(float angle, float length, color treeColor, PImage leaf){
    branchAngle = angle;
    branchLength = length;
    currentLength = 0;
    growthSpeed = random(2.0, 4.0);
    leafRotation = radians(random(-15, 15));
    leafSize = random(0.05, 0.15);
    branchColor = treeColor;
    leafImage = leaf;
  }
  
  void growSubBranch(){
    /*
    Esta funcao desenha um ramo secundario (depois do ramo primario) com umas folhas no final do ramo
    */
    if (currentLength < branchLength){
      currentLength += growthSpeed;
    } else {
      currentLength = branchLength;
    }
    
    //Desenhar o sub-ramo
    pushMatrix();
    rotate(branchAngle);
    
    fill(80, 42, 42);
    stroke(80,42, 42);
    strokeWeight(2);
    line(0, 0, 0, -currentLength);
    
    //Desenhar a folha com textura no final do ramo 
    translate(0, -currentLength);
    rotate(leafRotation);
    scale(leafSize);
    imageMode(CENTER);
    image(leafImage, 0, 0);
    popMatrix();    
  }
}
