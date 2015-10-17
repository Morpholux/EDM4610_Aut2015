// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0
// samedi, 17 octobre 2015

import themidibus.*; //Utilisation d’une librairie externe
MidiBus myBus;

float largeur, hauteur = 50, luminosite, angle = 0;

void setup() {
  size(400, 400);
  background(0);
  rectMode(CENTER);
  colorMode(HSB);

  //MidiBus.list();
  myBus = new MidiBus(this, 1, 1); // À ajuster selon vos propres clients MIDI.
}

void draw() {
  background(0);

  translate(width/2, height/2);
  rotate(radians(angle));


  fill(0, 255, luminosite);
  rect(0, 0, largeur, hauteur);
  if (largeur > 0) {
    largeur--;
  }
}

void noteOn(int channel, int pitch, int velocity) {
  // Réception de la note # 48 (do du quatrième octave, ou C4)
  switch(pitch) {
  case 48 :
    largeur = map(velocity, 0, 127, 0, width);
    luminosite = map(velocity, 0, 127, 0, 255);
    break;
  case 50 :
    largeur = 50;
    hauteur = map(velocity, 0, 127, 50, height);
    luminosite = map(velocity, 0, 127, 0, 255);
    break;
  }
}

void noteOff(int channel, int pitch, int velocity) {
  // Relachement de la note
  switch(pitch) {
  case 48 :
    luminosite = 0;
    break;
  case 50 :
    hauteur = 50;
    luminosite = 0;
    break;
  }
}

void controllerChange(int channel, int number, int value) {
  // Controleur continu du volume, #7)
  if (number == 7) {
    // Il faudra peut-être ajuster le controleur Arduino,
    // et le forcer à envoyer des valeurs absolues
    // Voir application MIDI Control Center.
    println("Value:"+value);
    angle = map(value, 0, 127, 0, 360);
  }
}