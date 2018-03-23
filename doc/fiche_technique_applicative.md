# Fiche technique de l'application #

## Généralité

|Représentation| Nom de l'application |Résumé|
|:---|:---|:---|
|![picto](../img/picto_cc_asscol.png)|Conformité Assainissement|Cette application est dédiée à la saisie et au suivi des contrôles de conformité pour l'Assainissement collectif. La saisie des contrôles est effectuée directement par les prestataires agréés sur cette application, et le service assainissement de l'Agglomération peut valider en ligne ces contrôles et gérer les relances aux différents propriétaires concernés par un contrôle non conforme. Cette application permet également de faire des recherches et d'éditer des courriers.|

## Accès

|Public|Métier|Accès restreint|
|:-:|:-:|:---|
||X|Accès réservé aux prestataires agréés et aux personnes du service assainissement. Des profils de connexions spécifiques ont été créés pour les prestataires dans le LDAP externe|

## Droit par profil de connexion

* **Prestataires**

|Fonctionnalités|Lecture|Ecriture|Précisions|
|:---|:-:|:-:|:---|
|Recherche par adresse|x|||
|Recherche par n° de dossier|x|||
|Liste des contrôles non conforme|||Accès réservé au service assainissement|
|Recherche des contrôles depuis le|||Accès réservé au service assainissement|
|Information sur le prestataire|x||La connexion filtre l'affichage des informations sur le profil du prestataire|
|Cartographie|x|||
|Fiches d'informations des contrôles|x|x|Les contrôles validés sont accessibles en lecture mais ne peuvent plus être modifiés. L'attribut de validation n'est pas éditable|
|Fiches d'informations du prestataire|x|x|La connexion filtre l'affichage des informations sur le profil du prestataire|

* **Personnes du service métier**

|Fonctionnalités|Lecture|Ecriture|Précisions|
|:---|:-:|:-:|:---|
|Toutes|x|x|Les contrôles validés sont accessibles en lecture mais ne peuvent plus être modifiés|

* **Autres profils**

|Fonctionnalités|Lecture|Ecriture|Précisions|
|:---|:-:|:-:|:---|
|aucune|||pas d'accès autorisé|
