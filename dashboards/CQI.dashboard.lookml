- dashboard: cqi
  title: CQI_1
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: CQI
    name: CQI
    model: LifePoint
    explore: lp_demo
    type: looker_column
    fields: [lp_demo.region, lp_demo.diff_avg_home_health_pt, lp_demo.diff_avg_equipment_not_there,
      lp_demo.diff_avg_waiting_for_pt_referral, lp_demo.diff_avg_tobacco_use_preop,
      lp_demo.diff_avg_chronic_disease_exacerbation, lp_demo.diff_avg_orders_not_written,
      lp_demo.diff_avg_rounds_not_done]
    filters: {}
    sorts: [lp_demo.region desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: lp_demo.diff_avg_home_health_pt,
            id: lp_demo.diff_avg_home_health_pt, name: Diff Avg Home Health Pt}, {
            axisId: lp_demo.diff_avg_equipment_not_there, id: lp_demo.diff_avg_equipment_not_there,
            name: Diff Avg Equipment Not There}, {axisId: lp_demo.diff_avg_waiting_for_pt_referral,
            id: lp_demo.diff_avg_waiting_for_pt_referral, name: Diff Avg Waiting for
              Pt Referral}, {axisId: lp_demo.diff_avg_tobacco_use_preop, id: lp_demo.diff_avg_tobacco_use_preop,
            name: Diff Avg Tobacco Use Preop}, {axisId: lp_demo.diff_avg_chronic_disease_exacerbation,
            id: lp_demo.diff_avg_chronic_disease_exacerbation, name: Diff Avg Chronic
              Disease Exacerbation}, {axisId: lp_demo.diff_avg_orders_not_written,
            id: lp_demo.diff_avg_orders_not_written, name: Diff Avg Orders Not Written},
          {axisId: lp_demo.diff_avg_rounds_not_done, id: lp_demo.diff_avg_rounds_not_done,
            name: Diff Avg Rounds Not Done}], showLabels: true, showValues: true,
        maxValue: 1, minValue: -1, unpinAxis: false, tickDensity: custom, tickDensityCustom: 63,
        type: linear}]
    series_types: {}
    series_labels: {}
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    series_cell_visualizations:
      lp_demo.total_readmissions:
        is_active: true
      lp_demo.average_cost_of_readmit:
        is_active: true
      lp_demo.diff_avg_home_health_pt:
        is_active: true
        palette:
          palette_id: mathematicacolor-diverging-0
          collection_id: mathematicacolor
      lp_demo.diff_avg_equipment_not_there:
        is_active: true
        palette:
          palette_id: mathematicacolor-diverging-0
          collection_id: mathematicacolor
      lp_demo.diff_avg_waiting_for_pt_referral:
        is_active: true
        palette:
          palette_id: mathematicacolor-diverging-0
          collection_id: mathematicacolor
      lp_demo.diff_avg_tobacco_use_preop:
        is_active: true
        palette:
          palette_id: mathematicacolor-diverging-0
          collection_id: mathematicacolor
      lp_demo.diff_avg_chronic_disease_exacerbation:
        is_active: true
        palette:
          palette_id: mathematicacolor-diverging-0
          collection_id: mathematicacolor
      lp_demo.diff_avg_orders_not_written:
        is_active: true
        palette:
          palette_id: mathematicacolor-diverging-0
          collection_id: mathematicacolor
      lp_demo.diff_avg_rounds_not_done:
        is_active: true
        palette:
          palette_id: mathematicacolor-diverging-0
          collection_id: mathematicacolor
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#046B5C",
        font_color: !!null '', color_application: {collection_id: mathematicacolor,
          palette_id: mathematicacolor-sequential-0}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: along a scale..., value: !!null '',
        background_color: "#046B5C", font_color: !!null '', color_application: {collection_id: mathematicacolor,
          palette_id: mathematicacolor-sequential-0}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: false
    interpolation: linear
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    listen:
      CQI Metric Picker: lp_demo.cqi_metric_picker
      Region: lp_demo.region
    row: 9
    col: 10
    width: 14
    height: 9
  - title: Number of Procedures and Average Cost By Intervention Start Date
    name: Number of Procedures and Average Cost By Intervention Start Date
    model: LifePoint
    explore: lp_demo
    type: looker_line
    fields: [lp_demo.intervention_start_date, lp_demo.intervention_start_month, lp_demo.total_procedures,
      lp_demo.avg_cost_current]
    filters:
      lp_demo.intervention_start_year: 2 years
    sorts: [lp_demo.total_procedures desc]
    limit: 500
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
    y_axes: [{label: '', orientation: left, series: [{axisId: lp_demo.total_procedures,
            id: lp_demo.total_procedures, name: Total Procedures}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: lp_demo.avg_cost_current,
            id: lp_demo.avg_cost_current, name: Average Current Cost}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types:
      lp_demo.avg_cost_current: column
    series_colors:
      lp_demo.avg_cost_current: "#E0D4B5"
    x_axis_datetime_label: "%m/%Y"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    listen:
      CQI Metric Picker: lp_demo.cqi_metric_picker
      Region: lp_demo.region
    row: 9
    col: 0
    width: 10
    height: 9
  - title: New Tile
    name: New Tile
    model: LifePoint
    explore: lp_demo
    type: looker_bar
    fields: [lp_demo.region, lp_demo.cqi_metric, lp_demo.facility]
    filters: {}
    sorts: [lp_demo.cqi_metric desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: lp_demo.diff_avg_home_health_pt,
            id: lp_demo.diff_avg_home_health_pt, name: Diff Avg Home Health Pt}, {
            axisId: lp_demo.diff_avg_equipment_not_there, id: lp_demo.diff_avg_equipment_not_there,
            name: Diff Avg Equipment Not There}, {axisId: lp_demo.diff_avg_waiting_for_pt_referral,
            id: lp_demo.diff_avg_waiting_for_pt_referral, name: Diff Avg Waiting for
              Pt Referral}, {axisId: lp_demo.diff_avg_tobacco_use_preop, id: lp_demo.diff_avg_tobacco_use_preop,
            name: Diff Avg Tobacco Use Preop}, {axisId: lp_demo.diff_avg_chronic_disease_exacerbation,
            id: lp_demo.diff_avg_chronic_disease_exacerbation, name: Diff Avg Chronic
              Disease Exacerbation}, {axisId: lp_demo.diff_avg_orders_not_written,
            id: lp_demo.diff_avg_orders_not_written, name: Diff Avg Orders Not Written},
          {axisId: lp_demo.diff_avg_rounds_not_done, id: lp_demo.diff_avg_rounds_not_done,
            name: Diff Avg Rounds Not Done}], showLabels: true, showValues: true,
        maxValue: 1, minValue: -1, unpinAxis: false, tickDensity: custom, tickDensityCustom: 63,
        type: linear}]
    series_types: {}
    series_labels: {}
    reference_lines: [{reference_type: line, line_value: '0', range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000"}]
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    series_cell_visualizations:
      lp_demo.total_readmissions:
        is_active: true
      lp_demo.average_cost_of_readmit:
        is_active: true
      lp_demo.diff_avg_home_health_pt:
        is_active: true
        palette:
          palette_id: mathematicacolor-diverging-0
          collection_id: mathematicacolor
      lp_demo.diff_avg_equipment_not_there:
        is_active: true
        palette:
          palette_id: mathematicacolor-diverging-0
          collection_id: mathematicacolor
      lp_demo.diff_avg_waiting_for_pt_referral:
        is_active: true
        palette:
          palette_id: mathematicacolor-diverging-0
          collection_id: mathematicacolor
      lp_demo.diff_avg_tobacco_use_preop:
        is_active: true
        palette:
          palette_id: mathematicacolor-diverging-0
          collection_id: mathematicacolor
      lp_demo.diff_avg_chronic_disease_exacerbation:
        is_active: true
        palette:
          palette_id: mathematicacolor-diverging-0
          collection_id: mathematicacolor
      lp_demo.diff_avg_orders_not_written:
        is_active: true
        palette:
          palette_id: mathematicacolor-diverging-0
          collection_id: mathematicacolor
      lp_demo.diff_avg_rounds_not_done:
        is_active: true
        palette:
          palette_id: mathematicacolor-diverging-0
          collection_id: mathematicacolor
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#046B5C",
        font_color: !!null '', color_application: {collection_id: mathematicacolor,
          palette_id: mathematicacolor-sequential-0}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: along a scale..., value: !!null '',
        background_color: "#046B5C", font_color: !!null '', color_application: {collection_id: mathematicacolor,
          palette_id: mathematicacolor-sequential-0}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: false
    interpolation: linear
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    hidden_fields: [lp_demo.region]
    hidden_points_if_no: []
    title_hidden: true
    listen:
      CQI Metric Picker: lp_demo.cqi_metric_picker
      Region: lp_demo.region
    row: 0
    col: 0
    width: 10
    height: 9
  - title: AsterPlot
    name: AsterPlot
    model: LifePoint
    explore: lp_demo
    type: marketplace_viz_aster_plot::aster_plot-marketplace
    fields: [lp_demo.division, lp_demo.cqi_metric_original_rate, lp_demo.number_of_patients_with_gaps_in_care]
    filters: {}
    sorts: [lp_demo.cqi_metric_original_rate desc]
    limit: 500
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    legend: right
    label_value: 'on'
    center_value: 'off'
    color_range: ["#046B5C", "#0B2949", "#189394", "#F1B51C", "#D02B27", "#17A673",
      "#5C4377", "#753726", "#E0D4B5", "#5B6771"]
    inner_circle_color: "#efffff"
    font_size: 55
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
    defaults_version: 0
    series_types: {}
    listen:
      CQI Metric Picker: lp_demo.cqi_metric_picker
      Region: lp_demo.region
    row: 0
    col: 10
    width: 14
    height: 9
  filters:
  - name: CQI Metric Picker
    title: CQI Metric Picker
    type: field_filter
    default_value: diff^_avg^_home^_health^_pt
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: LifePoint
    explore: lp_demo
    listens_to_filters: []
    field: lp_demo.cqi_metric_picker
  - name: Region
    title: Region
    type: field_filter
    default_value: Mountain Division,Duke LifePoint Healthcare,Regional Health Network,Central
      Division,Eastern Division,Western Division
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: LifePoint
    explore: lp_demo
    listens_to_filters: []
    field: lp_demo.region
