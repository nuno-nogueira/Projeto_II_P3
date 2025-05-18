boolean darkMode = false;
boolean drawMode = true;
color branchColor = color(80, 42, 42);
color plantColor = color(60, 194, 60);
color rootColor = color(60, 194, 60);
color leafColor1 = color(255, 200, 0);
color leafColor2 = color(100, 50, 0);
ArrayList<Tree> trees = new ArrayList<Tree>();
ArrayList<Flower> flowers = new ArrayList<Flower>();
ArrayList<Plant> plants = new ArrayList<Plant>(); 
ArrayList<Leaf> leaves = new ArrayList<Leaf>();

void mousePressed() {
  if (drawMode){
    //Criar arvore
    trees.add(new Tree(mouseX, mouseY, branchColor, leafImage));
  } else {
    flowers.add(new Flower(mouseX, mouseY, rootColor, leafColor1, leafColor2));
  }
}


void mouseDragged() {
  plants.add(new Plant(pmouseX, pmouseY, mouseX, mouseY, plantColor, leafImage));
  
  for (Plant plant : plants) {
    plant.drawRootTrail();
  }
}

void keyPressed() {
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
 
   
  if (key == '1') {
    branchColor = color(80, 42, 42);
    rootColor = color(60, 194, 60);
    leafColor1 = color(255, 200, 0);
    leafColor2 = color(100, 50, 0);
    plantColor = color(60, 194, 60);
    leafImage = loadImage("green_leaf.png");
    currentBg = loadImage("green_plain.jpg");
  } else if (key == '2') {
    branchColor = color(153, 115, 99);
    rootColor = color(74, 51, 27);
    leafColor1 = color(240, 158, 234);
    leafColor2 = color(138, 54, 104);
    plantColor = color(191, 80, 199);
    leafImage = loadImage("sakura_leaf.png");
    currentBg = loadImage("sakura_plain.jpg");
  } else if (key == '3') {
    branchColor = color(61, 41, 33);
    rootColor = color(149, 196, 94);
    leafColor1 = color(191, 91, 44);
    leafColor2 = color(255, 229, 180);
    plantColor = color(217, 145, 74);
    leafImage = loadImage("orange_leaf.png");
    currentBg = loadImage("orange_plain.jpeg");
  } else if (key == '4'){
    branchColor = color(130, 104, 94);
    rootColor = color(158, 222, 142);
    leafColor1 = color(162, 101, 199);
    leafColor2 = color(224, 197, 63);
    plantColor = color(123, 216, 224);
    leafImage = loadImage("white_leaf.png");
    currentBg = loadImage("winter_plain.jpg");
  }
  currentBg.resize(width, height);
 }
