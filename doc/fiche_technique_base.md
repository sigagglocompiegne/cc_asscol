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

   
   
   * **log_an_euep_cc** : table de logs permettant de suivre l'ensemble des transactions sur la table an_euep_cc (insert, update). Un contrôle ne peut pas être supprimé, la transaction delele n'est donc pas gérée dans ce cas.
 
   * **an_v_euep_cc** : vue attributaire éditable (contenant le point d''adresse qui est lui non éditable) récupérant l''ensemble des contrôles triés par date pour leur gestion dans l'application métier
 
 * applicative :
   * **xapps_an_euep_cc_nc** : vue attributaire listant l'ensemble des contrôles non conforme (unique) pour les recherches dans l'application métiers et permettre l'édition des courriers
   * **xapps_geo_v_euep_cc** : vue géographique calculant le nombre de dossier de conformité par adresse et affichant l'état du dernier contrôle (conforme ou non conforme) pour affichage dans l'applicatif métier au niveau de la cartographie et de la fiche d'information par adresse

## Liste de valeurs

 * 

## Schéma fonctionnel
