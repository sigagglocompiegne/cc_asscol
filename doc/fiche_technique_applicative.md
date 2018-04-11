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
|Fiches d'informations Conformité AC à l'adresse|x|x|la liste des contrôles à l'adressse est disponible en lecture et l'insertion d'un nouveau contrôle est possible|
|Fiches d'informations Dossier de conformité AC |x|x|Les contrôles validés sont accessibles en lecture mais ne peuvent plus être modifiés. L'attribut de validation n'est pas éditable|
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

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|affiche_cc |x|||Formate l'affichage de la conformité au lieu de oui/non |*Cartothèque :* champ de catégorisation pour l'affichage du libellé de la conformité ||
|affiche_blanc|x|||Contient le caractère `-` pour affichage dans l'info-bulle de résultat. Ce champ est affiché dans le résulat d'une recherche d'un contrôle pour gérer le fait que GEO affiche dans cette info-bulle les 2 premiers champs intégrés dans le résultat d'une recherche|*Recherche :* Recherche par adresse (AC) |![picto](/img/info_bulle_result_rech_cc.png)|
|affiche_cc |x|||Formate l'affichage de la conformité au lieu de oui/non |*Cartothèque :* champ de catégorisation pour l'affichage du libellé de la conformité ||
|affiche_controle |x|||Formate l'affichage du résultat d'une recherche d'un contrôle en html dans le menu du même nom |*Recherche :* Recherche par adresse (AC), Contrôle de conformité AC |![picto](/img/affiche_menu_result_rech_cc.png)|
|affiche_result  |x|||Formate l'affichage d'un texte précisant à l'utilisateur de cliquer pour zoomer sur l'adresse au résultat d'une recherche d'un contrôle par l'adresse|*Recherche :* Recherche par adresse (AC) |![picto](/img/affiche_menu_result_rech_cc_ad.png)|
|ccdate  ||x|Date du dernier contrôle|Formate la date du dernier en contrôle en dd/mm/yyyy|||
|etiquette_nbcc  |x|||Formate l'affichage du nombre de contrôle à l'adresse `si nb_cc > 0 affichage le nombre sinon rien`|*Cartothèque :* champ d'étiquette (avec Visibilité : 0 au 1/10000è et décalage : 5,8,0,50,50) ||
|nb_cc||x|Nombre de contrôle||||
|numero_complet  |x|||Formate l'affichage du nombre complet de l'adresse `numero + repet` pour le filtre de recherche des contrôles par adresse (partie numéro)|*Recherche :* Recherche par adresse (AC) (filtre EUEP - C de C - Numéro voirie) ||
|rcc||x|Conformité||||
|titre_html  |x|||Formate un tableau en html affichant les informations de synthèse du ou des contrôles à l'adresse|*Fiche d'information :* Conformité AC à l'adresse |![picto](/img/affiche_synt_fi_cc.png)|
|titre_liste_html  |x|||Formate un tableau en html affichant uniquement la ligne du titre du tableau contenant la liste des contrôles déjà effectués à cette adresse |*Fiche d'information :* Conformité AC à l'adresse |![picto](/img/affiche_synt_fi_liste_cc.png)|

   * filtres : aucun
   * relations :

|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
| xapps_an_euep_cc_nc| id_adresse | 0 à n (égal) |
|xapps_an_euep_cc| id_adresse | 0 à n (égal) |
| xapps_v_adresse| id_adresse | 1 (égal) |

## Table : `an_v_euep_cc`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|achetad||x|Adresse de l'acheteur||*Fiche d'information :* Dossier de conformité AC ||
|achetnom||x|Nom de l'acheteur||*Fiche d'information :* Dossier de conformité AC ||
|achetpat ||x|Civilité|Formatage par une liste de domaine ( lt_euep_cc_pat)|*Fiche d'information :* Dossier de conformité AC||
|achetpatp||x|Précision||*Fiche d'information :* Dossier de conformité AC ||
|achetpre||x|Prénom de l'acheteur||*Fiche d'information :* Dossier de conformité AC ||
|adapt||x|Appart n°||*Fiche d'information :* Dossier de conformité AC ||
|adeta||x|Etage||*Fiche d'information :* Dossier de conformité AC ||
|affiche_adresse_gras |x|||Affiche le champ `adresse` en gras dans le résultat d'une recherche | *Recherche* : Recherche des contrôles depuis le,  Recherche par N° de dossier (AC) ||
|affiche_attestation_logo  |x|||Lien http de l'image de l'attestation d'aggrément du prestataire par l'ARC (format image) | *Fiche d'information* : Dossier de conformité AC ||
|affiche_cc_init   |x|x|-|Formate l'affichage de l'acronyme au survol de la souris sur le picto contrôle initial | *Fiche d'information* : Dossier de conformité AC |![picto](/img/affiche_acronyme_ci.png)|
|affiche_cc_valid   |x|x|-|Formate l'affichage de l'acronyme au survol de la souris sur le picto validation | *Fiche d'information* : Dossier de conformité AC |![picto](/img/affiche_acronyme_cv.png)|
|affiche_conclusion    |x|||Formate en html l'en-tête de la partie A/conclusion du rapport de conformité | *Fiche d'information* : Dossier de conformité AC ||
|affiche_controle  |x|x|Conformité|Formate l'affichage des pictos de conformité  | *Fiche d'information* : Conformité AC à l'adresse |![picto](/img/affiche_picto_fi.png)|
|affiche_date_dernier_controle  |x|x|Date du contrôle|Formate l'affichage de la date du contrôle en dd/mm/yyyy dans la liste des contrôles présent à l'adresse | *Fiche d'information* : Conformité AC à l'adresse ||
|affiche_dossier  |x|||Formate en html l'affichage des résultats du contrôle dans le menu du même nom à la recherche d'un contrôle | *Recherche* : Recherche des contrôles depuis le, Recherche par N° de dossier (AC) |![picto](/img/affiche_result_rech_cc_dos.png)|
|affiche_glossaire  |x|||Formate en html l'affichage du glossaire dans l'onglet du même nom  | *Fiche d'information* : Dossier de conformité AC ||
|affiche_logo  |x|||Lien http de l'image du logo de l'ARC  (format image)  | *Fiche d'information* : Dossier de conformité AC ||
|affiche_nidcc |x|x|N° de dossier|Formate le n° de dossier  | *Fiche d'information* : Dossier de conformité AC ||
|affiche_reg |x|x|(null)|Formate en html la partie règlementaire présente dans l'onglet Objet de la mission du dossier de conformité   | *Fiche d'information* : Dossier de conformité AC ||
|affiche_tri |x|||Formate en html le n° d'ordre des contrôles et affiché dans les résultats d'une recherche | *Recherche* : Recherche des contrôles depuis le, Recherche par N° de dossier (AC) |![picto](/img/affiche_tri.png)|
|affiche_validite |x|||Formate la partie sur la durée du contrôle dans l'onglet A/Conclusion du contrôle du dossier de conformité | *Fiche d'information* : Dossier de conformité AC ||
|batiaut||x|Précisez||*Fiche d'information :* Dossier de conformité AC ||
|batitype||x|Type de bâtiment|Formatage par une liste de domaine (lt_euep_cc_typebati)|*Fiche d'information* : Dossier de conformité AC||
|ccbien||x|Type de bien|Formatage par une liste de domaine (lt_euep_cc_bien)|*Fiche d'information* : Dossier de conformité AC||
|ccdate||x|Mission réalisée le|Formatage de la date en dd-mm-yyyy|*Fiche d'information* : Dossier de conformité AC||
|ccdated||x|Certificat de conformité délivré le|Formatage de la date en dd-mm-yyyy|*Fiche d'information* : Dossier de conformité AC||
|ccinit||x|Contrôle initial|Formatage du booléen Vrai = oui et Faux = non|*Fiche d'information* : Dossier de conformité AC||
|ccvalid||x|Etat de validation|Formatage du booléen Vrai = Contrôle validé et Faux = Contrôle non validé|*Fiche d'information* : Dossier de conformité AC||
|certi_assur ||x|Compagnie d'assurance||*Fiche d'information* : Dossier de conformité AC||
|certi_dassur ||x|Date de validité|Formatage de la date en dd-mm-yyyy|*Fiche d'information* : Dossier de conformité AC||
|certi_email ||x|Email||*Fiche d'information* : Dossier de conformité AC||
|certi_numassur ||x|N° de police||*Fiche d'information* : Dossier de conformité AC||
|certi_siret ||x|N° SIRET||*Fiche d'information* : Dossier de conformité AC||
|certi_tel ||x|Téléphone||*Fiche d'information* : Dossier de conformité AC||
|certnom ||x|Nom||*Fiche d'information* : Dossier de conformité AC||
|certpre ||x|Prénom||*Fiche d'information* : Dossier de conformité AC||
|certtype||x|Nom de l'entreprise|Formatage par une liste de domaine (lt_euep_cc_certificateur)|*Fiche d'information* : Dossier de conformité AC||
|date_maj||x||Formatage de la date en dd-mm-yyyy|||
|date_sai||x||Formatage de la date en dd-mm-yyyy|||
|doad ||x|Adresse||*Fiche d'information* : Dossier de conformité AC||
|doaut ||x|Précisez||*Fiche d'information* : Dossier de conformité AC||
|donom ||x|Nom||*Fiche d'information* : Dossier de conformité AC||
|dopre ||x|Prénom||*Fiche d'information* : Dossier de conformité AC||
|dotype||x|Qualité|Formatage par une liste de domaine (lt_euep_cc_ordre)|*Fiche d'information* : Dossier de conformité AC||
|epaut ||x|Alimentation autre que le réseau public d'eau potable||*Fiche d'information* : Dossier de conformité AC||
|epautre ||x|Autres||*Fiche d'information* : Dossier de conformité AC||
|epdiagpc||x|Diagnostic réalisé sur les parties communes|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|epecoul||x|L'écoulement se fait-il correctement ?|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|epecoulobs||x|Observations||*Fiche d'information* : Dossier de conformité AC||
|epfum||x|Test à la fumée réalisé ?|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|epobserv||x|Observations||*Fiche d'information* : Dossier de conformité AC||
|eppar||x|Les EP sont-elles traitées à la parcelle|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|epparpre||x|Précisez||*Fiche d'information* : Dossier de conformité AC||
|eppublic||x|L'habitation est desservie par un réseau public d'eau potable|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|epracdp||x|Existe-t-il un raccordement au réseau public d'évacuation des EP ?|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|epracpc||x|Le raccordement se fait sur les parties communes  (appartement en collectivité)|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|eprecup||x|Système de récupération des eaux pluviales|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|eprecupcpt||x|En cas d'utilisation des eaux pluviales récupérées à usage domestique, présence impérative d'un compteur|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|epregarcol||x|Existe-t-il un regard de collecte ?|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|epregarext||x|Le regard est à l'extérieur de l'habitation ?|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|euanomal||x|Anomalies constatées|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|eubrsch||x|Le branchement est-il sous le niveau de la chaussée ?|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|eudivers||x|Divers||*Fiche d'information* : Dossier de conformité AC||
|euecoul||x|L'écoulement se fait-il correctement ?|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|euepanomal||x|Anomalies identifiées||*Fiche d'information* : Dossier de conformité AC||
|euepdivers||x|Constatations diverses||*Fiche d'information* : Dossier de conformité AC||
|euepsep||x|Les EP et les EP sont-elles collectées séparément ?|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|euevent||x|Présence d'un évent ?|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|eufluo||x|Test à la fluorescéine réalisé sur tous les points d'eau ?|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|euobserv||x|Précisez||*Fiche d'information* : Dossier de conformité AC||
|eupc||x|Le raccordement se fait sur les parties communes (appartement individuel)|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|eurefl||x|Le branchement est-il protégé par un dispositif anti reflux ?|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|euregar||x|Existe-t-il un regard de collecte ?|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|euregardp||x|Le regard est-il accessible en domaine privé ?|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|eusiphon||x|Présence de siphons sur chaque évacuation contrôlée ?|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|eusup||x|Existence d'une servitude avec uen autre propriété concernant les EP ou les EU ?|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|eusupdoc||x|Présence de documents attestant de cette servitude ?|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|eusuptype||x|Précisez|Formatage par une liste de domaine (lt_euep_sup)|*Fiche d'information* : Dossier de conformité AC||
|nidcc||x|N° de dossier suivi||*Fiche d'information* : Dossier de conformité AC||
|ordre_cc||x|Il y a||*Fiche d'information* : Conformité AC à l'adresse||
|proprioad||x|Adresse||*Fiche d'information* : Dossier de conformité AC||
|proprionom||x|Nom||*Fiche d'information* : Dossier de conformité AC||
|propriopat||x|Civilité|Formatage par une liste de domaine (lt_euep_cc_pat)|*Fiche d'information* : Dossier de conformité AC||
|propriopatp||x|Précision||*Fiche d'information* : Dossier de conformité AC||
|propriopre||x|Prénom||*Fiche d'information* : Dossier de conformité AC||
|rcc||x|L'INSTALLATION EST|Formatage par une liste de domaine (Conforme - Non conforme)|*Fiche d'information* : Dossier de conformité AC||
|rrebrtype||x|Boîte de raccordement ?|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|rrechype||x|Le raccordement est-il accessible depuis un regard sous la chaussée ?|Formatage par une liste de domaine (lt_euep_cc_eval)|*Fiche d'information* : Dossier de conformité AC||
|rredptype||x|Réseau|Formatage par une liste de domaine (lt_euep_cc_typeres)|*Fiche d'information* : Dossier de conformité AC||
|titre_fiche_affiche|x|||Formate en html le titre du dossier de conformité (1er onglet non nommé du dossier) |*Fiche d'information* : Dossier de conformité AC||
|tnidcc||x|Type de contrôle|Formatage par une liste de domaine (lt_euep_cc_tnidcc)|*Fiche d'information* : Dossier de conformité AC||
  
   * filtres : aucun
   * relations :

|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
|lt_euep_cc_certificateur| certtype - code | 1 (égal) |
|xapps_geo_v_euep_cc| id_adresse | 0 à n (égal) |
|an_euep_cc_media| idcc - id | 0 à n (égal) |

## Table : `an_euep_cc_media`

|Attributs| Champ calculé | Formatage|Renommage |Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---:---|:---|:---|
|affiche_lien |x|||Formate le lien de téléchargement des documents joints |*Fiche d'information* : Dossier de conformité AC||
|date_sai||x||Formatage de la date en dd-mm-yyyy|||
|l_type||x||Formatage par une liste de domaine (lt_euep_doc)|||
|media||x||Formatage du document joint en type image|||
|miniature||x||Formatage de l'aperçu du document joint en type image|||
   
   * filtres : aucun
   * relations : aucune
   
## Table : `xapps_an_euep_cc_nc`

|Attributs| Champ calculé | Formatage |Renommage  |Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|affiche_annee_cc|x|||Formate la date du contrôle en yyyy pour sélection de l'année dans les recherches des contrôles non conforme|*Filtre* : Contrôle Non Conformet par date, Contrôle Non Conformet par année (*Recherche* : Liste des contrôles NON CONFORME)||
|affiche_conformite|x|||Formatage en html l'affichage du résultat dans le menu du même nom pour la recherche d'un contrôle non conforme|*Recherche* : Liste des contrôles NON CONFORME|![picto](/img/affiche_menu_result_rech_ccnc.png)|
|affiche_espace_objet|x|||Formatage en html d'un espace avant l'objet du courrier|*Fiche d'information* : Conformité NON CONFORME - Courrier||
|affiche_espace_signature|x|||Formatage en html d'un espace avant la partie signature du courrier|*Fiche d'information* : Conformité NON CONFORME - Courrier||
|affiche_espace_tete|x|||Formatage en html d'un espace avant l'en-tête du courrier|*Fiche d'information* : Conformité NON CONFORME - Courrier||
|affiche_espace_tete|x|||Formate le mois du contrôle en français pour sélection du mois dans les recherches des contrôles non conforme|*Filtre* : Mois du contrôle de conformité AC (*Recherche* : Liste des contrôles NON CONFORME)||
|affiche_objet|x|||Formate en html la partie écrite Objet du courrier|*Fiche d'information* : Conformité NON CONFORME - Courrier||
|affiche_proprio|x|||Formate en html la partie coordonnée (ici propriétaire) du courrier|*Fiche d'information* : Conformité NON CONFORME - Courrier||
|affiche_signature|x|||Formate en html la partie signature du courrier|*Fiche d'information* : Conformité NON CONFORME - Courrier||
|affiche_texte_courrier|x|||Formate en html le corps du courrier|*Fiche d'information* : Conformité NON CONFORME - Courrier||
|ccdate||x||Formatage de la date en dd-mm-yyyy|||
|ccdated||x||Formatage de la date en dd-mm-yyyy|||

   * filtres : aucun
   * relations : 
   
|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
|xapps_geo_v_euep_cc| id_adresse | 1 (égal) |
|xapps_an_euep_cc| idcc | 1 (égal) |

## Table : `lt_euep_cc_certificateur`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|affiche_resultat|x|||Formate le titre de résultat pour la recherche des informations d'un prestataire |*Recherche* : Informations sur le prestataire|![picto](/img/affiche_menu_rech_presta.png)|
|date_assur||x||Formatage de la date en dd-mm-yyyy|||
|etat||x||Formate l'affichage du booléen en Oui ou Non|||
|exist||x||Formate l'affichage du booléen en Oui ou Non|||

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

|Nom de la section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|(vide)|titre_html|Masqué|Vertical||||
|(vide)|titre_liste_html|Masqué|Vertical||||
|(vide)|il y a, N° de dossier, Date du contrôle, Appart n°, Etage,affiche_cc_valid, affiche_cc_init, Conformité|Masqué|Vertical||Dossier de conformité AC|x|

 * Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

|Attribut|Obligatoire|Valeur par défaut|Liste de domaine|Représentation|
|:---|:---|:---|:---|:---|
|id_adresse|||||

**IMPORTANT** : L'édition des données jointes est activée ainsi que le champ de relation Adresse pour récupérer l'identifiant Adresse au niveau des dossiers qui sont saisies.
 
 * Modèle d'impression : aucun
 
 ## Fiche d'information : `Dossier de conformité AC`

Source : `an_v_euep_cc`

 * Statistique : aucune
 
 * Représentation :
 
|Mode d'ouverture|Taille|Agencement des sections|
|:---|:---|:---|
|dans le gabarit|1150x700|Onglets|

|Nom de la section|Sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|:---|
|(vide)||titre_fiche_affiche|Masqué|Vertical||||
|Objet de la mission||affiche_logo, affiche_reg|Masqué|Vertical||||
|(vide)||tnidcc|A gauche|Vertical||||
||(vide)|nidcc|Par défaut|Vertical|tnidcc=='20'|||
||(vide)|ccbien, ccinit, ccvalid|Par défaut|Vertical||||
|A/Conclusion du contrôle||affiche_conclusion|Masqué|Vertical||||
||(vide)|rcc, ccdate|A gauche|Vertical||||
||(vide)|affiche_valide|Masqué|Vertical||||
|B/Identitié de l'opérateur du diagnostic||certnom, certpre, certtype, certi_adresse, certi_tel, certi_email, certi_siret, certi_assur, certi_numassur, certi_dassur|Par défaut|Vertical||||
|C/Désignation du donneur d'ordre||||Vertical||||
||Propriétaire|propriopat|Par défaut|Vertical||||
||(vide) sous-onglet de propriétaire|propriopatp|Par défaut|Vertical|propriopat=='40'|||
||(vide) sous-onglet de propriétaire|proprionom, propriopre, proprioad|Par défaut|Vertical||||
||Donneur d'ordre|dotype|Par défaut|Vertical||||
||(vide) sous-onglet de Donneur d'ordre|doaut, donom, dopre, doas|Par défaut|Vertical|dotype=='99'|||
||Acheteur|achetpat|Par défaut|Vertical||||
||(vide) sous-onglet de Acheteur|achetpatp|Par défaut|Vertical|achetpat=='40'|||
||(vide) sous-onglet de Acheteur|achetnom, achetpre, achetad|Par défaut|Vertical||||
|D/Désignation du ou des bâtiments||||Vertical||||
||Type de bâtiment|commune, adresse, adapt, adeta, batitype|Par défaut|Vertical||||
||(vide) sous-onglet de Type de bâtiment|batiaut|Par défaut|Vertical|batitype=='99'|||
||Desserte par le réseau public d'eau potable|eppublic|Par défaut|Vertical||||
||(vide) sous-onglet de Desserte par le réseau public d'eau potable|epaut|Par défaut|Vertical|eppublic=='20'|||
|E/Nature des installations (domaine publique)|rredptype, rebrtype|||Vertical||||
||(vide)|rrechype|Par défaut|Vertical|rrebrtype=='20'|||
|F/Etat des installations (domaine privé)||||||||
||Collecte des eaux usées (EU)|||Vertical (ici pour la sous-section)||||
||(vide) sous-onglet de Collecte des eaux usées (EU)|eupc, euevent, euregar , euregardp|Par défaut|Vertical||||
||(vide) sous-onglet de Collecte des eaux usées (EU)|eusup|Par défaut|Vertical||||
||(vide) sous-onglet de (vide) précédent|eusuptype, eusupdoc|Par défaut|Vertical|eusup=='10'|||
||(vide) sous-onglet de Collecte des eaux usées (EU)|euecoul, eufluo, eubrsch, eurefl, eusiphon, euepsep, eudivers|Par défaut|Vertical||||
||Observations sous-onglet de Collecte des eaux usées (EU)|euanomal|Par défaut|Vertical||||
||(vide) sous-onglet de Observations|euobserv|Par défaut|Vertical|euanomal=='10'|||
||Collecte des eaux pluviales (EP)|||Vertical (ici pour la sous-section)||||
||(vide) sous-onglet de Collecte des eaux pluviales (EP)|epdiagpc, epracpc, epregardcol, epregarext, epracdp, eppar|Par défaut|Vertical||||
||(vide) sous-onglet de (vide)|epparpre|Par défaut|Vertical|eppar=='10'|||
||(vide) sous-onglet de (vide)|epfum, epecoul, epecoulobs, eprecup|Par défaut|Vertical||||
||(vide) sous-onglet de (vide)|eprecupcpt|Par défaut|Vertical|eprecup=='10'|||
||(vide) sous-onglet de (vide)|epautre, epobserv|Masqué|Vertical||||
|G/Anomalies identifiées|euepanomal|||Vertical||||
|H/Constations diverses||||Vertical (ici pour la sous-section)||||
||Anomalies repérées n'entraînant pas une non-conformité sous-onglet de Constations diverses|euepdivers|Masqué|Vertical||||
||(vide) sous-onglet de Constations diverses|ccdated |Par défaut|Vertical||||
||Attestation d'agrément sous-onglet de Constations diverses|affiche_attestation_logo |Masqué|Vertical||||
|I/Pièces jointes||miniature, l_type, l_prec, affiche_lien|Par défaut|Vertical||Média-Assainissement Contrôle de conformité||
||Aperçu sous-onglet de I/Pièces jointes|l_test(champ toujours en test) |Masqué|Vertical||||
|Glossaire||affiche_glossaire|Masqué|Vertical||||

 * Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

|Attribut|Obligatoire|Valeur par défaut|Liste de domaine|Représentation|
|:---|:---|:---|:---|:---|
|adapt|||||
|adeta|||||
|nidcc|||||
|rcc|x||Conforme - Non Conforme|Bourons radios|
|ccdate|x||||
|ccdated|x||||
|certype|x||lt_euep_cc_certificateur|Liste de choix|
|certnom|x||||
|certpre|x||||
|proprionom|x||||
|propriopre|x||||
|proprioad|x|||Champ de texte à une ligne|
|dotype|x||lt_euep_cc_ordre||
|doaut|||||
|donom|||||
|dopre|||||
|doad|||||
|batitype|x||lt_euep_cc_typebati||
|batiaut|||||
|eppublic|x||lt_euep_cc_eval||
|epaut||||Champ texte à plusieurs lignes|
|rredptype|x||lt_euep_cc_typeres||
|rrebrtype|x||lt_euep_cc_ceval||
|rrechype ||00|lt_euep_cc_eval||
|eupc |x||lt_euep_cc_eval||
|euevent |x||lt_euep_cc_eval||
|euregar |x||lt_euep_cc_eval||
|euregardp |x||lt_euep_cc_eval||
|eusup |x||lt_euep_cc_eval||
|eusuptype ||00|lt_euep_sup||
|eusupdoc ||00|lt_euep_cc_eval||
|euecoul |x||lt_euep_cc_eval||
|eufluo |x||lt_euep_cc_eval||
|eubrsch |x||lt_euep_cc_eval||
|eurefl |x||lt_euep_cc_eval||
|euepsep |x||lt_euep_cc_eval||
|eudivers ||||Champ texte à plusieurs lignes|
|euanomal |x||lt_euep_cc_eval||
|euobserv ||||Champ texte à plusieurs lignes|
|eusiphon |x||lt_euep_cc_eval||
|epdiagpc |x||lt_euep_cc_eval||
|epracpc |x||lt_euep_cc_eval||
|epregarext |x||lt_euep_cc_eval||
|epracdp |x||lt_euep_cc_eval||
|eppar |x||lt_euep_cc_eval||
|epparpre ||||Champ texte à plusieurs lignes|
|epfum |x||lt_euep_cc_eval||
|epecoul |x||lt_euep_cc_eval||
|epecoulobs ||||Champ texte à plusieurs lignes|
|eprecup  |x||lt_euep_cc_eval||
|eprecupcpt   ||00|lt_euep_cc_eval||
|epautre  ||||Champ texte à plusieurs lignes|
|epobserv  ||||Champ texte à plusieurs lignes|
|euepanomal  ||||Champ texte à plusieurs lignes|
|euepdivers  ||||Champ texte à plusieurs lignes|
|ccbien  |x|20|lt_eupe_cc_bien|Boutons radios|
|propriopat  |x||lt_euep_cc_pat||
|propriopatp  |||||
|achetpat  ||00|lt_euep_cc_pat||
|achetpatp  |||||
|achetnom  |||||
|achetpre  |||||
|achetad  |||||
|ccvalid  |x|false||Boutons radios|
|op_sai  ||%USER_LOGIN%|||
|tnidcc  |x||lt_euep_cc_tnidcc|Boutons radios|


**IMPORTANT** : L'édition des données jointes est désactivée.
 
 * Modèle d'impression : Fiche standard
 
## Fiche d'information : `Conformité NON CONFORME - Courrier`

Source : `xapps_an_euep_cc_nc`

 * Statistique : aucune
 
 * Représentation :
 
|Mode d'ouverture|Taille|Agencement des sections|
|:---|:---|:---|
|dans le gabarit|700x650|Vertical|

|Nom de la section|Sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|:---|
|(vide)||affiche_espace_tete|Masqué|Vertical||||
|(vide)||affiche_proprio|Masqué|Vertical||||
|(vide)||affiche_espace_objet|Masqué|Vertical||||
|(vide)||affiche_objet|Masqué|Vertical||||
|(vide)||affiche_texte_courrier, affiche_espace_signature, affiche_signature|Masqué|Vertical||||

 * Saisie : sans objet
 
 * Modèle d'impression : Courrier Contrôle de Conformité AC 
 
**IMPORTANT** : un modèle spécifique a été créé pour gérer l'en-tête et le pied de page du courrier. Ce modèle est stocké ici en code R:\Projets\Metiers\1702RESH-ARC-ASS_controle_conformite_AC\4-Traitement\Courrier Controle de Conformite AC.html et a été injecté dans GEO. Le code peut-être modifié directement dans GEO via l'édition d'un  modèle.

## Fiche d'information : `Média - Assainissement Contrôle de conformité`

Note : cette fiche n'est pas censé s'ouvrir dans GEO comme une fiche standard mais via le module de gestion d'un média

Source : `an_euep_cc_media`

 * Statistique : aucune
 
 * Représentation :
 
|Mode d'ouverture|Taille|Agencement des sections|
|:---|:---|:---|
|dans le gabarit|530x650||

|Nom de la section|Sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|:---|
|(vide)||Operateur de saisie, intégré le, Type de document, Précision|Par défaut|Vertical||||


* Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

Note : seuls les attributs obligatoires sont visibles par l'utilisateur. Les autres attributs sont rendus éditables par le fonctionnement du module média qui enregistre par lui-même les valeurs dans la table. 

|Attribut|Obligatoire|Valeur par défaut|Liste de domaine|Représentation|
|:---|:---|:---|:---|:---|
|id|||||
|media|||||
|miniature|||||
|n_fichier|||||
|t_fichier|||||
|op_sai|x|%USER_LOGIN%|||
|date_sai|x|%CURRENT_DATE%|||
|l_type|x|00|lt_euep_doc||
|l_prec|||||
|gid|||||

**IMPORTANT** : L'édition des données jointes est désactivée.
 
 * Modèle d'impression : aucun

## Analyse :

Aucune

## Statistique :

Aucune

## Modification :

Aucune

# La cartothèque

## Carte : `Contrôle de conformité Assainissement collectif`

|Groupe|Sous-groupe|Visible dans la légende|Visible au démarrage|Détails visibles|Déplié par défaut|Geotable|Renommée|Issue d'une autre carte|Visible dans la légende|Visible au démarrage|Couche sélectionnable|Couche accrochable|Catégorisation|Seuil de visibilité|Symbologie|
|:---|:---|:-:|:-:|:-:|:-:|:---|:---|:-:|:-:|:-:|:-:|:---|:---|:---|:---|
|Limite administrative||x|x|x||geo_v_osm_commune_arcba|Limite communale|x|x|x|||||Contour noir 1.5|


# L'application

# Particularités

Sans objet
