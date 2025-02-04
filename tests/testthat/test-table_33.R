adsl <- adsl_raw
advs <- advs_raw

test_that("Table 33 generation works with default values", {
  result <- make_table_33(advs, adsl)

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 33 generation works with custom values", {
  result <- make_table_33(
    advs,
    adsl,
    lbl_overall = "Total\nPopulation",
    annotations = list(
      title = paste(
        "Table 33. Percentage of Patients Meeting Specific Hypotension Levels\n",
        "Postbaseline, Safety Population, Pooled Analysis"
      ),
      main_footer = c(
        "Source: [include Applicant source, datasets and/or software tools used].",
        "(1) Difference is shown between [treatment arms] (e.g., difference is shown",
        "between Drug Name dosage X vs. placebo)."
      ),
      prov_footer = c(
        "Abbreviations: CI, confidence interval; N, number of patients in treatment arm with",
        "available blood pressure data; n, number of patients with indicated blood pressure"
      )
    )
  )

  res <- expect_silent(result)
  expect_snapshot(res)
})

test_that("Table 33 generation works with pruned rows", {
  advs$AVAL[advs$PARAMCD == "SYSBP"] <- 100
  result <- make_table_33(advs, adsl, prune_0 = TRUE)

  res <- expect_silent(result)
  expect_snapshot(res)
})
