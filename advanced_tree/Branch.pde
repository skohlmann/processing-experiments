
class Branch {
  
  private final float sizeMultiplier = 0.67;
  private boolean jitterAngle = false;
  float angleMultiplier = 1.1;
  private final float angle = PI / 4;

  public PVector begin;
  public PVector end;
  public boolean finished = false;
  
  Branch(final PVector begin, final PVector end, float branchAngleMultiplier) {
    this.begin = begin;
    this.end = end;
    this.angleMultiplier = branchAngleMultiplier;
  }
  
  void jitterEnd(){
    end.x += random(-1, 1);
    end.y += random(-1, 1);
  }

  void jitterAngle(boolean jitter) {
    this.jitterAngle = jitter;
  }
  
  /**
   * displays the Branch
   */
  void show() {
    stroke(255);
    line(begin.x, begin.y, end.x, end.y);
  }
  
  Branch firstBranch() {
    PVector dir = PVector.sub(end, begin);
    dir.rotate(branchAngle(angle));
    dir.mult(sizeMultiplier);
    PVector newEnd = PVector.add(end, dir);
    Branch b = new Branch(end, newEnd, this.angleMultiplier);
    this.finished = true;
    return b;
  }

  Branch secondBranch() {
    PVector dir = PVector.sub(end, begin);
    dir.rotate(branchAngle(-angle));
    dir.mult(sizeMultiplier);
    PVector newEnd = PVector.add(end, dir);
    Branch b = new Branch(end, newEnd, this.angleMultiplier);
    this.finished = true;
    return b;
  }
  
  float branchAngle(float baseAngle) {
    float multipliedAngle = baseAngle * this.angleMultiplier;
    if (jitterAngle) {
      return multipliedAngle * random(0.75, 1.25);
    }
    return multipliedAngle;
  }

  boolean hasLeaf() {
    return !this.finished;
  }
  
  Leaf leaf() {
    final Leaf leaf = new Leaf(this.end);
    leaf.jitterColor(true);
    leaf.jitterSize(true);
    return leaf;
  }
  
  public String toString() {
    return "Branch - begin: " + this.begin + " - end: " + this.end + " - leaf: " + this.finished;
  }
}
