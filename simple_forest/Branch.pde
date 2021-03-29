
class Branch {

  private final float branchAngleJitterFirst;
  private final float branchAngleJitterSecond;
  private final BranchConfiguration branchConfig;

  final PVector begin;
  final float distance;
  final float branchAngle;
  boolean finished = false;
  int level;
  int currentGrowStep = 0;

  /**
   * A branch is defined by a begining vector of the branch, a branch angle from that begining and the distance of the branch.
   * As a branch is part o a tree, there is also the level of the branch. The zero level should indicate the trunk of a tree.
   */
  Branch(final PVector begin, final float distance, final float branchAngle, int level) {
    this(begin, distance, branchAngle, level, new BranchConfiguration());
  }

  Branch(final PVector begin, final float distance, final float branchAngle, int level, BranchConfiguration branchConfig) {
    this.begin = begin;
    this.distance = distance;
    this.branchAngle = branchAngle;
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
    pushStyle();
    stroke(branchConfig().branchColor());
    strokeWeight(branchConfig().branchWeight());
    
    if (canGrow()) {
      PVector growVector = end();
      PVector localBegin = begin();
      line(localBegin.x, localBegin.y, growVector.x, growVector.y);
    } else {
      line(begin().x, begin().y, end().x, end().y);
    }
    popStyle();
  }
  
  public Branch firstBranch() {
    float nextBranchAngle = branchAngle() + this.branchConfig().aditionalNextBranchAngle() + branchAngleJitterFirst;
    float nextDistance = distance() * this.branchConfig().sizeMultiplier();
    Branch b = newBranch(end(), nextDistance, nextBranchAngle);
    this.finished = true;
    return b;
  }

  public Branch secondBranch() {
    float nextBranchAngle = branchAngle() - this.branchConfig().aditionalNextBranchAngle() + branchAngleJitterSecond;
    float nextDistance = distance() * this.branchConfig().sizeMultiplier();
    Branch b = newBranch(end(), nextDistance, nextBranchAngle);
    this.finished = true;
    return b;
  }

  protected final PVector begin() {
    return begin;
  }
  
  protected Branch newBranch(PVector begin, final float distance, final float branchAngle) {
    return new Branch(begin, distance, branchAngle, level() + 1, branchConfig());
  }
  
  protected PVector virtualEnd() {
    PVector lb = begin();
    float ld = distance();
    float lba = branchAngle();
    return new PVector(ld * cos(radians(lba)) + lb.x, ld * sin(radians(lba)) + lb.y);
  }
  
  public PVector end() {
    if (canGrow()) {
      float growPercentage = calculateGrowPercentage(currentGrowStep, growSteps());
      PVector localBegin = begin();
      return lengthFromBegin(localBegin, virtualEnd(), growPercentage);
    }
    return virtualEnd();
  }

  float calculateGrowPercentage(int growStep, int growSteps) {
    return 1f / (float) growSteps * (float) growStep;
  }
  
  /**
   * Calculates a vector with a new distance between the begin vector and the end vector.
   */
  PVector lengthFromBegin(PVector begin, PVector end, float lengthPercentage) {
    PVector p1 = PVector.sub(end, begin);
    p1.mult(lengthPercentage);
    return PVector.add(begin, p1); 
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
    final int steps = branchConfig().growSteps();
    int localLevel = level();
    if (localLevel == 0) {
      return steps;
    }
    return steps / localLevel;
  }
  
  public void growIfPossible() {
    if (canGrow()) {
      currentGrowStep++;
    }
  }
  
  public BranchConfiguration branchConfig() {
    return this.branchConfig;
  }
  
  public float distance() {
    return this.distance;
  }
  
  public float branchAngle() {
    return this.branchAngle;
  }
}
