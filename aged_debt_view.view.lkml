view: aged_debt_view {
  sql_table_name: CC.AGED_DEBT_VIEW ;;

  dimension: account_sc {
    type: string
    sql: ${TABLE}."ACCOUNT_SC" ;;
  }

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

  dimension: credit_card_flag {
    label: "Credit Card Flag (Y/N)"
    type: string
    sql: case
         when ${TABLE}."CREDIT_CARD_FLAG" = 'F' then 'Y'
         else ${TABLE}."CREDIT_CARD_FLAG"
         END ;;
   }

  dimension: cust_key {
    primary_key: yes
    type: string
    sql: ${TABLE}."CUST_KEY" ;;
  }

  dimension: customer_tier {
    type: string
    sql: ${TABLE}."CUSTOMER_TIER" ;;
  }

  dimension: e_desc {
    type: string
    sql: ${TABLE}."E_DESC" ;;
  }

  dimension: g_desc {
    type: string
    sql: case
    when ${TABLE}."G_DESC" is null then 'NONE ASSIGNED'
    else ${TABLE}."G_DESC"
    END ;;
  }

  dimension: h_desc {
    label: "Credit Controller Name"
    type: string
    sql: case
    when ${TABLE}."H_DESC" = 'CUSTOMER DD ACCOUNTS' or "H_DESC" = 'CUSTOMER DD ACCS' then 'CUSTOMER DD ACCOUNTS'
    when ${TABLE}."H_DESC" = 'GAIL HAMEED' or "H_DESC" = 'GAIL HAMEED.' then 'GAIL HAMEED'
    when ${TABLE}."H_DESC" = 'GLYN COBB' or "H_DESC" = 'GLYN COBB.' then 'GLYN COBB'
    else ${TABLE}."H_DESC"
    END ;;
    drill_fields: [aged_debt_view.h_desc]
    link: {
      label: "See Aged Debt Records for {{value}}"
      url: "/dashboards/229?Controller%20Name={{value}}"
      icon_url: "https://looker.com/favicon.ico"
    }
    }

  dimension: invoice_contact_email {
    type: string
    sql: ${TABLE}."INVOICE_CONTACT_EMAIL" ;;
  }

  dimension: invoice_method {
    type: string
    sql: ${TABLE}."INVOICE_METHOD" ;;
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

  dimension: date_formatted {
    sql:  ${latest_receipt_date} ;;
    html: {{rendered_value | date: "%d/%m/%Y" }} ;;
  }


  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: office_code {
    type: string
    sql: ${TABLE}."OFFICE_CODE" ;;
  }

  dimension: period_amt_1 {
    type: number
    value_format_name: gbp
    sql: ${TABLE}."PERIOD_AMT_1" ;;
  }

  dimension: period_amt_2 {
    type: number
    value_format_name: gbp
    sql: ${TABLE}."PERIOD_AMT_2" ;;
  }

  dimension: period_amt_3 {
    type: number
    value_format_name: gbp
    sql: ${TABLE}."PERIOD_AMT_3" ;;
  }

  dimension: period_amt_4 {
    type: number
    value_format_name: gbp
    sql: ${TABLE}."PERIOD_AMT_4" ;;
  }

  dimension: period_amt_curr {
    type: number
    value_format_name: gbp
    sql: ${TABLE}."PERIOD_AMT_CURR" ;;
  }

  dimension: pickup_contact {
    type: string
    sql: ${TABLE}."PICKUP_CONTACT" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
  }

  dimension: sales_code_e {
    type: string
    sql: ${TABLE}."SALES_CODE_E" ;;
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

  dimension: split {
    type: string
    sql: ${TABLE}."SPLIT" ;;
  }

  dimension_group: start_date {
    label: "Account Start Date"
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
    sql: ${TABLE}."START_DATE" ;;
  }

  dimension: account_date_formatted {
    sql:  ${start_date_date} ;;
    html: {{rendered_value | date: "%d/%m/%Y" }} ;;
  }


  dimension: total_latest_receipt_amount {
    type: number
    value_format_name: gbp
    sql: ${TABLE}."TOTAL_LATEST_RECEIPT_AMOUNT" ;;
  }

  dimension: unallocated_amt {
    type: number
    value_format_name: gbp
    sql: ${TABLE}."UNALLOCATED_AMT" ;;
  }

  measure: count {
    type: count
    drill_fields: [bank_name, name]
  }

    measure: sum_p1 {
    type: sum
    sql: ${period_amt_1} ;;
  }

  measure: sum_p2 {
    type: sum
    sql: ${period_amt_2} ;;
  }

  measure: sum_p3 {
    type: sum
    sql: ${period_amt_3} ;;
  }

  measure: sum_p4 {
    type: sum
    sql: ${period_amt_4} ;;
  }

  measure: sum_un {
    type: sum
    sql: ${unallocated_amt} ;;
  }

  measure: sum_curr {
    type: sum
    sql: ${period_amt_curr} ;;
  }

  measure: sum {
    type: sum
    value_format_name: gbp
    sql: ${period_amt_curr}+${period_amt_1}+${period_amt_2}+${period_amt_3}+${period_amt_4}+${unallocated_amt} ;;
  }
}
