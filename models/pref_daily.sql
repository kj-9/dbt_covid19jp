SELECT 
      pref.prefCode,
      pref.prefJP,
      pref.prefEN,
      MAKE_DATE(pref_daily.year, pref_daily.month, pref_daily.date) AS "date",
      pref_daily.peopleTested AS tests,
      pref_daily.testedPositive AS newCases,
      pref_daily.hospitalized AS activeCases,
      pref_daily.serious AS severeCases,
      pref_daily.discharged AS recovered,
      pref_daily.deaths AS deaths,
      pref_daily.effectiveReproductionNumber AS rt
FROM 'https://toyokeizai.net/sp/visual/tko/covid19/csv/prefectures.csv' AS pref_daily
    LEFT JOIN {{ref('pref')}} AS pref 
        ON pref_daily.prefectureNameJ = pref.prefJP
ORDER BY prefCode, "date"