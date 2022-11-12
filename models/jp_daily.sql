{% set base_url = "https://toyokeizai.net/sp/visual/tko/covid19/csv/"  %}
{% set files = [
  "pcr_positive_daily.csv",
  "severe_daily.csv",
  "death_total.csv",
  "effective_reproduction_number.csv"
] %}

WITH update AS (
  SELECT 
  "日付" AS "date"
  ,NULL AS tests
  ,"PCR 検査陽性者数(単日)" AS newCases
  ,NULL AS activeCases
  ,"重症者数" AS severeCases
  ,NULL AS recovered
  ,"死亡者数" AS deaths
  ,"実効再生産数" AS rt
  FROM {% for file in files %}
          {%- if loop.first %} '{{base_url}}{{file}}'
          {%- else %} FULL JOIN (SELECT * FROM '{{base_url}}{{file}}') USING (日付)
          {%- endif %}
      {% endfor %}
  ORDER BY "date"
),
v1 AS (
  SELECT * FROM {{ ref('jp_daily_v1') }}
)

SELECT 
  COALESCE(update."date", v1."date")::DATE AS date
  ,COALESCE(update.tests, v1.tests)::INTEGER AS tests
  ,COALESCE(update.newCases, v1.newCases)::INTEGER AS newCases
  ,COALESCE(update.activeCases, v1.activeCases)::INTEGER AS activeCases
  ,COALESCE(update.severeCases, v1.severeCases)::INTEGER AS severeCases
  ,COALESCE(update.recovered, v1.recovered)::INTEGER AS recovered
  ,COALESCE(update.deaths, v1.deaths)::INTEGER AS deaths
  ,COALESCE(update.rt, v1.rt)::DOUBLE AS rt
FROM update
  FULL JOIN v1 USING ("date")

ORDER BY "date"
