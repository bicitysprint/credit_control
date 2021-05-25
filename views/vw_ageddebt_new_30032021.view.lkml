view: vw_ageddebt_new_30032021 {
  view_label: "Aged Debt Report Details"
  sql_table_name: "CC"."VW_AGEDDEBT_NEW_30032021"
    ;;

  dimension: ageddays {
    type: number
    sql: ${TABLE}."AGEDDAYS" ;;
  }

  dimension: amt_to_unallocated {
    type: number
    sql: ${TABLE}."AMT_TO_UNALLOCATED" ;;
  }

  dimension: client_code {
    type: string
    sql: ${TABLE}."CLIENT_CODE" ;;
  }

  dimension: consol_code {
    type: string
    sql: ${TABLE}."CONSOL_CODE" ;;
  }

  dimension: current_flag {
    type: string
    sql: ${TABLE}."CURRENT_FLAG" ;;
  }

  dimension: cust_email {
    type: string
    sql: ${TABLE}."CUST_EMAIL" ;;
  }

  dimension: cust_status {
    type: string
    sql: ${TABLE}."CUST_STATUS" ;;
  }

  dimension: customer_key {
    primary_key: yes
    type: string
    sql: ${TABLE}."CUSTOMER_KEY" ;;
  }

  dimension: id_inkey_in_invno {
    type: string
    sql: ${TABLE}."ID_INKEY_IN_INVNO" ;;
  }

  dimension_group: invoice {
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
    sql: ${TABLE}."INVOICE_DATE" ;;
  }

  dimension: journal_amount {
    type: number
    sql: ${TABLE}."JOURNAL_AMOUNT" ;;
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

  dimension: outstanding_amount {
    type: number
    sql: ${TABLE}."OUTSTANDING_AMOUNT" ;;
  }

  dimension: period_number {
    type: number
    sql: ${TABLE}."PERIOD_NUMBER" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: terms {
    type: number
    sql: ${TABLE}."TERMS" ;;
  }

##  dimension: test_amount2 {
##    type: number
##    sql: ${TABLE}."TEST_AMOUNT2" ;;
##  }

  dimension: unallocated_amt {
    type: number
    sql: ${TABLE}."UNALLOCATED_AMT" ;;
  }

  dimension: year_number {
    type: number
    sql: ${TABLE}."YEAR_NUMBER" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
