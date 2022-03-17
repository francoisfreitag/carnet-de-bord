DO language plpgsql $$
BEGIN
	RAISE NOTICE 'SEED %', now();
END
$$;

TRUNCATE public.admin_structure_structure CASCADE;
TRUNCATE public.beneficiary_structure CASCADE;
TRUNCATE public.structure CASCADE;

TRUNCATE public.notebook_focus CASCADE;
TRUNCATE public.notebook_target CASCADE;
TRUNCATE public.notebook_action CASCADE;
TRUNCATE public.notebook_event CASCADE;
TRUNCATE public.notebook_member CASCADE;

TRUNCATE public.admin_cdb CASCADE;
TRUNCATE public.manager CASCADE;
TRUNCATE public.admin_structure CASCADE;
TRUNCATE public.professional CASCADE;
TRUNCATE public.beneficiary CASCADE;
TRUNCATE public.notebook CASCADE;

TRUNCATE public.deployment CASCADE;

TRUNCATE public.account CASCADE;

SET check_function_bodies = false;
INSERT INTO public.admin_cdb (id, email, firstname, lastname) VALUES ('a81bc81a-dead-4e5d-abff-90865d1e13b7', 'support.carnet-de-bord@fabrique.social.gouv.fr', 'Carnet de Bord', 'Administrateur');
INSERT INTO public.account (id, username, type, access_key, access_key_date, last_login, beneficiary_id, professional_id, admin_id, confirmed, onboarding_done) VALUES ('9eee9fea-bf3e-4eb8-8f43-d9b7fd6fae76', 'admin', 'admin_cdb', NULL, NULL, '2021-09-21 12:25:55.822+00', NULL, NULL, 'a81bc81a-dead-4e5d-abff-90865d1e13b7', true, false);
INSERT INTO public.deployment (id, label) VALUES ('4dab8036-a86e-4d5f-9bd4-6ce88c1940d0', 'expérimentation 93');
INSERT INTO public.deployment (id, label, config) VALUES ('c5c3a933-6f4a-4b2b-aa49-7a816eaef16b', 'expérimentation 51', '{"url": "http://localhost:3000/api/test", "headers": {"token":"azerty"}, "callback": "/api/marne" }');

INSERT INTO public.manager (id, email, firstname, lastname, deployment_id) VALUES ('01a3d906-70d9-42e6-9b61-2ccf030e5d8f', 'support.carnet-de-bord@fabrique.social.gouv.fr', 'Agathe', 'DeBlouze', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.account (id, username, type, manager_id, confirmed, onboarding_done) VALUES ('96cb6e09-81fa-44e9-9b3f-75c93ad96f94', 'manager.cd93', 'manager', '01a3d906-70d9-42e6-9b61-2ccf030e5d8f', true, false);
INSERT INTO public.manager (id, email, firstname, lastname, deployment_id) VALUES ('cc32124d-f810-4193-a855-db76915ae7e4', 'contact.carnet-de-bord@fabrique.social.gouv.fr', 'Gérard', 'Manvol', 'c5c3a933-6f4a-4b2b-aa49-7a816eaef16b');
INSERT INTO public.account (id, username, type, manager_id, confirmed, onboarding_done) VALUES ('3f4c5d95-b25c-4e18-a2c6-b394b8221c8f', 'manager.cd51', 'manager', 'cc32124d-f810-4193-a855-db76915ae7e4', true, false);
INSERT INTO public.beneficiary (id, email, lastname, firstname, caf_number, pe_number, postal_code, city, address1, address2, mobile_number, date_of_birth, deployment_id) VALUES ('c6e84ed6-eb31-47f0-bd71-9e4d7843cf0b', 'stifour93@yahoo.fr', 'Tifour', 'Sophie', '2055990', '300000L', '93190', 'Livry-Gargan', '7 chemin du soleil', NULL, '0606060606', '1982-02-01', '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id) VALUES ('a81bc81b-dead-4e5d-abff-90865d1e13b2', NULL, 'Pole Emploi Agence Livry-Gargnan', 'Pole Emploi Agence Livry-Gargnan', '09 72 72 39 49', 'contact@pole-emploi.fr', '93190', 'Die', '33 Bd Robert Schuman', NULL, NULL, '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id) VALUES ('1c52e5ad-e0b9-48b9-a490-105a4effaaea', NULL, 'Centre Communal d''action social Livry-Gargan', '', '01 41 70 88 00', '', NULL, 'Saint Denis', ' 3 Pl. François Mitterrand', NULL, NULL, '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id) VALUES ('e578237f-6167-4012-b457-7c4f36fb079d', NULL, 'Service Social Départemental', NULL, '01 71 29 43 80', NULL, '93800', 'Épinay-sur-Seine', ' 38 Av. Salvador Allende', NULL, NULL, '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id) VALUES ('8b71184c-6479-4440-aa89-15da704cc792', NULL, 'Groupe NS', NULL, '01 87 97 36 45', NULL, '91300', 'Montreuil', '28 rue de Lorraine', NULL, NULL, '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id) VALUES ('58d09cad-ed8c-4278-b449-e6673ae0fad4', NULL, 'Amélie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id) VALUES ('e8d09cad-ed8c-4278-b449-e6673ae0fad4', NULL, 'Sécurité sociale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id) VALUES ('3b299bcb-445c-48db-bc61-e30cd52d65b6', NULL, 'AFPA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id) VALUES ('dfaaa6e1-4c5a-4079-a191-e8611d573acf', NULL, 'Plateforme - Ma demande de logement social', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id) VALUES ('dfaaa6e3-4c5a-4079-a191-e8611d573acf', NULL, 'Interlogement 93', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4dab8036-a86e-4d5f-9bd4-6ce88c1940d0');
INSERT INTO public.structure (id, siret, name, short_desc, phone, email, postal_code, city, address1, address2, website, deployment_id) VALUES ('c0b8aee3-c061-4023-b57e-92880627d589', NULL, 'Interlogement 51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c5c3a933-6f4a-4b2b-aa49-7a816eaef16b');
INSERT INTO public.professional (id, structure_id, email, lastname, firstname, "position", mobile_number) VALUES ('1a5b817b-6b81-4a4d-9953-26707a54e0e9', '1c52e5ad-e0b9-48b9-a490-105a4effaaea', 'pierre.chevalier@livry-gargan.fr', 'Pierre', 'Chevalier', 'Conseiller en insertion', '01 41 70 88 00');
INSERT INTO public.account (id, username, type, access_key, access_key_date, last_login, beneficiary_id, professional_id, admin_id, confirmed, onboarding_done) VALUES ('17434464-5f69-40cc-8172-40160958a33d', 'pierre.chevalier', 'professional', NULL, NULL, '2021-09-27 14:08:02.222+00', NULL, '1a5b817b-6b81-4a4d-9953-26707a54e0e9', NULL, true, true);
INSERT INTO public.professional (id, structure_id, email, lastname, firstname, "position", mobile_number) VALUES ('e1fdb7a8-7d0e-4b2e-b28c-89a662d090a3', 'e578237f-6167-4012-b457-7c4f36fb079d', 'pcamara@seinesaintdenis.fr', 'Paul', 'Camara', 'Assistant de service social', '01 71 29 43 80');
INSERT INTO public.account (id, username, type, access_key, access_key_date, last_login, beneficiary_id, professional_id, admin_id, confirmed, onboarding_done) VALUES ('d0b8f314-5e83-4535-9360-60f29dcfb5c8', 'pcamara', 'professional', NULL, NULL, NULL, NULL, 'e1fdb7a8-7d0e-4b2e-b28c-89a662d090a3', NULL, true, true);
INSERT INTO public.professional (id, structure_id, email, lastname, firstname, "position", mobile_number) VALUES ('74323049-eae6-4ccd-b596-e95514a32781', '8b71184c-6479-4440-aa89-15da704cc792', 'sanka@groupe-ns.fr', 'Anka', 'Simon', 'Conseiller en Insertion Professionnel', NULL);
INSERT INTO public.account (id, username, type, access_key, access_key_date, last_login, beneficiary_id, professional_id, admin_id, confirmed, onboarding_done) VALUES ('a501db53-1b79-4a60-860b-5972bd184f98', 'sanka', 'professional', NULL, NULL, NULL, NULL, '74323049-eae6-4ccd-b596-e95514a32781', NULL, true, true);
INSERT INTO public.professional (id, structure_id, email, lastname, firstname, "position", mobile_number) VALUES ('a81bc81b-dead-4e5d-abff-90865d1e13b3', 'a81bc81b-dead-4e5d-abff-90865d1e13b2', 'dunord@pole-emploi.fr', 'Dunord', 'Thierry', 'Conseiller pôle emploi', '');
INSERT INTO public.account (id, username, type, access_key, access_key_date, last_login, beneficiary_id, professional_id, admin_id, confirmed, onboarding_done) VALUES ('17434464-5f69-40cc-8173-40160958a33d', 'thierry.dunord', 'professional', NULL, NULL, '2021-08-23 07:59:48.689+00', NULL, 'a81bc81b-dead-4e5d-abff-90865d1e13b3', NULL, true, true);
INSERT INTO public.professional (id, structure_id, email, lastname, firstname, "position", mobile_number) VALUES ('9b5f4863-dd2e-4680-af40-46258c457654', 'c0b8aee3-c061-4023-b57e-92880627d589', 'jeanpoiret@mission-locale.fr', 'Poiret', 'Jean', 'Conseiller Logement', '');
INSERT INTO public.account (id, username, type, professional_id, confirmed, onboarding_done) VALUES ('db78bfd9-aedb-4220-bf0a-f62b0528e5bf', 'jean.poiret', 'professional', '9b5f4863-dd2e-4680-af40-46258c457654', true, false);
INSERT INTO public.notebook (id, beneficiary_id, created_at, right_rsa, right_rqth, right_are, right_ass, right_bonus, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation) VALUES ('9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', 'c6e84ed6-eb31-47f0-bd71-9e4d7843cf0b', '2021-09-21 11:51:37.295647+00', 'rsa_droit_ouvert_et_suspendu', false, false, false, false, 'between_10_20', 'level_3', '2021-09-22', 'cer', '2020-01-05', 'iae');
INSERT INTO public.wanted_job (rome_code_id, notebook_id) VALUES ((SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Aide à domicile (K1304)'), '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d');
INSERT INTO public.notebook_focus (id, theme, situations, creator_id, notebook_id, created_at, linked_to) VALUES ('a55d1dd2-2b09-4456-bcc5-1412695f684f', 'logement', '["Hébergé chez un tiers"]', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 13:15:54.752334+00', 'cer');
INSERT INTO public.notebook_focus (id, theme, situations, creator_id, notebook_id, created_at, linked_to) VALUES ('19911b5c-e614-450d-bbeb-eba0d8ae1e18', 'difficulte_administrative', '["Besoin d''être guidé dans le cadre d''un accès aux droits"]', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 13:26:42.939011+00', 'cer');
INSERT INTO public.notebook_focus (id, theme, situations, creator_id, notebook_id, created_at, linked_to) VALUES ('d4bf4811-bbce-4f99-8b57-358187653b59', 'emploi', '["Prêt  à suivre une formation"]', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 13:33:16.96523+00', 'cer');
INSERT INTO public.notebook_target (id, focus_id, target, creator_id, created_at) VALUES ('7bfa2130-fe72-418e-8486-000c171cb853', 'a55d1dd2-2b09-4456-bcc5-1412695f684f', 'Recherche d''un logement', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', '2021-09-21 13:17:53.594417+00');
INSERT INTO public.notebook_target (id, focus_id, target, creator_id, created_at) VALUES ('0dac08fa-c103-438d-bf98-6b725a892e2d', 'd4bf4811-bbce-4f99-8b57-358187653b59', 'Définition d''un parcours de formation personnalisé', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', '2021-09-21 13:34:17.493745+00');
INSERT INTO public.notebook_target (id, focus_id, target, creator_id, created_at) VALUES ('8445b9bc-e523-4ff3-91dd-fd11bb413ae5', 'd4bf4811-bbce-4f99-8b57-358187653b59', 'Acceder à l''emploi', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', '2021-09-21 13:35:11.636378+00');
INSERT INTO public.notebook_target (id, focus_id, target, creator_id, created_at) VALUES ('2ce91415-b3bb-404f-adec-bbc6ea5af464', '19911b5c-e614-450d-bbeb-eba0d8ae1e18', 'Être accompagné dans les démarches d''accès au soin', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', '2021-09-21 14:55:12.797276+00');
INSERT INTO public.notebook_action (id, action, target_id, status, creator_id, created_at) VALUES ('3d0dc2b5-3dc8-4f5d-9e82-661299b3d522', 'Avoir un pass IAE validé', '8445b9bc-e523-4ff3-91dd-fd11bb413ae5', 'in_progress', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', '2021-06-08 13:42:53.239372+00');
INSERT INTO public.notebook_action (id, action, target_id, status, creator_id, created_at) VALUES ('3d0dc2b5-3dc8-4f5d-9e82-661299b3d533', 'Formation certifiante', '8445b9bc-e523-4ff3-91dd-fd11bb413ae5', 'in_progress', '74323049-eae6-4ccd-b596-e95514a32781', '2021-07-01 15:34:53.239372+00');
INSERT INTO public.notebook_action (id, action, target_id, status, creator_id, created_at) VALUES ('54c982ce-36f8-4124-a6eb-689f8f25a2e7', 'Demande SIAO', '7bfa2130-fe72-418e-8486-000c171cb853', 'in_progress', 'e1fdb7a8-7d0e-4b2e-b28c-89a662d090a3', '2020-01-05 13:55:43.100609+00');
INSERT INTO public.notebook_action (id, action, target_id, status, creator_id, created_at) VALUES ('59c7f3b7-ca19-4408-bcb8-9b4fa8a07282', 'Demande de logement social', '7bfa2130-fe72-418e-8486-000c171cb853', 'in_progress', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', '2020-07-01 15:13:59.820331+00');
INSERT INTO public.notebook_action (id, action, target_id, status, creator_id, created_at) VALUES ('9f7289e2-8abd-4ef8-bc3c-6b90be77ca63', 'Demande de CSS', '2ce91415-b3bb-404f-adec-bbc6ea5af464', 'in_progress', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', '2020-01-05 15:08:20.139704+00');
INSERT INTO public.notebook_action (id, action, target_id, status, creator_id, created_at) VALUES ('9dec37fe-a454-4184-a8ee-ddd905d3f794', 'Prépa-Compétences', '0dac08fa-c103-438d-bf98-6b725a892e2d', 'in_progress', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', '2020-09-01 15:11:37.55336+00');
INSERT INTO public.notebook_action (id, action, target_id, status, creator_id, created_at) VALUES ('67063818-486f-4f95-9beb-53a5a916e74b', 'Orientation vers une SIAE', '8445b9bc-e523-4ff3-91dd-fd11bb413ae5', 'in_progress', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', '2020-11-01 13:40:07.137635+00');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('5a20092b-06bb-4c2a-98cf-038c764184f8', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2018-01-01', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Signature du PPAE', 'Pôle emploi');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('cccc09e0-fe0d-40a3-a1cf-9c38c0f284e3', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2018-01-15', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Ouverture des droits ARE', 'Pôle emploi');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('28d757da-4530-450f-af32-03963ed65c78', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2018-04-01', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Atelier - CV et Lettre de motivation', 'Pôle emploi');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('d7ce47a0-8b2d-4c92-9c7b-367e4886d58c', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2018-09-01', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Atelier - Découvrir son métier - SAP', 'Pôle emploi');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('7f5fb8d7-6b0d-4799-a6d5-fc9139260111', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2018-09-20', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Fin de droit ARE', 'Pôle emploi');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('cde8ce81-9c9c-4618-bb35-f4b987bb5a0a', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2018-10-20', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Fin de droit ASS', 'Pôle emploi');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('4a51ff46-ac75-483e-87b3-d540b718c018', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2019-11-15', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Ouverture des droits RSA', 'Caf');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('e49c447a-1214-438c-bd19-46cf55cb1bba', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2020-01-05', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Signature du CER 1', 'CCAS');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('c1234b55-0b4c-4492-9ee2-da7f17bf6fda', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2020-01-05', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Demande CSS', 'CCAS');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('ba929ff6-30f3-450c-af89-1b8e7a437c1b', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2020-04-05', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Enquète métier - Logistique', 'CCAS');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('07132dae-006d-44f7-977b-c8b99fc4e5fb', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2020-04-05', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Demande de logement social', 'CCAS');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('f6e965b0-2c4c-4b35-9c9a-29c4005700bd', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2020-07-01', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Signature du CER 2', 'CCAS');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('77fb7aa9-292d-429e-a696-a8f61fd899e6', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2020-07-01', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Demande SIAO', 'Service Social Départemental');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('450a1a7d-c269-4749-a0c0-4189c0785ddb', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2020-07-01', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Prépa-Compétence', 'Afpa');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('678c1dd6-8dc3-42bf-aaca-a87e8a40c5b9', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2020-11-01', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Candidature SIAE', 'ITOU');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('6953e298-aa54-4e7d-8a01-b106530599a2', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2021-05-01', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Pass IAE', 'Groupe NS');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('c7f99bc3-a4a5-40b8-a666-a5044892f634', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2021-07-01', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Entrée en formation', 'Groupe NS');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('5782634c-eb5c-43ca-906c-a848a325864c', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2021-09-15', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Bilan 3 mois IAE', 'Groupe NS');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('13a8cf8b-9d9c-4821-9d9c-d2a24ed357e0', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2021-09-20', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Accord SIAO - CHRS', 'Adoma');
INSERT INTO public.notebook_event (id, notebook_id, creation_date, event_date, professional_id, event, structure) VALUES ('de66b98d-cf1c-4427-8a98-80244a4edee3', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '2021-09-21 19:02:17.79037+00', '2021-11-15', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', 'Entrée en CHRS', 'Adoma');
INSERT INTO public.notebook_member (id, notebook_id, professional_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('91dba199-109c-4312-93cb-bd99f579532b', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '74323049-eae6-4ccd-b596-e95514a32781', NULL, '', '2021-09-21 12:32:59.911757+00', NULL, NULL);
INSERT INTO public.notebook_member (id, notebook_id, professional_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('ea55bf8a-c0da-4c5f-b38c-66d57e3e18ba', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', 'a81bc81b-dead-4e5d-abff-90865d1e13b3', NULL, '', '2021-09-21 12:33:10.281341+00', NULL, NULL);
INSERT INTO public.notebook_member (id, notebook_id, professional_id, last_visited_at, member_type, created_at, creator_id, invitation_sent_at) VALUES ('14c147d0-f94b-4708-be90-0227efc70db7', '9b07a45e-2c7c-4f92-ae6b-bc2f5a3c9a7d', '1a5b817b-6b81-4a4d-9953-26707a54e0e9', '2021-09-21 13:06:45.076+00', 'referent', '2021-09-21 11:51:37.295647+00', NULL, NULL);

INSERT INTO public.beneficiary (id, email, lastname, firstname, mobile_number, date_of_birth, deployment_id) VALUES ('f3e4dd0f-7746-44f6-a5f1-29059a88aa5a', 'marc@yahoo.fr', 'Marc', 'Saintpa', '0600000000', '1982-02-01', 'c5c3a933-6f4a-4b2b-aa49-7a816eaef16b');
INSERT INTO public.notebook (id, beneficiary_id, geographical_area, education_level, work_situation_date, contract_type, contract_sign_date, work_situation) VALUES ('b7e43c7c-7c3e-464b-80de-f4926d4bb1e0', 'f3e4dd0f-7746-44f6-a5f1-29059a88aa5a', 'between_10_20', 'level_3', '2021-09-22', 'cer', '2020-01-05', 'iae');
INSERT INTO public.wanted_job (rome_code_id, notebook_id) VALUES ((SELECT public.rome_code.id FROM public.rome_code WHERE label = 'Aide à domicile (K1304)'), 'b7e43c7c-7c3e-464b-80de-f4926d4bb1e0');
INSERT INTO public.notebook_member (id, notebook_id, professional_id, last_visited_at, member_type) VALUES ('cd17a20c-403c-4dba-9e5a-bc691dcd3735', 'b7e43c7c-7c3e-464b-80de-f4926d4bb1e0', '9b5f4863-dd2e-4680-af40-46258c457654', '2021-09-21 13:06:45.076+00', 'referent');
