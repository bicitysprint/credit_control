connection: "db"

# include all the views
include: "*.view"

datagroup: credit_control_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hours"
}

persist_with: credit_control_project_default_datagroup

explore: aged_debt_view {}
