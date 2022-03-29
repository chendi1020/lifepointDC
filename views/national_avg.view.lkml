view: national_avg {
  view_label: "Comparision"

  derived_table: {
    sql: SELECT 2.6 as rate_of_complication,
0.04 as readmission_post_procedure
 , 1.0 AS rate_of_serious_complications
      , 21000 AS payment_cost
      , 3.44 AS los_elective
      , .64 AS multiple_comorbidities_rate
FROM `looker-sandbox-342014.lifepoint_demo.lifepoint_demo` LIMIT 1 ;;
  }

  dimension: rate_of_complication {
    type: number
    sql: ${TABLE}.rate_of_complication ;;
  }

  measure: national_avg_rate_of_complication  {
    group_label: "National-Level"
    type: average
    sql: ${rate_of_complication} ;;
    value_format_name: decimal_2
  }


}
