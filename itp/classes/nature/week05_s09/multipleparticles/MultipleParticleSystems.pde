
// Simple Particle System
// Daniel Shiffman <http://www.shiffman.net>

// Click the mouse to generate a burst of particles
// at mouse location

// Each burst is one instance of a particle system
// with Particles and CrazyParticles (a subclass of Particle)
// Note use of Inheritance and Polymorphism here

ArrayList psystems;

void setup() {
  size(200,200);
  psystems = new ArrayList();
  smooth();
}

void draw() {
  background(255);

  // Cycle through all particle systems, run them and delete old ones
  for (int i = psystems.size()-1; i >= 0; i--) {
    ParticleSystem psys = (ParticleSystem) psystems.get(i);
    psys.run();
    if (psys.dead()) {
      psystems.remove(i);
    }
  }
  
}

// When the mouse is pressed, add a new particle system
void mousePressed() {
  psystems.add(new ParticleSystem(int(random(5,25)),new PVector(mouseX,mouseY)));
}


