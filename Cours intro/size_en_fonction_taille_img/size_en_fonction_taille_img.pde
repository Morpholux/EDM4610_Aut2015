// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0b5
// vendredi, 11 septembre 2015

PImage img;

void setup() {
  img = loadImage("400px.jpg");
  
  // Ancienne méthode :
  // size(img.width, img.height);
  
  // Nouvelle méthode :
  surface.setSize(img.width, img.height);
  
  noLoop();
  println(width);
  println(height);
}

void draw() {
  background(img);
}