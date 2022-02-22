# The name of this view in Looker is "Lifepoint Demo"
view: lifepoint {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `lifepoint_demo.lifepoint_demo`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "A1c Management" in Explore.

  #----------------- patient characteristics------------------#

  dimension: patient_id {
    view_label: "Patient"
    type: number
    sql: ${TABLE}.Patient_ID ;;
  }

  dimension: patient_age {
    view_label: "Patient"
    type: number
    sql: ${TABLE}.Patient_Age ;;
  }


  dimension_group: patient_dob {
    view_label: "Patient"
    group_label: "Patient Date for Birth"
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

  dimension: patient_gender {
    view_label: "Patient"
    type: string
    sql: ${TABLE}.Patient_Gender ;;
  }

  dimension: patient_name_first {
    view_label: "Patient"
    group_label: "Patient Name"
    group_item_label: "First Name"
    type: string
    sql: ${TABLE}.Patient_Name_First ;;
  }

  dimension: patient_name_last {
    view_label: "Patient"
    group_label: "Patient Name"
    group_item_label: "Last Name"
    type: string
    sql: ${TABLE}.Patient_Name_Last ;;
  }

  dimension: patient_name {
    view_label: "Patient"
    group_label: "Patient Name"
    group_item_label: "Full Name"
    type: string
    sql: ${patient_name_last}||','||${patient_name_first} ;;
  }


  dimension: patient_race {
    view_label: "Patient"
    type: string
    sql: ${TABLE}.Patient_Race ;;
  }
  #------------------------------------------------------------#

  dimension: patient_died {
    type: yesno
    sql: ${TABLE}.Patient_Died ;;
  }


  dimension: patient_readmit {
    type: yesno
    sql: ${TABLE}.Patient_Readmit ;;
  }

  dimension: a1c_management {
    type: yesno
    sql: ${TABLE}.A1c_Management ;;
  }

  #--------------------Physician------------------------------------#

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
    group_item_label: "Physician ID"
    type: number
    sql: ${TABLE}.Attending_NPI ;;
  }

 #--------------------------------------------------------#
  dimension: average_daily_steps_immediately_after_operation {
    type: number
    sql: ${TABLE}.Average_Daily_Steps_Immediately_After_Operation ;;
  }

  dimension: breast_cancer_screening {
    type: yesno
    sql: ${TABLE}.breast_cancer_screening ;;
  }

  dimension: chronic_disease_exacerbation {
    type: yesno
    sql: ${TABLE}.Chronic_Disease_Exacerbation ;;
  }

  dimension: colorectal_cancer_screening_completed {
    type: yesno
    sql: ${TABLE}.Colorectal_cancer_screening_completed ;;
  }


   #--------------------Location------------------------------------#
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

#-----------------------------------------------#
  dimension: dv_patient_risk_score {
    label: "Readmission Risk Score"
    type: number
    sql: ${TABLE}.DV_Patient_Risk_Score ;;
  }

  measure: avg_readmission_risk_score {
    label: "Avg Readmission Risk Score"
    type: average
    sql: ${dv_patient_risk_score} ;;
  }

  #-------------------facility----------------------------#

  dimension: equipment_not_there {
    type: yesno
    sql: ${TABLE}.Equipment_Not_There ;;
  }

  dimension: facility {
    view_label: "Facility"
    type: string
    sql: ${TABLE}.facility ;;
  }

  dimension: facility_latitude {
    view_label: "Facility"
    type: number
    sql: ${TABLE}.facility_latitude ;;
  }

  dimension: facility_longitude {
    view_label: "Facility"
    type: number
    sql: ${TABLE}.facility_longitude ;;
  }

  dimension: facility_geo_location {
    view_label: "Facility"
    type: location
    sql_latitude: ${facility_latitude} ;;
    sql_longitude: ${facility_longitude} ;;
  }

 #----------------------------------------#

  dimension: got_intervention {
    type: yesno
    sql: ${TABLE}.Got_Intervention ;;
  }

  dimension: has_cancer {
    group_label: "comorbidity"
    type: yesno
    sql: ${TABLE}.Has_Cancer ;;
  }

  dimension: has_congestive_heart_failure {
    group_label: "comorbidity"
    type: yesno
    sql: ${TABLE}.Has_Congestive_Heart_Failure ;;
  }

  dimension: has_copd {
    group_label: "comorbidity"
    type: yesno
    sql: ${TABLE}.Has_COPD ;;
  }

  dimension: has_diabetes {
    group_label: "comorbidity"
    type: yesno
    sql: ${TABLE}.Has_Diabetes ;;
  }

  dimension: has_obesity {
    group_label: "comorbidity"
    type: yesno
    sql: ${TABLE}.Has_Obesity ;;
  }

  dimension: hchaps_score {
    type: number
    sql: ${TABLE}.HCHAPS_Score ;;
  }

  dimension: hchaps_score_met {
    type: yesno
    sql: ${TABLE}.HCHAPS_Score_Met ;;
  }

  dimension: home_health_pt {
    type: yesno
    sql: ${TABLE}.Home_Health_PT ;;
  }

  dimension: hospital_discharge_disposition {
    type: string
    sql: ${TABLE}.Hospital_Discharge_Disposition ;;
  }

  dimension: insurance_plan {
    type: string
    sql: ${TABLE}.Insurance_Plan ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: intervention_evaluation {
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
    sql: ${TABLE}.Intervention_Evaluation_Date ;;
  }

  dimension_group: intervention_start {
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
    sql: ${TABLE}.Intervention_Start_Date ;;
  }

  dimension: intervention_status {
    type: string
    sql: ${TABLE}.Intervention_Status ;;
  }

  dimension: intervention_target {
    type: string
    sql: ${TABLE}.Intervention_Target ;;
  }

  dimension: intervention_type {
    type: string
    sql: ${TABLE}.Intervention_Type ;;
  }

  dimension: iv_10_tjr_bundled_pay__for_bpci_ {
    type: number
    sql: ${TABLE}.IV_10_TJR_Bundled_Pay__For_BPCI_ ;;
  }

  dimension: iv_11_pna_sceen {
    type: yesno
    sql: ${TABLE}.IV_11_PNA_Sceen ;;
  }

  dimension: iv_12_chf_screen {
    type: yesno
    sql: ${TABLE}.IV_12_CHF_Screen ;;
  }

  dimension: iv_13_copd_screen {
    type: yesno
    sql: ${TABLE}.IV_13_COPD_Screen ;;
  }

  dimension: iv_14_copd_pulmonary_diagnostic {
    type: yesno
    sql: ${TABLE}.IV_14_COPD_Pulmonary_Diagnostic ;;
  }

  dimension: iv_15_copd_smoking_and_smoking_cessation {
    type: yesno
    sql: ${TABLE}.IV_15_COPD_Smoking_and_smoking_cessation ;;
  }

  dimension: iv_16_copd_medical_management {
    type: yesno
    sql: ${TABLE}.IV_16_COPD_Medical_management ;;
  }

  dimension: iv_17_sepsis_screen {
    type: yesno
    sql: ${TABLE}.IV_17_Sepsis_Screen ;;
  }

  dimension: iv_1_los {
    type: number
    sql: ${TABLE}.IV_1_LOS ;;
  }

  dimension: iv_2_type_of_antibiotic {
    type: string
    sql: ${TABLE}.IV_2_Type_of_Antibiotic ;;
  }

  dimension: iv_3_time_to_antibiotic_within_one_hour {
    type: yesno
    sql: ${TABLE}.IV_3_Time_to_Antibiotic_Within_One_Hour ;;
  }

  dimension: iv_4_escalation_post_op_antibiotic_needed {
    type: yesno
    sql: ${TABLE}.IV_4_Escalation_Post_op_antibiotic_needed ;;
  }

  dimension: iv_5_blood_cultures {
    type: yesno
    sql: ${TABLE}.IV_5_Blood_cultures ;;
  }

  dimension: iv_6_vaccination {
    type: yesno
    sql: ${TABLE}.IV_6_Vaccination ;;
  }

  dimension: iv_7_tjr_implant_type {
    type: string
    sql: ${TABLE}.IV_7_TJR_Implant_Type ;;
  }

  dimension: iv_8_tjr_preop {
    type: yesno
    sql: ${TABLE}.IV_8_TJR_Preop ;;
  }

  dimension: iv_9_tjr_blood_clot {
    type: yesno
    sql: ${TABLE}.IV_9_TJR_Blood_Clot ;;
  }

  dimension: me_access {
    type: number
    sql: ${TABLE}.ME_Access ;;
  }

  dimension: me_adherence_to_testing {
    type: number
    sql: ${TABLE}.ME_Adherence_to_Testing ;;
  }

  dimension: me_adherence_to_treatment {
    type: number
    sql: ${TABLE}.ME_Adherence_to_Treatment ;;
  }

  dimension: me_diagnosis {
    type: number
    sql: ${TABLE}.ME_Diagnosis ;;
  }

  dimension: me_diagnostic_testing_process {
    type: number
    sql: ${TABLE}.ME_Diagnostic_Testing_Process ;;
  }

  dimension: me_potential_health_concern {
    type: number
    sql: ${TABLE}.ME_Potential_Health_Concern ;;
  }

  dimension: me_problem_recognition {
    type: number
    sql: ${TABLE}.ME_Problem_Recognition ;;
  }

  dimension: me_response_to_treatment {
    type: number
    sql: ${TABLE}.ME_Response_to_Treatment ;;
  }

  dimension: me_treatment_or_recommendation_to_treatment {
    type: number
    sql: ${TABLE}.ME_Treatment_or_Recommendation_to_Treatment ;;
  }

  dimension: number_of_complications {
    type: number
    sql: ${TABLE}.Number_of_Complications ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_number_of_complications {
    type: sum
    sql: ${number_of_complications} ;;
  }

  measure: average_number_of_complications {
    type: average
    sql: ${number_of_complications} ;;
  }

  dimension: number_of_gaps_in_care {
    type: number
    sql: ${TABLE}.Number_of_Gaps_in_Care ;;
  }

  dimension: number_of_serious_complications {
    type: number
    sql: ${TABLE}.Number_of_Serious_Complications ;;
  }

  dimension: orders_not_written {
    type: yesno
    sql: ${TABLE}.Orders_Not_Written ;;
  }



  dimension: portal_adoption {
    type: yesno
    sql: ${TABLE}.Portal_adoption ;;
  }

  dimension: post_op_pain_management {
    type: string
    sql: ${TABLE}.Post_Op_Pain_Management ;;
  }

  dimension_group: procedure {
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
    sql: ${TABLE}.Procedure_Date ;;
  }

  dimension: radiology_service_used {
    type: string
    sql: ${TABLE}.Radiology_Service_Used ;;
  }

  dimension: referred_in_network {
    type: yesno
    sql: ${TABLE}.Referred_in_Network ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: risk_adjusted_ioh_score {
    type: number
    sql: ${TABLE}.Risk_adjusted_IOH_Score ;;
  }

  dimension: rounds_not_done {
    type: yesno
    sql: ${TABLE}.Rounds_Not_Done ;;
  }

  dimension: same_day_encounter_close {
    type: yesno
    sql: ${TABLE}.same_day_encounter_close ;;
  }

  dimension: state_code {
    type: string
    sql: ${TABLE}.state_code ;;
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.state_name ;;
  }

  dimension: surgery_elective {
    type: yesno
    sql: ${TABLE}.Surgery_Elective ;;
  }

  dimension: surgical_discharge_disposition {
    type: string
    sql: ${TABLE}.Surgical_Discharge_Disposition ;;
  }

  dimension: tobacco_use_preop {
    type: yesno
    sql: ${TABLE}.Tobacco_Use_Preop ;;
  }

  dimension: total_cost {
    type: number
    sql: ${TABLE}.Total_Cost ;;
  }

  dimension: total_or_hours {
    type: number
    sql: ${TABLE}.Total_OR_Hours ;;
  }

  dimension: unplanned_readmit {
    type: yesno
    sql: ${TABLE}.Unplanned_Readmit ;;
  }

  dimension: unplanned_readmit_reason {
    type: string
    sql: ${TABLE}.Unplanned_Readmit_Reason ;;
  }

  dimension: waiting_for_pt_referral {
    type: yesno
    sql: ${TABLE}.Waiting_for_PT_Referral ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  #------------------measure----------------------#

  measure: count {
    type: count
    drill_fields: [state_name]
  }

  measure: number_of_patients{
    view_label: "Patient"
    type: count_distinct
    sql: ${patient_id} ;;
    drill_fields: [patient_details*]
  }

  #--------------------set---------------------------#
  set: patient_details {
    fields: [patient_id,
      patient_name,
      patient_age
      ]
  }



}
