
class Tree {
  
  PVector begin;
  ArrayList<Branch> branches = new ArrayList<Branch>();
  final float branchAngleMulitplier;
  
  Tree(final PVector begin, final float branchAngleMulitplier) {
    this.begin = begin;
    this.branchAngleMulitplier = branchAngleMulitplier;
  }
  
  void grow() {
    if (branches.isEmpty()) {
      branches.add(new Branch(this.begin, new PVector(this.begin.x, this.begin.y - 100), this.branchAngleMulitplier));
    } else {
      for(int i = branches.size() -1; i >= 0; i--){
        Branch current = branches.get(i);
        //if the current Branch has no children: add them
        if(current.hasLeaf()){
          Branch right = current.firstBranch();
          right.jitterAngle(true);
          branches.add(right);
          Branch left = current.secondBranch();
          left.jitterAngle(true);
          branches.add(left);
        }
      }
    }
  }
  
  void show() {
    ArrayList<Leaf> leaves = new ArrayList();

    for(int i = 0; i < branches.size(); i++){
      branches.get(i).show();
      if (branches.get(i).hasLeaf() && count > 1) {
        leaves.add(branches.get(i).leaf());
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
