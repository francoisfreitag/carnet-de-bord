#language: fr

@deploiement
Fonctionnalité: Parcours Manager
	Pour pouvoir administrer un déploiement
	En tant que manager d'un déploiement
	Je veux pouvoir gérer mon déploiement, créer des structures et importer des bénéficiaires

	Scénario: Première connexion - Mise à jour profil
		Soit un utilisateur de type "manager" authentifié avec l'email "experimentation-e2e@noreply.beta.gouv.fr"
		Quand je vois "Première connexion à Carnet de bord"
		Quand je vois "Manager du déploiement expérimentation e2e"
		Quand je clique sur "Mettre à jour"
		Alors je vois "Mettre à jour mon compte"
		Quand je renseigne "José" dans le champ "Prénom"
		Quand je renseigne "Pâlefer" dans le champ "Nom"
		Quand j'appuie sur Entrée
		Alors je vois "Votre compte a été modifié avec succès"

	Scénario: Import de structures
		Soit un utilisateur de type "manager" authentifié avec l'email "experimentation-e2e@noreply.beta.gouv.fr"
		Quand je vois "État du territoire"
		Quand je clique sur "Importer des structures"
		Alors je vois "Veuillez fournir un fichier au format CSV."
		Quand je téléverse le fichier "/resources/import_structures.csv"
		Alors je vois "Vous allez importer les structures suivantes. Veuillez vérifier que les données sont correctes et confirmer."
		Alors je vois "1 structure sélectionnée sur 1"
		Quand je clique sur "Confirmer"
		Alors je vois "1 structure importée sur 1 demandée."

	Scénario: Import de bénéficiaires
		Soit un utilisateur de type "manager" authentifié avec l'email "experimentation-e2e@noreply.beta.gouv.fr"
		Quand je vois "État du territoire"
		Quand je clique sur "Importer des bénéficiaires"
		Alors je vois "Veuillez fournir un fichier au format CSV."
		Quand je téléverse le fichier "/resources/import_beneficiaires.csv"
		Alors je vois "Vous allez importer les bénéficiaires suivants. Veuillez vérifier que les données sont correctes et confirmer."
		Alors je vois "2 bénéficiaires sélectionnés sur 2"
		Quand je clique sur "Confirmer"
		Alors je vois "2 bénéficiaires importés sur 2 demandés."
