class Box {

  float x;  // horizontal location of box
  float y;  // vertical location of box
  float w;  // width of box
  float h;  // width of box
  int n; // box number

  // A boolean variable keeps track of the object's state.
  boolean corner; // state of stripe (mouse is over or not?)
  boolean center;

  Box(int no) {
    // Box size is 1/3rd width and height of sketch 
    w = width/3;
    h = height/3;

    // Box position is centered
    x = width/2 - (w / 2);
    y = height/2 - (h / 2);

    n = no;

    center = false;
    corner = false;
  }

  // Draw box
  void display() {
    if (center) { 
      fill(255);
      cursor(MOVE);
    } else {
      fill(255, 100);
    }

    noStroke();
    rect(x, y, w, h);

    fill(0);
    text(n, x+5, y+15);
  }


  void rollCenter(int mx, int my) { 
    // Left edge is x, Right edge is x + w
    if (mx > x + (w / 3) && mx < x + (w/3*2) && my > y + (h/3) && my < y + (h/3*2)) {
      center = true;
    } else {
      center = false;
    }

    if (center == true && mousePressed == true) {
      x = mx - (w/2);
      y = my - (h/2);
    }
  }

  void rollCorner(int mx, int my) {
    if (mx > x + w - 15 && mx < x + w + 15 && my > y + h - 15 && my < y + h + 15) {
      corner = true;
    } else {
      corner = false;
    }

    if (corner == true && mousePressed == true) {
      w = mx - x;
      h = my - y;
    }
  }
}
