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
   
   |Nom attribut | Définition | Type | Valeurs | Contraintes |
   |:------------|:-----------|:-----|:--------|:------------|
   |idcc| |integer| |nextval('m_reseau_humide.an_euep_cc_idcc_seq'::regclass)|
|id_adresse| |bigint| | |
|ccvalid| |boolean| |false|
|ccinit| |boolean| |false|
|adapt| |character varying(20)| | |
|adeta| |integer| | |
|tnidcc| |character varying(2)| | |
|nidcc| |character varying(20)| | |
|rcc| |character varying(3)| | |
|ccdate| |timestamp without time zone| | |
|ccdated| |timestamp without time zone| | |
|ccbien| |character varying(2)| |'00'::character varying|
|certtype| |integer| | |
|certnom| |character varying(80)| | |
|certpre| |character varying(80)| | |
|propriopat| |character varying(2)| |'00'::character varying|
|propriopatp| |character varying(50)| | |
|proprionom| |character varying(80)| | |
|propriopre| |character varying(80)| | |
|proprioad| |character varying(254)| | |
|dotype| |character varying(2)| |'00'::character varying|
|doaut| |character varying(80)| | |
|donom| |character varying(80)| | |
|dopre| |character varying(80)| | |
|doad| |character varying(80)| | |
|achetpat| |character varying(2)| |'00'::character varying|
|achetpatp| |character varying(50)| | |
|achetnom| |character varying(80)| | |
|achetpre| |character varying(80)| | |
|achetad| |character varying(80)| | |
|batitype| |character varying(2)| |'00'::character varying|
|batiaut| |character varying(80)| | |
|eppublic| |character varying(2)| |'ZZ'::character varying|
|epaut| |character varying(80)| | |
|rredptype| |character varying(2)| |'ZZ'::character varying|
|rrebrtype| |character varying(2)| |'ZZ'::character varying|
|rrechype| |character varying(2)| |'ZZ'::character varying|
|eupc| |character varying(2)| |'ZZ'::character varying|
|euevent| |character varying(2)| |'ZZ'::character varying|
|euregar| |character varying(2)| |'ZZ'::character varying|
|euregardp| |character varying(2)| |'ZZ'::character varying|
|eusup| |character varying(2)| |'ZZ'::character varying|
|eusuptype| |character varying(2)| |'ZZ'::character varying|
|eusupdoc| |character varying(2)| |'ZZ'::character varying|
|euecoul| |character varying(2)| |'ZZ'::character varying|
|eufluo| |character varying(2)| |'ZZ'::character varying|
|eubrsch| |character varying(2)| |'ZZ'::character varying|
|eurefl| |character varying(2)| |'ZZ'::character varying|
|euepsep| |character varying(2)| |'ZZ'::character varying|
|eudivers| |character varying(500)| | |
|euanomal| |character varying(2)| |'ZZ'::character varying|
|euobserv| |character varying(500)| | |
|eusiphon| |character varying(2)| |'ZZ'::character varying|
|epdiagpc| |character varying(2)| |'ZZ'::character varying|
|epracpc| |character varying(2)| |'ZZ'::character varying|
|epregarcol| |character varying(2)| |'ZZ'::character varying|
|epregarext| |character varying(2)| |'ZZ'::character varying|
|epracdp| |character varying(2)| |'ZZ'::character varying|
|eppar| |character varying(2)| |'ZZ'::character varying|
|epparpre| |character varying(200)| | |
|epfum| |character varying(2)| |'ZZ'::character varying|
|epecoul| |character varying(2)| |'ZZ'::character varying|
|epecoulobs| |character varying(500)| | |
|eprecup| |character varying(2)| |'ZZ'::character varying|
|eprecupcpt| |character varying(2)| |'ZZ'::character varying|
|epautre| |character varying(200)| | |
|epobserv| |character varying(200)| | |
|euepanomal| |character varying(1000)| | |
|euepdivers| |character varying(1000)| | |
|date_sai| |timestamp without time zone| | |
|date_maj| |timestamp without time zone| | |
|op_sai| |character varying(80)| | |
|scr_geom| |character varying(2)| | |
   
   
   * **log_an_euep_cc** : table de logs permettant de suivre l'ensemble des transactions sur la table an_euep_cc (insert, update). Un contrôle ne peut pas être supprimé, la transaction delele n'est donc pas gérée dans ce cas.
 
   * **an_v_euep_cc** : vue attributaire éditable (contenant le point d''adresse qui est lui non éditable) récupérant l''ensemble des contrôles triés par date pour leur gestion dans l'application métier
 
 * applicative :
   * **xapps_an_euep_cc_nc** : vue attributaire listant l'ensemble des contrôles non conforme (unique) pour les recherches dans l'application métiers et permettre l'édition des courriers
   * **xapps_geo_v_euep_cc** : vue géographique calculant le nombre de dossier de conformité par adresse et affichant l'état du dernier contrôle (conforme ou non conforme) pour affichage dans l'applicatif métier au niveau de la cartographie et de la fiche d'information par adresse

## Liste de valeurs

 * 

## Schéma fonctionnel
