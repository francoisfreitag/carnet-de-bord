<script lang="ts">
	import {
		GetNotebookByBeneficiaryIdQuery,
		GetNotebookQuery,
		RoleEnum,
	} from '$lib/graphql/_gen/typed-document-nodes';
	import { Button } from '$lib/ui/base';
	import { accountData, openComponent } from '$lib/stores';
	import ChangeOrientationForm from '../OrientationRequest/ChangeOrientationForm.svelte';
	import { createEventDispatcher } from 'svelte';

	export let notebook:
		| GetNotebookByBeneficiaryIdQuery['notebook'][0]
		| GetNotebookQuery['notebook_public_view'][0]['notebook'];
	$: buttonTitle = notebook.notebookInfo?.needOrientation ? 'Orienter' : 'Réorienter';

	const dispatch = createEventDispatcher();

	function onBeneficiaryOrientationChanged() {
		dispatch('beneficiary-orientation-changed');
	}

	function openChangeOrientationForm() {
		openComponent.open({
			component: ChangeOrientationForm,
			props: { notebooks: [notebook], onBeneficiaryOrientationChanged },
		});
	}
</script>

{#if [RoleEnum.Manager, RoleEnum.OrientationManager].includes($accountData.type)}
	<div class="flex flex-row mb-8 items-center">
		<div class="flex flex-row flex-none items-center gap-6 h-8">
			<Button title={buttonTitle} on:click={() => openChangeOrientationForm()}>{buttonTitle}</Button
			>
		</div>
	</div>
{/if}
