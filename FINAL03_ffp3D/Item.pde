class Item {
  float strokeLength;
  float strokeThickness;
  float noiseScale;

  float drawLength;
  float frame;

  int x, y, z;

  float r, g, b, a;

  Item() {

    strokeLength = 20;
    strokeThickness = 3;
    noiseScale = 0.005; // scale of perlin noise

    drawLength =  40000; // number of items generated
    frame = 0; // starting number of frames per second
  }

  void render(PImage img) {

    //if frames exceed draw length, ends item generation
    if (frame > drawLength) {
      return;
    }

    translate(width/2 - img.width/2, height/2 - img.height/2);

    //maps spawn count (0 to drawlength -> paramaters)
    float count = map(frame, 0, drawLength, 30000, 40000);

    for (int i = 0; i < count; i++) { // add a new loop to create multiple strokes
      //selects a random position on the image
      x = int(random(img.width));
      y = int(random(img.height));
      z = int(random(-50, 50));

      //mapping position to pixel index
      int index = (y * img.width + x);

      //getting the pixel's color and alpha values
      r = red(img.pixels[index]);
      g = green(img.pixels[index]);
      b = blue(img.pixels[index]);
      a = alpha(img.pixels[index]);

      // updates pixel colors
      img.updatePixels();

      //noStroke();
      //fill(r, g, b, a);
      //lights();
      //translate(x, y, z);
      //sphere(10);

      if (mode == true) {
        stroke(r, g, b, a);  // stroke's color
        strokeWeight(7);  // stroke's thickness
        point(x, y, z);
      }


      if (mode == false) {
        stroke(r, g, b, a); // stroke's color
        pushMatrix();
        translate(x, y, z); // translates to the stroke's position, this is its center
        float n = noise(x * noiseScale, y * noiseScale); // uses position values as inputs. initiates perlin noise.
        rotate(radians(map(n, 0, 1, -180, 180))); // maps output of noise to a bigger rotation range to rotate it
        float lengthVariation = random(0.50, 1.50);  // randomizes a multiplier to make length shorter or longer
        line(0, 0, strokeLength * lengthVariation, 0); // draws the item with a line

        // draw a highlight for more detail
        stroke(min(r * 3, 255), min(g * 3, 255), min(b * 3, 255), random(100));
        strokeWeight(strokeThickness * 0.8);
        line(0, -strokeThickness * 0.15, strokeLength * lengthVariation, -strokeThickness * 0.15);
        popMatrix();
      }


      frame++;
    }
  }
}
