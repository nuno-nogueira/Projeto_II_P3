boolean darkMode = false;
boolean drawMode = true;
boolean blur = false;
color[] palette = {
  color(60, 194, 60),
  color(108, 189, 108),
  color(9, 107, 9),
  color(89, 201, 92)
};
color branchColor = color(80, 42, 42);
ArrayList<Tree> trees = new ArrayList<Tree>();
ArrayList<Flower> flowers = new ArrayList<Flower>();
ArrayList<Plant> plants = new ArrayList<Plant>(); 

void mousePressed() {
  if (drawMode){
    //Criar arvore
    trees.add(new Tree(mouseX, mouseY, leafImage));
  } else {
    flowers.add(new Flower(mouseX, mouseY));
  }
}

/*
void mouseDragged() {
  plants.add(new Plant(pmouseX, pmouseY, mouseX, mouseY));
  
  for (Plant plant : plants) {
    plant.drawRootTrail();
  }
}*/

void keyPressed() {
  if (key == 'l' || key == 'L'){
    darkMode = !darkMode;
    if (darkMode) {
      background(0, 25);
      noFill();
    } else {
      background(255, 25);
    }
  }

  if (key == 'p' || key == 'P'){
    drawMode = !drawMode;
  }
  
  if (key == 'c' || key == 'C'){
    trees.clear();
    plants.clear();
    
    if (darkMode) {
      background(0, 25);
    } else {
      background(255, 25);
    }
  }
  
  if (key == 'b' || key == 'B') {
    blur = !blur;
    
    if (blur) {
      filter(BLUR, 1);
    }
  }
}
