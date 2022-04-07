# The name of this view in Looker is "Joint Replacement 2021 12 07"
view: lp_demo {
  view_label: "LifePoint Demo"
  sql_table_name: `lifepoint_demo.lifepoint_demo` ;;

## ---------------------------- IDs ---------------------------- ##

  dimension: patient_id {
    group_label: "Patient"
    group_item_label: "ID"
    type: number
    sql: ${TABLE}.Patient_ID ;;
  }

  dimension: unique_procedure {
    hidden: yes
    primary_key: yes
    type: string
    sql: CONCAT(${patient_id},${procedure_raw}) ;;
  }

## ---------------------------- Dates ---------------------------- ##

  dimension_group: patient_birth {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Patient_DOB ;;
  }

  dimension_group: procedure {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Procedure_Date ;;
  }

  measure: max_procedure_date {
    hidden: yes
    type: max
    sql: ${procedure_raw} ;;
  }

## ---------------------------- Native Dimensions ---------------------------- ##

  dimension: attending_name_first {
    view_label: "Attending Physician"
    group_item_label: "First Name"
    type: string
    sql: ${TABLE}.Attending_Name_First ;;
  }

  dimension: attending_name_last {
    view_label: "Attending Physician"
    group_item_label: "Last Name"
    type: string
    sql: ${TABLE}.Attending_Name_Last ;;
  }

  dimension: attending_npi {
    view_label: "Attending Physician"
    group_item_label: "NPI"
    type: number
    sql: ${TABLE}.Attending_NPI ;;
  }

  dimension: average_daily_steps_immediately_after_operation {
    group_label: "Post-Op"
    type: number
    sql: ${TABLE}.Average_Daily_Steps_Immediately_After_Operation ;;
  }

  dimension: city {
    view_label: "Location"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: community_population {
    view_label: "Location"
    type: number
    sql: ${TABLE}.community_population ;;
  }

  dimension: division {
    view_label: "Location"
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: dv_patient_risk_score {
    group_label: "Patient"
    group_item_label: "Readmission Risk Score"
    label: "Readmission Risk Score"
    type: number
    sql: ${TABLE}.DV_Patient_Risk_Score ;;
    value_format_name: percent_2
  }

  dimension: facility {
    view_label: "Location"
    type: string
    sql: ${TABLE}.facility ;;
    drill_fields: [attending_name]
    link: {
      label: "Care Variation (Facility View)"
      icon_url: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png"
      url: "https://mathematica.cloud.looker.com/dashboards/22?Region={{ _filters['lp_demo.region'] | url_encode }}&Procedure%2FCondition={{ _filters['lp_demo.procedure_condition'] | url_encode }}&Timeframe={{ _filters['lp_demo.procedure_year'] | url_encode }}&Payer+Group={{ _filters['lp_demo.insurance_plan'] | url_encode }}&Hospitals={{ value  | url_encode }}"
    }

  }

  dimension: facility_latitude {
    view_label: "Location"
    hidden: yes
    type: number
    sql: ${TABLE}.facility_latitude ;;
  }

  dimension: facility_longitude {
    view_label: "Location"
    hidden: yes
    type: number
    sql: ${TABLE}.facility_longitude ;;
  }

  dimension: hospital_discharge_disposition {
    group_label: "Discharge"
    group_item_label: "Hospital Disposition"
    type: string
    sql: ${TABLE}.Hospital_Discharge_Disposition ;;
  }

  dimension: insurance_plan {
    label: "Payer Group"
    type: string
    sql: ${TABLE}.Insurance_Plan ;;
    link: {
      label: "Care Variation - Facility View"
      icon_url: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png"
      url: "/dashboards/3?Region={{ _filters['lp_demo.region'] | url_encode }}&Procedure%2FCondition={{ _filters['lp_demo.procedure_condition'] | url_encode }}&Timeframe={{ _filters['lp_demo.procedure_year'] | url_encode }}&Payer+Group={{ value }}&Hospitals={{ _filters['lp_demo.facility'] | url_encode }}"
    }
  }

  dimension: iv_10_tjr_bundled_pay__for_bpci_ {
    label: "Bundled Pay for BPCI"
    type: number
    sql: ${TABLE}.IV_10_TJR_Bundled_Pay__For_BPCI_ ;;
  }

  dimension: iv_11_pna_sceen {
    group_label: "Screen"
    group_item_label: "PNA"
    type: yesno
    sql: ${TABLE}.IV_11_PNA_Sceen ;;
  }

  dimension: iv_12_chf_screen {
    group_label: "Screen"
    group_item_label: "CHF"
    type: yesno
    sql: ${TABLE}.IV_12_CHF_Screen ;;
  }

  dimension: iv_13_copd_screen {
    group_label: "Screen"
    group_item_label: "COPD"
    type: yesno
    sql: ${TABLE}.IV_13_COPD_Screen ;;
  }

  dimension: iv_14_copd_pulmonary_diagnostic {
    group_label: "COPD"
    label: "Pulmonary Diagnostic"
    type: yesno
    sql: ${TABLE}.IV_14_COPD_Pulmonary_Diagnostic ;;
  }

  dimension: iv_15_copd_smoking_and_smoking_cessation {
    group_label: "COPD"
    label: "Smoking Cessation"
    type: yesno
    sql: ${TABLE}.IV_15_COPD_Smoking_and_smoking_cessationFile Browser ;;
  }

  dimension: iv_16_copd_medical_management {
    group_label: "COPD"
    group_item_label: "Management"
    type: yesno
    sql: ${TABLE}.IV_16_COPD_Medical_management ;;
  }

  dimension: iv_17_sepsis_screen {
    group_label: "Screen"
    group_item_label: "Sepsis"
    type: yesno
    sql: ${TABLE}.IV_17_Sepsis_Screen ;;
  }

  dimension: iv_1_los {
    label: "Length of Stay (Days)"
    description: "in days"
    type: number
    sql: ${TABLE}.IV_1_LOS ;;
    value_format_name: decimal_1
  }

  dimension: iv_2_type_of_antibiotic {
    label: "Type of Antibiotic"
    type: string
    sql: ${TABLE}.IV_2_Type_of_Antibiotic ;;
  }

# what does this mean?
  dimension: iv_3_time_to_antibiotic_within_one_hour {
    label: "Time to Antibiotic"
    type: string
    sql: CASE WHEN ${TABLE}.IV_3_Time_to_Antibiotic_Within_One_Hour = TRUE THEN '<1'
         ELSE '>1'
         END ;;
  }

  dimension: iv_4_escalation_post_op_antibiotic_needed {
    group_label: "Post-Op"
    group_item_label: "Escalation Needed Post-Op"
    type: yesno
    sql: ${TABLE}.IV_4_Escalation_Post_op_antibiotic_needed ;;
  }

  dimension: iv_5_blood_cultures {
    label: "Blood Cultures"
    type: yesno
    sql: ${TABLE}.IV_5_Blood_cultures ;;
  }

  dimension: iv_6_vaccination {
    label: "Vaccination"
    type: yesno
    sql: ${TABLE}.IV_6_Vaccination ;;
  }

  dimension: iv_7_tjr_implant_type {
    label: "Implant Type"
    type: string
    sql: ${TABLE}.IV_7_TJR_Implant_Type ;;
  }

  dimension: iv_8_tjr_preop {
    label: "Pre-Op"
    type: yesno
    sql: ${TABLE}.IV_8_TJR_Preop ;;
  }

  dimension: iv_9_tjr_blood_clot {
    label: "Blood Clot"
    type: yesno
    sql: ${TABLE}.IV_9_TJR_Blood_Clot ;;
  }

  dimension: me_access {
    group_label: "Measurements"
    group_item_label: "Access"
    type: number
    sql: ${TABLE}.ME_Access ;;
  }

  dimension: me_adherence_to_testing {
    group_label: "Measurements"
    group_item_label: "Adherence to Testing"
    type: number
    sql: ${TABLE}.ME_Adherence_to_Testing ;;
  }

  dimension: me_adherence_to_treatment {
    group_label: "Measurements"
    group_item_label: "Adherence to Treatment"
    type: number
    sql: ${TABLE}.ME_Adherence_to_Treatment ;;
  }

  dimension: me_diagnosis {
    group_label: "Measurements"
    group_item_label: "Diagnosis"
    type: number
    sql: ${TABLE}.ME_Diagnosis ;;
  }

  dimension: me_diagnostic_testing_process {
    group_label: "Measurements"
    group_item_label: "Diagnostic Testing Process"
    type: number
    sql: ${TABLE}.ME_Diagnostic_Testing_Process ;;
  }

  dimension: me_potential_health_concern {
    group_label: "Measurements"
    group_item_label: "Potential Health Concern"
    type: number
    sql: ${TABLE}.ME_Potential_Health_Concern ;;
  }

  dimension: me_problem_recognition {
    group_label: "Measurements"
    group_item_label: "Problem Recognition"
    type: number
    sql: ${TABLE}.ME_Problem_Recognition ;;
  }

  dimension: me_response_to_treatment {
    group_label: "Measurements"
    group_item_label: "Response to Treatement"
    type: number
    sql: ${TABLE}.ME_Response_to_Treatment ;;
  }


  dimension: me_treatment_or_recommendation_to_treatment {
    group_label: "Measurements"
    group_item_label: "Recommendation to Treatement"
    type: number
    sql: ${TABLE}.ME_Treatment_or_Recommendation_to_Treatment ;;
  }

  dimension: number_of_complications {
    type: number
    sql: ${TABLE}.number_of_complications ;;
  }

  dimension: number_of_gaps_in_care {
    type: number
    sql: ${TABLE}.Number_of_Gaps_in_Care ;;
  }

  dimension: number_of_serious_complications {
    type: number
    sql: ${TABLE}.Number_of_Serious_Complications ;;
  }

  dimension: patient_age {
    view_label: "Patient"
    type: number
    sql: ${TABLE}.Patient_Age ;;
  }

  dimension: patient_died {
    type: yesno
    sql: ${TABLE}.Patient_Died ;;
  }

  dimension: patient_gender {
    view_label: "Patient"
    type: string
    sql: ${TABLE}.Patient_Gender ;;
  }

  dimension: patient_name_first {
    view_label: "Patient"
    group_item_label: "First Name"
    type: string
    sql: ${TABLE}.Patient_Name_First ;;
  }

  dimension: patient_name_last {
    view_label: "Patient"
    group_item_label: "Last Name"
    type: string
    sql: ${TABLE}.Patient_Name_Last ;;
  }

  dimension: patient_race {
    view_label: "Patient"
    group_item_label: "Race"
    type: string
    sql: ${TABLE}.Patient_Race ;;
  }

  dimension: region {
    view_label: "Location"
    type: string
    sql: ${TABLE}.region ;;
    drill_fields: [facility, attending_npi]
  }

  dimension: state_code {
    view_label: "Location"
    type: string
    sql: ${TABLE}.state_code ;;
  }

  dimension: state_name {
    view_label: "Location"
    type: string
    sql: ${TABLE}.state_name ;;
  }

  dimension: surgery_elective {
    type: yesno
    sql: ${TABLE}.Surgery_Elective ;;
  }

  dimension: surgical_discharge_disposition {
    group_label: "Discharge"
    group_item_label: "Surgical Disposition"
    type: string
    sql: ${TABLE}.Surgical_Discharge_Disposition ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.Total_Cost ;;
    value_format_name: usd
  }

  dimension: total_or_hours {
    label: "Total OR Hours"
    type: number
    sql: ${TABLE}.Total_OR_Hours ;;
  }

  dimension: zip {
    view_label: "Location"
    type: zipcode
    sql: CAST(${TABLE}.zip AS STRING) ;;
  }

  dimension: referred_in_network {
    group_label: "Patient"
    type: yesno
    sql: ${TABLE}.referred_in_network ;;
  }

  dimension: has_diabetes {
    view_label: "Patient"
    type: yesno
    sql: ${TABLE}.has_diabetes ;;
  }

  dimension: has_congestive_heart_failure {
    view_label: "Patient"
    type: yesno
    sql: ${TABLE}.has_congestive_heart_failure ;;
  }

  dimension: has_copd {
    view_label: "Patient"
    type: yesno
    sql: ${TABLE}.has_copd ;;
  }

  dimension: has_obesity {
    view_label: "Patient"
    type: yesno
    sql: ${TABLE}.has_obesity ;;
  }

  dimension: has_cancer {
    view_label: "Patient"
    type: yesno
    sql: ${TABLE}.has_cancer ;;
  }

  ### National Quality Program ###

  parameter: nqp_metric_picker {
    description: "Use with the NQP Metric dimension"
    view_label: "National Quality Program"
    type: unquoted
    allowed_value: {
      label: "Colorectal Cancer Screening"
      value: "colorectal_cancer_screening_completed"
    }
    allowed_value: {
      label: "Portal Adoption"
      value: "portal_adoption"
    }
    allowed_value: {
      label: "Overall HCAHPS"
      value: "hchaps_score_met"
    }
    allowed_value: {
      label: "Breast Cancer Screening"
      value: "breast_cancer_screening"
    }
    allowed_value: {
      label: "A1c Management"
      value: "a1c_management"
    }
    allowed_value: {
      label: "Same Day Encounter Close Rate"
      value: "same_day_encounter_close"
    }
  }

  dimension: nqp_metric {
    view_label: "National Quality Program"
    type: yesno
    sql: ${TABLE}.{% parameter nqp_metric_picker %} ;;
  }

  dimension: nqp_metric_selected {
    view_label: "National Quality Program"
    type: string
    sql: {% if nqp_metric_picker._parameter_value ==  "same_day_encounter_close" %} "Same Day Encounter Close Rate"
         {% elsif nqp_metric_picker._parameter_value == "a1c_management" %} "A1c Management"
         {% elsif nqp_metric_picker._parameter_value == "breast_cancer_screening" %} "Breast Cancer Screening"
         {% elsif nqp_metric_picker._parameter_value =="hchaps_score_met" %} "Overall HCAHPS"
         {% elsif nqp_metric_picker._parameter_value == "portal_adoption" %} "Portal Adoption"
         {% elsif nqp_metric_picker._parameter_value == "colorectal_cancer_screening_completed" %} "Colorectal Cancer Screening"
        {% endif %};;
  }

  measure: total_patients_nqp {
    view_label: "National Quality Program"
    type: count_distinct
    sql: ${patient_id} ;;
    filters: [nqp_metric: "Yes"]
  }

  measure: total_patients_not_nqp {
    view_label: "National Quality Program"
    type: count_distinct
    sql: ${patient_id} ;;
    filters: [nqp_metric: "No"]
  }

  measure: nqp_performance_ratio {
    view_label: "National Quality Program"
    type: number
    sql: ${total_patients_nqp}/${number_of_patients} ;;
    value_format_name: percent_2
  }

  dimension: colorectal_cancer_screening_completed {
    view_label: "National Quality Program"
    group_label: "Patient"
    type: yesno
    sql: ${TABLE}.colorectal_cancer_screening_completed ;;
    link: {
      label: "NQP Details - Colorectal Cancer Screening"
      icon_url: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png"
      url: "/dashboards/12?Region={{ _filters['lp_demo.region'] | url_encode }}&Procedure%2FCondition={{ _filters['lp_demo.procedure_condition'] | url_encode }}&Timeframe={{ _filters['lp_demo.procedure_year'] | url_encode }}&Payer+Group={{ _filters['lp_demo.insurance_plan'] | url_encode }}&Hospitals={{ row['lp_demo.facility'] | url_encode }}&NQP+Metric=colorectal%5E_cancer%5E_screening%5E_completed"
    }
  }

  dimension: a1c_management {
    view_label: "National Quality Program"
    group_label: "Patient"
    type: yesno
    sql: ${TABLE}.a1c_management ;;
    link: {
      label: "NQP Details - A1c Management"
      icon_url: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png"
      url: "/dashboards/12?Region={{ _filters['lp_demo.region'] | url_encode }}&Procedure%2FCondition={{ _filters['lp_demo.procedure_condition'] | url_encode }}&Timeframe={{ _filters['lp_demo.procedure_year'] | url_encode }}&Payer+Group={{ _filters['lp_demo.insurance_plan'] | url_encode }}&Hospitals={{ row['lp_demo.facility'] | url_encode }}&NQP+Metric=a1c%5E_management"
    }
  }

  dimension: portal_adoption {
    view_label: "National Quality Program"
    group_label: "Patient"
    type: yesno
    sql: ${TABLE}.portal_adoption ;;
    link: {
      label: "NQP Details - Portal Adoption"
      icon_url: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png"
      url: "/dashboards/12?Region={{ _filters['lp_demo.region'] | url_encode }}&Procedure%2FCondition={{ _filters['lp_demo.procedure_condition'] | url_encode }}&Timeframe={{ _filters['lp_demo.procedure_year'] | url_encode }}&Payer+Group={{ _filters['lp_demo.insurance_plan'] | url_encode }}&Hospitals={{ row['lp_demo.facility'] | url_encode }}&NQP+Metric=portal%5E_adoption"
    }
  }

  dimension: breast_cancer_screening {
    view_label: "National Quality Program"
    group_label: "Patient"
    type: yesno
    sql: ${TABLE}.breast_cancer_screening ;;
    link: {
      label: "NQP Details - Breast Cancer Screening"
      icon_url: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png"
      url: "/dashboards/12?Region={{ _filters['lp_demo.region'] | url_encode }}&Procedure%2FCondition={{ _filters['lp_demo.procedure_condition'] | url_encode }}&Timeframe={{ _filters['lp_demo.procedure_year'] | url_encode }}&Payer+Group={{ _filters['lp_demo.insurance_plan'] | url_encode }}&Hospitals={{ row['lp_demo.facility'] | url_encode }}&NQP+Metric=breast%5E_cancer%5E_screening"
    }
  }

  dimension: same_day_encounter_close {
    view_label: "National Quality Program"
    group_label: "Patient"
    type: yesno
    sql: ${TABLE}.same_day_encounter_close ;;
    link: {
      label: "NQP Details - Same Day Encounter Close Rate"
      icon_url: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png"
      url: "/dashboards/12?Region={{ _filters['lp_demo.region'] | url_encode }}&Procedure%2FCondition={{ _filters['lp_demo.procedure_condition'] | url_encode }}&Timeframe={{ _filters['lp_demo.procedure_year'] | url_encode }}&Payer+Group={{ _filters['lp_demo.insurance_plan'] | url_encode }}&Hospitals={{ row['lp_demo.facility'] | url_encode }}&NQP+Metric=same%5E_day%5E_encounter%5E_close"
    }
  }

  dimension: hchaps_score {
    view_label: "National Quality Program"
    label: "HCAHPS Score"
    group_label: "Patient"
    type: yesno
    sql: ${TABLE}.hchaps_score_met ;;
    link: {
      label: "NQP Details - HCAHPS Score"
      icon_url: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png"
      url: "/dashboards/12?Region={{ _filters['lp_demo.region'] | url_encode }}&Procedure%2FCondition={{ _filters['lp_demo.procedure_condition'] | url_encode }}&Timeframe={{ _filters['lp_demo.procedure_year'] | url_encode }}&Payer+Group={{ _filters['lp_demo.insurance_plan'] | url_encode }}&Hospitals={{ row['lp_demo.facility'] | url_encode }}&NQP+Metric=hchaps%5E_score%5E_met"
    }
  }

  dimension: hchaps_score_float {
    view_label: "National Quality Program"
    label: "HCAHPS Score"
    group_label: "Patient"
    type: number
    sql: ${TABLE}.hchaps_score ;;
  }

############################ Care Variation #########################
  dimension: patient_readmit {
    view_label: "Care Variation"
    type: yesno
    sql: ${TABLE}.Patient_Readmit ;;
  }

  dimension: unplanned_readmit {
    view_label: "Care Variation"
    type: yesno
    sql: ${TABLE}.unplanned_readmit ;;
  }

  dimension: unplanned_readmit_reason {
    view_label: "Care Variation"
    type: string
    sql: ${TABLE}.unplanned_readmit_reason ;;
  }

  dimension: radiology_service_used {
    view_label: "Care Variation"
    type: string
    sql: ${TABLE}.radiology_service_used ;;
  }

  dimension: post_op_pain_management {
    view_label: "Care Variation"
    type: string
    sql: ${TABLE}.post_op_pain_management ;;
  }

  dimension: risk_adjusted_ioh_score {
    view_label: "Care Variation"
    type: number
    sql: ${TABLE}.risk_adjusted_ioh_score ;;
  }

  measure: readmit_rate{
    view_label: "Care Variation"
    group_label: "Readmittance"
    type: average
    sql: case when ${TABLE}.patient_readmit then 1 else 0 end ;;
    value_format_name: percent_2
  }

  measure: total_readmissions {
    view_label: "Care Variation"
    group_label: "Readmittance"
    type: count_distinct
    sql: ${unique_procedure} ;;
    filters: [patient_readmit: "Yes"]
    drill_fields: [patient_details*]
  }

  measure: total_unplanned_readmissions {
    view_label: "Care Variation"
    group_label: "Readmittance"
    type: count_distinct
    sql: ${unique_procedure} ;;
    filters: [unplanned_readmit: "Yes"]
    drill_fields: [patient_details*]
  }

  measure: percent_unplanned_readmit {
    view_label: "Care Variation"
    group_label: "Readmittance"
    type: number
    sql: case when ${total_readmissions} = 0 then 0 else ${total_unplanned_readmissions}/${total_readmissions} end ;;
    value_format_name: percent_2
    drill_fields: [patient_details*]
  }

  measure: average_cost_of_readmit {
    view_label: "Care Variation"
    group_label: "Readmittance"
    type: average
    sql: ${cost} ;;
    value_format_name: usd
    filters: [patient_readmit: "Yes"]
    drill_fields: [patient_details*]
  }

  measure: average_risk_adjusted_ioh_score {
    label: "Avg Risk Adjusted IOH Score"
    view_label: "Care Variation"
    group_label: "IOH"
    type: average
    sql: ${risk_adjusted_ioh_score} ;;
    value_format_name: decimal_2
    drill_fields: [patient_details*]
  }

  measure: opioid_prescription_rate {
    view_label: "Care Variation"
    type: average
    sql: case Post_Op_Pain_Management when 'Opioid' then 1 else 0 end ;;
    value_format_name: percent_2
    drill_fields: [patient_details*]
  }

  measure: mri_use_rate {
    label: "MRI Use Rate"
    view_label: "Care Variation"
    type: average
    sql: case Radiology_Service_Used when 'MRI' then 1 else 0 end ;;
    value_format_name: decimal_2
    drill_fields: [patient_details*]
  }



## ---------------------------- Derived Dimensions ---------------------------- ##

  dimension: attending_name {
    view_label: "Attending Physician"
    group_item_label: "Full Name"
    type: string
    sql: ${attending_name_first}||" "||${attending_name_last}||", M.D." ;;
    drill_fields: [patient_name]
  }

  dimension: patient_name {
    view_label: "Patient"
    group_item_label: "Full Name"
    type: string
    sql: ${patient_name_first}||" "||${patient_name_last} ;;
  }

  dimension: patient_had_gap {
    view_label: "Gaps in Care"
    hidden: yes
    type: yesno
    sql: ${number_of_gaps_in_care} > 0 ;;
  }

  dimension: patient_age_group {
    view_label: "Patient"
    type: tier
    tiers: [21,31,41,51,75]
    style: integer
    sql: ${patient_age} ;;
  }

  dimension: patient_risk_score_group {
    view_label: "Patient"
    group_item_label: "Readmission Risk Score Group"
    label: "Readmission Risk Score Group"
    type: tier
    tiers: [0.2,0.4,0.6,0.8,1]
    style: relational
    sql: ${dv_patient_risk_score} ;;
    value_format_name: percent_0
  }

  dimension: outcome {
    group_label: "Patient"
    type: string
    sql: CASE WHEN ${iv_9_tjr_blood_clot} = TRUE THEN 'Blood Clot'
              WHEN ${patient_died} = TRUE THEN 'Death'
              WHEN ${has_congestive_heart_failure} = TRUE THEN 'Nerve Damage'
              WHEN ${has_cancer} = TRUE THEN 'Infection'
              END ;;
  }

  dimension: health {
    group_label: "Patient"
    type: string
    sql: CASE WHEN ${has_diabetes} = TRUE THEN 'Diabetes'
              WHEN ${has_congestive_heart_failure} = TRUE THEN 'Congestive Heart Failure'
              WHEN ${has_cancer} = TRUE THEN 'Cancer'
              WHEN ${has_copd} = TRUE THEN 'COPD'
              WHEN ${has_obesity} = TRUE THEN 'Obesity'
              ELSE "None"
              END ;;
  }

  dimension: spider_dim {
    type: string
    sql: "Joint Replacement" ;;
  }

  dimension: procedure_condition {

    sql: "Joint Replacement"  ;;


  }

  dimension: facility_location {
    view_label: "Location"
    type: location
    sql_latitude: ${facility_latitude} ;;
    sql_longitude: ${facility_longitude} ;;
  }

  dimension: high_risk_patient{
    description: "Is the patient at high risk of readmission?"
    view_label: "Patient"
    type: yesno
    sql: ${dv_patient_risk_score} >= .9 ;;
  }



## ---------------------------- Measures ---------------------------- ##

  measure: total_number_of_gaps_in_care {
    view_label: "Gaps in Care"
    type: sum
    sql: ${number_of_gaps_in_care} ;;
    drill_fields: [patient_details*]
  }

  measure: average_number_of_gaps_in_care {
    view_label: "Gaps in Care"
    type: average
    sql: ${number_of_gaps_in_care} ;;
    value_format_name: decimal_2
    drill_fields: [patient_details*]
  }

  measure: average_access {
    group_label: "Measures"
    type: average
    sql: ${me_access} ;;
    value_format_name: decimal_2
  }

  measure: average_adherence_to_testing {
    group_label: "Measures"
    type: average
    sql: ${me_adherence_to_testing} ;;
    value_format_name: decimal_2
  }

  measure: average_adherence_to_treatment {
    group_label: "Measures"
    type: average
    sql: ${me_adherence_to_treatment} ;;
    value_format_name: decimal_2
  }

  measure: average_diagnosis {
    group_label: "Measures"
    type: average
    sql: ${me_diagnosis} ;;
    value_format_name: decimal_2
  }

  measure: average_diagnostic_testing_process {
    group_label: "Measures"
    type: average
    sql: ${me_diagnostic_testing_process} ;;
    value_format_name: decimal_2
  }

  measure: average_potential_health_concern {
    group_label: "Measures"
    type: average
    sql: ${me_potential_health_concern} ;;
    value_format_name: decimal_2
  }

  measure: average_problem_recognition {
    group_label: "Measures"
    type: average
    sql: ${me_problem_recognition} ;;
    value_format_name: decimal_2
  }

  measure: average_response_to_treatment{
    group_label: "Measures"
    type: average
    sql: ${me_response_to_treatment} ;;
    value_format_name: decimal_2
  }

  measure: average_treatment_or_recommendation_to_treatment {
    group_label: "Measures"
    type: average
    sql: ${me_treatment_or_recommendation_to_treatment} ;;
    value_format_name: decimal_2
  }

  measure: total_procedures {
    group_label: "Measures"
    type: count_distinct
    sql: ${unique_procedure} ;;
    drill_fields: [patient_details*, procedure_date]
  }



  measure: average_readmission_post_procedure {
    group_label: "Measures"
    type: average
    label: "Readmission Rate"
    sql: CASE WHEN ${patient_readmit} THEN 1
         ELSE 0
         END ;;
    value_format_name: percent_1
    drill_fields: [patient_details*,average_readmission_post_procedure]
    link: {
      label: "Care Variation - Hospital View"
      icon_url: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png"
      url: "/dashboards/3?Region={{ _filters['lp_demo.region'] | url_encode }}&Procedure%2FCondition={{ _filters['lp_demo.procedure_condition'] | url_encode }}&Timeframe={{ _filters['lp_demo.procedure_year'] | url_encode }}&Payer+Group={{ _filters['lp_demo.insurance_plan'] | url_encode }}&Hospitals={{ _filters['lp_demo.facility'] | url_encode }}"
    }
  }

  measure: average_antibiotic_administration {
    group_label: "Measures"
    type: average
    sql: CASE WHEN ${iv_3_time_to_antibiotic_within_one_hour} = '<1' THEN 1
         ELSE 0
         END ;;
    value_format_name: percent_1
    html: {{ rendered_value }}
          <br> </br>
          <br> Facility </br>
          <br> {{ lp_demo.facility._rendered_value }} </br>  ;;
  }

  measure: total_deaths {
    group_label: "Measures"
    type: count_distinct
    sql: ${unique_procedure} ;;
    filters: [patient_died: "Yes"]
    drill_fields: [patient_details*]
  }

  measure: total_high_risk_patients {
    group_label: "Measures"
    type: count_distinct
    sql: ${patient_id} ;;
    filters: [high_risk_patient: "Yes"]
    drill_fields: [patient_details*]
  }

  measure: average_rate_of_serious_complications {
    group_label: "Measures"
    type: average
    sql: ${number_of_serious_complications} ;;
    label: "Serious Complication Rate"
    value_format_name: decimal_2
    drill_fields: [variations_in_care_details*,average_rate_of_serious_complications]
    link: {
      label: "Care Variation - Hospital View"
      icon_url: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png"
      url: "/dashboards/3?Region={{ _filters['lp_demo.region'] | url_encode }}&Procedure%2FCondition={{ _filters['lp_demo.procedure_condition'] | url_encode }}&Timeframe={{ _filters['lp_demo.procedure_year'] | url_encode }}&Payer+Group={{ _filters['lp_demo.insurance_plan'] | url_encode }}&Hospitals={{ _filters['lp_demo.facility'] | url_encode }}"
    }
  }

  measure: average_length_of_stay_elective {
    group_label: "Measures"
    label: "Average Length of Stay (Days)"
    type: average
    sql: ${iv_1_los} ;;
    value_format_name: decimal_2

    drill_fields: [gaps_in_care_details*]

    link: {
      label: "{% if row['lp_demo.facility'] %} Gaps in Care Details {% endif %}"
      icon_url: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png"
      url: "/dashboards/9?Region={{ _filters['lp_demo.region'] | url_encode }}&Procedure%2FCondition={{ _filters['lp_demo.procedure_condition'] | url_encode }}&Timeframe={{ _filters['lp_demo.procedure_year'] | url_encode }}&Payer+Group={{ _filters['lp_demo.insurance_plan'] | url_encode }}&Hospitals={{ row['lp_demo.facility'] | url_encode }}"
    }
    link: {
      label: "Care Variation - Hospital View"
      icon_url: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png"
      url: "/dashboards/3?Region={{ _filters['lp_demo.region'] | url_encode }}&Procedure%2FCondition={{ _filters['lp_demo.procedure_condition'] | url_encode }}&Timeframe={{ _filters['lp_demo.procedure_year'] | url_encode }}&Payer+Group={{ _filters['lp_demo.insurance_plan'] | url_encode }}&Hospitals={{ _filters['lp_demo.facility'] | url_encode }}"
    }
  }

  measure: total_payment_cost {
    group_label: "Measures"
    group_item_label: "Total Payment/Cost"
    type: sum
    sql: ${cost} ;;
    value_format_name: usd
    drill_fields: [patient_details*]
  }

  measure: average_cost {
    group_label: "Measures"
    type: average
    sql: ${cost} ;;
    value_format_name: usd
    drill_fields: [patient_details*]
    link: {
      label: "Care Variation - Hospital View"
      icon_url: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png"
      url: "/dashboards/3?Region={{ _filters['lp_demo.region'] | url_encode }}&Procedure%2FCondition={{ _filters['lp_demo.procedure_condition'] | url_encode }}&Timeframe={{ _filters['lp_demo.procedure_year'] | url_encode }}&Payer+Group={{ _filters['lp_demo.insurance_plan'] | url_encode }}&Hospitals={{ _filters['lp_demo.facility'] | url_encode }}"
    }
  }

  measure: average_cost_per_patient {
    group_label: "Measures"
    type: number
    sql: ${total_payment_cost}/${number_of_patients}  ;;
    value_format_name: usd
    drill_fields: [patient_details*]
  }

  measure: number_of_patients_with_gaps_in_care {
    view_label: "Gaps in Care"
    type: count_distinct
    sql: ${patient_id} ;;
    filters: [patient_had_gap: "Yes"]
    drill_fields: [patient_details*]
  }

  measure: number_of_patients {
    view_label: "Patient"
    type: count_distinct
    sql: ${patient_id} ;;
    drill_fields: [patient_details*]
  }


  measure: percent_of_patients_with_gaps_in_care{
    view_label: "Gaps in Care"
    type: number
    value_format_name: percent_0
    sql: ${number_of_patients_with_gaps_in_care}/${number_of_patients};;
    drill_fields: [patient_details*]
  }

  measure: average_age {
    view_label: "Patient"
    label: "Average Patient Age"
    type: average
    sql: ${patient_age} ;;
    value_format_name: decimal_0
    drill_fields: [patient_details*]
  }

  measure: average_rate_of_complications {
    group_label: "Measures"
    type: average
    sql: ${number_of_complications} ;;
    value_format_name: decimal_2
    label: "Complication Rate"
    drill_fields: [patient_details*,average_rate_of_complications]
    link: {
      label: "Care Variation - Hospital View"
      icon_url: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png"
      url: "/dashboards/3?Region={{ _filters['lp_demo.region'] | url_encode }}&Procedure%2FCondition={{ _filters['lp_demo.procedure_condition'] | url_encode }}&Timeframe={{ _filters['lp_demo.procedure_year'] | url_encode }}&Payer+Group={{ _filters['lp_demo.insurance_plan'] | url_encode }}&Hospitals={{ _filters['lp_demo.facility'] | url_encode }}"
    }
  }

  measure: total_providers{
    view_label: "Attending Physician"
    type: count_distinct
    sql: ${attending_npi} ;;
  }

  measure: average_total_or_hours {
    group_label: "Measures"
    label: "Average Patient Total OR Hours"
    type: average
    sql: ${total_or_hours} ;;
    value_format_name: decimal_0
  }

  measure: average_patient_risk_score {
    group_label: "Measures"
    label: "Average Patient Readmission Risk Score"
    type: average
    sql: ${dv_patient_risk_score} ;;
    value_format_name: percent_2
    drill_fields: [patient_details*]
  }

  measure: total_patients_screened_for_colorectal_cancer {
    view_label: "National Quality Program"
    type: count_distinct
    sql: ${patient_id} ;;
    filters: [colorectal_cancer_screening_completed: "Yes"]
    drill_fields: [patient_details*]
  }

  measure: total_patients_a1c_managed {
    view_label: "National Quality Program"
    type: count_distinct
    sql: ${patient_id} ;;
    filters: [a1c_management: "Yes"]
    drill_fields: [patient_details*]
  }

  measure: total_patients_adopted_portal {
    view_label: "National Quality Program"
    type: count_distinct
    sql: ${patient_id} ;;
    filters: [portal_adoption: "Yes"]
    drill_fields: [patient_details*]
  }

  measure: total_patients_screened_for_breast_cancer {
    view_label: "National Quality Program"
    type: count_distinct
    sql: ${patient_id} ;;
    filters: [breast_cancer_screening: "Yes"]
    drill_fields: [patient_details*]
  }

  measure: total_patients_same_day_encounter_closed {
    view_label: "National Quality Program"
    type: count_distinct
    sql: ${patient_id} ;;
    filters: [same_day_encounter_close: "Yes"]
    drill_fields: [patient_details*,total_patients_same_day_encounter_closed]
  }

  measure: average_hchaps_score {
    view_label: "National Quality Program"
    label: "Average HCAHPS Score"
    type: average
    sql: ${hchaps_score_float} ;;
    value_format_name: percent_0
  }

  measure: total_complications {
    group_label: "Measures"
    type: sum
    sql: ${number_of_complications} ;;
    drill_fields: [patient_details*]
  }

  #########Care Variation Boxplots############
  measure: ioh_median {
    view_label: "Care Variation"
    group_label: "IOH"
    type: number
    sql: APPROX_QUANTILES(${risk_adjusted_ioh_score}, 100)[OFFSET(50)] ;;
  }

  measure: ioh_first_quartile {
    view_label: "Care Variation"
    group_label: "IOH"
    type: number
    sql: APPROX_QUANTILES(${risk_adjusted_ioh_score}, 100)[OFFSET(25)] ;;
  }

  measure: ioh_third_quartile{
    view_label: "Care Variation"
    group_label: "IOH"
    type: number
    sql: APPROX_QUANTILES(${risk_adjusted_ioh_score}, 100)[OFFSET(75)] ;;
  }


  measure: ioh_min {
    view_label: "Care Variation"
    group_label: "IOH"
    type: min
    sql: ${risk_adjusted_ioh_score};;
  }

  measure: ioh_max {
    view_label: "Care Variation"
    group_label: "IOH"
    type: max
    sql: ${risk_adjusted_ioh_score};;
  }

  ############CQI Update##############

  dimension: home_health_pt {
    view_label: "Clinical Quality Improvement"
    hidden: yes
    type: yesno
    sql: ${TABLE}.home_health_pt;;
  }

  measure: avg_home_health_pt {
    label: "Home Health PT"
    view_label: "Clinical Quality Improvement"
    type: average
    sql: case when ${home_health_pt} then 1 else 0 end ;;
    value_format_name: percent_0
  }

  measure: diff_avg_home_health_pt {
    view_label: "Clinical Quality Improvement"
    type: number
    sql: ${avg_home_health_pt} - ${lp_national_averages.lp_national_average_home_health_pt} ;;
    value_format_name: percent_0
  }

  dimension: equipment_not_there {
    view_label: "Clinical Quality Improvement"
    type: yesno
    sql: ${TABLE}.equipment_not_there;;
    hidden: yes
  }

  measure: avg_equipment_not_there{
    view_label: "Clinical Quality Improvement"
    label: "Equipment Not There"
    type: average
    sql: case when ${equipment_not_there} then 1 else 0 end ;;
    value_format_name: percent_0
  }

  measure: diff_avg_equipment_not_there {
    view_label: "Clinical Quality Improvement"
    type: number
    sql: ${avg_equipment_not_there} - ${lp_national_averages.lp_national_average_equipment_not_there} ;;
    value_format_name: percent_0
  }

  dimension: waiting_for_pt_referral {
    view_label: "Clinical Quality Improvement"
    type: yesno
    sql: ${TABLE}.waiting_for_pt_referral;;
    hidden: yes
  }

  measure: avg_waiting_for_pt_referral {
    view_label: "Clinical Quality Improvement"
    label: "Waiting for PT Referral"
    type: average
    sql: case when ${waiting_for_pt_referral} then 1 else 0 end ;;
    value_format_name: percent_0
  }

  measure: diff_avg_waiting_for_pt_referral {
    view_label: "Clinical Quality Improvement"
    type: number
    sql: ${avg_waiting_for_pt_referral} - ${lp_national_averages.lp_national_average_waiting_for_pt_referral} ;;
    value_format_name: percent_0
  }

  dimension: tobacco_use_preop{
    view_label: "Clinical Quality Improvement"
    type: yesno
    sql: ${TABLE}.tobacco_use_preop;;
    hidden: yes
  }

  measure: avg_tobacco_use_preop {
    view_label: "Clinical Quality Improvement"
    label: "Tobacco Use Preop"
    type: average
    sql: case when ${tobacco_use_preop} then 1 else 0 end ;;
    value_format_name: percent_0
  }

  measure: diff_avg_tobacco_use_preop {
    view_label: "Clinical Quality Improvement"
    type: number
    sql: ${avg_tobacco_use_preop} - ${lp_national_averages.lp_national_average_tobacco_use_preop} ;;
    value_format_name: percent_0
  }

  dimension: chronic_disease_exacerbation {
    view_label: "Clinical Quality Improvement"
    type: yesno
    sql: ${TABLE}.chronic_disease_exacerbation;;

  }

  measure: avg_chronic_disease_exacerbation {
    view_label: "Clinical Quality Improvement"
    label: "Chronic Disease Exacerbation"
    type: average
    sql: case when ${chronic_disease_exacerbation} then 1 else 0 end ;;
    value_format_name: percent_0
  }

  measure: diff_avg_chronic_disease_exacerbation {
    view_label: "Clinical Quality Improvement"
    type: number
    sql: ${avg_chronic_disease_exacerbation} - ${lp_national_averages.lp_national_average_chronic_disease_exacerbation} ;;
    value_format_name: percent_0
  }

  dimension: orders_not_written {
    view_label: "Clinical Quality Improvement"
    type: yesno
    sql: ${TABLE}.orders_not_written;;
    hidden: yes
  }

  measure: avg_orders_not_written {
    view_label: "Clinical Quality Improvement"
    label: "Orders Not Written"
    type: average
    sql: case when ${orders_not_written} then 1 else 0 end ;;
    value_format_name: percent_0
  }

  measure: diff_avg_orders_not_written {
    view_label: "Clinical Quality Improvement"
    type: number
    sql: ${avg_orders_not_written} - ${lp_national_averages.lp_national_average_orders_not_written} ;;
    value_format_name: percent_0
  }

  dimension: rounds_not_done {
    view_label: "Clinical Quality Improvement"
    type: yesno
    sql: ${TABLE}.rounds_not_done;;
    hidden: yes
  }

  measure: avg_rounds_not_done {
    view_label: "Clinical Quality Improvement"
    label: "Rounds Not Done"
    type: average
    sql: case when ${rounds_not_done} then 1 else 0 end ;;
    value_format_name: percent_0
  }

  measure: diff_avg_rounds_not_done {
    view_label: "Clinical Quality Improvement"
    type: number
    sql: ${avg_rounds_not_done} - ${lp_national_averages.lp_national_average_rounds_not_done} ;;
    value_format_name: percent_0
  }

  measure: diff_avg_length_of_stay {
    view_label: "Clinical Quality Improvement"
    type: number
    sql: ${average_length_of_stay_elective} - ${lp_national.lp_national_average_length_of_stay_elective} ;;
    drill_fields: [facility,average_length_of_stay_elective,avg_home_health_pt,avg_equipment_not_there,avg_waiting_for_pt_referral,avg_tobacco_use_preop,avg_chronic_disease_exacerbation,avg_orders_not_written,avg_rounds_not_done]
  }

  measure: avg_los_pre_intervention {
    label: "Average Length of Stay Pre Intervention (Days)"
    view_label: "Clinical Quality Improvement"
    filters: [got_intervention: "No"]
    type: average
    sql: ${iv_1_los} ;;
    value_format_name: decimal_2
  }

  measure: avg_los_current {
    label: "Average Current Length of Stay (Days)"
    view_label: "Clinical Quality Improvement"
    type: average
    sql: case when ${procedure_date} > '2022-01-01' then ${iv_1_los} else null end ;;
    value_format_name: decimal_2
  }

  measure: avg_los_diff_percent {
    label: "Percent Change LOS"
    type: number
    view_label: "Clinical Quality Improvement"
    sql: (${avg_los_current}-${avg_los_pre_intervention})/${avg_los_pre_intervention} ;;
    value_format_name: percent_2
  }

  measure: avg_cost_pre_intervention {
    label: "Average Cost Pre Intervention"
    view_label: "Clinical Quality Improvement"
    filters: [got_intervention: "No"]
    type: average
    sql: ${cost} ;;
    value_format_name: usd
  }

  measure: avg_cost_current {
    label: "Average Current Cost"
    view_label: "Clinical Quality Improvement"
    type: average
    sql: case when ${procedure_date} > '2022-01-01' then ${cost} else null end ;;
    value_format_name: usd
  }

  measure: avg_cost_diff_percent {
    label: "Percent Change Cost"
    type: number
    view_label: "Clinical Quality Improvement"
    sql: (${avg_cost_current}-${avg_cost_pre_intervention})/${avg_cost_pre_intervention} ;;
    value_format_name: percent_2
  }

  measure: rate_of_complications {
    group_label: "Measures"
    type: average
    sql: case when ${number_of_complications}>0 then 1 else 0 end ;;
    value_format_name: decimal_2
    drill_fields: [variations_in_care_details*]

  }

  parameter: care_metric_picker {
    description: "Use with care variation comparision"
    view_label: "Care Variation"
    label: "Care Metric Picker"
    type: unquoted
    allowed_value: {
      label: "Rate of Complication"
      value: "average_rate_of_complications"
    }
    allowed_value: {
      label: "Rate of Readmission"
      value: "average_readmission_post_procedure"
    }
    allowed_value: {
      label: "Rate of serious complication"
      value: "average_rate_of_serious_complications"
    }
  }


  parameter: cqi_metric_picker {
    description: "Use with the CQI Metric measure"
    view_label: "Clinical Quality Improvement"
    label: "CQI Metric Picker"
    type: unquoted
    allowed_value: {
      label: "Home Health PT"
      value: "diff_avg_home_health_pt"
    }
    allowed_value: {
      label: "Equipment Not There"
      value: "diff_avg_equipment_not_there"
    }
    allowed_value: {
      label: "Waiting for PT Referral"
      value: "diff_avg_waiting_for_pt_referral"
    }
    allowed_value: {
      label: "Tobacco Use Preop"
      value: "diff_avg_tobacco_use_preop"
    }
    allowed_value: {
      label: "Chronic Disease Exacerbation"
      value: "diff_avg_chronic_disease_exacerbation"
    }
    allowed_value: {
      label: "Orders Not Written"
      value: "diff_avg_orders_not_written"
    }
    allowed_value: {
      label: "Rounds Not Done"
      value: "diff_avg_rounds_not_done"
    }
  }

  measure: cqi_metric {
    label: "CQI Metric"
    view_label: "Clinical Quality Improvement"
    label_from_parameter: cqi_metric_picker
    value_format_name: percent_1
    type: number
    sql: {% if cqi_metric_picker._parameter_value == 'diff_avg_home_health_pt' %}
            ${diff_avg_home_health_pt}
          {% elsif cqi_metric_picker._parameter_value == 'diff_avg_equipment_not_there' %}
            ${diff_avg_equipment_not_there}
          {% elsif cqi_metric_picker._parameter_value == 'diff_avg_waiting_for_pt_referral' %}
            ${diff_avg_waiting_for_pt_referral}
          {% elsif cqi_metric_picker._parameter_value == 'diff_avg_tobacco_use_preop' %}
            ${diff_avg_tobacco_use_preop}
          {% elsif cqi_metric_picker._parameter_value == 'diff_avg_chronic_disease_exacerbation' %}
            ${diff_avg_chronic_disease_exacerbation}
          {% elsif cqi_metric_picker._parameter_value == 'diff_avg_orders_not_written' %}
            ${diff_avg_orders_not_written}
          {% elsif cqi_metric_picker._parameter_value == 'diff_avg_rounds_not_done' %}
            ${diff_avg_rounds_not_done}
          {% endif %};;
  }

  measure: cqi_metric_original_rate {
    label: "CQI Metric Original Rate"
    view_label: "Clinical Quality Improvement"
    label_from_parameter: cqi_metric_picker
    value_format_name: percent_1
    sql: {% if cqi_metric_picker._parameter_value == 'diff_avg_home_health_pt' %}
            ${avg_home_health_pt}
          {% elsif cqi_metric_picker._parameter_value == 'diff_avg_equipment_not_there' %}
            ${avg_equipment_not_there}
          {% elsif cqi_metric_picker._parameter_value == 'diff_avg_waiting_for_pt_referral' %}
            ${avg_waiting_for_pt_referral}
          {% elsif cqi_metric_picker._parameter_value == 'diff_avg_tobacco_use_preop' %}
            ${avg_tobacco_use_preop}
          {% elsif cqi_metric_picker._parameter_value == 'diff_avg_chronic_disease_exacerbation' %}
            ${avg_chronic_disease_exacerbation}
          {% elsif cqi_metric_picker._parameter_value == 'diff_avg_orders_not_written' %}
            ${avg_orders_not_written}
          {% elsif cqi_metric_picker._parameter_value == 'diff_avg_rounds_not_done' %}
            ${avg_rounds_not_done}
          {% endif %};;
  }

  dimension: intervention_target {
    view_label: "Clinical Quality Improvement"
    type: string
    sql: ${TABLE}.intervention_target ;;
  }

  dimension_group: intervention_start {
    view_label: "Clinical Quality Improvement"
    type: time
    datatype: date
    timeframes: [raw, date, week, month, month_name, year]
    sql: ${TABLE}.intervention_start_date ;;
  }

  dimension_group: intervention_evaluation {
    view_label: "Clinical Quality Improvement"
    type: time
    datatype: date
    timeframes: [raw, date, week, month, month_name, year]
    sql: ${TABLE}.intervention_evaluation_date ;;
  }

  dimension: intervention_type {
    view_label: "Clinical Quality Improvement"
    type: string
    sql: ${TABLE}.intervention_type ;;
  }

  dimension: got_intervention {
    view_label: "Clinical Quality Improvement"
    type: yesno
    sql: ${TABLE}.got_intervention ;;
  }

  dimension: intervention_status {
    view_label: "Clinical Quality Improvement"
    type: string
    sql: ${TABLE}.intervention_status ;;
  }

  dimension: most_recent_intervention {
    view_label: "Clinical Quality Improvement"
    type: yesno
    sql: ${procedure_date} = ${intervention_most_recent.max_procedure_date} ;;
  }

  dimension: gets_intervention_eventually {
    view_label: "Clinical Quality Improvement"
    type: yesno
    sql: ${TABLE}.gets_intervention_eventually ;;
  }


## ---------------------------- Sets ---------------------------- ##

  set: patient_details {
    fields: [patient_name
      , patient_age
      , insurance_plan
      , total_high_risk_patients
      ,total_number_of_gaps_in_care
      ,total_complications
      , average_cost_per_patient]
  }

  set: gaps_in_care_details {
    fields: [insurance_plan
      , city
      , state_code
      , average_antibiotic_administration
      , average_length_of_stay_elective
      , average_cost_per_patient]
  }

  set: variations_in_care_details {
    fields: [region
      ,state_code
      ,facility]
  }

  ##--------------parameter----------------------------##
  parameter: measure_param {
    type: unquoted
    allowed_value: {
      label: "Facility Average Readmission Rate"
      value: "readmit_rate"
    }
    allowed_value: {
      label: "Risk Adjusted IOH Scores"
      value: "risk_adjusted_ioh_score"
    }
  }

  parameter: condition_param {
    type: unquoted
    allowed_value: {
      label: "Joint Replacement"
      value: "Joint_Replacement"
    }
    allowed_value: {
      label: "Coronary Artery Bypass"
      value: "Coronary_Artery_Bypass"
    }
  }


  dimension: dynamic_title{
    type: string
    label_from_parameter: measure_param
    sql: {% if measure_param._parameter_value == 'readmit_rate' %}
            "Facility Average Readmission Rate"
          {% elsif measure_param._parameter_value ==  'risk_adjusted_ioh_score' %}
            "Risk Adjusted IOH Scores"
          {% endif %} ;;

  }

  measure: dynamic_min {
    type: min
    sql: {% if measure_param._parameter_value == 'readmit_rate' %}
            ${lp_facility_averages.readmit_rate}
          {% elsif measure_param._parameter_value ==  'risk_adjusted_ioh_score' %}
            ${TABLE}.{% parameter measure_param %}
          {% endif %} ;;

  }

  measure: dynamic_max {
    type: max
    sql: {% if measure_param._parameter_value == 'readmit_rate' %}
            ${lp_facility_averages.readmit_rate}
          {% elsif measure_param._parameter_value ==  'risk_adjusted_ioh_score' %}
            ${TABLE}.{% parameter measure_param %}
          {% endif %} ;;

  }

  measure: dynamic_first_quartile {
    type: number
    sql: {% if measure_param._parameter_value == 'readmit_rate' %}
             APPROX_QUANTILES(${lp_facility_averages.readmit_rate}, 100)[OFFSET(25)]
          {% elsif measure_param._parameter_value ==  'risk_adjusted_ioh_score' %}
             APPROX_QUANTILES(${TABLE}.{% parameter measure_param %} , 100)[OFFSET(25)]
          {% endif %} ;;

  }

  measure: dynamic_third_quartile {
    type: number
    sql: {% if measure_param._parameter_value == 'readmit_rate' %}
             APPROX_QUANTILES(${lp_facility_averages.readmit_rate}, 100)[OFFSET(75)]
          {% elsif measure_param._parameter_value ==  'risk_adjusted_ioh_score' %}
             APPROX_QUANTILES(${TABLE}.{% parameter measure_param %} , 100)[OFFSET(75)]
          {% endif %} ;;

  }

  measure: dynamic_median {
    type: number
    sql: {% if measure_param._parameter_value == 'readmit_rate' %}
             APPROX_QUANTILES(${lp_facility_averages.readmit_rate}, 100)[OFFSET(50)]
          {% elsif measure_param._parameter_value ==  'risk_adjusted_ioh_score' %}
             APPROX_QUANTILES(${TABLE}.{% parameter measure_param %} , 100)[OFFSET(50)]
          {% endif %} ;;

  }

  measure: care_metric {
    view_label: "Care Variation"
    label_from_parameter: care_metric_picker
    value_format_name: decimal_2
    type: number
    sql:  {% if lp_demo.care_metric_picker._parameter_value == 'average_rate_of_complications' %}
            ${average_rate_of_complications}
          {% elsif lp_demo.care_metric_picker._parameter_value == 'average_readmission_post_procedure' %}
            ${average_readmission_post_procedure}
          {% elsif lp_demo.care_metric_picker._parameter_value == 'average_rate_of_serious_complications' %}
            ${average_rate_of_serious_complications}
          {% endif %};;
    drill_fields: [patient_details*, gaps_in_care_details*]
  }




}
