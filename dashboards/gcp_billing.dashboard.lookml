- dashboard: gcp_catapult_v2
  title: GCP Catapult V2
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: SS0TeVhfNUgeMrKW6kDySk
  elements:
  - title: GCP Catapult
    name: GCP Catapult
    model: cloud_billing
    explore: gcp_billing_export_detailed
    type: looker_line
    fields: [gcp_billing_export_detailed.export_date, gcp_billing_export_detailed.project__name,
      gcp_billing_export_detailed.project__number, gcp_billing_export_detailed.cost,
      gcp_billing_export_detailed.usage__amount_in_pricing_units, gcp_billing_export_detailed.count]
    filters: {}
    sorts: [gcp_billing_export_detailed.export_date desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Phoenix
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    listen:
      Cost Metric: gcp_billing_export_detailed.cost_metric
      Current Month Override: gcp_billing_export_detailed.Current_Month_Override
      Day of Month Start: gcp_billing_export_detailed.Day_of_Month_Start
      Day of Month End: gcp_billing_export_detailed.Day_of_Month_End
      Project Name: gcp_billing_export_detailed.project__name
      Service Description: gcp_billing_export_detailed.service__description
      SKU Description: gcp_billing_export_detailed.sku__description
      Month to Filter On: gcp_billing_export_detailed.month_selector
    row: 0
    col: 0
    width: 11
    height: 6
  - title: Page-3-graph
    name: Page-3-graph
    model: cloud_billing
    explore: gcp_billing_export_detailed
    type: looker_line
    fields: [gcp_billing_export_detailed.sku__description, gcp_billing_export_detailed.invoice_month_usage_amount_in_pricing_units]
    filters:
      gcp_billing_export_detailed.project__id: ''
    sorts: [gcp_billing_export_detailed.sku__description]
    limit: 500
    column_limit: 50
    query_timezone: America/Phoenix
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Current Month Override: gcp_billing_export_detailed.Current_Month_Override
      Day of Month Start: gcp_billing_export_detailed.Day_of_Month_Start
      Cost Metric: gcp_billing_export_detailed.cost_metric
      Day of Month End: gcp_billing_export_detailed.Day_of_Month_End
      Project Name: gcp_billing_export_detailed.project__name
      Service Description: gcp_billing_export_detailed.service__description
      SKU Description: gcp_billing_export_detailed.sku__description
      Month to Filter On: gcp_billing_export_detailed.month_selector
    row: 6
    col: 0
    width: 11
    height: 6
  - title: Page-3-table
    name: Page-3-table
    model: cloud_billing
    explore: gcp_billing_export_detailed
    type: looker_grid
    fields: [gcp_billing_export_detailed.invoice_month_usage_amount_in_pricing_units,
      gcp_billing_export_detailed.sku__description, gcp_billing_export_detailed.invoice__month]
    sorts: [gcp_billing_export_detailed.invoice_month_usage_amount_in_pricing_units
        desc 0]
    limit: 500
    column_limit: 50
    query_timezone: America/Phoenix
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Current Month Override: gcp_billing_export_detailed.Current_Month_Override
      Day of Month Start: gcp_billing_export_detailed.Day_of_Month_Start
      Cost Metric: gcp_billing_export_detailed.cost_metric
      Day of Month End: gcp_billing_export_detailed.Day_of_Month_End
      Project Name: gcp_billing_export_detailed.project__name
      Service Description: gcp_billing_export_detailed.service__description
      SKU Description: gcp_billing_export_detailed.sku__description
      Month to Filter On: gcp_billing_export_detailed.month_selector
    row: 6
    col: 11
    width: 13
    height: 6
  - title: GCP Catapult
    name: GCP Catapult (2)
    model: cloud_billing
    explore: gcp_billing_export_detailed
    type: looker_grid
    fields: [gcp_billing_export_detailed.current_month]
    filters: {}
    sorts: [gcp_billing_export_detailed.current_month]
    limit: 500
    column_limit: 50
    query_timezone: America/Phoenix
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Current Month Override: gcp_billing_export_detailed.Current_Month_Override
      Day of Month Start: gcp_billing_export_detailed.Day_of_Month_Start
      Cost Metric: gcp_billing_export_detailed.cost_metric
      Day of Month End: gcp_billing_export_detailed.Day_of_Month_End
      Project Name: gcp_billing_export_detailed.project__name
      Service Description: gcp_billing_export_detailed.service__description
      SKU Description: gcp_billing_export_detailed.sku__description
      Month to Filter On: gcp_billing_export_detailed.month_selector
    row: 0
    col: 11
    width: 13
    height: 6
  filters:
  - name: Cost Metric
    title: Cost Metric
    type: field_filter
    default_value: adjusted^_cost
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: cloud_billing
    explore: gcp_billing_export_detailed
    listens_to_filters: []
    field: gcp_billing_export_detailed.cost_metric
  - name: Current Month Override
    title: Current Month Override
    type: field_filter
    default_value: ENTER YYYYMM
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cloud_billing
    explore: gcp_billing_export_detailed
    listens_to_filters: []
    field: gcp_billing_export_detailed.Current_Month_Override
  - name: Day of Month End
    title: Day of Month End
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: cloud_billing
    explore: gcp_billing_export_detailed
    listens_to_filters: []
    field: gcp_billing_export_detailed.Day_of_Month_End
  - name: Project Name
    title: Project Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cloud_billing
    explore: gcp_billing_export_detailed
    listens_to_filters: []
    field: gcp_billing_export_detailed.project__name
  - name: Day of Month Start
    title: Day of Month Start
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: cloud_billing
    explore: gcp_billing_export_detailed
    listens_to_filters: []
    field: gcp_billing_export_detailed.Day_of_Month_Start
  - name: Service Description
    title: Service Description
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cloud_billing
    explore: gcp_billing_export_detailed
    listens_to_filters: []
    field: gcp_billing_export_detailed.service__description
  - name: SKU Description
    title: SKU Description
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cloud_billing
    explore: gcp_billing_export_detailed
    listens_to_filters: []
    field: gcp_billing_export_detailed.sku__description
  - name: Month to Filter On
    title: Month to Filter On
    type: field_filter
    default_value: 2024/02/29
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cloud_billing
    explore: gcp_billing_export_detailed
    listens_to_filters: []
    field: gcp_billing_export_detailed.month_selector
