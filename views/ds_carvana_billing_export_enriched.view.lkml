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
  }
  dimension: promotion_amount {
    type: number
    sql: ${TABLE}.Promotion_amount ;;
  }
  dimension: service_descritpion {
    label: "Service Description"
    type: string
    sql: ${TABLE}.service_descritpion ;;
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
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.usage_start_date ;;
  }
  dimension_group: usage_start_date_pt {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.usage_start_date_PT ;;
  }


  parameter: Current_Month_Override {
    type: string
    default_value: "ENTER YYYYMM"
  }
  parameter: Day_of_Month_End {
    type: number

  }

  parameter: Day_of_Month_Start{
    type: number

  }


  dimension: validated_day_Month_end{
    type: number
    sql:
      CASE
      WHEN {%parameter Day_of_Month_End %} >0 AND {%parameter Day_of_Month_End %} < 32  then {%parameter Day_of_Month_End %}

      END
      ;;
  }

  dimension: validated_day_Month_start{
    type: number
    sql:
      CASE
      WHEN {%parameter Day_of_Month_Start %} >0 AND {%parameter Day_of_Month_Start %} < 32  then {%parameter Day_of_Month_Start %}

      END
      ;;
  }

  parameter: month_selector {
    type: date
    label: "Month to Filter On"
    description: "Use this field to select a month to filter on"
  }



  dimension: current_month{
    type: number
    sql:
    CASE
    WHEN  {%parameter Current_Month_Override %} = 'ENTER YYYYMM' AND CAST(${invoice_month} AS INTEGER)=EXTRACT(YEAR From current_date)*100+EXTRACT(MONTH FROM current_Date) THEN ${adjusted_cost}
    WHEN  {%parameter Current_Month_Override %} is NULL AND CAST(${invoice_month} AS INTEGER)=EXTRACT(YEAR From current_date)*100+EXTRACT(MONTH FROM current_Date) THEN ${adjusted_cost}
    WHEN  ${invoice_month} ={%parameter Current_Month_Override %} THEN ${adjusted_cost}
    ELSE 9999
      END
      ;;
  }

  measure: total_cost_by_cost_metric{
    type: sum
    sql:   ${TABLE}.{% parameter cost_metric %};;
  }






  measure: total_cost {
    type: sum
    sql: ${cost} ;;
  }

  measure: total_cost_at_list {
    type: sum
    sql: ${cost_at_list} ;;
  }

  measure: total_adjusted_cost {
    type: sum
    sql: ${adjusted_cost} ;;
  }

  measure: total_adjusted_cost_ex_promotions {
    type: sum
    sql: ${adjusted_cost_ex_promotions} ;;
  }



  measure: total_promotion_amount {
    type: sum
    sql: ${promotion_amount} ;;
  }

  measure: total_sud_amount {
    type: sum
    sql: ${sud_amount} ;;
  }

  measure: total_cud_amount {
    type: sum
    sql: ${cud_amount} ;;
  }

  measure: total_discount_amount {
    type: sum
    sql: ${discount_amount} ;;
  }




    measure: count {
    type: count
    drill_fields: [project_name]
  }
}
