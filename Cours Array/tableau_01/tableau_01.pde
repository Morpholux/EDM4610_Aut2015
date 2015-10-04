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
  for (int i = 0; i < dates.length; i++) {
    //println(i);
    if (dates[i]==1) {
      nbUn++;
    } else {
      nbZero++;
    }
  }
  println("Nombre de 0 : "+nbZero+", nombre de 1 : "+nbUn);
}