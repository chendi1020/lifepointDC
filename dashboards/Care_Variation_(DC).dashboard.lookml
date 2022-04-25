- dashboard: care_variation_dc
  title: Care Variation_1 (DC)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Readmission Outcome by Region
    name: Readmission Outcome by Region
    model: LifePoint
    explore: lp_demo
    type: looker_bar
    fields: [lp_demo.region, lp_demo.patient_readmit, lp_demo.number_of_patients]
    pivots: [lp_demo.patient_readmit]
    fill_fields: [lp_demo.patient_readmit]
    sorts: [lp_demo.number_of_patients desc 1, lp_demo.patient_readmit]
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
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: asc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: "% of patient", orientation: bottom, series: [{axisId: No - lp_demo.number_of_patients,
            id: No - lp_demo.number_of_patients, name: 'No'}, {axisId: Yes - lp_demo.number_of_patients,
            id: Yes - lp_demo.number_of_patients, name: 'Yes'}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    font_size: '12'
    series_types: {}
    series_colors:
      Yes - lp_demo.number_of_patients: "#F1B51C"
      No - lp_demo.number_of_patients: "#046B5C"
    series_labels: {}
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000"}]
    arm_length: 25
    arm_weight: 50
    spinner_length: 100
    spinner_weight: 50
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1
    hidden_fields: []
    hidden_points_if_no: []
    defaults_version: 1
    listen:
      Measure selection: lp_demo.measure_param
    row: 0
    col: 0
    width: 14
    height: 7
  - title: Causes of Unplanned Readmissions
    name: Causes of Unplanned Readmissions
    model: LifePoint
    explore: lp_demo
    type: looker_pie
    fields: [lp_demo.unplanned_readmit_reason, lp_demo.total_procedures]
    filters:
      lp_demo.unplanned_readmit: 'Yes'
    sorts: [lp_demo.total_procedures desc]
    limit: 500
    value_labels: labels
    label_type: labPer
    inner_radius: 60
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    font_size: 12
    listen:
      Measure selection: lp_demo.measure_param
    row: 0
    col: 14
    width: 10
    height: 7
  - title: Facilities
    name: Facilities
    model: LifePoint
    explore: lp_demo
    type: looker_grid
    fields: [lp_demo.facility, lp_demo.total_readmissions, lp_demo.total_unplanned_readmissions,
      lp_demo.percent_unplanned_readmit, lp_demo.average_cost_of_readmit, lp_demo.average_cost,
      lp_demo.average_length_of_stay_elective]
    sorts: [lp_demo.total_readmissions desc]
    limit: 500
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
    series_types: {}
    listen:
      Measure selection: lp_demo.measure_param
    row: 23
    col: 0
    width: 14
    height: 8
  - title: Top Performers/Opportunities for Improvement
    name: Top Performers/Opportunities for Improvement
    model: LifePoint
    explore: lp_demo
    type: looker_grid
    fields: [lp_demo.facility, lp_demo.city, lp_demo.state_code, lp_demo.average_risk_adjusted_ioh_score,
      lp_demo.opioid_prescription_rate, lp_demo.mri_use_rate]
    sorts: [lp_demo.facility]
    limit: 500
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
    series_types: {}
    listen:
      Measure selection: lp_demo.measure_param
    row: 31
    col: 0
    width: 24
    height: 12
  - title: Clinician Performance
    name: Clinician Performance
    model: LifePoint
    explore: lp_demo
    type: looker_grid
    fields: [lp_demo.average_risk_adjusted_ioh_score, lp_demo.opioid_prescription_rate,
      lp_demo.mri_use_rate, lp_demo.attending_name, lp_demo.facility, lp_demo.total_readmissions,
      lp_demo.total_payment_cost]
    sorts: [lp_demo.average_risk_adjusted_ioh_score desc]
    limit: 500
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
    series_types: {}
    listen:
      Measure selection: lp_demo.measure_param
    row: 43
    col: 0
    width: 24
    height: 10
  - title: ''
    name: ''
    model: LifePoint
    explore: lp_demo
    type: looker_boxplot
    fields: [lp_demo.region, lp_demo.dynamic_min, lp_demo.dynamic_first_quartile,
      lp_demo.dynamic_median, lp_demo.dynamic_third_quartile, lp_demo.dynamic_max]
    sorts: [lp_demo.dynamic_median desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    y_axis_value_format: ''
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
    defaults_version: 1
    series_types: {}
    listen:
      Measure selection: lp_demo.measure_param
    row: 9
    col: 0
    width: 14
    height: 6
  - title: New Tile
    name: New Tile
    model: LifePoint
    explore: lp_demo
    type: single_value
    fields: [lp_demo.dynamic_title]
    sorts: [lp_demo.dynamic_title]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#046B5C"
    series_types: {}
    defaults_version: 1
    listen:
      Measure selection: lp_demo.measure_param
    row: 7
    col: 0
    width: 14
    height: 2
  - title: Outcome Distribution by Region
    name: Outcome Distribution by Region
    model: LifePoint
    explore: lp_demo
    type: looker_bar
    fields: [lp_demo.region, patient_comorbidity_facts.number_of_patients, lp_demo.outcome]
    pivots: [lp_demo.region]
    filters:
      lp_demo.region: "-Regional Health Network,-Duke LifePoint Healthcare"
    sorts: [lp_demo.region, patient_comorbidity_facts.number_of_patients desc 0]
    limit: 50
    dynamic_fields: [{args: [lp_demo.number_of_patients], calculation_type: percent_of_row,
        category: table_calculation, based_on: lp_demo.number_of_patients, label: Percent
          of row, source_field: lp_demo.number_of_patients, table_calculation: percent_of_row,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [patient_comorbidity_facts.number_of_patients],
        calculation_type: percent_of_row, category: table_calculation, based_on: patient_comorbidity_facts.number_of_patients,
        label: Percent of row, source_field: patient_comorbidity_facts.number_of_patients,
        table_calculation: percent_of_row_2, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, _type_hint: number, is_disabled: true}, {args: [percent_of_row_2],
        calculation_type: percent_of_column_sum, category: table_calculation, based_on: percent_of_row_2,
        label: Percent of  Percent of row, source_field: percent_of_row_2, table_calculation: percent_of_percent_of_row,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [patient_comorbidity_facts.number_of_patients],
        calculation_type: percent_of_column_sum, category: table_calculation, based_on: patient_comorbidity_facts.number_of_patients,
        label: Percent of Joint Replacement Number of Patients, source_field: patient_comorbidity_facts.number_of_patients,
        table_calculation: percent_of_lp_demo_number_of_patients, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number}]
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
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: percent_of_lp_demo_number_of_patients,
            id: Central Division - percent_of_lp_demo_number_of_patients, name: Central
              Division}, {axisId: percent_of_lp_demo_number_of_patients, id: Eastern
              Division - percent_of_lp_demo_number_of_patients, name: Eastern Division},
          {axisId: percent_of_lp_demo_number_of_patients, id: Mountain Division -
              percent_of_lp_demo_number_of_patients, name: Mountain Division}, {axisId: percent_of_lp_demo_number_of_patients,
            id: Western Division - percent_of_lp_demo_number_of_patients, name: Western
              Division}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: patient outcome
    font_size: '12'
    series_types: {}
    series_labels: {}
    defaults_version: 1
    hidden_fields: [patient_comorbidity_facts.number_of_patients]
    hidden_points_if_no: []
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen:
      Measure selection: lp_demo.measure_param
    row: 7
    col: 14
    width: 10
    height: 12
  - title: Facility Location
    name: Facility Location
    model: LifePoint
    explore: lp_demo
    type: looker_map
    fields: [lp_demo.facility_location, lp_demo.percent_unplanned_readmit, lp_demo.facility]
    sorts: [lp_demo.percent_unplanned_readmit desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    listen:
      Measure selection: lp_demo.measure_param
    row: 19
    col: 14
    width: 10
    height: 12
  - title: Month changes between Intervention and Procedure dates
    name: Month changes between Intervention and Procedure dates
    model: LifePoint
    explore: lp_demo
    type: marketplace_viz_chord::chord-marketplace
    fields: [lp_demo.number_of_patients, lp_demo.intervention_start_month_name, lp_demo.procedure_month_name]
    filters:
      lp_demo.got_intervention: 'Yes'
    sorts: [lp_demo.number_of_patients desc]
    limit: 500
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    color_range: ["#046B5C", "#0B2949", "#189394", "#F1B51C", "#D02B27", "#17A673",
      "#5C4377", "#753726", "#E0D4B5", "#5B6771"]
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
      Measure selection: lp_demo.measure_param
    row: 15
    col: 0
    width: 14
    height: 8
  filters:
  - name: Measure selection
    title: Measure selection
    type: field_filter
    default_value: readmit^_rate
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: inline
      options: []
    model: LifePoint
    explore: lp_demo
    listens_to_filters: []
    field: lp_demo.measure_param
