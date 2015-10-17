// Adaptation du code source timertest.pde, de Marius Watz
// Publié le 14 août 2006
// http://workshop.evolutionzone.com/2006/08/14/code-timerpde/

/* This little code piece implements a Minuteur class which takes a duration and countdown, 
 and returns a value in the range [0..1] depending on how much of the specified time has elapsed. 
 The variable "fraction" gives the state of the timer, with a value of 0 representing a state 
 in which the timer has not started (i.e. still in countdown interval). A value of 1 means 
 that the countdown is complete and the time specified as duration has elapsed. 
 A fractional value represents how far into the time interval the program has reached.
 
 This is useful for animation in absolute time, regardless of frame rate. 
 The timer's update() function must be called before using the value contained in the "fraction" variable.
 
 */

Minuteur minuteur;

void setup() {
  size(200, 200);
  smooth();
  
  // Initialisation de minuteur avec une durée d’animation de 2.5 secondes,
  // et un délai de 1 seconde avant son exécution.
  minuteur= new Minuteur(2.5, 1);
  
}

void draw() {
  background(0);

  // Mise à jour du minuteur
  minuteur.update();

  // Utilisation de la variable fraction dans une animation
  float diametre = 20 + minuteur.fraction*150;
  ellipse(100, 100, diametre, diametre);
  
  
}

void mousePressed() {
  minuteur = new Minuteur(random(0.1, 1));
}

