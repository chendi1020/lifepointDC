view: intervention_most_recent {
  derived_table: {
    explore_source: lp_demo {
      column: attending_name {}
      column: intervention_target {}
      column: intervention_start_date {}
      column: intervention_evaluation_date {}
      column: intervention_type {}
      column: max_procedure_date {}
    }
  }

  dimension: attending_name {
    hidden: yes
  }

  dimension: intervention_target {
    hidden: yes
  }

  dimension: intervention_start_date {
    hidden: yes
  }

  dimension: intervention_evaluation_date {
    hidden: yes
  }

  dimension: intervention_type {
    hidden: yes
  }

  dimension: max_procedure_date {
    hidden: yes
  }
}
