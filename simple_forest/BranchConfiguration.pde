

class BranchConfiguration {
  
  private float sizeMultiplier;
  private float aditionalNextBranchAngle;
  private float leftBranchAngleJitterLowBoundry;
  private float leftBranchAngleJitterHightBoundry;
  private float rightBranchAngleJitterLowBoundry;
  private float rightBranchAngleJitterHightBoundry;
  private color branchColor;
  private float branchWeight;
  private int growSteps;
  
  public BranchConfiguration() {
    this.sizeMultiplier = 0.67;
    this.aditionalNextBranchAngle = 45;
    this.leftBranchAngleJitterLowBoundry = -15;
    this.leftBranchAngleJitterHightBoundry = 15;
    this.rightBranchAngleJitterLowBoundry = -15;
    this.rightBranchAngleJitterHightBoundry = 15;
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
  
  public void setAditionalNextBranchAngle(final float degrees) {
    this.aditionalNextBranchAngle = degrees;
  }
  
  protected float aditionalNextBranchAngle() {
    return this.aditionalNextBranchAngle;
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
