SHELL=/bin/bash
.PHONY:
	doc-preview
	run
	export-all


doc-preview:
	dbt docs generate --profiles-dir . &&  dbt docs serve --profiles-dir .

run:
	dbt run --profiles-dir .

export-all:
	dbt run-operation export --args '{model_names: [jp_daily, pref, pref_daily], copy_options: [{format: Parquet}, {format: CSV, params: HEADER}]}' --profiles-dir .

