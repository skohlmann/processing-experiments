

ArrayList<Tree> trees = new ArrayList<Tree>();

void setup(){
  randomSeed(1);
  size(1200, 400);
  final TreeConfiguration treeConfig = new TreeConfiguration();
  final BranchConfiguration branchConfig = new BranchConfiguration();
  final LeafConfiguration leafConfig = new LeafConfiguration();
  Tree tree = new Tree("default", new PVector(width / 3, height), treeConfig, branchConfig, leafConfig);
  tree.registerTreeGrowListener(new PrintTreeGrowListener());
  trees.add(tree);
  noLoop();
}

void mousePressed() {
  for (Tree tree : trees) {
    if (tree.canGrow()) {
      tree.grow();
    }
  }
  redraw();
//  saveFrame("growing-tree-###.png");
}

/**
* Displays the Tree
*/
void draw() {
  background(255, 228, 149);
  for (Tree tree : trees) {
    tree.show();
  }
}

class PrintTreeGrowListener implements TreeGrowListener {
  
  public void onTreeGrow(TreeGrowEvent event) {
    println("Tree level: " + event.level);
  }
}
