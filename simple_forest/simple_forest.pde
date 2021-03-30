
final SeedingTreeGrowListener seedListener = new SeedingTreeGrowListener();
Tree baseTree;
Tree secondTree;
Tree thirdTree;
Tree fourthTree;
Tree fifthTree;
Tree sixthTree;

ArrayList<Tree> trees = new ArrayList<Tree>();
ArrayList<Tree> toAddTrees = new ArrayList<Tree>();

void setup(){
  randomSeed(1);
  size(600, 400);
  createTrees();
  trees.add(baseTree);
//  noLoop();
  frameRate(20);
}

//void mousePressed() {
void doGrow() {
  for (Tree tree : trees) {
    if (tree.canGrow()) {
      tree.grow();
    }
  }
  trees.addAll(toAddTrees);
  toAddTrees.clear();
//  redraw();
  saveFrame("growing-forest-#####.png");
}

/**
* Displays the Tree
*/
void draw() {
  doGrow();
  background(255, 228, 149);
  for (Tree tree : trees) {
    tree.show();
  }
  if (stopGrowing()) {
    noLoop();
  }
}

boolean stopGrowing() {
  for (final Tree tree : trees) {
    if (tree.canGrow()) {
      return false;
    }
  }
  return true;
}

class SeedingTreeGrowListener implements TreeGrowListener {
  
  public void onTreeGrow(TreeGrowEvent event) {
    
    println(event);
    
    if (event.name.equals("default") && event.level == 2) {
      toAddTrees.add(secondTree);
    }
    if (event.name.equals("default") && event.level == 1) {
      toAddTrees.add(thirdTree);
    }
    if (event.name.equals("third") && event.level == 2) {
      toAddTrees.add(fourthTree);
    }
    if (event.name.equals("fourth") && event.level == 1) {
      toAddTrees.add(fifthTree);
      toAddTrees.add(sixthTree);
    }
  }
}

void createTrees() {
  final TreeConfiguration baseTreeConfig = new TreeConfiguration();
  baseTreeConfig.setTrunkAngle(5);
  baseTreeConfig.setMaxLevel(8);
  final BranchConfiguration baseBranchConfig = new BranchConfiguration();
  baseBranchConfig.setAditionalNextBranchAngle(10);
  baseBranchConfig.setLeftBranchAngleJitterLowBoundry(0);
  baseBranchConfig.setLeftBranchAngleJitterHightBoundry(10);
  baseBranchConfig.setRightBranchAngleJitterLowBoundry(-10);
  baseBranchConfig.setRightBranchAngleJitterHightBoundry(0);
  final LeafConfiguration baseLeafConfig = new LeafConfiguration();
  baseLeafConfig.setLeafColorAlpha(60);
  baseTree = new Tree("default", new PVector(width / 3 + 40 - 100, height), baseTreeConfig, baseBranchConfig, baseLeafConfig);
  baseTree.registerTreeGrowListener(seedListener);
  
  final TreeConfiguration secondTreeConfig = new TreeConfiguration();
  secondTreeConfig.setTrunkAngle(-5);
  secondTreeConfig.setMaxTrunkLength(45);
  secondTreeConfig.setMaxLevel(8);
  final BranchConfiguration secondBranchConfig = new BranchConfiguration();
  secondBranchConfig.setGrowSteps(8);
  final LeafConfiguration secondLeafConfig = new LeafConfiguration();
  secondLeafConfig.setLeafColor(color(0, 100, 0));
  secondLeafConfig.setLeafColorAlpha(80);
  secondTree = new Tree("second", new PVector(width / 1.5, height), secondTreeConfig, secondBranchConfig, secondLeafConfig);
  secondTree.registerTreeGrowListener(seedListener);
  
  final TreeConfiguration thirdTreeConfig = new TreeConfiguration();
  thirdTreeConfig.setTrunkAngle(-5);
  thirdTreeConfig.setMaxTrunkLength(130);
  thirdTreeConfig.setMaxLevel(12);
  final BranchConfiguration thirdBranchConfig = new BranchConfiguration();
  thirdBranchConfig.setLeftBranchAngleJitterLowBoundry(-20);
  thirdBranchConfig.setLeftBranchAngleJitterHightBoundry(20);
  thirdBranchConfig.setRightBranchAngleJitterLowBoundry(-20);
  thirdBranchConfig.setRightBranchAngleJitterHightBoundry(20);
  thirdBranchConfig.setAditionalNextBranchAngle(45);
  thirdBranchConfig.setGrowSteps(32);
  final LeafConfiguration thirdLeafConfig = new LeafConfiguration();
  thirdLeafConfig.setLeafColor(color(12, 200, 0));
  thirdLeafConfig.setLeafColorAlpha(40);
  thirdTree = new Tree("third", new PVector(width / 1.25 + 40, height), thirdTreeConfig, thirdBranchConfig, thirdLeafConfig);
  thirdTree.registerTreeGrowListener(seedListener);
  
  final TreeConfiguration fourthTreeConfig = new TreeConfiguration();
  fourthTreeConfig.setTrunkAngle(0);
  fourthTreeConfig.setMaxTrunkLength(30);
  fourthTreeConfig.setMaxLevel(6);
  final BranchConfiguration fourthBranchConfig = new BranchConfiguration();
  fourthBranchConfig.setLeftBranchAngleJitterLowBoundry(0);
  fourthBranchConfig.setLeftBranchAngleJitterHightBoundry(4);
  fourthBranchConfig.setRightBranchAngleJitterLowBoundry(-5);
  fourthBranchConfig.setRightBranchAngleJitterHightBoundry(0);
  fourthBranchConfig.setAditionalNextBranchAngle(20);
  fourthBranchConfig.setGrowSteps(16);
  final LeafConfiguration fourthLeafConfig = new LeafConfiguration();
  fourthLeafConfig.setLeafColor(color(200, 0, 100));
  fourthLeafConfig.setLeafColorAlpha(10);
  fourthTree = new Tree("fourth", new PVector(width / 3 + 80 - 100, height), fourthTreeConfig, fourthBranchConfig, fourthLeafConfig);
  fourthTree.registerTreeGrowListener(seedListener);

  
  final TreeConfiguration fifthTreeConfig = new TreeConfiguration();
  fifthTreeConfig.setTrunkAngle(-2);
  fifthTreeConfig.setMaxTrunkLength(50);
  fifthTreeConfig.setMaxLevel(8);
  final BranchConfiguration fifthBranchConfig = new BranchConfiguration();
  fifthBranchConfig.setLeftBranchAngleJitterLowBoundry(0);
  fifthBranchConfig.setLeftBranchAngleJitterHightBoundry(4);
  fifthBranchConfig.setRightBranchAngleJitterLowBoundry(-5);
  fifthBranchConfig.setRightBranchAngleJitterHightBoundry(0);
  fifthBranchConfig.setAditionalNextBranchAngle(20);
  fifthBranchConfig.setGrowSteps(10);
  final LeafConfiguration fifthLeafConfig = new LeafConfiguration();
  fifthLeafConfig.setLeafColor(color(100, 0, 50));
  fifthLeafConfig.setLeafColorAlpha(5);
  fifthTree = new Tree("fifth", new PVector(width / 3 + 110 - 100, height), fifthTreeConfig, fifthBranchConfig, fifthLeafConfig);
  fifthTree.registerTreeGrowListener(seedListener);

  final TreeConfiguration sixthTreeConfig = new TreeConfiguration();
  sixthTreeConfig.setTrunkAngle(-3);
  sixthTreeConfig.setMaxTrunkLength(35);
  sixthTreeConfig.setMaxLevel(8);
  final BranchConfiguration sixthBranchConfig = new BranchConfiguration();
  sixthBranchConfig.setGrowSteps(8);
  sixthBranchConfig.setLeftBranchAngleJitterLowBoundry(-10);
  sixthBranchConfig.setLeftBranchAngleJitterHightBoundry(10);
  sixthBranchConfig.setRightBranchAngleJitterLowBoundry(-10);
  sixthBranchConfig.setRightBranchAngleJitterHightBoundry(10);
  final LeafConfiguration sixthLeafConfig = new LeafConfiguration();
  sixthLeafConfig.setLeafColor(color(200, 0, 80));
  sixthLeafConfig.setLeafColorAlpha(20);
  sixthTree = new Tree("second", new PVector(width / 3 - 10 - 100, height), sixthTreeConfig, sixthBranchConfig, sixthLeafConfig);
  sixthTree.registerTreeGrowListener(seedListener);
  
}
