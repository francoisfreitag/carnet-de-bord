<script lang="ts">
	import Breadcrumbs from '$lib/ui/base/Breadcrumbs.svelte';
	import { GetNotebookDocument, RoleEnum } from '$lib/graphql/_gen/typed-document-nodes';
	import ProNotebookSocioProUpdate from '$lib/ui/ProNotebookSocioPro/ProNotebookSocioProUpdate.svelte';
	import LoaderIndicator from '$lib/ui/utils/LoaderIndicator.svelte';
	import { operationStore, query } from '@urql/svelte';
	import { goto } from '$app/navigation';
	import { homeForRole } from '$lib/routes';
	import { displayFullName } from '$lib/ui/format';
	import { connectedUser } from '$lib/stores';
	import { afterUpdate } from 'svelte';
	import { Elm as DiagnosticEditElm, Focus } from '../../../../elm/DiagnosticEdit/Main.elm';

	export let notebookId: string;
	$: notebookPath =
		$connectedUser.role === RoleEnum.Professional
			? `${homeForRole($connectedUser.role)}/carnet/${notebookId}`
			: `${homeForRole($connectedUser.role)}/carnets/edition/${notebookId}`;

	const getNotebook = operationStore(GetNotebookDocument, { id: notebookId });

	$: breadcrumbs = [
		{
			name: 'Carnet de ${displayFullName(beneficiary)}',
			path: notebookPath,
			label: `Carnet de ${displayFullName(beneficiary)}`,
		},
		{
			label: 'Édition du diagnostic socioprofessionnel',
		},
	];

	query(getNotebook);

	$: publicNotebook = $getNotebook.data?.notebook_public_view[0];
	$: notebook = publicNotebook?.notebook;
	$: beneficiary = publicNotebook?.beneficiary;
	$: situations = $getNotebook.data?.situations;
	$: focuses = notebook?.focuses?.map((focus) => {
		return { id: focus.id, theme: focus.theme, situations: focus.situations ?? [] };
	});

	$: notebookWithJobs = {
		...notebook,
		professionalProjects: notebook?.professionalProjects.map(({ rome_code }) => rome_code.id) || [],
	};

	$: options = notebook?.professionalProjects.map(({ rome_code }) => rome_code);
	let selectedSituations: Focus[] = [];

	let elmNode: HTMLElement;
	afterUpdate(() => {
		if (!elmNode || !elmNode.parentNode) return;

		const app = DiagnosticEditElm.DiagnosticEdit.Main.init({
			node: elmNode,
			flags: { situations, focuses },
		});

		app.ports.sendSelectedSituations.subscribe((updatedSelection: Focus[]) => {
			selectedSituations = updatedSelection;
		});
	});

	function goToNotebook() {
		goto(notebookPath);
	}
</script>

<LoaderIndicator result={$getNotebook}>
	<Breadcrumbs segments={breadcrumbs} />
	<div class="flex flex-col space-y-6">
		<ProNotebookSocioProUpdate
			notebook={notebookWithJobs}
			{options}
			{selectedSituations}
			onClose={goToNotebook}
		>
			{#key situations}
				<div class="elm-node">
					<!-- Elm app needs to be wrapped by a div to avoid navigation exceptions when unmounting -->
					<div bind:this={elmNode} />
				</div>
			{/key}
		</ProNotebookSocioProUpdate>
	</div>
</LoaderIndicator>
