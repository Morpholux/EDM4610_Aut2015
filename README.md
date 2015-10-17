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

T1 . **Atelier Pixels** - mardi, semaine 2

• Réaliser un sketch en colorisant sa surface à l’aide d’une méthode exclusivement matricielle, c’est-à-dire que les valeurs de couleurs sont assignées directement aux pixels. On peut considérer le chargement d’images comme source de données. On évite l’utilisation des commandes set() ou get().

Notions à considérer :

`pixels[], loadPixels(), updatePixels(), loadImage(), PImage`

<br>

T3 . **Atelier Dessin vectoriel** - mardi, semaine 3

• Réaliser un sketch présentant un motif ou une structure graphique. Le dessin se fait à l’aide d’une méthode exclusivement vectorielle, c’est-à-dire que les formes sont constituées de tracés (droites, courbes), et donc de points de contrôle pouvant être **modifiés dynamiquement**. On évite l’utilisation des primitives 2D rect() ou ellipse(), car on construit ses propres figures. Bonus pour ceux qui se rendent à l’exportation de leurs rendus en format PDF.

Notions à considérer :

`vertex(), curve(), bezier(), curveVertex(), bezierVertex(), beginShape() endShape(), PShape`

<br>

T5 . **Atelier Array et systèmes de pige** - mardi, semaine 4

• Réaliser un sketch dont le dessin repose sur la construction préalable d’un tableau (Array) et la lecture des données en mémoire. Éventuellement on vise une transformation dynamique des données du tableau (écriture, copie, ajout, effacement, ordonnancement, etc.). On utilise les Array standards de Processing, ou les ArrayList si l’on exploite des classes (la programmation-objet) et que l’on est assez avancé pour fonctionner dans ce modèle.<br>
Exemple d’un exercice : le dessin d’une tige de plante avec des feuilles, sachant que la taille des feuilles provient de valeurs mémorisées dans un tableau.

Notions à considérer :

`Array, [], [][], .length(), Array Functions : append(), expand()…`

`ArrayList<>, .size(), .clear(), .get(), .set()`

<br>

T7 . **Atelier transformateurs géométriques et intro PVector** - mardi, semaine 5

• Revoir le principe de répartition de primitives sur une grille en exploitant cette fois un positionnement par PVector. En d’autres termes, des objets sont dessinés à des positions en X et en Y qui se trouvent à être calculées par des opérations sur des vecteurs, plus précisement, l’opérateur d’addition du type `v3 = PVector.add(v1, v2);`. Bonus : les objets qui sont affichés sur la grille seront toujours orientés vers une cible donnée, le curseur de la souris en mouvement par exemple.

[![Grille avec PVector](https://c1.staticflickr.com/1/695/21927570291_8fc275c654_n.jpg
"Cliquez pour afficher l’image sur le compte Flickr")](https://www.flickr.com/photos/jfrenaud/21927570291/)

Nous allons au préalable réviser les bases des transformateurs géométriques, ainsi que les commandes qui permettent de limiter leur portée.

Notions à considérer :

`pushMatrix(), popMatrix(), translate(), rotate(), scale()`

`PVector, .add(), .set(), .heading()`

<br>

T9 . **Atelier PVector et simulation de forces physiques** - mardi, semaine 6

• Créer une animation dont les mouvements sont gérés par des opérations sur les PVector. On s’efforce d’introduire des simulations de forces physiques : vitesse, accélération, friction, gravité, déviation, etc. À la base, il faut exploiter la méthodologie des trois vecteurs de base : location, velocity, acceleration. Il faut ensuite introduire une force externe qui viendra influencer l’élan initial. Par exemple, une force de friction, un mouvement brownien, un rebond, etc.

Notions à considérer :

`PVector, .add(), .sub(), .set(), mag(), .setMag(), .normalize(), .mult(), .limit(), .cross()`

<br>

T11 . **Synchronicités audiovisuelles et gestion d’événements** - mardi, semaine 7

• Créer un «instrument visuel» simple, dont les affichages répondent à une forme de contrôle externe, de type performatif. À l’instar des techniques de VJing, votre *Sketch*, même si minimaliste, permettra de faire des interventions **pendant l’écoute d’une musique**. Il y a donc lieu de développer des effets qui vont contribuer à donner une certaine vitalité, ou à exploiter des mécanismes de déclenchement ponctuel, afin de renforcer la relation entre l’image et le son. L’utilisation d’un contrôleur MIDI est à considérer.

Typologie des actions et des dynamiques d’événement :

1. Bang binaire (du type On|Off);
2. Bang avec donnée d’intensité (une note MIDI et sa vélocité, par exemple);
3. Continuum : éléments qui se succèdent d’une façon continue (les contrôles continus – CC – en MIDI par exemple);
4. Geste : mouvement d’un tracé sur une surface et transposition de la donnée au besoin.

Figures d’expression :

1. Synchronie (des stimuli sonore et visuel sont associés, du fait qu’ils sont perçus en même temps)
2. Intensification (lien entre amplitude sonore et luminosité des couleurs, par exemple)

<br>
_ _ _
