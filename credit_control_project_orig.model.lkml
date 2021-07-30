connection: "db"

# include all the views
include: "*.view"

datagroup: credit_control_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hours"
}

persist_with: credit_control_project_default_datagroup

explore: aged_debt_view {

join: payment_receipts {
  view_label: "Payment Receipts"
  relationship: one_to_many
  sql_on: ${aged_debt_view.cust_key} = ${payment_receipts.customer_key}  ;;
}

  join: credit_control_targets {
    view_label: "Credit Control Targets"
    relationship: one_to_one
    sql_on: ${credit_control_targets.customer_key} = ${aged_debt_view.cust_key} ;;
  }

}
