// renaud.jean-francois@uqam.ca
// Syntaxe Processing version 2.0b8
// lundi, 6 mai 2013

int tempsZero, tempsUn;
float tempsEcoule;
boolean chronoActif = false;

void setup() {
}

void draw() {
  background(0);
  if (chronoActif) {
    fill(255);
    rect(20, 20, 60, 60);
  }
}

void mousePressed() {
  if (!chronoActif) {
    tempsZero = millis();
    chronoActif = true;
  } 
  else {
    tempsUn = millis();
    tempsEcoule = tempsUn - tempsZero;
    println("Décompte du chronomètre : " + millisToSec(tempsEcoule) +" seconde(s)");
    chronoActif = false;
  }
}

float millisToSec(float _t) {
  float t = _t;
  t *= 0.001;
  return t;
}