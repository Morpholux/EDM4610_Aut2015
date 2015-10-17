// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0
// samedi, 17 octobre 2015

// Historique de gestuel
// Enregistrement de la position et du temps d’un tracé

// Clic et drag pour enregistrer un tracé.
// Le mouvement est conservé en mémoire et visualisé en boucle.

ArrayList mesPositions = new ArrayList();
ArrayList mesTemps = new ArrayList();
int tempsZeroEnregistre, tempsZeroJoue;
boolean onRejoue = false;
int compteur;
float posX, posY, taille;


void setup() {
  size(600, 600);
  background(0);
  smooth();
  fill(255);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(0);

  if (onRejoue) {
    if (((Integer)mesTemps.get(compteur))>tempsZeroJoue-millis()) {
      posX = ((PVector)mesPositions.get(compteur)).x;
      posY = ((PVector)mesPositions.get(compteur)).y;
      pushStyle();
      fill(100);
      ellipse(posX, posY, 10, 10);
      popStyle();
      if (compteur < mesPositions.size()-1) {
        taille = constrain(posX * 0.25, 0, 100);
        rect(300, 300, taille, taille);
        compteur++;
      } else {
        tempsZeroJoue = millis();
        compteur = 0;
      }
    }
  }
}


void mousePressed() {
  mesPositions.clear();
  mesTemps.clear();
  compteur = 0;
  mesPositions.add(new PVector(mouseX, mouseY, 0));
  tempsZeroEnregistre = millis();
  mesTemps.add(0);
  onRejoue = false;
}

void mouseDragged() {
  mesPositions.add(new PVector(mouseX, mouseY, 0));
  mesTemps.add(millis()-tempsZeroEnregistre);
  onRejoue = false;
}

void mouseReleased() {
  //println(mesPositions);
  //println(mesTemps);
  //println(mesPositions.size());
  //println(mesTemps.size());
  onRejoue = true;
}

void keyPressed() {
  tempsZeroJoue = millis();
  compteur = 0;
  background(0);
}