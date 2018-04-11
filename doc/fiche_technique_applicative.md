![picto](/img/Logo_web-GeoCompiegnois.png)

# Fiche technique de l'application #

# Généralité

|Représentation| Nom de l'application |Résumé|
|:---|:---|:---|
|![picto](../img/picto_cc_asscol.png)|Conformité Assainissement|Cette application est dédiée à la saisie et au suivi des contrôles de conformité pour l'Assainissement collectif. La saisie des contrôles est effectuée directement par les prestataires agréés sur cette application, et le service assainissement de l'Agglomération peut valider en ligne ces contrôles et gérer les relances aux différents propriétaires concernés par un contrôle non conforme. Cette application permet également de faire des recherches et d'éditer des courriers.|

# Accès

|Public|Métier|Accès restreint|
|:-:|:-:|:---|
||X|Accès réservé aux prestataires agréés et aux personnes du service assainissement. Des profils de connexions spécifiques ont été créés pour les prestataires dans le LDAP externe|

# Droit par profil de connexion

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

# Les données

Sont décrites ici les Géotables et/ou Tables intégrées dans GEO pour les besoins de l'application. Les autres données servant d'habillage (pour la cartographie ou les recherches) sont listées dans les autres parties ci-après. Le tableau ci-dessous présente uniquement les changements (type de champ, formatage du résultat, ...) ou les ajouts (champs calculés, filtre, ...) non présents dans la donnée source. 

## Géotable : `xapps_geo_v_euep_cc`

|Attributs| Champ calculé | Formatage |Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|
|affiche_blanc|x||Contient le caractère `-` pour affichage dans l'info-bulle de résultat. Ce champ est affiché dans le résulat d'une recherche d'un contrôle pour gérer le fait que GEO affiche dans cette info-bulle les 2 premiers champs intégrés dans le résultat d'une recherche|*Recherche :* Recherche par adresse (AC) |![picto](/img/info_bulle_result_rech_cc.png)|
|affiche_cc |x||Formate l'affichage de la conformité au lieu de oui/non |*Cartothèque :* champ de catégorisation pour l'affichage du libellé de la conformité ||
|affiche_controle |x||Formate l'affichage du résultat d'une recherche d'un contrôle en html dans le menu du même nom |*Recherche :* Recherche par adresse (AC), Contrôle de conformité AC |![picto](/img/affiche_menu_result_rech_cc.png)|
|affiche_result  |x||Formate l'affichage d'un texte précisant à l'utilisateur de cliquer pour zoomer sur l'adresse au résultat d'une recherche d'un contrôle par l'adresse|*Recherche :* Recherche par adresse (AC) |![picto](/img/affiche_menu_result_rech_cc_ad.png)|
|ccdate  ||x|Formate la date du dernier en contrôle en dd/mm/yyyy|||
|etiquette_nbcc  |x||Formate l'affichage du nombre de contrôle à l'adresse `si nb_cc > 0 affichage le nombre sinon rien`|*Cartothèque :* champ d'étiquette (avec Visibilité : 0 au 1/10000è et décalage : 5,8,0,50,50) ||
|numero_complet  |x||Formate l'affichage du nombre complet de l'adresse `numero + repet` pour le filtre de recherche des contrôles par adresse (partie numéro)|*Recherche :* Recherche par adresse (AC) (filtre EUEP - C de C - Numéro voirie) ||
|titre_html  |x||Formate un tableau en html affichant les informations de synthèse du ou des contrôles à l'adresse|*Fiche d'information :* Conformité AC à l'adresse |![picto](/img/affiche_synt_fi_cc.png)|
|titre_liste_html  |x||Formate un tableau en html affichant uniquement la ligne du titre du tableau contenant la liste des contrôles déjà effectués à cette adresse |*Fiche d'information :* Conformité AC à l'adresse |![picto](/img/affiche_synt_fi_liste_cc.png)|

   * filtres : aucun
   * relations :

|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
| xapps_an_euep_cc_nc| id_adresse | 0 à n (égal) |
|xapps_an_euep_cc| id_adresse | 0 à n (égal) |
| xapps_v_adresse| id_adresse | 1 (égal) |

## Table : `an_v_euep_cc`

|Attributs| Champ calculé | Formatage |Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|
|achetpat ||x|Formatage par une liste de domaine ( lt_euep_cc_pat)|||
|affiche_adresse_gras |x||Affiche le champ `adresse` en gras dans le résultat d'une recherche | *Recherche* : Recherche des contrôles depuis le,  Recherche par N° de dossier (AC) ||
|affiche_attestation_logo  |x||Lien http de l'image de l'attestation d'aggrément du prestataire par l'ARC (format image) | *Fiche d'information* : Dossier de conformité AC ||
|affiche_cc_init   |x||Formate l'affichage de l'acronyme au survol de la souris sur le picto contrôle initial | *Fiche d'information* : Dossier de conformité AC |![picto](/img/affiche_acronyme_ci.png)|
|affiche_cc_valid   |x||Formate l'affichage de l'acronyme au survol de la souris sur le picto validation | *Fiche d'information* : Dossier de conformité AC |![picto](/img/affiche_acronyme_cv.png)|
|affiche_conclusion    |x||Formate en html l'en-tête de la partie A/conclusion du rapport de conformité | *Fiche d'information* : Dossier de conformité AC ||
|affiche_controle  |x||Formate l'affichage des pictos de conformité  | *Fiche d'information* : Conformité AC à l'adresse |![picto](/img/affiche_picto_fi.png)|
|affiche_date_dernier_controle  |x|x|Formate l'affichage de la date du contrôle en dd/mm/yyyy dans la liste des contrôles présent à l'adresse | *Fiche d'information* : Conformité AC à l'adresse ||
|affiche_dossier  |x||Formate en html l'affichage des résultats du contrôle dans le menu du même nom à la recherche d'un contrôle | *Recherche* : Recherche des contrôles depuis le, Recherche par N° de dossier (AC) |![picto](/img/affiche_result_rech_cc_dos.png)|
|affiche_glossaire  |x||Formate en html l'affichage du glossaire dans l'onglet du même nom  | *Fiche d'information* : Dossier de conformité AC ||
|affiche_logo  |x||Lien http de l'image du logo de l'ARC  (format image)  | *Fiche d'information* : Dossier de conformité AC ||
|affiche_nidcc |x||Formate le n° de dossier  | *Fiche d'information* : Dossier de conformité AC ||
|affiche_reg |x||Formate en html la partie règlementaire présente dans l'onglet Objet de la mission du dossier de conformité   | *Fiche d'information* : Dossier de conformité AC ||
|affiche_tri |x||Formate en html le n° d'ordre des contrôles et affiché dans les résultats d'une recherche | *Recherche* : Recherche des contrôles depuis le, Recherche par N° de dossier (AC) |![picto](/img/affiche_tri.png)|
|affiche_validite |x||Formate la partie sur la durée du contrôle dans l'onglet A/Conclusion du contrôle du dossier de conformité | *Fiche d'information* : Dossier de conformité AC ||
|batitype||x|Formatage par une liste de domaine (lt_euep_cc_typebati)|||
|ccbien||x|Formatage par une liste de domaine (lt_euep_cc_bien)|||
|ccdate||x|Formatage de la date en dd-mm-yyyy|||
|ccdated||x|Formatage de la date en dd-mm-yyyy|||
|ccinit||x|Formatage du booléen Vrai = oui et Faux = non|||
|ccvalid||x|Formatage du booléen Vrai = Contrôle validé et Faux = Contrôle non validé|||
|certi_dassur ||x|Formatage de la date en dd-mm-yyyy|||
|certtype||x|Formatage par une liste de domaine (lt_euep_cc_certificateur)|||
|date_maj||x|Formatage de la date en dd-mm-yyyy|||
|date_sai||x|Formatage de la date en dd-mm-yyyy|||
|dotype||x|Formatage par une liste de domaine (lt_euep_cc_ordre)|||
|epdiagpc||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|epecoul||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|epfum||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|eppar||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|eppublic||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|epracdp||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|epracpc||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|eprecup||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|eprecupcpt||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|epregarcol||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|epregarext||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|euanomal||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|eubrsch||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|euecoul||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|euepsep||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|euevent||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|eufluo||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|eupc||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|eurefl||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|euregar||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|euregardp||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|eusiphon||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|eusup||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|eusupdoc||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|eusuptype||x|Formatage par une liste de domaine (lt_euep_sup)|||
|propriopat||x|Formatage par une liste de domaine (lt_euep_cc_pat)|||
|rcc||x|Formatage par une liste de domaine (Conforme - Non conforme)|||
|rrebrtype||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|rrechype||x|Formatage par une liste de domaine (lt_euep_cc_eval)|||
|rredptype||x|Formatage par une liste de domaine (lt_euep_cc_typeres)|||
|titre_fiche_affiche|x||Formate en html le titre du dossier de conformité (1er onglet non nommé du dossier) |*Fiche d'information* : Dossier de conformité AC||
|tnidcc||x|Formatage par une liste de domaine (lt_euep_cc_tnidcc)|||
  
   * filtres : aucun
   * relations :

|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
|lt_euep_cc_certificateur| certtype - code | 1 (égal) |
|xapps_geo_v_euep_cc| id_adresse | 0 à n (égal) |
|an_euep_cc_media| idcc - id | 0 à n (égal) |

## Table : `an_euep_cc_media`

|Attributs| Champ calculé | Formatage |Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|
|affiche_lien |x||Formate le lien de téléchargement des documents joints |*Fiche d'information* : Dossier de conformité AC||
|date_sai||x|Formatage de la date en dd-mm-yyyy|||
|l_type||x|Formatage par une liste de domaine (lt_euep_doc)|||
|media||x|Formatage du document joint en type image|||
|miniature||x|Formatage de l'aperçu du document joint en type image|||
   
   * filtres : aucun
   * relations : aucune
   
## Table : `xapps_an_euep_cc_nc`

|Attributs| Champ calculé | Formatage |Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|
|affiche_annee_cc|x||Formate la date du contrôle en yyyy pour sélection de l'année dans les recherches des contrôles non conforme|*Filtre* : Contrôle Non Conformet par date, Contrôle Non Conformet par année (*Recherche* : Liste des contrôles NON CONFORME)||
|affiche_conformite|x||Formatage en html l'affichage du résultat dans le menu du même nom pour la recherche d'un contrôle non conforme|*Recherche* : Liste des contrôles NON CONFORME|![picto](/img/affiche_menu_result_rech_ccnc.png)|
|affiche_espace_objet|x||Formatage en html d'un espace avant l'objet du courrier|*Fiche d'information* : Conformité NON CONFORME - Courrier||
|affiche_espace_signature|x||Formatage en html d'un espace avant la partie signature du courrier|*Fiche d'information* : Conformité NON CONFORME - Courrier||
|affiche_espace_tete|x||Formatage en html d'un espace avant l'en-tête du courrier|*Fiche d'information* : Conformité NON CONFORME - Courrier||
|affiche_espace_tete|x||Formate le mois du contrôle en français pour sélection du mois dans les recherches des contrôles non conforme|*Filtre* : Mois du contrôle de conformité AC (*Recherche* : Liste des contrôles NON CONFORME)||
|affiche_objet|x||Formate en html la partie écrite Objet du courrier|*Fiche d'information* : Conformité NON CONFORME - Courrier||
|affiche_proprio|x||Formate en html la partie coordonnée (ici propriétaire) du courrier|*Fiche d'information* : Conformité NON CONFORME - Courrier||
|affiche_signature|x||Formate en html la partie signature du courrier|*Fiche d'information* : Conformité NON CONFORME - Courrier||
|affiche_texte_courrier|x||Formate en html le corps du courrier|*Fiche d'information* : Conformité NON CONFORME - Courrier||
|ccdate||x|Formatage de la date en dd-mm-yyyy|||
|ccdated||x|Formatage de la date en dd-mm-yyyy|||

   * filtres : aucun
   * relations : 
   
|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
|xapps_geo_v_euep_cc| id_adresse | 1 (égal) |
|xapps_an_euep_cc| idcc | 1 (égal) |

## Table : `lt_euep_cc_certificateur`

|Attributs| Champ calculé | Formatage |Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|
|affiche_resultat|x||Formate le titre de résultat pour la recherche des informations d'un prestataire |*Recherche* : Informations sur le prestataire|![picto](/img/affiche_menu_rech_presta.png)|
|date_assur||x|Formatage de la date en dd-mm-yyyy|||
|etat||x|Formate l'affichage du booléen en Oui ou Non|||
|exist||x|Formate l'affichage du booléen en Oui ou Non|||

   * filtres : 

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:-:|:---:|:---:|:---|:---|
|SECU|code (Code interne du donneur d'ordre)|x|Alphanumérique|est égale à une valeur de contexte|ass_cc_ac|Filtre de sécurité permettant à chaque prestataire de visualiser et de modifier uniquement ces informations de contact|

   * relations : aucune

## Table : `lt_euep_cc_tnidcc`

Sans objet

   * filtres : aucun
   * relations : aucune
   
## Table : `lt_euep_cc_typeres`

Sans objet

   * filtres : aucun
   * relations : aucune
   
## Table : `lt_euep_cc_bien`

Sans objet

   * filtres : aucun
   * relations : aucune
   
## Table : `lt_euep_cc_pat`

Sans objet

   * filtres : aucun
   * relations : aucune

## Table : `lt_euep_doc`

Sans objet

   * filtres : aucun
   * relations : aucune
   
## Table : `lt_euep_sup`

Sans objet

   * filtres : aucun
   * relations : aucune
   
## Table : `lt_euep_cc_eval`

Sans objet

   * filtres : aucun
   * relations : aucune
   
## Table : `lt_euep_cc_typebati`

Sans objet

   * filtres : aucun
   * relations : aucune
   
## Table : `lt_euep_cc_ordre`

Sans objet

   * filtres : aucun
   * relations : aucune
   
## Médias : `Assainissement - Contrôle de conformité`

|Source| Taille | Connexion |Lien de connexion|Média|Miniature|Type de media|Nom du média|Fichier origine|
|:---|:---:|:---:|:---|:---|:---|:---|:---|:---|
|an_euep_cc_media|900x900 et 60x60|Assainissement - Contrôle de conformité|/home/DOC_SIG_FIC/metiers/ress/ac/doc/|media|miniature|t_fichier|n_fichier||
   
# Les fonctionnalités

Sont présentées ici uniquement les fonctionnalités spécifiques à l'application.

## Recherche : `Recherche par adresse (AC)`

Cette recherche permet à l'utilisateur de faire une recherche d'adresse guidée par sélection de la commune, de la voie puis du n° sur la voie. L'utilisateur accède à la fiche de synthèse des contrôles à cette adresse et peut ensuite accéder au dossier de conformité.

  * Configuration :

Source : `xapps_geo_v_euep_cc`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Adresse|x|||||
|affiche_controle|x|||||
|affiche_blanc|x|||||
|affiche_result|x|||||
|geom||||x||
(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|EUEP - C de C - Commune|x|commune|est égale à une valeur de liste de choix|Liste de domaine (EUEP - C de C - Commune)|commune|commune|commune|||
|EUEP - C de C - Libellé voie|x|libvoie_c|est égale à une valeur de liste de choix|Liste de domaine (EUEP - C de C - Libellé de la voie)|affiche_result_adresse|libvoie_c|mot_dir|||
|EUEP - C de C - Numéro voirie|x|numero_complet|est égale à une valeur de liste de choix|Liste de domaine (EUEP - C de C - Numéro de voirie|numero_complet|numero_complet|numero|||

(1) si liste de domaine

 * Fiches d'information active : Dossier de conformité AC

## Recherche : `Recherche par N° de dossier (AC)`

Cette recherche permet à l'utilisateur de faire une recherche de contrôle par son n° de dossier. Il accède ensuite à la fiche d'information contenant le dossier de conformité.

  * Configuration :
  
Source : `an_v_euep_cc`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|affiche_tri|x|||||
|affiche_adresse_gras|x|||||
|affiche_dossier|x|||||
|geom||||x||
(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|sans objet|||

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|EUEP - C de C - Dossier|x|nidcc|est égale à une valeur suggérée d'une liste de domaine (Dossier AC)|nidcc|nidcc|nidcc|||

(1) si liste de domaine

 * Fiches d'information active : Dossier de conformité AC

## Recherche : `Liste des contrôles NON CONFORME`

Cette recherche permet à l'utilisateur de faire une recherche sur les contrôles de conformité non conforme et d'éditer les courriers.

  * Configuration :
  
Source : `xapps_an_euep_cc_nc`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|affiche_conformite|x|||||
|Adresse|x|||||
|geom||||x||
(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Edition par période|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|Contrôle Non Conformet par date||affiche_annee_cc|est égale à une valeur de liste de choix (Année du contrôle de Conformité AC non conforme)|affiche_annee_cc|affiche_annee_cc|affiche_annee_cc|||
|Mois du contrôle de conformité AC||affiche_mois_cc|est égale à une valeur de liste de choix (Mois du contrôle AC)|affiche_mois_cc|affiche_mois_cc|affiche_mois_cc|||

(1) si liste de domaine

 * Fiches d'information active : Conformité NON CONFORME - Courrier
 
## Recherche : `Recherche des contrôles depuis le`

Cette recherche permet à l'utilisateur de faire une recherche sur les contrôles de conformité à partir d'une certaine date.

  * Configuration :
  
Source : `an_v_euep_cc`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|affiche_tri|x|||||
|affiche_adresse_gras|x|||||
|affiche_dossier|x|||||
|geom||||x||
(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|sans objet|||

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|Date du contrôle|x|ccdate|est supérieure ou égale à une valeur saisie|||||Ce champ étant un  champ date, l'utilisateur dispose d'un calendrier pour la saisie de la date|

(1) si liste de domaine

 * Fiches d'information active : Dossier de conformité AC
 
## Recherche : `Informations sur le prestataire`

Cette recherche permet à l'utilisateur de faire une recherche sur un prestataire et d'accéder à ces informations de contact.

  * Configuration :
  
Source : `lt_euep_cc_certificateur`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|affiche_resultat|x|||||
|Nom de l'entreprise|x|||||
(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|SECU|||||||||Filtre activé au chargement (détaillé au niveau de la table plus haut)|
|Prestataire|x|valeur (Nom de l'entreprise)|Prédéfinis à une liste de choix|||||||

(1) si liste de domaine

 * Fiches d'information active : Informations des prestataires (AC)
 
 ## Recherche : `Contrôle de conformité AC`

Cette recherche permet à l'utilisateur d'accéder à la synthèse des contrôles de conformité directement en cliquant sur la carte. Cette recherche est placée dans la partie configuration de la carte.

  * Configuration :
  
Source : `xapps_geo_v_euep_cc`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|affiche_adresse|x|||||
|affiche_controle|x|||||
|geom||||x||
(la détection des doublons n'est pas activée ici)

 * Filtres : aucun

 * Fiches d'information active : Informations des prestataires (AC)

## Fiche d'information : `Conformité AC à l'adresse`

Source : `xapps_geo_v_euep_cc`

 * Statistique : aucune
 
 * Représentation :
 
|Mode d'ouverture|Taille|Agencement des sections|
|:---|:---|:---|
|dans le gabarit|750x650|Vertical|

|Nom de la section|Attribut|Position label|Agencement attribut|
|:---|:---|:---|:---|:---|
|(vide)|titre_html|Masqué|Vertical|

# La cartothèque

# L'application

# Particularités

Sans objet
