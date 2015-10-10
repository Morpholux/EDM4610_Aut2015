// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0
// vendredi, 9 octobre 2015

// Exemple de gestion du déplacement par PVector.
// Cas simple d’un seul mobile à vitesse constante.
// On montre comment réaliser des rebonds sur des parois.

Mobile m1;
int tailleZone = 500;
int zoneTampon = 12;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
  rectMode(CENTER);
  m1 = new Mobile();
}

void draw() {
  background(0);
  pushStyle();
  noFill();
  stroke(250, 120, 0);
  rect((width/2), (height/2), tailleZone, tailleZone);
  popStyle();

  m1.update();
  m1.display();
}

class Mobile {
  PVector loc, vel;
  float angle;

  Mobile() {
    // Position initiale du mobile :
    loc = new PVector(100, 300);

    // C’est maintenant le temps de préciser la direction et l’intensité du déplacement:
    vel = new PVector(1, -0.75, 0);
    vel.setMag(10);

    // On enregistre l’orientation du mobile.
    angle = vel.heading();
  }

  void update() {
    // Comme l’opération est non-statique (le vecteur loc est modifié à chaque cycle du draw)
    // l’emplacement du mobile est régulièrement décalé par le vecteur de vitesse,
    // suivant le même direction et avec la même vélocité.
    loc.add(vel);

    // On appelle la méthode qui permet de vérifier le contact avec les bords du sketch.
    rebond();

    // Mise à jour de l’orientation de la figure dans l’axe de déplacement
    // seulement s’il y a déplacement :
    if (vel.mag() > 0) {
      angle = vel.heading();
    }
  }

  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    beginShape();
    vertex(-20, 0);
    vertex(20, -4);
    vertex(20, -8);
    vertex(30, 0);
    vertex(20, 8);
    vertex(20, 4);
    endShape(CLOSE);
    popMatrix();
  }

  // Fonction importante dans le contexte du projet.
  // Pour empêcher le mobile de quitter la zone délimitée par le cadre jaune.
  void rebond() {
    // Évaluation en fonction des limites sur l’axe horizontal.
    if ((loc.x > width-50-zoneTampon)||(loc.x < 50+zoneTampon)) {
      // Si on frappe le mur, simplement inverser le composant x du vecteur de vélocité
      // sans toucher aux autres composants.
      vel.set(vel.x * -1, vel.y, vel.z);
    }

    // Évaluation en fonction des limites sur l’axe vertical.
    if ((loc.y > height-50-zoneTampon)||(loc.y < 50+zoneTampon)) {
      vel.set(vel.x, vel.y * -1, vel.z);
    }
  }
}