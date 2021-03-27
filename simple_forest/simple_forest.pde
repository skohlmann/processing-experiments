

Tree tree;
final int maxLevel = 10;

void setup(){
  randomSeed(1);
  size(1200, 400);
  final TreeConfiguration treeConfig = new TreeConfiguration();
  treeConfig.setEndAdjustmentX(10);
  this.tree = new Tree("default", new PVector(width / 2, height), treeConfig);
  this.tree.registerTreeGrowListener(new PrintTreeGrowListener());
  this.tree.grow();
  noLoop();
}

void mousePressed() {
  if (this.tree.level() < maxLevel) {
    this.tree.grow();
    redraw();
//    saveFrame("growing-tree-###.png");
  }
}

/**
* Displays the Tree
*/
void draw(){
  background(255, 228, 149);
  this.tree.show();
}

class PrintTreeGrowListener implements TreeGrowListener {
  
  public void onTreeGrow(TreeGrowEvent event) {
    println("Tree level: " + event.level);
  }
}
