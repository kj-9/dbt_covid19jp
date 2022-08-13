SHELL=/bin/bash
.PHONY:
	venv

venv:
	bash -c ".venv/bin/activate"

doc-preview:
	dbt docs generate --profiles-dir . &&  dbt docs serve --profiles-dir .

run:
	dbt run --profiles-dir .
