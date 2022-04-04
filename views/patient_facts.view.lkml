# If necessary, uncomment the line below to include explore_source.
# include: "lifepoint_demo.model.lkml"

view: patient_facts {
  derived_table: {
    explore_source: lp_demo {
      column: patient_id {}
      column: patient_comorbidity_count { field: patient_comorbidity_facts.patient_comorbidity_count }
    }

    # persist_for: "48 hours"

  }

  dimension: patient_id {
    hidden: yes
    primary_key: yes
    type: number
  }
  dimension: patient_comorbidity_count {
    hidden: yes
    type: number
  }
  dimension:patient_comorbidity_group  {
    view_label: "LifePoint Demo"
    group_label: "Patient"
    type: string
    sql: case when ${patient_comorbidity_count} >1 then "Multiple Comorbidities"
          when ${patient_comorbidity_count} = 1 then "One Comorbidity"
          else "No Comorbiditites" end;;
  }
}
