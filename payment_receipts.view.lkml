view: payment_receipts {
  sql_table_name: CC.PAYMENT_RECEIPTS ;;

  dimension: adj_period_1 {
    type: number
    sql: ${TABLE}."ADJ_PERIOD_1" ;;
  }

  dimension: adj_period_2 {
    type: number
    sql: ${TABLE}."ADJ_PERIOD_2" ;;
  }

  dimension: adj_period_3 {
    type: number
    sql: ${TABLE}."ADJ_PERIOD_3" ;;
  }

  dimension: adj_period_4 {
    type: number
    sql: ${TABLE}."ADJ_PERIOD_4" ;;
  }

  dimension: adj_period_curr {
    type: number
    sql: ${TABLE}."ADJ_PERIOD_CURR" ;;
  }

  dimension: amt_1 {
    type: number
    sql: ${TABLE}."AMT_1" ;;
  }

  dimension: applied_to_stmt {
    type: string
    sql: ${TABLE}."APPLIED_TO_STMT" ;;
  }

  dimension: archive {
    type: string
    sql: ${TABLE}."ARCHIVE" ;;
  }

  dimension_group: archive {
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
    sql: ${TABLE}."ARCHIVE_DATE" ;;
  }

  dimension: bank_account_no {
    type: string
    sql: ${TABLE}."BANK_ACCOUNT_NO" ;;
  }

  dimension: bank_name {
    type: string
    sql: ${TABLE}."BANK_NAME" ;;
  }

  dimension: branch_name {
    type: string
    sql: ${TABLE}."BRANCH_NAME" ;;
  }

  dimension: cod_flag {
    type: string
    sql: ${TABLE}."COD_FLAG" ;;
  }

  dimension_group: creation {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CREATION_DATE" ;;
  }

  dimension_group: creation2 {
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
    sql: ${TABLE}."CREATION_TIME" ;;
  }

  dimension: crect_key {
    type: string
    sql: ${TABLE}."CRECT_KEY" ;;
  }

  dimension: customer_key {
    type: string
    sql: ${TABLE}."CUSTOMER_KEY" ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}."CUSTOMER_NAME" ;;
  }

  dimension_group: date_1 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE_1" ;;
  }

  dimension: flag_1 {
    type: string
    sql: ${TABLE}."FLAG_1" ;;
  }

  dimension: flag_2 {
    type: string
    sql: ${TABLE}."FLAG_2" ;;
  }

  dimension: internal_ref {
    type: string
    sql: ${TABLE}."INTERNAL_REF" ;;
  }

  dimension: invoice_created {
    type: string
    sql: ${TABLE}."INVOICE_CREATED" ;;
  }

  dimension: invoice_number {
    type: string
    sql: ${TABLE}."INVOICE_NUMBER" ;;
  }

  dimension: num_1 {
    type: number
    sql: ${TABLE}."NUM_1" ;;
  }

  dimension: operator {
    type: string
    sql: ${TABLE}."OPERATOR" ;;
  }

  dimension: outstanding_amt {
    type: number
    sql: ${TABLE}."OUTSTANDING_AMT" ;;
  }

  dimension: payment_method {
    type: string
    sql: ${TABLE}."PAYMENT_METHOD" ;;
  }

  dimension: payment_mode {
    type: string
    sql: ${TABLE}."PAYMENT_MODE" ;;
  }

  dimension_group: period {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."PERIOD_DATE" ;;
  }

  dimension: posted_period {
    type: number
    sql: ${TABLE}."POSTED_PERIOD" ;;
  }

  dimension: posted_year {
    type: number
    sql: ${TABLE}."POSTED_YEAR" ;;
  }

  dimension: rec_period {
    type: number
    sql: ${TABLE}."REC_PERIOD" ;;
  }

  dimension: rec_year {
    type: number
    sql: ${TABLE}."REC_YEAR" ;;
  }

  dimension: receipt_amount {
    type: number
    sql: ${TABLE}."RECEIPT_AMOUNT" ;;
  }

  dimension_group: receipt {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."RECEIPT_DATE" ;;
  }

  dimension: reconciled_flag {
    type: string
    sql: ${TABLE}."RECONCILED_FLAG" ;;
  }

  dimension: reference_no {
    type: string
    sql: ${TABLE}."REFERENCE_NO" ;;
  }

  dimension: settlement_disc {
    type: number
    sql: ${TABLE}."SETTLEMENT_DISC" ;;
  }

  dimension_group: time_1 {
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
    sql: ${TABLE}."TIME_1" ;;
  }

  dimension: transaction_code {
    type: string
    sql: ${TABLE}."TRANSACTION_CODE" ;;
  }

  measure: count {
    type: count
    drill_fields: [bank_name, branch_name, customer_name]
  }

  measure: count_1 {
    label: "Count of Receipts"
    type: count_distinct
    sql: ${TABLE}.RECEIPT_AMOUNT ;;
  }

  measure: sum {
    label: "Sum of Receipts"
    type: sum
    sql: ${TABLE}.RECEIPT_AMOUNT ;;
    value_format_name: gbp
    drill_fields: [customer_key, payment_method, receipt_date, receipt_amount]
  }

}
