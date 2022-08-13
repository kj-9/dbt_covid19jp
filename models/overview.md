{% docs __overview__ %}

# dbt_covid19jp : dbt package for Japanese Covid-19 Datasets

This package provides ready to use Japanese covid-19 datasets.

- `jp_daily`: Daily nation-level dataset of covid-19 situation in Japanese.
- `pref_daily`: Daily prefecture-level dataset of covid-19 situation in Japanese.
- `pref`: Master dataset for Japanese prefectures.


WIP:
-  `pref_weekly`: Weekly prefecture-level dataset of covid-19 situation in Japanese (which contains some additional columns like hospital capacity not appear in `pref_daily`).


## Notes

- CSV/PARQUET format files are also available [here](https://github.com/kj-9/dbt_covid19jp/tree/main/dist).
- Due to the data source format changes, updating datasets in development version might delay.

{% enddocs %}
