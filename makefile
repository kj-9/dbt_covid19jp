SHELL=/bin/bash

export DBT_PROFILES_DIR=./

.PHONY:
	doc-preview
	run
	export-all

docs:
	dbt docs generate

docs-nocompile:
	dbt docs generate --no-compile


docs-preview:
	dbt docs generate && dbt docs serve

run:
	dbt run

export-all:
	dbt run-operation export --args '{model_names: [jp_daily, pref, pref_daily], copy_options: [{format: Parquet}, {format: CSV, params: HEADER}]}'

ga-commit:
ifeq ($(MAKE_ENV),GITHUB_ACTIONS)
	git config --local user.email "action@github.com"
	git config --local user.name "GitHub Action"
	git commit -m "Automatic data update" -a
else
	echo MAKE_ENV is: $(MAKE_ENV). not run.
endif