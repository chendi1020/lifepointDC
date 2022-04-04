view: radiology_service_facility {
  view_label: "Care Variation"

  derived_table: {
    explore_source: lp_demo {
      column: number_of_patients {}
      column: radiology_service_used {}
      column: facility {}
    }

    # persist_for: "48 hours"
  }

  ############### Dimensions ###################

  dimension: number_of_patients {
    hidden: yes
    type: number
  }

  dimension: radiology_service_used {
    hidden: yes
    type: number
  }

  dimension: facility {
    hidden: yes
    type: number
  }

  ################### Measures #####################

  #########Care Variation Boxplots############
  measure: radiology_patients_median {
    view_label: "Care Variation"
    group_label: "Radiology"
    type: number
    sql: APPROX_QUANTILES(${number_of_patients}, 100)[OFFSET(50)] ;;
  }

  measure: radiology_patients_first_quartile {
    view_label: "Care Variation"
    group_label: "Radiology"
    type: number
    sql: APPROX_QUANTILES(${number_of_patients}, 100)[OFFSET(25)] ;;
  }

  measure: radiology_patients_third_quartile{
    view_label: "Care Variation"
    group_label: "Radiology"
    type: number
    sql: APPROX_QUANTILES(${number_of_patients}, 100)[OFFSET(75)] ;;
  }

  measure: radiology_patients_min {
    view_label: "Care Variation"
    group_label: "Radiology"
    type: min
    sql: ${number_of_patients};;
  }

  measure: radiology_patients_max {
    view_label: "Care Variation"
    group_label: "Radiology"
    type: max
    sql: ${number_of_patients};;
  }

}
