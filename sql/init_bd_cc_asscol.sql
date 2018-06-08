-- ######################################################## SUIVI CODE SQL #########################################################################

-- 2018/02/01 : GB / initialisation du squelette de la structure dans la base de données pour gérer le suivi des contrôles de conformité
--		GB / la donnée métier s'appuie sur le référentiel de voies et adresses locales (BAL) de l'ARC pour la localisation des contrôles
-- 2018/03/22 : GB / ajout d'une table de log
-- 2018/05/25 : GB / modification suite 1er test de l'application (ajout d'un type de validation et d'une liste d'anomalie avec un champ de précision 
--	             pour les anomalies nécessaire
--		     Le champ ccvalid devient un charactère (et non plus booléen) avec une clé étrangère sur le liste de valeur
--                   Ajout d'une liste de valeur anomalie et stade de validation
--                   Ajout d'un enregistrement dans la liste des prestataires
-- #################################################################################################################################################



-- ############################################################ SCHEMA #############################################################################

-- Intégrer au schéma m_reseau_humide


-- COMMENT GB : -----------------------------------------------------------------------------------------------------------------------------------------------------
-- suppression des clés étrangères si elles existent avant de reconstituer le modèle
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
BEGIN;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_certificateur_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_bien_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_tnidcc_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_pat_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_ordre_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_typebati_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_typeres_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_valid_fkey;

ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_rrebrtype_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_rrechype_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eupc_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_euevent_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_euregar_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_euregardp_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eusup_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_sup_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eusupdoc_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_euecoul_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eufluo_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eubrsch_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eurefl_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_euepsep_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_euanomal_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eusiphon_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_epdiagpc_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_epracpc_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_epregarcol_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_epregarext_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_epracdp_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eppublic_fkey;

ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eppar_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_epfum_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_epecoul_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eprecup_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eprecupcpt_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc_media DROP CONSTRAINT IF EXISTS lt_euep_doc_fkey;



ALTER TABLE IF EXISTS m_reseau_humide.lt_euep_cc_certificateur DROP CONSTRAINT lt_euep_cc_certificateur_pkey;
ALTER TABLE IF EXISTS m_reseau_humide.lt_euep_cc_ordre DROP CONSTRAINT IF EXISTS lt_euep_cc_ordre_pkey;
ALTER TABLE IF EXISTS m_reseau_humide.lt_euep_cc_typebati DROP CONSTRAINT IF EXISTS lt_euep_cc_typebati_pkey;
ALTER TABLE IF EXISTS m_reseau_humide.lt_euep_cc_typeres DROP CONSTRAINT IF EXISTS lt_euep_cc_typeres_pkey;
ALTER TABLE IF EXISTS m_reseau_humide.lt_euep_sup DROP CONSTRAINT IF EXISTS lt_euep_sup_pkey;
ALTER TABLE IF EXISTS m_reseau_humide.lt_euep_cc_eval DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_pkey;
ALTER TABLE IF EXISTS m_reseau_humide.lt_euep_cc_tnidcc DROP CONSTRAINT IF EXISTS lt_euep_cc_tnidcc_pkey;
ALTER TABLE IF EXISTS m_reseau_humide.lt_euep_cc_valid DROP CONSTRAINT IF EXISTS lt_euep_cc_valid_pkey;
ALTER TABLE IF EXISTS m_reseau_humide.lt_euep_cc_anomal DROP CONSTRAINT IF EXISTS lt_euep_cc_anomal_pkey;

DROP VIEW IF EXISTS x_apps.xapps_geo_v_euep_cc;
DROP VIEW IF EXISTS x_apps.xapps_an_euep_cc;
DROP VIEW IF EXISTS x_apps.xapps_an_euep_cc_nc;
DROP VIEW IF EXISTS m_reseau_humide.an_v_euep_cc;
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                  DOMAINES DE VALEURS                                                         ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################



-- COMMENT GB : ------------------------------------------------------------------------------------------------------------------
-- Création d'une séquence ici pour gérer les insertions de nouveaux certificateurs par le service gestionnaire possible dans GEO)
-- -------------------------------------------------------------------------------------------------------------------------------

-- Table: m_reseau_humide.lt_euep_cc_certificateur

DROP TABLE IF EXISTS m_reseau_humide.lt_euep_cc_certificateur;

CREATE TABLE m_reseau_humide.lt_euep_cc_certificateur
(
  code integer NOT NULL DEFAULT nextval('m_reseau_humide.lt_euep_cc_certificateur_code_seq'::regclass),
  valeur character varying(80) NOT NULL,
  exist boolean DEFAULT TRUE,
  adresse character varying(150),
  tel character varying(10),
  tel_port character varying(10),
  email character varying(80),
  etat boolean NOT NULL DEFAULT true,
  siret character varying(14),
  nom_assur character varying(150),
  num_assur character varying(150),
  date_assur timestamp without time zone,
  CONSTRAINT lt_euep_cc_certificateur_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.lt_euep_cc_certificateur
  OWNER TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_certificateur TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_certificateur TO groupe_sig;
COMMENT ON TABLE m_reseau_humide.lt_euep_cc_certificateur
  IS 'Liste des certificateurs agrées pour les contrôles de conformité assainissement';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_certificateur.code IS 'Code interne du certificateur agréé';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_certificateur.valeur IS 'Libellé du certificateur agréé';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_certificateur.exist IS 'Information sur le prestataire agréé qui excerce toujours ou non (filtre dans GEO (par rapport à la connexion du prestataire) pour afficher la fiche et l''éditer)';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_certificateur.adresse IS 'Adresse du certificateur agréé';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_certificateur.tel IS 'Téléphone fixe du certificateur agréé';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_certificateur.tel_port IS 'Téléphone portable du certificateur agréé';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_certificateur.email IS 'Email de contact du prestataire';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_certificateur.etat IS 'Etat de la certification (true : agréé, false : plus agréé)';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_certificateur.siret IS 'N° de SIRET';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_certificateur.nom_assur IS 'Libellé de la compagnie d''assurance';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_certificateur.num_assur IS 'N° de la police d''assurance ou du contrat';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_certificateur.date_assur IS 'Date de fin validé du contrat d''assurance';

-- la liste des valeurs intégrables n'est pas inséréde ici pour des raisons de confidentialités. Cette liste est disponible dans le fichier insert_certificateur.sql dans le répertoire métier correspondant.


-- Sequence: m_reseau_humide.lt_euep_cc_certificateur_code_seq

DROP SEQUENCE IF EXISTS m_reseau_humide.lt_euep_cc_certificateur_code_seq CASCADE;

CREATE SEQUENCE m_reseau_humide.lt_euep_cc_certificateur_code_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 11
  CACHE 1;
ALTER TABLE m_reseau_humide.lt_euep_cc_certificateur
  OWNER TO postgres;

-- ################################################################# Domaine valeur - lt_euep_cc_ordre #############################################

-- Table: m_reseau_humide.lt_euep_cc_ordre

DROP TABLE IF EXISTS m_reseau_humide.lt_euep_cc_ordre;

CREATE TABLE m_reseau_humide.lt_euep_cc_ordre
(
  code character(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_euep_cc_ordre_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.lt_euep_cc_ordre
  OWNER TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_ordre TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_ordre TO groupe_sig;
COMMENT ON TABLE m_reseau_humide.lt_euep_cc_ordre
  IS 'Liste des donneurs d''ordre pour les contrôles de conformité assainissement';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_ordre.code IS 'Code interne du donneur d''ordre';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_ordre.valeur IS 'Libellé du donneur d''ordre';

INSERT INTO m_reseau_humide.lt_euep_cc_ordre(
            code, valeur)
    VALUES
    ('00','Non renseigné (cf formulaire PDF)'),
    ('10','Propriétaire'),
    ('99','Autre')
    ;


-- ################################################################# Domaine valeur - lt_euep_cc_typebati #############################################

-- Table: m_reseau_humide.lt_euep_cc_typebati

DROP TABLE IF EXISTS m_reseau_humide.lt_euep_cc_typebati;

CREATE TABLE m_reseau_humide.lt_euep_cc_typebati
(
  code character(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_euep_cc_typebati_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.lt_euep_cc_typebati
  OWNER TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_typebati TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_typebati TO groupe_sig;
COMMENT ON TABLE m_reseau_humide.lt_euep_cc_typebati
  IS 'Liste des types de bâtiments pour les contrôles de conformité assainissement';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_typebati.code IS 'Code interne des types de bâtiments';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_typebati.valeur IS 'Libellé des types de bâtiments';

INSERT INTO m_reseau_humide.lt_euep_cc_typebati(
            code, valeur)
    VALUES
    ('00','Non renseigné (cf formulaire PDF)'),
    ('10','Maison individuelle'),
    ('20','Appartement'),
    ('30','Local commercial'),
    ('40','Local agricole'),
    ('99','Autre')
    ;


-- ################################################################# Domaine valeur - lt_euep_cc_typeres #############################################

-- Table: m_reseau_humide.lt_euep_cc_typeres

DROP TABLE IF EXISTS m_reseau_humide.lt_euep_cc_typeres;

CREATE TABLE m_reseau_humide.lt_euep_cc_typeres
(
  code character(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_euep_cc_typeres_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.lt_euep_cc_typeres
  OWNER TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_typeres TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_typeres TO groupe_sig;
COMMENT ON TABLE m_reseau_humide.lt_euep_cc_typeres
  IS 'Liste des types de réseau raccordé au domaine public pour les contrôles de conformité assainissement';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_typeres.code IS 'Code interne des types de réseau';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_typeres.valeur IS 'Libellé des types de réseau';

INSERT INTO m_reseau_humide.lt_euep_cc_typeres(
            code, valeur)
    VALUES
    ('10','Séparatif'),
    ('20','Unitaire'),
    ('30','Sous vide'),
    ('ZZ','Sans objet')
    ;


-- ################################################################# Domaine valeur - lt_euep_cc_eval #############################################

-- Table: m_reseau_humide.lt_euep_cc_eval

DROP TABLE IF EXISTS m_reseau_humide.lt_euep_cc_eval;

CREATE TABLE m_reseau_humide.lt_euep_cc_eval
(
  code character(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_euep_cc_eval_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.lt_euep_cc_eval
  OWNER TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_eval TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_eval TO groupe_sig;
COMMENT ON TABLE m_reseau_humide.lt_euep_cc_eval
  IS 'Liste des types de réponse aux questions pour les contrôles de conformité assainissement';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_eval.code IS 'Code interne des types de réponse';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_eval.valeur IS 'Libellé des types de réponse';

INSERT INTO m_reseau_humide.lt_euep_cc_eval(
            code, valeur)
    VALUES
    ('00','Non renseigné (cf formulaire PDF)'),
    ('10','Oui'),
    ('20','Non'),
    ('30','Non visible'),
    ('ZZ','Sans objet')
    ;


-- ################################################################# Domaine valeur - lt_euep_sup #############################################

-- Table: m_reseau_humide.lt_euep_sup

DROP TABLE IF EXISTS m_reseau_humide.lt_euep_sup;

CREATE TABLE m_reseau_humide.lt_euep_sup
(
  code character(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_euep_sup_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.lt_euep_sup
  OWNER TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_sup TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_sup TO groupe_sig;
COMMENT ON TABLE m_reseau_humide.lt_euep_sup
  IS 'Liste des types de servitude avec une autre propriété';
COMMENT ON COLUMN m_reseau_humide.lt_euep_sup.code IS 'Code interne des types de sevitudes';
COMMENT ON COLUMN m_reseau_humide.lt_euep_sup.valeur IS 'Libellé des types de servitudes';

INSERT INTO m_reseau_humide.lt_euep_sup(
            code, valeur)
    VALUES
    ('00','Non renseigné (cf formulaire PDF)'),
    ('10','Eaux usées'),
    ('20','Eaux pluviales'),
    ('ZZ','Sans objet')
    ;

-- ################################################################# Domaine valeur - lt_euep_cc_bien #############################################

-- Table: m_reseau_humide.lt_euep_cc_bien

DROP TABLE IF EXISTS m_reseau_humide.lt_euep_cc_bien;

CREATE TABLE m_reseau_humide.lt_euep_cc_bien
(
  code character(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_euep_cc_bien_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.lt_euep_cc_bien
  OWNER TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_bien TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_bien TO groupe_sig;
COMMENT ON TABLE m_reseau_humide.lt_euep_cc_bien
  IS 'Liste des types de bien contrôlé';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_bien.code IS 'Code interne des types de bien';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_bien.valeur IS 'Libellé des types de bien';

INSERT INTO m_reseau_humide.lt_euep_cc_bien(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Neuf'),
    ('20','Ancien')
    ;

-- ################################################################# Domaine valeur - lt_euep_cc_pat #############################################

-- Table: m_reseau_humide.lt_euep_cc_pat

DROP TABLE IF EXISTS m_reseau_humide.lt_euep_cc_pat;

CREATE TABLE m_reseau_humide.lt_euep_cc_pat
(
  code character(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_euep_cc_pat_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.lt_euep_cc_pat
  OWNER TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_pat TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_pat TO groupe_sig;
COMMENT ON TABLE m_reseau_humide.lt_euep_cc_pat
  IS 'Liste des types de patronyme';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_pat.code IS 'Code interne des types de patronyme';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_pat.valeur IS 'Libellé des types de patronyme';

INSERT INTO m_reseau_humide.lt_euep_cc_pat(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','M'),
    ('20','Mme'),
    ('30','M et Mme'),
    ('40','Autre (précisez)')
    ;


-- ################################################################# Domaine valeur - lt_euep_doc #############################################

-- Table: m_reseau_humide.lt_euep_doc

DROP TABLE IF EXISTS m_reseau_humide.lt_euep_doc;

CREATE TABLE m_reseau_humide.lt_euep_doc
(
  code character(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_euep_doc_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.lt_euep_doc
  OWNER TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_doc TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_doc TO groupe_sig;
COMMENT ON TABLE m_reseau_humide.lt_euep_doc
  IS 'Liste des types documents joints au dossier de contrôle de conformité assainissement';
COMMENT ON COLUMN m_reseau_humide.lt_euep_doc.code IS 'Code interne des types de documents';
COMMENT ON COLUMN m_reseau_humide.lt_euep_doc.valeur IS 'Libellé des types de documents';

INSERT INTO m_reseau_humide.lt_euep_doc(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Contrôle de conformité'),
    ('20','Photographies ou planche de photos'),
    ('30','Schéma de l''installation'),
    ('40','Demande de raccordement'),
    ('50','Diagniostic parties communes'),
    ('51','Diagniostic parties privatives'),
    ('99','Autres documents (à préciser ci-dessous)')
    ;

-- ################################################################# Domaine valeur - lt_euep_cc_tnidcc #############################################

-- Table: m_reseau_humide.lt_euep_cc_tnidcc

DROP TABLE IF EXISTS m_reseau_humide.lt_euep_cc_tnidcc;

CREATE TABLE m_reseau_humide.lt_euep_cc_tnidcc
(
  code character(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_euep_cc_tnidcc_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.lt_euep_cc_tnidcc
  OWNER TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_tnidcc TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_tnidcc TO groupe_sig;
COMMENT ON TABLE m_reseau_humide.lt_euep_cc_tnidcc
  IS 'Liste des types de suivi des n° dossier pour un nouveau contrôle';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_tnidcc.code IS 'Code interne des types de suivi des n° dossier pour un nouveau contrôle';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_tnidcc.valeur IS 'Libellé des types de suivi des n° dossier pour un nouveau contrôle';

INSERT INTO m_reseau_humide.lt_euep_cc_tnidcc(
            code, valeur)
    VALUES
    ('10','Nouveau dossier'),
    ('20','Suivi du dossier n°')
    ;
    
-- ################################################################# Domaine valeur - lt_euep_cc_valid #############################################

-- Table: m_reseau_humide.lt_euep_cc_valid

DROP TABLE IF EXISTS m_reseau_humide.lt_euep_cc_valid;

CREATE TABLE m_reseau_humide.lt_euep_cc_valid
(
  code character(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_euep_cc_valid_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.lt_euep_cc_valid
  OWNER TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_valid TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_valid TO groupe_sig;
COMMENT ON TABLE m_reseau_humide.lt_euep_cc_valid
  IS 'Liste des types de validation du contrôle';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_valid.code IS 'Code interne des types de validation du contrôle';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_valid.valeur IS 'Libellé des types de validation du contrôle';

INSERT INTO m_reseau_humide.lt_euep_cc_valid(
            code, valeur)
    VALUES
    ('10','Contrôle validé'),
    ('20','Contrôle non vérifié'),
    ('30','Contrôle non validé (modification demandée)')
    ;
    
-- ################################################################# Domaine valeur - lt_euep_cc_anomal #############################################

-- Sequence: m_reseau_humide.lt_euep_cc_anomal_seq

DROP SEQUENCE IF EXISTS m_reseau_humide.lt_euep_cc_anomal_seq CASCADE;

CREATE SEQUENCE m_reseau_humide.lt_euep_cc_anomal_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 11
  CACHE 1;
ALTER TABLE m_reseau_humide.lt_euep_cc_anomal_seq
  OWNER TO postgres;
GRANT ALL ON SEQUENCE m_reseau_humide.lt_euep_cc_anomal_seq TO postgres;
GRANT ALL ON SEQUENCE m_reseau_humide.lt_euep_cc_anomal_seq TO groupe_sig;


-- Table: m_reseau_humide.lt_euep_cc_anomal

DROP TABLE IF EXISTS m_reseau_humide.lt_euep_cc_anomal;

CREATE TABLE m_reseau_humide.lt_euep_cc_anomal
(
  code integer NOT NULL DEFAULT nextval('m_reseau_humide.lt_euep_cc_anomal_seq'::regclass),
  valeur character varying(100) NOT NULL,
  CONSTRAINT lt_euep_cc_anomal_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.lt_euep_cc_anomal
  OWNER TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_anomal TO postgres;
GRANT SELECT, INSERT ON TABLE m_reseau_humide.lt_euep_cc_anomal TO groupe_sig;
COMMENT ON TABLE m_reseau_humide.lt_euep_cc_anomal
  IS 'Liste des types de validation du contrôle';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_anomal.code IS 'Code interne des anomalies possibles lors d''un contrôle';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_anomal.valeur IS 'Libellé des anomalies possibles lors d''un contrôle';

INSERT INTO m_reseau_humide.lt_euep_cc_anomal(
            code, valeur)
    VALUES
    (1,'Maison ou immeuble ou local non raccordé'),
    (2,'Maison ou immeuble ou local partiellement raccordé'),
    (3,'Eaux usées raccordées sur le réseau d''eaux pluviales/ou au milieu naturel'),
    (4,'Eaux pluviales raccordées sur le réseau d''eaux usées (en partie privée)'),
    (5,'Présence d''ancien ouvrage de décantation (fosse septique, bac dégraisseur, etc..)'),
    (6,'Absence d''évent'),
    (7,'Diamètre de l''évent insuffisant'),
    (8,'Event non remonté au faîtage de la maison ou immeuble ou local'),
    (9,'Absence de clapet anti-retour'),
    (10,'Absence de siphon')
    ;

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                  TABLES METIERS CONTROLE DE CONFORMITE                                                       ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- COMMENT GB : -----------------------------------------------------------------------------------------------------------------------------------------------------
-- Création d'une séquence ici pour gérer les dossiers de contrôles interne sachant que le n° de dossier peut être utiliser plus d'une fois si contrôle non conforme
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ########################################################################## table an_euep_cc #######################################################


-- Sequence: m_reseau_humide.lt_euep_cc_certificateur_code_seq

DROP SEQUENCE IF EXISTS m_reseau_humide.an_euep_cc_idcc_seq CASCADE;

CREATE SEQUENCE m_reseau_humide.an_euep_cc_idcc_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE m_reseau_humide.an_euep_cc
  OWNER TO postgres;

-- Table: m_reseau_humide.an_euep_cc

DROP TABLE IF EXISTS m_reseau_humide.an_euep_cc;

CREATE TABLE m_reseau_humide.an_euep_cc
(
  idcc integer NOT NULL DEFAULT nextval('m_reseau_humide.an_euep_cc_idcc_seq'::regclass), -- Identifiant interne unique du contrôle
  id_adresse bigint NOT NULL, -- Identifiant unique de l'objet point adresse (issu de la BAL)
  ccvalid character varying(2) DEFAULT '20', -- validation par l'ARC du contrôle (la valeur 10 empêche la modification des données)
  validobs character varying(1000), -- commentaire sur les demandes de modifications (uniquement si ccvalid = 30)
  ccinit boolean DEFAULT FALSE, -- information sur le fait que ce contrôle soit le contrôle initial à l'adresse
  adapt character varying(20), -- Complément de l'adresse avec le n° d'appartement dans le cadre d'un immeuble collectif
  adeta integer, -- Etage
  tnidcc character varying(2), -- Type de dossier pour la création d'un nouveau contrôle (clé étrangère sur la liste de valeur lt_euep_cc_tnidcc)
  nidcc character varying(20) NOT NULL, -- N° de dossier du contrôle (ce numéro suit pour une vérification en cas de non conformité)
  rcc character varying(3) NOT NULL, -- Résultat du contrôle (oui : conforme, non : non conforme, inconnu ?)
  ccdate timestamp without time zone, -- Date du contrôle
  ccdated timestamp without time zone, -- Date de délivrance du contrôle
  ccbien character varying(2) DEFAULT '00'::character varying, -- Code du type de bien contrôlé (neuf ou ancien)
  certtype integer, -- Code de l'organisme certificateur agréé (clé étrangère sur la liste de valeur lt_euep_cc_certificateur)
  certnom character varying(80), -- Nom de la personne appartenant à l'organisme certificateur agréé qui a fait le contrôle
  certpre character varying(80), -- Prénom de la personne appartenant à l'organisme certificateur agréé qui a fait le contrôle
  propriopat character varying(2) DEFAULT '00'::character varying, -- Patronyme du propriétaire (clé étrangère sur la liste de valeur lt_euep_cc_pat)
  propriopatp character varying(50), -- Patronyme du propriétaire précision si autre choisi dans propriopat
  proprionom character varying(80), -- Nom de la personne désignant le propriétaire
  propriopre character varying(80), -- Prénom de la personne désignant le propriétaire
  proprioad character varying(254), -- Adresse de la personne désignant le propriétaire
  dotype character varying(2) DEFAULT '00'::character varying, -- Code de la qualité du donneur d'ordre (clé étrangère sur la liste de valeur lt_euep_cc_ordre)
  doaut character varying(80), -- Autre donneur d'ordre si pas présent dans dotype
  donom character varying(80), -- Nom de la personne désignant le donneur d'ordre
  dopre character varying(80), -- Prénom de la personne désignant le donneur d'ordre
  doad character varying(80), -- Adresse de la personne désignant le donneur d'ordre
  achetpat character varying(2) DEFAULT '00'::character varying, -- Patronyme de l'acheteur (clé étrangère sur la liste de valeur lt_euep_cc_pat)
  achetpatp character varying(50), -- Patronyme de l'acheteur précision si autre choisi dans achetpat
  achetnom character varying(80), -- Nom de la personne désignant l'acheteur
  achetpre character varying(80), -- Prénom de la personne désignant l'acheteur
  achetad character varying(80), -- Adresse de la personne désignant l'acheteur  
  batitype character varying(2) DEFAULT '00'::character varying, -- Code du type de bâtiment concerné par le contrôle (clé étrangère sur la liste de valeur lt_euep_cc_typebati)
  batiaut character varying(80), -- Autre type de bâtiment si pas présent dans batitype
  eppublic character varying(2) DEFAULT 'ZZ'::character varying, -- Desservie par un réseau public d'eau potable (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  epaut character varying(80), -- Autre alimentation que le réseau d'eau potable public
  rredptype character varying(2) DEFAULT 'ZZ'::character varying, -- Code du type de réseau de raccordement au domaine publique (clé étrangère sur la liste de valeur lt_euep_cc_typeres)
  rrebrtype character varying(2) DEFAULT 'ZZ'::character varying, -- Information sur l'existence d'une boîte de raccordement (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  rrechype character varying(2) DEFAULT 'ZZ'::character varying, -- Information sur l'existence d'un regard sous chaussée si pas de boîte de raccordement (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  eupc character varying(2) DEFAULT 'ZZ'::character varying, -- Information sur l'existence d'un raccordement sur les parties communes (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  euevent character varying(2) DEFAULT 'ZZ'::character varying, -- Information sur l'existence d'un évent (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  euregar character varying(2) DEFAULT 'ZZ'::character varying, -- Information sur l'existence d'un regard (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  euregardp character varying(2) DEFAULT 'ZZ'::character varying, -- Information sur l'existence d'un regard accessible dans le domaine privé (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  eusup character varying(2) DEFAULT 'ZZ'::character varying, -- Information sur l'existence d'une servitude avec une autre propriété pour les EU ou les EP (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  eusuptype character varying(2) DEFAULT 'ZZ'::character varying, -- Précision du réseau en cas de servitude avec une autre propriété (clé étrangère sur la liste de valeur lt_euep_sup)
  eusupdoc character varying(2) DEFAULT 'ZZ'::character varying, -- Information sur l'existence de documents attestant la servitude avec une autre propriété pour les EU ou les EP (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  euecoul character varying(2) DEFAULT 'ZZ'::character varying, -- Information le bon déroulé de l'écoulement (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  eufluo character varying(2) DEFAULT 'ZZ'::character varying, -- Information l'existence d'un test à la fluorescéine (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  eubrsch character varying(2) DEFAULT 'ZZ'::character varying, -- Information sur l'existence d'un branchement sous chaussée (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  eurefl character varying(2) DEFAULT 'ZZ'::character varying, -- Information sur la protection du branchement par un système d'anti reflux (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  euepsep character varying(2) DEFAULT 'ZZ'::character varying, -- Information sur la séparation de la collecte des EP et EU (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  eudivers character varying(500), -- Autres informations sur la collecte des eaux usées
  euanomal character varying(2) DEFAULT 'ZZ'::character varying, -- Information sur la présence d'anomalies constatées (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  euobserv character varying(500), -- Précisions sur les anomalies constatées sur la collecte des eaux usées
  eusiphon character varying(2) DEFAULT 'ZZ'::character varying, -- Présence de syphons sur chaque évacuation contrôlée (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  epdiagpc character varying(2) DEFAULT 'ZZ'::character varying, -- Diagnostic réalisé sur les parties communes (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  epracpc character varying(2) DEFAULT 'ZZ'::character varying, -- Raccordement sur les parties communes (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  epregarcol character varying(2) DEFAULT 'ZZ'::character varying, -- Existence d'une regard de collecte (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  epregarext character varying(2) DEFAULT 'ZZ'::character varying, -- Regard de collecte à l'extérieur de l'habitation (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  epracdp character varying(2) DEFAULT 'ZZ'::character varying, -- Raccordement au réseau public d'évacuation des eaux pluviales (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  eppar character varying(2) DEFAULT 'ZZ'::character varying, -- Eaux pluviales traitées à la parcelle (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  epparpre character varying(200), -- Précision sur le traitement des eaux pluviales à la parcelle si existe
  epfum character varying(2) DEFAULT 'ZZ'::character varying, -- Test à la fummée réalisée (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  epecoul character varying(2) DEFAULT 'ZZ'::character varying, -- Ecoulement correct (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  epecoulobs character varying(500), -- Observation sur l'écoulement (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  eprecup character varying(2) DEFAULT 'ZZ'::character varying, -- Système de récupération des eaux pluviales (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  eprecupcpt character varying(2) DEFAULT 'ZZ'::character varying, -- Compteur présent en cas de récupération des eaux pluviales à usage domestique (clé étrangère sur la liste de valeur lt_euep_cc_eval)
  epautre character varying(200), -- Autre
  epobserv character varying(200), -- Observations diverses sur la collecte des eaux usées
  euepanomal character varying(20), -- Anomalies identifiées entrainant la non conformité (liste de valeur non liée pour ajout de plusieurs valeurs possible via GEO)
  euepanomalpre character varying(5000), -- Précision des anomalies
  euepdivers character varying(1000), -- Constatations diverses
  date_sai timestamp without time zone,
  date_maj timestamp without time zone,
  op_sai character varying(80),
  scr_geom character varying(2),
  CONSTRAINT an_euep_cc_pkey PRIMARY KEY (idcc)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.an_euep_cc
  OWNER TO postgres;
GRANT ALL ON TABLE m_reseau_humide.an_euep_cc TO postgres;
GRANT ALL ON TABLE m_reseau_humide.an_euep_cc TO groupe_sig WITH GRANT OPTION;
COMMENT ON TABLE m_reseau_humide.an_euep_cc
  IS 'Donnée alphanumerique de suivi des dossiers des contrôles de conformité';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.idcc IS 'Identifiant interne unique du contrôle';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.tnidcc IS 'Type de dossier pour lacréation d''un nouveau contrôle (clé étrangère sur la liste de valeur lt_euep_cc_tnidcc)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.nidcc IS 'N° de dossier du contrôle (ce numéro suit pour une vérification en cas de non conformité)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.ccinit IS 'information sur le fait que ce contrôle soit le contrôle initial dans le cas de contrôle supplémentaire suite à une non conformité';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.ccvalid IS 'validation par l''ARC du contrôle (la valeur 10 empêche la modification des données';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.validobs IS 'commentaire sur les demandes de modifications (uniquement si ccvalid = 30)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.id_adresse IS 'Identifiant unique de l''objet point adresse (issu de la BAL)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.adapt IS 'Complément de l''adresse avec le n° d''appartement dans le cadre d''un immeuble collectif';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.adeta IS 'Etage';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.rcc IS 'Résultat du contrôle (oui : conforme, non : non conforme)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.ccdate IS 'Date du contrôle';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.ccdated IS 'Date de délivrance du contrôle';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.certtype IS 'Code de l''organisme certificateur agréé (clé étrangère sur la liste de valeur lt_euep_cc_certificateur)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.certnom IS 'Nom de la personne appartenant à l''organisme certificateur agréé qui a fait le contrôle';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.certpre IS 'Prénom de la personne appartenant à l''organisme certificateur agréé qui a fait le contrôle';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.propriopat IS 'Patronyme du propriétaire (clé étrangère sur la liste de valeur lt_euep_cc_pat)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.propriopatp IS 'Patronyme du propriétaire (précision si autre renseigné dans propriopat)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.proprionom IS 'Nom de la personne désignant le propriétaire';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.propriopre IS 'Prénom de la personne désignant le propriétaire';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.proprioad IS 'Adresse de la personne désignant le propriétaire';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.dotype IS 'Code de la qualité du donneur d''ordre (clé étrangère sur la liste de valeur lt_euep_cc_ordre)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.doaut IS 'Autre donneur d''ordre si pas présent dans dotype';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.ccbien IS 'Code du type de bien contrôlé (neuf ou ancien) (clé étrangère sur la liste de valeur lt_euep_cc_bien)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.donom IS 'Nom de la personne désignant le donneur d''ordre';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.dopre IS 'Prénom de la personne désignant le donneur d''ordre';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.doad IS 'Adresse de la personne désignant le donneur d''ordre';

COMMENT ON COLUMN m_reseau_humide.an_euep_cc.achetpat IS 'Patronyme de l''acheteur (clé étrangère sur la liste de valeur lt_euep_cc_pat)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.achetpatp IS 'Patronyme de l''acheteur (précision si autre renseigné dans achetpat)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.achetnom IS 'Nom de la personne désignant l''acheteur';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.achetpre IS 'Prénom de la personne désignant l''acheteur';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.achetad IS 'Adresse de la personne désignant l''acheteur';

COMMENT ON COLUMN m_reseau_humide.an_euep_cc.batitype IS 'Code du type de bâtiment concerné par le contrôle (clé étrangère sur la liste de valeur lt_euep_cc_typebati)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.batiaut IS 'Autre type de bâtiment si pas présent dans batitype';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.eppublic IS 'Desservie par un réseau public d''eau potable (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.epaut IS 'Autre alimentation que le réseau d''eau potable public';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.rredptype IS 'Code du type de réseau de raccordement au domaine publique (clé étrangère sur la liste de valeur lt_euep_cc_typeres)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.rrebrtype IS 'Information sur l''existence d''une boîte de raccordement (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.rrechype IS 'Information sur l''existence d''un regard sous chaussée si pas de boîte de raccordement (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.eupc IS 'Information sur l''existence d''un raccordement sur les parties communes (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.euevent IS 'Information sur l''existence d''un évent (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.euregar IS 'Information sur l''existence d''un regard (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.euregardp IS 'Information sur l''existence d''un regard accessible dans le domaine privé (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.eusup IS 'Information sur l''existence d''une servitude avec une autre propriété pour les EU ou les EP (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.eusuptype IS 'Précision du réseau en cas de servitude avec une autre propriété (clé étrangère sur la liste de valeur lt_euep_sup)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.eusupdoc IS 'Information sur l''existence de documents attestant la servitude avec une autre propriété pour les EU ou les EP (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.euecoul IS 'Information le bon déroulé de l''écoulement (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.eufluo IS 'Information l''existence d''un test à la fluorescéine (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.eubrsch IS 'Information sur l''existence d''un branchement sous chaussée (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.eurefl IS 'Information sur la protection du branchement par un système d''anti reflux (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.euepsep IS 'Information sur la séparation de la collecte des EP et EU (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.eudivers IS 'Autres informations sur la collecte des eaux usées';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.euanomal IS 'Information sur la présence d''anomalies constatées (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.euobserv IS 'Précisions sur les anomalies constatées sur la collecte des eaux usées';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.eusiphon IS 'Présence de syphons sur chaque évacuation contrôlée (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.epdiagpc IS 'Diagnostic réalisé sur les parties communes (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.epracpc IS 'Raccordement sur les parties communes (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.epregarcol IS 'Existence d''une regard de collecte (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.epregarext IS 'Regard de collecte à l''extérieur de l''habitation (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.epracdp IS 'Raccordement au réseau public d''évacuation des eaux pluviales (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.eppar IS 'Eaux pluviales traitées à la parcelle (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.epparpre IS 'Précision sur le traitement des eaux pluviales à la parcelle si existe';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.epfum IS 'Test à la fummée réalisée (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.epecoul IS 'Ecoulement correct (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.epecoulobs IS 'Observation sur l''écoulement (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.eprecup IS 'Système de récupération des eaux pluviales (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.eprecupcpt IS 'Compteur présent en cas de récupération des eaux pluviales à usage domestique (clé étrangère sur la liste de valeur lt_euep_cc_eval)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.epautre IS 'Autre';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.epobserv IS 'Observations diverses sur la collecte des eaux usées';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.euepanomal IS 'Anomalies identifiées entrainant la non conformité (liste de valeur non liée pour ajout de plusieurs valeurs possible via GEO)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.euepanomalpre IS 'Précision des anomalies';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.euepdivers IS 'Constatations diverses';

COMMENT ON COLUMN m_reseau_humide.an_euep_cc.date_sai IS 'Date de saisie';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.date_maj IS 'Datede mise à jour';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.op_sai IS 'Opérateur de saisie';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.scr_geom IS 'Source du référentiel géographique de saisie';

-- ########################################################################## table an_euep_cc_media #######################################################

DROP TABLE IF EXISTS m_reseau_humide.an_euep_cc_media;

CREATE TABLE m_reseau_humide.an_euep_cc_media
(
  gid serial NOT NULL,
  id integer, -- Identifiant de cession ou d'acquisition
  media text, -- Champ Média de GEO
  miniature bytea, -- Champ miniature de GEO
  n_fichier text, -- Nom du fichier
  t_fichier text, -- Type de média dans GEO
  op_sai character varying(100), -- Libellé de l'opérateur ayant intégrer le document
  date_sai timestamp without time zone, -- Date d'intégration du document
  l_type character varying(2), -- Code du type de document de cessions ou d'acquisitions
  l_prec character varying(50), -- Précision sur le document
  CONSTRAINT an_euep_cc_media_media_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.an_euep_cc_media
  OWNER TO postgres;
GRANT ALL ON TABLE m_reseau_humide.an_euep_cc_media TO postgres;
GRANT ALL ON TABLE m_reseau_humide.an_euep_cc_media TO groupe_sig WITH GRANT OPTION;
COMMENT ON TABLE m_reseau_humide.an_euep_cc_media
  IS 'Table gérant la liste des documents de suivi d''une cession ou d''une acquisition et gérer avec le module média dans GEO (application Foncier)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc_media.id IS 'Identifiant de cession ou d''acquisition';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc_media.media IS 'Champ Média de GEO';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc_media.miniature IS 'Champ miniature de GEO';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc_media.n_fichier IS 'Nom du fichier';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc_media.t_fichier IS 'Type de média dans GEO';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc_media.op_sai IS 'Libellé de l''opérateur ayant intégrer le document';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc_media.date_sai IS 'Date d''intégration du document';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc_media.l_type IS 'Code du type de document de cessions ou d''acquisitions';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc_media.l_prec IS 'Précision sur le document';

-- ########################################################################## table log_an_euep_cc #######################################################

-- Table: m_reseau_humide.log_an_euep_cc

DROP TABLE IF EXISTS m_reseau_humide.log_an_euep_cc;

CREATE TABLE m_reseau_humide.log_an_euep_cc
(
  gid integer NOT NULL, -- identifiant unique
  objet character varying(10), -- Type de modification (update, delete, insert)
  d_maj timestamp without time zone, -- Date de l'exécution de la modification
  "user" character varying(50), -- Utilisateur ayant exécuté l'exécution
  relid character varying(255), -- ID d'objet de la table qui a causé le déclenchement.
  l_schema character varying(30), -- Libellé du schéma contenant la table ou la vue exécutée ou mlodifiée
  l_table character varying(30), -- Libellé de la table exécutée
  idgeo character varying(100), -- Identifiant unique de l'objet de la table correspondante
  modif character varying(10000),
  geom geometry(Point,2154), -- Champ contenant la géométrie des objets polygones modifiés ou supprimés
  CONSTRAINT log_an_euep_cc_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.log_an_euep_cc
  OWNER TO postgres;
GRANT ALL ON TABLE m_reseau_humide.log_an_euep_cc TO postgres;
GRANT ALL ON TABLE m_reseau_humide.log_an_euep_cc TO groupe_sig;
COMMENT ON TABLE m_reseau_humide.log_an_euep_cc
  IS 'Table permettant de suivre les modifications intervenues sur les données des contrôles de conformité. Cette table est mise à jour via des triggers intégrés au niveau des vues de gestion.';
COMMENT ON COLUMN m_reseau_humide.log_an_euep_cc.gid IS 'identifiant unique';
COMMENT ON COLUMN m_reseau_humide.log_an_euep_cc.objet IS 'Type de modification (update, delete, insert)';
COMMENT ON COLUMN m_reseau_humide.log_an_euep_cc.d_maj IS 'Date de l''exécution de la modification';
COMMENT ON COLUMN m_reseau_humide.log_an_euep_cc."user" IS 'Utilisateur ayant exécuté l''exécution';
COMMENT ON COLUMN m_reseau_humide.log_an_euep_cc.relid IS 'ID d''objet de la table qui a causé le déclenchement.';
COMMENT ON COLUMN m_reseau_humide.log_an_euep_cc.l_schema IS 'Libellé du schéma contenant la table ou la vue exécutée ou mlodifiée';
COMMENT ON COLUMN m_reseau_humide.log_an_euep_cc.l_table IS 'Libellé de la table exécutée';
COMMENT ON COLUMN m_reseau_humide.log_an_euep_cc.idgeo IS 'Identifiant unique de l''objet de la table correspondante';
COMMENT ON COLUMN m_reseau_humide.log_an_euep_cc.geom IS 'Champ contenant la géométrie des objets polygones modifiés ou supprimés';


-- Sequence: m_reseau_humide.log_an_euep_cc_gid_seq

DROP SEQUENCE IF EXISTS m_reseau_humide.log_an_euep_cc_gid_seq;

CREATE SEQUENCE m_reseau_humide.log_an_euep_cc_gid_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE m_reseau_humide.log_an_euep_cc_gid_seq
  OWNER TO postgres;


-- ########################################################################## table xapps_an_v_euep_cc_erreur #######################################################


-- Table: x_apps.xapps_an_v_euep_cc_erreur

-- DROP TABLE x_apps.xapps_an_v_euep_cc_erreur;

CREATE TABLE x_apps.xapps_an_v_euep_cc_erreur
(
  gid integer NOT NULL, -- Identifiant unique
  id_adresse integer, -- Identifiant de l'adresse
  nidcc character varying(20), -- Identifiant du dossier
  erreur character varying(500), -- Message
  horodatage timestamp without time zone, -- Date (avec heure) de génération du message (ce champ permet de filtrer l'affichage < x secondsdans GEo)
  CONSTRAINT xapps_an_v_euep_cc_erreur_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE x_apps.xapps_an_v_euep_cc_erreur
  OWNER TO postgres;
GRANT ALL ON TABLE x_apps.xapps_an_v_euep_cc_erreur TO postgres;
GRANT ALL ON TABLE x_apps.xapps_an_v_euep_cc_erreur TO groupe_sig;
COMMENT ON TABLE x_apps.xapps_an_v_euep_cc_erreur
  IS 'Table gérant les messages d''erreurs de sécurité remontés dans GEO suite à des enregistrements de contrôle de conformité';
COMMENT ON COLUMN x_apps.xapps_an_v_euep_cc_erreur.gid IS 'Identifiant unique';
COMMENT ON COLUMN x_apps.xapps_an_v_euep_cc_erreur.id_adresse IS 'Identifiant de l''adresse';
COMMENT ON COLUMN x_apps.xapps_an_v_euep_cc_erreur.nidcc IS 'Identifiant du dossier';
COMMENT ON COLUMN x_apps.xapps_an_v_euep_cc_erreur.erreur IS 'Message';
COMMENT ON COLUMN x_apps.xapps_an_v_euep_cc_erreur.horodatage IS 'Date (avec heure) de génération du message (ce champ permet de filtrer l''affichage < x secondsdans GEo)';




-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                           FKEY (clé étrangère)                                                               ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- Table: m_reseau_humide.an_euep_cc_media

ALTER TABLE m_reseau_humide.an_euep_cc_media
ADD CONSTRAINT lt_euep_doc_fkey FOREIGN KEY (l_type)
      REFERENCES m_reseau_humide.lt_euep_doc (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

-- Table: m_reseau_humide.an_euep_cc

  

ALTER TABLE m_reseau_humide.an_euep_cc

ADD CONSTRAINT lt_euep_cc_pat_fkey FOREIGN KEY (propriopat)
      REFERENCES m_reseau_humide.lt_euep_cc_pat (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,

ADD CONSTRAINT lt_euep_cc_bien_fkey FOREIGN KEY (ccbien)
      REFERENCES m_reseau_humide.lt_euep_cc_bien (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_tnidcc_fkey FOREIGN KEY (tnidcc)
      REFERENCES m_reseau_humide.lt_euep_cc_tnidcc (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,

ADD CONSTRAINT lt_euep_cc_certificateur_fkey FOREIGN KEY (certtype)
      REFERENCES m_reseau_humide.lt_euep_cc_certificateur (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_ordre_fkey FOREIGN KEY (dotype)
      REFERENCES m_reseau_humide.lt_euep_cc_ordre (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_typebati_fkey FOREIGN KEY (batitype)
      REFERENCES m_reseau_humide.lt_euep_cc_typebati (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_typeres_fkey FOREIGN KEY (rredptype)
      REFERENCES m_reseau_humide.lt_euep_cc_typeres (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_rrebrtype_fkey FOREIGN KEY (rrebrtype)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_rrechype_fkey FOREIGN KEY (rrechype)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_eupc_fkey FOREIGN KEY (eupc)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_euevent_fkey FOREIGN KEY (euevent)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_euregar_fkey FOREIGN KEY (euregar)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_euregardp_fkey FOREIGN KEY (euregardp)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_eusup_fkey FOREIGN KEY (eusup)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_sup_fkey FOREIGN KEY (eusuptype)
      REFERENCES m_reseau_humide.lt_euep_sup (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_eusupdoc_fkey FOREIGN KEY (eusupdoc)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_euecoul_fkey FOREIGN KEY (euecoul)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_eufluo_fkey FOREIGN KEY (eufluo)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_eubrsch_fkey FOREIGN KEY (eubrsch)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_eurefl_fkey FOREIGN KEY (eurefl)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_euepsep_fkey FOREIGN KEY (euepsep)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_euanomal_fkey FOREIGN KEY (euanomal)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_eusiphon_fkey FOREIGN KEY (eusiphon)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_epdiagpc_fkey FOREIGN KEY (epdiagpc)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_epracpc_fkey FOREIGN KEY (epracpc)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_epregarcol_fkey FOREIGN KEY (epregarcol)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_epregarext_fkey FOREIGN KEY (epregarext)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_epracdp_fkey FOREIGN KEY (epracdp)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_eppar_fkey FOREIGN KEY (eppar)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_epfum_fkey FOREIGN KEY (epfum)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_epecoul_fkey FOREIGN KEY (epecoul)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_eprecup_fkey FOREIGN KEY (eprecup)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_eppublic_fkey FOREIGN KEY (eppublic)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_eval_eprecupcpt_fkey FOREIGN KEY (eprecupcpt)
      REFERENCES m_reseau_humide.lt_euep_cc_eval (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_euep_cc_valid_fkey FOREIGN KEY (ccvalid)
      REFERENCES m_reseau_humide.lt_euep_cc_valid (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                 VUES APPLICATIVES                                                            ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- COMMENT GB : -----------------------------------------------------------------------------------------------------------------------------------------------------
-- vue permettant de récupérer les informations des adresses et les dossiers de contrôle de conformité existants triè par date (plus récente vers plus ancienne)
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- ####################################################### VIEW - an_v_euep_cc #################################################################

-- View: m_reseau_humide.an_v_euep_cc

CREATE OR REPLACE VIEW m_reseau_humide.an_v_euep_cc AS

SELECT
        row_number() over(partition by cc.nidcc order by to_char((current_timestamp - cc.ccdate),'DD'))::integer as ordre_tri,
        to_char((current_timestamp - cc.ccdate),'DD')::integer as ordre_cc,
	cc.*,
	a.commune,
	a.numero || CASE WHEN (a.repet is not null or a.repet <> '') THEN a.repet ELSE '' END  || ' ' || a.libvoie_c ||
	CASE WHEN a.complement is null or a.complement ='' THEN '' ELSE chr(10) || a.complement END ||
	chr(10) || a.codepostal || ' ' || a.commune as adresse,
	a.mot_dir,
	a.libvoie_a,
	c.adresse as certi_adresse,
	c.siret as certi_siret,
	c.nom_assur as certi_assur,
	c.num_assur as certi_numassur,
	c.date_assur as certi_dassur,
	c.email AS certi_email,
        c.tel AS certi_tel
FROM
	m_reseau_humide.an_euep_cc cc, m_reseau_humide.lt_euep_cc_certificateur c, x_apps.xapps_geo_vmr_adresse a
WHERE cc.certtype = c.code and cc.id_adresse = a.id_adresse
ORDER BY CAST (a.numero as int)
;



ALTER TABLE m_reseau_humide.an_v_euep_cc
  OWNER TO postgres;
GRANT ALL ON TABLE m_reseau_humide.an_v_euep_cc TO postgres;
GRANT ALL ON TABLE m_reseau_humide.an_v_euep_cc TO groupe_sig;
COMMENT ON VIEW m_reseau_humide.an_v_euep_cc
  IS 'Vue attributaire éditable des dossiers de conformité AC (contenant les points d''adresse non éditable) récupérant l''ensemble des contrôles triés par date pour gestion dans GEO et l''édition';



-- ####################################################### VIEW - xapps_geo_v_euep_cc #################################################################

-- View: x_apps.xapps_geo_v_euep_cc

CREATE OR REPLACE VIEW x_apps.xapps_geo_v_euep_cc AS 
 WITH req_ad AS (
         SELECT a.id_adresse,
            a.commune,
            a.libvoie_c,
            a.numero,
            a.repet,
            (((((((a.numero::text ||
                CASE
                    WHEN a.repet IS NOT NULL OR a.repet::text <> ''::text THEN a.repet
                    ELSE ''::character varying
                END::text) || ' '::text) || a.libvoie_c::text) ||
                CASE
                    WHEN a.complement IS NULL OR a.complement::text = ''::text THEN ''::text
                    ELSE chr(10) || a.complement::text
                END) || chr(10)) || a.codepostal::text) || ' '::text) || a.commune::text AS adresse,
            a.mot_dir,
            a.libvoie_a,
            a.geom
           FROM x_apps.xapps_geo_vmr_adresse a
          WHERE a.insee = '60023'::bpchar OR a.insee = '60067'::bpchar OR a.insee = '60068'::bpchar OR a.insee = '60070'::bpchar OR a.insee = '60151'::bpchar OR a.insee = '60156'::bpchar OR a.insee = '60159'::bpchar OR a.insee = '60323'::bpchar OR a.insee = '60325'::bpchar OR a.insee = '60326'::bpchar OR a.insee = '60337'::bpchar OR a.insee = '60338'::bpchar OR a.insee = '60382'::bpchar OR a.insee = '60402'::bpchar OR a.insee = '60447'::bpchar OR a.insee = '60578'::bpchar OR a.insee = '60579'::bpchar OR a.insee = '60597'::bpchar OR a.insee = '60600'::bpchar OR a.insee = '60665'::bpchar OR a.insee = '60667'::bpchar OR a.insee = '60674'::bpchar
        ), req_cc AS (
         SELECT c_1.id_adresse,
            count(*) AS nb_cc
           FROM m_reseau_humide.an_euep_cc c_1
          GROUP BY c_1.id_adresse
        ), req_ccdate AS (
         SELECT DISTINCT a.id_adresse,
            a.rcc,
            a.ccdate
           FROM m_reseau_humide.an_euep_cc a
             JOIN ( SELECT an_euep_cc.id_adresse,
                    max(an_euep_cc.ccdate) AS ccdate
                   FROM m_reseau_humide.an_euep_cc
                  GROUP BY an_euep_cc.id_adresse) b ON a.id_adresse = b.id_adresse AND a.ccdate = b.ccdate
        )
 SELECT row_number() OVER () AS gid,
    b.id_adresse,
    b.commune,
    b.libvoie_c,
    b.libvoie_a,
    b.numero,
    b.repet,
    b.adresse,
    b.mot_dir,
        CASE
            WHEN c.nb_cc IS NULL THEN 0::bigint
            ELSE c.nb_cc
        END AS nb_cc,
    cd.rcc,
    cd.ccdate,
    b.geom
   FROM req_ad b
     LEFT JOIN req_cc c ON b.id_adresse = c.id_adresse
     LEFT JOIN req_ccdate cd ON b.id_adresse = cd.id_adresse
    ORDER BY CAST (b.numero as int)
     ;

ALTER TABLE x_apps.xapps_geo_v_euep_cc
  OWNER TO postgres;
GRANT ALL ON TABLE x_apps.xapps_geo_v_euep_cc TO postgres;
GRANT ALL ON TABLE x_apps.xapps_geo_v_euep_cc TO groupe_sig;
COMMENT ON VIEW x_apps.xapps_geo_v_euep_cc
  IS 'Vue applicative récupérant le nombre de dossier de conformité par adresse et affichant l''état du dernier contrôle (conforme ou non conforme) pour affichage dans GEO';




-- ####################################################### VIEW - xapps_an_euep_cc_nc #################################################################

-- View: x_apps.xapps_an_euep_cc

CREATE OR REPLACE VIEW x_apps.xapps_an_euep_cc_nc AS

WITH
req_ccdate as (
	SELECT 
		a.id_adresse,
		a.rcc,
		a.ccdate
	FROM 
		m_reseau_humide.an_euep_cc a
	JOIN (SELECT id_adresse, max(ccdate) ccdate
		FROM m_reseau_humide.an_euep_cc 
		GROUP BY id_adresse ) b
	ON a.id_adresse = b.id_adresse
	AND a.ccdate = b.ccdate
),
req_nc as (
SELECT
        row_number() over(partition by cc.nidcc order by to_char((current_timestamp - cc.ccdate),'DD'))::integer as ordre_tri,
        to_char((current_timestamp - cc.ccdate),'DD')::integer as ordre_cc,
	cc.*,
	a.commune,
	a.numero,
	a.repet,
	a.libvoie_c,
	a.libvoie_a,
        a.codepostal as code_postal,
        CASE WHEN a.complement is null or a.complement ='' THEN '' ELSE a.complement END as complement,
	a.etiquette || ' ' || a.libvoie_c ||
	CASE WHEN a.complement is null or a.complement ='' THEN '' ELSE chr(10) || a.complement END ||
	chr(10) || a.codepostal || ' ' || a.commune as adresse,
	c.adresse as certi_adresse,
	c.siret as certi_siret,
	c.nom_assur as certi_assur,
	c.num_assur as certi_numassur,
	c.date_assur as certi_dassur
FROM
	m_reseau_humide.an_euep_cc cc
JOIN (SELECT id_adresse, max(ccdate) ccdate
		FROM m_reseau_humide.an_euep_cc 
		GROUP BY id_adresse ) b
	ON cc.id_adresse = b.id_adresse
	AND cc.ccdate = b.ccdate AND cc.rcc = 'non'
JOIN m_reseau_humide.lt_euep_cc_certificateur c ON cc.certtype = c.code
JOIN x_apps.xapps_geo_vmr_adresse a ON cc.id_adresse = a.id_adresse 
AND cc.rcc = 'non'
)
SELECT	
	row_number() over() as gid,
	nc.*
FROM req_nc nc
JOIN req_ccdate cd ON nc.id_adresse = cd.id_adresse
ORDER BY CAST (nc.numero as int);




ALTER TABLE x_apps.xapps_an_euep_cc_nc
  OWNER TO postgres;
GRANT ALL ON TABLE x_apps.xapps_an_euep_cc_nc TO postgres;
GRANT ALL ON TABLE x_apps.xapps_an_euep_cc_nc TO groupe_sig;
COMMENT ON VIEW x_apps.xapps_an_euep_cc_nc
  IS 'Vue attributaire récupérant l''ensemble des contrôles non conforme (unique) pour recherche dans GEO des contrôles non conforme et export ou courrier';

-- ####################################################### VIEW - an_v_euep_cc_media #################################################################

-- COMMENT GB : -----------------------------------------------------------------------------------------------------------------------------------------------------
-- vue permettant de gérer l'ajojut ou la suppression de média (si dossier valide,impossible d'ajouter ou de supprimer)
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- View: m_reseau_humide.an_v_euep_cc_media

-- DROP VIEW m_reseau_humide.an_v_euep_cc_media;

CREATE OR REPLACE VIEW m_reseau_humide.an_v_euep_cc_media AS 
 SELECT an_euep_cc_media.gid,
    an_euep_cc_media.id,
    an_euep_cc_media.media,
    an_euep_cc_media.miniature,
    an_euep_cc_media.n_fichier,
    an_euep_cc_media.t_fichier,
    an_euep_cc_media.op_sai,
    an_euep_cc_media.date_sai,
    an_euep_cc_media.l_type,
    an_euep_cc_media.l_prec
   FROM m_reseau_humide.an_euep_cc_media;

ALTER TABLE m_reseau_humide.an_v_euep_cc_media
  OWNER TO postgres;
GRANT ALL ON TABLE m_reseau_humide.an_v_euep_cc_media TO postgres;
GRANT ALL ON TABLE m_reseau_humide.an_v_euep_cc_media TO groupe_sig;


-- ####################################################### VIEW - xapps_an_v_euep_cc_tb1 #################################################################

-- COMMENT GB : -----------------------------------------------------------------------------------------------------------------------------------------------------
-- vue permettant de générer le code HTML et lesrésultats du tableau n°1 du tableaude bord (contrôle par commune)
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- View: x_apps.xapps_an_v_euep_cc_tb1

DROP VIEW x_apps.xapps_an_v_euep_cc_tb1;

CREATE OR REPLACE VIEW x_apps.xapps_an_v_euep_cc_tb1 AS 
 WITH req_d AS (
         WITH req_a AS (
                 SELECT DISTINCT g.insee::text || to_char(cc.ccdate, 'YYYY'::text) AS cle,
                    to_char(cc.ccdate, 'YYYY'::text) AS annee,
                    g.insee,
                    g.libgeo AS commune
                   FROM m_reseau_humide.an_euep_cc cc,
                    r_administratif.an_geo g
                  WHERE g.epci::text = '200067965'::text
                  ORDER BY g.insee::text || to_char(cc.ccdate, 'YYYY'::text)
                ), req_nb AS (
                 WITH req_dbl AS (
                         SELECT "left"(cc.nidcc::text, 5) || to_char(min(cc.ccdate), 'YYYY'::text) AS cle,
                                CASE
                                    WHEN count(*) > 1 THEN 1
                                    ELSE 0
                                END AS nb_suivi
                           FROM m_reseau_humide.an_euep_cc cc
                          GROUP BY cc.nidcc
                        ), req_compte AS (
                         SELECT DISTINCT a.insee::text || to_char(cc.ccdate, 'YYYY'::text) AS cle,
                            count(*) OVER (PARTITION BY to_char(cc.ccdate, 'YYYY'::text), a.insee) AS nb
                           FROM m_reseau_humide.an_euep_cc cc
                             JOIN x_apps.xapps_geo_vmr_adresse a ON cc.id_adresse = a.id_adresse
                             LEFT JOIN r_administratif.an_geo g ON g.insee::bpchar = a.insee
                          WHERE g.epci::text = '200067965'::text
                          ORDER BY a.insee::text || to_char(cc.ccdate, 'YYYY'::text)
                        )
                 SELECT DISTINCT req_compte.cle,
                    req_compte.nb - sum(req_dbl.nb_suivi) AS nb
                   FROM req_compte,
                    req_dbl
                  WHERE req_compte.cle = req_dbl.cle
                  GROUP BY req_compte.cle, req_compte.nb
                ), 
                req_nbc AS (
                 WITH req_dbl AS (
                         SELECT "left"(cc.nidcc::text, 5) || to_char(min(cc.ccdate), 'YYYY'::text) AS cle,
                                CASE
                                    WHEN count(*) > 1 THEN 1
                                    ELSE 0
                                END AS nb_suivi
                           FROM m_reseau_humide.an_euep_cc cc WHERE rcc='oui'
                          GROUP BY cc.nidcc
                        ), req_compte AS (
                         SELECT DISTINCT a.insee::text || to_char(cc.ccdate, 'YYYY'::text) AS cle,
                            count(*) OVER (PARTITION BY to_char(cc.ccdate, 'YYYY'::text), a.insee) AS nb
                           FROM m_reseau_humide.an_euep_cc cc
                             JOIN x_apps.xapps_geo_vmr_adresse a ON cc.id_adresse = a.id_adresse
                             LEFT JOIN r_administratif.an_geo g ON g.insee::bpchar = a.insee
                          WHERE g.epci::text = '200067965'::text and rcc='oui'
                          ORDER BY a.insee::text || to_char(cc.ccdate, 'YYYY'::text)
                        )
                 SELECT DISTINCT req_compte.cle,
                    req_compte.nb - sum(req_dbl.nb_suivi) AS nb
                   FROM req_compte,
                    req_dbl
                  WHERE req_compte.cle = req_dbl.cle
                  GROUP BY req_compte.cle, req_compte.nb
                  ORDER BY req_compte.cle
		), 
		req_nbnc AS (
                 WITH req_dbl AS (
                         SELECT "left"(cc.nidcc::text, 5) || to_char(min(cc.ccdate), 'YYYY'::text) AS cle,
                                CASE
                                    WHEN count(*) > 1 THEN 1
                                    ELSE 0
                                END AS nb_suivi
                           FROM m_reseau_humide.an_euep_cc cc WHERE rcc='non'
                          GROUP BY cc.nidcc
                        ), req_compte AS (
                         SELECT DISTINCT a.insee::text || to_char(cc.ccdate, 'YYYY'::text) AS cle,
                            count(*) OVER (PARTITION BY to_char(cc.ccdate, 'YYYY'::text), a.insee) AS nb
                           FROM m_reseau_humide.an_euep_cc cc
                             JOIN x_apps.xapps_geo_vmr_adresse a ON cc.id_adresse = a.id_adresse
                             LEFT JOIN r_administratif.an_geo g ON g.insee::bpchar = a.insee
                          WHERE g.epci::text = '200067965'::text and rcc='non'
                          ORDER BY a.insee::text || to_char(cc.ccdate, 'YYYY'::text)
                        )
                 SELECT DISTINCT req_compte.cle,
                    req_compte.nb - sum(req_dbl.nb_suivi) AS nb
                   FROM req_compte,
                    req_dbl
                  WHERE req_compte.cle = req_dbl.cle
                  GROUP BY req_compte.cle, req_compte.nb
                  ORDER BY req_compte.cle
		)
               
         SELECT DISTINCT row_number() OVER () AS id,
            ((((('<tr>'::text || '<td rowspan="3">'::text) || req_a.commune::text) || '</td>'::text) || '<td>Total</td>'::text) || string_agg(('<td align=center>'::text ||
                CASE
                    WHEN req_nb.nb IS NOT NULL THEN req_nb.nb
                    ELSE 0::bigint
                END) || '</td>'::text, ''::text)) || '</tr>'::text || '<tr><td>Conforme</td>' || string_agg('<td align=center>'::text ||
                CASE
                    WHEN req_nbc.nb IS NOT NULL THEN req_nbc.nb
                    ELSE 0::bigint
                END || '</td>'::text, ''::text) || '</tr>'::text || '<tr><td>Non Conforme</td>' || string_agg('<td align=center>'::text ||
                CASE
                    WHEN req_nbnc.nb IS NOT NULL THEN req_nbnc.nb
                    ELSE 0::bigint
                END || '</td>'::text, ''::text) || '</tr>'::text AS tableau,
            string_agg(('<td>'::text || req_a.annee) || '</td>'::text, ''::text) AS annee,
            req_a.insee
           FROM req_a
             LEFT JOIN req_nb ON req_nb.cle = req_a.cle
             LEFT JOIN req_nbc ON req_nbc.cle = req_a.cle
             LEFT JOIN req_nbnc ON req_nbnc.cle = req_a.cle
           --where insee='60159'
          GROUP BY req_a.commune, req_a.insee
          ORDER BY req_a.insee
        )
 SELECT row_number() OVER () AS id,
    ((('<table border=1 align=center><tr><td colspan="2">&nbsp;</td>'::text || req_d.annee) || '</tr>'::text) || string_agg(req_d.tableau, ''::text)) || '</table>'::text AS tableau1
   FROM req_d
   --WHERE insee='60159'
  GROUP BY req_d.annee;

ALTER TABLE x_apps.xapps_an_v_euep_cc_tb1
  OWNER TO postgres;
GRANT ALL ON TABLE x_apps.xapps_an_v_euep_cc_tb1 TO postgres;
GRANT ALL ON TABLE x_apps.xapps_an_v_euep_cc_tb1 TO groupe_sig;
COMMENT ON VIEW x_apps.xapps_an_v_euep_cc_tb1
  IS 'Vue applicative formattant le tableau de bord n°1 des contrôles de conformité AC pour affichage dans GEO';

															    
															    -- ####################################################### VIEW - xapps_an_v_euep_cc_tb1 #################################################################

-- COMMENT GB : -----------------------------------------------------------------------------------------------------------------------------------------------------
-- vue permettant de générer le code HTML et lesrésultats du tableau n°2 du tableaude bord (contrôle par prestataire)
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- View: x_apps.xapps_an_v_euep_cc_tb2

-- DROP VIEW x_apps.xapps_an_v_euep_cc_tb2;

CREATE OR REPLACE VIEW x_apps.xapps_an_v_euep_cc_tb2 AS 
 WITH req_d AS (
         WITH req_a AS (
                 SELECT DISTINCT g.code || to_char(cc.ccdate, 'YYYY'::text) AS cle,
                    to_char(cc.ccdate, 'YYYY'::text) AS annee,
                    g.code,
                    g.valeur
                   FROM m_reseau_humide.an_euep_cc cc,
                    m_reseau_humide.lt_euep_cc_certificateur g
                  ORDER BY g.code || to_char(cc.ccdate, 'YYYY'::text)
                ), req_compte AS (
                 SELECT DISTINCT a.code || to_char(cc.ccdate, 'YYYY'::text) AS cle,
                    count(*) OVER (PARTITION BY to_char(cc.ccdate, 'YYYY'::text), a.code) AS nb
                   FROM m_reseau_humide.an_euep_cc cc
                     JOIN m_reseau_humide.lt_euep_cc_certificateur a ON cc.certtype = a.code
                  ORDER BY a.code || to_char(cc.ccdate, 'YYYY'::text)
                )
         SELECT DISTINCT row_number() OVER () AS id,
            (((('<tr>'::text || '<td>'::text) || req_a.valeur::text) || '</td>'::text) || string_agg(('<td align=center>'::text ||
                CASE
                    WHEN req_compte.nb IS NOT NULL THEN req_compte.nb
                    ELSE 0::bigint
                END) || '</td>'::text, ''::text)) || '</tr>'::text AS tableau,
            string_agg(('<td>'::text || req_a.annee) || '</td>'::text, ''::text) AS annee,
            req_a.code
           FROM req_a
             LEFT JOIN req_compte ON req_compte.cle = req_a.cle
          GROUP BY req_a.valeur, req_a.code
          ORDER BY req_a.code
        )
 SELECT row_number() OVER () AS id,
    ((('<table border=1 align=center><tr><td>&nbsp;</td>'::text || req_d.annee) || '</tr>'::text) || string_agg(req_d.tableau, ''::text)) || '</table>'::text AS tableau1
   FROM req_d
  GROUP BY req_d.annee;

ALTER TABLE x_apps.xapps_an_v_euep_cc_tb2
  OWNER TO postgres;
GRANT ALL ON TABLE x_apps.xapps_an_v_euep_cc_tb2 TO postgres;
GRANT ALL ON TABLE x_apps.xapps_an_v_euep_cc_tb2 TO groupe_sig;
COMMENT ON VIEW x_apps.xapps_an_v_euep_cc_tb2
  IS 'Vue applicative formatant le tableau de bord n°2 des contrôles de conformité AC (nombre de contrôle par prestataire) pour affichage dans GEO';

															    
															    
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                    LES INDEXES                                                               ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                     TRIGGER                                                                  ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- ##################################### FONCTION TRIGGER - t_t1_an_v_euep_cc_insert_update #######################################################


-- Function: m_reseau_humide.t1_an_v_euep_cc_insert_update()

-- DROP FUNCTION m_reseau_humide.t1_an_v_euep_cc_insert_update();

CREATE OR REPLACE FUNCTION m_reseau_humide.t1_an_v_euep_cc_insert_update()
  RETURNS trigger AS
$BODY$

DECLARE v_ccinit boolean;
DECLARE v_nidcc character varying;
DECLARE v_ccvalid boolean;
--DECLARE v_adresse integer;
DECLARE t1_nidcc integer;
DECLARE t2_nidcc integer;

BEGIN

-- gestion automatique si ils'agit du contrôle initial à l'adresse
v_ccinit := CASE WHEN (select count(*) from m_reseau_humide.an_euep_cc where id_adresse=new.id_adresse)>= 1  THEN false ELSE true END;

-- gestion des n° de dossier automatique et en cas de suivi
v_nidcc :=  CASE WHEN new.tnidcc = '10' THEN 
	    (SELECT (SELECT insee FROM x_apps.xapps_geo_vmr_adresse WHERE id_adresse = new.id_adresse) || 'cc' || (SELECT (max(substring(nidcc from 8 for 5)::integer) +1)::character varying FROM m_reseau_humide.an_euep_cc) as nnidcc)
	    ELSE 
		CASE WHEN (new.nidcc is null or new.nidcc = '') or (new.nidcc not in (select nidcc from m_reseau_humide.an_euep_cc)) THEN 'zz' ELSE lower(new.nidcc) END
	    END;


-- vérification sur la saisie des n° de dossier : compte le nombre de dossier validé et conforme (si = 0 peut insérer si non ne fait rien)
t1_nidcc := (select count(*) from m_reseau_humide.an_euep_cc where nidcc=new.nidcc and ccvalid='10' and rcc='oui');
-- vérification sur la saisie des n° de dossier : compte le nombre de dossier non validé (si >= 1 ne peut pas insérer un suivi de dossier sur un même dossier non validé)
t2_nidcc := (select count(*) from m_reseau_humide.an_euep_cc where nidcc=new.nidcc and ccvalid <> '10');


-- INSERT
IF (TG_OP = 'INSERT') THEN

-- gestion des messages d'erreur à la mise à jour (remonté dans GEO)
-- contrôle sur le n° de dossier en suivi : ne peut pas saisir un suivi si le n° de dossier saisi n'existe pas à l'adresse CONFORME et VALIDE
-- ici pas possibilité de remontée de message dans le fiche GEO. L'enregistrement ne se fait pas.


-- si le n° de dossier est nouveau ou un suivi est correctement saisi on insert si non rien
IF v_nidcc <> 'zz' AND t1_nidcc = 0 AND t2_nidcc = 0 THEN


INSERT INTO m_reseau_humide.an_euep_cc (idcc, id_adresse, ccvalid, validobs, ccinit, adapt, adeta, tnidcc, nidcc, rcc, ccdate, ccdated, ccbien, certtype ,certnom ,certpre ,propriopat, propriopatp, proprionom ,propriopre ,proprioad ,dotype ,doaut ,donom ,dopre ,doad ,
					achetpat, achetpatp, achetnom, achetpre, achetad, batitype ,batiaut ,eppublic ,epaut ,rredptype ,
					rrebrtype ,rrechype ,eupc ,euevent ,euregar ,euregardp ,eusup ,eusuptype ,eusupdoc ,euecoul ,eufluo ,eubrsch ,eurefl ,euepsep ,eudivers ,euanomal ,euobserv ,eusiphon ,epdiagpc ,epracpc ,epregarcol ,epregarext, 
					epracdp ,eppar ,epparpre ,epfum ,epecoul ,epecoulobs ,eprecup ,eprecupcpt ,epautre ,epobserv ,euepanomal ,euepanomalpre,euepdivers,date_sai,op_sai,scr_geom)
SELECT nextval('m_reseau_humide.an_euep_cc_idcc_seq'::regclass), new.id_adresse , '20', new.validobs, v_ccinit, new.adapt, new.adeta, new.tnidcc,v_nidcc, new.rcc , new.ccdate, new.ccdated, new.ccbien, new.certtype ,new.certnom ,new.certpre ,new.propriopat, new.propriopatp, new.proprionom ,new.propriopre ,new.proprioad ,new.dotype ,
					new.doaut ,new.donom ,new.dopre ,new.doad, new.achetpat, new.achetpatp, new.achetnom, new.achetpre, new.achetad, new.batitype ,new.batiaut ,new.eppublic ,new.epaut ,new.rredptype ,
					new.rrebrtype ,new.rrechype ,new.eupc,new.euevent ,new.euregar ,new.euregardp ,new.eusup ,new.eusuptype ,new.eusupdoc ,new.euecoul ,new.eufluo ,new.eubrsch ,new.eurefl ,new.euepsep ,new.eudivers ,new.euanomal ,new.euobserv ,new.eusiphon ,new.epdiagpc ,new.epracpc ,new.epregarcol ,new.epregarext, 
					new.epracdp ,new.eppar ,new.epparpre ,new.epfum ,new.epecoul ,new.epecoulobs ,new.eprecup ,new.eprecupcpt ,new.epautre ,new.epobserv ,new.euepanomal ,new.euepanomalpre,new.euepdivers,now(),new.op_sai,'61';
END IF;


RETURN NEW;


-- UPDATE
ELSIF (TG_OP = 'UPDATE') THEN


-- gestion des messages d'erreur à la mise à jour (remonté dans GEO)

-- pas le bon prestataire
IF old.certtype <> new.certtype  THEN
--v_adresse := old.id_adresse;
DELETE FROM x_apps.xapps_an_v_euep_cc_erreur WHERE nidcc = old.nidcc;
INSERT INTO x_apps.xapps_an_v_euep_cc_erreur VALUES
(
nextval('x_apps.xapps_an_v_euep_cc_erreur_gid_seq'::regclass),
old.id_adresse,
old.nidcc,
'Vous ne pouvez pas modifier un dossier que vous n''avez pas créé.<br>Modifications non prises en compte.',
now()
);

END IF;

-- ne peut pas modifier un dossier validé
IF ((new.ccvalid = '20' or new.ccvalid = '30') and old.ccvalid = '10') or (old.ccvalid='10' and new.ccvalid='10') THEN
--v_adresse := old.id_adresse;
DELETE FROM x_apps.xapps_an_v_euep_cc_erreur WHERE nidcc = old.nidcc;
INSERT INTO x_apps.xapps_an_v_euep_cc_erreur VALUES
(
nextval('x_apps.xapps_an_v_euep_cc_erreur_gid_seq'::regclass),
old.id_adresse,
old.nidcc,
'Vous ne pouvez pas modifier un dossier validé.<br> Modifications non prises en compte.',
now()
);

END IF;

-- ne peut pas modifier le n° de dossier
IF new.nidcc <> old.nidcc THEN
--v_adresse := old.id_adresse;
DELETE FROM x_apps.xapps_an_v_euep_cc_erreur WHERE nidcc = old.nidcc;
INSERT INTO x_apps.xapps_an_v_euep_cc_erreur VALUES
(
nextval('x_apps.xapps_an_v_euep_cc_erreur_gid_seq'::regclass),
old.id_adresse,
old.nidcc,
'Vous ne pouvez pas modifier un n° de dossier.<br> Les autres informations modifiées ont été prises en compte.',
now()
);

END IF;

-- ne peut pas modifier un suivi de dossier ou nouveau dossier
IF new.tnidcc <> old.tnidcc THEN
--v_adresse := old.id_adresse;
DELETE FROM x_apps.xapps_an_v_euep_cc_erreur WHERE nidcc = old.nidcc;
INSERT INTO x_apps.xapps_an_v_euep_cc_erreur VALUES
(
nextval('x_apps.xapps_an_v_euep_cc_erreur_gid_seq'::regclass),
old.id_adresse,
old.nidcc,
'Vous ne pouvez pas modifier le type de contrôle.<br> Les autres informations modifiées ont été prises en compte.',
now()
);

END IF;


-- si le prestataire qui modifie n'est pas celui qui a saisi pas de modification possible
IF old.certtype = new.certtype THEN

-- si le contrôle n'est pas validé alors on peut modifier les valeurs si non pas de modification possible
IF ((new.ccvalid = '20' or new.ccvalid = '30') and (old.ccvalid = '20' or old.ccvalid='30')) or (new.ccvalid = '10' and (old.ccvalid = '20' or old.ccvalid='30')) THEN

UPDATE m_reseau_humide.an_euep_cc
SET 
ccvalid = CASE 
	  WHEN new.ccvalid = '20' and old.ccvalid = '20' THEN '20'
	  WHEN new.ccvalid = '30' and old.ccvalid = '30' THEN '30'
	  WHEN new.ccvalid = '30' and old.ccvalid = '20' THEN '30'
	  WHEN new.ccvalid = '20' and old.ccvalid = '30' THEN '20'
	  WHEN new.ccvalid = '10' and (old.ccvalid = '20' or old.ccvalid = '30') THEN '10'
	  WHEN new.ccvalid = '20' and old.ccvalid = '10' THEN '20'
	  WHEN new.ccvalid = '30' and old.ccvalid = '10' THEN '30'
	  END,
validobs = CASE WHEN new.ccvalid = '30' THEN new.validobs ELSE null END,
adapt = new.adapt,
adeta = new.adeta,
rcc = new.rcc,
ccdate = new.ccdate,
ccdated = new.ccdated,
ccbien = new.ccbien,
certtype = new.certtype,
certnom = new.certnom,
certpre = new.certpre,
propriopat = new.propriopat,
propriopatp = new.propriopatp,
proprionom = new.proprionom,
propriopre = new.propriopre,
proprioad = new.proprioad,
dotype = new.dotype,
doaut = new.doaut,
donom = new.donom,
dopre = new.dopre,
doad = new.doad,
achetpat = new.achetpat,
achetpatp = new.achetpatp,
achetnom = new.achetnom,
achetpre = new.achetpre,
achetad = new.achetad,
batitype = new.batitype,
batiaut = new.batiaut,
eppublic = new.eppublic,
epaut = new.epaut,
rredptype = new.rredptype,
rrebrtype = new.rrebrtype,
rrechype = new.rrechype,
eupc = new.eupc,
euevent = new.euevent,
euregar = new.euregar,
euregardp = new.euregardp,
eusup = new.eusup,
eusuptype = new.eusuptype,
eusupdoc = new.eusupdoc,
euecoul = new.euecoul,
eufluo = new.eufluo,
eubrsch = new.eubrsch,
eurefl = new.eurefl,
euepsep = new.euepsep,
eudivers = new.eudivers,
euanomal = new.euanomal,
euobserv = new.euobserv,
eusiphon = new.eusiphon,
epdiagpc = new.epdiagpc,
epracpc = new.epracpc,
epregarcol = new.epregarcol,
epregarext = new.epregarext,
epracdp = new.epracdp,
eppar = new.eppar,
epparpre = new.epparpre,
epfum = new.epfum,
epecoul = new.epecoul,
epecoulobs = new.epecoulobs,
eprecup = new.eprecup,
eprecupcpt = new.eprecupcpt,
epautre = epautre,
epobserv = new.epobserv,
euepanomal = new.euepanomal,
euepanomalpre = new.euepanomalpre,
euepdivers = new.euepdivers,
date_maj = now()

WHERE an_euep_cc.idcc = OLD.idcc;
RETURN NEW;

END IF;
END IF;
END IF;

RETURN NEW;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_reseau_humide.t1_an_v_euep_cc_insert_update()
  OWNER TO postgres;
COMMENT ON FUNCTION m_reseau_humide.t1_an_v_euep_cc_insert_update() IS 'Fonction trigger pour mise à jour des attributs des dossiers de conformité';



-- Trigger: t_t1_an_v_euep_cc_insert_update on m_reseau_humide.an_v_euep_cc

-- DROP TRIGGER t_t1_an_v_euep_cc_update_insert ON m_reseau_humide.an_v_euep_cc;

CREATE TRIGGER t_t1_an_v_euep_cc_update_insert
  INSTEAD OF INSERT OR UPDATE
  ON m_reseau_humide.an_v_euep_cc
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_humide.t1_an_v_euep_cc_insert_update();

-- ##################################### FONCTION TRIGGER - t_t2_an_euep_cc_insert ##################################################################################


-- Function: m_reseau_humide.t2_an_euep_cc_insert()

-- DROP FUNCTION m_reseau_humide.t2_an_euep_cc_insert();

CREATE OR REPLACE FUNCTION m_reseau_humide.t2_an_euep_cc_insert()
  RETURNS trigger AS
$BODY$


BEGIN

-- UPDATE

UPDATE m_reseau_humide.an_euep_cc SET validobs = null WHERE validobs = '';
UPDATE m_reseau_humide.an_euep_cc SET adapt = null WHERE adapt = '';
UPDATE m_reseau_humide.an_euep_cc SET certnom = null WHERE certnom = '';
UPDATE m_reseau_humide.an_euep_cc SET certpre = null WHERE certpre = '';
UPDATE m_reseau_humide.an_euep_cc SET propriopatp = null WHERE propriopatp = '';
UPDATE m_reseau_humide.an_euep_cc SET proprionom = null WHERE proprionom = '';
UPDATE m_reseau_humide.an_euep_cc SET propriopre = null WHERE propriopre = '';
UPDATE m_reseau_humide.an_euep_cc SET proprioad = null WHERE proprioad = '';
UPDATE m_reseau_humide.an_euep_cc SET doaut = null WHERE doaut = '';
UPDATE m_reseau_humide.an_euep_cc SET donom = null WHERE donom = '';
UPDATE m_reseau_humide.an_euep_cc SET dopre = null WHERE dopre = '';
UPDATE m_reseau_humide.an_euep_cc SET doad = null WHERE doad = '';
UPDATE m_reseau_humide.an_euep_cc SET achetpat = null WHERE achetpat = '';
UPDATE m_reseau_humide.an_euep_cc SET achetpatp = null WHERE achetpatp = '';
UPDATE m_reseau_humide.an_euep_cc SET achetnom = null WHERE achetnom = '';
UPDATE m_reseau_humide.an_euep_cc SET achetpre = null WHERE achetpre = '';
UPDATE m_reseau_humide.an_euep_cc SET achetad = null WHERE achetad = '';
UPDATE m_reseau_humide.an_euep_cc SET batiaut = null WHERE batiaut = '';
UPDATE m_reseau_humide.an_euep_cc SET epaut = null WHERE epaut = '';
UPDATE m_reseau_humide.an_euep_cc SET eudivers = null WHERE eudivers = '';
UPDATE m_reseau_humide.an_euep_cc SET euobserv = null WHERE euobserv = '';
UPDATE m_reseau_humide.an_euep_cc SET epparpre = null WHERE epparpre = '';
UPDATE m_reseau_humide.an_euep_cc SET epecoulobs = null WHERE epecoulobs = '';
UPDATE m_reseau_humide.an_euep_cc SET epautre = null WHERE epautre = '';
UPDATE m_reseau_humide.an_euep_cc SET epobserv = null WHERE epobserv = '';
UPDATE m_reseau_humide.an_euep_cc SET euepanomal = null WHERE euepanomal = '';
UPDATE m_reseau_humide.an_euep_cc SET euepanomalpre = null WHERE euepanomalpre = '';
UPDATE m_reseau_humide.an_euep_cc SET euepdivers = null WHERE euepdivers = '';

RETURN NEW;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_reseau_humide.t2_an_euep_cc_insert()
  OWNER TO postgres;
COMMENT ON FUNCTION m_reseau_humide.t2_an_euep_cc_insert() IS 'Fonction trigger nettoyer les valeurs '' en null';

-- Trigger: t2_an_euep_cc_insert on m_reseau_humide.an_euep_cc

-- DROP TRIGGER t2_an_euep_cc_insert ON m_reseau_humide.an_euep_cc;

CREATE TRIGGER t_t2_an_euep_cc_insert
  AFTER INSERT
  ON m_reseau_humide.an_euep_cc
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_humide.t2_an_euep_cc_insert();

-- Function: m_reseau_humide.ft_log_an_euep_cc()

-- DROP FUNCTION m_reseau_humide.ft_log_an_euep_cc();

CREATE OR REPLACE FUNCTION m_reseau_humide.ft_log_an_euep_cc()
  RETURNS trigger AS
$BODY$
begin
		--ajoute une ligne dans la table suivi des modifications pour refléter l'operation réalisée sur les tables
		--utilise la variable spéciale TG_OP pour cette opération
		--
		      
		IF (TG_OP='INSERT') then			

		insert into m_reseau_humide.log_an_euep_cc select nextval('m_reseau_humide.log_an_euep_cc_gid_seq'::regclass), 'INSERT',now(),user,TG_Relid,TG_TABLE_SCHEMA,TG_TABLE_NAME,new.idcc;

                END IF;
                IF (TG_OP='UPDATE') then
			insert into m_reseau_humide.log_an_euep_cc select nextval('m_reseau_humide.log_an_euep_cc_gid_seq'::regclass), 'UPDATE',now(),user,TG_Relid,TG_TABLE_SCHEMA,TG_TABLE_NAME,old.idcc, 
			CASE WHEN old.ccvalid <> new.ccvalid then 'ccvalid:' || old.ccvalid || ',' || new.ccvalid || ';' ELSE '' end ||
			CASE WHEN old.adapt <> new.adapt then 'adapt:' || old.adapt || ',' || new.adapt || ';' ELSE '' end ||
			CASE WHEN old.adeta <> new.adeta then 'adeta:' || old.adeta || ',' || new.adeta || ';' ELSE '' end ||
			CASE WHEN old.nidcc <> new.nidcc then 'nidcc:' || old.nidcc || ',' || new.nidcc || ';' ELSE '' end ||
			CASE WHEN old.rcc <> new.rcc then 'rcc:' || old.rcc || ',' || new.rcc || ';' ELSE '' end ||
			CASE WHEN old.ccdate <> new.ccdate then 'ccdate:' || old.ccdate || ',' || new.ccdate || ';' ELSE '' end ||
			CASE WHEN old.ccdate <> new.ccdate then 'ccdate:' || old.ccdate || ',' || new.ccdate || ';' ELSE '' end ||
			CASE WHEN old.ccdated <> new.ccdated then 'ccdated:' || old.ccdated || ',' || new.ccdated || ';' ELSE '' end ||
			CASE WHEN old.ccbien <> new.ccbien then 'ccbien:' || old.ccbien || ',' || new.ccbien || ';' ELSE '' end ||
			CASE WHEN old.certtype <> new.certtype then 'certtype:' || old.certtype || ',' || new.certtype || ';' ELSE '' end ||
			CASE WHEN old.certnom <> new.certnom then 'certnom:' || old.certnom || ',' || new.certnom || ';' ELSE '' end ||
			CASE WHEN old.certpre <> new.certpre then 'certpre:' || old.certpre || ',' || new.certpre || ';' ELSE '' end ||
			CASE WHEN old.propriopat <> new.propriopat then 'propriopat:' || old.propriopat || ',' || new.propriopat || ';' ELSE '' end ||
			CASE WHEN old.propriopatp <> new.propriopatp then 'propriopatp:' || old.propriopatp || ',' || new.propriopatp || ';' ELSE '' end ||
			CASE WHEN old.proprionom <> new.proprionom then 'proprionom:' || old.proprionom || ',' || new.proprionom || ';' ELSE '' end ||
			CASE WHEN old.propriopre <> new.propriopre then 'propriopre:' || old.propriopre || ',' || new.propriopre || ';' ELSE '' end ||
			CASE WHEN old.proprioad <> new.proprioad then 'proprioad:' || old.proprioad || ',' || new.proprioad || ';' ELSE '' end ||
			CASE WHEN old.dotype <> new.dotype then 'dotype:' || old.dotype || ',' || new.dotype || ';' ELSE '' end ||
			CASE WHEN old.doaut <> new.doaut then 'doaut:' || old.doaut || ',' || new.doaut || ';' ELSE '' end ||
			CASE WHEN old.donom <> new.donom then 'donom:' || old.donom || ',' || new.donom || ';' ELSE '' end ||
			CASE WHEN old.dopre <> new.dopre then 'dopre:' || old.dopre || ',' || new.dopre || ';' ELSE '' end ||
			CASE WHEN old.doad <> new.doad then 'doad:' || old.doad || ',' || new.doad || ';' ELSE '' end ||
			CASE WHEN old.achetpat <> new.achetpat then 'achetpat:' || old.achetpat || ',' || new.achetpat || ';' ELSE '' end ||
			CASE WHEN old.achetpatp <> new.achetpatp then 'achetpatp:' || old.achetpatp || ',' || new.achetpatp || ';' ELSE '' end ||
			CASE WHEN old.achetnom <> new.achetnom then 'achetnom:' || old.achetnom || ',' || new.achetnom || ';' ELSE '' end ||
			CASE WHEN old.achetpre <> new.achetpre then 'achetpre:' || old.achetpre || ',' || new.achetpre || ';' ELSE '' end ||
			CASE WHEN old.achetad <> new.achetad then 'achetad:' || old.achetad || ',' || new.achetad || ';' ELSE '' end ||
			CASE WHEN old.batitype <> new.batitype then 'batitype:' || old.batitype || ',' || new.batitype || ';' ELSE '' end ||
			CASE WHEN old.batiaut <> new.batiaut then 'batiaut:' || old.batiaut || ',' || new.batiaut || ';' ELSE '' end ||
			CASE WHEN old.eppublic <> new.eppublic then 'eppublic:' || old.eppublic || ',' || new.eppublic || ';' ELSE '' end ||
			CASE WHEN old.epaut <> new.epaut then 'epaut:' || old.epaut || ',' || new.epaut || ';' ELSE '' end ||
			CASE WHEN old.rredptype <> new.rredptype then 'rredptype:' || old.rredptype || ',' || new.rredptype || ';' ELSE '' end ||
			CASE WHEN old.rrebrtype <> new.rrebrtype then 'rrebrtype:' || old.rrebrtype || ',' || new.rrebrtype || ';' ELSE '' end ||
			CASE WHEN old.rrechype <> new.rrechype then 'rrechype:' || old.rrechype || ',' || new.rrechype || ';' ELSE '' end ||
			CASE WHEN old.eupc <> new.eupc then 'eupc:' || old.eupc || ',' || new.eupc || ';' ELSE '' end ||
			CASE WHEN old.euevent <> new.euevent then 'euevent:' || old.euevent || ',' || new.euevent || ';' ELSE '' end ||
			CASE WHEN old.euregar <> new.euregar then 'eppublic:' || old.euregar || ',' || new.euregar || ';' ELSE '' end ||
			CASE WHEN old.euregardp <> new.euregardp then 'euregardp:' || old.euregardp || ',' || new.euregardp || ';' ELSE '' end ||
			CASE WHEN old.eusup <> new.eusup then 'eusup:' || old.eusup || ',' || new.eusup || ';' ELSE '' end ||
			CASE WHEN old.eusuptype <> new.eusuptype then 'eusuptype:' || old.eusuptype || ',' || new.eusuptype || ';' ELSE '' end ||
			CASE WHEN old.eusupdoc <> new.eusupdoc then 'eusupdoc:' || old.eusupdoc || ',' || new.eusupdoc || ';' ELSE '' end ||
			CASE WHEN old.euecoul <> new.euecoul then 'euecoul:' || old.euecoul || ',' || new.euecoul || ';' ELSE '' end ||
			CASE WHEN old.eufluo <> new.eufluo then 'eufluo:' || old.eufluo || ',' || new.eufluo || ';' ELSE '' end ||
			CASE WHEN old.eubrsch <> new.eubrsch then 'eubrsch:' || old.eubrsch || ',' || new.eubrsch || ';' ELSE '' end ||
			CASE WHEN old.eurefl <> new.eurefl then 'eurefl:' || old.eurefl || ',' || new.eurefl || ';' ELSE '' end ||
			CASE WHEN old.euepsep <> new.euepsep then 'euepsep:' || old.euepsep || ',' || new.euepsep || ';' ELSE '' end ||
			CASE WHEN old.eudivers <> new.eudivers then 'eudivers:' || old.eudivers || ',' || new.eudivers || ';' ELSE '' end ||
			CASE WHEN old.euanomal <> new.euanomal then 'euanomal:' || old.euanomal || ',' || new.euanomal || ';' ELSE '' end ||
			CASE WHEN old.euobserv <> new.euobserv then 'euobserv:' || old.euobserv || ',' || new.euobserv || ';' ELSE '' end ||
			CASE WHEN old.eusiphon <> new.eusiphon then 'eusiphon:' || old.eusiphon || ',' || new.eusiphon || ';' ELSE '' end ||
			CASE WHEN old.epdiagpc <> new.epdiagpc then 'epdiagpc:' || old.epdiagpc || ',' || new.epdiagpc || ';' ELSE '' end ||
			CASE WHEN old.epracpc <> new.epracpc then 'epracpc:' || old.epracpc || ',' || new.epracpc || ';' ELSE '' end ||	
			CASE WHEN old.epregarcol <> new.epregarcol then 'epregarcol:' || old.epregarcol || ',' || new.epregarcol || ';' ELSE '' end ||
			CASE WHEN old.epregarext <> new.epregarext then 'epregarext:' || old.epregarext || ',' || new.epregarext || ';' ELSE '' end ||
			CASE WHEN old.epracdp <> new.epracdp then 'epracdp:' || old.epracdp || ',' || new.epracdp || ';' ELSE '' end ||
			CASE WHEN old.eppar <> new.eppar then 'eppar:' || old.eppar || ',' || new.eppar || ';' ELSE '' end ||
			CASE WHEN old.epparpre <> new.epparpre then 'epparpre:' || old.epparpre || ',' || new.epparpre || ';' ELSE '' end ||
			CASE WHEN old.epfum <> new.epfum then 'epfum:' || old.epfum || ',' || new.epfum || ';' ELSE '' end ||
			CASE WHEN old.epecoul <> new.epecoul then 'epecoul:' || old.epecoul || ',' || new.epecoul || ';' ELSE '' end ||	
			CASE WHEN old.epecoulobs <> new.epecoulobs then 'epecoulobs:' || old.epecoulobs || ',' || new.epecoulobs || ';' ELSE '' end ||
			CASE WHEN old.eprecup <> new.eprecup then 'eprecup:' || old.eprecup || ',' || new.eprecup || ';' ELSE '' end ||
			CASE WHEN old.eprecupcpt <> new.eprecupcpt then 'eprecupcpt:' || old.eprecupcpt || ',' || new.eprecupcpt || ';' ELSE '' end ||
			CASE WHEN old.epautre <> new.epautre then 'epautre:' || old.epautre || ',' || new.epautre || ';' ELSE '' end ||
			CASE WHEN old.epobserv <> new.epobserv then 'epobserv:' || old.epobserv || ',' || new.epobserv || ';' ELSE '' end ||
			CASE WHEN old.euepanomal <> new.euepanomal then 'euepanomal:' || old.euepanomal || ',' || new.euepanomal || ';' ELSE '' end ||
			CASE WHEN old.euepanomalpre <> new.euepanomalpre then 'euepanomalpre:' || old.euepanomalpre || ',' || new.euepanomalpre || ';' ELSE '' end ||
			CASE WHEN old.euepdivers <> new.euepdivers then 'euepdivers:' || old.euepdivers || ',' || new.euepdivers || ';' ELSE '' end ||	
			CASE WHEN old.op_sai <> new.op_sai then 'op_sai:' || old.op_sai || ',' || new.op_sai || ';' ELSE '' end; 
                        DELETE FROM m_reseau_humide.log_an_euep_cc WHERE modif is null or modif ='';
	
		end if;

		return null; -- le résultat est ignoré car il s'agit d'un déclencheur AFTER
	end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_reseau_humide.ft_log_an_euep_cc()
  OWNER TO postgres;


COMMIT;
												 
												 

-- ##################################### FONCTION TRIGGER - t_t2_an_euep_cc_insert ##################################################################################

CREATE TRIGGER t_t2_log_an_euep_cc_insert_update
  AFTER INSERT OR UPDATE
  ON m_reseau_humide.an_euep_cc
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_humide.ft_log_an_euep_cc();															 
															 
															 
-- ##################################### FONCTION TRIGGER - t_t1_an_v_euep_cc_media ##################################################################################

-- Trigger: t_t1_an_v_euep_cc_media on m_reseau_humide.an_v_euep_cc_media

-- DROP TRIGGER t_t1_an_v_euep_cc_media ON m_reseau_humide.an_v_euep_cc_media;

CREATE TRIGGER t_t1_an_v_euep_cc_media
  INSTEAD OF INSERT OR UPDATE
  ON m_reseau_humide.an_v_euep_cc_media
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_humide.t_t1_an_v_euep_cc_media();
															 
-- Trigger: t_t1_an_v_euep_cc_media_insert_update on m_reseau_humide.an_v_euep_cc_media

-- DROP TRIGGER t_t1_an_v_euep_cc_media_insert_update ON m_reseau_humide.an_v_euep_cc_media;

-- CREATE TRIGGER t_t1_an_v_euep_cc_media
--   INSTEAD OF INSERT OR UPDATE
--   ON m_reseau_humide.an_v_euep_cc_media
--   FOR EACH ROW
--   EXECUTE PROCEDURE m_reseau_humide.t_t1_an_v_euep_cc_media();

-- Function: m_reseau_humide.t_t1_an_v_euep_cc_media()

-- DROP FUNCTION m_reseau_humide.t_t1_an_v_euep_cc_media();

CREATE OR REPLACE FUNCTION m_reseau_humide.t_t1_an_v_euep_cc_media()
  RETURNS trigger AS
$BODY$

DECLARE t_valid integer;


BEGIN

-- recherche si le contrôle est validé, dans ce cas 1 et pas possible d'insérer, de mettre à jour ou de supprimer un média
t_valid := (SELECT count(*) from m_reseau_humide.an_euep_cc where idcc=new.id and ccvalid ='10');

-- si le controle n'est pas validé
IF t_valid = 0 THEN

-- INSERT
IF (TG_OP = 'INSERT') THEN

INSERT INTO m_reseau_humide.an_euep_cc_media (gid,id,media,miniature,n_fichier,t_fichier,op_sai,date_sai,l_type,l_prec)
SELECT nextval('m_reseau_humide.an_euep_cc_media_gid_seq'::regclass),new.id,new.media,new.miniature,new.n_fichier,new.t_fichier,new.op_sai,new.date_sai,new.l_type,new.l_prec ;

-- UPDATE
ELSIF (TG_OP = 'UPDATE') THEN
UPDATE m_reseau_humide.an_euep_cc_media 
SET
op_sai = new.op_sai,
date_sai = new.date_sai,
l_type = new.l_type,
l_prec = new.l_prec
WHERE gid = old.gid;

-- DELETE
ELSIF (TG_OP = 'DELETE') THEN

DELETE FROM m_reseau_humide.an_euep_cc_media WHERE gid = old.gid;

END IF;
END IF;

RETURN NEW;

-- si validé on fait rien

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_reseau_humide.t_t1_an_v_euep_cc_media()
  OWNER TO postgres;
COMMENT ON FUNCTION m_reseau_humide.t_t1_an_v_euep_cc_media() IS 'Fonction trigger pour la gestion de l''insertion des médias des dossiers de conformité';


