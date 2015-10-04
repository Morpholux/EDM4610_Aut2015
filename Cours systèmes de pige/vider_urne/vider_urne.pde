// Le mécanisme de l’urne permet d’éviter les répétitions, car les contenus pigés sont retirés.
// Le nombre de piges ne doit pas dépasser le nombre d’options initiales.

int tailleUrne = 5;
String [] sequence = new String [tailleUrne];
println("Taille urne : "+sequence.length);

String[] consonnes = {"b", "m", "k", "p", "t"};
String[] voyelles = {"a", "e", "i", "u", "u"};

for (int i = 0; i < sequence.length; i++) {
  sequence[i] = consonnes[floor(random(0, consonnes.length))]+voyelles[floor(random(0, voyelles.length))];
}
for (int i = 0; i < sequence.length; i++) {
  println(sequence[i]);
}
println();

for (int i = 0; i < tailleUrne; i++) { // On limite le nombre de piges

  int pige = floor(random(0, sequence.length));
  println("Index pigé : "+pige);
  println("Contenu pigé : "+sequence[pige]);

  // On retire le contenu pigé de la séquence
  sequence = concat(subset(sequence, 0, pige), subset(sequence, pige+1, sequence.length-pige-1));
  println("Ce qui reste dans l’urne :");
  for (int j = 0; j < sequence.length; j++) {
    println(sequence[j]);
  }
  println();
}