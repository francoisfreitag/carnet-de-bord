<script lang="ts">
	import { CreateDeploymentDocument } from '$lib/graphql/_gen/typed-document-nodes';
	import { openComponent } from '$lib/stores';

	import { mutation, operationStore } from '@urql/svelte';
	import { Alert, Button } from '$lib/ui/base';
	import { Form, Input } from '$lib/ui/forms';
	import { type AdminDeploymentType, adminDeploymentSchema } from './adminDeployment.schema';

	const deploymentStore = operationStore(CreateDeploymentDocument, null, {
		additionalTypenames: ['deployment'],
	});
	const insertDeployment = mutation(deploymentStore);

	const initialValues = {
		email: '',
		deployment: '',
	};
	let errorMessage = '';

	async function handleSubmit(values: AdminDeploymentType) {
		const { error } = await insertDeployment(values);
		if (error) {
			errorMessage = 'Une erreur est survenue lors de la création du déploiement.';
			if (/uniqueness/i.test(error.message) && /manager_email_key/i.test(error.message)) {
				errorMessage = 'Cet email est déja assigné à un manager.';
			}
		} else {
			close();
		}
	}
	function close() {
		openComponent.close();
	}
</script>

<div class="flex flex-col gap-6">
	<div>
		<h1>Ajouter un Déploiement</h1>
		<p class="mb-0">
			Veuillez renseigner les informations ci-dessous pour créer un nouveau déploiement. Un
			déploiement permet de rattacher des structures et des bénéficiaires.
		</p>
		<p class="mb-0">
			Un email sera envoyé au responsable du déploiement pour qu'il crée son compte sur Carnet de
			bord.
		</p>
	</div>

	<Form
		class="flex flex-col gap-6"
		{initialValues}
		validationSchema={adminDeploymentSchema}
		onSubmit={handleSubmit}
		let:isSubmitted
		let:isSubmitting
		let:isValid
	>
		<Input name="deployment" required inputLabel="Nom du déploiement" />
		<Input name="email" required inputLabel="Courriel du gestionnaire" />
		{#if $deploymentStore.error}
			<div class="mb-8">
				<Alert type="error" description={errorMessage} />
			</div>
		{/if}
		<div class="flex flex-row gap-6 mt-12">
			<Button type="submit" disabled={isSubmitting || (isSubmitted && !isValid)}
				>Créer le déploiement</Button
			>
			<Button outline={true} on:click={close}>Annuler</Button>
		</div>
	</Form>
</div>
