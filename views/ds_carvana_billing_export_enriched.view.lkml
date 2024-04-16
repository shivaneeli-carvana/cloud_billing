view: ds_carvana_billing_export_enriched {
  sql_table_name: `crv-fpa-finops-prd-2750.gcp_billing.ds_Carvana_Billing_Export_Enriched` ;;


  parameter: cost_metric {
    type: unquoted
    allowed_value: {
      label: "Adjusted Cost"
      value: "adjusted_cost"
    }
    allowed_value: {
      label: "Adjusted Cost ex Promotions"
      value: "adjusted_cost_ex_promotions"
    }
      default_value: "adjusted_cost"

  }

  parameter: day_of_month_start {
    type: number
    # value_format_name: decimal_1
    default_value: "1"
  }

  parameter: day_of_month_end {
    type: number
    default_value: "31"
  }


 dimension: adjusted_cost {
    type: number
    sql: ${TABLE}.adjusted_cost ;;
  }
  dimension: adjusted_cost_ex_promotions {
    type: number
    sql: ${TABLE}.adjusted_cost_ex_promotions ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }
  dimension: cost_at_list {
    type: number
    sql: ${TABLE}.cost_at_list ;;
  }
  dimension: cost_type {
    type: string
    sql: ${TABLE}.cost_type ;;
  }
  dimension: cud_amount {
    type: number
    sql: ${TABLE}.CUD_Amount ;;
  }
  dimension: discount_amount {
    type: number
    sql: ${TABLE}.Discount_amount ;;
  }
  dimension: invoice_month {
    type: string
    sql: ${TABLE}.invoice_month ;;
  }
  dimension: location_location {
    type: string
    sql: ${TABLE}.location_location ;;
  }
  dimension: price_per_unit {
    type: number
    sql: ${TABLE}.price_per_unit ;;
  }
  dimension: project_name {
    type: string
    sql: ${TABLE}.project_name ;;
    drill_fields: [project_detail*]
  }

  dimension: marketplace_inclusion {
    type: string
    sql: CASE WHEN ${project_name} = '[Charges not specific to a project]' THEN 'Marketplace'
              ELSE 'All Other' END;;
  }

  dimension: promotion_amount {
    type: number
    sql: ${TABLE}.Promotion_amount ;;
  }
  dimension: service_description {
    label: "Service Description"
    type: string
    sql: ${TABLE}.service_descritpion ;;
    drill_fields: [project_detail*, -project_name]
  }
  dimension: service_id {
    label: "Service ID"
    type: string
    sql: ${TABLE}.service_id ;;
  }
  dimension: sku_description {
    label: "SKU Description"
    type: string
    sql: ${TABLE}.sku_description ;;
  }
  dimension: sku_id {
    type: string
    sql: ${TABLE}.sku_id ;;
  }
  dimension: sud_amount {
    type: number
    sql: ${TABLE}.SUD_Amount ;;
  }
  dimension: total_credits {
    type: number
    sql: ${TABLE}.total_credits ;;
  }
  dimension: usage_amount_in_pricing_units {
    type: number
    sql: ${TABLE}.usage_amount_in_pricing_units ;;
  }
  dimension_group: usage_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.usage_end_date ;;
  }
  dimension: usage_pricing_unit {
    type: string
    sql: ${TABLE}.usage_pricing_unit ;;
  }
  dimension_group: usage_start {
    type: time
    timeframes: [raw, date, day_of_month, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.usage_start_date ;;
  }
  dimension_group: usage_start_date_pt {
    type: time
    timeframes: [raw, date,day_of_month, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.usage_start_date_PT ;;
  }


  parameter: Current_Month_Override {
    type: string
    default_value: "202403"
    suggest_dimension: invoice_month
  }
  # parameter: Day_of_Month_End {
  #   type: number

  # }

  # parameter: Day_of_Month_Start{
  #   type: number

  # }


  dimension: validated_day_Month_end{
    type: number
    sql:
      CASE
      WHEN {%parameter day_of_month_end %} >0 AND {%parameter day_of_month_end %} < 32  then {%parameter day_of_month_end %}
      END
      ;;
  }

  dimension: validated_day_Month_start{
    type: number
    sql:
      CASE
      WHEN {%parameter day_of_month_start %} >0 AND {%parameter day_of_month_start %} < 32  then {%parameter day_of_month_start %}

      END
      ;;
  }

  parameter: month_selector {
    type: date
    label: "Month to Filter On"
    description: "Use this field to select a month to filter on"
  }



  dimension: current_month_cost {
    type: number
    sql:
    CASE
    WHEN  {%parameter Current_Month_Override %} = 'ENTER YYYYMM' AND CAST(${invoice_month} AS INTEGER)=EXTRACT(YEAR From current_date)*100+EXTRACT(MONTH FROM current_Date) THEN ${TABLE}.{% parameter cost_metric %}
    WHEN  {%parameter Current_Month_Override %} is NULL AND CAST(${invoice_month} AS INTEGER)=EXTRACT(YEAR From current_date)*100+EXTRACT(MONTH FROM current_Date) THEN ${TABLE}.{% parameter cost_metric %}
    WHEN  ${invoice_month} ={%parameter Current_Month_Override %} THEN ${TABLE}.{% parameter cost_metric %}
    ELSE 0 END ;;
  }
  measure: total_current_month_cost {
    type: sum
    sql: CASE WHEN ${usage_start_date_pt_day_of_month} between ${validated_day_Month_start} and ${validated_day_Month_end} THEN
    ${current_month_cost} END;;
    value_format_name: usd_0
    drill_fields: [detail*]
  }

  dimension: last_month_cost {
    type: number
    sql:
    CASE
    WHEN  {%parameter Current_Month_Override %} = 'ENTER YYYYMM' AND CAST(${invoice_month} AS INTEGER)=Extract(YEAR from DATE_ADD(current_Date, INTERVAL -extract(day from current_date) day))*100+
Extract(MONTH from DATE_ADD(current_Date, INTERVAL -extract(day from current_date) day)) THEN ${TABLE}.{% parameter cost_metric %}
    WHEN  {%parameter Current_Month_Override %} is NULL AND CAST(${invoice_month} AS INTEGER)=Extract(YEAR from DATE_ADD(current_Date, INTERVAL -extract(day from current_date) day))*100+
Extract(MONTH from DATE_ADD(current_Date, INTERVAL -extract(day from current_date) day)) THEN ${TABLE}.{% parameter cost_metric %}
    WHEN  ${invoice_month} = CAST (EXTRACT(YEAR FROM DATE_ADD(PARSE_DATE('%Y%m%d', CAST(CAST({%parameter Current_Month_Override %} as INT)*100+01 AS STRING)), INTERVAL -1 DAY))*100 +
EXTRACT(MONTH FROM DATE_ADD(PARSE_DATE('%Y%m%d', CAST(CAST({%parameter Current_Month_Override %} as INT)*100+01 AS STRING)), INTERVAL -1 DAY)) AS STRING)
     THEN ${TABLE}.{% parameter cost_metric %}
    ELSE 0 END ;;
  }
  measure: total_last_month_cost {
    type: sum
    sql: CASE WHEN ${usage_start_date_pt_day_of_month} between ${validated_day_Month_start} and ${validated_day_Month_end} THEN
    ${last_month_cost} END;;
    value_format_name: usd_0
    drill_fields: [detail*]
  }

  dimension: two_months_ago_cost {
    type: number
    sql:
    CASE
    WHEN  {%parameter Current_Month_Override %} = 'ENTER YYYYMM' AND CAST(${invoice_month} AS INTEGER)=Extract(YEAR from DATE_ADD(current_Date, INTERVAL -2 MONTH))*100+Extract(MONTH from DATE_ADD(current_Date, INTERVAL -2 MONTH)) THEN ${TABLE}.{% parameter cost_metric %}
    WHEN  {%parameter Current_Month_Override %} is NULL AND CAST(${invoice_month} AS INTEGER)=Extract(YEAR from DATE_ADD(current_Date, INTERVAL -2 MONTH))*100+Extract(MONTH from DATE_ADD(current_Date, INTERVAL -2 MONTH)) THEN ${TABLE}.{% parameter cost_metric %}
    WHEN  ${invoice_month} = CAST (EXTRACT(YEAR FROM DATE_ADD(PARSE_DATE('%Y%m%d', CAST(CAST({%parameter Current_Month_Override %} as INT)*100+01 AS STRING)), INTERVAL -2 MONTH))*100 +
EXTRACT(MONTH FROM DATE_ADD(PARSE_DATE('%Y%m%d', CAST(CAST({%parameter Current_Month_Override %} as INT)*100+01 AS STRING)), INTERVAL -2 MONTH)) AS STRING)
     THEN ${TABLE}.{% parameter cost_metric %}
    ELSE 0 END ;;
  }
  measure: total_two_months_ago_cost {
    type: sum
    sql: CASE WHEN ${usage_start_date_pt_day_of_month} between ${validated_day_Month_start} and ${validated_day_Month_end} THEN
        ${two_months_ago_cost}  END;;
    value_format_name: usd_0
    drill_fields: [detail*]
  }

  measure: variance_to_last_month {
    type: number
    sql: ${total_current_month_cost} - ${total_last_month_cost} ;;
    value_format_name: usd_0
  }

  measure: variance_percentage_to_last_month {
    type: number
    sql: IEEE_DIVIDE(${total_current_month_cost},${total_last_month_cost}) -1 ;;
    value_format_name: percent_1
  }



  measure: total_cost_by_cost_metric{
    type: sum
    sql:   ${TABLE}.{% parameter cost_metric %};;
    value_format_name: usd_0
  }


  measure: total_cost {
    type: sum
    sql: ${cost} ;;
    value_format_name: usd_0
  }

  measure: total_cost_at_list {
    type: sum
    sql: ${cost_at_list} ;;
    value_format_name: usd_0
  }

  measure: total_adjusted_cost {
    type: sum
    sql: ${adjusted_cost} ;;
    value_format_name: usd_0
  }

  measure: total_adjusted_cost_ex_promotions {
    type: sum
    sql: ${adjusted_cost_ex_promotions} ;;
    value_format_name: usd_0
  }



  measure: total_promotion_amount {
    type: sum
    sql: ${promotion_amount} ;;
    value_format_name: usd_0
  }

  measure: total_sud_amount {
    type: sum
    sql: ${sud_amount} ;;
    value_format_name: usd_0
  }

  measure: total_cud_amount {
    type: sum
    sql: ${cud_amount} ;;
    value_format_name: usd_0
  }

  measure: total_discount_amount {
    type: sum
    sql: ${discount_amount} ;;
    value_format_name: usd_0
  }

  measure: total_usage_amount_in_pricing_units{
    type: sum
    sql:   ${usage_amount_in_pricing_units};;
    value_format_name: usd_0
  }



    measure: count {
    type: count
    drill_fields: [project_name]
  }

  set: project_detail {
    fields: [project_name, service_description, sku_description]
  }

  set: detail {
    fields: [invoice_month, project_detail*, service_id, sku_id, cost_metric,  total_current_month_cost, total_last_month_cost, total_two_months_ago_cost ]
  }
}
