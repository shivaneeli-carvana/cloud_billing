connection: "finops_prod"

# include all the views
include: "/views/**/*.view.lkml"
include: "/dashboards/gcp_billing.dashboard"

datagroup: billing_dev_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: billing_dev_default_datagroup
# gcp_billing_export_detailed


explore: ds_carvana_billing_export_enriched {
  sql_always_where: ${ds_carvana_billing_export_enriched.usage_start_date_pt_year} >= 2022 ;;
}

explore: alerting_gcp_anomaly_dashboard {
  label: "Anomaly Detection"
  sql_always_where: ${alerting_gcp_anomaly_dashboard.usage_start_year} >= 2022 ;;
}

explore: gcp_billing_export_detailed {

  # from: gcp_billing_export_resource_v1_015_c22_404796_5_ce9_d2
  join: carvana_billing_export_detailed__tags {
    view_label: "Tags"
    sql: LEFT JOIN UNNEST(${gcp_billing_export_detailed.tags}) as gcp_billing_export_resource_v1_015_c22_404796_5_ce9_d2__tags ;;
    relationship: one_to_many
  }
  join: carvana_billing_export_detailed__labels {
    view_label: "Labels"
    sql: LEFT JOIN UNNEST(${gcp_billing_export_detailed.labels}) as gcp_billing_export_resource_v1_015_c22_404796_5_ce9_d2__labels ;;
    relationship: one_to_many
  }
  join: carvana_billing_export_detailed__credits {
    view_label: "Credits"
    sql: LEFT JOIN UNNEST(${gcp_billing_export_detailed.credits}) as gcp_billing_export_resource_v1_015_c22_404796_5_ce9_d2__credits ;;
    relationship: one_to_many
  }
  join: carvana_billing_export_detailed__system_labels {
    view_label: "System Labels"
    sql: LEFT JOIN UNNEST(${gcp_billing_export_detailed.system_labels}) as gcp_billing_export_resource_v1_015_c22_404796_5_ce9_d2__system_labels ;;
    relationship: one_to_many
  }
  join: carvana_billing_export_detailed__project__labels {
    view_label: "Project Labels"
    sql: LEFT JOIN UNNEST(${gcp_billing_export_detailed.project__labels}) as gcp_billing_export_resource_v1_015_c22_404796_5_ce9_d2__project__labels ;;
    relationship: one_to_many
  }
  join: carvana_billing_export_detailed__project__ancestors {
    view_label: "Project Ancestors"
    sql: LEFT JOIN UNNEST(${gcp_billing_export_detailed.project__ancestors}) as gcp_billing_export_resource_v1_015_c22_404796_5_ce9_d2__project__ancestors ;;
    relationship: one_to_many
  }
}


# explore: gcp_billing_export_v1_015_c22_404796_5_ce9_d2 {
#   join: gcp_billing_export_v1_015_c22_404796_5_ce9_d2__tags {
#     view_label: "Gcp Billing Export V1 015 C22 404796 5 Ce9 D2: Tags"
#     sql: LEFT JOIN UNNEST(${gcp_billing_export_v1_015_c22_404796_5_ce9_d2.tags}) as gcp_billing_export_v1_015_c22_404796_5_ce9_d2__tags ;;
#     relationship: one_to_many
#   }
#   join: gcp_billing_export_v1_015_c22_404796_5_ce9_d2__labels {
#     view_label: "Gcp Billing Export V1 015 C22 404796 5 Ce9 D2: Labels"
#     sql: LEFT JOIN UNNEST(${gcp_billing_export_v1_015_c22_404796_5_ce9_d2.labels}) as gcp_billing_export_v1_015_c22_404796_5_ce9_d2__labels ;;
#     relationship: one_to_many
#   }
#   join: gcp_billing_export_v1_015_c22_404796_5_ce9_d2__credits {
#     view_label: "Gcp Billing Export V1 015 C22 404796 5 Ce9 D2: Credits"
#     sql: LEFT JOIN UNNEST(${gcp_billing_export_v1_015_c22_404796_5_ce9_d2.credits}) as gcp_billing_export_v1_015_c22_404796_5_ce9_d2__credits ;;
#     relationship: one_to_many
#   }
#   join: gcp_billing_export_v1_015_c22_404796_5_ce9_d2__system_labels {
#     view_label: "Gcp Billing Export V1 015 C22 404796 5 Ce9 D2: System Labels"
#     sql: LEFT JOIN UNNEST(${gcp_billing_export_v1_015_c22_404796_5_ce9_d2.system_labels}) as gcp_billing_export_v1_015_c22_404796_5_ce9_d2__system_labels ;;
#     relationship: one_to_many
#   }
#   join: gcp_billing_export_v1_015_c22_404796_5_ce9_d2__project__labels {
#     view_label: "Gcp Billing Export V1 015 C22 404796 5 Ce9 D2: Project Labels"
#     sql: LEFT JOIN UNNEST(${gcp_billing_export_v1_015_c22_404796_5_ce9_d2.project__labels}) as gcp_billing_export_v1_015_c22_404796_5_ce9_d2__project__labels ;;
#     relationship: one_to_many
#   }
#   join: gcp_billing_export_v1_015_c22_404796_5_ce9_d2__project__ancestors {
#     view_label: "Gcp Billing Export V1 015 C22 404796 5 Ce9 D2: Project Ancestors"
#     sql: LEFT JOIN UNNEST(${gcp_billing_export_v1_015_c22_404796_5_ce9_d2.project__ancestors}) as gcp_billing_export_v1_015_c22_404796_5_ce9_d2__project__ancestors ;;
#     relationship: one_to_many
#   }
# }

# explore: cloud_pricing_export {
#   join: cloud_pricing_export__product_taxonomy {
#     view_label: "Cloud Pricing Export: Product Taxonomy"
#     sql: LEFT JOIN UNNEST(${cloud_pricing_export.product_taxonomy}) as cloud_pricing_export__product_taxonomy ;;
#     relationship: one_to_many
#   }
#   join: cloud_pricing_export__geo_taxonomy__regions {
#     view_label: "Cloud Pricing Export: Geo Taxonomy Regions"
#     sql: LEFT JOIN UNNEST(${cloud_pricing_export.geo_taxonomy__regions}) as cloud_pricing_export__geo_taxonomy__regions ;;
#     relationship: one_to_many
#   }
#   join: cloud_pricing_export__list_price__tiered_rates {
#     view_label: "Cloud Pricing Export: List Price Tiered Rates"
#     sql: LEFT JOIN UNNEST(${cloud_pricing_export.list_price__tiered_rates}) as cloud_pricing_export__list_price__tiered_rates ;;
#     relationship: one_to_many
#   }
#   join: cloud_pricing_export__sku__destination_migration_mappings {
#     view_label: "Cloud Pricing Export: Sku Destination Migration Mappings"
#     sql: LEFT JOIN UNNEST(${cloud_pricing_export.sku__destination_migration_mappings}) as cloud_pricing_export__sku__destination_migration_mappings ;;
#     relationship: one_to_many
#   }
#   join: cloud_pricing_export__billing_account_price__tiered_rates {
#     view_label: "Cloud Pricing Export: Billing Account Price Tiered Rates"
#     sql: LEFT JOIN UNNEST(${cloud_pricing_export.billing_account_price__tiered_rates}) as cloud_pricing_export__billing_account_price__tiered_rates ;;
#     relationship: one_to_many
#   }
#}
