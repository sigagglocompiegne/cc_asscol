# Fiche technique de la base de données #

## Principes
  * **généralité** :
 les contrôles de conformité pour l'assainissement collectif sont gérés par le service Assainissement de l'Agglomération de la Région de Compiègne et délégués à 8 prestataires agréés en 2018. A chaque réalisation d'une nouvelle construction ou d'une vente d'un bien ancien, un contrôle est rendu obligatoire. Ce contrôle est valable 2 ans pour un bien ancien en maison individuelle et 5 ans pour un appartement. Ces contrôles sont effectués par un des organismes agréés et le formulaire est envoyé au service  Asainissement pour validation. Une fois validé le contrôle est envoyé au propriétaire via le prestataire. Si ce contrôle est non conforme, le propriétaire doit effectuer la remise en conformité. Un nouveau contrôle est réalisé après ses travaux.
 
 * **résumé fonctionnel** :
 les données des contrôles de conformité sont localisées à l'adresse postale du bien contrôlé. La classe d'objets des points d'adresse de la BAL de l'Agglomération est donc utilisée pour la primitive géographique. Seuls les données métiers des contrôles font l'objet d'un stockage dans des classes d'objets non géographiques. Cette donnée métier est donc urbanisée avec la donnée adresse. Une des particularités de cette donnée, est qu'il faut en assurer un suivi chronologique. On doit pouvoir à une adresse donnée, visualiser et consulter l'ensemble des contrôles déjà réalisés et ceux en cours.
 

## Classe d'objets

L'ensemble des classes d'objets de gestion sont stockés dans le schéma m_reseau_humide et celles applicatives dans le schéma x_apps.

 * gestion :
   * **an_euep_cc** : table des attributs métiers permettant de gérer l'ensemble des éléments d'un contrôle de conformité.
   
|Nom attribut | Définition | Type | Contraintes |
|:---|:---|:---|:---|
|idcc|Identifiant interne unique du contrôle|integernextval('m_reseau_humide.an_euep_cc_idcc_seq'::regclass)|
|id_adresse|Identifiant unique de l'objet point adresse (issu de la BAL)|bigint |
|ccvalid|validation par l'ARC du contrôle (la valeur true empêche la modification des données|booleanfalse|
|ccinit|information sur le fait que ce contrôle soit le contrôle initial dans le cas de contrôle supplémentaire suite à une non conformité|booleanfalse|
|adapt|Complément de l'adresse avec le n° d'appartement dans le cadre d'un immeuble collectif|character varying(20) |
|adeta|Etage|integer |
|tnidcc|Type de dossier pour lacréation d'un nouveau contrôle (clé étrangère sur la liste de valeur lt_euep_cc_tnidcc)|character varying(2) |
|nidcc|N° de dossier du contrôle (ce numéro suit pour une vérification en cas de non conformité)|character varying(20) |
|rcc|Résultat du contrôle (true : conforme, false : non conforme)|character varying(3) |
|ccdate|Date du contrôle|timestamp without time zone |
|ccdated|Date de délivrance du contrôle|timestamp without time zone |
|ccbien|Code du type de bien contrôlé (neuf ou ancien) (clé étrangère sur la liste de valeur lt_euep_cc_bien)|character varying(2)'00'::character varying|
|certtype|Code de l'organisme certificateur agréé (clé étrangère sur la liste de valeur lt_euep_cc_certificateur)|integer |
|certnom|Nom de la personne appartenant à l'organisme certificateur agréé qui a fait le contrôle|character varying(80) |
|certpre|Prénom de la personne appartenant à l'organisme certificateur agréé qui a fait le contrôle|character varying(80) |
|propriopat|Patronyme du propriétaire (clé étrangère sur la liste de valeur lt_euep_cc_pat)|character varying(2)'00'::character varying|
|propriopatp|Patronyme du propriétaire (précision si autre renseigné dans propriopat)|character varying(50) |
|proprionom|Nom de la personne désignant le propriétaire|character varying(80) |
|propriopre|Prénom de la personne désignant le propriétaire|character varying(80) |
|proprioad|Adresse de la personne désignant le propriétaire|character varying(254) |
|dotype|Code de la qualité du donneur d'ordre (clé étrangère sur la liste de valeur lt_euep_cc_ordre)|character varying(2)'00'::character varying|
|doaut|Autre donneur d'ordre si pas présent dans dotype|character varying(80) |
|donom|Nom de la personne désignant le donneur d'ordre|character varying(80) |
|dopre|Prénom de la personne désignant le donneur d'ordre|character varying(80) |
|doad|Adresse de la personne désignant le donneur d'ordre|character varying(80) |
|achetpat|Patronyme de l'acheteur (clé étrangère sur la liste de valeur lt_euep_cc_pat)|character varying(2)'00'::character varying|
|achetpatp|Patronyme de l'acheteur (précision si autre renseigné dans achetpat)|character varying(50) |
|achetnom|Nom de la personne désignant l'acheteur|character varying(80) |
|achetpre|Prénom de la personne désignant l'acheteur|character varying(80) |
|achetad|Adresse de la personne désignant l'acheteur|character varying(80) |
|batitype|Code du type de bâtiment concerné par le contrôle (clé étrangère sur la liste de valeur lt_euep_cc_typebati)|character varying(2)'00'::character varying|
|batiaut|Autre type de bâtiment si pas présent dans batitype|character varying(80) |
|eppublic|Desservie par un réseau public d'eau potable (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|epaut|Autre alimentation que le réseau d'eau potable public|character varying(80) |
|rredptype|Code du type de réseau de raccordement au domaine publique (clé étrangère sur la liste de valeur lt_euep_cc_typeres)|character varying(2)'ZZ'::character varying|
|rrebrtype|Information sur l'existence d'une boîte de raccordement (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|rrechype|Information sur l'existence d'un regard sous chaussée si pas de boîte de raccordement (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|eupc|Information sur l'existence d'un raccordement sur les parties communes (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|euevent|Information sur l'existence d'un évent (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|euregar|Information sur l'existence d'un regard (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|euregardp|Information sur l'existence d'un regard accessible dans le domaine privé (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|eusup|Information sur l'existence d'une servitude avec une autre propriété pour les EU ou les EP (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|eusuptype|Précision du réseau en cas de servitude avec une autre propriété (clé étrangère sur la liste de valeur lt_euep_sup)|character varying(2)'ZZ'::character varying|
|eusupdoc|Information sur l'existence de documents attestant la servitude avec une autre propriété pour les EU ou les EP (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|euecoul|Information le bon déroulé de l'écoulement (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|eufluo|Information l'existence d'un test à la fluorescéine (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|eubrsch|Information sur l'existence d'un branchement sous chaussée (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|eurefl|Information sur la protection du branchement par un système d'anti reflux (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|euepsep|Information sur la séparation de la collecte des EP et EU (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|eudivers|Autres informations sur la collecte des eaux usées|character varying(500) |
|euanomal|Information sur la présence d'anomalies constatées (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|euobserv|Précisions sur les anomalies constatées sur la collecte des eaux usées|character varying(500) |
|eusiphon|Présence de syphons sur chaque évacuation contrôlée (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|epdiagpc|Diagnostic réalisé sur les parties communes (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|epracpc|Raccordement sur les parties communes (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|epregarcol|Existence d'une regard de collecte (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|epregarext|Regard de collecte à l'extérieur de l'habitation (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|epracdp|Raccordement au réseau public d'évacuation des eaux pluviales (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|eppar|Eaux pluviales traitées à la parcelle (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|epparpre|Précision sur le traitement des eaux pluviales à la parcelle si existe|character varying(200) |
|epfum|Test à la fummée réalisée (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|epecoul|Ecoulement correct (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|epecoulobs|Observation sur l'écoulement (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(500) |
|eprecup|Système de récupération des eaux pluviales (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|eprecupcpt|Compteur présent en cas de récupération des eaux pluviales à usage domestique (clé étrangère sur la liste de valeur lt_euep_cc_eval)|character varying(2)'ZZ'::character varying|
|epautre|Autre|character varying(200) |
|epobserv|Observations diverses sur la collecte des eaux usées|character varying(200) |
|euepanomal|Anomalies identifiées entrainant la non conformité|character varying(1000) |
|euepdivers|Constatations diverses|character varying(1000) |
|date_sai|Date de saisie|timestamp without time zone |
|date_maj|Datede mise à jour|timestamp without time zone |
|op_sai|Opérateur de saisie|character varying(80) |
|scr_geom|Source du référentiel géographique de saisie|character varying(2) |

   
   
   * **log_an_euep_cc** : table de logs permettant de suivre l'ensemble des transactions sur la table an_euep_cc (insert, update). Un contrôle ne peut pas être supprimé, la transaction delele n'est donc pas gérée dans ce cas.
 
   * **an_v_euep_cc** : vue attributaire éditable (contenant le point d''adresse qui est lui non éditable) récupérant l''ensemble des contrôles triés par date pour leur gestion dans l'application métier
 
 * applicative :
   * **xapps_an_euep_cc_nc** : vue attributaire listant l'ensemble des contrôles non conforme (unique) pour les recherches dans l'application métiers et permettre l'édition des courriers
   * **xapps_geo_v_euep_cc** : vue géographique calculant le nombre de dossier de conformité par adresse et affichant l'état du dernier contrôle (conforme ou non conforme) pour affichage dans l'applicatif métier au niveau de la cartographie et de la fiche d'information par adresse

## Liste de valeurs

 * 

## Schéma fonctionnel
