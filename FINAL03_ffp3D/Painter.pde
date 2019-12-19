class Painter {
  PImage img;
  PImage[] imgs; //array that stores images

  int imgIndex = 0; // index that indicates active image
  String[] imgNames = {"george.jpg", "starry.jpg", "poppies.png"}; //string that stores names of images

  ArrayList<Item> items;

  Painter() { // initializing the ArrayList of items
    imgs = new PImage[imgNames.length];
    items = new ArrayList<Item>();
  }

  void preload() { // preloads ArrayList of images
    for (int i = 0; i < imgNames.length; i++) {
      imgs[i] = loadImage(imgNames[i]);
    }
  }

  void run() {
    preload();
    img = imgs[imgIndex];
    img.loadPixels();
    items.get(imgIndex).render(img);
  }

  void changeImage() {
    //background(255);

    imgIndex++; // increases imgIndex by 1

    //returns imgIndex to 0 if imgIndex reaches end of array
    if (imgIndex >= imgNames.length) {
      imgIndex = 0;
    }

    imgs[imgIndex].loadPixels();
  } 

  void addItem(Item item) {
    items.add(item);
  }
}
