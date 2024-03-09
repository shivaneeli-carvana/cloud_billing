view: cloud_pricing_export {
  sql_table_name: `billing.cloud_pricing_export` ;;

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
  dimension: account_currency_code {
    type: string
    description: "The currency that the billing account is configured to invoice in, using a 3-letter\ncurrency code defined in ISO 4217."
    sql: ${TABLE}.account_currency_code ;;
  }
  dimension: billing_account_id {
    type: string
    description: "The ID of the Cloud Billing Account that the pricing is associated with."
    sql: ${TABLE}.billing_account_id ;;
  }
  dimension: billing_account_price__aggregation_info__aggregation_interval {
    type: string
    description: "Aggregation interval for tiers."
    sql: ${TABLE}.billing_account_price.aggregation_info.aggregation_interval ;;
    group_label: "Billing Account Price Aggregation Info"
    group_item_label: "Aggregation Interval"
  }
  dimension: billing_account_price__aggregation_info__aggregation_level {
    type: string
    description: "Aggregation level for tiers."
    sql: ${TABLE}.billing_account_price.aggregation_info.aggregation_level ;;
    group_label: "Billing Account Price Aggregation Info"
    group_item_label: "Aggregation Level"
  }
  dimension: billing_account_price__price_info__discount_migrated_from {
    type: string
    description: "For discounts that were migrated from other SKUs, the source SKU of the discount."
    sql: ${TABLE}.billing_account_price.price_info.discount_migrated_from ;;
    group_label: "Billing Account Price Price Info"
    group_item_label: "Discount Migrated From"
  }
  dimension: billing_account_price__price_info__discount_percent {
    type: number
    description: "For pricing that is the result of a percent discount, this is the percent\ndiscount used."
    sql: ${TABLE}.billing_account_price.price_info.discount_percent ;;
    group_label: "Billing Account Price Price Info"
    group_item_label: "Discount Percent"
  }
  dimension_group: billing_account_price__price_info__discount_percent_fixed {
    type: time
    description: "For pricing that is anchored to a specific date, the date used."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.billing_account_price.price_info.discount_percent_fixed_date ;;
  }
  dimension: billing_account_price__price_info__price_reason {
    type: string
    description: "Background information on where the price originated from."
    sql: ${TABLE}.billing_account_price.price_info.price_reason ;;
    group_label: "Billing Account Price Price Info"
    group_item_label: "Price Reason"
  }
  dimension: billing_account_price__tiered_rates {
    hidden: yes
    sql: ${TABLE}.billing_account_price.tiered_rates ;;
    group_label: "Billing Account Price"
    group_item_label: "Tiered Rates"
  }
  dimension: business_entity_name {
    type: string
    description: "Business entity name of the service which offers the SKU."
    sql: ${TABLE}.business_entity_name ;;
  }
  dimension: currency_conversion_rate {
    type: number
    description: "The exchange rate from US dollars to the local currency. That is,\nprice/currency_conversion_rate is the price in US dollars."
    sql: ${TABLE}.currency_conversion_rate ;;
  }
  dimension_group: export {
    type: time
    description: "When the row was generated."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.export_time ;;
  }
  dimension: geo_taxonomy__regions {
    hidden: yes
    sql: ${TABLE}.geo_taxonomy.regions ;;
    group_label: "Geo Taxonomy"
    group_item_label: "Regions"
  }
  dimension: geo_taxonomy__type {
    type: string
    description: "The type of geographic metadata associated with the SKU."
    sql: ${TABLE}.geo_taxonomy.type ;;
    group_label: "Geo Taxonomy"
    group_item_label: "Type"
  }
  dimension: list_price__aggregation_info__aggregation_interval {
    type: string
    description: "Aggregation interval for tiers."
    sql: ${TABLE}.list_price.aggregation_info.aggregation_interval ;;
    group_label: "List Price Aggregation Info"
    group_item_label: "Aggregation Interval"
  }
  dimension: list_price__aggregation_info__aggregation_level {
    type: string
    description: "Aggregation level for tiers."
    sql: ${TABLE}.list_price.aggregation_info.aggregation_level ;;
    group_label: "List Price Aggregation Info"
    group_item_label: "Aggregation Level"
  }
  dimension: list_price__tiered_rates {
    hidden: yes
    sql: ${TABLE}.list_price.tiered_rates ;;
    group_label: "List Price"
    group_item_label: "Tiered Rates"
  }
  dimension_group: pricing_as_of {
    type: time
    description: "When the pricing was generated. The pricing was valid as of this date,\nbut could have been in effect before that."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.pricing_as_of_time ;;
  }
  dimension: pricing_unit {
    type: string
    description: "The unit in which resource usage is measured."
    sql: ${TABLE}.pricing_unit ;;
  }
  dimension: pricing_unit_description {
    type: string
    description: "Human readable description of the pricing unit."
    sql: ${TABLE}.pricing_unit_description ;;
  }
  dimension: product_taxonomy {
    hidden: yes
    sql: ${TABLE}.product_taxonomy ;;
  }
  dimension: service__description {
    type: string
    description: "The Google Cloud Platform service that offers the SKU."
    sql: ${TABLE}.service.description ;;
    group_label: "Service"
    group_item_label: "Description"
  }
  dimension: service__id {
    type: string
    description: "The ID of the Google Cloud Platform service that offers the SKU."
    sql: ${TABLE}.service.id ;;
    group_label: "Service"
    group_item_label: "ID"
  }
  dimension: sku__description {
    type: string
    description: "A description of the resource the price is associated with."
    sql: ${TABLE}.sku.description ;;
    group_label: "SKU"
    group_item_label: "Description"
  }
  dimension: sku__destination_migration_mappings {
    hidden: yes
    sql: ${TABLE}.sku.destination_migration_mappings ;;
    group_label: "SKU"
    group_item_label: "Destination Migration Mappings"
  }
  dimension: sku__id {
    type: string
    description: "The ID of the resource the price is associated with."
    sql: ${TABLE}.sku.id ;;
    group_label: "SKU"
    group_item_label: "ID"
  }
  measure: count {
    type: count
    drill_fields: [business_entity_name]
  }
}

view: cloud_pricing_export__product_taxonomy {

  dimension: cloud_pricing_export__product_taxonomy {
    type: string
    description: "List of product categories that apply to the SKU."
    sql: cloud_pricing_export__product_taxonomy ;;
  }
}

view: cloud_pricing_export__geo_taxonomy__regions {

  dimension: cloud_pricing_export__geo_taxonomy__regions {
    type: string
    description: "The GCP regions associated with the SKU."
    sql: cloud_pricing_export__geo_taxonomy__regions ;;
  }
}

view: cloud_pricing_export__list_price__tiered_rates {

  dimension: account_currency_amount {
    type: number
    description: "The converted price, for the SKU, in the currency the Cloud Billing Account is\nconfigured to use. The conversion rate will be the one that is or was effective\non the `pricing_as_of_time`."
    sql: ${TABLE}.account_currency_amount ;;
  }
  dimension: pricing_unit_quantity {
    type: number
    description: "Quantity of units the price refers to."
    sql: ${TABLE}.pricing_unit_quantity ;;
  }
  dimension: start_usage_amount {
    type: number
    description: "Lower bound amount for a given pricing tier, in pricing units."
    sql: ${TABLE}.start_usage_amount ;;
  }
  dimension: usd_amount {
    type: number
    description: "The price, in USD, for the SKU."
    sql: ${TABLE}.usd_amount ;;
  }
}

view: cloud_pricing_export__sku__destination_migration_mappings {

  dimension: cloud_pricing_export__sku__destination_migration_mappings {
    type: string
    description: "The destination SKU(s) names which this SKU is being migrated to."
    sql: cloud_pricing_export__sku__destination_migration_mappings ;;
  }
}

view: cloud_pricing_export__billing_account_price__tiered_rates {

  dimension: account_currency_amount {
    type: number
    description: "The converted price, for the SKU, in the currency the Cloud Billing Account is\nconfigured to use. The conversion rate will be the one that is or was effective\non the `pricing_as_of_time`."
    sql: ${TABLE}.account_currency_amount ;;
  }
  dimension: pricing_unit_quantity {
    type: number
    description: "Quantity of units the price refers to."
    sql: ${TABLE}.pricing_unit_quantity ;;
  }
  dimension: start_usage_amount {
    type: number
    description: "Lower bound amount for a given pricing tier, in pricing units."
    sql: ${TABLE}.start_usage_amount ;;
  }
  dimension: usd_amount {
    type: number
    description: "The price, in USD, for the SKU."
    sql: ${TABLE}.usd_amount ;;
  }
}
