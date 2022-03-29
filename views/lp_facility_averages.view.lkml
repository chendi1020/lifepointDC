view: lp_facility_averages {
  view_label: "Comparision"

  derived_table: {
    explore_source: lifepoint {
      column: facility{}
      column: number_of_patients {}
      column: readmit_rate {}
      column:average_number_of_complications {}
    }
  }

  dimension: facility {
    type:string
    hidden: yes
    primary_key: yes
  }

  dimension: readmit_rate {
    type: number
    hidden: yes
  }

  dimension:average_number_of_complications  {
    type: number
    hidden: yes
  }

  ##------------------------measure------------------------------##
  measure: LP_hospital_avg_complication_rate {
    view_label: "Care Variation"
    group_label: "Complication Rate"
    type: average
    sql: ${average_number_of_complications}  ;;
  }


  measure: readmit_first_quartile {
    view_label: "Care Variation"
    group_label: "Readmittance"
    type: number
    sql:  APPROX_QUANTILES(${readmit_rate},100)[OFFSET(25)] ;;
    value_format_name: decimal_2
  }

  measure: readmit_avg {
    view_label: "Care Variation"
    group_label: "Readmittance"
    type: average
    sql: ${readmit_rate} ;;
  }


  measure: readmit_median {
    view_label: "Care Variation"
    group_label: "Readmittance"
    type: number
    sql:  APPROX_QUANTILES(${readmit_rate},100)[OFFSET(50)] ;;
  }

  measure: readmit_third_quartile {
    view_label: "Care Variation"
    group_label: "Readmittance"
    type: number
    sql:  APPROX_QUANTILES(${readmit_rate},100)[OFFSET(75)] ;;
  }

  measure: readmit_std {
    view_label: "Care Variation"
    group_label: "Readmittance"
    type: number
    sql: STDDEV(${readmit_rate}) ;;
  }

  measure: readmit_min {
    view_label: "Care Variation"
    group_label: "Readmittance"
    type: number
    sql: MIN(${readmit_rate});;
  }
  measure: readmit_max {
    view_label: "Care Variation"
    group_label: "Readmittance"
    type: number
    sql: MAX(${readmit_rate}) ;;
  }


 }
