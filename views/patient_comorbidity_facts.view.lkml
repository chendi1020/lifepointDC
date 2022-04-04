view: patient_comorbidity_facts {
  derived_table: {
    sql: SELECT
      patient_id
      , total_cost AS cost
      , 'Diabetes' AS comorbidity
      FROM `lifepoint_demo.lifepoint_demo` AS joint_replacement
      WHERE has_diabetes = TRUE

      UNION ALL

      SELECT
      patient_id
      , total_cost AS cost
      , 'Cancer' AS comorbidity
      FROM `lifepoint_demo.lifepoint_demo` AS joint_replacement
      WHERE has_cancer = TRUE

      UNION ALL

      SELECT
      patient_id
      , total_cost AS cost
      , 'Obesity' AS comorbidity
      FROM `lifepoint_demo.lifepoint_demo` AS joint_replacement
      WHERE has_obesity = TRUE

      UNION ALL

      SELECT
      patient_id
      , total_cost AS cost
      , 'COPD' AS comorbidity
      FROM `lifepoint_demo.lifepoint_demo` AS joint_replacement
      WHERE has_copd = TRUE

      UNION ALL

      SELECT
      patient_id
      , total_cost AS cost
      , 'Congestive Heart Failure' AS comorbidity
      FROM `lifepoint_demo.lifepoint_demo` AS joint_replacement
      WHERE has_congestive_heart_failure = TRUE
      ;;

    # persist_for: "48 hours"

  }

## ---------------------------- IDs ---------------------------- ##

  dimension: primary_key {
    hidden: yes
    primary_key: yes

    type: string
    sql: CONCAT(${patient_id},${comorbidity}) ;;
  }

## ---------------------------- Native Dimensions ---------------------------- ##

  dimension: patient_id {
    hidden: yes

    type: number
    sql: ${TABLE}.Patient_ID ;;
  }

  dimension: cost {
    hidden: yes

    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: comorbidity {
    view_label: "LifePoint Demo"

    type: string
    sql: ${TABLE}.comorbidity ;;
    link: {
      label: "{{value}} Population Health Details"
      icon_url: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png"
      url: "/dashboards/10?Comorbidity={{value}}&Timeframe={{ _filters['lp_demo.procedure_year'] | url_encode }}"
    }
  }

## ---------------------------- Derived Dimensions ---------------------------- ##


## ---------------------------- Measures ---------------------------- ##

  measure: number_of_patients {
    view_label: "LifePoint Demo"
    group_label: "Comorbidity"
    drill_fields: [lp_demo.patient_details*]
    type: count
  }

  measure: total_cost {
    view_label: "LifePoint Demo"
    group_label: "Comorbidity"
    drill_fields: [lp_demo.patient_details*]
    type: sum
    sql: ${cost} ;;
    value_format_name: usd
  }

  measure: average_cost_per_patient {
    view_label: "LifePoint Demo"
    group_label: "Comorbidity"
    drill_fields: [lp_demo.patient_details*]
    type: number
    sql: ${total_cost}/NULLIF(${number_of_patients},0) ;;
    value_format_name: usd
  }

  measure: patient_comorbidity_count {
    hidden: yes
    type: count
  }

}
