

class LeafConfiguration {
  
  private color leafColor;
  private float leafColorAlpha;
  
  public LeafConfiguration() {
    this.leafColor = color(0, 200, 0); // green
    this.leafColorAlpha = 100;
  }
  
  public void setLeafColor(final color leafColor) {
    this.leafColor = leafColor;
  }
  
  public color leafColor() {
    return this.leafColor;
  }

  public void setLeafColorAlpha(final float leafColorAlpha) {
    this.leafColorAlpha = leafColorAlpha;
  }
  
  public float leafColorAlpha() {
     return this.leafColorAlpha;
  }
}
