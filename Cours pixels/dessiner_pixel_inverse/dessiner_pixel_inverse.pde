// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0a3
// mardi, 9 septembre 2014

// Consignes d’utilisation : dessiner les pixels inversés d’une image en cliquant-glissant la souris

// Changements apportés depuis la version réalisée en classe :
// - l’inversion de la couleur pour chaque canaux se fait par la soustraction 255 - r (et non 256 - r)
// - la commande constrain a été déplacée, au point de saisie des coordonnées de la souris : appliquée sur chaque axe
// - l’inversion des valeurs RGB se fait avant le BitShifting de reconstitution de la nouvelle couleur
// - on dessine les nouveaux pixels sur une copie de l’image originale plutôt que sur le sketch

PImage img, imgCopie;
color couleurImageOriginale, nouvelleCouleur;
int a, r, g, b;
int sourisX, sourisY;

void setup() {
  img = loadImage("ying.jpg");
  size(img.width, img.height);
  imgCopie = createImage(img.width, img.height, RGB); // seule la copie sera modifiée, évitant ainsi d’altérer l’original

  // On créé un double de l’image chargée en mémoire :
  //imgCopie.copy(img,0,0,width, height, 0,0,width, height);

  // Commande alternative à la commande de copie ci-dessus :
  arrayCopy(img.pixels, imgCopie.pixels);

  // On n’affiche pas le symbole du curseur, pour mieux voir sous la souris
  noCursor();
}

void draw() {
  // On affiche la copie de l’image originale.
  // C’est elle qui sera modifiée par les commandes d’écriture, dans le mouseDragged()
  background(imgCopie);

  // Dessin du curseur personnalisé
  stroke(255);
  //strokeWeight(0.5);
  noFill();
  point(mouseX, mouseY);
  rectMode(CENTER);
  rect(mouseX, mouseY, 10, 10);
}

void mouseDragged() {
  // Grâce à la commande constrain(), la lecture
  // de la position de la souris ne pourra pas se faire
  // en dehors des dimensions du sketch.

  //sourisX = constrain(mouseX, 0, width-1);
  //sourisY = constrain(mouseY, 0, height-1);

  // Une solution alternative :
  //if ((mouseX >= 0)&(mouseX < width)) sourisX = mouseX;
  //if ((mouseY >= 0)&(mouseY < height)) sourisY = mouseY;

  // Encore mieux, on applique la méthode de lecture-écriture
  // que si la souris est positionnée dans la zone du sketch:
  
  if ((mouseX >= 0)&(mouseX < width)&(mouseY >= 0)&(mouseY < height)) {
  
  // Portion lecture des pixels de l’image en mémoire
  img.loadPixels();
  couleurImageOriginale = img.pixels[maFonction(sourisX, sourisY)];
  a = (couleurImageOriginale >> 24) & 0xFF;
  r = (couleurImageOriginale >> 16) & 0xFF;
  g = (couleurImageOriginale >> 8) & 0xFF;
  b = couleurImageOriginale & 0xFF;
  //println("alpha : "+a+", rouge : "+r+" , vert : "+g+", bleu : "+b);

  //a = a;
  // inversion des valeurs RGB : 255 - valeur
  r = 255-r;
  g = 255-g;
  b = 255-b;

  //nouvelleCouleur = color(r,g,b);
  nouvelleCouleur = (a << 24) | (r << 16) | (g << 8) | b;

  // Procédure d’écriture des pixels dans une copie de l’image originale.
  // On laisse la trace de notre action, car rien ne vient l’effacer
  imgCopie.loadPixels();
  imgCopie.pixels[maFonction(sourisX, sourisY)] = color(nouvelleCouleur);
  imgCopie.updatePixels();
  
  }
}


// Fonction de conversion des coordonnées cartésiennes X et Y vers l’index d’un tableau unidimensionnel
int maFonction(int posX, int posY) {
  int monIndex;
  monIndex = (posY*width)+posX;

  // La solution de Marc-Antoine ne couvre pas tous les problèmes,
  // car on peut sortir à droite du sketch…
  // et on restera quand même à l’intérieur des limites du tableau.
  // Mieux vaut appliquer la commande constrain() en amont dans le code.
  //return constrain(monIndex, 0, (width*height)-1);

  return monIndex;
}

