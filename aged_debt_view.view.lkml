view: aged_debt_view {
  sql_table_name: CC.AGED_DEBT_VIEW ;;

  dimension: bank_account_no {
    type: string
    sql: ${TABLE}."BANK_ACCOUNT_NO" ;;
  }

  dimension: bank_name {
    type: string
    sql: ${TABLE}."BANK_NAME" ;;
  }

  dimension: c_desc {
    type: string
    sql: ${TABLE}."C_DESC" ;;
  }

  dimension: cust_key {
    type: string
    sql: ${TABLE}."CUST_KEY" ;;
  }

  dimension: customer_tier {
    type: string
    sql: ${TABLE}."CUSTOMER_TIER" ;;
  }

  dimension: g_desc {
    type: string
    sql: ${TABLE}."G_DESC" ;;
  }

  dimension: controller_name {
    label: "    Controller Name"
    type: string
    drill_fields: [aged_debt_view.h_desc]
    link: {
      label: "See Aged Debt Records for {{value}}"
      url: "/dashboards/229?Controller%20Name={{value}}"
      icon_url: "https://looker.com/favicon.ico"
    }
    sql: ${TABLE}."H_DESC" ;;
  }

    ##link: {
    ##  label: "See Aged Debt Detail for {{value}}"
    ##  url: "/dashboards/233?Full%20Name={{value}}"
    ##  icon_url: "https://looker.com/favicon.ico"
    ##}
    ##link: {
    ##  label: "See Aged Debt Records for {{value}}"
    ##  url: "/dashboards/229?Full%20Name={{value}}"
    ##  icon_url: "https://looker.com/favicon.ico"
    ##}
    ##sql: ${TABLE}."H_DESC" ;;
  ##}

  dimension: invoice_contact_email {
    type: string
    sql: ${TABLE}."INVOICE_CONTACT_EMAIL" ;;
  }

  dimension: invoice_method {
    type: string
    sql: ${TABLE}."INVOICE_METHOD" ;;
  }

  dimension: latest_receipt_amounts {
    type: number
    sql: ${TABLE}."LATEST_RECEIPT_AMOUNTS" ;;
  }

  dimension_group: latest_receipt {
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
    sql: ${TABLE}."LATEST_RECEIPT_DATE" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: period_amt_1 {
    type: number
    sql: ${TABLE}."PERIOD_AMT_1" ;;
  }

  dimension: period_amt_2 {
    type: number
    sql: ${TABLE}."PERIOD_AMT_2" ;;
  }

  dimension: period_amt_3 {
    type: number
    sql: ${TABLE}."PERIOD_AMT_3" ;;
  }

  dimension: period_amt_4 {
    type: number
    sql: ${TABLE}."PERIOD_AMT_4" ;;
  }

  dimension: period_amt_curr {
    type: number
    sql: ${TABLE}."PERIOD_AMT_CURR" ;;
  }

  dimension: pickup_contact {
    type: string
    sql: ${TABLE}."PICKUP_CONTACT" ;;
  }

  dimension: sales_code_f {
    type: string
    sql: ${TABLE}."SALES_CODE_F" ;;
  }

  dimension: sales_code_g {
    type: string
    sql: ${TABLE}."SALES_CODE_G" ;;
  }

  dimension: sales_code_h {
    type: string
    sql: ${TABLE}."SALES_CODE_H" ;;
  }

  dimension: unallocated_amt {
    type: number
    sql: ${TABLE}."UNALLOCATED_AMT" ;;
  }

  measure: count {
    type: count
    drill_fields: [bank_name, name]
  }

  measure: sum  {
    type: sum
    sql: ${period_amt_curr}+${period_amt_1}+${period_amt_2}+${period_amt_3}+${period_amt_4}+${unallocated_amt} ;;
  }

}
