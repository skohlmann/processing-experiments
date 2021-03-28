

class TreeConfiguration {
  
  private float maxTrunkLength;
  private float endAdjustmentX;
  
  public TreeConfiguration() {
    this.maxTrunkLength = 100;
    this.endAdjustmentX = 0;
  }
  
  public void setMaxTrunkLength(final float maxTrunkLength) {
    this.maxTrunkLength = maxTrunkLength;
  }
  
  public float maxTrunkLength() {
    return this.maxTrunkLength;
  }
  
  public void setEndAdjustmentX(final float endAdjustmentX) {
    this.endAdjustmentX = endAdjustmentX;
  }

  public float endAdjustmentX() {
    return this.endAdjustmentX;
  }
}
