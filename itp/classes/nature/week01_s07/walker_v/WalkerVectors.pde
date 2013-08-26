import noc.*;

// Daniel Shiffman
// The Nature of Code
// ITP, Spring 2006
// http://www.shiffman.net/

Walker w;

void setup() {
  size(400,400);
  background(0);
  colorMode(RGB,255,255,255,255);

  // Create a walker object
  w = new Walker();

}

void draw() {
  background(0);
  // Run the walker object
  w.walk();
  w.render();
}


