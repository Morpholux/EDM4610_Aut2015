// Utilisation des propriétés d’héritage en programmation objet
class Pulsation extends TimerTask {
  
  // Objet Java
  Timer timer;
  
  // Variable de la classe
  int alfa;

  Pulsation(int _delai, int _periode) {
    // Création d’une instance de l’objet Timer
    timer = new Timer();
    int delai = _delai;
    int periode = _periode;
    // Méthode de l’objet Timer
    // Le deuxième argument est le délai initial avant le lancement des pulsations
    // Le troisième argument est la période pour chaque pulsation
    timer.scheduleAtFixedRate(this, delai, periode);
  }

  // Il faut obligatoirement déclarer une méthode run(), même si elle ne contribue à rien en particulier
  void run() {
    // Instruction ci-dessous est exécutée ponctuellement, suivant le rythme du minuteur
    // println(System.currentTimeMillis());
    alfa = 255;
    
    // Dé-commenter pour observer dans la console le niveau de précision des pulsations
    //println(millis());
  }

  // Méthode permettant de dessiner quelque chose en fonction du rythme de pulsation
  void afficher() {
    fill(255, alfa);
    ellipse(100, 100, 150, 150);
    if (alfa>0) alfa-=20;
    else alfa=0;
  }

  // Méthode optionnelle pour annuler l’activité du minuteur dans l’objet Timer
  void terminer() {
    timer.cancel();
  }
}