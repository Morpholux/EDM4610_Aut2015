// Adaptation d’un code de Douglas Edric Stanley
// Publié le 11 septembre 2007
// http://www.abstractmachine.net/blog/timertask/

// * * * * * * * *
// Remarque importante : ce «timer» est nettement plus précis que la méthode classique
// d’une évaluation du temps écoulé en comparant les millisecondes dans le draw().
// Si la fréquence d’une pulsation peut varier de plus ou moins 1 milliseconde,
// l’avantage de la présente méthode est de ne pas cumuler cette valeur d’imprécision
// lors d’évaluations successives, évitant ainsi un décalage temporel à long terme.
// * * * * * * * *

// Requis dans certaines versions de Processing,
// en raison de l’utilisation des objets Java Timer et TimerTask
import java.util.*;

// Déclaration d’une instance de la classe Pulsation
Pulsation pulsation;

void setup() {
  size(200, 200);
  smooth();
  noStroke();
  // Création d’un objet
  // Le premier paramètre correspond au délai avant le déclenchement des pulsations
  // Le second paramètre correspond à la période des pulsations
  // Les durées sont en millisecondes
  pulsation = new Pulsation(500,1000);
}

void draw() {
  background(0);
  // Appel de la méthode afficher
  pulsation.afficher();
}

void mousePressed() {
  // Pour mettre fin au minuteur dans l’objet en cours d’affichage
  pulsation.terminer();
}

void mouseReleased() {
  // Création d’un nouvel objet
  pulsation = new Pulsation(0, (int)random(200, 1000));
}

