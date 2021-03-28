

class TreeConfiguration {
  
  private float maxTrunkLength;
  private float trunkAngle;
  
  public TreeConfiguration() {
    this.maxTrunkLength = 100;
    this.trunkAngle = 10;
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
}
