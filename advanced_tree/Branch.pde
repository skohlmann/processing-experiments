
class Branch {

  private final float sizeMultiplier = 0.67;
  private final float branchAngle;
  private final float branchAngleJitterFirst;
  private final float branchAngleJitterSecond;

  PVector begin;
  PVector end;
  boolean finished = false;
  int level;
  int currentGrowStep = 0;

  Branch(final PVector begin, final PVector end, int level) {
    this(begin, end, level, PI / 4);
  }

  Branch(final PVector begin, final PVector end, int level, float branchAngle) {
    this.begin = begin;
    this.end = end;
    this.level = level;
    this.branchAngle = branchAngle;
    this.branchAngleJitterFirst = random(-0.3, 0.3);
    this.branchAngleJitterSecond = random(-0.3, 0.3);
  }

  /**
   * displays the Branch
   */
  public final void show() {
    drawBranch();
  }

  protected void drawBranch() {
    stroke(branchColor());
    
    println(this);
    
    if (canGrow()) {
      PVector growVector = effectiveEnd();
      PVector localBegin = begin();
      line(localBegin.x, localBegin.y, growVector.x, growVector.y);
    } else {    
      line(begin().x, begin().y, end().x, end().y);
    }
  }
  
  float calculateGrowPercentage(int growStep, int growSteps) {
    return 1f / (float) growSteps * (float) growStep;
  }
  
  PVector lengthFromBegin(PVector begin, PVector end, float lengthPercentage) {
    PVector p1 = PVector.sub(end, begin);
    p1.mult(lengthPercentage);
    return PVector.add(begin, p1);
  }
  
  public Branch firstBranch() {
    PVector dir = PVector.sub(end(), begin());
    dir.rotate(nextBranchAngle() + branchAngleJitterFirst);
    dir.mult(sizeMultiplier);
    PVector newEnd = PVector.add(end(), dir);
    Branch b = new Branch(end(), newEnd, level() + 1);
    this.finished = true;
    return b;
  }

  public Branch secondBranch() {
    PVector dir = PVector.sub(end(), begin());
    dir.rotate(-nextBranchAngle() + branchAngleJitterSecond);
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
  
  public PVector effectiveEnd() {
    if (canGrow()) {
      float growPercentage = calculateGrowPercentage(currentGrowStep, growSteps());
      PVector localBegin = begin();
      return lengthFromBegin(localBegin, end(), growPercentage);
    }
    return end();
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

  boolean isFinished() {
    return this.finished;
  }
  
  public boolean canGrow() {
    return growSteps() > currentGrowStep;
  }
  
  protected int growSteps() {
    final int steps = 25;
    int localLevel = level();
    if (localLevel == 0) {
      return steps;
    } else {
      return steps / localLevel;
    }
  }
  
  public void growIfPossible() {
    if (canGrow()) {
      currentGrowStep++;
    }
  }

  public String toString() {
    return "Branch - level: " + level + " - begin: " + this.begin + " - end: " + this.end + " - branchAngle: " + branchAngle + " - branchAngleJitterFirst: " + branchAngleJitterFirst + " - branchAngleJitterSecond: " + branchAngleJitterSecond + " - currentGrowStep: " + currentGrowStep + " - leaf: " + this.finished;
  }
}
