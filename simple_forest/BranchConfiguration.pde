

class BranchConfiguration {
  
  private float sizeMultiplier;
  private float branchAngle;
  private float leftBranchAngleJitterLowBoundry;
  private float leftBranchAngleJitterHightBoundry;
  private float rightBranchAngleJitterLowBoundry;
  private float rightBranchAngleJitterHightBoundry;
  private color branchColor;
  private float branchWeight;
  private int growSteps;
  
  public BranchConfiguration() {
    this.sizeMultiplier = 0.67;
    this.branchAngle = PI / 4;
    this.leftBranchAngleJitterLowBoundry = -0.3;
    this.leftBranchAngleJitterHightBoundry = 0.3;
    this.rightBranchAngleJitterLowBoundry = -0.3;
    this.rightBranchAngleJitterHightBoundry = 0.3;
    this.branchColor = color(51);
    this.branchWeight = 1;
    this.growSteps = 25;
  }
  
  public void setSizeMultiplier(final float sizeMultiplier) {
    this.sizeMultiplier = sizeMultiplier;
  }
  
  public float sizeMultiplier() {
    return this.sizeMultiplier;
  }
  
  public void setBranchAngle(final float branchAngle) {
    this.branchAngle = branchAngle;
  }
  
  public float branchAngle() {
    return this.branchAngle;
  }
  
  public void setLeftBranchAngleJitterLowBoundry(final float leftBranchAngleJitterLowBoundry) {
    this.leftBranchAngleJitterLowBoundry = leftBranchAngleJitterLowBoundry;
  }
  
  public float leftBranchAngleJitterLowBoundry() {
    return this.leftBranchAngleJitterLowBoundry;
  }
  
  public void setLeftBranchAngleJitterHightBoundry(final float leftBranchAngleJitterHightBoundry) {
    this.leftBranchAngleJitterHightBoundry = leftBranchAngleJitterHightBoundry;
  }
  
  public float leftBranchAngleJitterHightBoundry() {
    return this.leftBranchAngleJitterHightBoundry;
  }
  
  public void setRightBranchAngleJitterLowBoundry(final float rightBranchAngleJitterLowBoundry) {
    this.rightBranchAngleJitterLowBoundry = rightBranchAngleJitterLowBoundry;
  }
  
  public float rightBranchAngleJitterLowBoundry() {
    return this.rightBranchAngleJitterLowBoundry;
  }
  
  public void setRightBranchAngleJitterHightBoundry(final float rightBranchAngleJitterHightBoundry) {
    this.rightBranchAngleJitterHightBoundry = rightBranchAngleJitterHightBoundry;
  }
  
  public float rightBranchAngleJitterHightBoundry() {
    return this.rightBranchAngleJitterHightBoundry;
  }

  public void setBranchColor(final color branchColor) {
    this.branchColor = branchColor;
  }
  
  public color branchColor() {
    return branchColor;
  }
  
  public void setBranchWeight(final float weight) {
    this.branchWeight = weight;
  }
  
  public float branchWeight() {
    return branchWeight;
  }
  
  public void setGrowSteps(final int growSteps) {
    this.growSteps = growSteps;
  }
  
  public int growSteps() {
    return this.growSteps;
  }
}
