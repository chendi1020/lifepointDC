view: national_avg {
  view_label: "Comparision"

  derived_table: {
    explore_source: lifepoint {
      column: procedure_date {}
      #column: total_patient {}
    }
  }

  dimension: procedure_date {
    type: date
    primary_key: yes
  }


}
