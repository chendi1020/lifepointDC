view: lp_national {
  view_label: "Comparators"
  derived_table: {
    explore_source: lp_demo {
      #column: average_number_of_gaps_in_care {}
      #column: total_number_of_gaps_in_care {}
      #column: average_access {}
      #column: average_adherence_to_testing {}
      #column: average_adherence_to_treatment {}
      #column: average_diagnosis {}
      #column: average_diagnostic_testing_process {}
      #column: average_potential_health_concern {}
      #column: average_problem_recognition {}
      #column: average_response_to_treatment {}
      #column: average_treatment_or_recommendation_to_treatment {}
      #column: average_rate_of_complications {}
      #column: average_readmission_post_procedure {}
      #column: average_rate_of_serious_complications {}
      #column: average_cost {}
      column: average_length_of_stay_elective {}
      #column: number_of_patients {}
      #column: avg_home_health_pt {}
      #column: avg_equipment_not_there {}
      #column: avg_waiting_for_pt_referral {}
      #column: avg_tobacco_use_preop {}
      #column: avg_chronic_disease_exacerbation {}
      #column: avg_orders_not_written {}
      #column: avg_rounds_not_done {}
    }

    # persist_for: "48 hours"

  }

## ---------------------------- IDs ---------------------------- ##


## ---------------------------- Native Dimensions ---------------------------- ##


  dimension: average_length_of_stay_elective {
    primary_key: yes
    hidden: yes
    type: number
  }




## ---------------------------- Measures ---------------------------- ##


  measure: lp_national_average_length_of_stay_elective {
    group_label: "LP National-Level"
    group_item_label: "LP National Average Length of Stay"
    type: average
    sql: ${average_length_of_stay_elective} ;;
    value_format_name: decimal_2
    drill_fields: [detail*,lp_regional_averages.lp_regional_average_length_of_stay_elective]
  }



  set: detail {fields:[joint_replacement.region]}

}
