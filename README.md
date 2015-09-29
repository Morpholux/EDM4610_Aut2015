EDM4610
=======

Contenu du cours «Image de synthèse et interactivité»<br>
UQAM - Université du Québec à Montréal<br>
Programme de Baccalauréat en médias interactifs

Enseignants : Jean-François Renaud (professeur), <a href="https://github.com/jmcouillard">Jean-Maxime Couillard</a> (chargé de cours)

N’hésitez pas à consulter le <a href="https://github.com/jmcouillard/EDM4610">Repository</a> du cours développé par Jean-Maxime. Vous y trouverez ses notes de cours et les exemples qu’il a préparés en vue des séances du vendredi.<br>

<br>
_ _ _

####Description des exercices

**Atelier Pixels** - mardi, semaine 2

• Réaliser un sketch en colorisant sa surface à l’aide d’une méthode exclusivement matricielle, c’est-à-dire que les valeurs de couleurs sont assignées directement aux pixels. On peut considérer le chargement d’images comme source de données. On évite l’utilisation des commandes set() ou get().

Notions à considérer :

`pixels[], loadPixels(), updatePixels(), loadImage(), PImage`

<br>

**Atelier Dessin vectoriel** - mardi, semaine 3

• Réaliser un sketch présentant un motif ou une structure graphique. Le dessin se fait à l’aide d’une méthode exclusivement vectorielle, c’est-à-dire que les formes sont constituées de tracés (droites, courbes), et donc de points de contrôle pouvant être **modifiés dynamiquement**. On évite l’utilisation des primitives 2D rect() ou ellipse(), car on construit ses propres figures. Bonus pour ceux qui se rendent à l’exportation de leurs rendus en format PDF.

Notions à considérer :

`vertex(), curve(), bezier(), curveVertex(), bezierVertex(), beginShape() endShape(), PShape`

<br>

**Atelier Array et systèmes de pige** - mardi, semaine 4

• Réaliser un sketch dont le dessin repose sur la construction préalable d’un tableau (Array) et la lecture des données en mémoire. Éventuellement on vise une transformation dynamique des données du tableau (écriture, copie, ajout, effacement, ordonnancement, etc.). On utilise les Array standards de Processing, ou les ArrayList si l’on exploite des classes (la programmation-objet). Deux exemples : le dessin d’un polygone se fait en fonction d’une liste de coordonnées, qui sont ensuite modifiées à chaque clic de souris; des rayures sont colorées séquentiellement suivant une palette indexée dans un tableau.

Notions à considérer :

`Array, [], [][], .length(), Array Functions : append(), expand()…`
`ArrayList<>, .size(), .clear(), .get(), .set()`

<br>
_ _ _
