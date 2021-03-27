


Tree tree;
final int maxLevel = 9;

void setup(){
  randomSeed(1);
  size(400,400);
  this.tree = new Tree(new PVector(width / 2, height));
  this.tree.grow();
  noLoop();
}

void mousePressed() {
  if (this.tree.level() < maxLevel) {
    this.tree.grow();
    redraw();
  }
}

/**
* Displays the Tree
*/
void draw(){
  background(51);
  this.tree.show();  
}
