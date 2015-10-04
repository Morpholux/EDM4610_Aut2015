// Interpolation Rayures avec une bande noire à chaque extremite du motif

// Variables globales
int nbBandes, nbIntervalles, nbMaxBandes;
float largeurBande, largeurDeuxBandes, largeurIntervalle, repereX;
boolean auDessusSketch = false;
color[] listeCouleurs;
int index = 0;
color from, to;


void setup() {
  size(400, 400);
  background(0);
  noStroke();

  // La largeur de la bande est determine de maniere absolue
  largeurBande = 8;
  // Le nombre maximum de bandes est arbitraire, mais on évite le recouvrement
  nbMaxBandes = 40;
  // On fixe le nombre de paires de bandes
  // D’abord les bandes qui vont ouvrir et clore le motif :
  nbBandes = 10; // Changez cette valeur entre 2 et 25 si l'on veut modifier la densite du motif.
  if ((nbBandes < 2)||(nbBandes > nbMaxBandes)) {
    exit();
  }
  // Le nombre d’intervalles est déduit 
  nbIntervalles = nbBandes-1;

  // tandis que les mesures de deux autres variables sont fixees sur une base RELATIVE
  largeurDeuxBandes = ((width-largeurBande) / float(nbIntervalles));
  largeurIntervalle = (largeurDeuxBandes - largeurBande);

  // Création d’une palette
  listeCouleurs = new color[nbIntervalles];
  from = color(204, 102, 0);
  to = color(0, 102, 153);
  for (int i = 0; i < listeCouleurs.length-1; i++) {
    listeCouleurs[i] = lerpColor(from, to, i/float(listeCouleurs.length-1));
  }
  listeCouleurs[listeCouleurs.length-1] = lerpColor(from, to, 1.0);
}


void draw() {
  background(0);

  // La premiere bande
  fill(0);
  rect(0, 0, largeurBande, height);
  translate(largeurBande, 0);
  // Suivent toutes les autres paires de bandes du motif.
  while (repereX < width) {
    // Intervalle, ici les bandes colorées
    if ((index < listeCouleurs.length)&&(index > 0)) {
      fill(listeCouleurs[index]);
    } else if (index == 0) {
      fill(from);
    } else {
      fill(to);
    }
    rect(repereX, 0, repereX + largeurIntervalle, height);
    repereX+=largeurIntervalle;
    // Bande
    fill(0);
    rect(repereX, 0, repereX + largeurBande, height);
    repereX+=largeurBande;
    index++;
  }

  // réinitialisation des variables :
  repereX = 0;
  index = 0;

  if (auDessusSketch) { // occasionnellement

    // Ré-évaluation dynamique du nombre de bandes et des dimensions
    nbBandes = floor(map(mouseX, 0, width, 2, nbMaxBandes+1)); // On peut changer cette valeur si l'on veut modifier la densite du motif.
    nbIntervalles = nbBandes-1;
    largeurDeuxBandes = ((width-largeurBande) / float(nbIntervalles));
    largeurIntervalle = (largeurDeuxBandes - largeurBande);

    // Réinitialisation de la liste de couleurs
    append(listeCouleurs, 0);
    listeCouleurs = new color[nbIntervalles];
    for (int i = 0; i < listeCouleurs.length-1; i++) {
      listeCouleurs[i] = lerpColor(from, to, i/float(listeCouleurs.length-1));
    }
    listeCouleurs[listeCouleurs.length-1] = lerpColor(from, to, 1.0);

    auDessusSketch = false;
  }
}

void mousePressed() {
  from = color(random(256), random(256), random(256));
  // deuxième couleur au hasard
  to = color(random(256), random(256), random(256));
  // ou complementaire
  //to = color(255-red(from),255-green(from),255-blue(from));

  auDessusSketch = true;
}

void mouseMoved() {
  auDessusSketch = true;
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}