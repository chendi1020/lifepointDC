# include all the views
include: "/views/**/*.view"

explore: lp_demo {
  description: "Use this Explore to understand facts regarding pre-op conditions, the procedure, patients, and post-op complications"
  label: "Demo"

  join: national_averages {
    type: left_outer
    relationship: many_to_one
    sql_on: 1 = 1 ;;
  }

  join: lp_national {
    type: left_outer
    relationship: many_to_one
    sql_on: 1 = 1 ;;
  }

  join: lp_national_averages {
    type: left_outer
    relationship: many_to_one
    sql_on: ${lp_demo.procedure_date} = ${lp_national_averages.procedure_date} ;;
  }

  join: lp_regional_averages {
    type: left_outer
    relationship: many_to_one
    sql_on: ${lp_demo.region} = ${lp_regional_averages.region} ;;
  }

  join: lp_facility_averages {
    type: left_outer
    relationship: many_to_one
    sql_on: ${lp_demo.facility} = ${lp_facility_averages.facility} ;;
  }

  join: patient_comorbidity_facts {
    type: left_outer
    relationship: one_to_many
    sql_on: ${lp_demo.patient_id} = ${patient_comorbidity_facts.patient_id} ;;
  }

  join: patient_facts {
    view_label: "Joint Replacement"
    type: left_outer
    relationship: many_to_one
    sql_on: ${lp_demo.patient_id} = ${patient_facts.patient_id} ;;
  }

  join: radiology_service_facility {
    type: left_outer
    relationship: many_to_one
    sql_on: ${lp_demo.facility} = ${radiology_service_facility.facility}
      AND ${lp_demo.radiology_service_used} = ${radiology_service_facility.radiology_service_used} ;;
  }

  join: pain_management_facility {
    type: left_outer
    relationship: many_to_one
    sql_on: ${lp_demo.facility} = ${pain_management_facility.facility}
      AND ${lp_demo.post_op_pain_management} = ${pain_management_facility.post_op_pain_management} ;;
  }

  join: intervention_most_recent {
    type: left_outer
    relationship: many_to_one
    sql_on: ${lp_demo.procedure_date} = ${intervention_most_recent.max_procedure_date}
          and ${intervention_most_recent.attending_name} = ${lp_demo.attending_name}
          and ${intervention_most_recent.intervention_start_date} = ${lp_demo.intervention_start_date}
          and ${intervention_most_recent.intervention_type} = ${lp_demo.intervention_type};;
  }
}
