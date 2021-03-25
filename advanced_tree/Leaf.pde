
class Leaf {
  
  public PVector at;
  
  Leaf(PVector at) {
    this.at = at;
  }

  public final void show() {
    drawLeaf();
  }

  protected void drawLeaf() {
    color c = leafColor();
    fill(c, 100);
    noStroke();
    final PVector leafSize = leafSize();
    ellipse(at.x, at.y, leafSize.x, leafSize.y);
  }

  protected color leafColor() {
    float green = 200;
    return color(0, green, 0);
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
}
