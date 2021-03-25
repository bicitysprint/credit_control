view: vw_ageddebt3_test {
  view_label: "New Aged Debt Report"
  sql_table_name: "CC"."VW_AGEDDEBT3_TEST"
    ;;

  dimension: amt_to_unallocated {
    type: number
    sql: ${TABLE}."AMT_TO_UNALLOCATED" ;;
  }

  dimension: brought_fwd_amt {
    type: number
    sql: ${TABLE}."BROUGHT_FWD_AMT" ;;
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
    type: number
    sql: ${TABLE}."CURRENT_" ;;
  }

  dimension: current_flag {
    type: string
    sql: ${TABLE}."CURRENT_FLAG" ;;
  }

  dimension: cust_email {
    type: string
    sql: ${TABLE}."CUST_EMAIL" ;;
  }

  dimension: final_unallocated_amt {
    type: number
    sql: ${TABLE}."FINAL_UNALLOCATED_AMT" ;;
  }

  dimension: id_inkey_in_cukey {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID_INKEY_IN_CUKEY" ;;
  }

  dimension: last_recpt_amt {
    type: number
    sql: ${TABLE}."LAST_RECPT_AMT" ;;
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
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: oldest_debt_in_days {
    type: number
    sql: ${TABLE}."OLDEST_DEBT_IN_DAYS" ;;
  }

  dimension: outstanding_amount {
    type: number
    sql: ${TABLE}."OUTSTANDING_AMOUNT" ;;
  }

  dimension: outstanding_credit {
    type: number
    sql: ${TABLE}."OUTSTANDING_CREDIT" ;;
  }

  dimension: period1 {
    type: number
    sql: ${TABLE}."PERIOD1" ;;
  }

  dimension: period2 {
    type: number
    sql: ${TABLE}."PERIOD2" ;;
  }

  dimension: period3 {
    type: number
    sql: ${TABLE}."PERIOD3" ;;
  }

  dimension: period4 {
    type: number
    sql: ${TABLE}."PERIOD4" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: terms {
    type: string
    sql: ${TABLE}."TERMS" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
