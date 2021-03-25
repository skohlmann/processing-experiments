
class Branch {

  private final float sizeMultiplier = 0.67;
  private final float branchAngle = PI / 4;

  PVector begin;
  PVector end;
  boolean finished = false;
  int level;

  Branch(final PVector begin, final PVector end, int level) {
    this.begin = begin;
    this.end = end;
    this.level = level;
  }

  /**
   * displays the Branch
   */
  public final void show() {
    drawBranch();
  }

  protected void drawBranch() {
    stroke(branchColor());
    line(begin().x, begin().y, end().x, end().y);
  }

  public Branch firstBranch() {
    PVector dir = PVector.sub(end(), begin());
    dir.rotate(nextBranchAngle());
    dir.mult(sizeMultiplier);
    PVector newEnd = PVector.add(end(), dir);
    Branch b = new Branch(end(), newEnd, level() + 1);
    this.finished = true;
    return b;
  }

  public Branch secondBranch() {
    PVector dir = PVector.sub(end(), begin());
    dir.rotate(-nextBranchAngle());
    dir.mult(sizeMultiplier);
    PVector newEnd = PVector.add(end(), dir);
    Branch b = new Branch(end(), newEnd, level() + 1);
    this.finished = true;
    return b;
  }

  protected float nextBranchAngle() {
    return branchAngle;
  }

  protected final PVector begin() {
    return begin;
  }

  protected final PVector end() {
    return end;
  }

  protected color branchColor() {
    return color(255);
  }

  int level() {
    return this.level;
  }

  boolean hasLeaf() {
    return !this.finished;
  }
  
  public boolean canGrow() {
    return false;
  }
  
  public void grow() {}

  public String toString() {
    return "Branch - level: " + level + " - begin: " + this.begin + " - end: " + this.end + " - leaf: " + this.finished;
  }
}
