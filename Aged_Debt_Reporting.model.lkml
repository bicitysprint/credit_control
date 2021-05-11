connection: "db"

# include all the views
include: "/views/*.view.lkml"
include: "/*.view"

# include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

named_value_format: gbp_format {
  value_format: "#,##0.00"
}

named_value_format: gbp_format_dp {
  value_format: "\"£\"#,##0.00"
}

datagroup: credit_control_reporting_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hours"
}

persist_with: credit_control_reporting_datagroup

explore: vw_ageddebt_new {
  label: "Aged Debt Reporting"


##join: vw_ageddebt2_test {
##  view_label: "Aged Debt"
##  relationship: one_to_one
##  sql_on: ${vw_ageddebt2_test.id_inkey_in_cukey} = ${vw_ageddebt_new.customer_key}  ;;
##}

  join: vw_ageddebt_salecode_desc {
    view_label: "Sale Codes"
    relationship: one_to_one
    sql_on:${vw_ageddebt3_30032021.id_inkey_in_cukey} = ${vw_ageddebt_salecode_desc.cust_key}  ;;
  }

    join: vw_ageddebt3_test {
      view_label: "New Aged Debt Report"
      relationship: one_to_one
      sql_on: ${vw_ageddebt3_test.id_inkey_in_cukey} = ${vw_ageddebt_new.customer_key}  ;;
    }

      join: vw_ageddebt_new_30032021 {
        view_label: "New Aged Debt Base_v4"
        relationship: one_to_one
        sql_on: ${vw_ageddebt_new_30032021.customer_key} = ${vw_ageddebt_new.customer_key}  ;;
      }

         join: vw_ageddebt3_30032021 {
           view_label: "New Aged Debt Report_v4"
           relationship: one_to_one
           sql_on: ${vw_ageddebt_new_30032021.customer_key} = ${vw_ageddebt3_30032021.id_inkey_in_cukey}  ;;
         }

           join: vw_ageddebt_payments {
              view_label: "New Aged Debt Payments"
              relationship: one_to_one
              sql_on: ${vw_ageddebt3_30032021.id_inkey_in_cukey} = ${vw_ageddebt_payments.customer_key}  ;;
           }

               join: vw_ageddebt_targets {
               view_label: "New Aged Debt Targets"
               relationship: one_to_one
               sql_on: ${vw_ageddebt_salecode_desc.sales_code_h} = ${vw_ageddebt_targets.sales_code_h}  ;;
               }


}

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
