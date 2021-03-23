float angleMultiplier = 0;
float angleMultiplierStep = 0.025;
float angle = PI / 4 * angleMultiplier;
float reduce = 0.67;

void setup() {
  size(400, 400);
  noLoop();
}

void draw() {
  randomSeed(1);
  background(51);
  stroke(255);
  translate(200, height);
  
  branch(100);
  saveFrame("tree-###.png");
}

void branch(float len) {
  line(0, 0, 0, -len);
  translate(0, -len);
  if (len > 4) {
    push();
    rotate(branchAngle(angle));
    branch(len * reduce);
    pop();
    push();
    rotate(branchAngle(-angle));
    branch(len * reduce);
    pop();
  }
}

float branchAngle(float baseAngle) {
  return baseAngle * random(0.75, 1.25);
}

void mousePressed() {
  this.angleMultiplier = this.angleMultiplier + angleMultiplierStep;
  this.angle = PI / 4 * this.angleMultiplier;
  redraw();
}
