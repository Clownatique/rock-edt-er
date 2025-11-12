## tech stack

MUSICIEN: discord, nom
INSTRUMENT:idIn, Objet
MORCEAU: idM
VENDREDI: date, concert
CRENEAU:idC,

https://www.postgresql.org/docs/current/libpq.html

## liste fonctionalités
- le bot est capable d'envoyer des messages dans plusieurs contexte

-- à qui ? : à tout les pseudos renseignées comme étant actifs
-- en disant quoi ? dépends


- le bot est capable de réagir à ses propres messages pour faire apparaitre un
  smile

- le bot est capable de comprendre la réaction de l'utilisateur (en demandant
  une confirmation)

- le bot est capable de déduire, en fonction d'une base de donnée qui sont les
  groupes qui devraient jouer un vendredi donnée

- le bot est capable de demander à la base de donnée toute sorte de chose
  (prérequis) avant de commencer à imaginer un emploi du temps

- le bot doit mettre à jour la base de donnée, notamment : 
chaque jour, et en fonction de l'emploi du temps, il doit:
 - mettre si oui ou non la musique demande une répet de plus
 - tout les jours, mettre à jour les
   propositions de morceaux

## exemple de message

hey :) comment c'était la répet, tu penses vouloir la rejouer ? (/10?)

salut, c'était la deuxième répet de (tel morceau) aujourd'hui, tu t'y engages
? B) 

coucou, comment t'as trouvé (morceau_k) ? tu penses qu'ils seront prêt pour le concert ou qu'il faudra une séance de plus ?

salutations mes chers musicos !! il y'a (musician_a) qui souhaiterait interpreter (morceau_x) ! qui se sentirait de le 
rejoindre sur ce morceau ? (et avec quel instrument ?)




pour construire l'emploi du temps, on peut bêtement se dire que le bot va:
imaginer tout les emplois POSSIBLE
pour imaginer tout les edts possible:
func(gensdispo,musiqueajouer)
pour chaque creneau:
    calculer toutes les combinaisons gens-musique à jouer possibles
    pour chaque musique dans musiqueajouer:
    compter le nombre de gens présents pour musique-i 
    ajouter au tableau les combinaisons de gens pour tels morceaux
  ->[
        (mathieu, nestor, arthur : the strokes)...
        (aimy, andy, rémi : nirvana)...
    ]
    
quand on a la liste des k créneaux terminés : 
: on garde ceux qui peuvent être joué que à ce créneau, on passe au suivant (1ere passe)
(on garde les combinaisons)   

: on garde ceux qui peuvent potentiellement jouer après (2eme conditon)
: on garde ceux avec des gens qui n'ont pas terminé

ne choisir que les plus complets (aka, là ou le maximum de gens jouent)
540873648236527616
