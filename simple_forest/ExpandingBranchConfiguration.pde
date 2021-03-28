

class ExpandingBranchConfiguration extends BranchConfiguration {
 
  private int expandingStartLevel;
  private float startBranchAngle;
  private int expandingSteps;
  
  public ExpandingBranchConfiguration() {
    super();
    this.expandingStartLevel = 1;
    this.startBranchAngle = 0;
    this.expandingSteps = 100;
  }
  
  public void setExpandingStartLevel(int expandingStartLevel) {
    this.expandingStartLevel = expandingStartLevel;
  }
  
  public int expandingStartLevel() {
    return this.expandingStartLevel;
  }
  
  public void setBranchStartAngle(float degrees) {
    this.startBranchAngle = degrees;
  }
  
  public final float startBranchAngleDegrees() {
    return this.startBranchAngle;
  }

  public final float startBranchAngleRadians() {
    return radians(startBranchAngleDegrees());
  }
  
  public void setExpandingSteps(final int expandingSteps) {
    this.expandingSteps = expandingSteps;
  }

  public int expandingSteps() {
    return this.expandingSteps;
  }
}
