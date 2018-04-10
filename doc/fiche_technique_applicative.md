![picto](/img/Logo_web-GeoCompiegnois.png)

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
|aucune|||Pas d'accès autorisé. Les informations des contrôles devraient être consultables également dans l'application Réseau Humide en simple lecture pour les autres personnes du pôle|

## Les données utilisées

Sont décrites ici les Géotables et/ou Tables intégrées dans GEO pour les besoins de l'application. Les autres données servant d'habillage (pour la cartographie ou les recherches) sont listées dans les autres parties ci-après. Le tableau ci-dessous présente uniquement les changements (type de champ, formatage du résultat, ...) ou les ajouts (champs calculés, filtre, ...) non présents dans la donnée source. 

* Géotable : `xapps_geo_v_euep_cc`

|Attributs| Champ calculé | Formatage |Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|
|affiche_blanc|x||Contient le caractère `-` pour affichage dans l'info-bulle de résultat. Ce champ est affiché dans le résulat d'une recherche d'un contrôle pour gérer le fait que GEO affiche dans cette info-bulle les 2 premiers champs intégrés dans le résultat d'une recherche|*Recherche :* Recherche par adresse (AC) |![picto](/img/info_bulle_result_rech_cc.png)|
|affiche_cc |x||Formate l'affichage de la conformité au lieu de oui/non |*Cartothèque :* champ de catégorisation pour l'affichage du libellé de la conformité ||
|affiche_controle |x||Formate l'affichage du résultat d'une recherche d'un contrôle en html dans le menu du même nom |*Recherche :* Recherche par adresse (AC), Contrôle de conformité AC |![picto](/img/affiche_menu_result_rech_cc.png)|
|affiche_result  |x||Formate l'affichage d'un texte précisant à l'utilisateur de cliquer pour zoomer sur l'adresse au résultat d'une recherche d'un contrôle par l'adresse|*Recherche :* Recherche par adresse (AC) |![picto](/img/affiche_menu_result_rech_cc_ad.png)|
|ccdate  ||x|Formate la date du dernier en contrôle en dd/mm/yyyy|||
|etiquette_nbcc  |x||Formate l'affichage du nombre de contrôle à l'adresse `si nb_cc > 0 affichage le nombre sinon rien`|*Cartothèque :* champ d'étiquette (avec Visibilité : 0 au 1/10000è) ||

## Détails des fonctionnalités

## Composition de la cartographie

## Composition de l'application

## Particularités
