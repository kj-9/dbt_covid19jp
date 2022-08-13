{% set base_url = "https://toyokeizai.net/sp/visual/tko/covid19/csv/"  %}
{% set files = [
  "pcr_tested_daily.csv",
  "pcr_positive_daily.csv",
  "cases_total.csv",
  "severe_daily.csv",
  "death_total.csv",
  "recovery_total.csv",
  "effective_reproduction_number.csv"
] %}


SELECT 
"日付" AS "date"
,"PCR 検査実施人数(単日)" AS tests
,"PCR 検査陽性者数(単日)" AS newCases
,"入院治療を要する者" AS activeCases
,"重症者数" AS severeCases
,"死亡者数" AS recovered
,"退院、療養解除となった者" AS deaths
,"実効再生産数" AS rt
FROM {% for file in files %}
        {%- if loop.first %} '{{base_url}}{{file}}'
        {%- else %} FULL JOIN (SELECT * FROM '{{base_url}}{{file}}') USING (日付)
        {%- endif %}
    {% endfor %}
ORDER BY "date"
