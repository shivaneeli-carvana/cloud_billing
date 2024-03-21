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
    drill_fields: [project_detail*]
  }
  dimension: service_description {
    type: string
    sql: ${TABLE}.Service_Description ;;
    drill_fields: [project_detail*, -project_name]
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

  parameter: stddev_sensitivity {
    type: number
   # value_format_name: decimal_1
  }

  parameter: anomaly_daily_threshold {
    type: number
  }

#CASE WHEN Is_Daily_Anomaly = "Y" AND (stddev_cost * (zscore-STDEV Sensitivity))> Anomaly Daily Threshold THEN stddev_cost * (zscore-STDEV Sensitivity) ELSE 0 END


  dimension: is_anomaly {
    type: yesno
    sql: CASE WHEN ${anomaly_amount} >= {% parameter anomaly_daily_threshold %} THEN "Y" ELSE "N" END ;;
  }

  dimension: is_daily_anomaly{
    type: string
    sql: CASE WHEN ${zscore} >= {% parameter stddev_sensitivity %} AND LOWER(${service_description}) != "support" AND
    LOWER(${service_description}) != "invoice" THEN "Y" ELSE "N" END ;;
  }

  dimension: anomaly_amount {
    type: number
    sql: CASE WHEN ${is_daily_anomaly} = "Y" AND (${stddev_cost} * (${zscore}-{% parameter stddev_sensitivity %} ))> {% parameter anomaly_daily_threshold %}
    THEN ${stddev_cost} * (${zscore}-{% parameter stddev_sensitivity %})
    ELSE 0 END ;;
  }

  dimension: normal_spend{
    type: number
    sql:  ${adjusted_cost} - ${anomaly_amount} ;;
    value_format_name: usd_0
  }


  measure: total_cost {
    type: sum
    sql: ${cost} ;;
    value_format_name: usd_0
  }
  measure: total_adjusted_cost {
    type: sum
    sql: ${adjusted_cost} ;;
    value_format_name: usd_0
  }

  measure: total_anomaly_amount {
    type: sum
    sql: ${anomaly_amount} ;;
    value_format_name: usd_0
  }

  measure: total_normal_spend {
    type: sum
    sql: ${normal_spend} ;;
    value_format_name: usd_0
  }


  measure: count {
    type: count
    drill_fields: [project_name, op_ex_network_name]
  }

  set: project_detail {
    fields: [project_name, service_description, sku_description]
  }
}
