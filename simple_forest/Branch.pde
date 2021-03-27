
class Branch {

  private final float branchAngleJitterFirst;
  private final float branchAngleJitterSecond;
  private final BranchConfiguration branchConfig;

  final PVector begin;
  final PVector end;
  boolean finished = false;
  int level;
  int currentGrowStep = 0;

  Branch(final PVector begin, final PVector end, int level) {
    this(begin, end, level, new BranchConfiguration());
  }

  Branch(final PVector begin, final PVector end, int level, BranchConfiguration branchConfig) {
    this.begin = begin;
    this.end = end;
    this.level = level;
    this.branchAngleJitterFirst = random(branchConfig.leftBranchAngleJitterLowBoundry(), branchConfig.leftBranchAngleJitterHightBoundry());
    this.branchAngleJitterSecond = random(branchConfig.rightBranchAngleJitterLowBoundry(), branchConfig.rightBranchAngleJitterHightBoundry());
    this.branchConfig = branchConfig;
  }

  /**
   * displays the Branch
   */
  public final void show() {
    drawBranch();
  }

  protected void drawBranch() {
    push();
    stroke(branchConfig.branchColor());
    strokeWeight(branchConfig.branchWeight());
    
    if (canGrow()) {
      PVector growVector = effectiveEnd();
      PVector localBegin = begin();
      line(localBegin.x, localBegin.y, growVector.x, growVector.y);
    } else {    
      line(begin().x, begin().y, end().x, end().y);
    }
    pop();
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
    dir.mult(this.branchConfig.sizeMultiplier());
    PVector newEnd = PVector.add(end(), dir);
    Branch b = new Branch(end(), newEnd, level() + 1);
    this.finished = true;
    return b;
  }

  public Branch secondBranch() {
    PVector dir = PVector.sub(end(), begin());
    dir.rotate(-nextBranchAngle() + branchAngleJitterSecond);
    dir.mult(this.branchConfig.sizeMultiplier());
    PVector newEnd = PVector.add(end(), dir);
    Branch b = new Branch(end(), newEnd, level() + 1);
    this.finished = true;
    return b;
  }

  protected float nextBranchAngle() {
    return this.branchConfig.branchAngle();
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
    final int steps = branchConfig.growSteps();
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
  
  public final BranchConfiguration branchConfig() {
    return this.branchConfig;
  }
}
