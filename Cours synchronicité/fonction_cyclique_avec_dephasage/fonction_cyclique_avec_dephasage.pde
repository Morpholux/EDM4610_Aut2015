// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0
// vendredi, 16 octobre 2015

// La barre d’espace permet de forcer la synchronisation du cycle

float bpm = 60; // Beats per Minute : inscrire la valeur de votre choix
float cyclesParSeconde = bpm/60.0, amplitude = 40, tailleCercle = amplitude, periode;
float ondulation, temps = 0, monHorloge, dephasagePonctuel = 0, dephasageInit = 0;

FloatList inventory;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
  inventory = new FloatList();
  for ( int i =0; i<300; i++) {
    inventory.append(0);
  }
  periode = 1000/cyclesParSeconde; // en millisecondes
  println(periode);
  dephasageInit = map(0.75, 0, 1, 0, TWO_PI);
  dephasageInit = map(dephasageInit, 0, TWO_PI, 0, periode);
}

void draw() {
  background(0);

  // Dessin lignes de repère
  pushStyle();
  noFill();
  stroke(0, 0, 150);
  line(width/2, 0, width/2, height);
  stroke(60, 0, 0);
  line(0, 150-amplitude, width, 150-amplitude);
  line(0, 150, width, 150);
  line(0, 150+amplitude, width, 150+amplitude);
  popStyle();

  // Travail sur le temps
  temps = millis();
  monHorloge = temps + dephasageInit - dephasagePonctuel;
  ondulation = fonctionSin(cyclesParSeconde, monHorloge);
  ellipse(width/2, height/2, tailleCercle+ondulation, tailleCercle+ondulation);

  // Portion pour afficher l’onde
  inventory.remove(0);
  inventory.append(ondulation);
  for ( int i =inventory.size()-1; i>=0; i--) {
    pushMatrix();
    translate(i, 0);
    ellipse(0, -inventory.get(i)+(height/2)-150, 2, 2);
    popMatrix();
  }
}

// Enfoncer la barre d’espace au moment jugé opportun
void keyPressed() {
  if (key == ' ') {
    reSync();
  }
}

// Fonction de resynchronisation
void reSync() {
  dephasagePonctuel = temps%periode;
}

// Fonctions pour gérer mouvements cycliques
float fonctionSin(float freq, float _temps) {
  return (sin(_temps/((1000.0/TWO_PI)/freq))*amplitude);
}

float fonctionSinInverse(float freq, float _temps) {
  return (sin(_temps/((1000.0/TWO_PI)/freq))*amplitude)*-1;
}