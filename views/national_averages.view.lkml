view: national_averages {
  view_label: "Comparators"

  derived_table: {
    sql: SELECT
        2.6 AS rate_of_complication
      , 0.04 AS readmission_post_procedure
      , 1.0 AS rate_of_serious_complications
      , 21000 AS payment_cost
      , 3.44 AS los_elective
      , .64 AS multiple_comorbidities_rate
      FROM `looker-sandbox-342014.lifepoint_demo.lifepoint_demo`
      LIMIT 1 ;;

    persist_for: "48 hours"

  }

## ---------------------------- IDs ---------------------------- ##


## ---------------------------- Native Dimensions ---------------------------- ##

  dimension: los_elective {
    hidden: yes
    primary_key: yes

    type: number
    sql: ${TABLE}.los_elective ;;
  }

  dimension: payment_cost {
    hidden: yes

    type: number
    sql: ${TABLE}.payment_cost ;;
  }

  dimension: rate_of_complication {
    hidden: yes

    type: number
    sql: ${TABLE}.rate_of_complication ;;
  }

  dimension: rate_of_serious_complications {
    hidden: yes

    type: number
    sql: ${TABLE}.rate_of_serious_complications ;;
  }

  dimension: readmission_post_procedure {
    hidden: yes

    type: number
    sql: ${TABLE}.readmission_post_procedure ;;
  }

  dimension: multiple_comorbidities_rate {
    hidden: yes

    type: number
  }

## ---------------------------- Measures ---------------------------- ##

  measure: national_average_length_of_stay_elective {
    group_label: "National-Level"
    group_item_label: "National Average Length of Stay"

    type: average
    sql: ${los_elective} ;;
    value_format_name: decimal_2
  }

  measure: national_average_payment_cost {
    group_label: "National-Level"
    group_item_label: "National Average Total Payment/Cost"

    type: average
    sql: ${payment_cost} ;;
    value_format_name: usd_0
  }

  measure: national_average_rate_of_complication {
    group_label: "National-Level"

    type: average
    sql: ${rate_of_complication} ;;
    value_format_name: decimal_2
  }

  measure: national_average_rate_of_serious_complications {
    group_label: "National-Level"

    type: average
    sql: ${rate_of_serious_complications} ;;
    value_format_name: decimal_2
  }

  measure: national_average_readmission_post_procedure {
    group_label: "National-Level"

    type: average
    sql: ${readmission_post_procedure};;
    value_format_name: percent_2
  }

  measure: national_average_rate_of_multiple_comorbidities {
    group_label: "National-Level"

    type: average
    sql: ${multiple_comorbidities_rate} ;;
    value_format_name: percent_2
  }

  measure: care_metric_national {
    view_label: "Care Variation"
    label_from_parameter: lp_demo.care_metric_picker
    value_format_name: decimal_2
    type: number
    sql:  {% if lp_demo.care_metric_picker._parameter_value == 'average_rate_of_complications' %}
            ${national_average_rate_of_complication}
          {% elsif lp_demo.care_metric_picker._parameter_value == 'average_readmission_post_procedure' %}
            ${national_average_readmission_post_procedure}
          {% elsif lp_demo.care_metric_picker._parameter_value == 'average_rate_of_serious_complications' %}
            ${national_average_rate_of_serious_complications}
          {% endif %};;
  }

}
