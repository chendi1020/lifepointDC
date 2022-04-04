- dashboard: care_variation__facility_view
  title: Facility Care Variation(DC)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Patient Age
    name: Patient Age
    model: LifePoint
    explore: lp_demo
    type: looker_bar
    fields: [lp_demo.number_of_patients, lp_demo.patient_age_group]
    fill_fields: [lp_demo.patient_age_group]
    sorts: [lp_demo.patient_age_group]
    limit: 500
    dynamic_fields: [{args: [lp_demo.number_of_patients], calculation_type: percent_of_column_sum,
        category: table_calculation, based_on: lp_demo.number_of_patients,
        label: Percent of Joint Replacement Number of Patients, source_field: lp_demo.number_of_patients,
        table_calculation: percent_of_lp_demo_number_of_patients, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number}]
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
    show_null_points: true
    defaults_version: 1
    series_types: {}
    hidden_fields: [lp_demo.number_of_patients]
    listen:
      Region: lp_demo.region
      Payer Group: lp_demo.insurance_plan
      Hospitals: lp_demo.facility
      Procedure/Condition: lp_demo.procedure_condition
      Timeframe: lp_demo.procedure_year
    row: 14
    col: 0
    width: 6
    height: 6
  - title: Race
    name: Race
    model: LifePoint
    explore: lp_demo
    type: looker_pie
    fields: [lp_demo.patient_race, lp_demo.number_of_patients]
    sorts: [lp_demo.patient_race]
    limit: 500
    value_labels: legend
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
    listen:
      Region: lp_demo.region
      Payer Group: lp_demo.insurance_plan
      Hospitals: lp_demo.facility
      Procedure/Condition: lp_demo.procedure_condition
      Timeframe: lp_demo.procedure_year
    row: 14
    col: 12
    width: 6
    height: 6
  - title: Gender
    name: Gender
    model: LifePoint
    explore: lp_demo
    type: looker_pie
    fields: [lp_demo.number_of_patients, lp_demo.patient_gender]
    sorts: [lp_demo.number_of_patients desc]
    limit: 500
    value_labels: legend
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
    listen:
      Region: lp_demo.region
      Payer Group: lp_demo.insurance_plan
      Hospitals: lp_demo.facility
      Procedure/Condition: lp_demo.procedure_condition
      Timeframe: lp_demo.procedure_year
    row: 14
    col: 18
    width: 6
    height: 6
  - name: Population Distribution
    type: text
    title_text: Population Distribution
    subtitle_text: ''
    body_text: ''
    row: 12
    col: 0
    width: 24
    height: 2
  - title: Rate of Complications
    name: Rate of Complications
    model: LifePoint
    explore: lp_demo
    type: looker_column
    fields: [national_averages.national_average_rate_of_complication, lp_national_averages.lp_national_average_rate_of_complications,
      lp_regional_averages.lp_regional_average_rate_of_complications, lp_facility_averages.lp_facility_average_rate_of_complications]
    limit: 500
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
    y_axes: [{label: '', orientation: left, series: [{axisId: national_averages.national_average_rate_of_complication,
            id: national_averages.national_average_rate_of_complication, name: National
              Average Rate of Complication}, {axisId: lp_national_averages.lp_national_average_rate_of_complications,
            id: lp_national_averages.lp_national_average_rate_of_complications, name: Lp
              National Average Rate of Complications}, {axisId: lp_demo.average_rate_of_complications,
            id: lp_demo.average_rate_of_complications, name: Average Rate
              of Complications}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: []
    series_types: {}
    series_colors:
      lp_demo.average_rate_of_complications: "#079c98"
    series_labels:
      lp_national_averages.lp_national_average_rate_of_complications: LP National
        Average
      lp_demo.average_rate_of_complications: LP Hospital Average (when filtered
        t
      national_averages.national_average_rate_of_complication: National Average
      lp_regional_averages.lp_regional_average_rate_of_complications: LP Regional
        Average
      lp_facility_averages.lp_facility_average_rate_of_complications: LP Hospital
        Average
    column_spacing_ratio: 0.4
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Rate of complications compared to National, LifePoint total, and selected
      region
    listen:
      Region: lp_demo.region
      Payer Group: lp_demo.insurance_plan
      Hospitals: lp_demo.facility
      Procedure/Condition: lp_demo.procedure_condition
      Timeframe: lp_demo.procedure_year
    row: 0
    col: 0
    width: 12
    height: 6
  - title: Payer Group
    name: Payer Group
    model: LifePoint
    explore: lp_demo
    type: looker_pie
    fields: [lp_demo.insurance_plan, lp_demo.number_of_patients]
    sorts: [lp_demo.insurance_plan]
    limit: 500
    value_labels: legend
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
    listen:
      Region: lp_demo.region
      Payer Group: lp_demo.insurance_plan
      Hospitals: lp_demo.facility
      Procedure/Condition: lp_demo.procedure_condition
      Timeframe: lp_demo.procedure_year
    row: 14
    col: 6
    width: 6
    height: 6
  - title: Untitled
    name: Untitled
    model: LifePoint
    explore: lp_demo
    type: single_value
    fields: [lp_demo.number_of_patients]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Patients
    defaults_version: 1
    listen:
      Region: lp_demo.region
      Payer Group: lp_demo.insurance_plan
      Hospitals: lp_demo.facility
      Procedure/Condition: lp_demo.procedure_condition
      Timeframe: lp_demo.procedure_year
    row: 20
    col: 0
    width: 4
    height: 2
  - title: Frequency of Poor Outcomes After Elective Surgery
    name: Frequency of Poor Outcomes After Elective Surgery
    model: LifePoint
    explore: lp_demo
    type: looker_grid
    fields: [lp_demo.number_of_patients, lp_demo.patient_risk_score_group,
      lp_demo.outcome]
    pivots: [lp_demo.outcome]
    filters:
      lp_demo.outcome: "-EMPTY"
    sorts: [lp_demo.outcome, lp_demo.patient_risk_score_group
        desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: true
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      lp_national_averages.lp_national_average_rate_of_complications: LP National
        Average
      lp_demo.average_rate_of_complications: Regional Health Network Average
      national_averages.national_average_rate_of_complication: National Average
    series_column_widths:
      lp_demo.patient_risk_score_group: 185
    series_cell_visualizations:
      lp_demo.number_of_patients:
        is_active: false
    series_text_format:
      lp_demo.patient_risk_score_group:
        align: right
      lp_demo.number_of_patients:
        align: right
      lp_demo.outcome:
        align: center
    header_font_color: ''
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {steps: 5, constraints: {
              max: {type: percentile, value: 95}}}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    series_value_format: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: national_averages.national_average_rate_of_complication,
            id: national_averages.national_average_rate_of_complication, name: National
              Average Rate of Complication}, {axisId: lp_national_averages.lp_national_average_rate_of_complications,
            id: lp_national_averages.lp_national_average_rate_of_complications, name: Lp
              National Average Rate of Complications}, {axisId: lp_demo.average_rate_of_complications,
            id: lp_demo.average_rate_of_complications, name: Average Rate
              of Complications}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      lp_demo.average_rate_of_complications: "#079c98"
    column_spacing_ratio: 0.4
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: view of count of serious complications for Hip/Knee against risk score
    listen:
      Region: lp_demo.region
      Payer Group: lp_demo.insurance_plan
      Hospitals: lp_demo.facility
      Procedure/Condition: lp_demo.procedure_condition
      Timeframe: lp_demo.procedure_year
    row: 0
    col: 12
    width: 12
    height: 6
  - title: Avg Patient Age
    name: Avg Patient Age
    model: LifePoint
    explore: lp_demo
    type: single_value
    fields: [lp_demo.average_age]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    defaults_version: 1
    listen:
      Region: lp_demo.region
      Payer Group: lp_demo.insurance_plan
      Hospitals: lp_demo.facility
      Procedure/Condition: lp_demo.procedure_condition
      Timeframe: lp_demo.procedure_year
    row: 20
    col: 4
    width: 4
    height: 2
  - title: Avg Gaps in Care
    name: Avg Gaps in Care
    model: LifePoint
    explore: lp_demo
    type: single_value
    fields: [lp_demo.average_number_of_gaps_in_care]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    defaults_version: 1
    listen:
      Region: lp_demo.region
      Payer Group: lp_demo.insurance_plan
      Hospitals: lp_demo.facility
      Procedure/Condition: lp_demo.procedure_condition
      Timeframe: lp_demo.procedure_year
    row: 20
    col: 16
    width: 4
    height: 2
  - title: Avg Length of Stay (Days)
    name: Avg Length of Stay (Days)
    model: LifePoint
    explore: lp_demo
    type: single_value
    fields: [lp_demo.average_length_of_stay_elective]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    defaults_version: 1
    listen:
      Region: lp_demo.region
      Payer Group: lp_demo.insurance_plan
      Hospitals: lp_demo.facility
      Procedure/Condition: lp_demo.procedure_condition
      Timeframe: lp_demo.procedure_year
    row: 20
    col: 12
    width: 4
    height: 2
  - title: Avg Readmission Risk Score
    name: Avg Readmission Risk Score
    model: LifePoint
    explore: lp_demo
    type: single_value
    fields: [lp_demo.average_patient_risk_score]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    defaults_version: 1
    listen:
      Region: lp_demo.region
      Payer Group: lp_demo.insurance_plan
      Hospitals: lp_demo.facility
      Procedure/Condition: lp_demo.procedure_condition
      Timeframe: lp_demo.procedure_year
    row: 20
    col: 20
    width: 4
    height: 2
  - title: Providers
    name: Providers
    model: LifePoint
    explore: lp_demo
    type: single_value
    fields: [lp_demo.total_providers]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Providers
    defaults_version: 1
    listen:
      Region: lp_demo.region
      Payer Group: lp_demo.insurance_plan
      Hospitals: lp_demo.facility
      Procedure/Condition: lp_demo.procedure_condition
      Timeframe: lp_demo.procedure_year
    row: 20
    col: 8
    width: 4
    height: 2
  - title: ''
    name: ''
    model: LifePoint
    explore: lp_demo
    type: table
    fields: [lp_demo.attending_npi, lp_demo.attending_name, lp_demo.facility,
      lp_demo.total_procedures, lp_demo.total_high_risk_patients,
      lp_demo.average_total_or_hours, lp_demo.average_length_of_stay_elective,
      lp_demo.average_cost_per_patient, lp_demo.total_complications]
    filters:
      patient_comorbidity_facts.comorbidity: COPD
    sorts: [lp_demo.average_length_of_stay_elective desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [lp_demo.attending_npi]
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
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Region: lp_demo.region
      Payer Group: lp_demo.insurance_plan
      Hospitals: lp_demo.facility
      Procedure/Condition: lp_demo.procedure_condition
      Timeframe: lp_demo.procedure_year
    row: 22
    col: 0
    width: 24
    height: 17
  - title: Rate of Complications Associated with Readmission Risk Scores
    name: Rate of Complications Associated with Readmission Risk Scores
    model: LifePoint
    explore: lp_demo
    type: looker_scatter
    fields: [lp_demo.facility, lp_demo.average_rate_of_complications,
      lp_demo.average_patient_risk_score, lp_demo.total_procedures]
    filters:
      lp_demo.total_procedures: ">2"
      lp_demo.region: ''
      lp_demo.procedure_condition: Joint Replacement
      lp_demo.procedure_year: 2021/01/01 to 2022/01/01
      lp_demo.insurance_plan: ''
      lp_demo.facility: ''
    sorts: [lp_demo.average_rate_of_complications desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: true
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
    legend_position: right
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    y_axes: [{label: '', orientation: left, series: [{axisId: lp_demo.average_rate_of_complications,
            id: lp_demo.average_rate_of_complications, name: Average Rate
              of Complications}], showLabels: true, showValues: true, minValue: 1,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    size_by_field: lp_demo.total_procedures
    series_types: {}
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000"}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [lp_demo.facility]
    listen: {}
    row: 6
    col: 0
    width: 24
    height: 6
  filters:
  - name: Region
    title: Region
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: LifePoint
    explore: lp_demo
    listens_to_filters: [Payer Group, Hospitals, Procedure/Condition, Timeframe]
    field: lp_demo.region
  - name: Payer Group
    title: Payer Group
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: LifePoint
    explore: lp_demo
    listens_to_filters: [Region, Hospitals, Procedure/Condition, Timeframe]
    field: lp_demo.insurance_plan
  - name: Hospitals
    title: Hospitals
    type: field_filter
    default_value: Ashley Regional Medical Center
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: LifePoint
    explore: lp_demo
    listens_to_filters: [Region, Payer Group, Procedure/Condition, Timeframe]
    field: lp_demo.facility
  - name: Procedure/Condition
    title: Procedure/Condition
    type: field_filter
    default_value: Joint Replacement
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: LifePoint
    explore: lp_demo
    listens_to_filters: [Region, Payer Group, Hospitals, Timeframe]
    field: lp_demo.procedure_condition
  - name: Timeframe
    title: Timeframe
    type: field_filter
    default_value: 2021/01/01 to 2022/01/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: LifePoint
    explore: lp_demo
    listens_to_filters: []
    field: lp_demo.procedure_year
