// Genetic Algorithm, Evolving Shakespeare
// Daniel Shiffman <http://www.shiffman.net>

// Demonstration of using a genetic algorithm to perform a search

// setup()
//  # Step 1: The Population 
//    # Create an empty population (an array or ArrayList)
//    # Fill it with DNA encoded objects (pick random values to start)

// draw()
//  # Step 1: Selection 
//    # Create an empty mating pool (an empty ArrayList)
//    # For every member of the population, evaluate its fitness based on some criteria / function, 
//      and add it to the mating pool in a manner consistant with its fitness, i.e. the more fit it 
//      is the more times it appears in the mating pool, in order to be more likely picked for reproduction.

//  # Step 2: Reproduction Create a new empty population
//    # Fill the new population by executing the following steps:
//       1. Pick two "parent" objects from the mating pool.
//       2. Crossover -- create a "child" object by mating these two parents.
//       3. Mutation -- mutate the child's DNA based on a given probability.
//       4. Add the child object to the new population.
//    # Replace the old population with the new population
//  
//   # Rinse and repeat

// Created 2 May 2005

PFont f,fb;
String phrase;
int popmax;
float mutationRate;
Population popul;

void setup() {
  size(200,200);
  fb = loadFont("Georgia-Bold-12.vlw");
  f = loadFont("Arial-BoldMT-11.vlw");
  phrase = "To be or not to be.";
  popmax = 150;
  mutationRate = 0.01f;

  // Create a population with a target phrase, mutation rate, and population max
  popul = new Population(phrase,mutationRate,popmax);
}

void draw() {
  framerate(30);
  // Generate mating pool
  popul.naturalSelection();
  // Create next generation
  popul.generate();
  // Calculate fitness
  popul.calcFitness();
  displayInfo();
  
  // If we found the target phrase, stop
  if (popul.finished()) {
    noLoop();
  }
}

void displayInfo() {
  background(100);
  // Display current status of population
  String answer = popul.getBest();
  textFont(fb);
  //textMode(SCREEN);
  textAlign(LEFT);
  fill(255);
  text(answer,20,100);
  
  textFont(f);
  text("total generations: " + popul.getGenerations(),20,140);
  text("average fitness: " + popul.getAverageFitness(),20,155);
  text("total population: " + popmax,20,170);
  text("mutation rate: " + int(mutationRate * 100) + "%",20,185);
}



