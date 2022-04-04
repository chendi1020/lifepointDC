view: pain_management_facility {
  view_label: "Care Variation"

  derived_table: {
    explore_source: lp_demo {
      column: number_of_patients {}
      column: post_op_pain_management {}
      column: facility {}
    }

    # persist_for: "48 hours"
  }

  ############### Dimensions ###################

  dimension: number_of_patients {
    hidden: yes
    type: number
  }

  dimension: post_op_pain_management {
    hidden: yes
    type: string
  }

  dimension: facility {
    hidden: yes
    type: number
  }

  ################### Measures #####################

  #########Care Variation Boxplots############
  measure: pain_mngmnt_patients_median {
    view_label: "Care Variation"
    group_label: "Pain Management"
    type: number
    sql: APPROX_QUANTILES(${number_of_patients}, 100)[OFFSET(50)] ;;
  }

  measure: pain_mngmnt_patients_first_quartile {
    view_label: "Care Variation"
    group_label: "Pain Management"
    type: number
    sql: APPROX_QUANTILES(${number_of_patients}, 100)[OFFSET(25)] ;;
  }

  measure: pain_mngmnt_patients_third_quartile{
    view_label: "Care Variation"
    group_label: "Pain Management"
    type: number
    sql: APPROX_QUANTILES(${number_of_patients}, 100)[OFFSET(75)] ;;
  }

  measure: pain_mngmnt_patients_min {
    view_label: "Care Variation"
    group_label: "Pain Management"
    type: min
    sql: ${number_of_patients};;
  }

  measure: pain_mngmnt_patients_max {
    view_label: "Care Variation"
    group_label: "Pain Management"
    type: max
    sql: ${number_of_patients};;
  }

}
