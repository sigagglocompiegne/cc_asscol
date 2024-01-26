![picto](https://github.com/sigagglocompiegne/orga_gest_igeo/blob/master/doc/img/geocompiegnois_2020_reduit_v2.png)

# Documentation d'administration de la base #

## Principes
  * **généralité** :
 les contrôles de conformité pour l'assainissement collectif sont gérés par le service Assainissement de l'Agglomération de la Région de Compiègne et délégués à 8 prestataires agréés en 2018. A chaque réalisation d'une nouvelle construction ou d'une vente d'un bien ancien, un contrôle est rendu obligatoire. Ce contrôle est valable 2 ans pour un bien ancien en maison individuelle et 5 ans pour un appartement. Ces contrôles sont effectués par un des organismes agréés et le formulaire est envoyé au service  Asainissement pour validation. Une fois validé le contrôle est envoyé au propriétaire via le prestataire. Si ce contrôle est non conforme, le propriétaire doit effectuer la remise en conformité. Un nouveau contrôle est réalisé après ses travaux.
 
 Attention : les statistiques reconstitués à partir de la requête exportant la liste des contrôles non conforme peuvent être légèrement différentes du tableau de synthèse annuel disponible sur l'application. En effet les indicateurs utilisés dans le tableau de synthèse annuel utilise l' année initiale du contrôle même si celui-ci fait l'objet d'une contre visite contrairement à l'export de liste qui utilise l'année du contrôle (même pour les contre visite).
Par conséquent, les calculs exploitant directement la base de données ne renvoient pas forcément les mêmes données dans le tableau sur l’application.

 
 * **résumé fonctionnel** :
 les données des contrôles de conformité sont localisées à l'adresse postale du bien contrôlé. La classe d'objets des points d'adresse de la BAL de l'Agglomération est donc utilisée pour la primitive géographique. Seuls les données métiers des contrôles font l'objet d'un stockage dans des classes d'objets non géographiques. Cette donnée métier est donc urbanisée avec la donnée adresse. Une des particularités de cette donnée, est qu'il faut en assurer un suivi chronologique. On doit pouvoir à une adresse donnée, visualiser et consulter l'ensemble des contrôles déjà réalisés et ceux en cours.

## Schéma fonctionnel

![schema_fonctionnel](img/schema_fonctionnel_v5.png)

## Dépendances

La base de données des contrôles de conformité s'appuie sur des référentiels préexistants constituant autant de dépendances nécessaires pour l'implémentatation de cette base.

|Schéma | Table/Vue | Description | Usage |
|:---|:---|:---|:---|
|x_apps | xapps_geo_v_adresse | vue de la base de données urbanisées des adresses | géométrie de positionnement des contrôles + adresse |
|r_objet | geo_objet_pt_adresse | donnée des points d'adresse (géométrie) | géométrie de positionnement des contrôles |
|r_adresse | an_adresse | donnée alphanumérique des adresses | n° de voirie, jointure avec r_objet.geo_objet_pt_adresse sur id_adresse |
|r_voie | an_voie | donnée alphanumérique des voies | libellé de la voie, jointure avec r_objet.geo_objet_pt_adresse sur id_voie |
|r_administratif | lk_insee_codepostal | donnée des codes postaux des communes | code postal de la commune, jointure avec r_objet.geo_objet_pt_adresse sur insee |
|r_osm | geo_osm_commune | donnée de référence géographique du découpage communal OSM | nom de la commune, jointure avec r_objet.geo_objet_pt_adresse sur insee |
|r_objet | lt_position | domaine de valeur générique d'une table géographique | positionnement du point adresse, jointure avec r_objet.geo_objet_pt_adresse code = position |
|r_adresse | lt_dest_adr | domaine de valeur générique d'une table géographique | destination de l'adresse, jointure avec r_objet.geo_objet_pt_adresse code = dest_adr |
|r_adresse | lt_etat_adr | domaine de valeur générique d'une table géographique | état de l'adresse, jointure avec r_objet.geo_objet_pt_adresse code = etat_adr |
|r_adresse | lt_groupee | domaine de valeur générique d'une table géographique | groupage de l'adresse, jointure avec r_objet.geo_objet_pt_adresse code = groupee |
|r_adresse | lt_secondaire | domaine de valeur générique d'une table géographique | adresse secondaire, jointure avec r_objet.geo_objet_pt_adresse code = secondaire |
|r_adresse | lt_src_adr | domaine de valeur générique d'une table géographique | source de l'adresse, jointure avec r_objet.geo_objet_pt_adresse code = src_adr |
|r_objet | lt_src_geom | domaine de valeur générique d'une table géographique | source du positionnement du point adresse, jointure avec r_objet.geo_objet_pt_adresse code = src_geom |
|r_adresse | lt_diag_adr | domaine de valeur générique d'une table géographique | diagnostic de l'adresse, jointure avec r_objet.geo_objet_pt_adresse code = diag_adr |
|r_adresse | lt_qual_adr | domaine de valeur générique d'une table géographique | qualité de l'adresse, jointure avec r_objet.geo_objet_pt_adresse code = qual_adr |

## Classes d'objets

L'ensemble des classes d'objets de gestion sont stockés dans le schéma m_reseau_humide et celles applicatives dans le schéma x_apps.

 ### classes d'objets de gestion :
  
   `an_euep_cc` : table des attributs métiers permettant de gérer l'ensemble des éléments d'un contrôle de conformité.
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|idcc|Identifiant interne unique du contrôle|integer|nextval('m_reseau_humide.an_euep_cc_idcc_seq'::regclass)|
|id_adresse|Identifiant unique de l'objet point adresse (issu de la BAL)|bigint| |
|ccvalid|validation par l'ARC du contrôle (la valeur 10 empêche la modification des données|character varying(2)|20|
|validobs|Modification demandée au prestataire (si ccvalid=30)|character varying(1000)||
|ccinit|information sur le fait que ce contrôle soit le contrôle initial dans le cas de contrôle supplémentaire suite à une non conformité|boolean|false|
|adapt|Complément de l'adresse avec le n° d'appartement dans le cadre d'un immeuble collectif|character varying(20)| |
|adeta|Etage|integer| |
|tnidcc|Type de dossier pour lacréation d'un nouveau contrôle (clé étrangère sur la liste de valeur lt_euep_cc_tnidcc)|character varying(2)| |
|nidcc|N° de dossier du contrôle (ce numéro suit pour une vérification en cas de non conformité)|character varying(20)| |
|nidccp|N° interne au prestataire du contrôle|character varying(20)| |
|rcc|Résultat du contrôle (true : conforme, false : non conforme)|character varying(3)| |
|ccdate|Date du contrôle|timestamp without time zone| |
|ccbien|Code du type de bien contrôlé (neuf ou ancien) (clé étrangère sur la liste de valeur lt_euep_cc_bien)|character varying(2)|'00'::character varying|
|certtype|Code de l'organisme certificateur agréé (clé étrangère sur la liste de valeur lt_euep_cc_certificateur)|integer| |
|certnom|Nom de la personne appartenant à l'organisme certificateur agréé qui a fait le contrôle|character varying(80)| |
|certpre|Prénom de la personne appartenant à l'organisme certificateur agréé qui a fait le contrôle|character varying(80)| |
|propriopat|Patronyme du propriétaire (clé étrangère sur la liste de valeur lt_euep_cc_pat)|character varying(2)|'00'::character varying|
|propriopatp|Patronyme du propriétaire (précision si autre renseigné dans propriopat)|character varying(50)| |
|proprionom|Nom de la personne désignant le propriétaire|character varying(80)| |
|propriopre|Prénom de la personne désignant le propriétaire|character varying(80)| |
|proprioad|Adresse de la personne désignant le propriétaire|character varying(254)| |
|proprioadcp|Code postal et commune de la personne désignant le propriétaire|character varying(254)| |
|dotype|Code de la qualité du donneur d'ordre (clé étrangère sur la liste de valeur lt_euep_cc_ordre)|character varying(2)|'00'::character varying|
|doaut|Autre donneur d'ordre si pas présent dans dotype|character varying(80)| |
|donom|Nom de la personne désignant le donneur d'ordre|character varying(80)| |
|dopre|Prénom de la personne désignant le donneur d'ordre|character varying(80)| |
|doad|Adresse de la personne désignant le donneur d'ordre|character varying(80)| |
|achetpat|Patronyme de l'acheteur (clé étrangère sur la liste de valeur lt_euep_cc_pat)|character varying(2)|'00'::character varying|
|achetpatp|Patronyme de l'acheteur (précision si autre renseigné dans achetpat)|character varying(50)| |
|achetnom|Nom de la personne désignant l'acheteur|character varying(80)| |
|achetpre|Prénom de la personne désignant l'acheteur|character varying(80)| |
|achetad|Adresse de la personne désignant l'acheteur|character varying(80)| |
|batitype|Code du type de bâtiment concerné par le contrôle (clé étrangère sur la liste de valeur lt_euep_cc_typebati)|character varying(2)|'00'::character varying|
|batiaut|Autre type de bâtiment si pas présent dans batitype|character varying(80)| |
|eppublic|Desservie par un réseau public d'eau potable (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|epaut|Autre alimentation que le réseau d'eau potable public|character varying(80)| |
|rredptype|Code du type de réseau de raccordement au domaine publique (clé étrangère sur la liste de valeur lt_euep_cc_typeres)|character varying(2)|'ZZ'::character varying|
|rrebrtype|Information sur l'existence d'une boîte de raccordement (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|rrechype|Information sur l'existence d'un regard sous chaussée si pas de boîte de raccordement (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|eupc|Information sur l'existence d'un raccordement sur les parties communes (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|euevent|Information sur l'existence d'un évent (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|euregar|Information sur l'existence d'un regard (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|euregardp|Information sur l'existence d'un regard accessible dans le domaine privé (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|eusup|Information sur l'existence d'une servitude avec une autre propriété pour les EU ou les EP (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|eusuptype|Précision du réseau en cas de servitude avec une autre propriété (clé étrangère sur la liste de valeur lt_euep_sup)|character varying(2)|'ZZ'::character varying|
|eusupdoc|Information sur l'existence de documents attestant la servitude avec une autre propriété pour les EU ou les EP (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|euecoul|Information le bon déroulé de l'écoulement (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|eufluo|Information l'existence d'un test à la fluorescéine (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|eubrsch|Information sur l'existence d'un branchement sous chaussée (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|eurefl|Information sur la protection du branchement par un système d'anti reflux (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|euepsep|Information sur la séparation de la collecte des EP et EU (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|eudivers|Autres informations sur la collecte des eaux usées|character varying(500)| |
|euanomal|Information sur la présence d'anomalies constatées (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|euobserv|Précisions sur les anomalies constatées sur la collecte des eaux usées|character varying(500)| |
|eusiphon|Présence de syphons sur chaque évacuation contrôlée (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|epdiagpc|Diagnostic réalisé sur les parties communes (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|epracpc|Raccordement sur les parties communes (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|epregarcol|Existence d'une regard de collecte (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|epregarext|Regard de collecte à l'extérieur de l'habitation (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|epracdp|Raccordement au réseau public d'évacuation des eaux pluviales (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|eppar|Eaux pluviales traitées à la parcelle (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|epparpre|Précision sur le traitement des eaux pluviales à la parcelle si existe|character varying(200)| |
|epfum|Test à la fummée réalisée (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|epecoul|Ecoulement correct (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|epecoulobs|Observation sur l'écoulement (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(500)| |
|eprecup|Système de récupération des eaux pluviales (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|eprecupcpt|Compteur présent en cas de récupération des eaux pluviales à usage domestique (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)|'ZZ'::character varying|
|epautre|Autre|character varying(200)| |
|epobserv|Observations diverses sur la collecte des eaux usées|character varying(200)| |
|euepanomal|Liste des anomalies identifiées entrainant la non conformité|character varying(20)| |
|euepanomalpre|Précisions sur les anomalies|character varying(5000)| |
|euepdivers|Constatations diverses|character varying(1000)| |
|dbinsert|Date de saisie|timestamp without time zone| |
|dbupdate|Date de mise à jour|timestamp without time zone| |
|op_sai|Opérateur de saisie|character varying(80)| |
|scr_geom|Source du référentiel géographique de saisie|character varying(2)| |
|date_notif|Date de notification|timestamp without time zone| |
|date_rel|Date de relance|timestamp without time zone| |
|epracdpdom|Précision du raccordement au réseau public d'évacuation des EP|character varying(2)| |
|euepconstd|Constatations diverses observées sur le réseau d'assainissement|boolean| |
|op_maj|Opérateur de mise à jour|character varying(80)| |
|maj_nc||boolean| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ idcc avec une séquence d'incrémentation d'un numéro automatique ``an_euep_cc_idcc_seq``
* 36 clés étrangères existent et correspondent aux classes de listes de valeurs
* le n° de dossier nidcc est composé come suit ```[insee]cc[n° auto max+1 déjà présent sur la commune```. Cet identifiant est généré automatiquement à la création d'un nouveau contrôle depuis l'application métier
* 2 triggers :
  * ``t_t1_an_euep_cc_update_insert`` : gère l'insertion et la mise à jour des dossiers
  * ``t_t2_an_euep_cc_delete`` : gère la suppression des dossiers
  * ``t_t3_an_euep_cc_insert`` : gère après une insertion la transformation des '' en valeur null
  * ``t_t3_log_an_euep_cc_insert_update`` : gère après une insertion ou une mise à jour l'écriture de la transaction dans la classe des logs
  
* Par défaut l'enregistrement d'un nouveau dossier ou d'un suivi est non valide (même si une autre valeur est saisie = sécurité)

    * fonctionnement :
      * à l'entrée : 
        * un contrôle validé ne peut pas être modifié
        * un contrôle validé ou non ne peut pas être supprimé
        * seuls les administrateurs peuvent rendre un contrôle de nouveau modifiable ou le supprimer

---

   `an_euep_cc_media` : table des médias structurée selon les recommandations de l'éditeur des applications métiers. Elle permet de stocker des documents joints (ici documents en lien avec le contrôle, formulaire, schémas ,photos , ...)
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|gid|Identifiant unique|integer|nextval('m_reseau_humide.an_euep_cc_media_gid_seq'::regclass)|
|id|Identifiant du contrôle de conformité Assainissement collectif|integer| |
|media|Champ Média de GEO|text| |
|miniature|Champ miniature de GEO|bytea| |
|n_fichier|Nom du fichier|text| |
|t_fichier|Type de média dans GEO|text| |
|op_sai|Libellé de l'opérateur ayant intégrer le document|character varying(100)| |
|date_sai|Date d'intégration du document|timestamp without time zone| |
|l_type|Code du type de document intégré|character varying(2)| |
|l_prec|Précision sur le document|character varying(50)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ gid avec une séquence d'incrémentation d'un numéro automatique ``an_euep_cc_media_gid_seq``
* Une clé étrangère exsiste sur la table de valeur `lt_euep_doc`

---

   `an_euep_cc_certi_media` : table des médias structurée selon les recommandations de l'éditeur des applications métiers. Elle permet de stocker des documents liés aux diagnostiqueurs (ici documents d'attestation d'assurance ou de formation)
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|gid|Identifiant unique|integer|nextval('m_reseau_humide.an_euep_cc_media_gid_seq'::regclass)|
|id|Identifiant du certificateur|integer| |
|media|Champ Média de GEO|text| |
|miniature|Champ miniature de GEO|bytea| |
|n_fichier|Nom du fichier|text| |
|t_fichier|Type de média dans GEO|text| |
|op_sai|Libellé de l'opérateur ayant intégrer le document|character varying(100)| |
|date_sai|Date d'intégration du document|timestamp without time zone| |
|l_type|Code du type de document (attestation)|character varying(2)| |
|dfin|Date de fin d'attestation|timestamp without time zone| |
|l_prec|Précision sur le document|character varying(50)| |
|l_nom|Nom de la personne à laquelle l'attestation de formation est rattachée|character varying(100)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ gid avec une séquence d'incrémentation d'un numéro automatique ``an_euep_cc_media_gid_seq``
* Une clé étrangère exsiste sur la table de valeur `lt_euep_doc`

---

`log_an_euep_cc` : table de logs permettant de suivre l'ensemble des transactions sur la table an_euep_cc (insert, update). Un contrôle ne peut pas être supprimé, la transaction delele n'est donc pas gérée dans ce cas.

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|  
|gid|identifiant unique|integer| |
|objet|Type de modification (update, delete, insert)|character varying(10)| |
|d_maj|Date de l'exécution de la modification|timestamp without time zone| |
|user|Utilisateur ayant exécuté l'exécution|character varying(50)| |
|relid|ID d'objet de la table qui a causé le déclenchement.|character varying(255)| |
|l_schema|Libellé du schéma contenant la table ou la vue exécutée ou mlodifiée|character varying(30)| |
|l_table|Libellé de la table exécutée|character varying(30)| |
|idgeo|Identifiant unique de l'objet de la table correspondante|character varying(100)| |
|geom|Champ contenant la géométrie des objets polygones modifiés ou supprimés|USER-DEFINED| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ gid avec une séquence d'incrémentation d'un numéro automatique ``log_an_euep_cc_gid_seq``

---

### classes d'objets applicatives :
`xapps_an_euep_cc_nc` : vue attributaire listant l'ensemble des contrôles non conforme (unique) pour les recherches dans l'application métiers et permettre l'édition des courriers

`xapps_geo_v_euep_cc` : vue géographique calculant le nombre de dossier de conformité par adresse et affichant l'état du dernier contrôle (conforme ou non conforme) pour affichage dans l'applicatif métier au niveau de la cartographie et de la fiche d'information par adresse

`xapps_an_v_euep_cc_erreur` : table alphanumérique contenant les messages d'erreurs temporaires renvoyés par le trigger de la vue éditable an_v_euep_cc dans le cas d'une erreur de modifications. Ces messages remontent temporairement dans la fiche du dossier de conformité.

`an_v_euep_cc_media` : vue alphanumérique contenant les champs de la table an_euep_cc_media pour une gestion des droits selon la validation du dossier (cette table est intégrée dans GEO)

Particularité(s) à noter :
* 1 trigger :
  * `t_t1_an_v_euep_cc_media` : gère pour l'instance d'insertion, de mise à jour ou de suppression l'intégration des données dans la classe d'objet `an_euep_cc_media`. Cette vue a été réalisée pour palier le fait que GEO ne gère pas des droits par rapport à une variable qui empêche les insertions, mises à jour ou suppression.
  
    * fonctionnement :
      * à l'entrée : 
        * une variable est calculée pour définir si le contrôle est valide
        * si le contrôle est valide, on ne peut ni insérer, ni mettre à jour, ni supprimer
        * si le contrôle n'est pas valide, on peut insérer, mettre à jour ou supprimer un document

---

## Liste de valeurs

`lt_euep_cc_bien` : Liste des types de bien contrôlé

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|Code interne des types de bien|character(2)| |
|valeur|Libellé des types de bien|character varying(80)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code 

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|00|Non renseigné|
|10|Neuf|
|20|Ancien|

---

`lt_euep_cc_certificateur` : Liste des certificateurs agrées pour les contrôles de conformité assainissement

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|Code interne du donneur d'ordre|integer| |
|valeur|Libellé du donneur d'ordre|character varying(80)| |
|exist|Information sur le prestataire agréé qui excerce toujours ou non (filtre dans GEO (par rapport à la connexion du prestataire) pour afficher la fiche et l'éditer)|boolean|true|
|adresse|Adresse du certificateur agréé|character varying(150)| |
|tel|Téléphone fixe du certificateur agréé|character varying(10)| |
|tel_port|Téléphone portable du certificateur agréé|character varying(10)| |
|email|Email de contact du prestataire|character varying(80)| |
|etat|Etat de la certification (true : agréé, false : plus agréé)|boolean|true|
|siret|N° de SIRET|character varying(14)| |
|nom_assur|Libellé de la compagnie d'assurance|character varying(150)| |
|num_assur|N° de la police d'assurance ou du contrat|character varying(150)| |
|date_assur|Date de fin validé du contrat d'assurance|timestamp without time zone| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code avec une séquence d'incrémentation d'un numéro automatique ``lt_euep_cc_certificateur_code_seq``

Valeurs possibles : données non diffusables pour cette liste pour des raisons de confidentialités des données


---

`lt_euep_cc_eval` : Liste des types de réponse aux questions pour les contrôles de conformité assainissement

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|
|code|Code interne des types de réponse|character(2)| |
|valeur|Libellé des types de réponse|character varying(80)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code 

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|00|Non renseigné (cf formulaire PDF)|
|10|Oui|
|20|Non|
|30|Non visible|
|40|Inconnu|
|ZZ|Sans objet|

---

`lt_euep_cc_ordre` : Liste des donneurs d'ordre pour les contrôles de conformité assainissement

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|
|code|Code interne des types de donneurs d'ordre|character(2)| |
|valeur|Libellé des types de donneurs d'ordre|character varying(80)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code 

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|00|Non renseigné (cf formulaire PDF)|
|10|Propriétaire|
|99|Autre|

---

`lt_euep_cc_pat` : Liste des types de patronyme

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|
|code|Code interne des types de patronyme|character(2)| |
|valeur|Libellé des types de patronyme|character varying(80)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code 

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|00|Non renseigné|
|10|M|
|20|Mme|
|30|M et Mme|
|40|Autre (précisez)|

---

`lt_euep_cc_tnidcc` : Liste des types de suivi des n° dossier pour un nouveau contrôle. Cette table est utilisée pour gérer la constitution d'un nouveau n° de dossier à l'enregistrement

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|
|code|Code interne des types de suivi des n° dossier pour un nouveau contrôle|character(2)| |
|valeur|Libellé des types de suivi des n° dossier pour un nouveau contrôle|character varying(80)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|10|Nouveau dossier|
|20|Suivi du dossier n°|

---

`lt_euep_cc_typebati` : Liste des types de bâtiments pour les contrôles de conformité assainissement

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|
|code|Code interne des types de bâtiments|character(2)| |
|valeur|Libellé des types de bâtiments|character varying(80)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|00|Non renseigné (cf formulaire PDF)|
|10|Maison individuelle|
|20|Appartement|
|21|Immeuble  entier (partie commune)|
|30|Local commercial|
|40|Local agricole|
|99|Autre|

---

`lt_euep_cc_typeres` : Liste des types de réseau raccordé au domaine public pour les contrôles de conformité assainissement

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|
|code|Code interne des types de réseau|character(2)| |
|valeur|Libellé des types de réseau|character varying(80)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|10|Séparatif|
|20|Unitaire|
|30|Sous vide|
|ZZ|Sans objet|

---

`lt_euep_doc` : Liste des types documents joints au dossier de contrôle de conformité assainissement

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|
|code|Code interne des types de documents|character(2)| |
|valeur|Libellé des types de documents|character varying(80)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|00|Non renseigné|
|10|Contrôle de conformité|
|20|Photographies ou planche de photos|
|30|Schéma de l'installation|
|40|Demande de raccordement|
|50|Diagniostic parties communes|
|51|Diagniostic parties privatives|
|99|Autres documents (à préciser ci-dessous)|

---

`lt_euep_doc_certif` : Liste des types d'attestation

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|CCode interne des types de documents|character(2)| |
|valeur|Libellé des types de documents|character varying(80)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code 

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|10|Attestation d'assurance|
|11|Attestation de formation|

---

`lt_euep_sup` : Liste des types de servitude avec une autre propriété

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|
|code|Code interne des types de sevitudes|character(2)| |
|valeur|Libellé des types de servitudes|character varying(80)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|00|Non renseigné (cf formulaire PDF)|
|10|Eaux usées|
|20|Eaux pluviales|
|ZZ|Sans objet|

---

`lt_euep_cc_valid` : Liste des types de validation du contrôle

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|
|code|Code interne des types de validation du contrôle(2)| |
|valeur|Libellé des types de validation du contrôle(80)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code
* La valeur 40 n'est jamais écrite en base. Il sert uniquement temporairement pour supprimer un dossier si elle est sélectionné dans le dossier dans GEO

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|10|Contrôle validé|
|20|Contrôle non vérifié|
|30|Contrôle non validé (modification demandée)|
|40|Contrôle à supprimer|



---

`lt_euep_cc_anomal` : Liste des anomalies relevées lors du contrôle

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|
|code|Code interne des anomalies possibles lors d''un contrôle(2)| |
|valeur|Libellé des anomalies possibles lors d''un contrôle(100)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|1|Maison ou immeuble ou local non raccordé|
|2|Maison ou immeuble ou local partiellement raccordé|
|3|Eaux usées raccordées sur le réseau d'eaux pluviales/ou au milieu naturel|
|4|Eaux pluviales raccordées sur le réseau d'eaux usées (en partie privée)|
|5|Présence d'ancien ouvrage de décantation (fosse septique, bac dégraisseur, etc..)|
|6|Absence d'évent|
|7|Diamètre de l'évent insuffisant|
|8|Event non remonté au faîtage de la maison ou immeuble ou local|
|9|Absence de clapet anti-retour|
|10|Absence de siphon|
|11|Destination des eaux usées indéterminée|
|12|Vidange de piscine raccordée sur le branchement eaux usées|
|13|Eaux pluviales raccordées sur le réseau d'eaux usées (en partie publique)|
|14|Absence de bac dégraisseur|
|15|Servitude sans documents|
|16|Vidange de piscine raccordée sur réseau d'eaux pluviales|


---

## Projet QGIS pour la gestion

Aucun projet QGIS a été réalisé pour la gestion interne des données.


## Export Open Data

Sans objet

---

## Modèle conceptuel simplifié

![mcd](img/MCD_v2.png)



