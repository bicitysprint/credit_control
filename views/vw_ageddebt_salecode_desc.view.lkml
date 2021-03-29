view: vw_ageddebt_salecode_desc {
  sql_table_name: "CC"."VW_AGEDDEBT_SALECODE_DESC"
    ;;

  dimension: c_desc {
    type: string
    sql: ${TABLE}."C_DESC" ;;
  }

  dimension: cust_key {
    primary_key: yes
    type: string
    sql: ${TABLE}."CUST_KEY" ;;
    link: {
      label: "See Customer Debt Detail"
      url: "/dashboards-next/1015?Cust_Key={{ value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
  }

  dimension: d_desc {
    label: "Service Centre"
    type: string
    sql: ${TABLE}."D_DESC" ;;
  }

  dimension: e_desc {
    type: string
    sql: ${TABLE}."E_DESC" ;;
  }

  dimension: f_desc {
    label: "CCG"
    type: string
    sql: ${TABLE}."F_DESC" ;;
  }

  dimension: g_desc {
    label: "Account Manager"
    type: string
    sql: ${TABLE}."G_DESC" ;;
  }

  dimension: h_desc {
    label: "Credit Controller"
    type: string
    sql: ${TABLE}."H_DESC" ;;
    link: {
      label: "See Credit Controller Detail"
      url: "/dashboards-next/1011?Credit+Controller={{ value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
    drill_fields: [h_desc]
  }

  dimension: sales_code_c {
    type: string
    sql: ${TABLE}."SALES_CODE_C" ;;
  }

  dimension: sales_code_d {
    type: string
    sql: ${TABLE}."SALES_CODE_D" ;;
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
    label: "Credit Controller Code"
    type: string
    sql: ${TABLE}."SALES_CODE_H" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
