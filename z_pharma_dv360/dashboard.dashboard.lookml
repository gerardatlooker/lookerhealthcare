- dashboard: 1__overall_view
  title: 1 - Overall View
  layout: newspaper
  elements:
  - title: Impressions
    name: Impressions
    model: dv360
    explore: performance_temp
    type: single_value
    fields: [performance_temp.total_impressions, performance_temp.ctr]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: CTR
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
    defaults_version: 1
    series_types: {}
    listen:
      Date: performance_temp.date_date
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 0
    col: 0
    width: 3
    height: 5
  - title: Media Spend
    name: Media Spend
    model: dv360
    explore: performance_temp
    type: single_value
    fields: [performance_temp.total_media_cost, performance_temp.cpm]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: CPM
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
    defaults_version: 1
    series_types: {}
    listen:
      Date: performance_temp.date_date
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 0
    col: 3
    width: 3
    height: 5
  - title: Total Clicks
    name: Total Clicks
    model: dv360
    explore: performance_temp
    type: single_value
    fields: [performance_temp.total_clicks, performance_temp.cpc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: CPC
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
    defaults_version: 1
    series_types: {}
    listen:
      Date: performance_temp.date_date
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 0
    col: 6
    width: 3
    height: 5
  - title: Volume over Time
    name: Volume over Time
    model: dv360
    explore: performance_temp
    type: looker_column
    fields: [blended_results.audience_list_type, performance_temp.date_month, performance_temp.total_impressions]
    pivots: [blended_results.audience_list_type]
    fill_fields: [performance_temp.date_month]
    sorts: [blended_results.audience_list_type, performance_temp.date_month desc]
    limit: 500
    column_limit: 50
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
    stacking: normal
    limit_displayed_rows: false
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
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Date: performance_temp.date_date
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 5
    col: 0
    width: 9
    height: 12
  - title: Advertiser Deep Dive
    name: Advertiser Deep Dive
    model: dv360
    explore: performance_temp
    type: looker_grid
    fields: [performance_temp.total_media_cost, performance_temp.total_impressions,
      performance_temp.ctr, performance_temp.cpm, performance_temp.cpc, performance_temp.advertiser]
    sorts: [performance_temp.total_media_cost desc]
    limit: 500
    column_limit: 50
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen:
      Date: performance_temp.date_date
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 0
    col: 16
    width: 8
    height: 10
  - title: Media Spend by Audience Type by List Category
    name: Media Spend by Audience Type by List Category
    model: dv360
    explore: performance_temp
    type: looker_donut_multiples
    fields: [performance_temp.audience_list_category, performance_temp.total_media_cost,
      blended_results.audience_list_type]
    pivots: [performance_temp.audience_list_category]
    sorts: [performance_temp.audience_list_category 0, blended_results.audience_list_type]
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: 12
    charts_across: 2
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
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Date: performance_temp.date_date
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 0
    col: 9
    width: 7
    height: 10
  - title: Trend over Time
    name: Trend over Time
    model: dv360
    explore: performance_temp
    type: looker_line
    fields: [performance_temp.ctr, performance_temp.cpm, performance_temp.cpc, performance_temp.date_month]
    fill_fields: [performance_temp.date_month]
    sorts: [performance_temp.date_month desc]
    limit: 500
    column_limit: 50
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
    y_axes: [{label: '', orientation: left, series: [{axisId: performance_temp.ctr,
            id: performance_temp.ctr, name: CTR}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: left, series: [{axisId: performance_temp.cpm,
            id: performance_temp.cpm, name: CPM}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: performance_temp.cpc,
            id: performance_temp.cpc, name: CPC}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    font_size: '12'
    series_types: {}
    charts_across: 2
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Date: performance_temp.date_date
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 10
    col: 9
    width: 15
    height: 7
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 365 days
    allow_multiple_values: true
    required: false
    model: dv360
    explore: performance_temp
    listens_to_filters: []
    field: performance_temp.date_date
  - name: Audience Category
    title: Audience Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: dv360
    explore: performance_temp
    listens_to_filters: []
    field: performance_temp.audience_list_category
  - name: Audience List Type
    title: Audience List Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: dv360
    explore: performance_temp
    listens_to_filters: []
    field: blended_results.audience_list_type

- dashboard: 2__advertiser_deep_dive
  title: 2 - Advertiser Deep Dive
  layout: newspaper
  elements:
  - title: CPC over Time
    name: CPC over Time
    model: dv360
    explore: performance_temp
    type: looker_line
    fields: [performance_temp.cpc, blended_results.audience_list_type, performance_temp.date_month]
    pivots: [blended_results.audience_list_type]
    fill_fields: [performance_temp.date_month]
    sorts: [blended_results.audience_list_type, performance_temp.date_month desc]
    limit: 500
    column_limit: 50
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
    defaults_version: 1
    listen:
      Date: performance_temp.date_date
      Advertiser: performance_temp.advertiser
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 0
    col: 9
    width: 7
    height: 6
  - title: CPM over Time
    name: CPM over Time
    model: dv360
    explore: performance_temp
    type: looker_line
    fields: [blended_results.audience_list_type, performance_temp.date_month, performance_temp.cpm]
    pivots: [blended_results.audience_list_type]
    fill_fields: [performance_temp.date_month]
    sorts: [blended_results.audience_list_type, performance_temp.date_month desc]
    limit: 500
    column_limit: 50
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
    defaults_version: 1
    listen:
      Date: performance_temp.date_date
      Advertiser: performance_temp.advertiser
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 12
    col: 9
    width: 7
    height: 6
  - title: CTR over Time
    name: CTR over Time
    model: dv360
    explore: performance_temp
    type: looker_line
    fields: [blended_results.audience_list_type, performance_temp.date_month, performance_temp.ctr]
    pivots: [blended_results.audience_list_type]
    fill_fields: [performance_temp.date_month]
    sorts: [blended_results.audience_list_type, performance_temp.date_month desc]
    limit: 500
    column_limit: 50
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
    defaults_version: 1
    listen:
      Date: performance_temp.date_date
      Advertiser: performance_temp.advertiser
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 6
    col: 9
    width: 7
    height: 6
  - title: Impressions over Time
    name: Impressions over Time
    model: dv360
    explore: performance_temp
    type: looker_column
    fields: [blended_results.audience_list_type, performance_temp.date_month, performance_temp.total_impressions]
    pivots: [blended_results.audience_list_type]
    fill_fields: [performance_temp.date_month]
    sorts: [blended_results.audience_list_type, performance_temp.date_month desc]
    limit: 500
    column_limit: 50
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
    stacking: normal
    limit_displayed_rows: false
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
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Date: performance_temp.date_date
      Advertiser: performance_temp.advertiser
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 5
    col: 0
    width: 9
    height: 13
  - title: Impressions
    name: Impressions
    model: dv360
    explore: performance_temp
    type: single_value
    fields: [performance_temp.total_impressions, performance_temp.ctr]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: CTR
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
    defaults_version: 1
    series_types: {}
    listen:
      Date: performance_temp.date_date
      Advertiser: performance_temp.advertiser
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 0
    col: 0
    width: 3
    height: 5
  - title: Media Spend
    name: Media Spend
    model: dv360
    explore: performance_temp
    type: single_value
    fields: [performance_temp.total_media_cost, performance_temp.cpm]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: CPM
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
    defaults_version: 1
    series_types: {}
    listen:
      Date: performance_temp.date_date
      Advertiser: performance_temp.advertiser
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 0
    col: 3
    width: 3
    height: 5
  - title: Clicks
    name: Clicks
    model: dv360
    explore: performance_temp
    type: single_value
    fields: [performance_temp.total_clicks, performance_temp.cpc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: CPC
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
    defaults_version: 1
    series_types: {}
    listen:
      Date: performance_temp.date_date
      Advertiser: performance_temp.advertiser
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 0
    col: 6
    width: 3
    height: 5
  - title: Audience List Detail
    name: Audience List Detail
    model: dv360
    explore: performance_temp
    type: looker_grid
    fields: [performance_temp.audience_list, performance_temp.total_media_cost, performance_temp.total_impressions,
      performance_temp.ctr, performance_temp.cpm, performance_temp.cpc]
    sorts: [performance_temp.total_media_cost desc]
    limit: 500
    column_limit: 50
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen:
      Date: performance_temp.date_date
      Advertiser: performance_temp.advertiser
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 0
    col: 16
    width: 8
    height: 18
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 365 days
    allow_multiple_values: true
    required: false
    model: dv360
    explore: performance_temp
    listens_to_filters: []
    field: performance_temp.date_date
  - name: Advertiser
    title: Advertiser
    type: field_filter
    default_value: Aveeno - [Hybrid]
    allow_multiple_values: true
    required: false
    model: dv360
    explore: performance_temp
    listens_to_filters: []
    field: performance_temp.advertiser
  - name: Audience Category
    title: Audience Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: dv360
    explore: performance_temp
    listens_to_filters: []
    field: performance_temp.audience_list_category
  - name: Audience List Type
    title: Audience List Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: dv360
    explore: performance_temp
    listens_to_filters: []
    field: blended_results.audience_list_type

- dashboard: 3__advertisement_deep_dive
  title: 3 - Advertisement Deep Dive
  layout: newspaper
  elements:
  - title: Impressions
    name: Impressions
    model: dv360
    explore: performance_temp
    type: single_value
    fields: [performance_temp.total_impressions, performance_temp.ctr]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: CTR
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
    defaults_version: 1
    series_types: {}
    listen:
      Date: performance_temp.date_date
      Advertiser List: performance_temp.audience_list
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 0
    col: 0
    width: 3
    height: 5
  - title: Media Cost
    name: Media Cost
    model: dv360
    explore: performance_temp
    type: single_value
    fields: [performance_temp.total_media_cost, performance_temp.cpm]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: CPM
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
    defaults_version: 1
    series_types: {}
    listen:
      Date: performance_temp.date_date
      Advertiser List: performance_temp.audience_list
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 0
    col: 3
    width: 3
    height: 5
  - title: Clicks
    name: Clicks
    model: dv360
    explore: performance_temp
    type: single_value
    fields: [performance_temp.total_clicks, performance_temp.cpc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: CPC
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
    defaults_version: 1
    series_types: {}
    listen:
      Date: performance_temp.date_date
      Advertiser List: performance_temp.audience_list
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 0
    col: 6
    width: 3
    height: 5
  - title: Impressions over Time
    name: Impressions over Time
    model: dv360
    explore: performance_temp
    type: looker_column
    fields: [blended_results.audience_list_type, performance_temp.date_month, performance_temp.total_impressions]
    pivots: [blended_results.audience_list_type]
    fill_fields: [performance_temp.date_month]
    sorts: [blended_results.audience_list_type, performance_temp.date_month desc]
    limit: 500
    column_limit: 50
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
    stacking: normal
    limit_displayed_rows: false
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
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Date: performance_temp.date_date
      Advertiser List: performance_temp.audience_list
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 5
    col: 0
    width: 9
    height: 13
  - title: CPC over Time
    name: CPC over Time
    model: dv360
    explore: performance_temp
    type: looker_line
    fields: [performance_temp.cpc, blended_results.audience_list_type, performance_temp.date_month]
    pivots: [blended_results.audience_list_type]
    fill_fields: [performance_temp.date_month]
    sorts: [blended_results.audience_list_type, performance_temp.date_month desc]
    limit: 500
    column_limit: 50
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
    defaults_version: 1
    listen:
      Date: performance_temp.date_date
      Advertiser List: performance_temp.audience_list
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 0
    col: 9
    width: 8
    height: 6
  - title: CTR over Time
    name: CTR over Time
    model: dv360
    explore: performance_temp
    type: looker_line
    fields: [blended_results.audience_list_type, performance_temp.date_month, performance_temp.ctr]
    pivots: [blended_results.audience_list_type]
    fill_fields: [performance_temp.date_month]
    sorts: [blended_results.audience_list_type, performance_temp.date_month desc]
    limit: 500
    column_limit: 50
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
    defaults_version: 1
    listen:
      Date: performance_temp.date_date
      Advertiser List: performance_temp.audience_list
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 6
    col: 9
    width: 8
    height: 6
  - title: CPM over Time
    name: CPM over Time
    model: dv360
    explore: performance_temp
    type: looker_line
    fields: [blended_results.audience_list_type, performance_temp.date_month, performance_temp.cpm]
    pivots: [blended_results.audience_list_type]
    fill_fields: [performance_temp.date_month]
    sorts: [blended_results.audience_list_type, performance_temp.date_month desc]
    limit: 500
    column_limit: 50
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
    defaults_version: 1
    listen:
      Date: performance_temp.date_date
      Advertiser List: performance_temp.audience_list
      Audience Category: performance_temp.audience_list_category
      Audience List Type: blended_results.audience_list_type
    row: 12
    col: 9
    width: 8
    height: 6
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 365 days
    allow_multiple_values: true
    required: false
    model: dv360
    explore: performance_temp
    listens_to_filters: []
    field: performance_temp.date_date
  - name: Advertiser List
    title: Advertiser List
    type: field_filter
    default_value: '"eXelate » NCS+AVO-057+3P_Aveeno_Positively Radiant_2020_TA-Current
      and Lapsed_555535_CP_RET_GM_BE-AB_CE-N/A_T-R104W"'
    allow_multiple_values: true
    required: false
    model: dv360
    explore: performance_temp
    listens_to_filters: []
    field: performance_temp.audience_list
  - name: Audience Category
    title: Audience Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: dv360
    explore: performance_temp
    listens_to_filters: []
    field: performance_temp.audience_list_category
  - name: Audience List Type
    title: Audience List Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: dv360
    explore: performance_temp
    listens_to_filters: []
    field: blended_results.audience_list_type

- dashboard: historical_audience_performance
  title: Historical Audience Performance
  layout: newspaper
  elements:
  - title: Media Spend by Audience Type
    name: Media Spend by Audience Type
    model: dv360
    explore: performance_temp
    type: looker_donut_multiples
    fields: [blended_results.audience_list_type, performance_temp.total_media_cost]
    pivots: [blended_results.audience_list_type]
    sorts: [blended_results.audience_list_type]
    limit: 500
    query_timezone: America/Los_Angeles
    show_value_labels: false
    font_size: 12
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
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    value_labels: legend
    label_type: labPer
    listen:
      Date: performance_temp.date_date
      Advertiser: performance_temp.advertiser
      List Category: performance_temp.audience_list_category
      List Type: blended_results.audience_list_type
      List Name: performance_temp.insertion_order
    row: 0
    col: 0
    width: 6
    height: 10
  - title: Performance by Type
    name: Performance by Type
    model: dv360
    explore: performance_temp
    type: looker_grid
    fields: [blended_results.audience_list_type, performance_temp.total_impressions,
      performance_temp.total_clicks, performance_temp.total_media_cost, performance_temp.cpm,
      performance_temp.cpc, performance_temp.ctr]
    sorts: [blended_results.audience_list_type]
    limit: 500
    query_timezone: America/Los_Angeles
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      performance_temp.total_impressions: Impressions
      performance_temp.total_clicks: Clicks
      performance_temp.total_media_cost: Media Spend
    series_cell_visualizations:
      performance_temp.total_impressions:
        is_active: false
      performance_temp.cpm:
        is_active: true
      performance_temp.cpc:
        is_active: true
      performance_temp.ctr:
        is_active: true
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
    series_types: {}
    value_labels: legend
    label_type: labPer
    font_size: 12
    listen:
      Date: performance_temp.date_date
      Advertiser: performance_temp.advertiser
      List Category: performance_temp.audience_list_category
      List Type: blended_results.audience_list_type
      List Name: performance_temp.insertion_order
    row: 0
    col: 6
    width: 10
    height: 4
  - title: CPM by Audience Type
    name: CPM by Audience Type
    model: dv360
    explore: performance_temp
    type: looker_column
    fields: [blended_results.audience_list_type, performance_temp.cpm]
    sorts: [blended_results.audience_list_type]
    limit: 500
    query_timezone: America/Los_Angeles
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: performance_temp.cpm,
            id: performance_temp.cpm, name: CPM}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: performance_temp.cpc,
            id: performance_temp.cpc, name: CPC}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: performance_temp.ctr,
            id: performance_temp.ctr, name: CTR}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    font_size: '12'
    series_types: {}
    series_colors:
      performance_temp.cpm: "#34A853"
    series_labels:
      performance_temp.total_impressions: Impressions
      performance_temp.total_clicks: Clicks
      performance_temp.total_media_cost: Media Spend
    label_color: [black]
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      performance_temp.total_impressions:
        is_active: false
      performance_temp.cpm:
        is_active: true
      performance_temp.cpc:
        is_active: true
      performance_temp.ctr:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hide_totals: false
    hide_row_totals: false
    listen:
      Date: performance_temp.date_date
      Advertiser: performance_temp.advertiser
      List Category: performance_temp.audience_list_category
      List Type: blended_results.audience_list_type
      List Name: performance_temp.insertion_order
    row: 10
    col: 0
    width: 5
    height: 6
  - title: CPC by Audience Type
    name: CPC by Audience Type
    model: dv360
    explore: performance_temp
    type: looker_column
    fields: [blended_results.audience_list_type, performance_temp.cpc]
    sorts: [blended_results.audience_list_type]
    limit: 500
    query_timezone: America/Los_Angeles
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: performance_temp.cpm,
            id: performance_temp.cpm, name: CPM}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: performance_temp.cpc,
            id: performance_temp.cpc, name: CPC}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: performance_temp.ctr,
            id: performance_temp.ctr, name: CTR}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    font_size: '12'
    series_types: {}
    series_colors:
      performance_temp.cpm: "#72D16D"
    series_labels:
      performance_temp.total_impressions: Impressions
      performance_temp.total_clicks: Clicks
      performance_temp.total_media_cost: Media Spend
    label_color: [black]
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      performance_temp.total_impressions:
        is_active: false
      performance_temp.cpm:
        is_active: true
      performance_temp.cpc:
        is_active: true
      performance_temp.ctr:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hide_totals: false
    hide_row_totals: false
    listen:
      Date: performance_temp.date_date
      Advertiser: performance_temp.advertiser
      List Category: performance_temp.audience_list_category
      List Type: blended_results.audience_list_type
      List Name: performance_temp.insertion_order
    row: 10
    col: 5
    width: 5
    height: 6
  - title: CTR by Audience Type
    name: CTR by Audience Type
    model: dv360
    explore: performance_temp
    type: looker_column
    fields: [blended_results.audience_list_type, performance_temp.ctr]
    sorts: [blended_results.audience_list_type]
    limit: 500
    query_timezone: America/Los_Angeles
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: performance_temp.cpm,
            id: performance_temp.cpm, name: CPM}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: performance_temp.cpc,
            id: performance_temp.cpc, name: CPC}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: performance_temp.ctr,
            id: performance_temp.ctr, name: CTR}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    font_size: '12'
    series_types: {}
    series_colors:
      performance_temp.cpm: "#72D16D"
      performance_temp.ctr: "#FBBC04"
    series_labels:
      performance_temp.total_impressions: Impressions
      performance_temp.total_clicks: Clicks
      performance_temp.total_media_cost: Media Spend
    label_color: [black]
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      performance_temp.total_impressions:
        is_active: false
      performance_temp.cpm:
        is_active: true
      performance_temp.cpc:
        is_active: true
      performance_temp.ctr:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hide_totals: false
    hide_row_totals: false
    listen:
      Date: performance_temp.date_date
      Advertiser: performance_temp.advertiser
      List Category: performance_temp.audience_list_category
      List Type: blended_results.audience_list_type
      List Name: performance_temp.insertion_order
    row: 10
    col: 10
    width: 6
    height: 6
  - title: Performance by Type & Category
    name: Performance by Type & Category
    model: dv360
    explore: performance_temp
    type: looker_grid
    fields: [blended_results.audience_list_type, performance_temp.total_impressions,
      performance_temp.total_clicks, performance_temp.total_media_cost, performance_temp.cpm,
      performance_temp.cpc, performance_temp.ctr, performance_temp.audience_list_category]
    sorts: [blended_results.audience_list_type]
    limit: 500
    query_timezone: America/Los_Angeles
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      performance_temp.total_impressions: Impressions
      performance_temp.total_clicks: Clicks
      performance_temp.total_media_cost: Media Spend
    series_cell_visualizations:
      performance_temp.total_impressions:
        is_active: false
      performance_temp.cpm:
        is_active: true
      performance_temp.cpc:
        is_active: true
      performance_temp.ctr:
        is_active: true
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
    series_types: {}
    value_labels: legend
    label_type: labPer
    font_size: 12
    listen:
      Date: performance_temp.date_date
      Advertiser: performance_temp.advertiser
      List Category: performance_temp.audience_list_category
      List Type: blended_results.audience_list_type
      List Name: performance_temp.insertion_order
    row: 4
    col: 6
    width: 10
    height: 6
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: '2020'
    allow_multiple_values: true
    required: false
    model: dv360
    explore: performance_temp
    listens_to_filters: []
    field: performance_temp.date_date
  - name: Advertiser
    title: Advertiser
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: dv360
    explore: performance_temp
    listens_to_filters: []
    field: performance_temp.advertiser
  - name: List Category
    title: List Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: dv360
    explore: performance_temp
    listens_to_filters: []
    field: performance_temp.audience_list_category
  - name: List Type
    title: List Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: dv360
    explore: performance_temp
    listens_to_filters: []
    field: blended_results.audience_list_type
  - name: List Name
    title: List Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: dv360
    explore: performance_temp
    listens_to_filters: [Advertiser, List Category, List Type]
    field: performance_temp.insertion_order

- dashboard: potential_audience_opportunity_30_day_lookback
  title: Potential Audience Opportunity (30 Day Lookback)
  layout: newspaper
  elements:
  - title: Performance by Type
    name: Performance by Type
    model: dv360
    explore: performance_temp
    type: looker_grid
    fields: [blended_results.audience_list_type, performance_temp.audience_list, performance_temp.total_potential_impressions,
      performance_temp.cpm, performance_temp.total_impressions, performance_temp.ctr,
      performance_temp.total_clicks]
    sorts: [performance_temp.cpm]
    limit: 500
    query_timezone: America/Los_Angeles
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      performance_temp.total_impressions: Impressions
      performance_temp.total_clicks: Clicks
      performance_temp.total_media_cost: Media Spend
    series_cell_visualizations:
      performance_temp.total_impressions:
        is_active: false
      performance_temp.cpm:
        is_active: false
      performance_temp.cpc:
        is_active: true
      performance_temp.ctr:
        is_active: false
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
    series_types: {}
    value_labels: legend
    label_type: labPer
    font_size: 12
    listen:
      Date: performance_temp.date_date
      Advertiser: performance_temp.advertiser
      List Category: performance_temp.audience_list_category
      List Type: blended_results.audience_list_type
      List Name: performance_temp.insertion_order
    row: 12
    col: 0
    width: 15
    height: 7
  - title: Audiences Headroom & CRM
    name: Audiences Headroom & CRM
    model: dv360
    explore: performance_temp
    type: looker_scatter
    fields: [performance_temp.audience_list, performance_temp.total_potential_impressions,
      performance_temp.cpm]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    y_axes: [{label: '', orientation: left, series: [{axisId: performance_temp.total_impressions,
            id: performance_temp.total_impressions, name: Total Impressions}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: log}]
    size_by_field: performance_temp.cpc
    hide_legend: false
    series_types: {}
    swap_axes: false
    hidden_fields: [performance_temp.audience_list]
    defaults_version: 1
    listen:
      Date: performance_temp.date_date
      Advertiser: performance_temp.advertiser
      List Category: performance_temp.audience_list_category
      List Type: blended_results.audience_list_type
      List Name: performance_temp.insertion_order
    row: 0
    col: 0
    width: 15
    height: 12
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 30 days
    allow_multiple_values: true
    required: false
    model: dv360
    explore: performance_temp
    listens_to_filters: []
    field: performance_temp.date_date
  - name: Advertiser
    title: Advertiser
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: dv360
    explore: performance_temp
    listens_to_filters: []
    field: performance_temp.advertiser
  - name: List Category
    title: List Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: dv360
    explore: performance_temp
    listens_to_filters: []
    field: performance_temp.audience_list_category
  - name: List Type
    title: List Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: dv360
    explore: performance_temp
    listens_to_filters: []
    field: blended_results.audience_list_type
  - name: List Name
    title: List Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: dv360
    explore: performance_temp
    listens_to_filters: [Advertiser, List Category, List Type]
    field: performance_temp.insertion_order
