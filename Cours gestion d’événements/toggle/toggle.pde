// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0
// samedi, 17 octobre 2015

boolean actif = false;

void setup() {
  size(200, 200);
  background(0);
  fill(255);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(0);
  if (actif) {
    rect(width/2, height/2, 120, 120);
  }
  
  // mousePressed sans les parenthèses est une variable d’état de la souris
  println(mousePressed);
}

// mousePressed() est un événement ponctuel (un signal sur un seul frame)
void mousePressed() {
  // Commande compacte permettant d’inverser
  // la valeur booléenne de la variable.
  actif = !actif;
  println("mousePressed()");
}

void mouseReleased() {
  println("mouseReleased()");
}

void mouseClicked() {
  println("mouseClicked()");
}