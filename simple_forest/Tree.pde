
class Tree {

  PVector begin;
  String name;
  TreeConfiguration treeConfig;
  BranchConfiguration branchConfig;
  LeafConfiguration leafConfig;
  ArrayList<Branch> branches = new ArrayList<Branch>();
  private int level;
  private final HashMap<String, TreeGrowListener> treeGrowListener = new HashMap<String, TreeGrowListener>();
  
  Tree(final PVector begin) {
    this("default", begin, new TreeConfiguration());
  }

  Tree(final String name, final PVector begin, final TreeConfiguration treeConfig) {
    this(name, begin, treeConfig, new BranchConfiguration());
  }

  Tree(final String name, final PVector begin, final TreeConfiguration treeConfig, BranchConfiguration branchConfig) {
    this(name, begin, treeConfig, new BranchConfiguration(), new LeafConfiguration());
  }

  Tree(final String name, final PVector begin, final TreeConfiguration treeConfig, BranchConfiguration branchConfig, LeafConfiguration leafConfiguration) {
    this.begin = begin;
    this.treeConfig = treeConfig;
    this.branchConfig = branchConfig;
    this.leafConfig = leafConfiguration;
    this.name = name;
  }

  void grow() {
    if (branches.isEmpty()) {
      branches.add(trunk());
    } else {
      int oldLevel = level();
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
      if (oldLevel != level()) {
        fireTreeGrowEvent();
      }
    }
  }
  
  private void fireTreeGrowEvent() {
    TreeGrowEvent event = new TreeGrowEvent(name(), level());
    for (TreeGrowListener listener : this.treeGrowListener.values()) {
      listener.onTreeGrow(event);
    }
  }
  
  public final void registerTreeGrowListener(TreeGrowListener listener) {
    this.treeGrowListener.put("" + System.identityHashCode(listener), listener);
  }
  
  public final int level() {
    return level;
  }

  protected Branch trunk() {
    PVector end = new PVector(this.begin.x + treeConfig().endAdjustmentX(), this.begin.y - treeConfig.maxTrunkLength());
    return new Branch(this.begin, end, 0, branchConfig());
  }
  
  void show() {
    ArrayList<Leaf> leaves = new ArrayList();

    for(int i = 0; i < branches.size(); i++) {
      final Branch branch = branches.get(i);
      branch.show();
      if (!branch.isFinished() && branch.level() != 0) {
        leaves.add(newLeaf(branch.effectiveEnd()));
      }
    }
    
    for(int i = 0; i < leaves.size(); i++){
      leaves.get(i).show();
    }
  }
  
  public final String name() {
    return this.name;
  }
  
  protected Leaf newLeaf(PVector at) {
    return new Leaf(at, leafConfig());
  }
  
  public final TreeConfiguration treeConfig() {
    return this.treeConfig;
  }
  
  public final LeafConfiguration leafConfig() {
    return this.leafConfig;
  }
  
  public final BranchConfiguration branchConfig() {
    return this.branchConfig;
  }
  
  public String toString() {
    return "Tree - begin: " + this.begin + " - branches: " + this.branches;
  }
}
