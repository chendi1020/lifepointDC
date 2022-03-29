view: avg_cost_facility {
  derived_table: {
    sql: select facility , avgCost, rank() over ( order by  avgCost)
      from (
      SELECT facility, avg(total_cost) as avgCost FROM `looker-sandbox-342014.lifepoint_demo.lifepoint_demo`
      group by facility
      )
      LIMIT 10
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: facility {
    type: string
    primary_key: yes
    sql: ${TABLE}.facility ;;
  }

  dimension: avg_cost {
    type: number
    sql: ${TABLE}.avgCost ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.f0_ ;;
  }

  set: detail {
    fields: [facility, avg_cost, rank]
  }
}
