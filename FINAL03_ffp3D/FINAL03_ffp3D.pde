// Based on Jason Labbee's noise flow painter field
// https://www.openprocessing.org/sketch/803505

import peasy.*; // imports libary peasycam
PeasyCam cam;

Painter pntr;

boolean mode = true; // toggles between pointilism vs. perlin noise flow field

void setup() {
  size(1280, 720, P3D);
  pixelDensity(displayDensity());
  cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(1500);
}

void draw() {
  background(255);
  pntr = new Painter();
  for (int i = 0; i < 1; i++) {
    pntr.addItem(new Item());
  }
  //sphereDetail(1);
  translate(-width/2, -height/2); // translates to center of the screen to rotate the system
  stroke(255);
  fill(255, 50);
  pntr.run();
}

// interactions
void keyPressed() {
  if (key == ' ') {
    mode=!mode;
    pntr.changeImage();
    pntr.addItem(new Item());
  }
}
