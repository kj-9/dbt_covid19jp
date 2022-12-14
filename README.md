# dbt_covid19jp : dbt package for Japanese Covid-19 Datasets

This package provides ready to use Japanese covid-19 datasets.
CSV/PARQUET format files are available at [dist](https://github.com/kj-9/dbt_covid19jp/tree/main/dist) directory.

[Go to Docs site](https://kj-9.github.io/dbt_covid19jp/)


- [`jp_daily`](https://kj-9.github.io/dbt_covid19jp/#!/model/model.dbt_covid19jp.jp_daily): Daily nation-level dataset of covid-19 situation in Japanese.
- [`pref_daily`](https://kj-9.github.io/dbt_covid19jp/#!/model/model.dbt_covid19jp.pref_daily): Daily prefecture-level dataset of covid-19 situation in Japanese.
- [`pref`](https://kj-9.github.io/dbt_covid19jp/#!/seed/seed.dbt_covid19jp.pref): Master dataset for Japanese prefectures.


WIP:
-  `pref_weekly`: Weekly prefecture-level dataset of covid-19 situation in Japanese (which contains some additional columns like hospital capacity not appear in `pref_daily`).


## Notes
- Due to the data source format changes, updating datasets in development version might delay.


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
