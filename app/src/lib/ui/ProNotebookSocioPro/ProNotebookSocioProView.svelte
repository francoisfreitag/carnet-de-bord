<script lang="ts">
	import { Button } from '../base';
	import SocioProView, {
		type SocioProInfo,
		type ExternalDataDetail,
		type Focus,
	} from '../Beneficiary/SocioProView.svelte';

	export let notebook: SocioProInfo;
	export let externalDataDetail: ExternalDataDetail | null;
	export let focuses: Focus[] | null;
</script>

<div class="flex flex-col space-y-6">
	<SocioProView {notebook} {externalDataDetail} {focuses} />

	<Button classNames="self-start" on:click outline>Mettre à jour</Button>
</div>
