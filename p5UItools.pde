Box[] boxes = new Box[0];
boolean boxMode;

void setup() {
  size(1280, 800);

  // Initialize all Stripe objects
  for (int i = 0; i < boxes.length; i++) {
    boxes[i] = new Box(boxes.length);
  }
}

void draw() {

  background(100);


  if (boxMode) {
    noFill();
    strokeWeight(10);
    stroke(255, 0, 0);
    rect(5, 5, width-10, height-10);
    cursor(CROSS);

    // display all boxes
    for (int i = 0; i < boxes.length; i++) {
      // Check if mouse is over the Stripe
      boxes[i].rollCenter(mouseX, mouseY);
      boxes[i].rollCorner(mouseX, mouseY);
      boxes[i].display();
    }
  } else {
    cursor(ARROW);
  }
}

void keyPressed() {
  if (key == 'b') {
    if (boxMode == true) {
      boxMode = false;
    } else {
      boxMode = true;
    }
  }  
  if (key == 'n') {
    Box b = new Box(boxes.length);
    boxes = (Box[]) append(boxes, b);
  }
}




//keypress to create a new box (class)
//drag corners of box to coordinates
//record coordinates in a csv
