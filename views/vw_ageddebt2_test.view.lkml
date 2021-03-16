view: vw_ageddebt2_test {
  sql_table_name: "CC"."VW_AGEDDEBT2_TEST"
    ;;

  dimension: brought_fwd_amt {
    type: number
    sql: ${TABLE}."BROUGHT_FWD_AMT" ;;
  }

  dimension: client_code {
    type: string
    sql: ${TABLE}."CLIENT_CODE" ;;
  }

  dimension: cnotekey {
    type: number
    sql: ${TABLE}."CNOTEKEY" ;;
  }

  dimension: consol_code {
    type: string
    sql: ${TABLE}."CONSOL_CODE" ;;
  }

  dimension: cred_aged_day_status {
    type: string
    sql: ${TABLE}."CRED_AGED_DAY_STATUS" ;;
  }

  dimension: cred_ageddays {
    type: number
    sql: ${TABLE}."CRED_AGEDDAYS" ;;
  }

  dimension: credit_amount {
    type: number
    sql: ${TABLE}."CREDIT_AMOUNT" ;;
  }

  dimension: current_ {
    type: number
    sql: ${TABLE}."CURRENT_" ;;
  }

  dimension: cust_email {
    type: string
    sql: ${TABLE}."CUST_EMAIL" ;;
  }

  dimension: customer_key {
    type: string
    sql: ${TABLE}."CUSTOMER_KEY" ;;
  }

  dimension: final_unallocated_amt {
    type: number
    sql: ${TABLE}."FINAL_UNALLOCATED_AMT" ;;
  }

  dimension: id_inkey_in_cukey {
    type: string
    sql: ${TABLE}."ID_INKEY_IN_CUKEY" ;;
  }

  dimension: invoice_no {
    type: string
    sql: ${TABLE}."INVOICE_NO" ;;
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

  dimension: posted_period {
    type: number
    sql: ${TABLE}."POSTED_PERIOD" ;;
  }

  dimension: posted_year {
    type: number
    sql: ${TABLE}."POSTED_YEAR" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: terms {
    type: number
    sql: ${TABLE}."TERMS" ;;
  }

  dimension: true_aged_days {
    type: number
    sql: ${TABLE}."TRUE_AGED_DAYS" ;;
  }

  dimension: unallocated_amt {
    type: number
    sql: ${TABLE}."UNALLOCATED_AMT" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
