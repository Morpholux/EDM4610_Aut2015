// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0a3
// mercredi, 24 septembre 2014

int tempsInitial = 0, tempsPresent, tempsEcoule, nbPas;
int dureeTimerEnMillisecondes = 2000;
float progression, emplacementPas;
boolean chronoEnMarche = false;

void setup() {
  size(400,400);
  background(0);
  fill(255);
  noStroke();
  //frameRate(10);
}

void draw() {
  background(0);

  // Évaluation du temps présent
  tempsPresent = millis();
  //Évaluation du temps écoulé depuis le dernier clic (ou depuis le démarrage du sketch si on n’a pas encore cliqué)
  tempsEcoule = tempsPresent - tempsInitial;

  // Le temps écoulé est-il au-delà de la durée fixée par notre minuteur?
  if (tempsEcoule > dureeTimerEnMillisecondes) {
    // Si oui, on n’a plus besoin de recourir au chronomètre
    chronoEnMarche = false;
  }


  // La suite se réalise uniquement lorsque que le chronomètre est en fonction
  if (chronoEnMarche) {
    fill(255);
    rect(20, 20, 40, 40);
    
    progression = tempsEcoule /float(dureeTimerEnMillisecondes);
    //println(progression);
    
    fill(255, 0, 0);
    emplacementPas = lerp(0,200,progression); // arguments lerp() : valeur initiale, valeur finale, valeur progression normalisée
    ellipse(100+emplacementPas, height/2, 10, 10);
    //nbPas++;
    //println(nbPas + " pas");
  }
}

void mousePressed() {
  //if (!chronoEnMarche) { // code optionnel
  tempsInitial = millis();
  chronoEnMarche = true;
  nbPas = 0;
  //}
}

