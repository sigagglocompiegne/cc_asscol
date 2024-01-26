-- ############################################################ SCHEMA #############################################################################

-- Intégrer au schéma m_reseau_humide


-- COMMENT GB : -----------------------------------------------------------------------------------------------------------------------------------------------------
-- suppression des clés étrangères si elles existent avant de reconstituer le modèle
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
BEGIN;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_bien_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_certificateur_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_conform_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_epdiagpc_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_epecoul_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_epfum_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eppar_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eppublic_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_epracdp_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_epracpc_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eprecup_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eprecupcpt_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_epregarcol_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_epregarext_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_euanomal_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eubrsch_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_euecoul_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_euepsep_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_euevent_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eufluo_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eupc_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eurefl_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_euregar_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_euregardp_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eusiphon_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eusup_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_eusupdoc_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_rrebrtype_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_rrechype_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_ordre_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_pat_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_tnidcc_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_typebati_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_typeres_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_valid_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_cc_radcom_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc DROP CONSTRAINT IF EXISTS lt_euep_sup_fkey;

ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc_media DROP CONSTRAINT IF EXISTS lt_euep_doc_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.an_euep_cc_certi_media DROP CONSTRAINT IF EXISTS lt_euep_doc_certif_fkey;


ALTER TABLE IF EXISTS m_reseau_humide.lt_euep_cc_certificateur DROP CONSTRAINT lt_euep_cc_certificateur_pkey;
ALTER TABLE IF EXISTS m_reseau_humide.lt_euep_cc_ordre DROP CONSTRAINT IF EXISTS lt_euep_cc_ordre_pkey;
ALTER TABLE IF EXISTS m_reseau_humide.lt_euep_cc_typebati DROP CONSTRAINT IF EXISTS lt_euep_cc_typebati_pkey;
ALTER TABLE IF EXISTS m_reseau_humide.lt_euep_cc_typeres DROP CONSTRAINT IF EXISTS lt_euep_cc_typeres_pkey;
ALTER TABLE IF EXISTS m_reseau_humide.lt_euep_sup DROP CONSTRAINT IF EXISTS lt_euep_sup_pkey;
ALTER TABLE IF EXISTS m_reseau_humide.lt_euep_cc_eval DROP CONSTRAINT IF EXISTS lt_euep_cc_eval_pkey;
ALTER TABLE IF EXISTS m_reseau_humide.lt_euep_cc_tnidcc DROP CONSTRAINT IF EXISTS lt_euep_cc_tnidcc_pkey;
ALTER TABLE IF EXISTS m_reseau_humide.lt_euep_cc_valid DROP CONSTRAINT IF EXISTS lt_euep_cc_valid_pkey;
ALTER TABLE IF EXISTS m_reseau_humide.lt_euep_cc_anomal DROP CONSTRAINT IF EXISTS lt_euep_cc_anomal_pkey;
ALTER TABLE IF EXISTS m_reseau_humide.lt_euep_cc_conform DROP CONSTRAINT IF EXISTS lt_euep_cc_conform_pkey;

DROP VIEW IF EXISTS m_reseau_humide.xapps_geo_v_euep_cc;
DROP VIEW IF EXISTS m_reseau_humide.xapps_an_euep_cc_nc;
DROP VIEW IF EXISTS m_reseau_humide.xapps_an_v_euep_cc_tab1;
DROP VIEW IF EXISTS m_reseau_humide.xapps_an_v_euep_cc_tab2;
DROP VIEW IF EXISTS m_reseau_humide.xapps_an_v_euep_cc_tab3;
DROP VIEW IF EXISTS m_reseau_humide.xapps_an_v_euep_cc_media;

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                  DOMAINES DE VALEURS                                                         ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ################################################################# Domaine valeur - lt_euep_cc_conform #############################################

-- Table: m_reseau_humide.v

-- DROP TABLE m_reseau_humide.lt_euep_cc_conform;

CREATE TABLE m_reseau_humide.lt_euep_cc_conform
(
  code character(2) NOT NULL, -- Code interne des types de documents
  valeur character varying(80) NOT NULL, -- Libellé des types de documents
  CONSTRAINT lt_euep_cc_conform_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.lt_euep_cc_conform
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.lt_euep_cc_conform TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.lt_euep_cc_conform TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.lt_euep_cc_conform TO edit_sig;
GRANT SELECT ON TABLE m_reseau_humide.lt_euep_cc_conform TO read_sig;
COMMENT ON TABLE m_reseau_humide.lt_euep_cc_conform
  IS 'Liste des types de conformité';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_conform.code IS 'Code interne des types de conformité';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_conform.valeur IS 'Libellé des types de conformité';

INSERT INTO m_reseau_humide.lt_euep_cc_conform(
            code, valeur)
    VALUES
    ('10','Conforme'),
    ('21','Non-conforme simple'),
    ('22','Non-conforme grave')
    ;

-- ################################################################# Domaine valeur - lt_euep_doc_certif #############################################

-- Table: m_reseau_humide.lt_euep_doc_certif

-- DROP TABLE m_reseau_humide.lt_euep_doc_certif;

CREATE TABLE m_reseau_humide.lt_euep_doc_certif
(
  code character(2) NOT NULL, -- Code interne des types de documents
  valeur character varying(80) NOT NULL, -- Libellé des types de documents
  CONSTRAINT lt_euep_doc_certif_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.lt_euep_doc_certif
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.lt_euep_doc_certif TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.lt_euep_doc_certif TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.lt_euep_doc_certif TO edit_sig;
GRANT SELECT ON TABLE m_reseau_humide.lt_euep_doc_certif TO read_sig;
COMMENT ON TABLE m_reseau_humide.lt_euep_doc_certif
  IS 'Liste des types documents joints au certificateur (attestation)';
COMMENT ON COLUMN m_reseau_humide.lt_euep_doc_certif.code IS 'Code interne des types de documents';
COMMENT ON COLUMN m_reseau_humide.lt_euep_doc_certif.valeur IS 'Libellé des types de documents';

INSERT INTO m_reseau_humide.lt_euep_doc_certif(
            code, valeur)
    VALUES
    ('10','Attestation d''assurance'),
    ('11','Attestation de formation')
    ;


-- ################################################################# Domaine valeur - lt_euep_cc_certificateur #############################################

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
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.lt_euep_cc_certificateur TO sig_create;
GRANT SELECT ON TABLE m_reseau_humide.lt_euep_cc_certificateur TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.lt_euep_cc_certificateur TO edit_sig;


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
ALTER SEQUENCE m_reseau_humide.lt_euep_cc_certificateur_code_seq
  OWNER TO sig_create;

GRANT ALL ON m_reseau_humide.lt_euep_cc_certificateur_code_seq TO sig_create;
GRANT SELECT, USAGE ON SEQUENCE m_reseau_humide.lt_euep_cc_certificateur_code_seq TO public;


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
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.lt_euep_cc_ordre TO sig_create;
GRANT SELECT ON TABLE m_reseau_humide.lt_euep_cc_ordre TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.lt_euep_cc_ordre TO edit_sig;

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
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.lt_euep_cc_typebati TO sig_create;
GRANT SELECT ON TABLE m_reseau_humide.lt_euep_cc_typebati TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.lt_euep_cc_typebati TO edit_sig;

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
    ('21','Immeuble  entier (partie commune)'),
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
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.lt_euep_cc_typeres TO sig_create;
GRANT SELECT ON TABLE m_reseau_humide.lt_euep_cc_typeres TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.lt_euep_cc_typeres TO edit_sig;

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
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.lt_euep_cc_eval TO sig_create;
GRANT SELECT ON TABLE m_reseau_humide.lt_euep_cc_eval TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.lt_euep_cc_eval TO edit_sig;

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
    ('40','Inconnu'),
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
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.lt_euep_sup TO sig_create;
GRANT SELECT ON TABLE m_reseau_humide.lt_euep_sup TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.lt_euep_sup TO edit_sig;

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
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.lt_euep_cc_bien TO sig_create;
GRANT SELECT ON TABLE m_reseau_humide.lt_euep_cc_bien TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.lt_euep_cc_bien TO edit_sig;

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
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.lt_euep_cc_pat TO sig_create;
GRANT SELECT ON TABLE m_reseau_humide.lt_euep_cc_pat TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.lt_euep_cc_pat TO edit_sig;

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
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.lt_euep_doc TO sig_create;
GRANT SELECT ON TABLE m_reseau_humide.lt_euep_doc TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.lt_euep_doc TO edit_sig;

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
    ('50','Diagnostic parties communes'),
    ('51','Diagnostic parties privatives'),
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
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.lt_euep_cc_tnidcc TO sig_create;
GRANT SELECT ON TABLE m_reseau_humide.lt_euep_cc_tnidcc TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.lt_euep_cc_tnidcc TO edit_sig;

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
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.lt_euep_cc_valid TO sig_create;
GRANT SELECT ON TABLE m_reseau_humide.lt_euep_cc_valid TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.lt_euep_cc_valid TO edit_sig;

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
    ('40','Contrôle à supprimer'),
    ('50','Contrôle à déverrouiller')
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
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.lt_euep_cc_anomal_seq TO sig_create;
GRANT SELECT ON TABLE m_reseau_humide.lt_euep_cc_anomal_seq TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.lt_euep_cc_anomal_seq TO edit_sig;


-- Table: m_reseau_humide.lt_euep_cc_anomal

DROP TABLE IF EXISTS m_reseau_humide.lt_euep_cc_anomal;

CREATE TABLE m_reseau_humide.lt_euep_cc_anomal
(
  code integer NOT NULL DEFAULT nextval('m_reseau_humide.lt_euep_cc_anomal_seq'::regclass),
  valeur character varying(100) NOT NULL,
  tri integer	 
  nc character varying(1),
  valid character varying(3) NOT NULL,
	
  CONSTRAINT lt_euep_cc_anomal_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.lt_euep_cc_anomal
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.lt_euep_cc_anomal TO sig_create;
GRANT SELECT ON TABLE m_reseau_humide.lt_euep_cc_anomal TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.lt_euep_cc_anomal TO edit_sig;

COMMENT ON TABLE m_reseau_humide.lt_euep_cc_anomal
  IS 'Liste des types de validation du contrôle';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_anomal.code IS 'Code interne des anomalies possibles lors d''un contrôle';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_anomal.valeur IS 'Libellé des anomalies possibles lors d''un contrôle';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_anomal.tri IS 'Attribut permettant de trier les anomalies par rodre de préférnece d''affichage dans GEO';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_anomal.nc IS 'Anomalie entraînant une non conformité grave (o:non, 1:oui)';
COMMENT ON COLUMN m_reseau_humide.lt_euep_cc_anomal.valid IS 'Anomalie encore en vigueur';

INSERT INTO m_reseau_humide.lt_euep_cc_anomal(
            code, valeur,tri,nc,valid)
    VALUES
    (18,'Maison ou immeuble ou local non raccordé',1,1,'oui'),
    (2,'Maison ou immeuble ou local partiellement raccordé',2,1,'oui'),
    (3,'Eaux usées raccordées sur le réseau d''eaux pluviales/ou au milieu naturel',13,1,'oui'),
    (4,'Eaux pluviales raccordées sur le réseau d''eaux usées (en partie privée)',15,0,'oui'),
    (5,'Présence d''ancien ouvrage de décantation (fosse septique, bac dégraisseur, etc..)',3,0,'oui'),
    (6,'Absence d''évent',4,0,'oui'),
    (7,'Diamètre de l''évent insuffisant',5,0,'oui'),
    (8,'Event non remonté au faîtage de la maison ou immeuble ou local',6,0,'oui'),
    (9,'Absence de clapet anti-retour',7,0,'oui'),
    (10,'Absence de siphon',8,0,'oui'),
    (11,'Destination des eaux usées indéterminée',9,1,'oui'),
    (12,'Vidange de piscine raccordée sur le branchement eaux usées',10,0,'oui')
    (13,'Eaux pluviales raccordées sur le réseau d''eaux usées (en partie publique)',14,0,'non')
    (14,'Absence de bac dégraisseur',11,0,'oui')
    (15,'Absence du document attestant une servitude de passage',17,'0','oui')
    (16,'Vidange de piscine raccordée sur réseau d''eaux pluviales',12,'0','oui')
    (17,'Eaux pluviales raccordés sur le réseau SEPARATIF des eaux usées',16,1,'oui')	
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
ALTER SEQUENCE m_reseau_humide.an_euep_cc_idcc_seq
  OWNER TO sig_create;
GRANT ALL ON SEQUENCE m_reseau_humide.an_euep_cc_idcc_seq TO sig_create;
GRANT SELECT, USAGE ON SEQUENCE m_reseau_humide.an_euep_cc_idcc_seq TO public;


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
  nidccp character varying(20), -- N° interne du prestataire
  rcc character varying(3) NOT NULL, -- Résultat du contrôle (oui : conforme, non : non conforme, inconnu ?)
  ccdate timestamp without time zone, -- Date du contrôle
  ccbien character varying(2) DEFAULT '00'::character varying, -- Code du type de bien contrôlé (neuf ou ancien)
  certtype integer, -- Code de l'organisme certificateur agréé (clé étrangère sur la liste de valeur lt_euep_cc_certificateur)
  certnom character varying(80), -- Nom de la personne appartenant à l'organisme certificateur agréé qui a fait le contrôle
  certpre character varying(80), -- Prénom de la personne appartenant à l'organisme certificateur agréé qui a fait le contrôle
  propriopat character varying(2) DEFAULT '00'::character varying, -- Patronyme du propriétaire (clé étrangère sur la liste de valeur lt_euep_cc_pat)
  propriopatp character varying(50), -- Patronyme du propriétaire précision si autre choisi dans propriopat
  proprionom character varying(80), -- Nom de la personne désignant le propriétaire
  propriopre character varying(80), -- Prénom de la personne désignant le propriétaire
  proprioad character varying(254), -- Adresse de la personne désignant le propriétaire
  proprioadcp character varying(254), -- Code postal et commune du propriétaire
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
  dbinsert timestamp without time zone,
  dbupdate timestamp without time zone,
  op_sai character varying(80),
  scr_geom character varying(2),
  date_notif timestamp without time zone, -- date de notification
  date_rel timestamp without time zone, -- date de relance
  epracdpdom character varying(2), -- Précision du raccordement au réseau public d'évacuation des EP
  euepconstd character varying(2), -- Constatations diverses observées sur le réseau d'assainissement
  op_maj character varying(80),
  maj_nc boolean not null default false,	
  CONSTRAINT an_euep_cc_pkey PRIMARY KEY (idcc)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.an_euep_cc
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.an_euep_cc TO sig_create;
GRANT SELECT ON TABLE m_reseau_humide.an_euep_cc TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.an_euep_cc TO edit_sig;

COMMENT ON TABLE m_reseau_humide.an_euep_cc
  IS 'Donnée alphanumerique de suivi des dossiers des contrôles de conformité';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.idcc IS 'Identifiant interne unique du contrôle';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.id_adresse IS 'Identifiant unique de l''objet point adresse (issu de la BAL)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.ccvalid IS 'validation par l''ARC du contrôle (la valeur 10 empêche la modification des données';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.validobs IS 'commentaire sur les demandes de modifications (uniquement si ccvalid = 30)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.ccinit IS 'information sur le fait que ce contrôle soit le contrôle initial dans le cas de contrôle supplémentaire suite à une non conformité';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.adapt IS 'Complément de l''adresse avec le n° d''appartement dans le cadre d''un immeuble collectif';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.adeta IS 'Etage';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.tnidcc IS 'Type de dossier pour lacréation d''un nouveau contrôle (clé étrangère sur la liste de valeur lt_euep_cc_tnidcc)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.nidcc IS 'N° de dossier du contrôle (ce numéro suit pour une vérification en cas de non conformité)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.rcc IS 'Résultat du contrôle (oui: conforme, non : non conforme)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.ccdate IS 'Date du contrôle';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.ccbien IS 'Code du type de bien contrôlé (neuf ou ancien) (clé étrangère sur la liste de valeur lt_euep_cc_bien)';
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
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.dbinsert IS 'Date de saisie';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.dbupdate IS 'Datede mise à jour';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.op_sai IS 'Opérateur de saisie';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.scr_geom IS 'Source du référentiel géographique de saisie';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.nidccp IS 'Numéro interne au prestataire du contrôle';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.proprioadcp IS 'Code postal et commune de l''adresse du propriétaire';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.date_notif IS 'Date de la première notification';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.date_rel IS 'Date de la relance effective';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.epracdpdom IS 'Précision du raccordement au réseau public d''évacuation des EP';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.euepconstd IS 'Constatations diverses observées sur le réseau d''assainissement';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.op_maj IS 'Opérateur de mise à jour (pas utilisé dans les déclencheurs de GEO, incompatible avec la mise à jour d''un contrôle';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.date_notif IS 'Date de notification';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.date_rel IS 'Date de relance';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.epracdpdom IS 'Précision du raccordement au réseau public d''évacuation des EP';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc.euepconstd IS 'Constatations diverses observées sur le réseau d''assainissement';


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
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.an_euep_cc_media TO sig_create;
GRANT SELECT ON TABLE m_reseau_humide.an_euep_cc_media TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.an_euep_cc_media TO edit_sig;

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


-- ########################################################################## table an_euep_cc_certi_media #######################################################

-- Table: m_reseau_humide.an_euep_cc_certi_media

-- DROP TABLE m_reseau_humide.an_euep_cc_certi_media;

CREATE TABLE m_reseau_humide.an_euep_cc_certi_media
(
  gid serial NOT NULL,
  id integer, -- Identifiant du certificateur
  media text, -- Champ Média de GEO
  miniature bytea, -- Champ miniature de GEO
  n_fichier text, -- Nom du fichier
  t_fichier text, -- Type de média dans GEO
  op_sai character varying(100), -- Libellé de l'opérateur ayant intégrer le document
  date_sai timestamp without time zone, -- Date d'intégration du document
  l_type character varying(2), -- Code du type de document (attestation)
  dfin timestamp without time zone, -- Date de fin d'attestation
  l_prec character varying(50),
  l_nom character varying(100), -- Nom de la personne à laquelle l'attestation de formation est rattachée
  CONSTRAINT an_euep_cc_certi_media_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_humide.an_euep_cc_certi_media
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.an_euep_cc_certi_media TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.an_euep_cc_certi_media TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.an_euep_cc_certi_media TO edit_sig;
GRANT SELECT ON TABLE m_reseau_humide.an_euep_cc_certi_media TO read_sig;
COMMENT ON TABLE m_reseau_humide.an_euep_cc_certi_media
  IS 'Table gérant la liste des documents liés au certificateur (assurance, formation,...)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc_certi_media.id IS 'Identifiant du certificateur';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc_certi_media.media IS 'Champ Média de GEO';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc_certi_media.miniature IS 'Champ miniature de GEO';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc_certi_media.n_fichier IS 'Nom du fichier';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc_certi_media.t_fichier IS 'Type de média dans GEO';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc_certi_media.op_sai IS 'Libellé de l''opérateur ayant intégrer le document';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc_certi_media.date_sai IS 'Date d''intégration du document';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc_certi_media.l_type IS 'Code du type de document (attestation)';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc_certi_media.dfin IS 'Date de fin d''attestation';
COMMENT ON COLUMN m_reseau_humide.an_euep_cc_certi_media.l_nom IS 'Nom de la personne à laquelle l''attestation de formation est rattachée';





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
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.log_an_euep_cc TO sig_create;
GRANT SELECT ON TABLE m_reseau_humide.log_an_euep_cc TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.log_an_euep_cc TO edit_sig;

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
ALTER SEQUENCE m_reseau_humide.log_an_euep_cc_gid_seq
  OWNER TO sig_create;
GRANT ALL ON SEQUENCE m_reseau_humide.log_an_euep_cc_gid_seq TO sig_create;
GRANT SELECT, USAGE ON SEQUENCE m_reseau_humide.log_an_euep_cc_gid_seq TO public;


-- ########################################################################## table old_xapps_an_v_euep_cc_erreur #######################################################
/*

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
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.xapps_an_v_euep_cc_erreur TO sig_create;
GRANT SELECT ON TABLE m_reseau_humide.xapps_an_v_euep_cc_erreur TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.xapps_an_v_euep_cc_erreur TO edit_sig;

COMMENT ON TABLE x_apps.xapps_an_v_euep_cc_erreur
  IS 'Table gérant les messages d''erreurs de sécurité remontés dans GEO suite à des enregistrements de contrôle de conformité';
COMMENT ON COLUMN x_apps.xapps_an_v_euep_cc_erreur.gid IS 'Identifiant unique';
COMMENT ON COLUMN x_apps.xapps_an_v_euep_cc_erreur.id_adresse IS 'Identifiant de l''adresse';
COMMENT ON COLUMN x_apps.xapps_an_v_euep_cc_erreur.nidcc IS 'Identifiant du dossier';
COMMENT ON COLUMN x_apps.xapps_an_v_euep_cc_erreur.erreur IS 'Message';
COMMENT ON COLUMN x_apps.xapps_an_v_euep_cc_erreur.horodatage IS 'Date (avec heure) de génération du message (ce champ permet de filtrer l''affichage < x secondsdans GEo)';


*/

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
      
      
-- Table: m_reseau_humide.an_euep_cc_certi_media

ALTER TABLE m_reseau_humide.an_euep_cc_certi_media
  ADD CONSTRAINT lt_euep_doc_certif_fkey FOREIGN KEY (l_type)
      REFERENCES m_reseau_humide.lt_euep_doc_certif (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

-- Table: m_reseau_humide.an_euep_cc

ALTER TABLE m_reseau_humide.an_euep_cc

ADD CONSTRAINT lt_euep_cc_bien_fkey FOREIGN KEY (ccbien)
      REFERENCES m_reseau_humide.lt_euep_cc_bien (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,

ADD CONSTRAINT lt_euep_cc_certificateur_fkey FOREIGN KEY (rcc)
      REFERENCES m_reseau_humide.lt_euep_cc_conform (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,

ADD CONSTRAINT lt_euep_cc_conform_fkey FOREIGN KEY (certtype)
      REFERENCES m_reseau_humide.lt_euep_cc_certificateur (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,	
	
ADD CONSTRAINT lt_euep_cc_pat_fkey FOREIGN KEY (propriopat)
      REFERENCES m_reseau_humide.lt_euep_cc_pat (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,


	
ADD CONSTRAINT lt_euep_cc_tnidcc_fkey FOREIGN KEY (tnidcc)
      REFERENCES m_reseau_humide.lt_euep_cc_tnidcc (code) MATCH SIMPLE
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
      ON UPDATE NO ACTION ON DELETE NO ACTION,

ADD CONSTRAINT lt_euep_racdom_fkey FOREIGN KEY (epracdpdom)
      REFERENCES m_reseau_humide.lt_euep_racdom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                 VUES APPLICATIVES                                                            ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- COMMENT GB : -----------------------------------------------------------------------------------------------------------------------------------------------------
-- vue permettant de récupérer les informations des adresses et les dossiers de contrôle de conformité existants triè par date (plus récente vers plus ancienne)
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- ####################################################### VIEW - an_v_euep_cc (vue supprimée) #################################################################
/*
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
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.an_v_euep_cc TO sig_create;
GRANT SELECT ON TABLE m_reseau_humide.an_v_euep_cc TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.an_v_euep_cc TO edit_sig;

COMMENT ON VIEW m_reseau_humide.an_v_euep_cc
  IS 'Vue attributaire éditable des dossiers de conformité AC (contenant les points d''adresse non éditable) récupérant l''ensemble des contrôles triés par date pour gestion dans GEO et l''édition';
*/


-- ####################################################### VIEW - xapps_geo_v_euep_cc #################################################################

-- m_reseau_humide.xapps_geo_v_euep_cc source

CREATE OR REPLACE VIEW m_reseau_humide.xapps_geo_v_euep_cc
AS WITH req_ad AS (
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
            count(*) AS nb_cc,
            string_agg(c_1.certtype::text, ','::text) AS certtype
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
                  GROUP BY an_euep_cc.id_adresse) b_1 ON a.id_adresse = b_1.id_adresse AND a.ccdate = b_1.ccdate
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
    c.certtype,
    cd.rcc,
    cd.ccdate,
    b.geom
   FROM req_ad b
     LEFT JOIN req_cc c ON b.id_adresse = c.id_adresse
     LEFT JOIN req_ccdate cd ON b.id_adresse = cd.id_adresse
  ORDER BY (b.numero::integer);

COMMENT ON VIEW m_reseau_humide.xapps_geo_v_euep_cc IS 'Vue applicative récupérant le nombre de dossier de conformité par adresse et affichant l''état du dernier contrôle (conforme ou non conforme) pour affichage dans GEO';



-- ####################################################### VIEW - xapps_an_euep_cc_nc #################################################################

-- m_reseau_humide.xapps_an_euep_cc_nc source

CREATE OR REPLACE VIEW m_reseau_humide.xapps_an_euep_cc_nc
AS WITH req_ccdate AS (
         SELECT a.id_adresse,
            a.rcc,
            a.ccdate,
            a.nidcc
           FROM m_reseau_humide.an_euep_cc a
             JOIN ( SELECT an_euep_cc.id_adresse,
                    an_euep_cc.nidcc,
                    max(an_euep_cc.ccdate) AS ccdate
                   FROM m_reseau_humide.an_euep_cc
                  GROUP BY an_euep_cc.id_adresse, an_euep_cc.nidcc) b ON a.nidcc::text = b.nidcc::text AND a.ccdate = b.ccdate
        ), req_nc AS (
         SELECT row_number() OVER (PARTITION BY cc.nidcc ORDER BY (to_char(now() - cc.ccdate::timestamp with time zone, 'DD'::text)))::integer AS ordre_tri,
            to_char(now() - cc.ccdate::timestamp with time zone, 'DD'::text)::integer AS ordre_cc,
            cc.idcc,
            cc.id_adresse,
            cc.ccvalid,
            cc.validobs,
            cc.ccinit,
            cc.adapt,
            cc.adeta,
            cc.tnidcc,
            cc.nidcc,
            cc.rcc,
            cc.ccdate,
            cc.ccbien,
            cc.certtype,
            cc.certnom,
            cc.certpre,
            cc.propriopat,
            cc.propriopatp,
            cc.proprionom,
            cc.propriopre,
            cc.proprioad,
            cc.dotype,
            cc.doaut,
            cc.donom,
            cc.dopre,
            cc.doad,
            cc.achetpat,
            cc.achetpatp,
            cc.achetnom,
            cc.achetpre,
            cc.achetad,
            cc.batitype,
            cc.batiaut,
            cc.eppublic,
            cc.epaut,
            cc.rredptype,
            cc.rrebrtype,
            cc.rrechype,
            cc.eupc,
            cc.euevent,
            cc.euregar,
            cc.euregardp,
            cc.eusup,
            cc.eusuptype,
            cc.eusupdoc,
            cc.euecoul,
            cc.eufluo,
            cc.eubrsch,
            cc.eurefl,
            cc.euepsep,
            cc.eudivers,
            cc.euanomal,
            cc.euobserv,
            cc.eusiphon,
            cc.epdiagpc,
            cc.epracpc,
            cc.epregarcol,
            cc.epregarext,
            cc.epracdp,
            cc.eppar,
            cc.epparpre,
            cc.epfum,
            cc.epecoul,
            cc.epecoulobs,
            cc.eprecup,
            cc.eprecupcpt,
            cc.epautre,
            cc.epobserv,
            cc.euepanomal,
            cc.euepanomalpre,
            cc.euepdivers,
            cc.dbinsert,
            cc.dbupdate,
            cc.op_sai,
            cc.scr_geom,
            a.commune,
            a.numero,
            a.repet,
            a.libvoie_c,
            a.libvoie_a,
            a.codepostal AS code_postal,
                CASE
                    WHEN a.complement IS NULL OR a.complement::text = ''::text THEN ''::character varying
                    ELSE a.complement
                END AS complement,
            ((((((a.etiquette::text || ' '::text) || a.libvoie_c::text) ||
                CASE
                    WHEN a.complement IS NULL OR a.complement::text = ''::text THEN ''::text
                    ELSE chr(10) || a.complement::text
                END) || chr(10)) || a.codepostal::text) || ' '::text) || a.commune::text AS adresse,
            c.adresse AS certi_adresse,
            c.siret AS certi_siret,
            c.nom_assur AS certi_assur,
            c.num_assur AS certi_numassur,
            c.date_assur AS certi_dassur,
            cc.date_notif,
            cc.date_rel
           FROM m_reseau_humide.an_euep_cc cc
             JOIN ( SELECT an_euep_cc.id_adresse,
                    an_euep_cc.nidcc,
                    max(an_euep_cc.ccdate) AS ccdate
                   FROM m_reseau_humide.an_euep_cc
                  GROUP BY an_euep_cc.id_adresse, an_euep_cc.nidcc) b ON cc.nidcc::text = b.nidcc::text AND cc.ccdate = b.ccdate AND cc.rcc::text = '22'::text
             JOIN m_reseau_humide.lt_euep_cc_certificateur c ON cc.certtype = c.code
             JOIN x_apps.xapps_geo_vmr_adresse a ON cc.id_adresse = a.id_adresse AND cc.rcc::text = '22'::text
        )
 SELECT row_number() OVER () AS gid,
    nc.ordre_tri,
    nc.ordre_cc,
    nc.idcc,
    nc.id_adresse,
    nc.ccvalid,
    nc.validobs,
    nc.ccinit,
    nc.adapt,
    nc.adeta,
    nc.tnidcc,
    nc.nidcc,
    nc.rcc,
    nc.ccdate,
    nc.ccbien,
    nc.certtype,
    nc.certnom,
    nc.certpre,
    nc.propriopat,
    nc.propriopatp,
    nc.proprionom,
    nc.propriopre,
    nc.proprioad,
    nc.dotype,
    nc.doaut,
    nc.donom,
    nc.dopre,
    nc.doad,
    nc.achetpat,
    nc.achetpatp,
    nc.achetnom,
    nc.achetpre,
    nc.achetad,
    nc.batitype,
    nc.batiaut,
    nc.eppublic,
    nc.epaut,
    nc.rredptype,
    nc.rrebrtype,
    nc.rrechype,
    nc.eupc,
    nc.euevent,
    nc.euregar,
    nc.euregardp,
    nc.eusup,
    nc.eusuptype,
    nc.eusupdoc,
    nc.euecoul,
    nc.eufluo,
    nc.eubrsch,
    nc.eurefl,
    nc.euepsep,
    nc.eudivers,
    nc.euanomal,
    nc.euobserv,
    nc.eusiphon,
    nc.epdiagpc,
    nc.epracpc,
    nc.epregarcol,
    nc.epregarext,
    nc.epracdp,
    nc.eppar,
    nc.epparpre,
    nc.epfum,
    nc.epecoul,
    nc.epecoulobs,
    nc.eprecup,
    nc.eprecupcpt,
    nc.epautre,
    nc.epobserv,
    nc.euepanomal,
    nc.euepanomalpre,
    nc.euepdivers,
    nc.dbinsert,
    nc.dbupdate,
    nc.op_sai,
    nc.scr_geom,
    nc.commune,
    nc.numero,
    nc.repet,
    nc.libvoie_c,
    nc.libvoie_a,
    nc.code_postal,
    nc.complement,
    nc.adresse,
    nc.certi_adresse,
    nc.certi_siret,
    nc.certi_assur,
    nc.certi_numassur,
    nc.certi_dassur,
    nc.date_notif,
    nc.date_rel
   FROM req_nc nc
     JOIN req_ccdate cd ON nc.nidcc::text = cd.nidcc::text
  ORDER BY nc.nidcc, (nc.numero::integer);

COMMENT ON VIEW m_reseau_humide.xapps_an_euep_cc_nc IS 'Vue attributaire récupérant l''ensemble des contrôles non conforme (unique) pour recherche dans GEO des contrôles non conforme et export ou courrier';


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
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_humide.an_v_euep_cc_media TO sig_create;
GRANT SELECT ON TABLE m_reseau_humide.an_v_euep_cc_media TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_humide.an_v_euep_cc_media TO edit_sig;


-- ####################################################### VIEW - xapps_an_v_euep_cc_tb1 #################################################################

-- COMMENT GB : -----------------------------------------------------------------------------------------------------------------------------------------------------
-- vue permettant de générer le code HTML et les résultats du tableau n°1 du tableau de bord (contrôle par commune)
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- m_reseau_humide.xapps_an_v_euep_cc_tb1 source

CREATE OR REPLACE VIEW m_reseau_humide.xapps_an_v_euep_cc_tb1
AS WITH req_d AS (
         WITH req_annee AS (
                 SELECT DISTINCT g.insee::text || to_char(cc.ccdate, 'YYYY'::text) AS cle,
                    to_char(cc.ccdate, 'YYYY'::text) AS annee,
                    g.insee,
                    g.libgeo AS commune
                   FROM m_reseau_humide.an_euep_cc cc,
                    r_administratif.an_geo g
                  WHERE g.epci::text = '200067965'::text
                  ORDER BY (g.insee::text || to_char(cc.ccdate, 'YYYY'::text))
                ), req_tcc AS (
                 WITH req_amin AS (
                         SELECT an_euep_cc.nidcc,
                            to_char(min(an_euep_cc.ccdate), 'YYYY'::text) AS annee
                           FROM m_reseau_humide.an_euep_cc
                          GROUP BY an_euep_cc.nidcc
                        ), req_nbcc AS (
                         SELECT an_euep_cc.nidcc,
                            count(*) AS nb,
                                CASE
                                    WHEN count(*) > 1 THEN 1::bigint
                                    ELSE count(*)
                                END AS nb_ccu
                           FROM m_reseau_humide.an_euep_cc
                          GROUP BY an_euep_cc.nidcc
                        )
                 SELECT "left"(cc.nidcc::text, 5) || a_1.annee AS cle,
                    "left"(cc.nidcc::text, 5) AS insee,
                    a_1.annee,
                    sum(cc.nb_ccu) AS nb_ccu
                   FROM req_amin a_1
                     JOIN req_nbcc cc ON a_1.nidcc::text = cc.nidcc::text
                  GROUP BY ("left"(cc.nidcc::text, 5)), a_1.annee
                  ORDER BY ("left"(cc.nidcc::text, 5))
                ), req_tccarc AS (
                 WITH req_amin AS (
                         SELECT DISTINCT an_euep_cc.nidcc,
                            "left"(an_euep_cc.nidcc::text, 5) AS "left",
                            to_char(min(an_euep_cc.ccdate), 'YYYY'::text) AS annee
                           FROM m_reseau_humide.an_euep_cc
                          GROUP BY an_euep_cc.nidcc
                        ), req_nbccarc AS (
                         SELECT an_euep_cc.nidcc,
                            count(*) AS nb,
                                CASE
                                    WHEN count(*) > 1 THEN 1::bigint
                                    ELSE count(*)
                                END AS nb_ccuarc
                           FROM m_reseau_humide.an_euep_cc
                          GROUP BY an_euep_cc.nidcc
                        )
                 SELECT a_1.annee AS cle,
                    sum(cc.nb_ccuarc) AS nb_ccuarc
                   FROM req_amin a_1
                     JOIN req_nbccarc cc ON a_1.nidcc::text = cc.nidcc::text
                  GROUP BY a_1.annee
                  ORDER BY a_1.annee
                ), req_tccc AS (
                 WITH req_amin AS (
                         SELECT an_euep_cc.nidcc,
                            to_char(min(an_euep_cc.ccdate), 'YYYY'::text) AS annee
                           FROM m_reseau_humide.an_euep_cc
                          GROUP BY an_euep_cc.nidcc
                        ), req_nbccc AS (
                         SELECT an_euep_cc.nidcc,
                            an_euep_cc.rcc,
                            count(*) AS nb,
                                CASE
                                    WHEN count(*) > 1 THEN 1::bigint
                                    ELSE count(*)
                                END AS nb_cccu
                           FROM m_reseau_humide.an_euep_cc
                          WHERE an_euep_cc.rcc::text = '10'::text
                          GROUP BY an_euep_cc.nidcc, an_euep_cc.rcc
                        )
                 SELECT "left"(cc.nidcc::text, 5) || a_1.annee AS cle,
                    "left"(cc.nidcc::text, 5) AS insee,
                    a_1.annee,
                    sum(cc.nb_cccu) AS nb_cccu
                   FROM req_amin a_1
                     JOIN req_nbccc cc ON a_1.nidcc::text = cc.nidcc::text
                  GROUP BY ("left"(cc.nidcc::text, 5)), a_1.annee
                  ORDER BY ("left"(cc.nidcc::text, 5))
                ), req_tcccarc AS (
                 WITH req_amin AS (
                         SELECT DISTINCT an_euep_cc.nidcc,
                            "left"(an_euep_cc.nidcc::text, 5) AS "left",
                            to_char(min(an_euep_cc.ccdate), 'YYYY'::text) AS annee
                           FROM m_reseau_humide.an_euep_cc
                          GROUP BY an_euep_cc.nidcc
                        ), req_nbccarc AS (
                         SELECT an_euep_cc.nidcc,
                            an_euep_cc.rcc,
                            count(*) AS nb,
                                CASE
                                    WHEN count(*) > 1 THEN 1::bigint
                                    ELSE count(*)
                                END AS nb_ccuarc
                           FROM m_reseau_humide.an_euep_cc
                          WHERE an_euep_cc.rcc::text = '10'::text
                          GROUP BY an_euep_cc.nidcc, an_euep_cc.rcc
                        )
                 SELECT a_1.annee AS cle,
                    sum(cc.nb_ccuarc) AS nb_cccuarc
                   FROM req_amin a_1
                     JOIN req_nbccarc cc ON a_1.nidcc::text = cc.nidcc::text
                  GROUP BY a_1.annee
                  ORDER BY a_1.annee
                ), req_tccnc AS (
                 WITH req_amin AS (
                         SELECT an_euep_cc.nidcc,
                            to_char(min(an_euep_cc.ccdate), 'YYYY'::text) AS annee
                           FROM m_reseau_humide.an_euep_cc
                          GROUP BY an_euep_cc.nidcc
                        ), req_nbccnc AS (
                         SELECT an_euep_cc.nidcc,
                            count(*) AS nb,
                                CASE
                                    WHEN count(*) > 1 THEN 1::bigint
                                    ELSE count(*)
                                END AS nb_ccncu
                           FROM m_reseau_humide.an_euep_cc
                          WHERE (an_euep_cc.rcc::text = ANY (ARRAY['21'::text, '22'::text])) AND NOT (an_euep_cc.nidcc::text IN ( SELECT an_euep_cc_1.nidcc
                                   FROM m_reseau_humide.an_euep_cc an_euep_cc_1
                                  WHERE an_euep_cc_1.rcc::text = '10'::text))
                          GROUP BY an_euep_cc.nidcc
                        )
                 SELECT "left"(cc.nidcc::text, 5) || a_1.annee AS cle,
                    "left"(cc.nidcc::text, 5) AS insee,
                    a_1.annee,
                    sum(cc.nb_ccncu) AS nb_ccncu
                   FROM req_amin a_1
                     JOIN req_nbccnc cc ON a_1.nidcc::text = cc.nidcc::text
                  GROUP BY ("left"(cc.nidcc::text, 5)), a_1.annee
                  ORDER BY ("left"(cc.nidcc::text, 5))
                ), req_tccncarc AS (
                 WITH req_amin AS (
                         SELECT DISTINCT an_euep_cc.nidcc,
                            "left"(an_euep_cc.nidcc::text, 5) AS "left",
                            to_char(min(an_euep_cc.ccdate), 'YYYY'::text) AS annee
                           FROM m_reseau_humide.an_euep_cc
                          GROUP BY an_euep_cc.nidcc
                        ), req_nbccarc AS (
                         SELECT an_euep_cc.nidcc,
                            an_euep_cc.rcc,
                            count(*) AS nb,
                                CASE
                                    WHEN count(*) > 1 THEN 1::bigint
                                    ELSE count(*)
                                END AS nb_ccuarc
                           FROM m_reseau_humide.an_euep_cc
                          WHERE (an_euep_cc.rcc::text = ANY (ARRAY['21'::text, '22'::text])) AND NOT (an_euep_cc.nidcc::text IN ( SELECT an_euep_cc_1.nidcc
                                   FROM m_reseau_humide.an_euep_cc an_euep_cc_1
                                  WHERE an_euep_cc_1.rcc::text = '10'::text))
                          GROUP BY an_euep_cc.nidcc, an_euep_cc.rcc
                        )
                 SELECT a_1.annee AS cle,
                    sum(cc.nb_ccuarc) AS nb_ccncuarc
                   FROM req_amin a_1
                     JOIN req_nbccarc cc ON a_1.nidcc::text = cc.nidcc::text
                  GROUP BY a_1.annee
                  ORDER BY a_1.annee
                ), req_tccncc AS (
                 WITH req_amin AS (
                         SELECT an_euep_cc.nidcc,
                            to_char(min(an_euep_cc.ccdate), 'YYYY'::text) AS annee
                           FROM m_reseau_humide.an_euep_cc
                          GROUP BY an_euep_cc.nidcc
                        ), req_nbccncc AS (
                         SELECT an_euep_cc.nidcc,
                            count(*) AS nb,
                                CASE
                                    WHEN count(*) > 1 THEN 1::bigint
                                    ELSE count(*)
                                END AS nb_ccnccu
                           FROM m_reseau_humide.an_euep_cc
                          WHERE (an_euep_cc.rcc::text = ANY (ARRAY['21'::text, '22'::text])) AND (an_euep_cc.nidcc::text IN ( SELECT an_euep_cc_1.nidcc
                                   FROM m_reseau_humide.an_euep_cc an_euep_cc_1
                                  WHERE an_euep_cc_1.rcc::text = '10'::text))
                          GROUP BY an_euep_cc.nidcc
                        )
                 SELECT "left"(cc.nidcc::text, 5) || a_1.annee AS cle,
                    "left"(cc.nidcc::text, 5) AS insee,
                    a_1.annee,
                    sum(cc.nb_ccnccu) AS nb_ccnccu
                   FROM req_amin a_1
                     JOIN req_nbccncc cc ON a_1.nidcc::text = cc.nidcc::text
                  GROUP BY ("left"(cc.nidcc::text, 5)), a_1.annee
                  ORDER BY ("left"(cc.nidcc::text, 5))
                ), req_tccncc_arc AS (
                 WITH req_amin AS (
                         SELECT DISTINCT an_euep_cc.nidcc,
                            "left"(an_euep_cc.nidcc::text, 5) AS "left",
                            to_char(min(an_euep_cc.ccdate), 'YYYY'::text) AS annee
                           FROM m_reseau_humide.an_euep_cc
                          GROUP BY an_euep_cc.nidcc
                        ), req_nbccncc AS (
                         SELECT an_euep_cc.nidcc,
                            count(*) AS nb,
                                CASE
                                    WHEN count(*) > 1 THEN 1::bigint
                                    ELSE count(*)
                                END AS nb_ccnccu
                           FROM m_reseau_humide.an_euep_cc
                          WHERE (an_euep_cc.rcc::text = ANY (ARRAY['21'::text, '22'::text])) AND (an_euep_cc.nidcc::text IN ( SELECT an_euep_cc_1.nidcc
                                   FROM m_reseau_humide.an_euep_cc an_euep_cc_1
                                  WHERE an_euep_cc_1.rcc::text = '10'::text))
                          GROUP BY an_euep_cc.nidcc
                        )
                 SELECT a_1.annee AS cle,
                    sum(cc.nb_ccnccu) AS nb_ccnccu_arc
                   FROM req_amin a_1
                     JOIN req_nbccncc cc ON a_1.nidcc::text = cc.nidcc::text
                  GROUP BY a_1.annee
                  ORDER BY a_1.annee
                )
         SELECT DISTINCT row_number() OVER () AS id,
            ((((((((((((((((('<tr>'::text || '<td rowspan="5">'::text) || a.commune::text) || '</td>'::text) || '<td>Total</td>'::text) || string_agg(('<td align=center>'::text ||
                CASE
                    WHEN tcc.nb_ccu IS NOT NULL THEN tcc.nb_ccu
                    ELSE 0::bigint::numeric
                END) || '</td>'::text, ''::text)) || '</tr>'::text) || '<tr><td>Conforme</td>'::text) || string_agg(('<td align=center>'::text ||
                CASE
                    WHEN tccc.nb_cccu IS NOT NULL THEN tccc.nb_cccu
                    ELSE 0::bigint::numeric
                END) || '</td>'::text, ''::text)) || '</tr>'::text) || '<tr><td>Non Conforme</td>'::text) || string_agg(('<td align=center>'::text ||
                CASE
                    WHEN tccnc.nb_ccncu IS NOT NULL THEN tccnc.nb_ccncu
                    ELSE 0::bigint::numeric
                END) || '</td>'::text, ''::text)) || '</tr>'::text) || '<tr><td>Taux de conformité</td>'::text) || string_agg(('<td align=center>'::text ||
                CASE
                    WHEN tccc.nb_cccu IS NULL THEN '0%'::character varying::text
                    ELSE round(tccc.nb_cccu / NULLIF(tcc.nb_ccu, 0::numeric) * 100::numeric, 1) || '%'::text
                END) || '</td>'::text, ''::text)) || '</tr>'::text) || '<tr><td>Taux de mise en conformité<sup>(2)</sup></td>'::text) || string_agg(('<td align=center>'::text ||
                CASE
                    WHEN tccncc.nb_ccnccu IS NULL THEN '0%'::character varying::text
                    ELSE round(tccncc.nb_ccnccu / (tccnc.nb_ccncu + tccncc.nb_ccnccu) * 100::numeric, 1) || '%'::text
                END) || '</td>'::text, ''::text)) || '</tr>'::text AS tableau,
            string_agg(('<td align=center>'::text || a.annee) || '</td>'::text, ''::text) AS annee,
            string_agg(('<td align=center><b>'::text || tccarc.nb_ccuarc) || '</b></td>'::text, ''::text) AS nb_ccuarc,
            string_agg(('<td align=center><b>'::text || tcccarc.nb_cccuarc) || '</b></td>'::text, ''::text) AS nb_cccuarc,
            string_agg(('<td align=center><b>'::text || tccncarc.nb_ccncuarc) || '</b></td>'::text, ''::text) AS nb_ccncuarc,
            string_agg(('<td align=center><b>'::text ||
                CASE
                    WHEN tccncc_arc.nb_ccnccu_arc IS NULL THEN '0%'::character varying::text
                    ELSE round(tccncc_arc.nb_ccnccu_arc / (tccncarc.nb_ccncuarc + tccncc_arc.nb_ccnccu_arc) * 100::numeric, 1) || '%'::text
                END) || '</td>'::text, ''::text) || '</tr>'::text AS tx_ccnccu_arc,
            string_agg(('<td align=center><b>'::text ||
                CASE
                    WHEN tcccarc.nb_cccuarc IS NULL THEN '0%'::character varying::text
                    ELSE round(tcccarc.nb_cccuarc / NULLIF(tccarc.nb_ccuarc, 0::numeric) * 100::numeric, 1) || '%'::text
                END) || '</td>'::text, ''::text) || '</tr>'::text AS tx_cccu_arc,
            string_agg(('<td align=center><b><font size=1>'::text ||
                CASE
                    WHEN tccncc_arc.nb_ccnccu_arc IS NULL THEN 0::numeric
                    ELSE tccncc_arc.nb_ccnccu_arc
                END) || '</td>'::text, ''::text) || '</tr>'::text AS nb_ccnccu_arc,
            a.insee,
            a.commune
           FROM req_annee a
             LEFT JOIN req_tcc tcc ON a.cle = tcc.cle
             LEFT JOIN req_tccc tccc ON a.cle = tccc.cle
             LEFT JOIN req_tccnc tccnc ON a.cle = tccnc.cle
             LEFT JOIN req_tccncc tccncc ON a.cle = tccncc.cle
             LEFT JOIN req_tccarc tccarc ON "right"(a.cle, 4) = tccarc.cle
             LEFT JOIN req_tcccarc tcccarc ON "right"(a.cle, 4) = tcccarc.cle
             LEFT JOIN req_tccncarc tccncarc ON "right"(a.cle, 4) = tccncarc.cle
             LEFT JOIN req_tccncc_arc tccncc_arc ON "right"(a.cle, 4) = tccncc_arc.cle
          GROUP BY a.insee, a.commune
          ORDER BY a.insee
        )
 SELECT row_number() OVER () AS id,
    ((((((((((((((((((((('<table border=1 align=center><tr><td colspan="2">&nbsp;</td>'::text || req_d.annee) || '</tr>'::text) || string_agg(req_d.tableau, ''::text)) || '<tr><td rowspan="6"><b>ARC<b></td><td><b>Total</b></td>'::text) || req_d.nb_ccuarc) || '</tr>'::text) || '<tr><td><b>Conforme</b></td>'::text) || req_d.nb_cccuarc) || '</tr>'::text) || '<tr><td><b>Non conforme</b></td>'::text) || req_d.nb_ccncuarc) || '</tr>'::text) || '<tr><td><b>Taux de conformité<sup>(3)</sup><b/></td>'::text) || req_d.tx_cccu_arc) || '</tr>'::text) || '<tr><td><b>Taux de mise en conformité<sup>(2)</sup><b/></td>'::text) || req_d.tx_ccnccu_arc) || '</tr>'::text) || '<tr><td><b><font size=1>Nombre de contrôle mis en conformité</font></b></td>'::text) || req_d.nb_ccnccu_arc) || '</tr>'::text) || '</table>'::text AS tableau1
   FROM req_d
  GROUP BY req_d.annee, req_d.nb_ccuarc, req_d.nb_cccuarc, req_d.nb_ccncuarc, req_d.tx_ccnccu_arc, req_d.nb_ccnccu_arc, req_d.tx_cccu_arc;

COMMENT ON VIEW m_reseau_humide.xapps_an_v_euep_cc_tb1 IS 'Vue applicative formattant le tableau de bord n°1 des contrôles de conformité AC pour affichage dans GEO';

															    
-- ####################################################### VIEW - xapps_an_v_euep_cc_tb2 #################################################################

-- COMMENT GB : -----------------------------------------------------------------------------------------------------------------------------------------------------
-- vue permettant de générer le code HTML et les résultats du tableau n°2 du tableau de bord (contrôle par prestataire)
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- m_reseau_humide.xapps_an_v_euep_cc_tb2 source

CREATE OR REPLACE VIEW m_reseau_humide.xapps_an_v_euep_cc_tb2
AS WITH req_d AS (
         WITH req_a AS (
                 SELECT DISTINCT g.code || to_char(cc.ccdate, 'YYYY'::text) AS cle,
                    to_char(cc.ccdate, 'YYYY'::text) AS annee,
                    g.valeur
                   FROM m_reseau_humide.an_euep_cc cc,
                    m_reseau_humide.lt_euep_cc_certificateur g
                  ORDER BY (g.code || to_char(cc.ccdate, 'YYYY'::text))
                ), req_compte AS (
                 SELECT DISTINCT a.code || to_char(cc.ccdate, 'YYYY'::text) AS cle,
                    count(*) OVER (PARTITION BY (to_char(cc.ccdate, 'YYYY'::text)), a.code) AS nb
                   FROM m_reseau_humide.an_euep_cc cc
                     JOIN m_reseau_humide.lt_euep_cc_certificateur a ON cc.certtype = a.code
                  ORDER BY (a.code || to_char(cc.ccdate, 'YYYY'::text))
                )
         SELECT DISTINCT row_number() OVER () AS id,
            (((('<tr>'::text || '<td>'::text) || req_a.valeur::text) || '</td>'::text) || string_agg(('<td align=center>'::text ||
                CASE
                    WHEN req_compte.nb IS NOT NULL THEN req_compte.nb
                    ELSE 0::bigint
                END) || '</td>'::text, ''::text ORDER BY req_a.annee)) || '</tr>'::text AS tableau,
            string_agg(('<td>'::text || req_a.annee) || '</td>'::text, ''::text ORDER BY req_a.annee) AS annee
           FROM req_a
             LEFT JOIN req_compte ON req_compte.cle = req_a.cle
          GROUP BY req_a.valeur
        )
 SELECT row_number() OVER () AS id,
    ((('<table border=1 align=center><tr><td>&nbsp;</td>'::text || req_d.annee) || '</tr>'::text) || string_agg(req_d.tableau, ''::text)) || '</table>'::text AS tableau1
   FROM req_d
  GROUP BY req_d.annee;

COMMENT ON VIEW m_reseau_humide.xapps_an_v_euep_cc_tb2 IS 'Vue applicative formatant le tableau de bord n°2 des contrôles de conformité AC (nombre de contrôle par prestataire) pour affichage dans GEO';

-- ####################################################### VIEW - xapps_an_v_euep_cc_tb3 #################################################################															    

-- m_reseau_humide.xapps_an_v_euep_cc_tb3 source

CREATE OR REPLACE VIEW m_reseau_humide.xapps_an_v_euep_cc_tb3
AS SELECT DISTINCT cc.certtype,
    lt.valeur AS certnom,
    to_char(cc.ccdate, 'YYYY'::text) AS annee,
    count(*) AS nb_cc
   FROM m_reseau_humide.an_euep_cc cc
     LEFT JOIN m_reseau_humide.lt_euep_cc_certificateur lt ON cc.certtype = lt.code
  GROUP BY cc.certtype, lt.valeur, (to_char(cc.ccdate, 'YYYY'::text))
  ORDER BY lt.valeur;

COMMENT ON VIEW m_reseau_humide.xapps_an_v_euep_cc_tb3 IS 'Vue applicative formatant une table pour la réalisation des statistiques par certificateur dans GEO';

-- Permissions

ALTER TABLE m_reseau_humide.xapps_an_v_euep_cc_tb3 OWNER TO create_sig;
GRANT ALL ON TABLE m_reseau_humide.xapps_an_v_euep_cc_tb3 TO create_sig;
GRANT SELECT ON TABLE m_reseau_humide.xapps_an_v_euep_cc_tb3 TO sig_read;
GRANT ALL ON TABLE m_reseau_humide.xapps_an_v_euep_cc_tb3 TO sig_create;
GRANT INSERT, DELETE, SELECT, UPDATE ON TABLE m_reseau_humide.xapps_an_v_euep_cc_tb3 TO sig_edit;

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

-- ##################################### FONCTION TRIGGER - ft_m_an_euep_cc_delete ##################################################################################

-- DROP FUNCTION m_reseau_humide.ft_m_an_euep_cc_delete();

CREATE OR REPLACE FUNCTION m_reseau_humide.ft_m_an_euep_cc_delete()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$

BEGIN

-- gestion des suppressions des contrôles (uniquement possible si admin dans GEO, accès à la valeur 40 de la liste de valeurs lt_euep_cc_valid
IF (new.ccvalid = '40') THEN

DELETE FROM m_reseau_humide.an_euep_cc_media WHERE id = (SELECT idcc FROM m_reseau_humide.an_euep_cc WHERE idcc = OLD.idcc);
DELETE FROM m_reseau_humide.an_euep_cc WHERE idcc = OLD.idcc;
END IF;

RETURN NEW;

END;
$function$
;

COMMENT ON FUNCTION m_reseau_humide.ft_m_an_euep_cc_delete() IS 'Fonction trigger pour supprimer un contrôle';

create trigger t_t2_an_euep_cc_delete after
update
    on
    m_reseau_humide.an_euep_cc for each row execute procedure m_reseau_humide.ft_m_an_euep_cc_delete();

-- ##################################### FONCTION TRIGGER - ft_m_an_euep_cc_insert ##################################################################################

-- DROP FUNCTION m_reseau_humide.ft_m_an_euep_cc_insert();

CREATE OR REPLACE FUNCTION m_reseau_humide.ft_m_an_euep_cc_insert()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$


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
UPDATE m_reseau_humide.an_euep_cc SET nidccp = null WHERE nidccp = '';
UPDATE m_reseau_humide.an_euep_cc SET proprioadcp = null WHERE proprioadcp = '';

RETURN NEW;

END;
$function$
;

COMMENT ON FUNCTION m_reseau_humide.ft_m_an_euep_cc_insert() IS 'Fonction trigger nettoyer les valeurs '' en null';

create trigger t_t3_an_euep_cc_insert after
insert
    on
    m_reseau_humide.an_euep_cc for each row execute procedure m_reseau_humide.ft_m_an_euep_cc_insert();

-- ##################################### FONCTION TRIGGER - ft_m_an_euep_cc_insert_update ##################################################################################
-- DROP FUNCTION m_reseau_humide.ft_m_an_euep_cc_insert_update();

CREATE OR REPLACE FUNCTION m_reseau_humide.ft_m_an_euep_cc_insert_update()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
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
	    (SELECT (SELECT insee FROM x_apps.xapps_geo_vmr_adresse WHERE id_adresse = new.id_adresse) || 'cc' || (SELECT (max(substring(nidcc from 8 for 5)::integer) +1)::character varying FROM m_reseau_humide.an_euep_cc WHERE nidcc like '60%' AND nidcc like '%cc%' ) as nnidcc)
		ELSE 
		CASE WHEN (new.nidcc is null or new.nidcc = '') or (new.nidcc not in (select nidcc from m_reseau_humide.an_euep_cc)) THEN 'zz' ELSE lower(new.nidcc) END
	    END;

	   
-- vérification sur la saisie des n° de dossier : compte le nombre de dossier validé et conforme (si = 0 peut insérer si non ne fait rien)
t1_nidcc := (select count(*) from m_reseau_humide.an_euep_cc where nidcc=new.nidcc and ccvalid='10' and rcc='10');
-- vérification sur la saisie des n° de dossier : compte le nombre de dossier non validé (si >= 1 ne peut pas insérer un suivi de dossier sur un même dossier non validé)
t2_nidcc := (select count(*) from m_reseau_humide.an_euep_cc where nidcc=new.nidcc and ccvalid <> '10');


-- INSERT
IF (TG_OP = 'INSERT') THEN

-- gestion des messages d'erreur à la mise à jour (remonté dans GEO)
-- contrôle sur le n° de dossier en suivi : ne peut pas saisir un suivi si le n° de dossier saisi n'existe pas à l'adresse CONFORME et VALIDE
-- ici pas possibilité de remontée de message dans le fiche GEO. L'enregistrement ne se fait pas.

IF NEW.tnidcc = '20' AND new.nidcc not in (select nidcc from m_reseau_humide.an_euep_cc) THEN

RAISE EXCEPTION 'Référence du dossier incorrecte. Veuillez inscrire la référence du dossier originel qui doit être sous cette forme "60159cc569".<br><br>';

/*
INSERT INTO x_apps.xapps_an_v_euep_cc_erreur VALUES
(
nextval('x_apps.xapps_an_v_euep_cc_erreur_gid_seq'::regclass),
new.id_adresse,
new.nidcc,
'Référence du dossier incorrecte. Votre contrôle ne sera pas soumis à validation.<br>
Merci d''inscrire la référence du dossier originel qui doit être sous cette forme <i>(60159cc569)</i>.',
now()
);
*/

END IF;



-- ###############################################################################
-- NOUVEAU MESSAGE INDUIT PAR LA MISE A JOUR DES CONFORMITES GRAVE AU 01/01/2024
if new.euanomal = '10' and (new.euobserv is null or new.euobserv ='') THEN
RAISE EXCEPTION 'Vous devez saisir les anomalies constatées si vous indiquez des anomalies constatées dans la partie collecte des eaux usées<br><br>';
end if;

if new.epracdp = '10' and new.epracdpdom IN ('00', 'ZZ') THEN
RAISE EXCEPTION 'Vous devez indiquer "Raccordement au réseau public" ou "Raccordement caniveau (gargouille)" si vous indiquez la présence d''un raccordement au réseau public d''évacuation des EP <br><br>';
end if;

if new.date_notif is null and new.date_rel is not null then 
RAISE EXCEPTION 'Vous devez saisir une date de notification avant une date de relance<br><br>';
end if;

if new.date_rel::timestamp < new.date_notif::timestamp or new.date_rel::timestamp = new.date_notif::timestamp then 
RAISE EXCEPTION 'Vous ne pouvez pas saisir une date de relance inférieure ou égale à la date de notification<br><br>';
end if;

if new.eppar = '10' and (new.epparpre is null or new.epparpre = '') then 
RAISE EXCEPTION 'Vous avez indiqué "OUI" pour les EP traitées à la parcelle. Vous devez donc obligatoirement préciser le traitement<br><br>';
end if;

if new.eurefl IN ('00','ZZ') and new.eubrsch = '10' then 
RAISE EXCEPTION 'Vous ne pouvez pas indiquer "Non renseigné" ou "Non concerné" pour la protection d''un système anti reflux si vous avez indiqué "OUI" pour la présence d''installations domestiques sous le niveau de la chaussée (dans la partie des EU)<br><br>';
end if;

if new.eprecupcpt IN ('00') and new.eprecup = '10' then 
RAISE EXCEPTION 'Vous ne pouvez pas indiquer "Non renseigné" en cas d''utilisation des eaux pluviales récupérées à usage domestique, présence impérative d''un compteur, si vous avez indiqué "OUI" pour la présence d''un système de récupération des eaux pluviales (dans la partie des EP)<br><br>';
end if;

if new.euepconstd is true and (new.euepdivers is null or new.euepdivers = '') then 
RAISE EXCEPTION 'Vous devez préciser les constations diverses observées sur le réseau d''assainissement<br><br>';
end if;

-- ###############################################################################

-- si le n° de dossier est nouveau
IF v_nidcc <> 'zz' AND t1_nidcc = 0 AND t2_nidcc = 0 THEN

--new.idcc :=  (select nextval('m_reseau_humide.an_euep_cc_idcc_seq'::regclass)) ;
new.nidcc := v_nidcc;
new.ccinit := v_ccinit;

new.rrechype := CASE WHEN new.rrebrtype = '10' or new.rrebrtype = 'ZZ' THEN 'ZZ' ELSE new.rrechype END;
new.eusuptype := CASE WHEN new.eusup = '20' THEN 'ZZ' ELSE new.eusuptype END;
new.eusupdoc := CASE WHEN new.eusup = '20' THEN 'ZZ' ELSE new.eusupdoc END;
new.eprecupcpt := CASE WHEN new.eprecup = '20' THEN 'ZZ' ELSE new.eprecupcpt END;
new.epracdpdom := case when new.epracdp = '20' then 'ZZ' else new.epracdpdom end;
new.rcc := case 
			when (new.euepanomal like '%2%' or new.euepanomal like '%3%' or new.euepanomal like '%11%' or new.euepanomal like '%18%' or new.euepanomal like '%17%') then '22' 
			when new.euepanomal is null or new.euepanomal = '' then '10'
			else '21' end;		   
new.dbinsert := now();
new.scr_geom := '61';

END IF;

-- si le n° de dossier est un suivi

IF NEW.tnidcc = '20' AND new.nidcc in (select nidcc from m_reseau_humide.an_euep_cc) THEN

new.rrechype := CASE WHEN new.rrebrtype = '10' or new.rrebrtype = 'ZZ' THEN 'ZZ' ELSE new.rrechype END;
new.eusuptype := CASE WHEN new.eusup = '20' THEN 'ZZ' ELSE new.eusuptype END;
new.eusupdoc := CASE WHEN new.eusup = '20' THEN 'ZZ' ELSE new.eusupdoc END;
new.eprecupcpt := CASE WHEN new.eprecup = '20' THEN 'ZZ' ELSE new.eprecupcpt END;
new.epracdpdom := case when new.epracdp = '20' then 'ZZ' else new.epracdpdom end;
new.rcc := case 
			when (new.euepanomal like '%2%' or new.euepanomal like '%3%' or new.euepanomal like '%11%' or new.euepanomal like '%18%' or new.euepanomal like '%17%') then '22' 
			when new.euepanomal is null or new.euepanomal = '' then '10'
			else '21' end;			   
new.dbinsert := now();
new.scr_geom := '61';

END IF;
end if;

--RETURN NEW;

-- UPDATE

IF (TG_OP = 'UPDATE') then

--raise exception 'operateur --> %', new.op_maj;

-- si contrôle toujours pas validé je peux modifier donc contrôle sur rcc

if new.ccvalid = old.ccvalid and new.ccvalid <> '10' then

new.rcc := case 
			when (new.euepanomal like '%2%' or new.euepanomal like '%3%' or new.euepanomal like '%11%' or new.euepanomal like '%18%' or new.euepanomal like '%17%') then '22' 
			when new.euepanomal is null or new.euepanomal = '' then '10'
			else '21' end;	
/*
-- si je modifie les anomalies et que je n'ai plus celles en grave ma conclusion ne peut pas être grave
if (new.euepanomal not like '%2%' and new.euepanomal not like '%3%' and new.euepanomal not like '%11%' and new.euepanomal not like '%18%' or new.euepanomal like '%17%') and new.rcc = '22' and new.ccvalid <> '10' then 
 raise exception 'Vous n''avez plus d''anomalies générant une conformité non grave, vous devez modifier le niveau de conformité de l''installation.<br><br>';
end if;
*/
-- ###############################################################################
-- NOUVEAU MESSAGE INDUIT PAR LA MISE A JOUR DES CONFORMITES GRAVE AU 01/01/2024
if new.euanomal = '10' and (new.euobserv is null or new.euobserv ='') THEN
RAISE EXCEPTION 'Vous devez saisir les anomalies constatées si vous indiquez des anomalies constatées dans la partie collecte des eaux usées<br><br>';
end if;

if new.epracdp = '10' and new.epracdpdom IN ('00', 'ZZ') THEN
RAISE EXCEPTION 'Vous devez indiquer "Raccordement au réseau public" ou "Raccordement caniveau (gargouille)" si vous indiquez la présence d''un raccordement au réseau public d''évacuation des EP <br><br>';
end if;

if new.date_notif is null and new.date_rel is not null then 
RAISE EXCEPTION 'Vous devez saisir une date de notification avant une date de relance<br><br>';
end if;

if new.date_rel::timestamp < new.date_notif::timestamp or new.date_rel::timestamp = new.date_notif::timestamp then 
RAISE EXCEPTION 'Vous ne pouvez pas saisir une date de relance inférieure ou égale à la date de notification<br><br>';
end if;

if new.eppar = '10' and (new.epparpre is null or new.epparpre = '') then 
RAISE EXCEPTION 'Vous avez indiqué "OUI" pour les EP traitées à la parcelle. Vous devez donc obligatoirement préciser le traitement<br><br>';
end if;

if new.eurefl IN ('00','ZZ') and new.eubrsch = '10' then 
RAISE EXCEPTION 'Vous ne pouvez pas indiquer "Non renseigné" ou "Non concerné" pour la protection d''un système anti reflux si vous avez indiqué "OUI" pour la présence d''installations domestiques sous le niveau de la chaussée (dans la partie des EU)<br><br>';
end if;

if new.eprecupcpt IN ('00') and new.eprecup = '10' then 
RAISE EXCEPTION 'Vous ne pouvez pas indiquer "Non renseigné" en cas d''utilisation des eaux pluviales récupérées à usage domestique, présence impérative d''un compteur, si vous avez indiqué "OUI" pour la présence d''un système de récupération des eaux pluviales (dans la partie des EP)<br><br>';
end if;

if new.euepconstd is true and (new.euepdivers is null or new.euepdivers = '') then 
RAISE EXCEPTION 'Vous devez préciser les constations diverses observées sur le réseau d''assainissement<br><br>';
end if;

-- ###############################################################################

end if;

-- gestion des contrôles non supprimés (les supprimés sont gérés dans un trigger after)
-- (uniquement possible si admin dans GEO, accès à la valeur 40 de la liste de valeurs lt_euep_cc_valid
-- gestion des contrôles (uniquement possible si valeur indiqué dans l'attribut cc_valid attaché à l'utilisateur dans GEO, accès à la valeur 50 de la liste de valeurs lt_euep_cc_valid)

-- si le contrôle est à supprimer, passe en dehors des contrôles ci-dessous et passera dans le trigger after
-- si le contrôle est à dévalider passe dans la première boucle
IF (new.ccvalid = '50') THEN
new.ccvalid := '30';
new.ccinit := old.ccinit ;
new.adapt := old.adapt ;
new.adeta := old.adeta ;
new.tnidcc := old.tnidcc ;
new.nidcc := old.nidcc ;
new.rcc := old.rcc ;
new.ccdate := old.ccdate ;
new.ccbien := old.ccbien ;
new.certtype := old.certtype ;
new.certnom := old.certnom ;
new.certpre := old.certpre ;
new.propriopat := old.propriopat ;
new.propriopatp := old.propriopatp ;
new.proprionom := old.proprionom ;
new.propriopre := old.propriopre ;
new.proprioad := old.proprioad ;
new.dotype := old.dotype ;
new.doaut := old.doaut ;
new.donom := old.donom ;
new.dopre := old.dopre ;
new.doad := old.doad ;
new.achetpat := old.achetpat ;
new.achetpatp := old.achetpatp ;
new.achetnom := old.achetnom ;
new.achetpre := old.achetpre ;
new.achetad := old.achetad ;
new.batitype := old.batitype ;
new.batiaut := old.batiaut ;
new.eppublic := old.eppublic ;
new.epaut := old.epaut ;
new.rredptype := old.rredptype ;
new.rrebrtype := old.rrebrtype ;
new.rrechype := old.rrechype ;
new.eupc := old.eupc ;
new.euevent := old.euevent ;
new.euregar := old.euregar ;
new.euregardp := old.euregardp ;
new.eusup := old.eusup ;
new.eusuptype := old.eusuptype ;
new.eusupdoc := old.eusupdoc ;
new.euecoul := old.euecoul ;
new.eufluo := old.eufluo ;
new.eubrsch := old.eubrsch ;
new.eurefl := old.eurefl ;
new.euepsep := old.euepsep ;
new.eudivers := old.eudivers ;
new.euanomal := old.euanomal ;
new.euobserv := old.euobserv ;
new.eusiphon := old.eusiphon ;
new.epdiagpc := old.epdiagpc ;
new.epracpc := old.epracpc ;
new.epregarcol := old.epregarcol ;
new.epregarext := old.epregarext ;
new.epracdp := old.epracdp ;
new.eppar := old.eppar ;
new.epparpre := old.epparpre ;
new.epfum := old.epfum ;
new.epecoul := old.epecoul ;
new.epecoulobs := old.epecoulobs ;
new.eprecup := old.eprecup ;
new.eprecupcpt := old.eprecupcpt ;
new.epautre := old.epautre ;
new.epobserv := old.epobserv ;
new.euepanomal := old.euepanomal ;
new.euepanomalpre := old.euepanomalpre ;
new.euepdivers := old.euepdivers ;
new.dbinsert := old.dbinsert ;
new.dbupdate := old.dbupdate ;
new.op_sai := old.op_sai ;
new.scr_geom := old.scr_geom ;
new.nidccp := old.nidccp ;
new.proprioadcp := old.proprioadcp ;
new.date_notif := old.date_notif ;
new.date_rel := old.date_rel ;
new.epracdpdom := old.epracdpdom ;
new.euepconstd := old.euepconstd ;

-- ###############################################################################
-- NOUVEAU MESSAGE INDUIT PAR LA MISE A JOUR DES CONFORMITES GRAVE AU 01/01/2024
if new.euanomal = '10' and (new.euobserv is null or new.euobserv ='') THEN
RAISE EXCEPTION 'Vous devez saisir les anomalies constatées si vous indiquez des anomalies constatées dans la partie collecte des eaux usées<br><br>';
end if;

if new.epracdp = '10' and new.epracdpdom IN ('00', 'ZZ') THEN
RAISE EXCEPTION 'Vous devez indiquer "Raccordement au réseau public" ou "Raccordement caniveau (gargouille)" si vous indiquez la présence d''un raccordement au réseau public d''évacuation des EP <br><br>';
end if;

if new.date_notif is null and new.date_rel is not null then 
RAISE EXCEPTION 'Vous devez saisir une date de notification avant une date de relance<br><br>';
end if;

if new.date_rel::timestamp < new.date_notif::timestamp or new.date_rel::timestamp = new.date_notif::timestamp then 
RAISE EXCEPTION 'Vous ne pouvez pas saisir une date de relance inférieure ou égale à la date de notification<br><br>';
end if;

if new.eppar = '10' and (new.epparpre is null or new.epparpre = '') then 
RAISE EXCEPTION 'Vous avez indiqué "OUI" pour les EP traitées à la parcelle. Vous devez donc obligatoirement préciser le traitement<br><br>';
end if;

if new.eurefl IN ('00','ZZ') and new.eubrsch = '10' then 
RAISE EXCEPTION 'Vous ne pouvez pas indiquer "Non renseigné" ou "Non concerné" pour la protection d''un système anti reflux si vous avez indiqué "OUI" pour la présence d''installations domestiques sous le niveau de la chaussée (dans la partie des EU)<br><br>';
end if;

if new.eprecupcpt IN ('00') and new.eprecup = '10' then 
RAISE EXCEPTION 'Vous ne pouvez pas indiquer "Non renseigné" en cas d''utilisation des eaux pluviales récupérées à usage domestique, présence impérative d''un compteur, si vous avez indiqué "OUI" pour la présence d''un système de récupération des eaux pluviales (dans la partie des EP)<br><br>';
end if;

if new.euepconstd is true and (new.euepdivers is null or new.euepdivers = '') then 
RAISE EXCEPTION 'Vous devez préciser les constations diverses observées sur le réseau d''assainissement<br><br>';
end if;

-- ###############################################################################

ELSE

IF (old.ccvalid = '10' AND new.ccvalid = '10') OR (old.ccvalid = '10' AND (new.ccvalid = '20' or new.ccvalid = '30')) THEN

--v_adresse := old.id_adresse;
/*
DELETE FROM x_apps.xapps_an_v_euep_cc_erreur WHERE nidcc = old.nidcc;
INSERT INTO x_apps.xapps_an_v_euep_cc_erreur VALUES
(
nextval('x_apps.xapps_an_v_euep_cc_erreur_gid_seq'::regclass),
old.id_adresse,
old.nidcc,
'Vous ne pouvez pas modifier un dossier validé.<br> Modifications non prises en compte.',
now()
);
*/

 -- si contrôle validé mais que je suis de l'ARC je peux modifier certains attributs si contrôle non conforme grave
 if new.maj_nc is true and new.ccvalid = '10' then 

    -- contrôle sur les dates
    if new.date_notif is null and new.date_rel is not null then 
		RAISE EXCEPTION 'Vous ne pouvez pas saisir une date de relance sans avoir saisie uen date de notification<br><br>';
	end if;
    if new.date_rel::timestamp < new.date_notif::timestamp+'6 month' or new.date_rel::timestamp = new.date_notif::timestamp then 
		RAISE EXCEPTION 'Vous ne pouvez pas saisir une date de relance inférieur à 6 mois par rapport à la date de notification<br><br>';
	end if;
 
    -- seuls les attributs modifiables peuvent l'être par les services de l'ARC si contrôle validé
    if new.ccvalid <> old.ccvalid or new.validobs <> old.validobs or new.adapt <> old.adapt
       or new.adeta <> old.adeta or new.tnidcc <> old.tnidcc or new.nidcc <> old.nidcc or new.ccdate <> old.ccdate 
       or new.ccbien <> old.ccbien or new.certnom <> old.certnom or new.certpre <> old.certpre or new.propriopat <> old.propriopat 
       or new.propriopatp <> old.propriopatp or new.propriopatp <> old.propriopatp or new.propriopre <> old.propriopre
	   or new.proprioad <> old.proprioad or new.dotype <> old.dotype or new.doaut <> old.doaut or new.donom <> old.donom
	   or new.dopre <> old.dopre or new.doad <> old.doad or new.batitype <> old.batitype or new.batiaut <> old.batiaut
	   or new.eppublic <> old.eppublic or new.epaut <> old.epaut or new.rredptype <> old.rredptype or new.rrebrtype <> old.rrebrtype
	   or new.rrechype <> old.rrechype or new.eupc <> old.eupc or new.euevent <> old.euevent or new.euregar <> old.euregar
	   or new.euregardp <> old.euregardp or new.eusup <> old.eusup or new.eusuptype <> old.eusuptype or new.eusupdoc <> old.eusupdoc
	   or new.euecoul <> old.euecoul or new.eufluo <> old.eufluo or new.eubrsch <> old.eubrsch or new.eurefl <> old.eurefl
	   or new.euepsep <> old.euepsep or new.eudivers <> old.eudivers or new.euanomal <> old.euanomal or new.euobserv <> old.euobserv
	   or new.eusiphon <> old.eusiphon or new.epdiagpc <> old.epdiagpc or new.epracpc <> old.epracpc or new.epregarcol <> old.epregarcol
       or new.epregarext <> old.epregarext or new.epracdp <> old.epracdp or new.eppar <> old.eppar or new.epparpre <> old.epparpre
	   or new.epfum <> old.epfum or new.epecoul <> old.epecoul or new.epecoulobs <> old.epecoulobs or new.eprecup <> old.eprecup
	   or new.eprecupcpt <> old.eprecupcpt or new.epautre <> old.epautre or new.epobserv <> old.epobserv or new.euepanomal <> old.euepanomal
	   or new.euepanomalpre <> old.euepanomalpre or new.euepdivers <> old.euepdivers or new.nidccp <> old.nidccp or new.proprioadcp <> old.proprioadcp
	   or new.epracdpdom <> old.epracdpdom or new.euepconstd <> old.euepconstd
	   then
	RAISE EXCEPTION 'Vous pouvez modifier uniquement les attributs liés à l''acheteur et les dates de notification et de relance pour un dossier validé.<br><br>' ;
    else 
     new.maj_nc := false;
    end if;
    if new.date_notif is not null and (new.achetnom is null or new.achetnom = '' or new.achetad is null or new.achetad ='') THEN
      RAISE EXCEPTION 'Vous pouvez saisir ou modifier une date de notification sans avoir renseigné au minimum un nom et une adresse pour l''acheteur<br><br>' ;
    end if;
     if new.date_rel is not null and (new.achetnom is null or new.achetnom = '' or new.achetad is null or new.achetad ='') THEN
      RAISE EXCEPTION 'Vous pouvez saisir ou modifier une date de relance sans avoir renseigné au minimum un nom et une adresse pour l''acheteur<br><br>' ;
    end if;
   else 
    
     if new.maj_nc is false and new.ccvalid = '10' then 
 		RAISE EXCEPTION 'Vous ne pouvez pas modifier un contrôle validé ok<br><br>' ;
	 end if;
   
    new.maj_nc := false;
 end if;


 
/*
new.ccvalid := old.ccvalid ;
new.validobs := old.validobs ;
new.ccinit := old.ccinit ;
new.adapt := old.adapt ;
new.adeta := old.adeta ;
new.tnidcc := old.tnidcc ;
new.nidcc := old.nidcc ;
new.rcc := old.rcc ;
new.ccdate := old.ccdate ;
new.ccbien := old.ccbien ;
new.certtype := old.certtype ;
new.certnom := old.certnom ;
new.certpre := old.certpre ;
new.propriopat := old.propriopat ;
new.propriopatp := old.propriopatp ;
new.proprionom := old.proprionom ;
new.propriopre := old.propriopre ;
new.proprioad := old.proprioad ;
new.dotype := old.dotype ;
new.doaut := old.doaut ;
new.donom := old.donom ;
new.dopre := old.dopre ;
new.doad := old.doad ;
new.achetpat := old.achetpat ;
new.achetpatp := old.achetpatp ;
new.achetnom := old.achetnom ;
new.achetpre := old.achetpre ;
new.achetad := old.achetad ;
new.batitype := old.batitype ;
new.batiaut := old.batiaut ;
new.eppublic := old.eppublic ;
new.epaut := old.epaut ;
new.rredptype := old.rredptype ;
new.rrebrtype := old.rrebrtype ;
new.rrechype := old.rrechype ;
new.eupc := old.eupc ;
new.euevent := old.euevent ;
new.euregar := old.euregar ;
new.euregardp := old.euregardp ;
new.eusup := old.eusup ;
new.eusuptype := old.eusuptype ;
new.eusupdoc := old.eusupdoc ;
new.euecoul := old.euecoul ;
new.eufluo := old.eufluo ;
new.eubrsch := old.eubrsch ;
new.eurefl := old.eurefl ;
new.euepsep := old.euepsep ;
new.eudivers := old.eudivers ;
new.euanomal := old.euanomal ;
new.euobserv := old.euobserv ;
new.eusiphon := old.eusiphon ;
new.epdiagpc := old.epdiagpc ;
new.epracpc := old.epracpc ;
new.epregarcol := old.epregarcol ;
new.epregarext := old.epregarext ;
new.epracdp := old.epracdp ;
new.eppar := old.eppar ;
new.epparpre := old.epparpre ;
new.epfum := old.epfum ;
new.epecoul := old.epecoul ;
new.epecoulobs := old.epecoulobs ;
new.eprecup := old.eprecup ;
new.eprecupcpt := old.eprecupcpt ;
new.epautre := old.epautre ;
new.epobserv := old.epobserv ;
new.euepanomal := old.euepanomal ;
new.euepanomalpre := old.euepanomalpre ;
new.euepdivers := old.euepdivers ;
new.dbinsert := old.dbinsert ;
new.dbupdate := old.dbupdate ;
new.op_sai := old.op_sai ;
new.scr_geom := old.scr_geom ;
new.nidccp := old.nidccp ;
new.proprioadcp := old.proprioadcp ;
new.date_notif := old.date_notif ;
new.date_rel := old.date_rel ;
new.epracdpdom := old.epracdpdom ;
new.euepconstd := old.euepconstd ;
*/

ELSE

-- pas le bon prestataire
IF old.certtype <> new.certtype  THEN
--v_adresse := old.id_adresse;

RAISE EXCEPTION 'Vous ne pouvez pas modifier un dossier que vous n''avez pas créé.<br><br>';
/*
DELETE FROM x_apps.xapps_an_v_euep_cc_erreur WHERE nidcc = old.nidcc;
INSERT INTO x_apps.xapps_an_v_euep_cc_erreur VALUES
(
nextval('x_apps.xapps_an_v_euep_cc_erreur_gid_seq'::regclass),
old.id_adresse,
old.nidcc,
'Vous ne pouvez pas modifier un dossier que vous n''avez pas créé.<br>Modifications non prises en compte.',
now()
);

new.ccvalid := old.ccvalid ;
new.validobs := old.validobs ;
new.ccinit := old.ccinit ;
new.adapt := old.adapt ;
new.adeta := old.adeta ;
new.tnidcc := old.tnidcc ;
new.nidcc := old.nidcc ;
new.rcc := old.rcc ;
new.ccdate := old.ccdate ;
new.ccbien := old.ccbien ;
new.certtype := old.certtype ;
new.certnom := old.certnom ;
new.certpre := old.certpre ;
new.propriopat := old.propriopat ;
new.propriopatp := old.propriopatp ;
new.proprionom := old.proprionom ;
new.propriopre := old.propriopre ;
new.proprioad := old.proprioad ;
new.dotype := old.dotype ;
new.doaut := old.doaut ;
new.donom := old.donom ;
new.dopre := old.dopre ;
new.doad := old.doad ;
new.achetpat := old.achetpat ;
new.achetpatp := old.achetpatp ;
new.achetnom := old.achetnom ;
new.achetpre := old.achetpre ;
new.achetad := old.achetad ;
new.batitype := old.batitype ;
new.batiaut := old.batiaut ;
new.eppublic := old.eppublic ;
new.epaut := old.epaut ;
new.rredptype := old.rredptype ;
new.rrebrtype := old.rrebrtype ;
new.rrechype := old.rrechype ;
new.eupc := old.eupc ;
new.euevent := old.euevent ;
new.euregar := old.euregar ;
new.euregardp := old.euregardp ;
new.eusup := old.eusup ;
new.eusuptype := old.eusuptype ;
new.eusupdoc := old.eusupdoc ;
new.euecoul := old.euecoul ;
new.eufluo := old.eufluo ;
new.eubrsch := old.eubrsch ;
new.eurefl := old.eurefl ;
new.euepsep := old.euepsep ;
new.eudivers := old.eudivers ;
new.euanomal := old.euanomal ;
new.euobserv := old.euobserv ;
new.eusiphon := old.eusiphon ;
new.epdiagpc := old.epdiagpc ;
new.epracpc := old.epracpc ;
new.epregarcol := old.epregarcol ;
new.epregarext := old.epregarext ;
new.epracdp := old.epracdp ;
new.eppar := old.eppar ;
new.epparpre := old.epparpre ;
new.epfum := old.epfum ;
new.epecoul := old.epecoul ;
new.epecoulobs := old.epecoulobs ;
new.eprecup := old.eprecup ;
new.eprecupcpt := old.eprecupcpt ;
new.epautre := old.epautre ;
new.epobserv := old.epobserv ;
new.euepanomal := old.euepanomal ;
new.euepanomalpre := old.euepanomalpre ;
new.euepdivers := old.euepdivers ;
new.dbinsert := old.dbinsert ;
new.dbupdate := old.dbupdate ;
new.op_sai := old.op_sai ;
new.scr_geom := old.scr_geom ;
new.nidccp := old.nidccp ;
new.proprioadcp := old.proprioadcp ;
new.date_notif := old.date_notif ;
new.date_rel := old.date_rel ;
new.epracdpdom := old.epracdpdom ;
new.euepconstd := old.euepconstd ;
*/
ELSE

-- ne peut pas modifier le n° de dossier sauf si mauvaise référence de suivi
-- si référence différente alors
IF (new.nidcc <> old.nidcc) THEN

-- si la référence saisie n'est toujours formatée ou n'est pas en base (contrôle originel)
IF (new.nidcc not like '60%' AND new.nidcc not like '%cc%') OR (new.nidcc not in (select nidcc from m_reseau_humide.an_euep_cc)) THEN

RAISE EXCEPTION 'Référence du dossier incorrecte ou dossier originel n''existe pas. Merci d''inscrire la référence exacte du dossier originel qui doit être sous cette forme "60159cc569".<br><br>';

/*
--v_adresse := old.id_adresse;
DELETE FROM x_apps.xapps_an_v_euep_cc_erreur WHERE nidcc = old.nidcc;
INSERT INTO x_apps.xapps_an_v_euep_cc_erreur VALUES
(
nextval('x_apps.xapps_an_v_euep_cc_erreur_gid_seq'::regclass),
old.id_adresse,
old.nidcc,
'Référence du dossier incorrecte ou dossier originel n''existe pas. <br>
Votre contrôle ne sera pas soumis à validation.<br>
Merci d''inscrire la référence exacte du dossier originel qui doit être sous cette forme <i>(60159cc569)</i>.',
now()
);
new.nidcc := old.nidcc;
*/
else

-- si la référence est normalisée et que le contrôle originel existe je prends la nouvelle référence sinon erreur
IF (new.nidcc like '60%' AND new.nidcc like '%cc%') AND (new.nidcc in (select nidcc from m_reseau_humide.an_euep_cc)) THEN
	IF (new.nidcc like '60%' AND new.nidcc like '%cc%') AND (old.nidcc like '60%' AND old.nidcc like '%cc%') then
	
	RAISE EXCEPTION 'Vous ne pouvez pas modifier un n° de dossier avec une référence existante. Faites une demande au service assainissement de l''ARC en cas d''erreur.<br><br>';

	
	/*
	DELETE FROM x_apps.xapps_an_v_euep_cc_erreur WHERE nidcc = old.nidcc;
	INSERT INTO x_apps.xapps_an_v_euep_cc_erreur VALUES
	(
	nextval('x_apps.xapps_an_v_euep_cc_erreur_gid_seq'::regclass),
	old.id_adresse,
	old.nidcc,
	'Vous ne pouvez pas modifier un n° de dossier avec une référence existante.<br>
	Faites une demande au service assainissement de l''ARC en cas d''erreur.<br> Les autres informations modifiées ont été prises en compte.',
	now()
	);
	new.nidcc := old.nidcc;
	*/
	
	ELSE

	new.nidcc := new.nidcc;
	
	END IF;

ELSE

	RAISE EXCEPTION 'Vous ne pouvez pas modifier un n° de dossier.<br><br>';


/*
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
new.nidcc := old.nidcc;
*/

END IF;
END IF;

ELSE

-- ne peut pas modifier un suivi de dossier ou nouveau dossier
IF new.tnidcc <> old.tnidcc THEN

RAISE EXCEPTION 'Vous ne pouvez pas modifier le type de contrôle.<br><br>';

/*
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
new.tnidcc := old.tnidcc;
*/
ELSE

-- si le prestataire qui modifie est celui qui a saisi modifications possibles
IF old.certtype = new.certtype THEN

-- si le contrôle n'est pas validé alors on peut modifier les valeurs si non pas de modification possible
IF ((new.ccvalid = '20' or new.ccvalid = '30') and (old.ccvalid = '20' or old.ccvalid='30')) or (new.ccvalid = '10' and (old.ccvalid = '20' or old.ccvalid='30')) THEN

new.ccvalid := CASE 
	  WHEN new.ccvalid = '20' and old.ccvalid = '20' THEN '20'
	  WHEN new.ccvalid = '30' and old.ccvalid = '30' THEN '30'
	  WHEN new.ccvalid = '30' and old.ccvalid = '20' THEN '30'
	  WHEN new.ccvalid = '20' and old.ccvalid = '30' THEN '20'
	  WHEN new.ccvalid = '10' and (old.ccvalid = '20' or old.ccvalid = '30') THEN '10'
	  WHEN new.ccvalid = '20' and old.ccvalid = '10' THEN '20'
	  WHEN new.ccvalid = '30' and old.ccvalid = '10' THEN '30'
	  END;
new.validobs := CASE WHEN new.ccvalid = '30' THEN new.validobs ELSE null END;
new.rrechype := CASE WHEN new.rrebrtype = '10' or new.rrebrtype = 'ZZ' THEN 'ZZ' ELSE new.rrechype END;
new.eusuptype := CASE WHEN new.eusup = '20' THEN 'ZZ' ELSE new.eusuptype END;
new.eusupdoc := CASE WHEN new.eusup = '20' THEN 'ZZ' ELSE new.eusupdoc END;
new.eprecupcpt := CASE WHEN new.eprecup = '20' THEN 'ZZ' ELSE new.eprecupcpt END;
new.rcc := case 
			when (new.euepanomal like '%2%' or new.euepanomal like '%3%' or new.euepanomal like '%11%' or new.euepanomal like '%18%' or new.euepanomal like '%17%') then '22' 
			when new.euepanomal is null or new.euepanomal = '' then '10'
			else '21' end;	
new.dbupdate := now();

RETURN NEW;

END IF;
END IF;
END IF;
END IF;
END IF;
END IF;
END IF;

END IF;


RETURN NEW;


END;
$function$
;

COMMENT ON FUNCTION m_reseau_humide.ft_m_an_euep_cc_insert_update() IS 'Fonction trigger pour mise à jour des attributs des dossiers de conformité';

create trigger t_t1_an_euep_cc_update_insert before
insert
    or
update
    on;
    m_reseau_humide.an_euep_cc for each row execute procedure m_reseau_humide.ft_m_an_euep_cc_insert_update();
												 
-- ##################################### FONCTION TRIGGER - ft_m_an_v_euep_cc_media ##################################################################################


-- FUNCTION: m_reseau_humide.ft_m_an_v_euep_cc_media()

-- DROP FUNCTION m_reseau_humide.ft_m_an_v_euep_cc_media();

CREATE FUNCTION m_reseau_humide.ft_m_an_v_euep_cc_media()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF 
AS $BODY$

DECLARE t_valid integer;

BEGIN

-- recherche si le contrôle est validé, dans ce cas 1 et pas possible d'insérer, de mettre à jour ou de supprimer un média
--t_valid := (SELECT count(*) from m_reseau_humide.an_euep_cc where idcc=new.id and ccvalid ='10');

-- si le controle n'est pas validé
--IF t_valid = 0 THEN

-- INSERT
IF (TG_OP = 'INSERT') THEN

INSERT INTO m_reseau_humide.an_euep_cc_media (gid,id,media,miniature,n_fichier,t_fichier,op_sai,date_sai,l_type,l_prec)
SELECT nextval('m_reseau_humide.an_euep_cc_media_gid_seq'::regclass),new.id,new.media,new.miniature,new.n_fichier,new.t_fichier,new.op_sai,new.date_sai,new.l_type,new.l_prec
WHERE (SELECT count(*) from m_reseau_humide.an_euep_cc where idcc=new.id and ccvalid ='10') = 0;

-- UPDATE
ELSIF (TG_OP = 'UPDATE') THEN
UPDATE m_reseau_humide.an_euep_cc_media 
SET
op_sai = new.op_sai,
date_sai = new.date_sai,
l_type = new.l_type,
l_prec = new.l_prec
WHERE gid = new.gid AND (SELECT count(*) from m_reseau_humide.an_euep_cc where idcc=new.id and ccvalid ='10') = 0;

-- DELETE
ELSIF (TG_OP = 'DELETE') THEN

DELETE FROM m_reseau_humide.an_euep_cc_media WHERE  gid = old.gid AND (SELECT count(*) from m_reseau_humide.an_euep_cc where idcc=old.id and ccvalid ='10') = 0;

END IF;

--END IF;

RETURN NEW;

-- si validé on fait rien

END;
$BODY$;

ALTER FUNCTION m_reseau_humide.ft_m_an_v_euep_cc_media()
    OWNER TO sig_create;

GRANT EXECUTE ON FUNCTION m_reseau_humide.ft_m_an_v_euep_cc_media() TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_humide.ft_m_an_v_euep_cc_media() TO create_sig;
GRANT EXECUTE ON FUNCTION m_reseau_humide.ft_m_an_v_euep_cc_media() TO PUBLIC;

COMMENT ON FUNCTION m_reseau_humide.ft_m_an_v_euep_cc_media()
    IS 'Fonction trigger pour la gestion de l''insertion des médias des dossiers de conformité';

-- Trigger: t_t1_an_v_euep_cc_media on m_reseau_humide.ft_m_an_v_euep_cc_media

-- DROP TRIGGER t_t1_an_v_euep_cc_media ON m_reseau_humide.ft_m_an_v_euep_cc_media;

CREATE TRIGGER t_t1_an_v_euep_cc_media
  INSTEAD OF INSERT OR UPDATE
  ON m_reseau_humide.an_v_euep_cc_media
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_humide.ft_m_an_v_euep_cc_media();





-- ##################################### FONCTION TRIGGER - ft_m_log_an_euep_cc ##################################################################################


-- Function: m_reseau_humide.ft_m_log_an_euep_cc()

-- DROP FUNCTION m_reseau_humide.ft_m_log_an_euep_cc();

CREATE OR REPLACE FUNCTION m_reseau_humide.ft_m_log_an_euep_cc()
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
ALTER FUNCTION m_reseau_humide.ft_m_log_an_euep_cc()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_humide.ft_m_log_an_euep_cc() TO public;
GRANT EXECUTE ON FUNCTION m_reseau_humide.ft_m_log_an_euep_cc() TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_humide.ft_m_log_an_euep_cc() TO create_sig;


COMMIT;
												 
CREATE TRIGGER t_t2_log_an_euep_cc_insert_update
  AFTER INSERT OR UPDATE
  ON m_reseau_humide.an_euep_cc
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_humide.ft_m_log_an_euep_cc();															 
															 
			
