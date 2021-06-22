view: vw_ageddebt_targets {
  sql_table_name: "CC"."VW_AGEDDEBT_TARGETS"
    ;;

  dimension: archive {
    type: string
    sql: ${TABLE}."ARCHIVE" ;;
  }

  dimension: ccg {
    type: string
    sql: ${TABLE}."CCG" ;;
  }

  dimension: controller_name {
    type: string
    sql: case
    when ${TABLE}."CONTROLLER_NAME" = 'CUSTOMER DD ACCOUNTS' or "CONTROLLER_NAME" = 'CUSTOMER DD ACCS' then 'CUSTOMER DD ACCOUNTS'
    when ${TABLE}."CONTROLLER_NAME" = 'GLYN COBB' or "CONTROLLER_NAME" = 'GLYN COBB.' then 'GLYN COBB'
    when ${TABLE}."CONTROLLER_NAME" = 'GAIL HAMEED' or "CONTROLLER_NAME" = 'GAIL HAMEED.' then 'GAIL HAMEED'
    when ${TABLE}."CONTROLLER_NAME" = 'PRIMROSE ARTHURS' then 'PRIMROSE ARTHURS-WOOD'
    else ${TABLE}."CONTROLLER_NAME"
    END ;;
  }

  dimension: curr {
    type: number
    sql: ${TABLE}."CURR" ;;
  }

  dimension: cust_key {
    primary_key: yes
    type: string
    sql: ${TABLE}."CUST_KEY" ;;
  }

  dimension: cust_archive_key  {
    type: string
    sql: concat(${TABLE}."CUST_KEY",${TABLE}."ARCHIVE") ;;
  }


#  dimension: name {
#    type: string
#    sql: ${TABLE}."NAME" ;;
#  }

#### ALL PERIODS USED HERE REFLECT FIGURES AS AT END OF PREVIOUS ARCHIVE, EG P1 FOR 210430 WILL BE P2 IN THE MONTH AFTER (COLLECTION)

  dimension: p1 {
    label: "P2 Debt Amount"
    type: number
    sql: ${TABLE}."P1" ;;
  }

  dimension: p2 {
    label: "P3 Debt Amount"
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

  dimension: sales_code_h {
    type: string
    sql: ${TABLE}."SALES_CODE_H" ;;
  }

  dimension: unallocated {
    type: number
    sql: ${TABLE}."UNALLOCATED" ;;
  }


#######################################################

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum_of_curr {
    label: "P1_Target_Sum"
    type: sum
    sql: ${curr} ;;
    value_format_name: gbp
  }

  measure: sum_of_p1 {
    label: "P2_Target_Sum"
##    type: sum
   type: sum_distinct
    sql_distinct_key: ${cust_archive_key} ;;
    sql: ${p1} ;;
    value_format_name: gbp
    drill_fields: [P2_Target_details*]
  }

  measure: sum_of_p2 {
    label: "P3_Target_Sum"
    type: sum_distinct
    sql_distinct_key: ${cust_archive_key} ;;
    sql: ${p2} ;;
    value_format_name: gbp
  }

  measure: sum_of_p3 {
    type: sum ##_distinct
##    sql_distinct_key: ${cust_key}
    sql: ${p3} ;;
    value_format_name: gbp
  }

  measure: sum_of_p4 {
    type: sum
    sql: ${p4} ;;
    value_format_name: gbp
  }

  measure: sum_of_p3_plus_p4 {
    label: "P4_Target_Sum"
    type: sum
    sql: ${p3}+${p4} ;;
    value_format_name: gbp
  }


  measure: sum_of_unallocated {
    type: sum
    sql: ${unallocated} ;;
    value_format_name: gbp
  }

  measure: sum_paymentperiods1_4 {
    label: "Sum of P1-P4 less Unallocated"
    type: sum_distinct
    sql_distinct_key: ${cust_key} ;;
    sql: ${curr}+${p1}+${p2}+${p3}+${p4}+${unallocated} ;;
##    sql: sum(distinct(${curr}))+sum(distinct(${p1}))+sum(distinct(${p2}))+sum(distinct(${p3}))+sum(distinct(${p4}))+sum(distinct(${unallocated})) ;;
    value_format_name: gbp
##    drill_fields: [P1_P4_details*]

  }

############################## DRILL SETS ##################################

  set: P2_Target_details {
    fields: [
      cust_key,
      vw_ageddebt3_30032021.view.name,
      vw_ageddebt_new_30032021.view.id_inkey_in_invno,
      vw_ageddebt_new_30032021.view.invoice_date,
      p1
    ]
  }



}
