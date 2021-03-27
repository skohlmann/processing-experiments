
class Leaf {
  
  public PVector at;
  private final LeafConfiguration leafConfig;
  
  Leaf(PVector at) {
    this(at, new LeafConfiguration());
  }

  Leaf(PVector at, LeafConfiguration leafConfig) {
    this.at = at;
    this.leafConfig = leafConfig;
  }

  public final void show() {
    drawLeaf();
  }

  protected void drawLeaf() {
    push();
    fill(leafConfig.leafColor(), leafConfig.leafColorAlpha());
    noStroke();
    final PVector leafSize = leafSize();
    ellipse(at.x, at.y, leafSize.x, leafSize.y);
    pop();
  }

  protected PVector leafSize() {
    final PVector leafSize = new PVector(8, 8);
    return leafSize;
  }
  
  protected PVector at() {
    return at;
  }

  public String toString() {
    return "Leaf - at: " + this.at;
  }
  
  public final LeafConfiguration leafConfig() {
    return leafConfig;
  }
}
