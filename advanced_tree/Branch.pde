
class Branch {

  private final float sizeMultiplier = 0.67;
  private final float branchAngle = PI / 4;

  PVector begin;
  PVector end;
  boolean finished = false;
  int level;
  int currentGrowStep = 0;

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

/*
    println(begin());
    println(end());
    PVector p2 = new PVector(0, 0, 0);
    PVector.sub(end(), begin(), p2);
    println("p2: " + p2);

    p2.mult(0.75);
    PVector p3 = PVector.add(begin(), p2);
    println("p3: " + p3);
    
    PVector beginShift = new PVector(begin().x - 30, begin().y);
    PVector p3Shift = new PVector(p3.x - 30, p3.y);
    println("beginShift: " + beginShift);
    println("p3Shift: " + p3Shift);

    line(beginShift.x, beginShift.y, p3Shift.x, p3Shift.y);
*/
  }
  
  PVector lengthFromBegin(PVector begin, PVector end, float lengthPercentage) {
    float realPercent = adjustNormalizedPercent(normalizePercent(lengthPercentage));
    PVector p1 = PVector.sub(end, begin);
    p1.mult(realPercent);
    return PVector.add(begin(), p1);
  }
  
  float adjustNormalizedPercent(final float percent) {
    if (percent > 1) {
      return 1f;
    } else if (percent < -1) {
      return -1;
    }
    return percent;
  }
  
  float normalizePercent(final float percent) {
    if (percent > 1 || percent < -1) {
      return percent / 100;
    }
    return percent;
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
    return growSteps() != currentGrowStep;
  }
  
  protected int growSteps() {
    return 4;
  }
  
  public void growIfPossible() {
    if (canGrow()) {
      currentGrowStep++;
    }
  }

  public String toString() {
    return "Branch - level: " + level + " - begin: " + this.begin + " - end: " + this.end + " - leaf: " + this.finished;
  }
}
