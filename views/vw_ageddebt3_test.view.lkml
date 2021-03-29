view: vw_ageddebt3_test {
  view_label: "New Aged Debt Report"
  sql_table_name: "CC"."VW_AGEDDEBT3_TEST"
    ;;

##  dimension: amt_to_unallocated {
##    type: number
##    sql: ${TABLE}."AMT_TO_UNALLOCATED" ;;
##    value_format_name: gbp
##  }

  dimension: brought_fwd_amt {
    type: number
    sql: ${TABLE}."BROUGHT_FWD_AMT" ;;
    value_format_name: gbp
  }

  dimension: client_code {
    type: string
    sql: ${TABLE}."CLIENT_CODE" ;;
  }

  dimension: consol_code {
    type: string
    sql: ${TABLE}."CONSOL_CODE" ;;
  }

  dimension: current_ {
    label: "Current/In Terms"
    type: number
    sql: ${TABLE}."CURRENT_" ;;
    value_format_name: gbp
  }

  dimension: current_flag {
    type: string
    sql: ${TABLE}."CURRENT_FLAG" ;;
  }

  dimension: cust_email {
    type: string
    sql: ${TABLE}."CUST_EMAIL" ;;
  }

  dimension: final_unallocated {
    label: "Unallocated Amount"
    type: number
    sql: ${TABLE}."FINAL_UNALLOCATED" ;;
    value_format_name: gbp
  }

  dimension: id_inkey_in_cukey {
    primary_key: yes
    label: "Customer_Key"
    type: string
    sql: ${TABLE}."ID_INKEY_IN_CUKEY" ;;
  }

  dimension: last_recpt_amt {
    type: number
    sql: ${TABLE}."LAST_RECPT_AMT" ;;
    value_format_name: gbp
  }

  dimension_group: last_recpt {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."LAST_RECPT_DATE" ;;
  }

  dimension: name {
    label: "Account_Name"
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: oldest_debt_in_days {
    description: "Oldest outstanding debt in days. Negative days indicate that oldest debt is still within terms. This would include unallocated amounts."
    type: number
    sql: ${TABLE}."OLDEST_DEBT_IN_DAYS" ;;
    value_format_name: decimal_0
  }

  dimension: outstanding_amount {
    type: number
    sql: ${TABLE}."OUTSTANDING_AMOUNT" ;;
    value_format_name: gbp
  }

  dimension: outstanding_credit {
    type: number
    sql: ${TABLE}."OUTSTANDING_CREDIT" ;;
    value_format_name: gbp
  }

  dimension: period1 {
    label: "P1 1-30 Days"
    type: number
    sql: ${TABLE}."PERIOD1" ;;
    value_format_name: gbp
  }

  dimension: period2 {
    label: "P2 31-60 Days"
    type: number
    sql: ${TABLE}."PERIOD2" ;;
    value_format_name: gbp
  }

  dimension: period3 {
    label: "P3 61-90 Days"
    type: number
    sql: ${TABLE}."PERIOD3" ;;
    value_format_name: gbp
  }

  dimension: period4 {
    label: "P4 Over 90 Days"
    type: number
    sql: ${TABLE}."PERIOD4" ;;
    value_format_name: gbp
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: terms {
    type: number
    sql: ${TABLE}."TERMS" ;;
    value_format_name: decimal_0
  }

################ MEASURES ########################

  measure: count {
    type: count
    drill_fields: [name]
  }




}
