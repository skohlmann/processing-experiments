

class TreeConfiguration {
  
  private float maxTrunkLength;
  private float trunkAngle;
  private int maxLevel;
  
  public TreeConfiguration() {
    this.maxTrunkLength = 100;
    this.trunkAngle = 0;
    this.maxLevel = 10;
  }
  
  public void setMaxTrunkLength(final float maxTrunkLength) {
    this.maxTrunkLength = maxTrunkLength;
  }
  
  public float maxTrunkLength() {
    return this.maxTrunkLength;
  }
  
  public void setTrunkAngle(final float trunkAngle) {
    this.trunkAngle = trunkAngle;
  }

  public float trunkAngle() {
    return this.trunkAngle;
  }
  
  public void setMaxLevel(final int maxLevel) {
    this.maxLevel = maxLevel;
  }
  
  public int maxLevel() {
    return maxLevel;
  }
}
