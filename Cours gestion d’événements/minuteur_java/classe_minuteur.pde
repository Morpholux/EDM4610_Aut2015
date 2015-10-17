// Timer.pde
// Marius Watz - http://workshop.evolutionzone.com
// Takes a duree and delai given in seconds.
// Returns a value in the range [0..1], 0 representing not departed and 
// 1 representing time interval complete.
 
class Minuteur {
  public long depart,delai,duree,dureeTotale,tempsEcoule;
  public float fraction;
  
  // Input: duree (in seconds)
  public Minuteur(float _dur) {
    duree=(long)round(_dur*1000);
    delai= 0L;
    dureeTotale=duree;
    depart=System.currentTimeMillis();
  }

  // Input: duree and delai (in seconds)
  public Minuteur(float _dur,float _del) {
    duree=(long)round(_dur*1000);
    delai=(long)round(_del*1000);
    dureeTotale=duree+delai;
    depart=System.currentTimeMillis();
  }

  public void update() {
    if(fraction>=1) return;
    tempsEcoule=System.currentTimeMillis()-depart;
    if(tempsEcoule<delai) fraction=0;
    else if(tempsEcoule>dureeTotale) fraction=1;
    else fraction=(float)(tempsEcoule-delai)/(float)duree;
  }
}
