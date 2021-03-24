
class Leaf {
  
  public PVector at;
  
  boolean jitterSize = false;
  boolean jitterColor = false;
  
  Leaf(PVector at) {
    this.at = at;
  }

  void jitterColor(boolean jitter){
    this.jitterColor = jitter;
  }

  void jitterSize(boolean jitter){
    this.jitterSize = jitter;
  }

  void show() {
    color c = leafColor();
    fill(c, 100);
    noStroke();
    final PVector leafSize = leafSize();
    ellipse(at.x, at.y, leafSize.x, leafSize.y);
  }

  public String toString() {
    return "Leaf - at: " + this.at;
  }
  
  private color leafColor() {
    float green = 200;
    if (this.jitterColor) {
      green += random(-40, 40);
    }
    return color(0, green, 0);
  }
  
  private PVector leafSize() {
    final PVector leafSize = new PVector(8, 8);
    if (this.jitterSize) {
      leafSize.y -= random(-2, 2);
    }
    return leafSize;
  }
}
