view: alerting_gcp_anomaly_dashboard {
  sql_table_name: `crv-fpa-finops-prd-2750.gcp_billing.alerting_gcp_anomaly_dashboard` ;;

  dimension: adjusted_cost {
    type: number
    sql: ${TABLE}.adjusted_cost ;;
  }
  dimension: avg_cost {
    type: number
    sql: ${TABLE}.avg_cost ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }
  dimension: op_ex_network_name {
    type: string
    sql: ${TABLE}.OpEx_network_name ;;
  }
  dimension: opex_network_code {
    type: string
    sql: ${TABLE}.Opex_network_code ;;
  }
  dimension: project_name {
    type: string
    sql: ${TABLE}.project_name ;;
  }
  dimension: service_description {
    type: string
    sql: ${TABLE}.Service_Description ;;
  }
  dimension: sku_description {
    type: string
    sql: ${TABLE}.sku_description ;;
  }
  dimension: stddev_cost {
    type: number
    sql: ${TABLE}.stddev_cost ;;
  }
  dimension_group: usage_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.usage_start_time ;;
  }
  dimension: vendor {
    type: string
    sql: ${TABLE}.Vendor ;;
  }
  dimension: zscore {
    type: number
    sql: ${TABLE}.zscore ;;
  }
  measure: count {
    type: count
    drill_fields: [project_name, op_ex_network_name]
  }
}
