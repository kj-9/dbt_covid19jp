WITH update AS (
    SELECT
        prefectureNameJ AS prefJP,
        MAKE_DATE(year, month, date) AS "date",
        NULL AS tests,
        testedPositive AS newCases,
        NULL AS activeCases,
        serious AS severeCases,
        NULL AS recovered,
        deaths AS deaths,
        effectiveReproductionNumber AS rt
    FROM 'https://toyokeizai.net/sp/visual/tko/covid19/csv/prefectures.csv'
),
v1 AS (
    SELECT * FROM {{ (ref('pref_daily_v1')) }}
),

updated AS (
    SELECT
      prefJP,
      "date"::DATE AS "date",
      COALESCE(update.tests, v1.tests)::INTEGER AS tests,
      COALESCE(update.newCases, v1.newCases)::INTEGER AS newCases,
      COALESCE(update.activeCases, v1.activeCases)::INTEGER AS activeCases,
      COALESCE(update.severeCases, v1.severeCases)::INTEGER AS severeCases,
      COALESCE(update.recovered, v1.recovered)::INTEGER AS recovered,
      COALESCE(update.deaths, v1.deaths)::INTEGER AS deaths,
      COALESCE(update.rt, v1.rt)::DOUBLE AS rt
    FROM update
      FULL JOIN v1 USING (prefJP, "date")
)

SELECT
  pref.prefCode,
  prefJP,
  pref.prefEN,
  "date",
  tests,
  newCases,
  activeCases,
  severeCases,
  recovered,
  deaths,
  rt
FROM updated
  LEFT JOIN {{ref('pref')}} AS pref 
    USING (prefJP)
ORDER BY prefCode, "date"
