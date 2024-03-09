view: gcp_billing_export_detailed{
  sql_table_name: `gcp_billing.carvana_billing_export_detailed` ;;

  dimension: key {
    type: string
    sql: CONCAT(${_partitiontime_raw}, ${project__id}, ${billing_account_id}, ${sku__id}) ;;
    primary_key: yes
  }

  dimension_group: _partitiondate {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONDATE ;;
  }
  dimension_group: _partitiontime {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONTIME ;;
  }
  dimension: adjustment_info__description {
    type: string
    sql: ${TABLE}.adjustment_info.description ;;
    group_label: "Adjustment Info"
    group_item_label: "Description"
  }
  dimension: adjustment_info__id {
    type: string
    sql: ${TABLE}.adjustment_info.id ;;
    group_label: "Adjustment Info"
    group_item_label: "ID"
  }
  dimension: adjustment_info__mode {
    type: string
    sql: ${TABLE}.adjustment_info.mode ;;
    group_label: "Adjustment Info"
    group_item_label: "Mode"
  }
  dimension: adjustment_info__type {
    type: string
    sql: ${TABLE}.adjustment_info.type ;;
    group_label: "Adjustment Info"
    group_item_label: "Type"
  }
  dimension: billing_account_id {
    type: string
    sql: ${TABLE}.billing_account_id ;;
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
  dimension: credits {
    hidden: yes
    sql: ${TABLE}.credits ;;
  }
  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }
  dimension: currency_conversion_rate {
    type: number
    sql: ${TABLE}.currency_conversion_rate ;;
  }
  dimension_group: export {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.export_time ;;
  }
  dimension: invoice__month {
    type: string
    sql: ${TABLE}.invoice.month ;;
    group_label: "Invoice"
    group_item_label: "Month"
  }
  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }
  dimension: location__country {
    type: string
    sql: ${TABLE}.location.country ;;
    group_label: "Location"
    group_item_label: "Country"
  }
  dimension: location__location {
    type: string
    sql: ${TABLE}.location.location ;;
    group_label: "Location"
    group_item_label: "Location"
  }
  dimension: location__region {
    type: string
    sql: ${TABLE}.location.region ;;
    group_label: "Location"
    group_item_label: "Region"
  }
  dimension: location__zone {
    type: string
    sql: ${TABLE}.location.zone ;;
    group_label: "Location"
    group_item_label: "Zone"
  }
  dimension: price__effective_price {
    type: number
    sql: ${TABLE}.price.effective_price ;;
    group_label: "Price"
    group_item_label: "Effective Price"
  }
  dimension: price__pricing_unit_quantity {
    type: number
    sql: ${TABLE}.price.pricing_unit_quantity ;;
    group_label: "Price"
    group_item_label: "Pricing Unit Quantity"
  }
  dimension: price__tier_start_amount {
    type: number
    sql: ${TABLE}.price.tier_start_amount ;;
    group_label: "Price"
    group_item_label: "Tier Start Amount"
  }
  dimension: price__unit {
    type: string
    sql: ${TABLE}.price.unit ;;
    group_label: "Price"
    group_item_label: "Unit"
  }
  dimension: project__ancestors {
    hidden: yes
    sql: ${TABLE}.project.ancestors ;;
    group_label: "Project"
    group_item_label: "Ancestors"
  }
  dimension: project__ancestry_numbers {
    type: string
    sql: ${TABLE}.project.ancestry_numbers ;;
    group_label: "Project"
    group_item_label: "Ancestry Numbers"
  }
  dimension: project__id {
    type: string
    sql: ${TABLE}.project.id ;;
    group_label: "Project"
    group_item_label: "ID"
  }
  dimension: project__labels {
    hidden: yes
    sql: ${TABLE}.project.labels ;;
    group_label: "Project"
    group_item_label: "Labels"
  }
  dimension: project__name {
    type: string
    sql: ${TABLE}.project.name ;;
    group_label: "Project"
    group_item_label: "Name"
  }
  dimension: project__number {
    type: string
    sql: ${TABLE}.project.number ;;
    group_label: "Project"
    group_item_label: "Number"
  }
  dimension: resource__global_name {
    type: string
    sql: ${TABLE}.resource.global_name ;;
    group_label: "Resource"
    group_item_label: "Global Name"
  }
  dimension: resource__name {
    type: string
    sql: ${TABLE}.resource.name ;;
    group_label: "Resource"
    group_item_label: "Name"
  }
  dimension: seller_name {
    type: string
    sql: ${TABLE}.seller_name ;;
  }
  dimension: service__description {
    type: string
    sql: ${TABLE}.service.description ;;
    group_label: "Service"
    group_item_label: "Description"
  }
  dimension: service__id {
    type: string
    sql: ${TABLE}.service.id ;;
    group_label: "Service"
    group_item_label: "ID"
  }
  dimension: sku__description {
    type: string
    sql: ${TABLE}.sku.description ;;
    group_label: "SKU"
    group_item_label: "Description"
  }
  dimension: sku__id {
    type: string
    sql: ${TABLE}.sku.id ;;
    group_label: "SKU"
    group_item_label: "ID"
  }
  dimension: subscription__instance_id {
    type: string
    sql: ${TABLE}.subscription.instance_id ;;
    group_label: "Subscription"
    group_item_label: "Instance ID"
  }
  dimension: system_labels {
    hidden: yes
    sql: ${TABLE}.system_labels ;;
  }
  dimension: tags {
    hidden: yes
    sql: ${TABLE}.tags ;;
  }
  dimension: transaction_type {
    type: string
    sql: ${TABLE}.transaction_type ;;
  }
  dimension: usage__amount {
    type: number
    sql: ${TABLE}.usage.amount ;;
    group_label: "Usage"
    group_item_label: "Amount"
  }
  dimension: usage__amount_in_pricing_units {
    type: number
    sql: ${TABLE}.usage.amount_in_pricing_units ;;
    group_label: "Usage"
    group_item_label: "Amount In Pricing Units"
  }
  dimension: usage__pricing_unit {
    type: string
    sql: ${TABLE}.usage.pricing_unit ;;
    group_label: "Usage"
    group_item_label: "Pricing Unit"
  }
  dimension: usage__unit {
    type: string
    sql: ${TABLE}.usage.unit ;;
    group_label: "Usage"
    group_item_label: "Unit"
  }
  dimension_group: usage_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.usage_end_time ;;
  }
  dimension_group: usage_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.usage_start_time ;;
  }
  measure: count {
    type: count
    drill_fields: [seller_name, project__name, resource__name, resource__global_name]
  }

# #########################################>>>>>>>>>>>> Page -1 <<<<<<<<<<<<<<<<<<#####################
  parameter: cost_metric {
    type: string
    allowed_value: {
      label: "Adjusted Cost"
      value: "adjusted_cost"
    }
    allowed_value: {
      label: "Adjusted Cost Ex Promotions"
      value: "adjusted_cost_ex_promotions"
    }
    default_value: "adjusted_cost"
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
    WHEN {%parameter cost_metric %} = "adjusted_cost" AND {%parameter Current_Month_Override %} = 'ENTER YYYYMM' AND CAST(${invoice__month} AS INTEGER)=EXTRACT(YEAR From current_date)*100+EXTRACT(MONTH FROM current_Date) THEN ${cost}
    WHEN {%parameter cost_metric %} = "adjusted_cost" AND {%parameter Current_Month_Override %} is NULL AND CAST(${invoice__month} AS INTEGER)=EXTRACT(YEAR From current_date)*100+EXTRACT(MONTH FROM current_Date) THEN ${cost}
    WHEN {%parameter cost_metric %} = "adjusted_cost" AND ${invoice__month} ={%parameter Current_Month_Override %} THEN ${cost}

      WHEN {%parameter cost_metric %} = "adjusted_cost_ex_promotions" AND {%parameter Current_Month_Override %} = 'ENTER YYYYMM' AND CAST(${invoice__month} AS INTEGER)=EXTRACT(YEAR From current_date)*100+EXTRACT(MONTH FROM current_Date) THEN ${cost}
      WHEN {%parameter cost_metric %} = "adjusted_cost_ex_promotions" AND {%parameter Current_Month_Override %} is NULL AND CAST(${invoice__month} AS INTEGER)=EXTRACT(YEAR From current_date)*100+EXTRACT(MONTH FROM current_Date) THEN ${cost}
      WHEN {%parameter cost_metric %} = "adjusted_cost_ex_promotions" AND ${invoice__month} ={%parameter Current_Month_Override %} THEN ${cost}
      ELSE 9999
      END
      ;;
  }
# #########################################>>>>>>>>>>>> Page -2 <<<<<<<<<<<<<<<<<<#####################
  # Source unidentified: The data source for this page has not been identified.


# #########################################>>>>>>>>>>>> Page -3 <<<<<<<<<<<<<<<<<<#####################

  measure: invoice_month_usage_amount_in_pricing_units{
    type: sum
    sql: ${usage__amount_in_pricing_units} ;;
  }
# #########################################>>>>>>>>>>>> Page -End <<<<<<<<<<<<<<<<<<#####################
}


view: carvana_billing_export_detailed__tags {

  dimension: gcp_billing_export_resource_v1_015_c22_404796_5_ce9_d2__tags {
    type: string
    hidden: yes
    sql: gcp_billing_export_resource_v1_015_c22_404796_5_ce9_d2__tags ;;
  }
  dimension: inherited {
    type: yesno
    sql: inherited ;;
  }
  dimension: key {
    type: string
    sql: key ;;
  }
  dimension: namespace {
    type: string
    sql: namespace ;;
  }
  dimension: value {
    type: string
    sql: value ;;
  }
}

view: carvana_billing_export_detailed__labels {

  dimension: gcp_billing_export_resource_v1_015_c22_404796_5_ce9_d2__labels {
    type: string
    hidden: yes
    sql: gcp_billing_export_resource_v1_015_c22_404796_5_ce9_d2__labels ;;
  }
  dimension: key {
    type: string
    sql: key ;;
  }
  dimension: value {
    type: string
    sql: value ;;
  }
}

view: carvana_billing_export_detailed__credits {
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: id ;;
  }
  dimension: amount {
    type: number
    sql: amount ;;
  }
  dimension: full_name {
    type: string
    sql: full_name ;;
  }
  dimension: gcp_billing_export_resource_v1_015_c22_404796_5_ce9_d2__credits {
    type: string
    hidden: yes
    sql: gcp_billing_export_resource_v1_015_c22_404796_5_ce9_d2__credits ;;
  }
  dimension: name {
    type: string
    sql: name ;;
  }
  dimension: type {
    type: string
    sql: type ;;
  }
}

view: carvana_billing_export_detailed__system_labels {

  dimension: gcp_billing_export_resource_v1_015_c22_404796_5_ce9_d2__system_labels {
    type: string
    hidden: yes
    sql: gcp_billing_export_resource_v1_015_c22_404796_5_ce9_d2__system_labels ;;
  }
  dimension: key {
    type: string
    sql: key ;;
  }
  dimension: value {
    type: string
    sql: value ;;
  }
}

view: carvana_billing_export_detailed__project__labels {

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }
  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: carvana_billing_export_detailed__project__ancestors {

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }
  dimension: resource_name {
    type: string
    sql: ${TABLE}.resource_name ;;
  }
}
