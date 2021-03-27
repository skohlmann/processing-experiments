
class Tree {
  
  PVector begin;
  float maxTrunkLength;
  ArrayList<Branch> branches = new ArrayList<Branch>();
  private int level;
  
  Tree(final PVector begin) {
    this(begin, 100);
  }

  Tree(final PVector begin, final float maxTrunkLength) {
    this.begin = begin;
    this.maxTrunkLength = maxTrunkLength;
  }
  
  void grow() {
    if (branches.isEmpty()) {
      branches.add(trunk());
    } else {
      for (int i = branches.size() -1; i >= 0; i--) {
        Branch current = branches.get(i);
        current.growIfPossible();
        //if the current Branch has no children: add them
        if (!current.canGrow() && !current.isFinished()) {
          Branch first = current.firstBranch();
          this.level = first.level();
          branches.add(first);
          branches.add(current.secondBranch());
        }
      }
    }
  }
  
  public final int level() {
    return level;
  }

  protected Branch trunk() {
    return new Branch(this.begin, new PVector(this.begin.x, this.begin.y - maxTrunkLength()), 0);
  }
  
  protected float maxTrunkLength() {
    return maxTrunkLength;
  }

  void show() {
    ArrayList<Leaf> leaves = new ArrayList();

    for(int i = 0; i < branches.size(); i++) {
      final Branch branch = branches.get(i);
      branch.show();
      if (!branch.isFinished() && branch.level() != 0) {
        leaves.add(new Leaf(branch.effectiveEnd()));
      }
    }
    
    for(int i = 0; i < leaves.size(); i++){
      leaves.get(i).show();
    }
  }
  
  public String toString() {
    return "Tree - begin: " + this.begin + " - branches: " + this.branches;
  }
}
