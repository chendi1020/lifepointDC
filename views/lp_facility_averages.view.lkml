view: lp_facility_averages {
  view_label: "Comparators"

  derived_table: {
    explore_source: lp_demo {
      column: average_number_of_gaps_in_care {}
      column: total_number_of_gaps_in_care {}
      column: average_access {}
      column: average_adherence_to_testing {}
      column: average_adherence_to_treatment {}
      column: average_diagnosis {}
      column: average_diagnostic_testing_process {}
      column: average_potential_health_concern {}
      column: average_problem_recognition {}
      column: average_response_to_treatment {}
      column: average_treatment_or_recommendation_to_treatment {}
      column: average_rate_of_complications {}
      column: average_readmission_post_procedure {}
      column: average_rate_of_serious_complications {}
      column: average_cost {}
      column: average_length_of_stay_elective {}
      column: readmit_rate {}
      column: total_unplanned_readmissions {}
      column: avg_home_health_pt {}
      column: avg_equipment_not_there {}
      column: avg_waiting_for_pt_referral {}
      column: avg_tobacco_use_preop {}
      column: avg_chronic_disease_exacerbation {}
      column: avg_orders_not_written {}
      column: avg_rounds_not_done {}
      column: facility {}

    }

    # persist_for: "48 hours"

  }

## ---------------------------- IDs ---------------------------- ##


## ---------------------------- Native Dimensions ---------------------------- ##

  dimension: average_rate_of_complications {
    hidden: yes
    type: number
  }

  dimension: average_rate_of_serious_complications {
    hidden: yes
    type: number
  }

  dimension: average_readmission_post_procedure {
    hidden: yes
    type: number
  }

  dimension: average_cost {
    hidden: yes
    type: number
  }

  dimension: average_length_of_stay_elective {
    hidden: yes
    type: number
  }

  dimension: average_number_of_gaps_in_care {
    hidden: yes
    value_format: "#,##0.00"
    type: number
  }

  dimension: total_number_of_gaps_in_care {
    hidden: yes
    type: number
  }

  dimension: average_access {
    hidden: yes
    value_format: "#,##0.00"
    type: number
  }

  dimension: average_adherence_to_testing {
    hidden: yes
    value_format: "#,##0.00"
    type: number
  }

  dimension: average_adherence_to_treatment {
    hidden: yes
    value_format: "#,##0.00"
    type: number
  }

  dimension: average_diagnosis {
    hidden: yes
    value_format: "#,##0.00"
    type: number
  }

  dimension: average_diagnostic_testing_process {
    hidden: yes
    value_format: "#,##0.00"
    type: number
  }

  dimension: average_potential_health_concern {
    hidden: yes
    value_format: "#,##0.00"
    type: number
  }

  dimension: average_problem_recognition {
    hidden: yes
    value_format: "#,##0.00"
    type: number
  }

  dimension: average_response_to_treatment {
    hidden: yes
    value_format: "#,##0.00"
    type: number
  }

  dimension: average_treatment_or_recommendation_to_treatment {
    hidden: yes
    value_format: "#,##0.00"
    type: number
  }

  dimension: facility {
    hidden: yes
    primary_key: yes
    type: string
  }

  dimension: readmit_rate {
    hidden: yes
    type: number
  }

  dimension: avg_home_health_pt {
    hidden: yes
    type: number
  }

  dimension: avg_equipment_not_there {
    hidden: yes
    type: number
  }

  dimension: avg_waiting_for_pt_referral {
    hidden: yes
    type: number
  }

  dimension: avg_tobacco_use_preop {
    hidden: yes
    type: number
  }

  dimension: avg_chronic_disease_exacerbation {
    hidden: yes
    type: number
  }

  dimension: avg_orders_not_written {
    hidden: yes
    type: number
  }

  dimension: avg_rounds_not_done {
    hidden: yes
    type: number
  }



## ---------------------------- Measures ---------------------------- ##

  measure: lp_facility_average_rate_of_complications {
    group_label: "LP Facility-Level"
    type: average
    sql: ${average_rate_of_complications} ;;
    value_format_name: decimal_2
    drill_fields: [detail*, joint_replacement.average_rate_of_complications]
  }

  measure: lp_facility_average_rate_of_serious_complications {
    group_label: "LP Facility-Level"
    type: average
    sql: ${average_rate_of_serious_complications} ;;
    value_format_name: decimal_2
    drill_fields: [detail*]
  }

  measure: lp_facility_average_readmission_post_procedure {
    group_label: "LP Facility-Level"
    type: average
    sql: ${average_readmission_post_procedure} ;;
    value_format_name: percent_1
    drill_fields: [detail*]
  }

  measure: lp_facility_total_payment_cost {
    group_label: "LP Facility-Level"
    group_item_label: "Lp Facility Total Payment/Cost"
    type: average
    sql: ${average_cost} ;;
    value_format_name: usd_0
    drill_fields: [detail*]
  }

  measure: lp_facility_average_length_of_stay_elective {
    group_label: "LP Facility-Level"
    group_item_label: "Lp Facility Average Length of Stay - Elective"
    type: average
    sql: ${average_length_of_stay_elective} ;;
    value_format_name: decimal_2
    drill_fields: [detail*]
  }

  measure: lp_facility_average_number_of_gaps_in_care {
    group_label: "LP Facility-Level"
    type: average
    sql: ${average_number_of_gaps_in_care} ;;
    value_format_name: decimal_2
    drill_fields: [detail*, joint_replacement.average_number_of_gaps_in_care]
  }

  measure: lp_facility_total_number_of_gaps_in_care {
    group_label: "LP Facility-Level"
    type: average
    sql: ${total_number_of_gaps_in_care} ;;
    drill_fields: [detail*, joint_replacement.total_number_of_gaps_in_care]
  }

  measure: lp_facility_average_access {
    group_label: "LP Facility-Level"
    type: average
    sql: ${average_access} ;;
    value_format_name: decimal_2
    drill_fields: [detail*]
  }

  measure: lp_facility_average_adherence_to_testing {
    group_label: "LP Facility-Level"
    type: average
    sql: ${average_adherence_to_testing} ;;
    value_format_name: decimal_2
    drill_fields: [detail*]
  }

  measure: lp_facility_average_adherence_to_treatment {
    group_label: "LP Facility-Level"
    type: average
    sql: ${average_adherence_to_treatment} ;;
    value_format_name: decimal_2
    drill_fields: [detail*]
  }

  measure: lp_facility_average_diagnosis {
    group_label: "LP Facility-Level"
    type: average
    sql: ${average_diagnosis} ;;
    value_format_name: decimal_2
    drill_fields: [detail*]
  }

  measure: lp_facility_average_diagnostic_testing_process {
    group_label: "LP Facility-Level"
    type: average
    sql: ${average_diagnostic_testing_process} ;;
    value_format_name: decimal_2
    drill_fields: [detail*]
  }

  measure: lp_facility_average_potential_health_concern {
    group_label: "LP Facility-Level"
    type: average
    sql: ${average_potential_health_concern} ;;
    value_format_name: decimal_2
    drill_fields: [detail*]
  }

  measure: lp_facility_average_problem_recognition {
    group_label: "LP Facility-Level"
    type: average
    sql: ${average_problem_recognition} ;;
    value_format_name: decimal_2
    drill_fields: [detail*]
  }

  measure: lp_facility_average_response_to_treatment {
    group_label: "LP Facility-Level"
    type: average
    sql: ${average_response_to_treatment} ;;
    value_format_name: decimal_2
    drill_fields: [detail*]
  }

  measure: lp_facility_average_treatment_or_recommendation_to_treatment {
    group_label: "LP Facility-Level"
    type: average
    sql: ${average_treatment_or_recommendation_to_treatment} ;;
    value_format_name: decimal_2
    drill_fields: [detail*,joint_replacement.average_treatment_or_recomendation_to_treatment]
  }

  #########Care Variation Boxplots############
  measure: readmit_median {
    view_label: "Care Variation"
    group_label: "Readmittance"
    type: number
    sql: APPROX_QUANTILES(${readmit_rate}, 100)[OFFSET(50)] ;;
  }

  measure: readmit_first_quartile {
    view_label: "Care Variation"
    group_label: "Readmittance"
    type: number
    sql: APPROX_QUANTILES(${readmit_rate}, 100)[OFFSET(25)] ;;
  }

  measure: readmit_third_quartile{
    view_label: "Care Variation"
    group_label: "Readmittance"
    type: number
    sql: APPROX_QUANTILES(${readmit_rate}, 100)[OFFSET(75)] ;;
  }

  measure: readmit_standard_deviation {
    view_label: "Care Variation"
    group_label: "Readmittance"
    hidden: yes
    type: number
    sql: STDDEV(${readmit_rate}) ;;
  }

  measure: readmit_min {
    view_label: "Care Variation"
    group_label: "Readmittance"
    type: min
    sql: ${readmit_rate};;
  }

  measure: readmit_max {
    view_label: "Care Variation"
    group_label: "Readmittance"
    type: max
    sql: ${readmit_rate};;
  }

  ############CQI Update##############
  measure: lp_facility_average_home_health_pt {
    group_label: "LP Facility-Level"
    type: average
    sql: ${avg_home_health_pt} ;;
  }

  measure: lp_facility_average_equipment_not_there {
    group_label: "LP Facility-Level"
    type: average
    sql: ${avg_equipment_not_there} ;;
  }

  measure: lp_facility_average_waiting_for_pt_referral {
    group_label: "LP Facility-Level"
    type: average
    sql: ${avg_waiting_for_pt_referral} ;;
  }

  measure: lp_facility_average_tobacco_use_preop {
    group_label: "LP Facility-Level"
    type: average
    sql: ${avg_tobacco_use_preop} ;;
  }

  measure: lp_facility_average_chronic_disease_exacerbation {
    group_label: "LP Facility-Level"
    type: average
    sql: ${avg_chronic_disease_exacerbation} ;;
  }

  measure: lp_facility_average_orders_not_written {
    group_label: "LP Facility-Level"
    type: average
    sql: ${avg_orders_not_written} ;;
  }

  measure: lp_facility_average_rounds_not_done {
    group_label: "LP Facility-Level"
    type: average
    sql: ${avg_rounds_not_done} ;;
  }

  set: detail {fields:[joint_replacement.patient_name,joint_replacement.attending_name]}
}
