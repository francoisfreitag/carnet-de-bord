/// <reference types="@sveltejs/kit" />

// support for Crisp
interface Window {
	$crisp: any; // eslint-disable-line @typescript-eslint/no-explicit-any
	CRISP_WEBSITE_ID: string;
	dsfr: any; // eslint-disable-line @typescript-eslint/no-explicit-any
}

// support for svelecte
declare module 'svelte-file-dropzone';

// support for svelecte
declare module 'svelte-accessible-dialog';

// support for svelecte
declare module 'svelecte';

// support for matomo-tracker
declare module 'matomo-tracker';

declare module '@gouvfr/dsfr/dist/dsfr/dsfr.module.min.js';

declare const __version__: string;
