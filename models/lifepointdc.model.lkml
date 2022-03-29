# Define the database connection to be used for this model.
connection: "mathorgsandbox"

# include all the views
include: "/views/**/*.view"

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


explore: lifepoint {
  join: national_avg {
    type: left_outer
    relationship: many_to_one
    sql_on: 1=1 ;;
  }

  join: lp_facility_averages {
    type: left_outer
    relationship: many_to_one
    sql_on: ${lifepoint.facility}= ${lp_facility_averages.facility} ;;
  }

  join: avg_cost_facility {
    type: left_outer
    relationship: many_to_one
    sql_on: ${lifepoint.facility} = ${avg_cost_facility.facility} ;;
  }

  # join: lp_regional_averages {
  #   type: left_outer
  #   relationship: many_to_one
  #   sql_on: ${lifepoint.region}=region ;;
  # }
}