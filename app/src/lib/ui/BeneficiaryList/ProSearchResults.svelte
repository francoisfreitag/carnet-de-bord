<script lang="ts">
	import type {
		SearchPublicNotebooksQuery,
		GetLastVisitedOrUpdatedQuery,
	} from '$lib/graphql/_gen/typed-document-nodes';
	import { formatDateLocale } from '$lib/utils/date';
	import { displayFullName } from '$lib/ui/format';
	import { baseUrlForRole } from '$lib/routes';
	import { accountData } from '$lib/stores';

	type PublicNotebook =
		| SearchPublicNotebooksQuery['notebooks'][0]
		| GetLastVisitedOrUpdatedQuery['notebook'][0];

	export let notebooks: PublicNotebook[];
	export let accountId: string;

	function displayMemberType(members: PublicNotebook['members']): string {
		const member = members.find((member) => member.accountId === accountId && member.active);
		if (!member) {
			return 'Non';
		}

		return member.memberType === 'referent' ? 'Oui (Référent)' : 'Oui';
	}
</script>

<table class="w-full fr-table fr-table--layout-fixed">
	<caption class="sr-only">Liste des bénéficiaires</caption>
	<thead>
		<tr>
			<th class="text-left">Nom</th>
			<th class="text-left">Prénom</th>
			<th class="text-left">Date de naissance</th>
			<th class="text-left">Membre du groupe de suivi</th>
			<th class="!text-center">Voir le carnet</th>
		</tr>
	</thead>
	<tbody>
		{#each notebooks as notebook}
			<tr>
				<td>{notebook.beneficiary.lastname}</td>
				<td>{notebook.beneficiary.firstname}</td>
				<td>{formatDateLocale(notebook.beneficiary.dateOfBirth)}</td>
				<td>
					{displayMemberType(notebook.members)}
				</td>
				<td class="!text-center">
					<a
						href={`${baseUrlForRole($accountData.type)}/carnet/${notebook.id}`}
						rel="noreferrer"
						class="fr-link"
						title={`Voir le carnet de ${displayFullName(notebook.beneficiary)}`}
					>
						<span class="fr-icon-file-line" aria-hidden />
					</a>
				</td>
			</tr>
		{/each}
		{#if notebooks.length === 0}
			<tr><td colspan="10">Aucun bénéficiaire.</td></tr>
		{/if}
	</tbody>
</table>
