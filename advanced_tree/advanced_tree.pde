


Tree tree;
int count = 0;
final int maxLevel = 9;

void setup(){
  randomSeed(1);
  size(400,400);
  this.tree = new Tree(new PVector(width / 2, height), 1); 
  noLoop();
}

void mousePressed() {
  if (count < maxLevel) {
    this.tree.grow();
    count++;
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
