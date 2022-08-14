SHELL=/bin/bash

export DBT_PROFILES_DIR=./

.PHONY:
	run
	seed
	clean
	db
	docs
	docs-nocompile
	docs-preview
	test
	export
	ga-commit

run:
	dbt run

seed:
	dbt seed

clean:
	dbt clean && rm -vf .db/*.duckdb

db: clean seed run

docs:
	dbt docs generate

docs-nocompile:
	dbt docs generate --no-compile

docs-preview:
	dbt docs generate && dbt docs serve

test:
	dbt test --store-failures

export:
	dbt run-operation export \
		--args "{ \
			model_names: [jp_daily, pref, pref_daily], \
			copy_options: [{format: Parquet}, {format: CSV, others: HEADER}] \
			}"

# for github actions workflow
ga-commit:
ifeq ($(MAKE_ENV),GITHUB_ACTIONS)
	git config --local user.email "action@github.com"
	git config --local user.name "GitHub Action"
	git commit -m "Automatic data update" -a
else
	echo MAKE_ENV is: $(MAKE_ENV). not run.
endif
