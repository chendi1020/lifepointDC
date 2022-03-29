view: lp_regional_averages {
  view_label: "Comparision"

  derived_table: {
    explore_source: lifepoint  {
      column: region {}
      column: number_of_patients {}
      column: readmit_rate {}
      column:average_number_of_complications {}
    }
  }

  dimension: region {
    type: string
    hidden: yes
    primary_key: yes
  }

  dimension:average_number_of_complications  {
    type: number
    hidden: yes
  }

  measure:LP_region_avg_rate_of_complications  {
    view_label: "Care Variation"
    group_label: "Complication Rate"
    type: average
    sql: ${average_number_of_complications} ;;
  }

}
