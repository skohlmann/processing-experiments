

class ExpandingBranch extends Branch {
  
  private int expandStep;
  private float increaseAngle;
  
  public ExpandingBranch(final PVector begin, final PVector end, int level, ExpandingBranchConfiguration branchConfig) {
    this(begin, end, level, branchConfig, 0);
  }

  private ExpandingBranch(final PVector begin, final PVector end, int level, ExpandingBranchConfiguration branchConfig, int expandStep) {
    super(begin, end, level, branchConfig);
    this.expandStep = expandStep;
    
    this.increaseAngle = (branchConfig.branchAngleDegrees() - branchConfig.startBranchAngleDegrees()) / branchConfig.expandingSteps();
  }

  protected final float nextBranchAngle() {
    return effectiveAngle();
  }

  protected boolean canExpand() {
    
    boolean isStartLevel = level() >= branchConfig().expandingStartLevel();
    boolean isGreaterDegrees = effectiveAngle() <= branchConfig().branchAngleDegrees();
    boolean isSmalerMaxExpandsSteps = branchConfig().expandingSteps() >= expandStep;
    
    println("\nbranch: " + this.getClass() + "@" + hashCode());
    println("isStartLevel: " + isStartLevel + " - level(): " + level() + " - expandingStartLevel(): " + branchConfig().expandingStartLevel());
    println("isGreaterDegrees: " + isGreaterDegrees + " - effectiveAngle(): " + effectiveAngle() + " - branchAngleDegrees(): " + branchConfig().branchAngleDegrees());
    println("isSmalerMaxExpandsSteps: " + isSmalerMaxExpandsSteps + " - expandingSteps(): " + branchConfig().expandingSteps() + " - expandStep: " + expandStep + "\n");
    
    return isStartLevel && (isGreaterDegrees || isSmalerMaxExpandsSteps);
  }
  
  private float effectiveAngle() {
    float effectiveAngle = expandStep * increaseAngle + branchConfig().startBranchAngleDegrees();
    println("effective angle: " + effectiveAngle + " - expandStep: " + expandStep);
    return effectiveAngle;
  }

  public void growIfPossible() {
    super.growIfPossible();
    if (canExpand()) {
      expandStep++;
    }
  }
  
  protected Branch newBranch(PVector begin, PVector end) {
    return new ExpandingBranch(begin, end, level() + 1, branchConfig(), expandStep);
  }
  
  public ExpandingBranchConfiguration branchConfig() {
    return (ExpandingBranchConfiguration) super.branchConfig();
  }
}
