/*cc_asscol V1.0*/
/*Creation du fichier trace qui permet de suivre l'évolution du code*/
/* cc_asscol_10_trace.md */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */

/*
#################################################################### SUIVI CODE SQL ####################################################################

-- 2024/01/02 : GB / mise à jour base de données et fonctionnel suite nouvelle réglementation au 1er janvier 2024. Suivi des contrôles non conforme grave
-- 2018/02/01 : GB / initialisation du squelette de la structure dans la base de données pour gérer le suivi des contrôles de conformité
--		          GB / la donnée métier s'appuie sur le référentiel de voies et adresses locales (BAL) de l'ARC pour la localisation des contrôles
-- 2018/03/22 : GB / ajout d'une table de log
-- 2018/05/25 : GB / modification suite 1er test de l'application (ajout d'un type de validation et d'une liste d'anomalie avec un champ de précision 
--	             pour les anomalies nécessaire
--		           Le champ ccvalid devient un charactère (et non plus booléen) avec une clé étrangère sur le liste de valeur
--               Ajout d'une liste de valeur anomalie et stade de validation
--               Ajout d'un enregistrement dans la liste des prestataires
-- 2019/09/30 : GB / ajout d'une valeur dans lt_euep_cc_valid pour gérer le déverrouillage d'un dossier
-- 2019/10/30 : GB / optimisation de l'application pour l'ouverture des dossiers (la vue an_v_euep_cc n'est plus utilisée, la table an_eueup_cc
--                   est utilisée directement, les fonctions triggers ont été ramenées à la table avec des ajustements)
--		           Le trigger de gestion des médias (par la vue) a été également remanié pour gérer l'impossibilité d'insérer
--               de modifier ou de supprimer un média relié à un contrôle validé
-- 2020/01/13 : GB / Ajout d'un média pour gérer les documents propres au diagnostiqueur (attestation) et liste de valeur du type
--               de document
--	            GB / Ouverture des droits pour supprimer ou dévalider un contrôle pour le service Assainissement
-- 2020/06/02 : GB / Modification fonction trigger de mise à jour et d'insertion pour gérer les mauvaises saisies des contres-visites
--		          GB / Modification fonction trigger de suppression avec seulement l'identifiant unique idcc et non avec nidcc car doublon si contre-visite
