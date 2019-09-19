view: credit_control_targets {
  sql_table_name: CC.CREDIT_CONTROL_TARGETS ;;

  dimension: archive_month {
    type: string
    sql: ${TABLE}."ARCHIVE_MONTH" ;;
  }

  dimension: client_sales_code {
    type: string
    sql: ${TABLE}."Client_Sales_Code" ;;
  }

  dimension: controller_name {
    type: string
    sql:case
    when ${TABLE}."Controller_Name" = 'Customer DD Accounts' or "Controller_Name" = 'Customer DD Accs' then 'Customer DD Accounts'
    when ${TABLE}."Controller_Name" = 'Gail Hameed' or "Controller_Name" = 'Gail Hameed.' then 'Gail Hameed'
    when ${TABLE}."Controller_Name" = 'Glyn Cobb' or "Controller_Name" = 'Glyn Cobb.' then 'Glyn Cobb'
    else ${TABLE}."Controller_Name"
    END ;;

  }

  dimension: current {
    type: number
    sql: ${TABLE}."Current" ;;
  }

  dimension: customer_key {
    type: string
    sql: ${TABLE}."Customer_Key" ;;
  }

  dimension: customer_tier {
    type: string
    sql: ${TABLE}."Customer_Tier" ;;
  }

  dimension: p1 {
    type: number
    sql: ${TABLE}."P1" ;;
  }

  dimension: p2 {
    type: number
    sql: ${TABLE}."P2" ;;
  }

  dimension: p3 {
    type: number
    sql: ${TABLE}."P3" ;;
  }

  dimension: p4 {
    type: number
    sql: ${TABLE}."P4" ;;
  }

  dimension: staff_sales_code {
    type: string
    sql: ${TABLE}."Staff_Sales_Code" ;;
  }

  dimension: unallocated_amount {
    type: number
    sql: ${TABLE}."Unallocated_Amount" ;;
  }

  measure: count {
    type: count
    drill_fields: [controller_name]
  }

  measure: count_of_p1 {
    type: count
    drill_fields: [p1]
  }

  measure: count_of_p2 {
    type: count
    drill_fields: [p2]
  }

  measure: count_of_p3 {
    type: count
    drill_fields: [p3]
  }

  measure: count_of_p4 {
    type: count
    drill_fields: [p4]
  }

  measure: sum_p1 {
    type: sum
    sql: ${p1} ;;
  }

  measure: sum_p2 {
    type: sum
    sql: ${p2} ;;
  }

  measure: sum_p3 {
    type: sum
    sql: ${p3} ;;
  }

  measure: sum_p4 {
    type: sum
    sql: ${p4} ;;
  }

  measure: sum_curr {
    type: sum
    sql: ${current} ;;
  }

  measure: sum_un {
    type: sum
    sql: ${unallocated_amount} ;;
  }

  measure: sum {
    type: sum
    sql: ${current}+${p1}+${p2}+${p3}+${p4}+${unallocated_amount}  ;;
  }

}
