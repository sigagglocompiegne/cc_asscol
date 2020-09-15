![picto](img/Logo_web-GeoCompiegnois.png)

# Documentation d'administration de l'application #

* Statut
  - [ ] à rédiger
  - [ ] en cours de rédaction
  - [ ] relecture
  - [x] finaliser
  - [ ] révision

# Généralité

|Représentation| Nom de l'application |Résumé|
|:---|:---|:---|
|![picto](/doc/img/picto_cc_asscol.png)|Conformité Assainissement|Cette application est dédiée à la saisie et au suivi des contrôles de conformité pour l'Assainissement collectif. La saisie des contrôles est effectuée directement par les prestataires agréés sur cette application, et le service assainissement de l'Agglomération peut valider en ligne ces contrôles et gérer les relances aux différents propriétaires concernés par un contrôle non conforme. Cette application permet également de faire des recherches et d'éditer des courriers.|

# Accès

|Public|Métier|Accès restreint|
|:-:|:-:|:---|
||X|Accès réservé aux prestataires agréés et aux personnes du service assainissement. Des profils de connexions spécifiques ont été créés pour les prestataires dans le LDAP externe|

# Droit par profil de connexion

* **Prestataires**

|Fonctionnalités|Lecture|Ecriture|Précisions|
|:---|:-:|:-:|:---|
|Recherche par adresse(AC)|x|||
|Recherche d'un dossier par N°(AC)|x||La connexion filtre l'affichage des dossiers sur le profil du prestataire.|
|Recherche des contrôles par prestataire|x||Accès réservé au service assainissement|
|Recherche avancée d'une voie|x|||
|Liste des contrôles non conforme|x||Accès réservé au service assainissement|
|Recherche des contrôles depuis le|x||Accès réservé au service assainissement|
|Recherche des contrôles avec une demande de modifications|||Accès réservé au service assainissement|
|Information sur le prestataire|x||La connexion filtre l'affichage des informations sur le profil du prestataire.|
|Cartographie|x|||
|Fiches d'informations Conformité AC à l'adresse|x|x|la liste des contrôles à l'adressse est disponible en lecture et l'insertion d'un nouveau contrôle est possible. La connexion filtre l'affichage des positions sur le profil du prestataire.|
|Fiches d'informations Dossier de conformité AC |x|x|Les contrôles validés sont accessibles en lecture mais ne peuvent plus être modifiés. L'attribut de validation n'est pas éditable. La connexion filtre l'affichage des dossiers sur le profil du prestataire.|
|Fiches d'informations du prestataire|x|x|La connexion filtre l'affichage des informations sur le profil du prestataire. Le prestataire peut modifier ses données ainsi que le service assainissement|


* **Personnes du service métier**

|Fonctionnalités|Lecture|Ecriture|Précisions|
|:---|:-:|:-:|:---|
|Toutes|x|x|Les contrôles validés sont accessibles en lecture. L'accès à la suppression et à la dévalidation est possible depuis le 13 janvier 2020 (un attribut de contexte "cc_valid" a été créé portant les valeurs supplémentaires 40 et 50 pour les utilisateurs concernés)|

* **Autres profils ou particularités**

|Fonctionnalités|Lecture|Ecriture|Précisions|
|:---|:-:|:-:|:---|
|Prestataires|x|x|Peut saisir et modifier uniquement ses dossiers (tant qu'ils ne sont pas validés) et modifier ses coordonnées)|
|Autres personnes du service Environnement|x||Accès en consultation sur une partie de l'application|
|Service SIG|x|x|Pour la table et la liste de domaine lt_euep_cc_valid, un attribut de contexte a été créé (cc_valid) pour gérer les droits d'accès aux valeurs et permet la restriction d'affichage. Chaque prestataire et utilisateur se voit attribuer les valeurs 10,20,30 pour cet attribut. Les valeurs 40 et 50 sont restreintes au service assainissement.|

# Les données

Sont décrites ici les Géotables et/ou Tables intégrées dans GEO pour les besoins de l'application. Les autres données servant d'habillage (pour la cartographie ou les recherches) sont listées dans les autres parties ci-après. Le tableau ci-dessous présente uniquement les changements (type de champ, formatage du résultat, ...) ou les ajouts (champs calculés, filtre, ...) non présents dans la donnée source. 

## Géotable : `xapps_geo_v_euep_cc`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|affiche_anomalie  |x|||Formate l'affichage de la liste des anomalies présent dans le courrier d'envoi | ||
|affiche_anomaliepre  |x|||Formate l'affichage des précisions sur les anomalies si saisie | ||
|affiche_cc |x|||Formate l'affichage de la conformité au lieu de oui/non |*Cartothèque :* champ de catégorisation pour l'affichage du libellé de la conformité ||
|affiche_blanc|x|||Contient le caractère `-` pour affichage dans l'info-bulle de résultat. Ce champ est affiché dans le résulat d'une recherche d'un contrôle pour gérer le fait que GEO affiche dans cette info-bulle les 2 premiers champs intégrés dans le résultat d'une recherche|*Recherche :* Recherche par adresse (AC) |![picto](/doc/img/info_bulle_result_rech_cc.png)|
|affiche_cc |x|||Formate l'affichage de la conformité au lieu de oui/non |*Cartothèque :* champ de catégorisation pour l'affichage du libellé de la conformité ||
|affiche_controle |x|||Formate l'affichage du résultat d'une recherche d'un contrôle en html dans le menu du même nom |*Recherche :* Recherche par adresse (AC), Contrôle de conformité AC |![picto](/doc/img/affiche_menu_result_rech_cc.png)|
|affiche_result  |x|||Formate l'affichage d'un texte précisant à l'utilisateur de cliquer pour zoomer sur l'adresse au résultat d'une recherche d'un contrôle par l'adresse|*Recherche :* Recherche par adresse (AC) |![picto](/doc/img/affiche_menu_result_rech_cc_ad.png)|
|ccdate  ||x|Date du dernier contrôle|Formate la date du dernier en contrôle en dd/mm/yyyy|||
|certtype  ||x|Code du ou des prestataires|Champ de filtre à la connexion pour l'affichage des pictos à l'adresse selon le prestataire|||
|etiquette_nbcc  |x|||Formate l'affichage du nombre de contrôle à l'adresse `si nb_cc > 0 affichage le nombre sinon rien`|*Cartothèque :* champ d'étiquette (avec Visibilité : 0 au 1/10000è et décalage : 5,8,0,50,50) ||
|nb_cc||x|Nombre de contrôle||||
|numero_complet  |x|||Formate l'affichage du nombre complet de l'adresse `numero + repet` pour le filtre de recherche des contrôles par adresse (partie numéro)|*Recherche :* Recherche par adresse (AC) (filtre EUEP - C de C - Numéro voirie) ||
|rcc||x|Conformité||||
|titre_html  |x|||Formate un tableau en html affichant les informations de synthèse du ou des contrôles à l'adresse|*Fiche d'information :* Conformité AC à l'adresse |![picto](/doc/img/affiche_synt_fi_cc.png)|
|titre_liste_html  |x|||Formate un tableau en html affichant uniquement la ligne du titre du tableau contenant la liste des contrôles déjà effectués à cette adresse |*Fiche d'information :* Conformité AC à l'adresse |![picto](/doc/img/affiche_synt_fi_liste_cc.png)|

   * filtres : sur le champ certtype, est similaire à , id_presta
   * relations :

|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
| xapps_an_euep_cc_nc| id_adresse | 0 à n (égal) |
|xapps_an_euep_cc| id_adresse | 0 à n (égal) |
| xapps_v_adresse| id_adresse | 1 (égal) |

   * Particularité : ATTENTION, l'ajout d'une anomalie doit être corrélée avec la modification du champ calculé `affiche_anomalie` pour intégrer le cas dans le courrier

## Table : `an_euep_cc`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|achetad||x|Adresse de l'acheteur||*Fiche d'information :* Dossier de conformité AC ||
|achetnom||x|Nom de l'acheteur||*Fiche d'information :* Dossier de conformité AC ||
|achetpat ||x|Civilité|Formatage par une liste de domaine ( lt_euep_cc_pat)|*Fiche d'information :* Dossier de conformité AC||
|achetpatp||x|Précision||*Fiche d'information :* Dossier de conformité AC ||
|achetpre||x|Prénom de l'acheteur||*Fiche d'information :* Dossier de conformité AC ||
|adapt||x|Appart n°||*Fiche d'information :* Dossier de conformité AC ||
|adeta||x|Etage||*Fiche d'information :* Dossier de conformité AC ||
|affiche_attestation_formation  |x|||Lien http de l'image de l'attestation d'aggrément du prestataire par l'ARC (format image) | *Fiche d'information* : Dossier de conformité AC ||
|affiche_attestation_logo  |x|||Lien http de l'image de l'attestation d'aggrément du prestataire par l'ARC (format image) | *Fiche d'information* : Dossier de conformité AC ||
|affiche_cc_init   |x|x|-|Formate l'affichage de l'acronyme au survol de la souris sur le picto contrôle initial | *Fiche d'information* : Dossier de conformité AC |![picto](/doc/img/affiche_acronyme_ci.png)|
|affiche_cc_valid   |x|x|-|Formate l'affichage de l'acronyme au survol de la souris sur le picto validation | *Fiche d'information* : Dossier de conformité AC |![picto](/doc/img/affiche_acronyme_cv.png)|
|affiche_conclusion    |x|||Formate en html l'en-tête de la partie A/conclusion du rapport de conformité | *Fiche d'information* : Dossier de conformité AC ||
|affiche_controle  |x|x|Conformité|Formate l'affichage des pictos de conformité  | *Fiche d'information* : Conformité AC à l'adresse |![picto](/doc/img/affiche_picto_fi.png)|
|affiche_date_controle  |x|x|Date du contrôle|Formate l'affichage de la date du contrôle en dd/mm/yyyy dans la liste des contrôles présent à l'adresse | *Fiche d'information* : Conformité AC à l'adresse ||
|affiche_dossier  |x|||Formate en html l'affichage des résultats du contrôle dans le menu du même nom à la recherche d'un contrôle | *Recherche* : Recherche des contrôles depuis le, Recherche par N° de dossier (AC) |![picto](/doc/img/affiche_result_rech_cc_dos.png)|
|affiche_en_tete_impression  |x|||Blanc pour rien n'afficher dans le titre de la fiche lors de l'impression | ||
|affiche_glossaire  |x|||Formate en html l'affichage du glossaire dans l'onglet du même nom  | *Fiche d'information* : Dossier de conformité AC ||
|affiche_logo  |x|||Lien http de l'image du logo de l'ARC + prestataire (format image)  | *Fiche d'information* : Dossier de conformité AC ||
|affiche_nidcc |x|x|N° de dossier|Formate le n° de dossier  | *Fiche d'information* : Dossier de conformité AC ||
|affiche_modif_demande |x|x||Formate en HTML l'affichage des modifications demandées au prestataire  | *Recherche* : Recherche des contrôles avec une demande de modifications ||
|affiche_reg |x|x|(null)|Formate en html la partie règlementaire présente dans l'onglet Objet de la mission du dossier de conformité   | *Fiche d'information* : Dossier de conformité AC ||
|affiche_schema  |x|||Lien http de l'image du schéma générique de raccordement du glossaire  (format image)  | *Fiche d'information* : Dossier de conformité AC ||
|affiche_tri |x|||Formate en html le n° d'ordre des contrôles et affiché dans les résultats d'une recherche | *Recherche* : Recherche des contrôles depuis le, Recherche par N° de dossier (AC) |![picto](/doc/img/affiche_tri.png)|
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
|nidccp||x|Référence diagnostiqueur||*Fiche d'information* : Dossier de conformité AC||
|op_sai||x|null|Texte de remplacement utilisé avec un espace (évite l'affichage de la valeur dans la fiche)|*Fiche d'information* : Conformité AC à l'adresse||
|ordre_tri  |x||Il y a|Calcul de la différence entre la date du contrôle et la date du jour pour trie dans la fiche des contrôles à l'adresse | *Fiche d'information* : Conformité AC à l'adresse ||
|ordre_cc||x|Il y a||*Fiche d'information* : Conformité AC à l'adresse||
|proprioad||x|Adresse||*Fiche d'information* : Dossier de conformité AC||
|proprioadcp||x|Code postal|Formatage d'une liste de domaine avec CP et nom de la commune|*Fiche d'information* : Dossier de conformité AC||
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
|validobs||x|Modifications demandées||*Fiche d'information* : Dossier de conformité AC||
  
   * filtres : sur le champ certtype, est égale à une valeur de contexte, id_presta
   * relations :

|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
|lt_euep_cc_certificateur| certtype - code | 1 (égal) |
|xapps_geo_v_euep_cc| id_adresse | 0 à n (égal) |
|an_euep_cc_media| idcc - id | 0 à n (égal) |
| xapps_an_v_euep_cc_erreur| nidcc | 0 à 1 (égal) |

  * déclencheurs :
 
Un fonctionnel automatique d'envoi d'email a été généré pour gérer la communication entre les prestataires saississant les contrôles et les service de l'Agglomération devant les contrôlés.
Il repose sur la mise en place de déclencheurs directement dans l'application.

|Non|Opérations|Conditions|Type|Actions|
|:---|:---|:---|:---|
|Pas de suppression possible d'un dossier|delete||Annule la saisie|Boîte de dialogue affichée à l'utilisateur lui indiquant une suppression impossible| 
|Nouveau dossier (envoi ARC)|insert||Envoi un email au service de l'ARC|Formatage d'un champ calculé pour le corps du message (affiche_email_nvdossier)| 
|Nouveau dossier (accusé de réception)|insert||Envoi un email au prestataire sur l'attribut liste_email|Formatage d'un champ calculé pour le corps du message (affiche_ar_nvdossier)| 
|Validation dossier (accusé de réception)|update|si état du dossier pas de 20 à 10|Envoi un email au prestataire sur l'attribut liste_email lors de la valdation par l'ARC|Formatage d'un champ calculé pour le corps du message (affiche_email_valide)| 
|Demande de modification|update|si état du dossier passe de 20 à 30|Envoi un email au prestataire sur l'attribut liste_email|Formatage d'un champ calculé pour le corps du message (affiche_email_demandedemodif)| 
|Demande de modification d'un dossier effectuée|update|si l'état du dossier reste à 30 et modification(s) demandée(s) inchangée|Envoi un email au service de l'ARC|Formatage d'un champ calculé pour le corps du message (affiche_email_redemandemodif)| 
|Demande de modification d'un dossier (accusé réception)|update|si l'état du dossier reste à 30 et modification(s) demandée(s) inchangée|Envoi un email au prestataire sur l'attribut liste_email|Formatage d'un champ calculé pour le corps du message (affiche_ar_modifdemandee)| 
|Nouvelle demande de modification |update|si l'état du dossier reste à 30 et modification(s) demandée(s) est différentes|Envoi un email au prestataire sur l'attribut liste_email|Formatage d'un champ calculé pour le corps du message (affiche_email_nvelledemandemodif)| 
|Dévalidation d'un contrôle |update|si l'état du dossier passe de 10 à une autre valeur|Envoi un email au prestataire sur l'attribut liste_email|Formatage d'un champ calculé pour le corps du message (affiche_email_devalide)| 
|Validation dossier (accusé réception) - suite demande de modif ARC |update|si l'état du dossier passe de 30 à 10|Envoi un email au prestataire sur l'attribut liste_email|Formatage d'un champ calculé pour le corps du message (affiche_email_valide)| 

## Table : `an_v_euep_cc_media`

|Attributs| Champ calculé | Formatage|Renommage |Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|affiche_lien |x|x|Télécharger|Formate le lien de téléchargement des documents joints |*Fiche d'information* : Dossier de conformité AC||
|date_sai||x|Intégré le|Formatage de la date en dd-mm-yyyy|||
|l_prec||x|Précision||||
|l_type||x|Type de document|Formatage par une liste de domaine (lt_euep_doc)|||
|media||x||Formatage du document joint en type image|||
|miniature||x|Fichier|Formatage de l'aperçu du document joint en type image|||
|op_sai||x|Opérateur de saisie||||
   
   * filtres : aucun
   * relations : aucune
   

## Table : `an_euep_cc_certi_media`

|Attributs| Champ calculé | Formatage|Renommage |Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|affiche_media |x|x|affiche_media|Formate le nom à afficher sous le media pour le distinguer|*Fiche d'information* : Informations des prestataires (AC)||
|date_sai||x|Date de saisie|Formatage de la date en dd-mm-yyyy|||
|l_prec||x|Précision||||
|l_type||x|Type d'attestation|Formatage par une liste de domaine (lt_euep_doc_certif)|||
|media||x||Formatage du document joint en type image|||
|miniature||x|Fichier|Formatage de l'aperçu du document joint en type image|||
|op_sai||x|Opérateur de saisie||||
|dfin||x|Fin de l'attestation d'assurance||||
|l_nom||x|Attestation de formation pour||||
   
   * filtres : aucun
   * relations : aucune
   
## Table : `xapps_an_euep_cc_nc`

|Attributs| Champ calculé | Formatage |Renommage  |Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|affiche_adresse_export |x||Adresse du contrôle|Formate l'adresse pour l'export Excel|*Recherche* : Exporter la liste des contrôles non conformes|`replace({adresse},'60',' 60')`|
|affiche_annee_cc|x|||Formate la date du contrôle en yyyy pour sélection de l'année dans les recherches des contrôles non conforme|*Filtre* : Contrôle Non Conforme par date, Contrôle Non Conforme par année (*Recherche* : Liste des contrôles NON CONFORME)||
|affiche_annee_controle|x||Année du contrôle|Formate l'année du contrôle pour l'export Excel|*Recherche* : Exporter la liste des contrôles non conformes|`to_char({ccdate},'YYYY')`|
|affiche_anomalie|x||Année du contrôle|Décodage des anomalies (liste de domaine inutilisable dans ces cas)|*Champ calculé* : affiche_anomalie_export, affiche_texte_courrier, *Fiche d'information* : Conformité NON CONFORME - Courrier||
|affiche_anomalie_export|x||Anomalie(s)|Formate les anomalies pour l'export Excel|*Recherche* : Exporter la liste des contrôles non conformes|`CASE WHEN substring({affiche_anomalie} FROM 1 FOR 4) = '<br>' THEN replace(substring({affiche_anomalie},5),'<br>',',') ELSE replace({affiche_anomalie},'<br>',',') END`|
|affiche_anomaliepre|x|||Formate le message pour les précisions d'anomalie dans le courrier|*Champ calculé* : affiche_texte_courrier|`CASE WHEN {euepanomalpre} is null THEN '' ELSE '<br><u>Précisions sur les anomalies constatées</u> : <br><br>' {euepanomalpre}END`|
|affiche_commune_export|x||Commune du contrôle|Formate le nom du champ pour l'export Excel|*Recherche* : Exporter la liste des contrôles non conformes||
|affiche_conformite|x|||Formatage en html l'affichage du résultat dans le menu du même nom pour la recherche d'un contrôle non conforme|*Recherche* : Liste des contrôles NON CONFORME|![picto](/doc/img/affiche_menu_result_rech_ccnc.png)|
|affiche_espace_objet|x|||Formatage en html d'un espace avant l'objet du courrier|*Fiche d'information* : Conformité NON CONFORME - Courrier||
|affiche_espace_signature|x|||Formatage en html d'un espace avant la partie signature du courrier|*Fiche d'information* : Conformité NON CONFORME - Courrier||
|affiche_espace_tete|x|||Formatage en html d'un espace avant l'en-tête du courrier|*Fiche d'information* : Conformité NON CONFORME - Courrier||
|affiche_mois_cc|x|||Formate le mois du contrôle en français pour sélection du mois dans les recherches des contrôles non conforme|*Filtre* : Mois du contrôle de conformité AC (*Recherche* : Liste des contrôles NON CONFORME)||
|affiche_objet|x|||Formate en html la partie écrite Objet du courrier|*Fiche d'information* : Conformité NON CONFORME - Courrier||
|affiche_patronyme_export|x||Patronyme|Formate le patronyme pour l'export Excel|*Recherche* : Exporter la liste des contrôles non conformes|`CASE WHEN {propriopat} = '00' THEN '' WHEN {propriopat} = '10' THEN 'M' WHEN {propriopat} = '20' THEN 'Mme'
WHEN {propriopat} = '30' THEN 'M et Mme' WHEN {propriopat} = '40' THEN {propriopatp} END`|
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
|affiche_resultat|x|||Formate le titre de résultat pour la recherche des informations d'un prestataire |*Recherche* : Informations sur le prestataire|![picto](/doc/img/affiche_menu_rech_presta.png)|
|date_assur||x||Formatage de la date en dd-mm-yyyy|||
|etat||x||Formate l'affichage du booléen en Oui ou Non|||
|exist||x||Formate l'affichage du booléen en Oui ou Non|||

   * filtres : 

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:-:|:---:|:---:|:---|:---|
|SECU|code (Code interne du donneur d'ordre)|x|Alphanumérique|est égale à une valeur de contexte|id_presta|Filtre de sécurité permettant à chaque prestataire de visualiser et de modifier uniquement ces informations de contact|

   * relations : aucune
   
## Table : `xapps_an_v_euep_cc_erreur`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|affiche_message |x|x|null|(1)|*Fiche d'information :* Dossier de conformité AC ||

 (1) Requête SQL permettant d'afficher temporairement un message d'erreur dans la fiche d'information`
 CASE WHEN
  extract(epoch from  now()::timestamp) - extract(epoch from
{horodatage}::timestamp) <= 3 then 
'<table width=100%><td bgcolor="#FF000">
<font size=6 color="#ffffff"><center><b>' ||
{erreur} ||
'</b></center></font></td></table>'
ELSE '' 
END
`
   * filtres : aucun
   * relations :

|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
|lt_euep_cc_certificateur| certtype - code | 1 (égal) |
|xapps_geo_v_euep_cc| id_adresse | 0 à n (égal) |
|an_euep_cc_media| idcc - id | 0 à n (égal) |

## Table : `xapps_an_v_euep_cc_tb1`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|affiche_message |x|x|affiche_barre_espace|Affiche un message au dessus des tableau si besoin (format HTML)|*Fiche d'information :* Dossier de conformité AC ||
|affiche_nota |x|x|null|Affiche les annotations en bas de tableau (format HTML)|*Fiche d'information :* Dossier de conformité AC ||
|affiche_result |x|x|null|Affiche un message dans le menu résultat incitant les utilisateurs à cliquer pour ouvrir la fiche contenant les tableaux|*Recherche :* Tableau de bord - Contrôle conformité AC ||
|affiche_result_titre |x|x|null|Affiche le tire du message dans le menu résultat incitant les utilisateurs à cliquer pour ouvrir la fiche contenant les tableaux|*Recherche :* Tableau de bord - Contrôle conformité AC ||
|affiche_source |x|x|null|Affiche la source des données (format HTML)|*Fiche d'information :* Dossier de conformité AC ||
|affiche_titre_tableau1 |x|x|null|Affiche le titre du tableau (format HTML)|*Fiche d'information :* Dossier de conformité AC ||
|tableau1 ||x|null|Code HTML du tableau|*Fiche d'information :* Dossier de conformité AC ||

   * filtres : aucun
   * relations :

|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
| xapps_an_v_euep_cc_tb2| id | 1 (égal) |

* Particularité : 2 tableaux ont été créés, pour les affichés dans la même fiche, un identifiant unique incrémenté à 1 a été inséré dans chaque requête créant le tableau. Comme ces requêtes ne remontent qu'une seule ligne, la jointure peut se faire sur ce n° identifiant (id qui est égal à dans les  2 requêtes).

## Table : `xapps_an_v_euep_cc_tb2`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|affiche_nota |x|x|null|Affiche les annotations en bas de tableau (format HTML)|*Fiche d'information :* Dossier de conformité AC ||
|affiche_source |x|x|null|Affiche la source des données (format HTML)|*Fiche d'information :* Dossier de conformité AC ||
|affiche_titre_tableau2 |x|x|null|Affiche le titre du tableau (format HTML)|*Fiche d'information :* Dossier de conformité AC ||
|tableau1 ||x|Tableau1|Code HTML du tableau|*Fiche d'information :* Dossier de conformité AC ||

   * filtres : aucun
   * relations : aucune

* Particularité : ce tableau est lié à la table `xapps_an_v_euep_cc_tb1`
  
   
## Table : `lt_euep_cc_certificateur`

Sans objet

   * filtres :

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:-:|:---:|:---:|:---|:---|
|SECU|code (Code interne du donneur d'ordre)|x|Alphanumérique|est égale à une valeur de contexte|id_presta|Filtre de sécurité permettant à chaque prestataire de visualiser et de modifier uniquement ces informations de contact|
|Prestataire|code (Code interne du donneur d'ordre)||Alphanumérique|est égale à une liste de valeur|lt_euep_cc_certificateur |Permet la sélection du perstataire dans une liste déroulante|

   * relations : aucune
   
   
## Table : `lt_euep_cc_valid`

Sans objet

   * filtres :
   
|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:-:|:---:|:---:|:---|:---|
|SECU|code (Code interne des types de validation)|x|Alphanumérique|est égale à une valeur de contexte|cc_valid|Filtre de sécurité permettant d'afficher la valeur '40' (contrôle à supprimer) uniquement pour les rôles administrateurs de GEO à savoir le service SIG. Pour les autres, ils ont accés uniquement aux valeurs '10','20' et '30' qui sont saisies dans l'attribit cc_valid au niveau des droits|
   
   * relations : aucune
   
## Table : `lk_insee_codepostal_fr`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|dept |x|x||Code du département déduit du champ {cp_com}|Aucune utilisation||

   * filtres : aucun
   * relations : aucune
   
## Médias : `Assainissement - Contrôle de conformité`

|Source| Taille | Connexion |Lien de connexion|Média|Miniature|Type de media|Nom du média|Fichier origine|
|:---|:---:|:---:|:---|:---|:---|:---|:---|:---|
|an_v_euep_cc_media|900x900 et 60x60|Assainissement - Contrôle de conformité|/home/DOC_SIG_FIC/metiers/ress/ac/doc/|media|miniature|t_fichier|n_fichier||
   
# Les fonctionnalités

Sont présentées ici uniquement les fonctionnalités spécifiques à l'application.

## Recherche globale : `Recherche dans la Base Adresse Locale`

Cette recherche permet à l'utilisateur de faire une recherche libre sur une adresse.

Cette recherche a été créée pour l'application RVA. Le détail de celle-ci est donc à visualiser dans le répertoire GitHub rva au niveau de la documentation applicative.

## Recherche globale : `Recherche dans la Base de Voie Locale`

Cette recherche permet à l'utilisateur de faire une recherche libre sur le libellé d'une voie.

Cette recherche a été créée pour l'application RVA. Le détail de celle-ci est donc à visualiser dans le répertoire GitHub rva au niveau de la documentation applicative.

## Recherche globale : `Localiser une commune de l'ARC`

Cette recherche permet à l'utilisateur de faire une recherche libre sur le nom d'une commune.

Cette recherche a été créée pour l'application Cadastre-Urbanisme. Le détail de celle-ci est donc à visualiser dans le répertoire GitHub docurba au niveau de la documentation applicative.

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
  
Source : `an_euep_cc`

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

## Recherche : `Recherche des contrôles par prestataire`

Cette recherche permet à l'utilisateur de rechercher l'ensemble des contrôles réalisés par un ou plusieurs prestataires par année pour réaliser un export au format Excel.

  * Configuration :
  
Source : `an_euep_cc`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Nom de l'entreprise (certtype)|x|||||
|Adresse (affiche_adresse_gras)|x|||||
|Dossier (affiche_dossier)||||||
|Type de bien (ccbien)|x|||||
|Mission réalisée le (ccdate)|x|||||
|L'installation est (rcc)|x|||||
(la détection des doublons n'est pas activée ici)
(tri des résultats par la date de la mission (ccdate))

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|sans objet|||

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|Prestataire (an_euep_cc)|x|certtype|est égale à une valeur choisie par l'utilisateur parmi une liste (lt_euep_cc_certificateur)|affiche_liste|certtype|certtype|||
|Année du contrôle (an_euep_cc)||affiche_annee|est égale à une valeur choisie par l'utilisateur parmi une liste prédéfinie |affiche_annee|affiche_annee|affiche_annee|||

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
 
## Recherche : `Exporter la liste des contrôles non conformes`

Cette recherche permet à l'utilisateur d'exporter (en excel par ex) la liste des contrôles non conformes.

  * Configuration :
  
Source : `xapps_an_euep_cc_nc`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|affiche_annee_controle|x|||||
|affiche_commune_export|x|||||
|affiche_adresse_export|x|||||
|adapt||||||
|adeta||||||
|affiche_patronyme_export||||||
|proprionom||||||
|propriopre||||||
|proprioad||||||
|affiche_anomalie_export||||||

(la détection des doublons n'est pas activée ici)

 * Filtres : aucun

(1) si liste de domaine

 * Fiches d'information active : aucune
 
## Recherche : `Recherche des contrôles depuis`

Cette recherche permet à l'utilisateur de faire une recherche sur les contrôles de conformité à partir d'une certaine date.

  * Configuration :
  
Source : `an_euep_cc`

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
|Groupe de filtres par défaut|`OU`||

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|Date de saisie du contrôle|x|date_sai|est supérieure ou égale à une valeur saisie|||||Ce champ étant un  champ date, l'utilisateur dispose d'un calendrier pour la saisie de la date|
|Date du contrôle|x|ccdate|est supérieure ou égale à une valeur saisie|||||Ce champ étant un  champ date, l'utilisateur dispose d'un calendrier pour la saisie de la date|
|Date de délivrance du contrôle|x|ccdated|est supérieure ou égale à une valeur saisie|||||Ce champ étant un  champ date, l'utilisateur dispose d'un calendrier pour la saisie de la date|

(1) si liste de domaine

 * Fiches d'information active : Dossier de conformité AC

## Recherche : `Recherche des contrôles avec une demande de modifications`

Cette recherche permet à l'utilisateur de faire une recherche sur les contrôles de conformité ayant une demande de modifications faites au prestataire.

  * Configuration :
  
Source : `an_euep_cc`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|affiche_tri|x|||||
|affiche_adresse_gras|x|||||
|affiche_dossier|x|||||
|affiche_modif_demandee|x|||||
|geom||||x||

(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|sans objet|||

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|CC AC - Demande de modifications|x|ccvalid|est égale à une valeur par défaut|30|||||

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
 


## Recherche : `Tableau de bord - Contrôle conformité AC`

Cette recherche permet à l'utilisateur d'afficher les tableaux de bord.

  * Configuration :
  
Source : `xapps_an_v_euep_cc_tb1`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|affiche_result_titre|x|||||
|affiche_result|x|||||
(la détection des doublons n'est pas activée ici)

 * Filtres : aucun

(1) si liste de domaine

 * Fiches d'information active : Tableau de bord - Contrôle conformité AC
 
 
 
## Recherche : `Recherche avancée d'une voie`

Cette recherche permet à l'utilisateur de rechercher une voie en mode proposition de valeur (sans saisie manuelle).
Cette recherche est issue de l'application Voie-Adresse. Se référer à ce dossier pour le détail de cette recherche.

## Fiche d'information : `Informations des prestataires (AC)`

Source : `lt_euep_cc_certificateur`

 * Statistique : aucune
 
 * Représentation :
 
|Mode d'ouverture|Taille|Agencement des sections|
|:---|:---|:---|
|dans le gabarit|530x650|Vertical|

|Nom de la section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Informations du prestataire|Etat de la certification,Nom de l'entreprise,Adresse,Téléphone fixe, Téléphone portable,EMail,N° SIRET,Compagnie d'assurance,N° de la police,Date de fin de validité|Par défaut|Vertical||||
|Médiathèque|Champ miniature de GEO, affiche_media|Par défaut|Vertical||Media - certificateur||

 * Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

|Attribut|Obligatoire|Valeur par défaut|Liste de domaine|Représentation|
|:---|:---|:---|:---|:---|
|Nom de l'entreprise (valeur), Adresse (adresse), Téléphone fixe (tel), Téléphone portable (tel_port), N° SIRET (siret), Compagnie d'assurance (nom_assur), N° de la police (num_assur), Date de fin de validité (date_assur), Email (email), exist (exist)|||||

**IMPORTANT** : L'édition des données jointes est désactivée.
 
 * Modèle d'impression : aucun

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

Source : `an_euep_cc`

 * Statistique : aucune
 
 * Représentation :
 
|Mode d'ouverture|Taille|Agencement des sections|
|:---|:---|:---|
|dans le gabarit|1150x700|Onglets|

|Nom de la section|Sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|:---|
|(vide)||titre_fiche_affiche|Masqué|Vertical||||
|Objet de la mission||affiche_message,affiche_logo, affiche_reg|Masqué|Vertical||||
|(vide)||tnidcc|A gauche|Vertical||||
||(vide)|nidcc|Par défaut|Vertical|tnidcc=='20'|||
|(vide)||ccbien, ccinit, ccvalid,nidccp|Par défaut|Vertical||||
|A/Conclusion du contrôle||affiche_message,affiche_conclusion|Masqué|Vertical||||
||(vide)|rcc, ccdate|A gauche|Vertical||||
||(vide)|affiche_valide|Masqué|Vertical||||
|B/Identitié de l'opérateur du diagnostic|||Par défaut|Vertical||||
||(vide)|affiche_message|Masqué|Vertical||||
||(vide)|certnom, certpre, certtype, certi_adresse, certi_tel, certi_email, certi_siret, certi_assur, certi_numassur, certi_dassur,op_sai|Par défaut|Vertical||||
|C/Désignation du donneur d'ordre||||Vertical||||
||(vide)|affiche_message|Masqué|Vertical||||
||Propriétaire|propriopat|Par défaut|Vertical||||
||(vide) sous-onglet de propriétaire|propriopatp|Par défaut|Vertical|propriopat=='40'|||
||(vide) sous-onglet de propriétaire|proprionom, propriopre, proprioad,proprioadcp|Par défaut|Vertical||||
||Donneur d'ordre|dotype|Par défaut|Vertical||||
||(vide) sous-onglet de Donneur d'ordre|doaut, donom, dopre, doas|Par défaut|Vertical|dotype=='99'|||
||Acheteur|achetpat|Par défaut|Vertical||||
||(vide) sous-onglet de Acheteur|achetpatp|Par défaut|Vertical|achetpat=='40'|||
||(vide) sous-onglet de Acheteur|achetnom, achetpre, achetad|Par défaut|Vertical||||
|D/Désignation du ou des bâtiments||||Vertical||||
||(vide)|affiche_message|Masqué|Vertical||||
||Type de bâtiment|commune, adresse, adapt, adeta, batitype|Par défaut|Vertical||||
||(vide) sous-onglet de Type de bâtiment|batiaut|Par défaut|Vertical|batitype=='99'|||
||Desserte par le réseau public d'eau potable|eppublic|Par défaut|Vertical||||
||(vide) sous-onglet de Desserte par le réseau public d'eau potable|epaut|Par défaut|Vertical|eppublic=='20'|||
|E/Nature des installations (domaine publique)||||Vertical||||
||(vide)|affiche_message|Masqué|Vertical||||
||(vide)|rredptype, rebrtype|Par défaut|Vertical||||
||(vide)|rrechype|Par défaut|Vertical|rrebrtype=='20'|||
|F/Etat des installations (domaine privé)||||||||
||(vide)|affiche_message|Masqué|Vertical||||
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
|G/Anomalies identifiées|affiche_message|||Vertical||||
||(vide)|affiche_message|Masqué|Vertical||||
||(vide)|euepanomal|Au-dessus|Vertical||||
|H/Constations diverses|affiche_message|||Vertical (ici pour la sous-section)||||
||(vide)|euepdivers|Par défaut|Vertical||||
||(vide) sous-onglet de Constations diverses|ccdated |Par défaut|Vertical||||
||Attestation d'agrément sous-onglet de Constations diverses|affiche_attestation_logo |Masqué|Vertical||||
|I/Pièces jointes||miniature, l_type, l_prec, affiche_lien|Par défaut|Vertical||Média-Assainissement Contrôle de conformité||
||Aperçu sous-onglet de I/Pièces jointes|l_test(champ toujours en test) |Masqué|Vertical||||
|Glossaire||affiche_message,affiche_glossaire|Masqué|Vertical||||

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
|proprioadcp|x||(valeur suggérée ne fonctionne pas, en attente de résolution)||
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
|euepanomal  |||lt_euep_cc_anomal|Cases à cocher multiples|
|euepdivers  ||||Champ texte à plusieurs lignes|
|ccbien  |x|20|lt_eupe_cc_bien|Boutons radios|
|propriopat  |x||lt_euep_cc_pat||
|propriopatp  |||||
|achetpat  ||00|lt_euep_cc_pat||
|achetpatp  |||||
|achetnom  |||||
|achetpre  |||||
|achetad  |||||
|ccvalid  |x|20|lt_euep_cc_valid|Boutons radios|
|op_sai  |x|%USER_LOGIN%|||
|tnidcc  |x||lt_euep_cc_tnidcc|Boutons radios|
|validobs  |x|||Champ texte à plusieurs lignes|
|nidccp  |||||
|proprioadcp |||lk_insee_codepostal_fr|Suggection de valeurs (en test)|

 * Particularité : l'attirubt op_sai est obligatoire à la saisie mais non éditable. Il ne s'affiche pas dans la fiche car un espace a été initialisé comme texte de remplacement dans la table source. Ce contournement a été opéré pour saisir le login de connexion dans la base de données.

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
 
## Fiche d'information : `Media - certificateur`

Note : cette fiche n'est pas censé s'ouvrir dans GEO comme une fiche standard mais via le module de gestion d'un média

Source : `an_euep_cc_certi_media`

 * Statistique : aucune
 
 * Représentation :
 
|Mode d'ouverture|Taille|Agencement des sections|
|:---|:---|:---|
|dans le gabarit|530x650||

|Nom de la section|Sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|:---|
|(vide)||Operateur de saisie, Date de saisie, Précision, Type d'attestation|Par défaut|Vertical||||

|Nom de la section|Sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|:---|
|(vide)||Fin de l'attestation d'assurance|Par défaut|Vertical|l_type == '10'|||

|Nom de la section|Sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|:---|
|(vide)||Attestation de formation pour|Par défaut|Vertical|l_type == '11'|||

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
|l_type|x||lt_euep_doc_certif||
|l_prec|||||
|l_nom|||||
|dfin|||||
|gid|||||

**IMPORTANT** : L'édition des données jointes est désactivée.
 
 * Modèle d'impression : aucun
 
## Fiche d'information : `Tableau de bord - Contrôle conformité AC`

Source : `xapps_an_v_euep_cc_tb1`

 * Statistique : aucune
 
 * Représentation :
 
|Mode d'ouverture|Taille|Agencement des sections|
|:---|:---|:---|
|dans le gabarit|700x650|Vertical|

|Nom de la section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|(vide)|affiche_titre_tableau1, tableau1, affiche_source,affiche_nota|Masqué|Vertical||||
|(vide)|affiche_titre_tableau2, Tableau1, affiche_source,affiche_nota|Masqué|Vertical||||

 * Saisie :
 
Sans objet

 * Modèle d'impression : aucun

## Analyse :

Aucune

## Statistique :

Aucune

## Modification géométrique :

Aucune

# La cartothèque

|Groupe|Sous-groupe|Visible dans la légende|Visible au démarrage|Détails visibles|Déplié par défaut|Geotable|Renommée|Issue d'une autre carte|Visible dans la légende|Visible au démarrage|Déplié par défaut|Couche sélectionnable|Couche accrochable|Catégorisation|Seuil de visibilité|Symbologie|Autres|
|:---|:---|:-:|:-:|:-:|:-:|:---|:---|:-:|:-:|:-:|:-:|:-:|:---|:---|:---|:---|:---|
|Limite administrative||x|x|x||geo_v_osm_commune_arcba|Limite communale|x|x|x||||||Contour noir 1.5||
|Contrôle de conformité AC||x|x|x|x|xapps_geo_v_euep_cc|Conformité|x|x|x|x|||affiche_cc|0 à 1/10000é|picto de taille 45 (cc_picto_conforme.svg, cc_picto_non_conforme.svg),pas de picto pour aucun contrôle réalisé|Cf partie Données pour les paramètres d'étiquettage (champ etiquette_nbcc)|
|Le réseau d'assainissement||x|x|x||||||||||||||
|Le réseau d'assainissement|Base de données SIG (DSP)|x|x|||||x||||||||||
|Le réseau d'assainissement|Levé de surface 2015 (Lachelle)|x|x|||||x||||||||||
|Le réseau d'assainissement|Données CAO LDE / SAUR 2012|x|x|||||x||||||||||
|Le réseau d'assainissement||x||||||x||||||||||
|Le réseau d'eau potable||x|x|||||||||||||||
|Le réseau d'eau potable|Géodétection 2017 (Lachelle)|x||||||x||||||||||
|Le réseau d'eau potable|Données CAO SAUR|x|x|x||||x||||||||||

# L'application

* Généralités :

|Gabarit|Thème|Modules spé|Impression|Résultats|
|:---|:---|:---|:---|:---|
|Pro|Thème GeoCompiegnois 1.0.7 (Contrôle conformité AC et réseaux humides))|Bandeaux HTML,StreetView,GeoCadastre,Multimedia,Google Analytics,Page de connexion perso,Javacript,Export Fonctionnalités (Contrôle Conformatité AC)|8 Modèles standards A4 et A3||

Note : le thème employé dans cette application intègre la suppression de la première colonne dans les tableaux des fiches d'information. Cela permet de ne pas afficher le champ qui tri l'ordre des contrôles par date pour chaque adresse.

* Particularité de certains modules :
  * Module introduction : il contient un texte de présentation et les liens vers les fiches d'aide. Le libellé Application a été personnalisé et renommé en Avant de Commencer.
  * Module javacript : ce module été intégré pour forcer l'affichage du menu Application à l'ouverture de l'application.
`var injector = angular.element('body').injector();
var acfApplicationService = injector.get('acfApplicationService');
acfApplicationService.whenLoaded(setTimeout(function(){
$(".sidepanel-item.launcher-application").click();
}, 100));`
  * Module Google Analytics : le n° ID est disponible sur le site de Google Analytics
  * Export Fonctionnalités (Contrôle Conformatité AC) : Exporter les fonctionnalités d'après la liste (Exporter la lists des contrôles non conformes)
  
* Recherche globale :

|Noms|Tri|Nb de sugggestion|Texte d'invite|
|:---|:---|:---|:---|
|Recherche dans la Base Adresse Locale,Recherche dans la Base de Voie locale, Localiser une commune de l'ARC|alpha|20|Rechercher une adresse, une voi ou une commune|

* Carte : `Contrôle de conformité Assainissement collectif`

Comportement au clic : (dés)active uniquement l'item cliqué
Liste des recherches : Contrôle de conformité AC

* Fonds de plan :

|Nom|Au démarrage|opacité|
|:---|:---|:---|
|Cadastre|x|100%|
|Plan de ville||100%|
|Carte IGN 25000||100%|
|Photographie aérienne 2013|x|70%|

* Fonctionnalités

|Groupe|Nom|
|:---|:---|
|Contrôle de conformité - AC|Recherche par adresse (AC)|
||Recherche par N° de dossier (AC)|
||Recherche des contrôles depuis|
||Recherche des contrôles avec une demande de modifications|
|Gestion des contrôles non conformes|Liste des contrôles NON CONFORME|
||Exporter la liste des contrôles non conformes|
|Prestataires|Informations sur le prestataire|
|Tableaux de bord|
||Tableau de bord - Contrôle conformité AC|
|Recherche avancée d'une voie|
||Recherche avancée d'une voie|


