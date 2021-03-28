

class ExpandingTree extends Tree {
  
  public ExpandingTree(final String name, final PVector begin, final TreeConfiguration treeConfig, ExpandingBranchConfiguration branchConfig, LeafConfiguration leafConfiguration) {
    super(name, begin, treeConfig, branchConfig, leafConfiguration);
  }

  protected Branch trunk() {
    PVector end = new PVector(this.begin.x + treeConfig().endAdjustmentX(), this.begin.y - treeConfig.maxTrunkLength());
    return new ExpandingBranch(this.begin, end, 0, (ExpandingBranchConfiguration) branchConfig());
  }
}
