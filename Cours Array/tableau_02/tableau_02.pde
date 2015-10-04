// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0b6
// mardi, 29 septembre 2015

int tailleTableau = 10;

int nbUn, nbZero;

int [] dates = new int [tailleTableau];


void setup() {
  size(100, 100);
  background(0);
  fill(255);
  noStroke();
  noLoop();

  // Look Up Table (LUT)
  for (int i = 0; i < dates.length; i++) {
    dates[i] = round(random(1));
  }
}

void draw() {
  background(0);
  for (int j = 0; j < 10; j++) {
    for (int i = 0; i < dates.length; i++) {
      //println(i);
      if (dates[i]==1) {
        nbUn++;
      } else {
        nbZero++;
      }
    }
    println("Nombre de 0 : "+nbZero+", nombre de 1 : "+nbUn);


    // Réinitialisation des variables et du tableau

    nbUn = 0;
    nbZero = 0;


    // Cas 1 : taille du tableau reste inchangée
    //for (int i = 0; i < dates.length; i++) {
    // dates[i] = round(random(1));
    //}
    
    // Cas 2 : taille du tableau modifiée
    tailleTableau = floor(random(100));
    dates = expand(dates, 0);
    dates = new int [tailleTableau];
    
    for (int i = 0; i < dates.length; i++) {
      dates[i] = round(random(1));
    }
  }
}