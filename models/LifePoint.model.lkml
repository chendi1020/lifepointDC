# Define the database connection to be used for this model.
connection: "mathorgsandbox"

# include all the views
include: "/views/**/*.view"
#include: "/dashboards/**/*.dashboard"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: lifepointdc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: lifepointdc_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Lifepointdc"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.


explore: lp_demo {
  description: "Use this Explore to understand facts regarding pre-op conditions, the procedure, patients, and post-op complications"

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
