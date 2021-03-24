

float degree = 0;
boolean oneRoundDone = false;

void setup() {
  size(400, 400);
  rectMode(CORNER);  // CENTER or CORNER
  frameRate(60);
}

void draw() {
  background(51);  
  stroke(255);
  noFill();
  translate(200, 200);
  circle(0, 0, 100);
  
  fill(255);
  stroke(255);
  rotate(radians(degree));
  rect(36, 36, 100, 100);

  if (degree != 360) {
    degree++;
  } else {
    degree = 0;
    oneRoundDone = true;
  }
  
  if (!oneRoundDone) {
    saveFrame("rotated-###.png");
  }
}
