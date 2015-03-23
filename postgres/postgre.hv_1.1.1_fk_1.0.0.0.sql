
--Load Script

set search_path=healthviews,omni;
--\echo Creating table 't_dim_time'...
CREATE TABLE "t_dim_time" ( 
           "time_of_day" TIME NOT NULL
          ,"am_pm" CHARACTER VARYING(2)
          ,"hour_24" INTEGER
          ,"hour_12" INTEGER
          ,"shift_nbr" INTEGER
          ,"shift_name" CHARACTER VARYING(100)
)
;
--\echo Creating table 't_dim_date'...
CREATE TABLE "t_dim_date" ( 
           "calendar_date" DATE NOT NULL
          ,"calendar_date_nbr" INTEGER
          ,"calendar_yr_month_nbr" INTEGER
          ,"day_of_week_nbr" INTEGER
          ,"day_of_week_full_name" CHARACTER VARYING(10)
          ,"day_of_week_short_name" CHARACTER VARYING(3)
          ,"calendar_week" INTEGER
          ,"calendar_month" INTEGER
          ,"calendar_month_full_name" CHARACTER VARYING(10)
          ,"calendar_month_short_name" CHARACTER VARYING(3)
          ,"calendar_yr_qtr_nbr" INTEGER
          ,"calendar_qtr_nbr" INTEGER
          ,"calendar_qtr_text" CHARACTER VARYING(2)
          ,"calendar_yr" INTEGER
          ,"calendar_qtr_text_short" CHARACTER VARYING(4)
          ,"calendar_qtr_text_long" CHARACTER VARYING(7)
          ,"fiscal_week" INTEGER
          ,"fiscal_month" INTEGER
          ,"fiscal_yr_qtr_nbr" INTEGER
          ,"fiscal_qtr_nbr" INTEGER
          ,"fiscal_qtr_text" CHARACTER VARYING(2)
          ,"fiscal_yr" INTEGER
          ,"fiscal_qtr_text_short" CHARACTER VARYING(5)
          ,"fiscal_qtr_text_long" CHARACTER VARYING(8)
          ,"holiday_flag" CHARACTER(1)
          ,"weekday_flag" CHARACTER(1)
          ,"weekend_flag" CHARACTER(1)
          ,"season" CHARACTER VARYING(6)
          ,"national_event" CHARACTER(1)
          ,"days_in_month" INTEGER
)
;
--\echo Creating table 't_referral_source'...
CREATE TABLE "t_referral_source" ( 
           "referral_source_id" BIGINT NOT NULL
          ,"referral_number" CHARACTER VARYING(1000)
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"from_provider_m_id" BIGINT
          ,"from_provider_id" BIGINT
          ,"to_provider_m_id" BIGINT
          ,"to_provider_id" BIGINT
          ,"from_l0_facility_location_m_id" BIGINT
          ,"from_facility_location_id" BIGINT
          ,"to_l0_facility_location_m_id" BIGINT
          ,"to_facility_location_id" BIGINT
          ,"referral_date_time" TIMESTAMP
          ,"referral_time" TIME
          ,"referral_date" DATE
          ,"external_referral_date_time" TIMESTAMP
          ,"external_referral_time" TIME
          ,"external_referral_date" DATE
          ,"referral_status_code_id" BIGINT
          ,"referral_status_code" CHARACTER VARYING(255)
          ,"parent_referral_status_code_id" BIGINT
          ,"parent_referral_status_code" CHARACTER VARYING(255)
          ,"referral_type_code_id" BIGINT
          ,"referral_type_code" CHARACTER VARYING(255)
          ,"parent_referral_type_code_id" BIGINT
          ,"parent_referral_type_code" CHARACTER VARYING(255)
          ,"referral_class_code_id" BIGINT
          ,"referral_class_code" CHARACTER VARYING(255)
          ,"parent_referral_class_code_id" BIGINT
          ,"parent_referral_class_code" CHARACTER VARYING(255)
          ,"referral_priority_code_id" BIGINT
          ,"referral_priority_code" CHARACTER VARYING(255)
          ,"parent_referral_priority_code_id" BIGINT
          ,"parent_referral_priority_code" CHARACTER VARYING(255)
          ,"primary_reason_code_id" BIGINT
          ,"primary_reason_code" CHARACTER VARYING(255)
          ,"parent_primary_reason_code_id" BIGINT
          ,"parent_primary_reason_code" CHARACTER VARYING(255)
          ,"nonpref_provider_reason_code_id" BIGINT
          ,"nonpref_provider_reason_code" CHARACTER VARYING(255)
          ,"parent_nonpref_provider_reason_code_id" BIGINT
          ,"parent_nonpref_provider_reason_code" CHARACTER VARYING(255)
          ,"refer_to_specialty_code_id" BIGINT
          ,"refer_to_specialty_code" CHARACTER VARYING(255)
          ,"parent_refer_to_specialty_code_id" BIGINT
          ,"parent_refer_to_specialty_code" CHARACTER VARYING(255)
)
;
--\echo Creating table 't_encounter'...
CREATE TABLE "t_encounter" ( 
           "encounter_id" BIGINT NOT NULL
          ,"source_name" CHARACTER VARYING(1000)
          ,"encounter_number" CHARACTER VARYING(1000)
          ,"encounter_type_code_id" BIGINT
          ,"encounter_type_code" CHARACTER VARYING(255)
          ,"encounter_type_code_sdescr" CHARACTER VARYING(255)
          ,"parent_encounter_type_code_id" BIGINT
          ,"parent_encounter_type_code" CHARACTER VARYING(255)
          ,"parent_encounter_type_code_sdescr" CHARACTER VARYING(255)
          ,"encounter_sub_type_code_id" BIGINT
          ,"encounter_sub_type_code" CHARACTER VARYING(255)
          ,"encounter_sub_type_code_sdescr" CHARACTER VARYING(255)
          ,"parent_encounter_sub_type_code_id" BIGINT
          ,"parent_encounter_sub_type_code" CHARACTER VARYING(255)
          ,"parent_encounter_sub_type_code_sdescr" CHARACTER VARYING(255)
          ,"description" CHARACTER VARYING(1000)
          ,"episode_id" BIGINT
          ,"facility_id" BIGINT
          ,"facility_m_id" BIGINT
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"l0_organization_unit_m_id" BIGINT
          ,"service_line_id" BIGINT
          ,"patient_class_code_id" BIGINT
          ,"patient_class_code" CHARACTER VARYING(255)
          ,"patient_class_code_sdescr" CHARACTER VARYING(255)
          ,"parent_patient_class_code_id" BIGINT
          ,"parent_patient_class_code" CHARACTER VARYING(255)
          ,"parent_patient_class_code_sdescr" CHARACTER VARYING(255)
          ,"patient_type_code_id" BIGINT
          ,"patient_type_code" CHARACTER VARYING(255)
          ,"patient_type_code_sdescr" CHARACTER VARYING(255)
          ,"parent_patient_type_code_id" BIGINT
          ,"parent_patient_type_code" CHARACTER VARYING(255)
          ,"parent_patient_type_code_sdescr" CHARACTER VARYING(255)
          ,"patient_condition_code_id" BIGINT
          ,"patient_condition_code" CHARACTER VARYING(255)
          ,"patient_condition_code_sdescr" CHARACTER VARYING(255)
          ,"parent_patient_condition_code_id" BIGINT
          ,"parent_patient_condition_code" CHARACTER VARYING(255)
          ,"parent_patient_condition_code_sdescr" CHARACTER VARYING(255)
          ,"employment_related_indicator" CHARACTER VARYING(255)
          ,"hospital_service_code_id" BIGINT
          ,"hospital_service_code" CHARACTER VARYING(255)
          ,"hospital_service_code_sdescr" CHARACTER VARYING(255)
          ,"parent_hospital_service_code_id" BIGINT
          ,"parent_hospital_service_code" CHARACTER VARYING(255)
          ,"parent_hospital_service_code_sdescr" CHARACTER VARYING(255)
          ,"recurring_service_code_id" BIGINT
          ,"recurring_service_code" CHARACTER VARYING(255)
          ,"recurring_service_code_sdescr" CHARACTER VARYING(255)
          ,"parent_recurring_service_code_id" BIGINT
          ,"parent_recurring_service_code" CHARACTER VARYING(255)
          ,"parent_recurring_service_code_sdescr" CHARACTER VARYING(255)
          ,"encounter_user_code_id" BIGINT
          ,"encounter_user_code" CHARACTER VARYING(255)
          ,"encounter_user_code_sdescr" CHARACTER VARYING(255)
          ,"parent_encounter_user_code_id" BIGINT
          ,"parent_encounter_user_code" CHARACTER VARYING(255)
          ,"parent_encounter_user_code_sdescr" CHARACTER VARYING(255)
          ,"special_program_code_id" BIGINT
          ,"special_program_code" CHARACTER VARYING(255)
          ,"special_program_code_sdescr" CHARACTER VARYING(255)
          ,"parent_special_program_code_id" BIGINT
          ,"parent_special_program_code" CHARACTER VARYING(255)
          ,"parent_special_program_code_sdescr" CHARACTER VARYING(255)
          ,"admission_level_of_care_code_id" BIGINT
          ,"admission_level_of_care_code" CHARACTER VARYING(255)
          ,"admission_level_of_care_code_sdescr" CHARACTER VARYING(255)
          ,"parent_admission_level_of_care_code_id" BIGINT
          ,"parent_admission_level_of_care_code" CHARACTER VARYING(255)
          ,"parent_admission_level_of_care_code_sdescr" CHARACTER VARYING(255)
          ,"arrival_date_time" TIMESTAMP
          ,"arrival_time" TIME
          ,"arrival_date" DATE
          ,"mode_of_arrival_code_id" BIGINT
          ,"mode_of_arrival_code" CHARACTER VARYING(255)
          ,"mode_of_arrival_code_sdescr" CHARACTER VARYING(255)
          ,"parent_mode_of_arrival_code_id" BIGINT
          ,"parent_mode_of_arrival_code" CHARACTER VARYING(255)
          ,"parent_mode_of_arrival_code_sdescr" CHARACTER VARYING(255)
          ,"departure_date_time" TIMESTAMP
          ,"departure_time" TIME
          ,"departure_date" DATE
          ,"length_of_stay" FLOAT4
          ,"triage_severity_code_id" BIGINT
          ,"triage_severity_code" CHARACTER VARYING(255)
          ,"triage_severity_code_sdescr" CHARACTER VARYING(255)
          ,"parent_triage_severity_code_id" BIGINT
          ,"parent_triage_severity_code" CHARACTER VARYING(255)
          ,"parent_triage_severity_code_sdescr" CHARACTER VARYING(255)
          ,"triage_start_date_time" TIMESTAMP
          ,"triage_start_time" TIME
          ,"triage_start_date" DATE
          ,"triage_end_date_time" TIMESTAMP
          ,"triage_end_time" TIME
          ,"triage_end_date" DATE
          ,"major_diagnostic_category_code_id" BIGINT
          ,"major_diagnostic_category_code" CHARACTER VARYING(255)
          ,"major_diagnostic_category_code_sdescr" CHARACTER VARYING(255)
          ,"parent_major_diagnostic_category_code_id" BIGINT
          ,"parent_major_diagnostic_category_code" CHARACTER VARYING(255)
          ,"parent_major_diagnostic_category_code_sdescr" CHARACTER VARYING(255)
          ,"diagnosis_related_group_code_id" BIGINT
          ,"diagnosis_related_group_code" CHARACTER VARYING(255)
          ,"diagnosis_related_group_code_sdescr" CHARACTER VARYING(255)
          ,"parent_diagnosis_related_group_code_id" BIGINT
          ,"parent_diagnosis_related_group_code" CHARACTER VARYING(255)
          ,"parent_diagnosis_related_group_code_sdescr" CHARACTER VARYING(255)
          ,"risk_of_mortality_code_id" BIGINT
          ,"risk_of_mortality_code" CHARACTER VARYING(255)
          ,"risk_of_mortality_code_sdescr" CHARACTER VARYING(255)
          ,"parent_risk_of_mortality_code_id" BIGINT
          ,"parent_risk_of_mortality_code" CHARACTER VARYING(255)
          ,"parent_risk_of_mortality_code_sdescr" CHARACTER VARYING(255)
          ,"severity_of_illness_code_id" BIGINT
          ,"severity_of_illness_code" CHARACTER VARYING(255)
          ,"severity_of_illness_code_sdescr" CHARACTER VARYING(255)
          ,"parent_severity_of_illness_code_id" BIGINT
          ,"parent_severity_of_illness_code" CHARACTER VARYING(255)
          ,"parent_severity_of_illness_code_sdescr" CHARACTER VARYING(255)
          ,"diet_restriction_code_id" BIGINT
          ,"diet_restriction_code" CHARACTER VARYING(255)
          ,"diet_restriction_code_sdescr" CHARACTER VARYING(255)
          ,"parent_diet_restriction_code_id" BIGINT
          ,"parent_diet_restriction_code" CHARACTER VARYING(255)
          ,"parent_diet_restriction_code_sdescr" CHARACTER VARYING(255)
          ,"courtesy_code_id" BIGINT
          ,"courtesy_code" CHARACTER VARYING(255)
          ,"courtesy_code_sdescr" CHARACTER VARYING(255)
          ,"parent_courtesy_code_id" BIGINT
          ,"parent_courtesy_code" CHARACTER VARYING(255)
          ,"parent_courtesy_code_sdescr" CHARACTER VARYING(255)
          ,"patient_importance_code_id" BIGINT
          ,"patient_importance_code" CHARACTER VARYING(255)
          ,"patient_importance_code_sdescr" CHARACTER VARYING(255)
          ,"parent_patient_importance_code_id" BIGINT
          ,"parent_patient_importance_code" CHARACTER VARYING(255)
          ,"parent_patient_importance_code_sdescr" CHARACTER VARYING(255)
          ,"accommodation_code_id" BIGINT
          ,"accommodation_code" CHARACTER VARYING(255)
          ,"accommodation_code_sdescr" CHARACTER VARYING(255)
          ,"parent_accommodation_code_id" BIGINT
          ,"parent_accommodation_code" CHARACTER VARYING(255)
          ,"parent_accommodation_code_sdescr" CHARACTER VARYING(255)
          ,"publicity_code_id" BIGINT
          ,"publicity_code" CHARACTER VARYING(255)
          ,"publicity_code_sdescr" CHARACTER VARYING(255)
          ,"parent_publicity_code_id" BIGINT
          ,"parent_publicity_code" CHARACTER VARYING(255)
          ,"parent_publicity_code_sdescr" CHARACTER VARYING(255)
          ,"priority_code_id" BIGINT
          ,"priority_code" CHARACTER VARYING(255)
          ,"priority_code_sdescr" CHARACTER VARYING(255)
          ,"parent_priority_code_id" BIGINT
          ,"parent_priority_code" CHARACTER VARYING(255)
          ,"parent_priority_code_sdescr" CHARACTER VARYING(255)
          ,"precaution_code_id" BIGINT
          ,"precaution_code" CHARACTER VARYING(255)
          ,"precaution_code_sdescr" CHARACTER VARYING(255)
          ,"parent_precaution_code_id" BIGINT
          ,"parent_precaution_code" CHARACTER VARYING(255)
          ,"parent_precaution_code_sdescr" CHARACTER VARYING(255)
          ,"notify_clergy_code_id" BIGINT
          ,"notify_clergy_code" CHARACTER VARYING(255)
          ,"notify_clergy_code_sdescr" CHARACTER VARYING(255)
          ,"parent_notify_clergy_code_id" BIGINT
          ,"parent_notify_clergy_code" CHARACTER VARYING(255)
          ,"parent_notify_clergy_code_sdescr" CHARACTER VARYING(255)
          ,"gender" CHARACTER VARYING(255)
          ,"race" CHARACTER VARYING(255)
          ,"age" FLOAT4
          ,"age_units_code_id" BIGINT
          ,"age_units_code" CHARACTER VARYING(255)
          ,"age_units_code_sdescr" CHARACTER VARYING(255)
          ,"parent_age_units_code_id" BIGINT
          ,"parent_age_units_code" CHARACTER VARYING(255)
          ,"parent_age_units_code_sdescr" CHARACTER VARYING(255)
          ,"ambulatory_status" CHARACTER VARYING(255)
          ,"organ_donor" CHARACTER VARYING(255)
          ,"living_will" CHARACTER VARYING(255)
          ,"living_will_date" DATE
          ,"advance_directive_code_id" BIGINT
          ,"advance_directive_code" CHARACTER VARYING(255)
          ,"advance_directive_code_sdescr" CHARACTER VARYING(255)
          ,"parent_advance_directive_code_id" BIGINT
          ,"parent_advance_directive_code" CHARACTER VARYING(255)
          ,"parent_advance_directive_code_sdescr" CHARACTER VARYING(255)
          ,"adv_dir_last_verif_date_time" TIMESTAMP
          ,"adv_dir_last_verif_time" TIME
          ,"adv_dir_last_verif_date" DATE
          ,"admission_event_ind" SMALLINT
          ,"death_event_ind" SMALLINT
          ,"diagnosis_event_ind" SMALLINT
          ,"discharge_event_ind" SMALLINT
          ,"movement_event_ind" SMALLINT
          ,"observation_event_ind" SMALLINT
          ,"procedure_event_ind" SMALLINT
          ,"transfer_event_ind" SMALLINT
          ,"diagnostic_test_order_event_ind" SMALLINT
          ,"diet_order_event_ind" SMALLINT
          ,"med_supply_order_event_ind" SMALLINT
          ,"pharma_prescr_order_event_ind" SMALLINT
          ,"procedure_order_event_ind" SMALLINT
          ,"referral_order_event_ind" SMALLINT
          ,"transfusion_order_event_ind" SMALLINT
)
;
--\echo Creating table 't_appointment'...
CREATE TABLE "t_appointment" ( 
           "appointment_id" BIGINT NOT NULL
          ,"appointment_number" CHARACTER VARYING(1000)
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"provider_m_id" BIGINT
          ,"provider_id" BIGINT
          ,"facility_location_id" BIGINT
          ,"language_interpreter_code_id" BIGINT
          ,"language_interpreter_code" CHARACTER VARYING(255)
          ,"parent_language_interpreter_code_id" BIGINT
          ,"parent_language_interpreter_code" CHARACTER VARYING(255)
          ,"shadow_provider_id" BIGINT
          ,"referral_source_id" BIGINT
          ,"visit_type_code_id" BIGINT
          ,"visit_type_code" CHARACTER VARYING(255)
          ,"parent_visit_type_code_id" BIGINT
          ,"parent_visit_type_code" CHARACTER VARYING(255)
          ,"block_category_code_id" BIGINT
          ,"block_category_code" CHARACTER VARYING(255)
          ,"parent_block_category_code_id" BIGINT
          ,"parent_block_category_code" CHARACTER VARYING(255)
          ,"number_of_calls" INTEGER
          ,"number_of_changes" INTEGER
          ,"change_reason_code_id" BIGINT
          ,"change_reason_code" CHARACTER VARYING(255)
          ,"parent_change_reason_code_id" BIGINT
          ,"parent_change_reason_code" CHARACTER VARYING(255)
          ,"appointment_status_code_id" BIGINT
          ,"appointment_status_code" CHARACTER VARYING(255)
          ,"parent_appointment_status_code_id" BIGINT
          ,"parent_appointment_status_code" CHARACTER VARYING(255)
          ,"automated_reminder_status_code_id" BIGINT
          ,"automated_reminder_status_code" CHARACTER VARYING(255)
          ,"parent_automated_reminder_status_code_id" BIGINT
          ,"parent_automated_reminder_status_code" CHARACTER VARYING(255)
          ,"confirmation_status_code_id" BIGINT
          ,"confirmation_status_code" CHARACTER VARYING(255)
          ,"parent_confirmation_status_code_id" BIGINT
          ,"parent_confirmation_status_code" CHARACTER VARYING(255)
          ,"cancellation_reason_code_id" BIGINT
          ,"cancellation_reason_code" CHARACTER VARYING(255)
          ,"parent_cancellation_reason_code_id" BIGINT
          ,"parent_cancellation_reason_code" CHARACTER VARYING(255)
          ,"rescheduled_appointment_id" CHARACTER VARYING(255)
          ,"appointment_length" INTEGER
          ,"appointment_start_date_time" TIMESTAMP
          ,"appointment_start_time" TIME
          ,"appointment_start_date" DATE
          ,"appointment_end_date_time" TIMESTAMP
          ,"appointment_end_time" TIME
          ,"appointment_end_date" DATE
          ,"scheduled_from_kiosk" CHARACTER VARYING(1000)
          ,"confirmed_date_time" TIMESTAMP
          ,"confirmed_time" TIME
          ,"confirmed_date" DATE
          ,"cancelled_date_time" TIMESTAMP
          ,"cancelled_time" TIME
          ,"cancelled_date" DATE
          ,"sign_in_date_time" TIMESTAMP
          ,"sign_in_time" TIME
          ,"sign_in_date" DATE
          ,"initial_check_in_date_time" TIMESTAMP
          ,"initial_check_in_time" TIME
          ,"initial_check_in_date" DATE
          ,"check_in_kiosk" CHARACTER VARYING(1000)
          ,"check_in_date_time" TIMESTAMP
          ,"check_in_time" TIME
          ,"check_in_date" DATE
          ,"arrival_list_removal_date_time" TIMESTAMP
          ,"arrival_list_removal_time" TIME
          ,"arrival_list_removal_date" DATE
          ,"paged_date_time" TIMESTAMP
          ,"paged_time" TIME
          ,"paged_date" DATE
          ,"room_assigned_date_time" TIMESTAMP
          ,"room_assigned_time" TIME
          ,"room_assigned_date" DATE
          ,"roomed_date_time" TIMESTAMP
          ,"roomed_time" TIME
          ,"roomed_date" DATE
          ,"nurse_left_room_date_time" TIMESTAMP
          ,"nurse_left_room_time" TIME
          ,"nurse_left_room_date" DATE
          ,"provider_entered_room_date_time" TIMESTAMP
          ,"provider_entered_room_time" TIME
          ,"provider_entered_room_date" DATE
          ,"check_out_kiosk" CHARACTER VARYING(1000)
          ,"check_out_date_time" TIMESTAMP
          ,"check_out_time" TIME
          ,"check_out_date" DATE
          ,"referral_code_id" BIGINT
          ,"referral_code" CHARACTER VARYING(255)
          ,"parent_referral_code_id" BIGINT
          ,"parent_referral_code" CHARACTER VARYING(255)
          ,"overbook_code_id" BIGINT
          ,"overbook_code" CHARACTER VARYING(255)
          ,"parent_overbook_code_id" BIGINT
          ,"parent_overbook_code" CHARACTER VARYING(255)
          ,"override_code_id" BIGINT
          ,"override_code" CHARACTER VARYING(255)
          ,"parent_override_code_id" BIGINT
          ,"parent_override_code" CHARACTER VARYING(255)
          ,"time_unavailable_code_id" BIGINT
          ,"time_unavailable_code" CHARACTER VARYING(255)
          ,"parent_time_unavailable_code_id" BIGINT
          ,"parent_time_unavailable_code" CHARACTER VARYING(255)
          ,"walk_in_code_id" BIGINT
          ,"walk_in_code" CHARACTER VARYING(255)
          ,"parent_walk_in_code_id" BIGINT
          ,"parent_walk_in_code" CHARACTER VARYING(255)
          ,"sequential_appointment_code_id" BIGINT
          ,"sequential_appointment_code" CHARACTER VARYING(255)
          ,"parent_sequential_appointment_code_id" BIGINT
          ,"parent_sequential_appointment_code" CHARACTER VARYING(255)
          ,"warning_overridden_code_id" BIGINT
          ,"warning_overridden_code" CHARACTER VARYING(255)
          ,"parent_warning_overridden_code_id" BIGINT
          ,"parent_warning_overridden_code" CHARACTER VARYING(255)
          ,"same_day_code_id" BIGINT
          ,"same_day_code" CHARACTER VARYING(255)
          ,"parent_same_day_code_id" BIGINT
          ,"parent_same_day_code" CHARACTER VARYING(255)
          ,"joint_appointment_code_id" BIGINT
          ,"joint_appointment_code" CHARACTER VARYING(255)
          ,"parent_joint_appointment_code_id" BIGINT
          ,"parent_joint_appointment_code" CHARACTER VARYING(255)
          ,"cancelled_sameday_code_id" BIGINT
          ,"cancelled_sameday_code" CHARACTER VARYING(255)
          ,"parent_cancelled_sameday_code_id" BIGINT
          ,"parent_cancelled_sameday_code" CHARACTER VARYING(255)
)
;
--\echo Creating table 't_patient_wait_list'...
CREATE TABLE "t_patient_wait_list" ( 
           "patient_wait_list_id" BIGINT NOT NULL
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"referral_id" BIGINT
          ,"appointment_id" BIGINT
          ,"wait_list_status_code_id" BIGINT
          ,"wait_list_status_code" CHARACTER VARYING(255)
          ,"parent_wait_list_status_code_id" BIGINT
          ,"parent_wait_list_status_code" CHARACTER VARYING(255)
          ,"removal_reason_code_id" BIGINT
          ,"removal_reason_code" CHARACTER VARYING(255)
          ,"parent_removal_reason_code_id" BIGINT
          ,"parent_removal_reason_code" CHARACTER VARYING(255)
          ,"visit_type_code_id" BIGINT
          ,"visit_type_code" CHARACTER VARYING(255)
          ,"parent_visit_type_code_id" BIGINT
          ,"parent_visit_type_code" CHARACTER VARYING(255)
          ,"treatment_code_id" BIGINT
          ,"treatment_code" CHARACTER VARYING(255)
          ,"parent_treatment_code_id" BIGINT
          ,"parent_treatment_code" CHARACTER VARYING(255)
          ,"priority_code_id" BIGINT
          ,"priority_code" CHARACTER VARYING(255)
          ,"parent_priority_code_id" BIGINT
          ,"parent_priority_code" CHARACTER VARYING(255)
          ,"appointment_length" INTEGER
          ,"scheduling_preference" CHARACTER VARYING(1000)
          ,"prefered_begin_date_time" DATE
          ,"prefered_begin_time" TIME
          ,"prefered_begin_date" DATE
          ,"prefered_end_date_time" DATE
          ,"prefered_end_time" TIME
          ,"prefered_end_date" DATE
)
;
--\echo Creating table 't_account'...
CREATE TABLE "t_account" ( 
           "account_id" BIGINT NOT NULL
          ,"account_number" CHARACTER VARYING(1000)
          ,"account_type_code_id" BIGINT
          ,"account_type_code" CHARACTER VARYING(255)
          ,"parent_account_type_code_id" BIGINT
          ,"parent_account_type_code" CHARACTER VARYING(255)
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"financial_class_code_id" BIGINT
          ,"financial_class_code" CHARACTER VARYING(255)
          ,"parent_financial_class_code_id" BIGINT
          ,"parent_financial_class_code" CHARACTER VARYING(255)
          ,"financial_status_code_id" BIGINT
          ,"financial_status_code" CHARACTER VARYING(255)
          ,"parent_financial_status_code_id" BIGINT
          ,"parent_financial_status_code" CHARACTER VARYING(255)
          ,"account_balance_amount" FLOAT4
          ,"account_balance_currency_code_id" BIGINT
          ,"account_balance_currency_code" CHARACTER VARYING(255)
          ,"parent_account_balance_currency_code_id" BIGINT
          ,"parent_account_balance_currency_code" CHARACTER VARYING(255)
          ,"account_balance_date_time" TIMESTAMP
          ,"account_balance_time" TIME
          ,"account_balance_date" DATE
)
;
--\echo Creating table 't_claim'...
CREATE TABLE "t_claim" ( 
           "claim_id" BIGINT NOT NULL
          ,"claim_number" CHARACTER VARYING(1000)
          ,"account_id" BIGINT
          ,"pay_to_l0_facility_location_m_id" BIGINT
          ,"pay_to_location_id" BIGINT
          ,"procedure_code_id" BIGINT
          ,"procedure_code" CHARACTER VARYING(255)
          ,"parent_procedure_code_id" BIGINT
          ,"parent_procedure_code" CHARACTER VARYING(255)
          ,"diagnosis_code_id" BIGINT
          ,"diagnosis_code" CHARACTER VARYING(255)
          ,"parent_diagnosis_code_id" BIGINT
          ,"parent_diagnosis_code" CHARACTER VARYING(255)
          ,"status_code_id" BIGINT
          ,"status_code" CHARACTER VARYING(255)
          ,"parent_status_code_id" BIGINT
          ,"parent_status_code" CHARACTER VARYING(255)
          ,"denial_reason_code_id" BIGINT
          ,"denial_reason_code" CHARACTER VARYING(255)
          ,"parent_denial_reason_code_id" BIGINT
          ,"parent_denial_reason_code" CHARACTER VARYING(255)
          ,"claim_date_time" TIMESTAMP
          ,"claim_time" TIME
          ,"claim_date" DATE
          ,"amt_currency_code_id" BIGINT
          ,"amt_currency_code" CHARACTER VARYING(255)
          ,"parent_amt_currency_code_id" BIGINT
          ,"parent_amt_currency_code" CHARACTER VARYING(255)
          ,"amt_claim_amount" FLOAT4
          ,"amt_room_and_bed_amount" FLOAT4
          ,"amt_ancillary_amount" FLOAT4
          ,"amt_professional_fee_amount" FLOAT4
          ,"amt_adjustment_amount" FLOAT4
          ,"amt_paid_amount" FLOAT4
          ,"amt_copay_amount" FLOAT4
          ,"amt_coinsurance_amount" FLOAT4
          ,"amt_denied_amount" FLOAT4
          ,"patient_health_plan_id" BIGINT
)
;
--\echo Creating table 't_patient_wait_list_preference'...
CREATE TABLE "t_patient_wait_list_preference" ( 
           "patient_wait_list_preference_id" BIGINT NOT NULL
          ,"patient_wait_list_id" BIGINT
          ,"provider_m_id" BIGINT
          ,"provider_id" BIGINT
          ,"l0_facility_location_m_id" BIGINT
          ,"facility_location_id" BIGINT
)
;
--\echo Creating table 't_patient_encounter_diagnosis'...
CREATE TABLE "t_patient_encounter_diagnosis" ( 
           "patient_m_id" BIGINT
          ,"patient_id" BIGINT NOT NULL
          ,"encounter_id" BIGINT NOT NULL
          ,"encounter_date_time" TIMESTAMP NOT NULL
          ,"encounter_date" DATE
          ,"encounter_time" TIME
          ,"d001" INTEGER DEFAULT 0 NOT NULL
          ,"d002" INTEGER DEFAULT 0 NOT NULL
          ,"d003" INTEGER DEFAULT 0 NOT NULL
          ,"d004" INTEGER DEFAULT 0 NOT NULL
          ,"d005" INTEGER DEFAULT 0 NOT NULL
          ,"d006" INTEGER DEFAULT 0 NOT NULL
          ,"d007" INTEGER DEFAULT 0 NOT NULL
          ,"d008" INTEGER DEFAULT 0 NOT NULL
          ,"d009" INTEGER DEFAULT 0 NOT NULL
          ,"d010" INTEGER DEFAULT 0 NOT NULL
          ,"d011" INTEGER DEFAULT 0 NOT NULL
          ,"d012" INTEGER DEFAULT 0 NOT NULL
          ,"d013" INTEGER DEFAULT 0 NOT NULL
          ,"d014" INTEGER DEFAULT 0 NOT NULL
          ,"d015" INTEGER DEFAULT 0 NOT NULL
          ,"d016" INTEGER DEFAULT 0 NOT NULL
          ,"d017" INTEGER DEFAULT 0 NOT NULL
          ,"d018" INTEGER DEFAULT 0 NOT NULL
          ,"d019" INTEGER DEFAULT 0 NOT NULL
          ,"d021" INTEGER DEFAULT 0 NOT NULL
          ,"d022" INTEGER DEFAULT 0 NOT NULL
          ,"d023" INTEGER DEFAULT 0 NOT NULL
          ,"d024" INTEGER DEFAULT 0 NOT NULL
          ,"d025" INTEGER DEFAULT 0 NOT NULL
          ,"d026" INTEGER DEFAULT 0 NOT NULL
          ,"d027" INTEGER DEFAULT 0 NOT NULL
          ,"d028" INTEGER DEFAULT 0 NOT NULL
          ,"d029" INTEGER DEFAULT 0 NOT NULL
          ,"d030" INTEGER DEFAULT 0 NOT NULL
          ,"d031" INTEGER DEFAULT 0 NOT NULL
          ,"d032" INTEGER DEFAULT 0 NOT NULL
          ,"d033" INTEGER DEFAULT 0 NOT NULL
          ,"d034" INTEGER DEFAULT 0 NOT NULL
          ,"d035" INTEGER DEFAULT 0 NOT NULL
          ,"d036" INTEGER DEFAULT 0 NOT NULL
          ,"d037" INTEGER DEFAULT 0 NOT NULL
          ,"d038" INTEGER DEFAULT 0 NOT NULL
          ,"d039" INTEGER DEFAULT 0 NOT NULL
          ,"d040" INTEGER DEFAULT 0 NOT NULL
          ,"d041" INTEGER DEFAULT 0 NOT NULL
          ,"d042" INTEGER DEFAULT 0 NOT NULL
          ,"d043" INTEGER DEFAULT 0 NOT NULL
          ,"d044" INTEGER DEFAULT 0 NOT NULL
          ,"d045" INTEGER DEFAULT 0 NOT NULL
          ,"d046" INTEGER DEFAULT 0 NOT NULL
          ,"d047" INTEGER DEFAULT 0 NOT NULL
          ,"d048" INTEGER DEFAULT 0 NOT NULL
          ,"d049" INTEGER DEFAULT 0 NOT NULL
          ,"d050" INTEGER DEFAULT 0 NOT NULL
          ,"d051" INTEGER DEFAULT 0 NOT NULL
          ,"d052" INTEGER DEFAULT 0 NOT NULL
          ,"d053" INTEGER DEFAULT 0 NOT NULL
          ,"d054" INTEGER DEFAULT 0 NOT NULL
          ,"d055" INTEGER DEFAULT 0 NOT NULL
          ,"d056" INTEGER DEFAULT 0 NOT NULL
          ,"d057" INTEGER DEFAULT 0 NOT NULL
          ,"d058" INTEGER DEFAULT 0 NOT NULL
          ,"d059" INTEGER DEFAULT 0 NOT NULL
          ,"d060" INTEGER DEFAULT 0 NOT NULL
          ,"d061" INTEGER DEFAULT 0 NOT NULL
          ,"d062" INTEGER DEFAULT 0 NOT NULL
          ,"d063" INTEGER DEFAULT 0 NOT NULL
          ,"d064" INTEGER DEFAULT 0 NOT NULL
          ,"d065" INTEGER DEFAULT 0 NOT NULL
          ,"d066" INTEGER DEFAULT 0 NOT NULL
          ,"d067" INTEGER DEFAULT 0 NOT NULL
          ,"d068" INTEGER DEFAULT 0 NOT NULL
          ,"d069" INTEGER DEFAULT 0 NOT NULL
          ,"d070" INTEGER DEFAULT 0 NOT NULL
)
;
--\echo Creating table 't_provider_availability_slot'...
CREATE TABLE "t_provider_availability_slot" ( 
           "provider_availability_slot_id" BIGINT NOT NULL
          ,"provider_m_id" BIGINT
          ,"provider_id" BIGINT
          ,"facility_location_id" BIGINT
          ,"slot_begin_date_time" TIMESTAMP
          ,"slot_begin_time" TIME
          ,"slot_begin_date" DATE
          ,"slot_length" INTEGER
          ,"nbr_scheduled_appointments" INTEGER
          ,"orig_openings_per_slot" INTEGER
          ,"orig_nbr_overbooks_allowed" INTEGER
          ,"private_slot_code_id" BIGINT
          ,"private_slot_code" CHARACTER VARYING(255)
          ,"parent_private_slot_code_id" BIGINT
          ,"parent_private_slot_code" CHARACTER VARYING(255)
          ,"unavailable_indicator_code_id" BIGINT
          ,"unavailable_indicator_code" CHARACTER VARYING(255)
          ,"parent_unavailable_indicator_code_id" BIGINT
          ,"parent_unavailable_indicator_code" CHARACTER VARYING(255)
          ,"unavailable_reason_code_id" BIGINT
          ,"unavailable_reason_code" CHARACTER VARYING(255)
          ,"parent_unavailable_reason_code_id" BIGINT
          ,"parent_unavailable_reason_code" CHARACTER VARYING(255)
          ,"held_indicator_code_id" BIGINT
          ,"held_indicator_code" CHARACTER VARYING(255)
          ,"parent_held_indicator_code_id" BIGINT
          ,"parent_held_indicator_code" CHARACTER VARYING(255)
          ,"held_reason_code_id" BIGINT
          ,"held_reason_code" CHARACTER VARYING(255)
          ,"parent_held_reason_code_id" BIGINT
          ,"parent_held_reason_code" CHARACTER VARYING(255)
          ,"blocked_indicator_code_id" BIGINT
          ,"blocked_indicator_code" CHARACTER VARYING(255)
          ,"parent_blocked_indicator_code_id" BIGINT
          ,"parent_blocked_indicator_code" CHARACTER VARYING(255)
          ,"blocked_reason_code_id" BIGINT
          ,"blocked_reason_code" CHARACTER VARYING(255)
          ,"parent_blocked_reason_code_id" BIGINT
          ,"parent_blocked_reason_code" CHARACTER VARYING(255)
)
;
--\echo Creating table 't_provider_availability_appt'...
CREATE TABLE "t_provider_availability_appt" ( 
           "provider_availability_appt_id" BIGINT NOT NULL
          ,"provider_availability_slot_id" BIGINT
          ,"appointment_id" BIGINT
)
;
--\echo Creating table 't_specimen'...
CREATE TABLE "t_specimen" ( 
           "clinical_event_id" BIGINT NOT NULL
          ,"specimen_id" BIGINT NOT NULL
          ,"specimen_number" CHARACTER VARYING(1000)
          ,"type_code_id" BIGINT
          ,"type_code" CHARACTER VARYING(255)
          ,"parent_type_code_id" BIGINT
          ,"parent_type_code" CHARACTER VARYING(255)
          ,"type_modifier_code_id" BIGINT
          ,"type_modifier_code" CHARACTER VARYING(255)
          ,"parent_type_modifier_code_id" BIGINT
          ,"parent_type_modifier_code" CHARACTER VARYING(255)
          ,"collection_method_code_id" BIGINT
          ,"collection_method_code" CHARACTER VARYING(255)
          ,"parent_collection_method_code_id" BIGINT
          ,"parent_collection_method_code" CHARACTER VARYING(255)
          ,"source_body_site_code_id" BIGINT
          ,"source_body_site_code" CHARACTER VARYING(255)
          ,"parent_source_body_site_code_id" BIGINT
          ,"parent_source_body_site_code" CHARACTER VARYING(255)
          ,"source_body_site_modifier_code_id" BIGINT
          ,"source_body_site_modifier_code" CHARACTER VARYING(255)
          ,"parent_source_body_site_modifier_code_id" BIGINT
          ,"parent_source_body_site_modifier_code" CHARACTER VARYING(255)
          ,"collection_body_site_code_id" BIGINT
          ,"collection_body_site_code" CHARACTER VARYING(255)
          ,"parent_collection_body_site_code_id" BIGINT
          ,"parent_collection_body_site_code" CHARACTER VARYING(255)
          ,"role_code_id" BIGINT
          ,"role_code" CHARACTER VARYING(255)
          ,"parent_role_code_id" BIGINT
          ,"parent_role_code" CHARACTER VARYING(255)
          ,"collection_amount" FLOAT4
          ,"collection_amount_uom_code_id" BIGINT
          ,"collection_amount_uom_code" CHARACTER VARYING(255)
          ,"parent_collection_amount_uom_code_id" BIGINT
          ,"parent_collection_amount_uom_code" CHARACTER VARYING(255)
          ,"grouped_specimen_count" FLOAT4
          ,"description" CHARACTER VARYING(1000)
          ,"handling_code_id" BIGINT
          ,"handling_code" CHARACTER VARYING(255)
          ,"parent_handling_code_id" BIGINT
          ,"parent_handling_code" CHARACTER VARYING(255)
          ,"risk_code_id" BIGINT
          ,"risk_code" CHARACTER VARYING(255)
          ,"parent_risk_code_id" BIGINT
          ,"parent_risk_code" CHARACTER VARYING(255)
          ,"collection_date_time" TIMESTAMP
          ,"collection_time" TIME
          ,"collection_date" DATE
          ,"received_date_time" TIMESTAMP
          ,"received_time" TIME
          ,"received_date" DATE
          ,"expiration_date_time" TIMESTAMP
          ,"expiration_time" TIME
          ,"expiration_date" DATE
          ,"availability_indicator_code_id" BIGINT
          ,"availability_indicator_code" CHARACTER VARYING(255)
          ,"parent_availability_indicator_code_id" BIGINT
          ,"parent_availability_indicator_code" CHARACTER VARYING(255)
          ,"reject_reason_code_id" BIGINT
          ,"reject_reason_code" CHARACTER VARYING(255)
          ,"parent_reject_reason_code_id" BIGINT
          ,"parent_reject_reason_code" CHARACTER VARYING(255)
          ,"quality_code_id" BIGINT
          ,"quality_code" CHARACTER VARYING(255)
          ,"parent_quality_code_id" BIGINT
          ,"parent_quality_code" CHARACTER VARYING(255)
          ,"appropriateness_code_id" BIGINT
          ,"appropriateness_code" CHARACTER VARYING(255)
          ,"parent_appropriateness_code_id" BIGINT
          ,"parent_appropriateness_code" CHARACTER VARYING(255)
          ,"condition_code_id" BIGINT
          ,"condition_code" CHARACTER VARYING(255)
          ,"parent_condition_code_id" BIGINT
          ,"parent_condition_code" CHARACTER VARYING(255)
          ,"current_quantity" FLOAT4
          ,"current_quantity_uom_code_id" BIGINT
          ,"current_quantity_uom_code" CHARACTER VARYING(255)
          ,"parent_current_quantity_uom_code_id" BIGINT
          ,"parent_current_quantity_uom_code" CHARACTER VARYING(255)
          ,"nbr_specimen_containers" FLOAT4
          ,"container_type_code_id" BIGINT
          ,"container_type_code" CHARACTER VARYING(255)
          ,"parent_container_type_code_id" BIGINT
          ,"parent_container_type_code" CHARACTER VARYING(255)
          ,"container_condition_code_id" BIGINT
          ,"container_condition_code" CHARACTER VARYING(255)
          ,"parent_container_condition_code_id" BIGINT
          ,"parent_container_condition_code" CHARACTER VARYING(255)
          ,"parent_specimen_id" CHARACTER VARYING(255)
          ,"child_role_code_id" BIGINT
          ,"child_role_code" CHARACTER VARYING(255)
          ,"parent_child_role_code_id" BIGINT
          ,"parent_child_role_code" CHARACTER VARYING(255)
)
;
--\echo Creating table 't_dim_patient_master'...
CREATE TABLE "t_dim_patient_master" ( 
           "patient_m_id" BIGINT NOT NULL
          ,"patient_master_id" CHARACTER VARYING(255)
          ,"person_m_id" BIGINT
          ,"patient_type_code_id" BIGINT
          ,"patient_typecode" CHARACTER VARYING(255)
          ,"patient_type_code_sdescr" CHARACTER VARYING(255)
          ,"parent_patient_type_code_id" BIGINT
          ,"parent_patient_typecode" CHARACTER VARYING(255)
          ,"parent_patient_type_code_sdescr" CHARACTER VARYING(255)
          ,"identity_unknown_code_id" BIGINT
          ,"identity_unknowncode" CHARACTER VARYING(255)
          ,"identity_unknown_code_sdescr" CHARACTER VARYING(255)
          ,"parent_identity_unknown_code_id" BIGINT
          ,"parent_identity_unknowncode" CHARACTER VARYING(255)
          ,"parent_identity_unknown_code_sdescr" CHARACTER VARYING(255)
          ,"living_arrangement_code_id" BIGINT
          ,"living_arrangementcode" CHARACTER VARYING(255)
          ,"living_arrangement_code_sdescr" CHARACTER VARYING(255)
          ,"parent_living_arrangement_code_id" BIGINT
          ,"parent_living_arrangementcode" CHARACTER VARYING(255)
          ,"parent_living_arrangement_code_sdescr" CHARACTER VARYING(255)
          ,"living_dependancy_code_id" BIGINT
          ,"living_dependancycode" CHARACTER VARYING(255)
          ,"living_dependancy_code_sdescr" CHARACTER VARYING(255)
          ,"parent_living_dependancy_code_id" BIGINT
          ,"parent_living_dependancycode" CHARACTER VARYING(255)
          ,"parent_living_dependancy_code_sdescr" CHARACTER VARYING(255)
          ,"living_will_code_id" BIGINT
          ,"living_willcode" CHARACTER VARYING(255)
          ,"living_will_code_sdescr" CHARACTER VARYING(255)
          ,"parent_living_will_code_id" BIGINT
          ,"parent_living_willcode" CHARACTER VARYING(255)
          ,"parent_living_will_code_sdescr" CHARACTER VARYING(255)
          ,"occupation_code_id" BIGINT
          ,"occupationcode" CHARACTER VARYING(255)
          ,"occupation_code_sdescr" CHARACTER VARYING(255)
          ,"parent_occupation_code_id" BIGINT
          ,"parent_occupationcode" CHARACTER VARYING(255)
          ,"parent_occupation_code_sdescr" CHARACTER VARYING(255)
          ,"organ_donor_code_id" BIGINT
          ,"organ_donorcode" CHARACTER VARYING(255)
          ,"organ_donor_code_sdescr" CHARACTER VARYING(255)
          ,"parent_organ_donor_code_id" BIGINT
          ,"parent_organ_donorcode" CHARACTER VARYING(255)
          ,"parent_organ_donor_code_sdescr" CHARACTER VARYING(255)
          ,"family_group_identifier" CHARACTER VARYING(1000)
          ,"living_will_date" TIMESTAMP
          ,"multiple_birth_code_id" BIGINT
          ,"multiple_birthcode" CHARACTER VARYING(255)
          ,"multiple_birth_code_sdescr" CHARACTER VARYING(255)
          ,"parent_multiple_birth_code_id" BIGINT
          ,"parent_multiple_birthcode" CHARACTER VARYING(255)
          ,"parent_multiple_birth_code_sdescr" CHARACTER VARYING(255)
          ,"multiple_birth_total" INTEGER
          ,"birth_order" INTEGER
          ,"mychart_signedup_date" TIMESTAMP
          ,"adopted_code_id" BIGINT
          ,"adoptedcode" CHARACTER VARYING(255)
          ,"adopted_code_sdescr" CHARACTER VARYING(255)
          ,"parent_adopted_code_id" BIGINT
          ,"bad_debt_code_id" BIGINT
          ,"bad_debtcode" CHARACTER VARYING(255)
          ,"bad_debt_code_sdescr" CHARACTER VARYING(255)
          ,"parent_bad_debt_code_id" BIGINT
          ,"disability_code_id" BIGINT
          ,"disabilitycode" CHARACTER VARYING(255)
          ,"disability_code_sdescr" CHARACTER VARYING(255)
          ,"parent_disability_code_id" BIGINT
          ,"parent_disabilitycode" CHARACTER VARYING(255)
          ,"parent_disability_code_sdescr" CHARACTER VARYING(255)
          ,"disease_alert_code_id" BIGINT
          ,"disease_alertcode" CHARACTER VARYING(255)
          ,"disease_alert_code_sdescr" CHARACTER VARYING(255)
          ,"parent_disease_alert_code_id" BIGINT
          ,"parent_disease_alertcode" CHARACTER VARYING(255)
          ,"parent_disease_alert_code_sdescr" CHARACTER VARYING(255)
          ,"drug_allergies_code_id" BIGINT
          ,"drug_allergies_alertcode" CHARACTER VARYING(255)
          ,"drug_allergies_alert_code_sdescr" CHARACTER VARYING(255)
          ,"parent_drug_allergies_code_id" BIGINT
          ,"parent_drug_allergiescode" CHARACTER VARYING(255)
          ,"parent_drug_allergies_code_sdescr" CHARACTER VARYING(255)
          ,"foster_child_code_id" BIGINT
          ,"foster_childcode" CHARACTER VARYING(255)
          ,"foster_child_code_sdescr" CHARACTER VARYING(255)
          ,"parent_foster_child_code_id" BIGINT
          ,"parent_foster_childcode" CHARACTER VARYING(255)
          ,"parent_foster_child_code_sdescr" CHARACTER VARYING(255)
          ,"edu_level_code_id" BIGINT
          ,"edu_levelcode" CHARACTER VARYING(255)
          ,"edu_level_code_sdescr" CHARACTER VARYING(255)
          ,"parent_edu_level_code_id" BIGINT
          ,"parent_edu_levelcode" CHARACTER VARYING(255)
          ,"parent_edu_level_code_sdescr" CHARACTER VARYING(255)
          ,"edu_student_code_id" BIGINT
          ,"edu_studentcode" CHARACTER VARYING(255)
          ,"edu_student_code_sdescr" CHARACTER VARYING(255)
          ,"parent_edu_student_code_id" BIGINT
          ,"parent_edu_studentcode" CHARACTER VARYING(255)
          ,"parent_edu_student_code_sdescr" CHARACTER VARYING(255)
          ,"edu_degree_complete" CHARACTER VARYING(1000)
          ,"edu_attending_school" CHARACTER VARYING(1000)
          ,"gyn_age_at_first_pregnancy" INTEGER
          ,"gyn_age_at_menarche" INTEGER
          ,"gyn_age_at_menopause" INTEGER
          ,"gyn_expected_deliv_date" TIMESTAMP
          ,"gyn_expected_deliv_date_note" CHARACTER VARYING(1000)
          ,"gyn_expected_deliv_entry_date" TIMESTAMP
          ,"gyn_note" CHARACTER VARYING(1000)
          ,"gyn_months_breastfeeding" INTEGER
          ,"hab_alcohol_ounces" INTEGER
          ,"hab_illicit_frequency" CHARACTER VARYING(255)
          ,"hab_smoking_quit_date" TIMESTAMP
          ,"hab_smoking_start_date" TIMESTAMP
          ,"hab_tobacco_pk_per_day" INTEGER
          ,"hab_tobacco_years" INTEGER
          ,"hab_alcohol_use_code_id" BIGINT
          ,"hab_alcohol_usecode" CHARACTER VARYING(255)
          ,"hab_alcohol_use_code_sdescr" CHARACTER VARYING(255)
          ,"parent_hab_alcohol_use_code_id" BIGINT
          ,"parent_hab_alcohol_usecode" CHARACTER VARYING(255)
          ,"parent_hab_alcohol_use_code_sdescr" CHARACTER VARYING(255)
          ,"hab_use_chew_code_id" BIGINT
          ,"hab_use_chewcode" CHARACTER VARYING(255)
          ,"hab_use_chew_code_sdescr" CHARACTER VARYING(255)
          ,"parent_hab_use_chew_code_id" BIGINT
          ,"parent_hab_use_chewcode" CHARACTER VARYING(255)
          ,"parent_hab_use_chew_code_sdescr" CHARACTER VARYING(255)
          ,"hab_cigar_use_code_id" BIGINT
          ,"hab_cigar_usecode" CHARACTER VARYING(255)
          ,"hab_cigar_use_code_sdescr" CHARACTER VARYING(255)
          ,"parent_hab_cigar_use_code_id" BIGINT
          ,"parent_hab_cigar_usecode" CHARACTER VARYING(255)
          ,"parent_hab_cigar_use_code_sdescr" CHARACTER VARYING(255)
          ,"hab_cigarette_use_code_id" BIGINT
          ,"hab_cigarette_usecode" CHARACTER VARYING(255)
          ,"hab_cigarette_use_code_sdescr" CHARACTER VARYING(255)
          ,"parent_hab_cigarette_use_code_id" BIGINT
          ,"parent_hab_cigarette_usecode" CHARACTER VARYING(255)
          ,"parent_hab_cigarette_use_code_sdescr" CHARACTER VARYING(255)
          ,"hab_iv_drug_use_code_id" BIGINT
          ,"hab_iv_drug_usecode" CHARACTER VARYING(255)
          ,"hab_iv_drug_use_code_sdescr" CHARACTER VARYING(255)
          ,"parent_hab_iv_drug_use_code_id" BIGINT
          ,"parent_hab_iv_drug_usecode" CHARACTER VARYING(255)
          ,"parent_hab_iv_drug_use_code_sdescr" CHARACTER VARYING(255)
          ,"hab_illicit_drug_use_code_id" BIGINT
          ,"hab_illicit_drug_usecode" CHARACTER VARYING(255)
          ,"hab_illicit_drug_use_code_sdescr" CHARACTER VARYING(255)
          ,"parent_hab_illicit_drug_use_code_id" BIGINT
          ,"parent_hab_illicit_drug_usecode" CHARACTER VARYING(255)
          ,"parent_hab_illicit_drug_use_code_sdescr" CHARACTER VARYING(255)
          ,"hab_pipe_use_code_id" BIGINT
          ,"hab_pipe_usecode" CHARACTER VARYING(255)
          ,"hab_pipe_use_code_sdescr" CHARACTER VARYING(255)
          ,"parent_hab_pipe_use_code_id" BIGINT
          ,"parent_hab_pipe_usecode" CHARACTER VARYING(255)
          ,"parent_hab_pipe_use_code_sdescr" CHARACTER VARYING(255)
          ,"hab_snuff_use_code_id" BIGINT
          ,"hab_snuff_usecode" CHARACTER VARYING(255)
          ,"hab_snuff_use_code_sdescr" CHARACTER VARYING(255)
          ,"parent_hab_snuff_use_code_id" BIGINT
          ,"parent_hab_snuff_usecode" CHARACTER VARYING(255)
          ,"parent_hab_snuff_use_code_sdescr" CHARACTER VARYING(255)
          ,"hab_tobacco_use_code_id" BIGINT
          ,"hab_tobacco_usecode" CHARACTER VARYING(255)
          ,"hab_tobacco_use_code_sdescr" CHARACTER VARYING(255)
          ,"parent_hab_tobacco_use_code_id" BIGINT
          ,"parent_hab_tobacco_usecode" CHARACTER VARYING(255)
          ,"parent_hab_tobacco_use_code_sdescr" CHARACTER VARYING(255)
          ,"pref_provider_gender_code_id" BIGINT
          ,"pref_provider_gendercode" CHARACTER VARYING(255)
          ,"pref_provider_gender_code_sdescr" CHARACTER VARYING(255)
          ,"parent_pref_provider_gender_code_id" BIGINT
          ,"parent_pref_provider_gendercode" CHARACTER VARYING(255)
          ,"parent_pref_provider_gender_code_sdescr" CHARACTER VARYING(255)
          ,"pref_provider_language_code_id" BIGINT
          ,"pref_provider_languagecode" CHARACTER VARYING(255)
          ,"pref_provider_language_code_sdescr" CHARACTER VARYING(255)
          ,"parent_pref_provider_language_code_id" BIGINT
          ,"parent_pref_provider_languagecode" CHARACTER VARYING(255)
          ,"parent_pref_provider_language_code_sdescr" CHARACTER VARYING(255)
          ,"pref_provider_speciality_code_id" BIGINT
          ,"pref_provider_specialitycode" CHARACTER VARYING(255)
          ,"pref_provider_speciality_code_sdescr" CHARACTER VARYING(255)
          ,"parent_pref_provider_speciality_code_id" BIGINT
          ,"parent_pref_provider_specialitycode" CHARACTER VARYING(255)
          ,"parent_pref_provider_speciality_code_sdescr" CHARACTER VARYING(255)
          ,"per_protection_code_id" BIGINT
          ,"per_protectioncode" CHARACTER VARYING(255)
          ,"per_protection_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_protection_code_id" BIGINT
          ,"per_parent_protectioncode" CHARACTER VARYING(255)
          ,"per_parent_protection_code_sdescr" CHARACTER VARYING(255)
          ,"per_publicity_code_id" BIGINT
          ,"per_publicitycode" CHARACTER VARYING(255)
          ,"per_publicity_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_publicity_code_id" BIGINT
          ,"per_parent_publicitycode" CHARACTER VARYING(255)
          ,"per_parent_publicity_code_sdescr" CHARACTER VARYING(255)
          ,"per_birth_date" TIMESTAMP
          ,"per_deceased_code_id" BIGINT
          ,"per_deceasedcode" CHARACTER VARYING(255)
          ,"per_deceased_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_deceased_code_id" BIGINT
          ,"per_parent_deceasedcode" CHARACTER VARYING(255)
          ,"per_parent_deceased_code_sdescr" CHARACTER VARYING(255)
          ,"per_death_date" TIMESTAMP
          ,"per_cause_of_death" CHARACTER VARYING(1000)
          ,"per_gender_code_id" BIGINT
          ,"per_gendercode" CHARACTER VARYING(255)
          ,"per_gender_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_gender_code_id" BIGINT
          ,"per_parent_gendercode" CHARACTER VARYING(255)
          ,"per_parent_gender_code_sdescr" CHARACTER VARYING(255)
          ,"per_ethnic_group_code_id" BIGINT
          ,"per_ethnic_groupcode" CHARACTER VARYING(255)
          ,"per_ethnic_group_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_ethnic_group_code_id" BIGINT
          ,"per_parent_ethnic_groupcode" CHARACTER VARYING(255)
          ,"per_parent_ethnic_group_code_sdescr" CHARACTER VARYING(255)
          ,"per_marital_status_code_id" BIGINT
          ,"per_marital_statuscode" CHARACTER VARYING(255)
          ,"per_marital_status_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_marital_status_code_id" BIGINT
          ,"per_parent_marital_statuscode" CHARACTER VARYING(255)
          ,"per_parent_marital_status_code_sdescr" CHARACTER VARYING(255)
          ,"per_race_code_id" BIGINT
          ,"per_racecode" CHARACTER VARYING(255)
          ,"per_race_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_race_code_id" BIGINT
          ,"per_parent_racecode" CHARACTER VARYING(255)
          ,"per_parent_race_code_sdescr" CHARACTER VARYING(255)
          ,"per_citizenship_code_id" BIGINT
          ,"per_citizenshipcode" CHARACTER VARYING(255)
          ,"per_citizenship_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_citizenship_code_id" BIGINT
          ,"per_parent_citizenshipcode" CHARACTER VARYING(255)
          ,"per_parent_citizenship_code_sdescr" CHARACTER VARYING(255)
          ,"per_religion_code_id" BIGINT
          ,"per_religioncode" CHARACTER VARYING(255)
          ,"per_religion_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_religion_code_id" BIGINT
          ,"per_parent_religioncode" CHARACTER VARYING(255)
          ,"per_parent_religion_code_sdescr" CHARACTER VARYING(255)
          ,"per_place_of_worship" CHARACTER VARYING(1000)
          ,"per_mother_maiden_name" CHARACTER VARYING(1000)
          ,"per_ambulatory_status_code_id" BIGINT
          ,"per_ambulatory_statuscode" CHARACTER VARYING(255)
          ,"per_ambulatory_status_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_ambulatory_status_code_id" BIGINT
          ,"per_parent_ambulatory_statuscode" CHARACTER VARYING(255)
          ,"per_parent_ambulatory_status_code_sdescr" CHARACTER VARYING(255)
          ,"per_english_fluency_code_id" BIGINT
          ,"per_english_fluency_code" CHARACTER VARYING(255)
          ,"per_english_fluency_code_sdescr" CHARACTER VARYING(2255)
          ,"per_parent_english_fluency_code_id" BIGINT
          ,"per_parent_english_fluencycode" CHARACTER VARYING(255)
          ,"per_parent_english_fluency_code_sdescr" CHARACTER VARYING(255)
          ,"per_language_code_id" BIGINT
          ,"per_languagecode" CHARACTER VARYING(255)
          ,"per_language_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_language_code_id" BIGINT
          ,"per_parent_languagecode" CHARACTER VARYING(255)
          ,"per_parent_language_code_sdescr" CHARACTER VARYING(255)
          ,"per_intepreter_required_code_id" BIGINT
          ,"per_intepreter_requiredcode" CHARACTER VARYING(255)
          ,"per_intepreter_required_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_interpreter_required_code_id" BIGINT
          ,"per_parent_interpreter_requiredcode" CHARACTER VARYING(255)
          ,"per_parent_interpreter_required_code_sdescr" CHARACTER VARYING(255)
          ,"per_care_language_code_id" BIGINT
          ,"per_care_languagecode" CHARACTER VARYING(255)
          ,"per_care_language_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_care_language_code_id" BIGINT
          ,"per_parent_care_languagecode" CHARACTER VARYING(255)
          ,"per_parent_care_language_code_sdescr" CHARACTER VARYING(255)
          ,"per_written_language_code_id" BIGINT
          ,"per_written_languagecode" CHARACTER VARYING(255)
          ,"per_written_language_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_written_language_code_id" BIGINT
          ,"per_parent_written_languagecode" CHARACTER VARYING(255)
          ,"per_parent_written_language_code_sdescr" CHARACTER VARYING(255)
          ,"per_handicap_code_id" BIGINT
          ,"per_handicapcode" CHARACTER VARYING(255)
          ,"per_handicap_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_handicap_code_id" BIGINT
          ,"per_parent_handicapcode" CHARACTER VARYING(255)
          ,"per_parent_handicap_code_sdescr" CHARACTER VARYING(255)
          ,"per_hearing_impaired_code_id" BIGINT
          ,"per_hearing_impairedcode" CHARACTER VARYING(255)
          ,"per_hearing_impaired_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_hearing_impaired_code_id" BIGINT
          ,"per_parent_hearing_impairedcode" CHARACTER VARYING(255)
          ,"per_parent_hearing_impaired_code_sdescr" CHARACTER VARYING(255)
          ,"per_deaf_code_id" BIGINT
          ,"per_deafcode" CHARACTER VARYING(255)
          ,"per_deaf_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_deaf_code_id" BIGINT
          ,"per_parent_deafcode" CHARACTER VARYING(255)
          ,"per_parent_deaf_code_sdescr" CHARACTER VARYING(255)
          ,"per_visually_impaired_code_id" BIGINT
          ,"per_visually_impairedcode" CHARACTER VARYING(255)
          ,"per_visually_impaired_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_visually_impaired_code_id" BIGINT
          ,"per_parent_visually_impairedcode" CHARACTER VARYING(255)
          ,"per_parent_visually_impaired_code_sdescr" CHARACTER VARYING(255)
          ,"per_blind_code_id" BIGINT
          ,"per_blindcode" CHARACTER VARYING(255)
          ,"per_blind_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_blind_code_id" BIGINT
          ,"per_parent_blindcode" CHARACTER VARYING(255)
          ,"per_parent_blind_code_sdescr" CHARACTER VARYING(255)
          ,"per_mil_veteran_status_code_id" BIGINT
          ,"per_mil_veteran_statuscode" CHARACTER VARYING(255)
          ,"per_mil_veteran_status_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_mil_veteran_status_code_id" BIGINT
          ,"per_parent_mil_veteran_statuscode" CHARACTER VARYING(255)
          ,"per_parent_mil_veteran_status_code_sdescr" CHARACTER VARYING(255)
          ,"per_mil_pay_grade" CHARACTER VARYING(1000)
          ,"per_mil_unit" CHARACTER VARYING(1000)
          ,"per_mil_branch_code_id" BIGINT
          ,"per_mil_branchcode" CHARACTER VARYING(255)
          ,"per_mil_branch_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_mil_branch_code_id" BIGINT
          ,"per_parent_mil_branchcode" CHARACTER VARYING(255)
          ,"per_parent_mil_branch_code_sdescr" CHARACTER VARYING(255)
          ,"per_mil_category_code_id" BIGINT
          ,"per_mil_categorycode" CHARACTER VARYING(255)
          ,"per_mil_category_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_mil_category_code_id" BIGINT
          ,"per_parent_mil_categorycode" CHARACTER VARYING(255)
          ,"per_parent_mil_category_code_sdescr" CHARACTER VARYING(255)
          ,"per_mil_component_code_id" BIGINT
          ,"per_mil_componentcode" CHARACTER VARYING(255)
          ,"per_mil_component_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_mil_component_code_id" BIGINT
          ,"per_parent_mil_componentcode" CHARACTER VARYING(255)
          ,"per_parent_mil_component_code_sdescr" CHARACTER VARYING(255)
          ,"per_mil_rank_code_id" BIGINT
          ,"per_mil_rankcode" CHARACTER VARYING(255)
          ,"per_mil_rank_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_mil_rank_code_id" BIGINT
          ,"per_parent_mil_rankcode" CHARACTER VARYING(255)
          ,"per_parent_mil_rank_code_sdescr" CHARACTER VARYING(255)
          ,"per_address_line1" CHARACTER VARYING(1000)
          ,"per_address_line2" CHARACTER VARYING(1000)
          ,"per_address_line3" CHARACTER VARYING(1000)
          ,"per_address_line4" CHARACTER VARYING(1000)
          ,"per_city" CHARACTER VARYING(1000)
          ,"per_state_province_code_id" BIGINT
          ,"per_state_provincecode" CHARACTER VARYING(255)
          ,"per_state_province_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_state_province_code_id" BIGINT
          ,"per_parent_state_provincecode" CHARACTER VARYING(255)
          ,"per_parent_state_province_code_sdescr" CHARACTER VARYING(255)
          ,"per_postalcode" CHARACTER VARYING(255)
          ,"per_country_code_id" BIGINT
          ,"per_countrycode" CHARACTER VARYING(255)
          ,"per_country_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_country_code_id" BIGINT
          ,"per_parent_countrycode" CHARACTER VARYING(255)
          ,"per_parent_country_code_sdescr" CHARACTER VARYING(255)
          ,"per_county_region_code_id" BIGINT
          ,"per_county_regioncode" CHARACTER VARYING(255)
          ,"per_county_region_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_county_region_code_id" BIGINT
          ,"per_parent_county_regioncode" CHARACTER VARYING(255)
          ,"per_parent_county_region_code_sdescr" CHARACTER VARYING(255)
          ,"per_address_usage_comment" CHARACTER VARYING(1000)
          ,"per_full_name" CHARACTER VARYING(1000)
          ,"per_prefix" CHARACTER VARYING(1000)
          ,"per_first_name" CHARACTER VARYING(1000)
          ,"per_middle_name" CHARACTER VARYING(1000)
          ,"per_last_name" CHARACTER VARYING(1000)
          ,"per_suffix" CHARACTER VARYING(1000)
          ,"per_degree" CHARACTER VARYING(1000)
          ,"per_title" CHARACTER VARYING(1000)
)
;
--\echo Creating table 't_dim_organization_master'...
CREATE TABLE "t_dim_organization_master" ( 
           "organization_m_id" BIGINT NOT NULL
          ,"organization_type_code_id" BIGINT
          ,"organization_type_code" CHARACTER VARYING(1000)
          ,"organization_type_descr" CHARACTER VARYING(1000)
          ,"parent_organization_type_code_id" BIGINT
          ,"parent_organization_type_code" CHARACTER VARYING(1000)
          ,"parent_organization_type_descr" CHARACTER VARYING(1000)
          ,"l4_organization_unit_m_id" BIGINT
          ,"l4_organization_unit_descr" CHARACTER VARYING(1000)
          ,"l4_type_code_id" BIGINT
          ,"l4_type_code" CHARACTER VARYING(1000)
          ,"l3_organization_unit_m_id" BIGINT
          ,"l3_organization_unit_descr" CHARACTER VARYING(1000)
          ,"l3_type_code_id" BIGINT
          ,"l3_type_code" CHARACTER VARYING(1000)
          ,"l2_organization_unit_m_id" BIGINT
          ,"l2_organization_unit_descr" CHARACTER VARYING(1000)
          ,"l2_type_code_id" BIGINT
          ,"l2_type_code" CHARACTER VARYING(1000)
          ,"l1_organization_unit_m_id" BIGINT
          ,"l1_organization_unit_descr" CHARACTER VARYING(1000)
          ,"l1_type_code_id" BIGINT
          ,"l1_type_code" CHARACTER VARYING(1000)
          ,"l0_organization_unit_m_id" BIGINT NOT NULL
          ,"l0_organization_unit_descr" CHARACTER VARYING(1000)
          ,"l0_type_code_id" BIGINT
          ,"l0_type_code" CHARACTER VARYING(1000)
)
;
--\echo Creating table 't_dim_facility_master'...
CREATE TABLE "t_dim_facility_master" ( 
           "facility_m_id" BIGINT NOT NULL
          ,"facility_type_code_id" BIGINT
          ,"facility_type_code" CHARACTER VARYING(255)
          ,"facility_type_descr" CHARACTER VARYING(1000)
          ,"parent_facility_type_code_id" BIGINT
          ,"parent_facility_type_code" CHARACTER VARYING(255)
          ,"parent_facility_type_descr" CHARACTER VARYING(1000)
          ,"facility_name" CHARACTER VARYING(1000)
          ,"l4_facility_location_m_id" BIGINT
          ,"l4_facility_location_descr" CHARACTER VARYING(1000)
          ,"l4_type_code_id" BIGINT
          ,"l4_type_code" CHARACTER VARYING(255)
          ,"l4_type_code_descr" CHARACTER VARYING(1000)
          ,"l3_facility_location_m_id" BIGINT
          ,"l3_facility_location_descr" CHARACTER VARYING(1000)
          ,"l3_type_code_id" BIGINT
          ,"l3_type_code" CHARACTER VARYING(255)
          ,"l3_type_code_descr" CHARACTER VARYING(1000)
          ,"l2_facility_location_m_id" BIGINT
          ,"l2_facility_location_descr" CHARACTER VARYING(1000)
          ,"l2_type_code_id" BIGINT
          ,"l2_type_code" CHARACTER VARYING(255)
          ,"l2_type_code_descr" CHARACTER VARYING(1000)
          ,"l1_facility_location_m_id" BIGINT
          ,"l1_facility_location_descr" CHARACTER VARYING(1000)
          ,"l1_type_code_id" BIGINT
          ,"l1_type_code" CHARACTER VARYING(255)
          ,"l1_type_code_descr" CHARACTER VARYING(1000)
          ,"l0_facility_location_m_id" BIGINT NOT NULL
          ,"l0_facility_location_descr" CHARACTER VARYING(1000)
          ,"l0_type_code_id" BIGINT
          ,"l0_type_code" CHARACTER VARYING(255)
          ,"l0_type_code_descr" CHARACTER VARYING(1000)
)
;
--\echo Creating table 't_transfer_event'...
CREATE TABLE "t_transfer_event" ( 
           "clinical_event_id" BIGINT NOT NULL
          ,"source_name" CHARACTER VARYING(1000)
          ,"event_type_id" BIGINT
          ,"event_type" CHARACTER VARYING(1000)
          ,"parent_event_id" BIGINT
          ,"encounter_id" BIGINT
          ,"encounter_type_code_id" BIGINT
          ,"encounter_type_code" CHARACTER VARYING(255)
          ,"parent_encounter_type_code_id" BIGINT
          ,"parent_encounter_type_code" CHARACTER VARYING(255)
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"l0_organization_unit_m_id" BIGINT
          ,"service_line_id" BIGINT
          ,"event_date_time" TIMESTAMP
          ,"event_time" TIME
          ,"event_date" DATE
          ,"l0_facility_location_m_id" BIGINT
          ,"location_id" BIGINT
          ,"care_plan_id" BIGINT
          ,"to_location_id" BIGINT
          ,"external_to_location" CHARACTER VARYING(1000)
          ,"type_code_id" BIGINT
          ,"parent_type_code_id" BIGINT
          ,"method_code_id" BIGINT
          ,"parent_method_code_id" BIGINT
          ,"reason" CHARACTER VARYING(1000)
)
;
--\echo Creating table 't_radiology_order_event'...
CREATE TABLE "t_radiology_order_event" ( 
           "clinical_event_id" BIGINT NOT NULL
          ,"source_name" CHARACTER VARYING(1000)
          ,"event_type_id" BIGINT
          ,"event_type" CHARACTER VARYING(1000)
          ,"parent_event_id" BIGINT
          ,"encounter_id" BIGINT
          ,"encounter_type_code_id" BIGINT
          ,"encounter_type_code" CHARACTER VARYING(255)
          ,"parent_encounter_type_code_id" BIGINT
          ,"parent_encounter_type_code" CHARACTER VARYING(255)
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"l0_organization_unit_m_id" BIGINT
          ,"service_line_id" BIGINT
          ,"event_date_time" TIMESTAMP
          ,"event_time" TIME
          ,"event_date" DATE
          ,"l0_facility_location_m_id" BIGINT
          ,"location_id" BIGINT
          ,"care_plan_id" BIGINT
          ,"order_number" CHARACTER VARYING(1000)
          ,"order_type_code_id" BIGINT
          ,"parent_order_type_code_id" BIGINT
          ,"order_priority_code_id" BIGINT
          ,"parent_order_priority_code_id" BIGINT
          ,"order_reason" CHARACTER VARYING(1000)
          ,"order_outcome_status_code_id" BIGINT
          ,"parent_order_outcome_status_code_id" BIGINT
          ,"order_detail_number" CHARACTER VARYING(1000)
          ,"order_sequence_nbr" FLOAT4
          ,"order_detail_status_code_id" BIGINT
          ,"parent_order_detail_status_code_id" BIGINT
          ,"order_set_number" CHARACTER VARYING(1000)
          ,"order_set_name" CHARACTER VARYING(1000)
          ,"modality_code_id" BIGINT
          ,"parent_modality_code_id" BIGINT
          ,"body_site_code_id" BIGINT
          ,"parent_body_site_code_id" BIGINT
          ,"device_id" CHARACTER VARYING(1000)
)
;
--\echo Creating table 't_referral_order_event'...
CREATE TABLE "t_referral_order_event" ( 
           "clinical_event_id" BIGINT NOT NULL
          ,"source_name" CHARACTER VARYING(1000)
          ,"event_type_id" BIGINT
          ,"event_type" CHARACTER VARYING(1000)
          ,"parent_event_id" BIGINT
          ,"encounter_id" BIGINT
          ,"encounter_type_code_id" BIGINT
          ,"encounter_type_code" CHARACTER VARYING(255)
          ,"parent_encounter_type_code_id" BIGINT
          ,"parent_encounter_type_code" CHARACTER VARYING(255)
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"l0_organization_unit_m_id" BIGINT
          ,"service_line_id" BIGINT
          ,"event_date_time" TIMESTAMP
          ,"event_time" TIME
          ,"event_date" DATE
          ,"l0_facility_location_m_id" BIGINT
          ,"location_id" BIGINT
          ,"care_plan_id" BIGINT
          ,"order_number" CHARACTER VARYING(1000)
          ,"order_type_code_id" BIGINT
          ,"parent_order_type_code_id" BIGINT
          ,"order_priority_code_id" BIGINT
          ,"parent_order_priority_code_id" BIGINT
          ,"order_reason" CHARACTER VARYING(1000)
          ,"order_outcome_status_code_id" BIGINT
          ,"parent_order_outcome_status_code_id" BIGINT
          ,"order_detail_number" CHARACTER VARYING(1000)
          ,"order_sequence_nbr" FLOAT4
          ,"order_detail_status_code_id" BIGINT
          ,"parent_order_detail_status_code_id" BIGINT
          ,"order_set_number" CHARACTER VARYING(1000)
          ,"order_set_name" CHARACTER VARYING(1000)
          ,"refer_to_location_id" BIGINT
)
;
--\echo Creating table 't_appointment_notification'...
CREATE TABLE "t_appointment_notification" ( 
           "appointment_notification_id" BIGINT NOT NULL
          ,"appointment_id" BIGINT
          ,"notification_mode_code_id" BIGINT
          ,"notification_mode_code" CHARACTER VARYING(255)
          ,"parent_notification_mode_code_id" BIGINT
          ,"parent_notification_mode_code" CHARACTER VARYING(255)
          ,"notification_reason_code_id" BIGINT
          ,"notification_reason_code" CHARACTER VARYING(255)
          ,"parent_notification_reason_code_id" BIGINT
          ,"parent_notification_reason_code" CHARACTER VARYING(255)
          ,"notification_datetime" TIMESTAMP
          ,"notification_time" TIME
          ,"notification_date" DATE
)
;
--\echo Creating table 't_dim_codeset'...
CREATE TABLE "t_dim_codeset" ( 
           "source_code_id" BIGINT NOT NULL
          ,"source_name" CHARACTER VARYING(1000)
          ,"source_instance_id" CHARACTER VARYING(1000)
          ,"source_code" CHARACTER VARYING(255)
          ,"descr" CHARACTER VARYING(1000)
          ,"short_descr" CHARACTER VARYING(255)
          ,"source_code_set_id" BIGINT
          ,"source_code_set_name" CHARACTER VARYING(1000)
          ,"parent_code_id" BIGINT
          ,"parent_source_name" CHARACTER VARYING(1000)
          ,"parent_source_instance_id" CHARACTER VARYING(1000)
          ,"parent_source_code" CHARACTER VARYING(255)
          ,"parent_descr" CHARACTER VARYING(1000)
          ,"parent_short_descr" CHARACTER VARYING(255)
          ,"parent_source_code_set_id" BIGINT
          ,"parent_source_code_set_name" CHARACTER VARYING(1000)
)
;
--\echo Creating table 't_provider_template'...
CREATE TABLE "t_provider_template" ( 
           "provider_template_id" BIGINT NOT NULL
          ,"provider_m_id" BIGINT
          ,"provider_id" BIGINT
          ,"l0_facility_location_m_id" BIGINT
          ,"facility_location_id" BIGINT
          ,"release_date_time" TIMESTAMP
          ,"release_time" TIME
          ,"release_date" DATE
          ,"default_slot_length" INTEGER
          ,"overbooking_allowed_code_id" BIGINT
          ,"overbooking_allowed_code" CHARACTER VARYING(255)
          ,"parent_overbooking_allowed_code_id" BIGINT
          ,"parent_overbooking_allowed_code" CHARACTER VARYING(255)
)
;
--\echo Creating table 't_provider_template_schedule'...
CREATE TABLE "t_provider_template_schedule" ( 
           "provider_template_schedule_id" BIGINT NOT NULL
          ,"provider_template_id" BIGINT
          ,"schedule_start_date_time" DATE
          ,"schedule_start_time" TIME
          ,"schedule_start_date" DATE
          ,"schedule_end_date_time" DATE
          ,"schedule_end_time" TIME
          ,"schedule_end_date" DATE
          ,"day_of_week" INTEGER
          ,"start_time" TIME
          ,"end_time" TIME
          ,"slot_length" INTEGER
          ,"openings_per_slot" INTEGER
          ,"nbr_overbooks_allowed" INTEGER
          ,"private_slot_code_id" BIGINT
          ,"private_slot_code" CHARACTER VARYING(255)
          ,"parent_private_slot_code_id" BIGINT
          ,"parent_private_slot_code" CHARACTER VARYING(255)
          ,"modification_reason_code_id" BIGINT
          ,"modification_reason_code" CHARACTER VARYING(255)
          ,"parent_modification_reason_code_id" BIGINT
          ,"parent_modification_reason_code" CHARACTER VARYING(255)
)
;
--\echo Creating table 't_procedure_event'...
CREATE TABLE "t_procedure_event" ( 
           "clinical_event_id" BIGINT NOT NULL
          ,"source_name" CHARACTER VARYING(1000)
          ,"event_type_id" BIGINT
          ,"event_type" CHARACTER VARYING(1000)
          ,"parent_event_id" BIGINT
          ,"encounter_id" BIGINT
          ,"encounter_type_code_id" BIGINT
          ,"encounter_type_code" CHARACTER VARYING(255)
          ,"parent_encounter_type_code_id" BIGINT
          ,"parent_encounter_type_code" CHARACTER VARYING(255)
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"l0_organization_unit_m_id" BIGINT
          ,"service_line_id" BIGINT
          ,"event_date_time" TIMESTAMP
          ,"event_time" TIME
          ,"event_date" DATE
          ,"l0_facility_location_m_id" BIGINT
          ,"location_id" BIGINT
          ,"care_plan_id" BIGINT
          ,"event_end_date_time" TIMESTAMP
          ,"event_end_time" TIME
          ,"event_end_date" DATE
          ,"procedure_service_line_id" BIGINT
          ,"procedure_code_id" BIGINT
          ,"parent_procedure_code_id" BIGINT
          ,"provided_counseling_ind_code_id" BIGINT
          ,"parent_provided_counseling_ind_code_id" BIGINT
          ,"outcome" CHARACTER VARYING(1000)
          ,"anesthesia_type_code_id" BIGINT
          ,"parent_anesthesia_type_code_id" BIGINT
          ,"anesthetic_type_code_id" BIGINT
          ,"parent_anesthetic_type_code_id" BIGINT
          ,"anesthesia_minutes" FLOAT4
          ,"anesthesia_hold_end_date_time" TIMESTAMP
          ,"anesthesia_hold_end_time" TIME
          ,"anesthesia_hold_end_date" DATE
)
;
--\echo Creating table 't_procedure_order_event'...
CREATE TABLE "t_procedure_order_event" ( 
           "clinical_event_id" BIGINT NOT NULL
          ,"source_name" CHARACTER VARYING(1000)
          ,"event_type_id" BIGINT
          ,"event_type" CHARACTER VARYING(1000)
          ,"parent_event_id" BIGINT
          ,"encounter_id" BIGINT
          ,"encounter_type_code_id" BIGINT
          ,"encounter_type_code" CHARACTER VARYING(255)
          ,"parent_encounter_type_code_id" BIGINT
          ,"parent_encounter_type_code" CHARACTER VARYING(255)
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"l0_organization_unit_m_id" BIGINT
          ,"service_line_id" BIGINT
          ,"event_date_time" TIMESTAMP
          ,"event_time" TIME
          ,"event_date" DATE
          ,"l0_facility_location_m_id" BIGINT
          ,"location_id" BIGINT
          ,"care_plan_id" BIGINT
          ,"order_number" CHARACTER VARYING(1000)
          ,"order_type_code_id" BIGINT
          ,"parent_order_type_code_id" BIGINT
          ,"order_priority_code_id" BIGINT
          ,"parent_order_priority_code_id" BIGINT
          ,"order_reason" CHARACTER VARYING(1000)
          ,"order_outcome_status_code_id" BIGINT
          ,"parent_order_outcome_status_code_id" BIGINT
          ,"order_detail_number" CHARACTER VARYING(1000)
          ,"order_sequence_nbr" FLOAT4
          ,"order_detail_status_code_id" BIGINT
          ,"parent_order_detail_status_code_id" BIGINT
          ,"order_set_number" CHARACTER VARYING(1000)
          ,"order_set_name" CHARACTER VARYING(1000)
          ,"procedure_code_id" BIGINT
          ,"parent_procedure_code_id" BIGINT
)
;
--\echo Creating table 't_pharmacy_prescription_order_event'...
CREATE TABLE "t_pharmacy_prescription_order_event" ( 
           "clinical_event_id" BIGINT NOT NULL
          ,"source_name" CHARACTER VARYING(1000)
          ,"event_type_id" BIGINT
          ,"event_type" CHARACTER VARYING(1000)
          ,"parent_event_id" BIGINT
          ,"encounter_id" BIGINT
          ,"encounter_type_code_id" BIGINT
          ,"encounter_type_code" CHARACTER VARYING(255)
          ,"parent_encounter_type_code_id" BIGINT
          ,"parent_encounter_type_code" CHARACTER VARYING(255)
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"l0_organization_unit_m_id" BIGINT
          ,"service_line_id" BIGINT
          ,"event_date_time" TIMESTAMP
          ,"event_time" TIME
          ,"event_date" DATE
          ,"l0_facility_location_m_id" BIGINT
          ,"location_id" BIGINT
          ,"care_plan_id" BIGINT
          ,"order_number" CHARACTER VARYING(1000)
          ,"order_type_code_id" BIGINT
          ,"parent_order_type_code_id" BIGINT
          ,"order_priority_code_id" BIGINT
          ,"parent_order_priority_code_id" BIGINT
          ,"order_reason" CHARACTER VARYING(1000)
          ,"order_outcome_status_code_id" BIGINT
          ,"parent_order_outcome_status_code_id" BIGINT
          ,"order_detail_number" CHARACTER VARYING(1000)
          ,"order_sequence_nbr" FLOAT4
          ,"order_detail_status_code_id" BIGINT
          ,"parent_order_detail_status_code_id" BIGINT
          ,"order_set_number" CHARACTER VARYING(1000)
          ,"order_set_name" CHARACTER VARYING(1000)
          ,"substance_code_id" BIGINT
          ,"parent_substance_code_id" BIGINT
          ,"phr_order_type_code_id" BIGINT
          ,"parent_phr_order_type_code_id" BIGINT
          ,"provid_admin_instruct_code_id" BIGINT
          ,"parent_provid_admin_instruct_code_id" BIGINT
          ,"provid_admin_instructions" CHARACTER VARYING(255)
          ,"req_min_amount" FLOAT4
          ,"req_max_amount" FLOAT4
          ,"req_amount_uom_code_id" BIGINT
          ,"parent_req_amount_uom_code_id" BIGINT
          ,"req_amount_per_time_code_id" BIGINT
          ,"parent_req_amount_per_time_code_id" BIGINT
          ,"req_dosage_form_code_id" BIGINT
          ,"parent_req_dosage_form_code_id" BIGINT
          ,"req_stgth" FLOAT4
          ,"stgth_uom_code_id" BIGINT
          ,"parent_req_stgth_uom_code_id" BIGINT
          ,"req_drug_stgth_vol" FLOAT4
          ,"req_drug_stgth_vol_uom_code_id" BIGINT
          ,"parent_req_drug_stgth_vol_uom_code_id" BIGINT
          ,"req_rate_amount" FLOAT4
          ,"req_rate_amount_uom_code_id" BIGINT
          ,"dsp_amount" FLOAT4
          ,"dsp_amount_uom_code_id" BIGINT
          ,"parent_dsp_amount_uom_code_id" BIGINT
          ,"dsp_dispense_code_id" BIGINT
          ,"parent_dsp_dispense_code_id" BIGINT
          ,"dsp_number_of_refills" CHARACTER VARYING(255)
          ,"dsp_dispense_interval" FLOAT4
          ,"dsp_needs_human_review_code_id" BIGINT
          ,"parent_dsp_needs_human_review_code_id" BIGINT
          ,"dsp_dispensing_pharmacy_id" BIGINT
          ,"dsp_total_daily_dose" FLOAT4
          ,"dsp_total_daily_dose_uom_code_id" BIGINT
          ,"parent_dsp_total_daily_dose_uom_code_id" BIGINT
          ,"dsp_prov_pharm_treat_inst_code_id" BIGINT
          ,"parent_dsp_prov_pharm_treat_inst_code_id" BIGINT
          ,"dsp_prov_pharm_treat_inst" CHARACTER VARYING(1000)
          ,"dsp_allow_substitutions_code_id" BIGINT
          ,"parent_dsp_allow_substitutions_code_id" BIGINT
          ,"pful_substance_code_id" BIGINT
          ,"parent_pful_substance_code_id" BIGINT
          ,"pful_admin_start_date_time" TIMESTAMP
          ,"pful_admin_start_time" TIME
          ,"pful_admin_start_date" DATE
          ,"pful_admin_end_date_time" TIMESTAMP
          ,"pful_admin_end_time" TIME
          ,"pful_admin_end_date" DATE
          ,"pful_amount" FLOAT4
          ,"pful_amount_uom_code_id" BIGINT
          ,"parent_pful_amount_uom_code_id" BIGINT
          ,"pful_amount_per_time_code_id" BIGINT
          ,"parent_pful_amount_per_time_code_id" BIGINT
          ,"pful_dosage_form_code_id" BIGINT
          ,"parent_pful_dosage_form_code_id" BIGINT
          ,"pful_stgth" FLOAT4
          ,"pful_stgth_uom_code_id" BIGINT
          ,"parent_pful_stgth_uom_code_id" BIGINT
          ,"pful_drug_stgth_vol" FLOAT4
          ,"pful_drug_stgth_vol_uom_code_id" BIGINT
          ,"parent_pful_drug_stgth_vol_uom_code_id" BIGINT
          ,"pful_barcode_identifier" CHARACTER VARYING(1000)
          ,"pful_substance_lot_number" CHARACTER VARYING(1000)
          ,"pful_substance_expiration_date" DATE
          ,"pful_substance_manuf_code_id" BIGINT
          ,"parent_pful_substance_manuf_code_id" BIGINT
          ,"pful_administered_location_id" BIGINT
          ,"pful_substance_refusal_code_id" BIGINT
          ,"parent_pful_substance_refusal_code_id" BIGINT
          ,"pful_completion_status_code_id" BIGINT
          ,"parent_pful_completion_status_code_id" BIGINT
          ,"pful_administration_note_code_id" BIGINT
          ,"parent_pful_administration_note_code_id" BIGINT
          ,"pful_administration_notes" CHARACTER VARYING(1000)
          ,"vful_vaccine_code_id" BIGINT
          ,"parent_vful_vaccine_code_id" BIGINT
          ,"vful_admin_start_date_time" TIMESTAMP
          ,"vful_admin_start_time" TIME
          ,"vful_admin_start_date" DATE
          ,"vful_admin_end_date_time" TIMESTAMP
          ,"vful_admin_end_time" TIME
          ,"vful_admin_end_date" DATE
          ,"vful_amount" FLOAT4
          ,"vful_amount_uom_code_id" BIGINT
          ,"parent_vful_amount_uom_code_id" BIGINT
          ,"vful_amount_per_time_code_id" BIGINT
          ,"parent_vful_amount_per_time_code_id" BIGINT
          ,"vful_dosage_form_code_id" BIGINT
          ,"parent_vful_dosage_form_code_id" BIGINT
          ,"vful_stgth" FLOAT4
          ,"vful_stgth_uom_code_id" BIGINT
          ,"parent_vful_stgth_uom_code_id" BIGINT
          ,"vful_drug_stgth_vol" FLOAT4
          ,"vful_drug_stgth_vol_uom_code_id" BIGINT
          ,"parent_vful_drug_stgth_vol_uom_code_id" BIGINT
          ,"vful_barcode_identifier" CHARACTER VARYING(1000)
          ,"vful_vaccine_lot_number" CHARACTER VARYING(1000)
          ,"vful_vaccine_expiration_date" DATE
          ,"vful_vaccine_manuf_code_id" BIGINT
          ,"parent_vful_vaccine_manuf_code_id" BIGINT
          ,"vful_administered_location_id" BIGINT
          ,"vful_vaccine_refusal_code_id" BIGINT
          ,"parent_vful_vaccine_refusal_code_id" BIGINT
          ,"vful_completion_status_code_id" BIGINT
          ,"parent_vful_completion_status_code_id" BIGINT
          ,"vful_administration_note_code_id" BIGINT
          ,"parent_vful_administration_note_code_id" BIGINT
          ,"vful_administration_notes" CHARACTER VARYING(1000)
)
;
--\echo Creating table 't_patient_health_plan'...
CREATE TABLE "t_patient_health_plan" ( 
           "patient_health_plan_id" BIGINT
          ,"transaction_id" CHARACTER VARYING(1000)
          ,"version" INTEGER
          ,"source_name" CHARACTER VARYING(1000)
          ,"source_instance_id" CHARACTER VARYING(1000)
          ,"source_instance_id_name" CHARACTER VARYING(1000)
          ,"status" CHARACTER VARYING(1000)
          ,"status_reason" CHARACTER VARYING(1000)
          ,"effective_date" TIMESTAMP
          ,"expiration_date" TIMESTAMP
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"health_plan_id" CHARACTER VARYING(255)
          ,"policy_number" CHARACTER VARYING(1000)
          ,"policy_scope_code_id" BIGINT
          ,"policy_scope_code" CHARACTER VARYING(255)
          ,"parent_policy_scope_code_id" BIGINT
          ,"parent_policy_scope_code" CHARACTER VARYING(255)
          ,"plan_effective_date" DATE
          ,"plan_expiration_date" DATE
          ,"termination_reason_code_id" BIGINT
          ,"termination_reason_code" CHARACTER VARYING(255)
          ,"parent_termination_reason_code_id" BIGINT
          ,"parent_termination_reason_code" CHARACTER VARYING(255)
          ,"subscrib_rel_to_patient_code_id" BIGINT
          ,"subscrib_rel_to_patient_code" CHARACTER VARYING(255)
          ,"parent_subscrib_rel_to_patient_code_id" BIGINT
          ,"parent_subscrib_rel_to_patient_code" CHARACTER VARYING(255)
          ,"subscriber_id" BIGINT
          ,"source_modified_by" CHARACTER VARYING(1000)
          ,"source_modified_date" TIMESTAMP
          ,"source_created_by" CHARACTER VARYING(1000)
          ,"source_created_date" TIMESTAMP
          ,"omni_created_date" TIMESTAMP
          ,"omni_modified_date" TIMESTAMP
)
;
--\echo Creating table 't_bill'...
CREATE TABLE "t_bill" ( 
           "bill_id" BIGINT NOT NULL
          ,"bill_number" CHARACTER VARYING(1000)
          ,"account_id" BIGINT
          ,"type_code_id" BIGINT
          ,"type_code" CHARACTER VARYING(255)
          ,"parent_type_code_id" BIGINT
          ,"parent_type_code" CHARACTER VARYING(255)
          ,"category_code_id" BIGINT
          ,"category_code" CHARACTER VARYING(255)
          ,"parent_category_code_id" BIGINT
          ,"parent_category_code" CHARACTER VARYING(255)
          ,"pay_to_location_id" CHARACTER VARYING(255)
          ,"status_code_id" BIGINT
          ,"status_code" CHARACTER VARYING(255)
          ,"parent_status_code_id" BIGINT
          ,"parent_status_code" CHARACTER VARYING(255)
          ,"bill_to_party_id" CHARACTER VARYING(255)
          ,"bill_date_time" TIMESTAMP
          ,"bill_time" TIME
          ,"bill_date" DATE
          ,"amount_due" FLOAT4
          ,"currency_code_id" BIGINT
          ,"currency_code" CHARACTER VARYING(255)
          ,"parent_currency_code_id" BIGINT
          ,"parent_currency_code" CHARACTER VARYING(255)
)
;
--\echo Creating table 't_charge'...
CREATE TABLE "t_charge" ( 
           "charge_id" BIGINT NOT NULL
          ,"charge_number" CHARACTER VARYING(1000)
          ,"account_id" BIGINT
          ,"provider_m_id" BIGINT
          ,"provider_id" BIGINT
          ,"l0_organization_unit_m_id" BIGINT
          ,"service_line_id" BIGINT
          ,"l0_facility_location_m_id" BIGINT
          ,"location_id" BIGINT
          ,"transaction_type_code_id" BIGINT
          ,"transaction_type_code" CHARACTER VARYING(255)
          ,"parent_transaction_type_code_id" BIGINT
          ,"parent_transaction_type_code" CHARACTER VARYING(255)
          ,"chargeable_event_id" BIGINT
          ,"charge_code_id" BIGINT
          ,"charge_code" CHARACTER VARYING(255)
          ,"parent_charge_code_id" BIGINT
          ,"parent_charge_code" CHARACTER VARYING(255)
          ,"diagnosis_code_id" BIGINT
          ,"diagnosis_code" CHARACTER VARYING(255)
          ,"parent_diagnosis_code_id" BIGINT
          ,"parent_diagnosis_code" CHARACTER VARYING(255)
          ,"diagnosis_related_group_code_id" BIGINT
          ,"diagnosis_related_group_code" CHARACTER VARYING(255)
          ,"parent_diagnosis_related_group_code_id" BIGINT
          ,"parent_diagnosis_related_group_code" CHARACTER VARYING(255)
          ,"ambulatory_payment_class_code_id" BIGINT
          ,"ambulatory_payment_class_code" CHARACTER VARYING(255)
          ,"parent_ambulatory_payment_class_code_id" BIGINT
          ,"parent_ambulatory_payment_class_code" CHARACTER VARYING(255)
          ,"revenue_code_id" BIGINT
          ,"revenue_code" CHARACTER VARYING(255)
          ,"parent_revenue_code_id" BIGINT
          ,"parent_revenue_code" CHARACTER VARYING(255)
          ,"drug_code_id" BIGINT
          ,"drug_code" CHARACTER VARYING(255)
          ,"parent_drug_code_id" BIGINT
          ,"parent_drug_code" CHARACTER VARYING(255)
          ,"pharmacy_dea_number" CHARACTER VARYING(1000)
          ,"ncpdp_number" CHARACTER VARYING(1000)
          ,"item_number" CHARACTER VARYING(1000)
          ,"model_number" CHARACTER VARYING(1000)
          ,"service_date_time" TIMESTAMP
          ,"service_time" TIME
          ,"service_date" DATE
          ,"charge_date_time" TIMESTAMP
          ,"charge_time" TIME
          ,"charge_date" DATE
          ,"charge_description" CHARACTER VARYING(1000)
          ,"amt_currency_code_id" BIGINT
          ,"amt_currency_code" CHARACTER VARYING(255)
          ,"parent_amt_currency_code_id" BIGINT
          ,"parent_amt_currency_code" CHARACTER VARYING(255)
          ,"amt_charge_quantity" FLOAT4
          ,"amt_charge_amount" FLOAT4
          ,"amt_actual_cost_amount" FLOAT4
          ,"amt_charge_master_cost_amount" FLOAT4
)
;
--\echo Creating table 't_account_transaction'...
CREATE TABLE "t_account_transaction" ( 
           "account_transaction_id" BIGINT NOT NULL
          ,"account_id" BIGINT
          ,"remitter_id" CHARACTER VARYING(255)
          ,"l0_organization_unit_m_id" BIGINT
          ,"service_line_id" BIGINT
          ,"l0_facility_location_m_id" BIGINT
          ,"location_id" BIGINT
          ,"transaction_type_code_id" BIGINT
          ,"transaction_type_code" CHARACTER VARYING(255)
          ,"parent_transaction_type_code_id" BIGINT
          ,"parent_transaction_type_code" CHARACTER VARYING(255)
          ,"transaction_currency_code_id" BIGINT
          ,"transaction_currency_code" CHARACTER VARYING(255)
          ,"parent_transaction_currency_code_id" BIGINT
          ,"parent_transaction_currency_code" CHARACTER VARYING(255)
          ,"payment_adjustment_code_id" BIGINT
          ,"payment_adjustment_code" CHARACTER VARYING(255)
          ,"parent_payment_adjustment_code_id" BIGINT
          ,"parent_payment_adjustment_code" CHARACTER VARYING(255)
          ,"transaction_date_time" TIMESTAMP
          ,"transaction_time" TIME
          ,"transaction_date" DATE
          ,"transaction_amount" FLOAT4
          ,"transaction_description" CHARACTER VARYING(1000)
          ,"patient_health_plan_id" BIGINT
)
;
--\echo Creating table 't_account_guarantor'...
CREATE TABLE "t_account_guarantor" ( 
           "account_guarantor_id" BIGINT NOT NULL
          ,"account_id" BIGINT
          ,"sequence" FLOAT4
          ,"guarantor_account_id" BIGINT
)
;
--\echo Creating table 't_account_health_plan_coverage'...
CREATE TABLE "t_account_health_plan_coverage" ( 
           "account_health_plan_coverage_id" BIGINT NOT NULL
          ,"account_id" BIGINT
          ,"insurance_coverage_type_code_id" BIGINT
          ,"insurance_coverage_type_code" CHARACTER VARYING(255)
          ,"parent_insurance_coverage_type_code_id" BIGINT
          ,"parent_insurance_coverage_type_code" CHARACTER VARYING(255)
          ,"sequence" FLOAT4
          ,"patient_health_plan_id" BIGINT
)
;
--\echo Creating table 't_discharge_event'...
CREATE TABLE "t_discharge_event" ( 
           "clinical_event_id" BIGINT NOT NULL
          ,"source_name" CHARACTER VARYING(1000)
          ,"event_type_id" BIGINT
          ,"event_type" CHARACTER VARYING(1000)
          ,"parent_event_id" BIGINT
          ,"encounter_id" BIGINT
          ,"encounter_type_code_id" BIGINT
          ,"encounter_type_code" CHARACTER VARYING(255)
          ,"parent_encounter_type_code_id" BIGINT
          ,"parent_encounter_type_code" CHARACTER VARYING(255)
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"l0_organization_unit_m_id" BIGINT
          ,"service_line_id" BIGINT
          ,"event_date_time" TIMESTAMP
          ,"event_time" TIME
          ,"event_date" DATE
          ,"l0_facility_location_m_id" BIGINT
          ,"location_id" BIGINT
          ,"care_plan_id" BIGINT
          ,"disposition_code_id" BIGINT
          ,"parent_disposition_code_id" BIGINT
          ,"to_location" CHARACTER VARYING(1000)
          ,"to_location_type_code_id" BIGINT
          ,"parent_to_location_type_code_id" BIGINT
          ,"baby_detained_indicator" CHARACTER VARYING(255)
          ,"elec_institut_req_code_id" BIGINT
          ,"parent_elec_institut_req_code_id" BIGINT
          ,"elect_copy_hlth_info_req_code_id" BIGINT
          ,"parent_elect_copy_hlth_info_req_code_id" BIGINT
)
;
--\echo Creating table 't_med_taxonomy'...
CREATE TABLE "t_med_taxonomy" ( 
           "med_taxonomy_id" BIGINT NOT NULL
          ,"med_taxonomy_name" CHARACTER(50) NOT NULL
          ,"med_taxonomy_version" TIMESTAMP NOT NULL
)
;
--\echo Creating table 't_med_code'...
CREATE TABLE "t_med_code" ( 
           "med_code_id" BIGINT NOT NULL
          ,"med_taxonomy_id" BIGINT NOT NULL
          ,"med_code_actual" CHARACTER(15) NOT NULL
          ,"med_code_name" CHARACTER(60)
          ,"med_code_full_name" CHARACTER(250)
)
;
--\echo Creating table 't_med_concept'...
CREATE TABLE "t_med_concept" ( 
           "med_concept_id" BIGINT NOT NULL
          ,"med_concept_name" CHARACTER(50) NOT NULL
          ,"med_concept_measure_group" CHARACTER(50) NOT NULL
          ,"med_concept_category" CHARACTER(3) NOT NULL
          ,"med_concept_full_name" CHARACTER(500)
)
;
--\echo Creating table 't_med_concept_code_xref'...
CREATE TABLE "t_med_concept_code_xref" ( 
           "med_concept_id" BIGINT NOT NULL
          ,"med_code_id" BIGINT NOT NULL
)
;
--\echo Creating table 't_medical_supply_order_event'...
CREATE TABLE "t_medical_supply_order_event" ( 
           "clinical_event_id" BIGINT NOT NULL
          ,"source_name" CHARACTER VARYING(1000)
          ,"event_type_id" BIGINT
          ,"event_type" CHARACTER VARYING(1000)
          ,"parent_event_id" BIGINT
          ,"encounter_id" BIGINT
          ,"encounter_type_code_id" BIGINT
          ,"encounter_type_code" CHARACTER VARYING(255)
          ,"parent_encounter_type_code_id" BIGINT
          ,"parent_encounter_type_code" CHARACTER VARYING(255)
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"l0_organization_unit_m_id" BIGINT
          ,"service_line_id" BIGINT
          ,"event_date_time" TIMESTAMP
          ,"event_time" TIME
          ,"event_date" DATE
          ,"l0_facility_location_m_id" BIGINT
          ,"location_id" BIGINT
          ,"care_plan_id" BIGINT
          ,"order_number" CHARACTER VARYING(1000)
          ,"order_type_code_id" BIGINT
          ,"parent_order_type_code_id" BIGINT
          ,"order_priority_code_id" BIGINT
          ,"parent_order_priority_code_id" BIGINT
          ,"order_reason" CHARACTER VARYING(1000)
          ,"order_outcome_status_code_id" BIGINT
          ,"parent_order_outcome_status_code_id" BIGINT
          ,"order_detail_number" CHARACTER VARYING(1000)
          ,"order_sequence_nbr" FLOAT4
          ,"order_detail_status_code_id" BIGINT
          ,"parent_order_detail_status_code_id" BIGINT
          ,"order_set_number" CHARACTER VARYING(1000)
          ,"order_set_name" CHARACTER VARYING(1000)
          ,"mso_part_number_code_id" BIGINT
          ,"mso_parent_part_number_code_id" BIGINT
          ,"mso_quantity" FLOAT4
          ,"mso_quantity_uom_code_id" BIGINT
          ,"mso_parent_quantity_uom_code_id" BIGINT
)
;
--\echo Creating table 't_observation_event'...
CREATE TABLE "t_observation_event" ( 
           "clinical_event_id" BIGINT NOT NULL
          ,"source_name" CHARACTER VARYING(1000)
          ,"event_type_id" BIGINT
          ,"event_type" CHARACTER VARYING(1000)
          ,"parent_event_id" BIGINT
          ,"encounter_id" BIGINT
          ,"encounter_type_code_id" BIGINT
          ,"encounter_type_code" CHARACTER VARYING(255)
          ,"parent_encounter_type_code_id" BIGINT
          ,"parent_encounter_type_code" CHARACTER VARYING(255)
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"l0_organization_unit_m_id" BIGINT
          ,"service_line_id" BIGINT
          ,"event_date_time" TIMESTAMP
          ,"event_time" TIME
          ,"event_date" DATE
          ,"l0_facility_location_m_id" BIGINT
          ,"location_id" BIGINT
          ,"care_plan_id" BIGINT
          ,"event_end_date_time" TIMESTAMP
          ,"event_end_time" TIME
          ,"event_end_date" DATE
          ,"obs_location_id" BIGINT
          ,"batch_number" CHARACTER VARYING(1000)
          ,"observation_number" CHARACTER VARYING(1000)
          ,"obs_sequence" FLOAT4
          ,"obs_sub_sequence" FLOAT4
          ,"result_type_code_id" BIGINT
          ,"parent_result_type_code_id" BIGINT
          ,"text_result" CHARACTER VARYING(1000)
          ,"ratio_numerator" FLOAT4
          ,"ratio_denominator" FLOAT4
          ,"quantity_value" FLOAT4
          ,"quantity_value_uom_code_id" BIGINT
          ,"parent_quantity_value_uom_code_id" BIGINT
          ,"quantity_value_comp_code_id" BIGINT
          ,"parent_quantity_value_comp_code_id" BIGINT
          ,"sample_origin_value" FLOAT4
          ,"sample_origin_uom_code_id" BIGINT
          ,"parent_sample_origin_uom_code_id" BIGINT
          ,"sample_result_period" FLOAT4
          ,"sample_result_factor" FLOAT4
          ,"sample_result_lower_limit" FLOAT4
          ,"sample_result_upper_limit" FLOAT4
          ,"sample_result_dimensions" FLOAT4
          ,"sample_result_data" CHARACTER VARYING(1000)
          ,"observation_code_id" BIGINT
          ,"parent_observation_code_id" BIGINT
          ,"status_code_id" BIGINT
          ,"parent_status_code_id" BIGINT
          ,"reliability_code_id" BIGINT
          ,"parent_reliability_code_id" BIGINT
          ,"method_code_id" BIGINT
          ,"parent_method_code_id" BIGINT
          ,"interpretation_code_id" BIGINT
          ,"parent_interpretation_code_id" BIGINT
          ,"body_site_code_id" BIGINT
          ,"parent_body_site_code_id" BIGINT
          ,"commnt" CHARACTER VARYING(1000)
          ,"device" CHARACTER VARYING(1000)
          ,"vital_sign_indicator_code_id" BIGINT
          ,"parent_vital_sign_indicator_code_id" BIGINT
          ,"specimen_id" BIGINT
)
;
--\echo Creating table 't_movement_event'...
CREATE TABLE "t_movement_event" ( 
           "clinical_event_id" BIGINT NOT NULL
          ,"source_name" CHARACTER VARYING(1000)
          ,"event_type_id" BIGINT
          ,"event_type" CHARACTER VARYING(1000)
          ,"parent_event_id" BIGINT
          ,"encounter_id" BIGINT
          ,"encounter_type_code_id" BIGINT
          ,"encounter_type_code" CHARACTER VARYING(255)
          ,"parent_encounter_type_code_id" BIGINT
          ,"parent_encounter_type_code" CHARACTER VARYING(255)
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"l0_organization_unit_m_id" BIGINT
          ,"service_line_id" BIGINT
          ,"event_date_time" TIMESTAMP
          ,"event_time" TIME
          ,"event_date" DATE
          ,"l0_facility_location_m_id" BIGINT
          ,"location_id" BIGINT
          ,"care_plan_id" BIGINT
          ,"mvm_type_code_id" BIGINT
          ,"mvm_parent_type_code_id" BIGINT
)
;
--\echo Creating table 't_bill_line_item'...
CREATE TABLE "t_bill_line_item" ( 
           "bill_line_item_id" BIGINT NOT NULL
          ,"bill_id" BIGINT NOT NULL
          ,"bill_line_number" CHARACTER VARYING(1000)
          ,"bill_line_type_code_id" BIGINT
          ,"bill_line_type_code" CHARACTER VARYING(1000)
          ,"parent_bill_line_type_code_id" BIGINT
          ,"parent_bill_line_type_code" CHARACTER VARYING(255)
          ,"bill_line_amount" FLOAT4
)
;
--\echo Creating table 't_diagnostic_test_order_event'...
CREATE TABLE "t_diagnostic_test_order_event" ( 
           "clinical_event_id" BIGINT NOT NULL
          ,"source_name" CHARACTER VARYING(1000)
          ,"event_type_id" BIGINT
          ,"event_type" CHARACTER VARYING(1000)
          ,"parent_event_id" BIGINT
          ,"encounter_id" BIGINT
          ,"encounter_type_code_id" BIGINT
          ,"encounter_type_code" CHARACTER VARYING(255)
          ,"parent_encounter_type_code_id" BIGINT
          ,"parent_encounter_type_code" CHARACTER VARYING(255)
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"l0_organization_unit_m_id" BIGINT
          ,"service_line_id" BIGINT
          ,"event_date_time" TIMESTAMP
          ,"event_time" TIME
          ,"event_date" DATE
          ,"l0_facility_location_m_id" BIGINT
          ,"location_id" BIGINT
          ,"care_plan_id" BIGINT
          ,"order_number" CHARACTER VARYING(1000)
          ,"order_type_code_id" BIGINT
          ,"parent_order_type_code_id" BIGINT
          ,"order_priority_code_id" BIGINT
          ,"parent_order_priority_code_id" BIGINT
          ,"order_reason" CHARACTER VARYING(1000)
          ,"order_outcome_status_code_id" BIGINT
          ,"parent_order_outcome_status_code_id" BIGINT
          ,"order_detail_number" CHARACTER VARYING(1000)
          ,"order_sequence_nbr" FLOAT4
          ,"order_detail_status_code_id" BIGINT
          ,"parent_order_detail_status_code_id" BIGINT
          ,"order_set_number" CHARACTER VARYING(1000)
          ,"order_set_name" CHARACTER VARYING(1000)
          ,"diagnostic_test_code_id" BIGINT
          ,"parent_diagnostic_test_code_id" BIGINT
)
;
--\echo Creating table 't_diagnosis_event'...
CREATE TABLE "t_diagnosis_event" ( 
           "clinical_event_id" BIGINT NOT NULL
          ,"source_name" CHARACTER VARYING(1000)
          ,"event_type_id" BIGINT
          ,"event_type" CHARACTER VARYING(1000)
          ,"parent_event_id" BIGINT
          ,"encounter_id" BIGINT
          ,"encounter_type_code_id" BIGINT
          ,"encounter_type_code" CHARACTER VARYING(255)
          ,"parent_encounter_type_code_id" BIGINT
          ,"parent_encounter_type_code" CHARACTER VARYING(255)
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"l0_organization_unit_m_id" BIGINT
          ,"service_line_id" BIGINT
          ,"event_date_time" TIMESTAMP
          ,"event_time" TIME
          ,"event_date" DATE
          ,"l0_facility_location_m_id" BIGINT
          ,"location_id" BIGINT
          ,"care_plan_id" BIGINT
          ,"diagnosis_code_id" BIGINT
          ,"parent_diagnosis_code_id" BIGINT
          ,"present_on_admission_code_id" BIGINT
          ,"parent_present_on_admission_code_id" BIGINT
          ,"type_code_id" BIGINT
          ,"parent_type_code_id" BIGINT
          ,"primary_diagnosis_ind_code_id" BIGINT
          ,"parent_primary_diagnosis_ind_code_id" BIGINT
          ,"condition_category_code_id" BIGINT
          ,"parent_condition_category_code_id" BIGINT
          ,"condition_status_code_id" BIGINT
          ,"parent_condition_status_code_id" BIGINT
          ,"condition_severity_code_id" BIGINT
          ,"parent_condition_severity_code_id" BIGINT
          ,"onset_date" DATE
          ,"assertion_date" DATE
          ,"abatement_date" DATE
)
;
--\echo Creating table 't_diet_order_event'...
CREATE TABLE "t_diet_order_event" ( 
           "clinical_event_id" BIGINT NOT NULL
          ,"source_name" CHARACTER VARYING(1000)
          ,"event_type_id" BIGINT
          ,"event_type" CHARACTER VARYING(1000)
          ,"parent_event_id" BIGINT
          ,"encounter_id" BIGINT
          ,"encounter_type_code_id" BIGINT
          ,"encounter_type_code" CHARACTER VARYING(255)
          ,"parent_encounter_type_code_id" BIGINT
          ,"parent_encounter_type_code" CHARACTER VARYING(255)
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"l0_organization_unit_m_id" BIGINT
          ,"service_line_id" BIGINT
          ,"event_date_time" TIMESTAMP
          ,"event_time" TIME
          ,"event_date" DATE
          ,"l0_facility_location_m_id" BIGINT
          ,"location_id" BIGINT
          ,"care_plan_id" BIGINT
          ,"order_number" CHARACTER VARYING(1000)
          ,"order_type_code_id" BIGINT
          ,"parent_order_type_code_id" BIGINT
          ,"order_priority_code_id" BIGINT
          ,"parent_order_priority_code_id" BIGINT
          ,"order_reason" CHARACTER VARYING(1000)
          ,"order_outcome_status_code_id" BIGINT
          ,"parent_order_outcome_status_code_id" BIGINT
          ,"order_detail_number" CHARACTER VARYING(1000)
          ,"order_sequence_nbr" FLOAT4
          ,"order_detail_status_code_id" BIGINT
          ,"parent_order_detail_status_code_id" BIGINT
          ,"order_set_number" CHARACTER VARYING(1000)
          ,"order_set_name" CHARACTER VARYING(1000)
          ,"diet_specification_code_id" BIGINT
          ,"parent_diet_specification_code_id" BIGINT
          ,"service_period_code_id" BIGINT
          ,"parent_service_period_code_id" BIGINT
          ,"product_code_id" BIGINT
          ,"parent_product_code_id" BIGINT
          ,"text_instruction" TEXT
)
;
--\echo Creating table 't_dim_provider_master'...
CREATE TABLE "t_dim_provider_master" ( 
           "provider_m_id" BIGINT NOT NULL
          ,"provider_master_id" CHARACTER VARYING(255)
          ,"person_m_id" BIGINT
          ,"provider_type_code_id" BIGINT
          ,"provider_typecode" CHARACTER VARYING(255)
          ,"provider_type_code_sdescr" CHARACTER VARYING(255)
          ,"parent_provider_type_code_id" BIGINT
          ,"parent_provider_typecode" CHARACTER VARYING(255)
          ,"parent_provider_type_code_sdescr" CHARACTER VARYING(255)
          ,"active_code_id" BIGINT
          ,"activecode" CHARACTER VARYING(255)
          ,"active_code_sdescr" CHARACTER VARYING(255)
          ,"parent_active_code_id" BIGINT
          ,"parent_activecode" CHARACTER VARYING(255)
          ,"parent_active_code_sdescr" CHARACTER VARYING(255)
          ,"inactive_reason_code_id" BIGINT
          ,"inactive_reasoncode" CHARACTER VARYING(255)
          ,"inactive_reason_code_sdescr" CHARACTER VARYING(255)
          ,"parent_inactive_reason_code_id" BIGINT
          ,"parent_inactive_reasoncode" CHARACTER VARYING(255)
          ,"parent_inactive_reason_code_sdescr" CHARACTER VARYING(255)
          ,"expected_return_date" TIMESTAMP
          ,"practitioner_category_code_id" BIGINT
          ,"practitioner_categorycode" CHARACTER VARYING(255)
          ,"practitioner_category_code_sdescr" CHARACTER VARYING(255)
          ,"parent_practitioner_category_code_id" BIGINT
          ,"parent_practitioner_categorycode" CHARACTER VARYING(255)
          ,"parent_practitioner_category_code_sdescr" CHARACTER VARYING(255)
          ,"photo_url" CHARACTER VARYING(1000)
          ,"per_protection_code_id" BIGINT
          ,"per_protectioncode" CHARACTER VARYING(255)
          ,"per_protection_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_protection_code_id" BIGINT
          ,"per_parent_protectioncode" CHARACTER VARYING(255)
          ,"per_parent_protection_code_sdescr" CHARACTER VARYING(255)
          ,"per_publicity_code_id" BIGINT
          ,"per_publicitycode" CHARACTER VARYING(255)
          ,"per_publicity_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_publicity_code_id" BIGINT
          ,"per_parent_publicitycode" CHARACTER VARYING(255)
          ,"per_parent_publicity_code_sdescr" CHARACTER VARYING(255)
          ,"per_birth_date" TIMESTAMP
          ,"per_deceased_code_id" BIGINT
          ,"per_deceasedcode" CHARACTER VARYING(255)
          ,"per_deceased_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_deceased_code_id" BIGINT
          ,"per_parent_deceasedcode" CHARACTER VARYING(255)
          ,"per_parent_deceased_code_sdescr" CHARACTER VARYING(255)
          ,"per_death_date" TIMESTAMP
          ,"per_cause_of_death" CHARACTER VARYING(1000)
          ,"per_gender_code_id" BIGINT
          ,"per_gendercode" CHARACTER VARYING(255)
          ,"per_gender_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_gender_code_id" BIGINT
          ,"per_parent_gendercode" CHARACTER VARYING(255)
          ,"per_parent_gender_code_sdescr" CHARACTER VARYING(255)
          ,"per_ethnic_group_code_id" BIGINT
          ,"per_ethnic_groupcode" CHARACTER VARYING(255)
          ,"per_ethnic_group_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_ethnic_group_code_id" BIGINT
          ,"per_parent_ethnic_groupcode" CHARACTER VARYING(255)
          ,"per_parent_ethnic_group_code_sdescr" CHARACTER VARYING(255)
          ,"per_marital_status_code_id" BIGINT
          ,"per_marital_statuscode" CHARACTER VARYING(255)
          ,"per_marital_status_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_marital_status_code_id" BIGINT
          ,"per_parent_marital_statuscode" CHARACTER VARYING(255)
          ,"per_parent_marital_status_code_sdescr" CHARACTER VARYING(255)
          ,"per_race_code_id" BIGINT
          ,"per_racecode" CHARACTER VARYING(255)
          ,"per_race_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_race_code_id" BIGINT
          ,"per_parent_racecode" CHARACTER VARYING(255)
          ,"per_parent_race_code_sdescr" CHARACTER VARYING(255)
          ,"per_citizenship_code_id" BIGINT
          ,"per_citizenshipcode" CHARACTER VARYING(255)
          ,"per_citizenship_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_citizenship_code_id" BIGINT
          ,"per_parent_citizenshipcode" CHARACTER VARYING(255)
          ,"per_parent_citizenship_code_sdescr" CHARACTER VARYING(255)
          ,"per_religion_code_id" BIGINT
          ,"per_religioncode" CHARACTER VARYING(255)
          ,"per_religion_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_religion_code_id" BIGINT
          ,"per_parent_religioncode" CHARACTER VARYING(255)
          ,"per_parent_religion_code_sdescr" CHARACTER VARYING(255)
          ,"per_place_of_worship" CHARACTER VARYING(1000)
          ,"per_mother_maiden_name" CHARACTER VARYING(1000)
          ,"per_ambulatory_status_code_id" BIGINT
          ,"per_ambulatory_statuscode" CHARACTER VARYING(255)
          ,"per_ambulatory_status_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_ambulatory_status_code_id" BIGINT
          ,"per_parent_ambulatory_statuscode" CHARACTER VARYING(255)
          ,"per_parent_ambulatory_status_code_sdescr" CHARACTER VARYING(255)
          ,"per_english_fluency_code_id" BIGINT
          ,"per_english_fluency_code" CHARACTER VARYING(255)
          ,"per_english_fluency_code_sdescr" CHARACTER VARYING(2255)
          ,"per_parent_english_fluency_code_id" BIGINT
          ,"per_parent_english_fluencycode" CHARACTER VARYING(255)
          ,"per_parent_english_fluency_code_sdescr" CHARACTER VARYING(255)
          ,"per_language_code_id" BIGINT
          ,"per_languagecode" CHARACTER VARYING(255)
          ,"per_language_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_language_code_id" BIGINT
          ,"per_parent_languagecode" CHARACTER VARYING(255)
          ,"per_parent_language_code_sdescr" CHARACTER VARYING(255)
          ,"per_intepreter_required_code_id" BIGINT
          ,"per_intepreter_requiredcode" CHARACTER VARYING(255)
          ,"per_intepreter_required_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_interpreter_required_code_id" BIGINT
          ,"per_parent_interpreter_requiredcode" CHARACTER VARYING(255)
          ,"per_parent_interpreter_required_code_sdescr" CHARACTER VARYING(255)
          ,"per_care_language_code_id" BIGINT
          ,"per_care_languagecode" CHARACTER VARYING(255)
          ,"per_care_language_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_care_language_code_id" BIGINT
          ,"per_parent_care_languagecode" CHARACTER VARYING(255)
          ,"per_parent_care_language_code_sdescr" CHARACTER VARYING(255)
          ,"per_written_language_code_id" BIGINT
          ,"per_written_languagecode" CHARACTER VARYING(255)
          ,"per_written_language_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_written_language_code_id" BIGINT
          ,"per_parent_written_languagecode" CHARACTER VARYING(255)
          ,"per_parent_written_language_code_sdescr" CHARACTER VARYING(255)
          ,"per_handicap_code_id" BIGINT
          ,"per_handicapcode" CHARACTER VARYING(255)
          ,"per_handicap_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_handicap_code_id" BIGINT
          ,"per_parent_handicapcode" CHARACTER VARYING(255)
          ,"per_parent_handicap_code_sdescr" CHARACTER VARYING(255)
          ,"per_hearing_impaired_code_id" BIGINT
          ,"per_hearing_impairedcode" CHARACTER VARYING(255)
          ,"per_hearing_impaired_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_hearing_impaired_code_id" BIGINT
          ,"per_parent_hearing_impairedcode" CHARACTER VARYING(255)
          ,"per_parent_hearing_impaired_code_sdescr" CHARACTER VARYING(255)
          ,"per_deaf_code_id" BIGINT
          ,"per_deafcode" CHARACTER VARYING(255)
          ,"per_deaf_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_deaf_code_id" BIGINT
          ,"per_parent_deafcode" CHARACTER VARYING(255)
          ,"per_parent_deaf_code_sdescr" CHARACTER VARYING(255)
          ,"per_visually_impaired_code_id" BIGINT
          ,"per_visually_impairedcode" CHARACTER VARYING(255)
          ,"per_visually_impaired_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_visually_impaired_code_id" BIGINT
          ,"per_parent_visually_impairedcode" CHARACTER VARYING(255)
          ,"per_parent_visually_impaired_code_sdescr" CHARACTER VARYING(255)
          ,"per_blind_code_id" BIGINT
          ,"per_blindcode" CHARACTER VARYING(255)
          ,"per_blind_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_blind_code_id" BIGINT
          ,"per_parent_blindcode" CHARACTER VARYING(255)
          ,"per_parent_blind_code_sdescr" CHARACTER VARYING(255)
          ,"per_mil_veteran_status_code_id" BIGINT
          ,"per_mil_veteran_statuscode" CHARACTER VARYING(255)
          ,"per_mil_veteran_status_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_mil_veteran_status_code_id" BIGINT
          ,"per_parent_mil_veteran_statuscode" CHARACTER VARYING(255)
          ,"per_parent_mil_veteran_status_code_sdescr" CHARACTER VARYING(255)
          ,"per_mil_pay_grade" CHARACTER VARYING(1000)
          ,"per_mil_unit" CHARACTER VARYING(1000)
          ,"per_mil_branch_code_id" BIGINT
          ,"per_mil_branchcode" CHARACTER VARYING(255)
          ,"per_mil_branch_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_mil_branch_code_id" BIGINT
          ,"per_parent_mil_branchcode" CHARACTER VARYING(255)
          ,"per_parent_mil_branch_code_sdescr" CHARACTER VARYING(255)
          ,"per_mil_category_code_id" BIGINT
          ,"per_mil_categorycode" CHARACTER VARYING(255)
          ,"per_mil_category_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_mil_category_code_id" BIGINT
          ,"per_parent_mil_categorycode" CHARACTER VARYING(255)
          ,"per_parent_mil_category_code_sdescr" CHARACTER VARYING(255)
          ,"per_mil_component_code_id" BIGINT
          ,"per_mil_componentcode" CHARACTER VARYING(255)
          ,"per_mil_component_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_mil_component_code_id" BIGINT
          ,"per_parent_mil_componentcode" CHARACTER VARYING(255)
          ,"per_parent_mil_component_code_sdescr" CHARACTER VARYING(255)
          ,"per_mil_rank_code_id" BIGINT
          ,"per_mil_rankcode" CHARACTER VARYING(255)
          ,"per_mil_rank_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_mil_rank_code_id" BIGINT
          ,"per_parent_mil_rankcode" CHARACTER VARYING(255)
          ,"per_parent_mil_rank_code_sdescr" CHARACTER VARYING(255)
          ,"per_address_line1" CHARACTER VARYING(1000)
          ,"per_address_line2" CHARACTER VARYING(1000)
          ,"per_address_line3" CHARACTER VARYING(1000)
          ,"per_address_line4" CHARACTER VARYING(1000)
          ,"per_city" CHARACTER VARYING(1000)
          ,"per_state_province_code_id" BIGINT
          ,"per_state_provincecode" CHARACTER VARYING(255)
          ,"per_state_province_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_state_province_code_id" BIGINT
          ,"per_parent_state_provincecode" CHARACTER VARYING(255)
          ,"per_parent_state_province_code_sdescr" CHARACTER VARYING(255)
          ,"per_postalcode" CHARACTER VARYING(255)
          ,"per_country_code_id" BIGINT
          ,"per_countrycode" CHARACTER VARYING(255)
          ,"per_country_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_country_code_id" BIGINT
          ,"per_parent_countrycode" CHARACTER VARYING(255)
          ,"per_parent_country_code_sdescr" CHARACTER VARYING(255)
          ,"per_county_region_code_id" BIGINT
          ,"per_county_regioncode" CHARACTER VARYING(255)
          ,"per_county_region_code_sdescr" CHARACTER VARYING(255)
          ,"per_parent_county_region_code_id" BIGINT
          ,"per_parent_county_regioncode" CHARACTER VARYING(255)
          ,"per_parent_county_region_code_sdescr" CHARACTER VARYING(255)
          ,"per_address_usage_comment" CHARACTER VARYING(1000)
          ,"per_full_name" CHARACTER VARYING(1000)
          ,"per_prefix" CHARACTER VARYING(1000)
          ,"per_first_name" CHARACTER VARYING(1000)
          ,"per_middle_name" CHARACTER VARYING(1000)
          ,"per_last_name" CHARACTER VARYING(1000)
          ,"per_suffix" CHARACTER VARYING(1000)
          ,"per_degree" CHARACTER VARYING(1000)
          ,"per_title" CHARACTER VARYING(1000)
          ,"per_ssn" CHARACTER VARYING(1000)
          ,"per_mrn" CHARACTER VARYING(1000)
)
;
--\echo Creating table 't_admission_event'...
CREATE TABLE "t_admission_event" ( 
           "clinical_event_id" BIGINT NOT NULL
          ,"source_name" CHARACTER VARYING(1000)
          ,"event_type_id" BIGINT
          ,"event_type" CHARACTER VARYING(1000)
          ,"parent_event_id" BIGINT
          ,"encounter_id" BIGINT
          ,"encounter_type_code_id" BIGINT
          ,"encounter_type_code" CHARACTER VARYING(255)
          ,"parent_encounter_type_code_id" BIGINT
          ,"parent_encounter_type_code" CHARACTER VARYING(255)
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"l0_organization_unit_m_id" BIGINT
          ,"service_line_id" BIGINT
          ,"event_date_time" TIMESTAMP
          ,"event_time" TIME
          ,"event_date" DATE
          ,"l0_facility_location_m_id" BIGINT
          ,"location_id" BIGINT
          ,"care_plan_id" BIGINT
          ,"type_code_id" BIGINT
          ,"parent_type_code_id" BIGINT
          ,"admit_source_code_id" BIGINT
          ,"parent_admit_source_code_id" BIGINT
          ,"readmit_code_id" BIGINT
          ,"parent_readmit_code_id" BIGINT
          ,"admit_reason" CHARACTER VARYING(1000)
          ,"patient_valuables" CHARACTER VARYING(1000)
          ,"patient_valuables_location" CHARACTER VARYING(1000)
          ,"estimated_length_of_stay" FLOAT4
          ,"expected_event_date_time" TIMESTAMP
          ,"expected_event_time" TIME
          ,"expected_event_date" DATE
)
;
--\echo Creating table 't_death_event'...
CREATE TABLE "t_death_event" ( 
           "clinical_event_id" BIGINT NOT NULL
          ,"source_name" CHARACTER VARYING(1000)
          ,"event_type_id" BIGINT
          ,"event_type" CHARACTER VARYING(1000)
          ,"parent_event_id" BIGINT
          ,"encounter_id" BIGINT
          ,"encounter_type_code_id" BIGINT
          ,"encounter_type_code" CHARACTER VARYING(255)
          ,"parent_encounter_type_code_id" BIGINT
          ,"parent_encounter_type_code" CHARACTER VARYING(255)
          ,"patient_m_id" BIGINT
          ,"patient_id" BIGINT
          ,"l0_organization_unit_m_id" BIGINT
          ,"service_line_id" BIGINT
          ,"event_date_time" TIMESTAMP
          ,"event_time" TIME
          ,"event_date" DATE
          ,"l0_facility_location_m_id" BIGINT
          ,"location_id" BIGINT
          ,"care_plan_id" BIGINT
          ,"dead_on_arrival_indicator_code_id" BIGINT
          ,"parent_dead_on_arrival_indicator_code_id" BIGINT
          ,"manner_of_death_code_id" BIGINT
          ,"parent_manner_of_death_code_id" BIGINT
          ,"tobacco_use_contrib_death_code_id" BIGINT
          ,"parent_tobacco_use_contrib_death_code_id" BIGINT
          ,"pregnancy_status_code_id" BIGINT
          ,"parent_pregnancy_status_code_id" BIGINT
          ,"injury_indicator_code_id" BIGINT
          ,"parent_injury_indicator_code_id" BIGINT
          ,"injury_date_time" TIMESTAMP
          ,"injury_time" TIME
          ,"injury_date" DATE
          ,"injury_at_work_indicator_code_id" BIGINT
          ,"parent_injury_at_work_indicator_code_id" BIGINT
          ,"injury_transportation_code_id" BIGINT
          ,"parent_injury_transportation_code_id" BIGINT
          ,"injury_place_occured" CHARACTER VARYING(1000)
          ,"injury_how_occured" CHARACTER VARYING(1000)
          ,"autopsy_indicator_code_id" BIGINT
          ,"parent_autopsy_indicator_code_id" BIGINT
          ,"autopsy_start_date_time" TIMESTAMP
          ,"autopsy_start_time" TIME
          ,"autopsy_start_date" DATE
          ,"autopsy_end_date_time" TIMESTAMP
          ,"autopsy_end_time" TIME
          ,"autopsy_end_date" DATE
          ,"autopsy_performed_by_name" CHARACTER VARYING(1000)
          ,"autopsy_performed_by_title" CHARACTER VARYING(1000)
          ,"autopsy_coroner_indicator_code_id" BIGINT
          ,"parent_autopsy_coroner_indicator_code_id" BIGINT
          ,"certif_death_indicator_code_id" BIGINT
          ,"parent_certif_death_indicator_code_id" BIGINT
          ,"certif_death_signed_date_time" TIMESTAMP
          ,"certif_death_signed_time" TIME
          ,"certif_death_signed_date" DATE
          ,"certif_death_by_name" CHARACTER VARYING(1000)
          ,"certif_death_by_title" CHARACTER VARYING(1000)
)
;
--\echo Creating table 't_clinical_event_provider'...
CREATE TABLE "t_clinical_event_provider" ( 
           "clinical_event_id" BIGINT NOT NULL
          ,"provider_m_id" BIGINT
          ,"provider_id" BIGINT
          ,"provider_role_code_id" BIGINT
          ,"provider_role_code" CHARACTER VARYING(255)
          ,"parent_provider_role_code_id" BIGINT
          ,"parent_provider_role_code" CHARACTER VARYING(255)
)
;
--\echo Creating index 'idx_fk_patient_id_t_referral_source'...
CREATE INDEX idx_fk_patient_id_t_referral_source ON t_referral_source 
USING BTREE 
(
     "patient_id"
)
;
--\echo Creating index 'enc_parent_mode_of_arrival_code_id_idx'...
CREATE INDEX enc_parent_mode_of_arrival_code_id_idx ON t_encounter 
USING BTREE 
(
     "mode_of_arrival_code_id"
)
;
--\echo Creating index 'idx_fk_patient_id_t_patient_wait_list'...
CREATE INDEX idx_fk_patient_id_t_patient_wait_list ON t_patient_wait_list 
USING BTREE 
(
     "patient_id"
)
;
--\echo Creating index 'enc_parent_major_diagnostic_category_code_id_idx'...
CREATE INDEX enc_parent_major_diagnostic_category_code_id_idx ON t_encounter 
USING BTREE 
(
     "major_diagnostic_category_code_id"
)
;
--\echo Creating index 'idx_fk_pay_to_location_id_t_claim'...
CREATE INDEX idx_fk_pay_to_location_id_t_claim ON t_claim 
USING BTREE 
(
     "pay_to_location_id"
)
;
--\echo Creating index 'enc_parent_patient_class_code_id_idx'...
CREATE INDEX enc_parent_patient_class_code_id_idx ON t_encounter 
USING BTREE 
(
     "patient_class_code_id"
)
;
--\echo Creating index 'idx_fk_patient_wait_list_id_t_patient_wait_list_preference'...
CREATE INDEX idx_fk_patient_wait_list_id_t_patient_wait_list_preference ON t_patient_wait_list_preference 
USING BTREE 
(
     "patient_wait_list_id"
)
;
--\echo Creating index 'enc_parent_notify_clergy_code_id_idx'...
CREATE INDEX enc_parent_notify_clergy_code_id_idx ON t_encounter 
USING BTREE 
(
     "notify_clergy_code_id"
)
;
--\echo Creating index 'idx_fk_patient_id_t_patient_encounter_diagnosis'...
CREATE INDEX idx_fk_patient_id_t_patient_encounter_diagnosis ON t_patient_encounter_diagnosis 
USING BTREE 
(
     "patient_id"
)
;
--\echo Creating index 'idx_fk_provider_availability_slot_id_appt'...
CREATE INDEX idx_fk_provider_availability_slot_id_appt ON t_provider_availability_appt 
USING BTREE 
(
     "provider_availability_slot_id"
)
;
--\echo Creating index 'enc_parent_diet_restriction_code_id_idx'...
CREATE INDEX enc_parent_diet_restriction_code_id_idx ON t_encounter 
USING BTREE 
(
     "diet_restriction_code_id"
)
;
--\echo Creating index 'enc_parent_diagnosis_related_group_code_id_idx'...
CREATE INDEX enc_parent_diagnosis_related_group_code_id_idx ON t_encounter 
USING BTREE 
(
     "diagnosis_related_group_code_id"
)
;
--\echo Creating index 'idx_fk_prefered_begin_time_t_patient_wait_list'...
CREATE INDEX idx_fk_prefered_begin_time_t_patient_wait_list ON t_patient_wait_list 
USING BTREE 
(
     "prefered_begin_time"
)
;
--\echo Creating index 'enc_parent_encounter_type_code_id_idx'...
CREATE INDEX enc_parent_encounter_type_code_id_idx ON t_encounter 
USING BTREE 
(
     "encounter_type_code_id"
)
;
--\echo Creating index 'idx_fk_prefered_begin_date_t_patient_wait_list'...
CREATE INDEX idx_fk_prefered_begin_date_t_patient_wait_list ON t_patient_wait_list 
USING BTREE 
(
     "prefered_begin_date"
)
;
--\echo Creating index 'enc_parent_encounter_sub_type_code_id_idx'...
CREATE INDEX enc_parent_encounter_sub_type_code_id_idx ON t_encounter 
USING BTREE 
(
     "encounter_sub_type_code_id"
)
;
--\echo Creating index 'idx_fk_prefered_end_time_t_patient_wait_list'...
CREATE INDEX idx_fk_prefered_end_time_t_patient_wait_list ON t_patient_wait_list 
USING BTREE 
(
     "prefered_end_time"
)
;
--\echo Creating index 'enc_parent_hospital_service_code_id_idx'...
CREATE INDEX enc_parent_hospital_service_code_id_idx ON t_encounter 
USING BTREE 
(
     "hospital_service_code_id"
)
;
--\echo Creating index 'idx_fk_prefered_end_date_t_patient_wait_list'...
CREATE INDEX idx_fk_prefered_end_date_t_patient_wait_list ON t_patient_wait_list 
USING BTREE 
(
     "prefered_end_date"
)
;
--\echo Creating index 'enc_parent_encounter_user_code_id_idx'...
CREATE INDEX enc_parent_encounter_user_code_id_idx ON t_encounter 
USING BTREE 
(
     "encounter_user_code_id"
)
;
--\echo Creating index 'idx_fk_nurse_left_room_time_t_appointment'...
CREATE INDEX idx_fk_nurse_left_room_time_t_appointment ON t_appointment 
USING BTREE 
(
     "nurse_left_room_time"
)
;
--\echo Creating index 'enc_parent_age_units_code_id_idx'...
CREATE INDEX enc_parent_age_units_code_id_idx ON t_encounter 
USING BTREE 
(
     "age"
)
;
--\echo Creating index 'idx_fk_nurse_left_room_date_t_appointment'...
CREATE INDEX idx_fk_nurse_left_room_date_t_appointment ON t_appointment 
USING BTREE 
(
     "nurse_left_room_date"
)
;
--\echo Creating index 'enc_parent_advance_directive_code_id_idx'...
CREATE INDEX enc_parent_advance_directive_code_id_idx ON t_encounter 
USING BTREE 
(
     "advance_directive_code_id"
)
;
--\echo Creating index 'idx_fk_notification_time_t_appointment_notification'...
CREATE INDEX idx_fk_notification_time_t_appointment_notification ON t_appointment_notification 
USING BTREE 
(
     "notification_time"
)
;
--\echo Creating index 'enc_parent_admission_level_of_care_code_id_idx'...
CREATE INDEX enc_parent_admission_level_of_care_code_id_idx ON t_encounter 
USING BTREE 
(
     "admission_level_of_care_code_id"
)
;
--\echo Creating index 'idx_fk_notification_date_t_appointment_notification'...
CREATE INDEX idx_fk_notification_date_t_appointment_notification ON t_appointment_notification 
USING BTREE 
(
     "notification_date"
)
;
--\echo Creating index 'enc_parent_accommodation_code_id_idx'...
CREATE INDEX enc_parent_accommodation_code_id_idx ON t_encounter 
USING BTREE 
(
     "accommodation_code_id"
)
;
--\echo Creating index 'enc_parent_courtesy_code_id_idx'...
CREATE INDEX enc_parent_courtesy_code_id_idx ON t_encounter 
USING BTREE 
(
     "courtesy_code_id"
)
;
--\echo Creating index 'enc_encounter_user_code_id_idx'...
CREATE INDEX enc_encounter_user_code_id_idx ON t_encounter 
USING BTREE 
(
     "encounter_user_code_id"
)
;
--\echo Creating index 'idx_fk_patient_id_t_encounter'...
CREATE INDEX idx_fk_patient_id_t_encounter ON t_encounter 
USING BTREE 
(
     "patient_id"
)
;
--\echo Creating index 'idx_fk_patient_id_t_appointment'...
CREATE INDEX idx_fk_patient_id_t_appointment ON t_appointment 
USING BTREE 
(
     "patient_id"
)
;
--\echo Creating index 'idx_fk_patient_id_t_account'...
CREATE INDEX idx_fk_patient_id_t_account ON t_account 
USING BTREE 
(
     "patient_id"
)
;
--\echo Creating index 'enc_notify_clergy_code_id_idx'...
CREATE INDEX enc_notify_clergy_code_id_idx ON t_encounter 
USING BTREE 
(
     "notify_clergy_code_id"
)
;
--\echo Creating index 'idx_fk_parent_code_id_t_dim_codeset'...
CREATE INDEX idx_fk_parent_code_id_t_dim_codeset ON t_dim_codeset 
USING BTREE 
(
     "parent_code_id"
)
;
--\echo Creating index 'enc_mode_of_arrival_code_id_idx'...
CREATE INDEX enc_mode_of_arrival_code_id_idx ON t_encounter 
USING BTREE 
(
     "mode_of_arrival_code_id"
)
;
--\echo Creating index 'idx_fk_paged_time_t_appointment'...
CREATE INDEX idx_fk_paged_time_t_appointment ON t_appointment 
USING BTREE 
(
     "paged_time"
)
;
--\echo Creating index 'enc_major_diagnostic_category_code_id_idx'...
CREATE INDEX enc_major_diagnostic_category_code_id_idx ON t_encounter 
USING BTREE 
(
     "major_diagnostic_category_code_id"
)
;
--\echo Creating index 'idx_fk_paged_date_t_appointment'...
CREATE INDEX idx_fk_paged_date_t_appointment ON t_appointment 
USING BTREE 
(
     "paged_date"
)
;
--\echo Creating index 'enc_hospital_service_code_id_idx'...
CREATE INDEX enc_hospital_service_code_id_idx ON t_encounter 
USING BTREE 
(
     "hospital_service_code_id"
)
;
--\echo Creating index 'idx_fk_referral_id_t_patient_wait_list'...
CREATE INDEX idx_fk_referral_id_t_patient_wait_list ON t_patient_wait_list 
USING BTREE 
(
     "referral_id"
)
;
--\echo Creating index 'enc_encounter_type_code_id_idx'...
CREATE INDEX enc_encounter_type_code_id_idx ON t_encounter 
USING BTREE 
(
     "encounter_type_code_id"
)
;
--\echo Creating index 'enc_encounter_sub_type_code_id_idx'...
CREATE INDEX enc_encounter_sub_type_code_id_idx ON t_encounter 
USING BTREE 
(
     "encounter_sub_type_code_id"
)
;
--\echo Creating index 'idx_fk_release_date_t_provider_template'...
CREATE INDEX idx_fk_release_date_t_provider_template ON t_provider_template 
USING BTREE 
(
     "release_date"
)
;
--\echo Creating index 'idx_fk_referral_time_t_referral_source'...
CREATE INDEX idx_fk_referral_time_t_referral_source ON t_referral_source 
USING BTREE 
(
     "referral_time"
)
;
--\echo Creating index 'idx_fk_room_assigned_date_t_appointment'...
CREATE INDEX idx_fk_room_assigned_date_t_appointment ON t_appointment 
USING BTREE 
(
     "room_assigned_date"
)
;
--\echo Creating index 'enc_courtesy_code_id_idx'...
CREATE INDEX enc_courtesy_code_id_idx ON t_encounter 
USING BTREE 
(
     "courtesy_code_id"
)
;
--\echo Creating index 'idx_fk_release_time_t_provider_template'...
CREATE INDEX idx_fk_release_time_t_provider_template ON t_provider_template 
USING BTREE 
(
     "release_time"
)
;
--\echo Creating index 'enc_age_units_code_id_idx'...
CREATE INDEX enc_age_units_code_id_idx ON t_encounter 
USING BTREE 
(
     "age"
)
;
--\echo Creating index 'idx_fk_roomed_date_t_appointment'...
CREATE INDEX idx_fk_roomed_date_t_appointment ON t_appointment 
USING BTREE 
(
     "roomed_date"
)
;
--\echo Creating index 'enc_diet_restriction_code_id_idx'...
CREATE INDEX enc_diet_restriction_code_id_idx ON t_encounter 
USING BTREE 
(
     "diet_restriction_code_id"
)
;
--\echo Creating index 'idx_fk_room_assigned_time_t_appointment'...
CREATE INDEX idx_fk_room_assigned_time_t_appointment ON t_appointment 
USING BTREE 
(
     "room_assigned_time"
)
;
--\echo Creating index 'enc_diagnosis_related_group_code_id_idx'...
CREATE INDEX enc_diagnosis_related_group_code_id_idx ON t_encounter 
USING BTREE 
(
     "diagnosis_related_group_code_id"
)
;
--\echo Creating index 'idx_fk_schedule_end_date_t_provider_template_schedule'...
CREATE INDEX idx_fk_schedule_end_date_t_provider_template_schedule ON t_provider_template_schedule 
USING BTREE 
(
     "schedule_end_date"
)
;
--\echo Creating index 'enc_accommodation_code_id_idx'...
CREATE INDEX enc_accommodation_code_id_idx ON t_encounter 
USING BTREE 
(
     "accommodation_code_id"
)
;
--\echo Creating index 'bil_type_code_idx'...
CREATE INDEX bil_type_code_idx ON t_bill 
USING BTREE 
(
     "type_code_id"
)
;
--\echo Creating index 'idx_fk_roomed_time_t_appointment'...
CREATE INDEX idx_fk_roomed_time_t_appointment ON t_appointment 
USING BTREE 
(
     "roomed_time"
)
;
--\echo Creating index 'enc_advance_directive_code_id_idx'...
CREATE INDEX enc_advance_directive_code_id_idx ON t_encounter 
USING BTREE 
(
     "advance_directive_code_id"
)
;
--\echo Creating index 'idx_fk_schedule_end_time_t_provider_template_schedule'...
CREATE INDEX idx_fk_schedule_end_time_t_provider_template_schedule ON t_provider_template_schedule 
USING BTREE 
(
     "schedule_end_time"
)
;
--\echo Creating index 'enc_admission_level_of_care_code_id_idx'...
CREATE INDEX enc_admission_level_of_care_code_id_idx ON t_encounter 
USING BTREE 
(
     "admission_level_of_care_code_id"
)
;
--\echo Creating index 'idx_fk_provider_entered_room_time_t_appointment'...
CREATE INDEX idx_fk_provider_entered_room_time_t_appointment ON t_appointment 
USING BTREE 
(
     "provider_entered_room_time"
)
;
--\echo Creating index 'idx_fk_provider_entered_room_date_t_appointment'...
CREATE INDEX idx_fk_provider_entered_room_date_t_appointment ON t_appointment 
USING BTREE 
(
     "provider_entered_room_date"
)
;
--\echo Creating index 'idx_fk_provider_id_t_provider_template'...
CREATE INDEX idx_fk_provider_id_t_provider_template ON t_provider_template 
USING BTREE 
(
     "provider_id"
)
;
--\echo Creating index 'idx_fk_provider_id_t_provider_availability_slot'...
CREATE INDEX idx_fk_provider_id_t_provider_availability_slot ON t_provider_availability_slot 
USING BTREE 
(
     "provider_id"
)
;
--\echo Creating index 'idx_fk_provider_id_t_charge'...
CREATE INDEX idx_fk_provider_id_t_charge ON t_charge 
USING BTREE 
(
     "provider_id"
)
;
--\echo Creating index 'idx_fk_provider_id_t_appointment'...
CREATE INDEX idx_fk_provider_id_t_appointment ON t_appointment 
USING BTREE 
(
     "provider_id"
)
;
--\echo Creating index 'idx_fk_referral_date_t_referral_source'...
CREATE INDEX idx_fk_referral_date_t_referral_source ON t_referral_source 
USING BTREE 
(
     "referral_date"
)
;
--\echo Creating index 'idx_fk_received_time_t_specimen'...
CREATE INDEX idx_fk_received_time_t_specimen ON t_specimen 
USING BTREE 
(
     "received_time"
)
;
--\echo Creating index 'idx_fk_received_date_t_specimen'...
CREATE INDEX idx_fk_received_date_t_specimen ON t_specimen 
USING BTREE 
(
     "received_date"
)
;
--\echo Creating index 'idx_fk_provider_template_id_t_provider_template_schedule'...
CREATE INDEX idx_fk_provider_template_id_t_provider_template_schedule ON t_provider_template_schedule 
USING BTREE 
(
     "provider_template_id"
)
;
--\echo Creating index 'idx_fk_appointment_end_time_t_appointment'...
CREATE INDEX idx_fk_appointment_end_time_t_appointment ON t_appointment 
USING BTREE 
(
     "appointment_end_time"
)
;
--\echo Creating index 'idx_fk_appointment_id_t_appointment_notification'...
CREATE INDEX idx_fk_appointment_id_t_appointment_notification ON t_appointment_notification 
USING BTREE 
(
     "appointment_id"
)
;
--\echo Creating index 'idx_fk_appointment_id_t_patient_wait_list'...
CREATE INDEX idx_fk_appointment_id_t_patient_wait_list ON t_patient_wait_list 
USING BTREE 
(
     "appointment_id"
)
;
--\echo Creating index 'idx_fk_appointment_id_t_provider_availability_appt'...
CREATE INDEX idx_fk_appointment_id_t_provider_availability_appt ON t_provider_availability_appt 
USING BTREE 
(
     "appointment_id"
)
;
--\echo Creating index 'pas_blocked_indicator_code_idx'...
CREATE INDEX pas_blocked_indicator_code_idx ON t_provider_availability_slot 
USING BTREE 
(
     "blocked_indicator_code_id"
)
;
--\echo Creating index 'idx_fk_appointment_start_date_t_appointment'...
CREATE INDEX idx_fk_appointment_start_date_t_appointment ON t_appointment 
USING BTREE 
(
     "appointment_start_date"
)
;
--\echo Creating index 'idx_fk_appointment_start_time_t_appointment'...
CREATE INDEX idx_fk_appointment_start_time_t_appointment ON t_appointment 
USING BTREE 
(
     "appointment_start_time"
)
;
--\echo Creating index 'idx_fk_arrival_date_t_encounter'...
CREATE INDEX idx_fk_arrival_date_t_encounter ON t_encounter 
USING BTREE 
(
     "arrival_date"
)
;
--\echo Creating index 'idx_fk_arrival_list_removal_date_t_appointment'...
CREATE INDEX idx_fk_arrival_list_removal_date_t_appointment ON t_appointment 
USING BTREE 
(
     "arrival_list_removal_date"
)
;
--\echo Creating index 'idx_fk_triage_end_date_t_encounter'...
CREATE INDEX idx_fk_triage_end_date_t_encounter ON t_encounter 
USING BTREE 
(
     "triage_end_date"
)
;
--\echo Creating index 'idx_fk_triage_end_time_t_encounter'...
CREATE INDEX idx_fk_triage_end_time_t_encounter ON t_encounter 
USING BTREE 
(
     "triage_end_time"
)
;
--\echo Creating index 'idx_fk_triage_start_date_t_encounter'...
CREATE INDEX idx_fk_triage_start_date_t_encounter ON t_encounter 
USING BTREE 
(
     "triage_start_date"
)
;
--\echo Creating index 'idx_fk_triage_start_time_t_encounter'...
CREATE INDEX idx_fk_triage_start_time_t_encounter ON t_encounter 
USING BTREE 
(
     "triage_start_time"
)
;
--\echo Creating index 'idx_fk_to_facility_location_id_t_referral_source'...
CREATE INDEX idx_fk_to_facility_location_id_t_referral_source ON t_referral_source 
USING BTREE 
(
     "to_facility_location_id"
)
;
--\echo Creating index 'idx_fk_to_provider_id_t_referral_source'...
CREATE INDEX idx_fk_to_provider_id_t_referral_source ON t_referral_source 
USING BTREE 
(
     "to_provider_id"
)
;
--\echo Creating index 'idx_fk_transaction_date_t_account_transaction'...
CREATE INDEX idx_fk_transaction_date_t_account_transaction ON t_account_transaction 
USING BTREE 
(
     "transaction_date"
)
;
--\echo Creating index 'idx_fk_transaction_time_t_account_transaction'...
CREATE INDEX idx_fk_transaction_time_t_account_transaction ON t_account_transaction 
USING BTREE 
(
     "transaction_time"
)
;
--\echo Creating index 'idx_fk_start_time_t_provider_template_schedule'...
CREATE INDEX idx_fk_start_time_t_provider_template_schedule ON t_provider_template_schedule 
USING BTREE 
(
     "start_time"
)
;
--\echo Creating index 'idx_fk_appointment_end_date_t_appointment'...
CREATE INDEX idx_fk_appointment_end_date_t_appointment ON t_appointment 
USING BTREE 
(
     "appointment_end_date"
)
;
--\echo Creating index 'idx_fk_adv_dir_last_verif_time_t_encounter'...
CREATE INDEX idx_fk_adv_dir_last_verif_time_t_encounter ON t_encounter 
USING BTREE 
(
     "adv_dir_last_verif_time"
)
;
--\echo Creating index 'idx_fk_account_id_t_account_guarantor'...
CREATE INDEX idx_fk_account_id_t_account_guarantor ON t_account_guarantor 
USING BTREE 
(
     "account_id"
)
;
--\echo Creating index 'idx_fk_account_id_t_account_health_plan_coverage'...
CREATE INDEX idx_fk_account_id_t_account_health_plan_coverage ON t_account_health_plan_coverage 
USING BTREE 
(
     "account_id"
)
;
--\echo Creating index 'enc_special_program_code_id_idx'...
CREATE INDEX enc_special_program_code_id_idx ON t_encounter 
USING BTREE 
(
     "special_program_code_id"
)
;
--\echo Creating index 'enc_triage_severity_code_id_idx'...
CREATE INDEX enc_triage_severity_code_id_idx ON t_encounter 
USING BTREE 
(
     "triage_severity_code_id"
)
;
--\echo Creating index 'idx_fk_account_id_t_charge'...
CREATE INDEX idx_fk_account_id_t_charge ON t_charge 
USING BTREE 
(
     "account_id"
)
;
--\echo Creating index 'idx_fk_account_id_t_claim'...
CREATE INDEX idx_fk_account_id_t_claim ON t_claim 
USING BTREE 
(
     "account_id"
)
;
--\echo Creating index 'idx_fk_sign_in_time_t_appointment'...
CREATE INDEX idx_fk_sign_in_time_t_appointment ON t_appointment 
USING BTREE 
(
     "sign_in_time"
)
;
--\echo Creating index 'idx_fk_account_id_t_account_transaction'...
CREATE INDEX idx_fk_account_id_t_account_transaction ON t_account_transaction 
USING BTREE 
(
     "account_id"
)
;
--\echo Creating index 'idx_fk_specimen_id_t_specimen'...
CREATE INDEX idx_fk_specimen_id_t_specimen ON t_specimen 
USING BTREE 
(
     "specimen_id"
)
;
--\echo Creating index 'idx_fk_account_id_t_bill'...
CREATE INDEX idx_fk_account_id_t_bill ON t_bill 
USING BTREE 
(
     "account_id"
)
;
--\echo Creating index 'idx_fk_service_time_t_charge'...
CREATE INDEX idx_fk_service_time_t_charge ON t_charge 
USING BTREE 
(
     "service_time"
)
;
--\echo Creating index 'idx_fk_sign_in_date_t_appointment'...
CREATE INDEX idx_fk_sign_in_date_t_appointment ON t_appointment 
USING BTREE 
(
     "sign_in_date"
)
;
--\echo Creating index 'idx_fk_service_line_id_t_charge'...
CREATE INDEX idx_fk_service_line_id_t_charge ON t_charge 
USING BTREE 
(
     "service_line_id"
)
;
--\echo Creating index 'idx_fk_adv_dir_last_verif_date_t_encounter'...
CREATE INDEX idx_fk_adv_dir_last_verif_date_t_encounter ON t_encounter 
USING BTREE 
(
     "adv_dir_last_verif_date"
)
;
--\echo Creating index 'idx_fk_service_line_id_t_encounter'...
CREATE INDEX idx_fk_service_line_id_t_encounter ON t_encounter 
USING BTREE 
(
     "service_line_id"
)
;
--\echo Creating index 'idx_fk_service_date_t_charge'...
CREATE INDEX idx_fk_service_date_t_charge ON t_charge 
USING BTREE 
(
     "service_date"
)
;
--\echo Creating index 'idx_fk_service_line_id_t_account_transaction'...
CREATE INDEX idx_fk_service_line_id_t_account_transaction ON t_account_transaction 
USING BTREE 
(
     "service_line_id"
)
;
--\echo Creating index 'idx_fk_schedule_start_date_t_provider_template_schedule'...
CREATE INDEX idx_fk_schedule_start_date_t_provider_template_schedule ON t_provider_template_schedule 
USING BTREE 
(
     "schedule_start_date"
)
;
--\echo Creating index 'idx_fk_schedule_start_time_t_provider_template_schedule'...
CREATE INDEX idx_fk_schedule_start_time_t_provider_template_schedule ON t_provider_template_schedule 
USING BTREE 
(
     "schedule_start_time"
)
;
--\echo Creating index 'enc_severity_of_illness_code_id_idx'...
CREATE INDEX enc_severity_of_illness_code_id_idx ON t_encounter 
USING BTREE 
(
     "severity_of_illness_code_id"
)
;
--\echo Creating index 'enc_patient_type_code_id_idx'...
CREATE INDEX enc_patient_type_code_id_idx ON t_encounter 
USING BTREE 
(
     "patient_type_code_id"
)
;
--\echo Creating index 'enc_precaution_code_id_idx'...
CREATE INDEX enc_precaution_code_id_idx ON t_encounter 
USING BTREE 
(
     "precaution_code_id"
)
;
--\echo Creating index 'enc_priority_code_id_idx'...
CREATE INDEX enc_priority_code_id_idx ON t_encounter 
USING BTREE 
(
     "priority_code_id"
)
;
--\echo Creating index 'enc_publicity_code_id_idx'...
CREATE INDEX enc_publicity_code_id_idx ON t_encounter 
USING BTREE 
(
     "publicity_code_id"
)
;
--\echo Creating index 'enc_parent_triage_severity_code_id_idx'...
CREATE INDEX enc_parent_triage_severity_code_id_idx ON t_encounter 
USING BTREE 
(
     "triage_severity_code_id"
)
;
--\echo Creating index 'enc_patient_class_code_id_idx'...
CREATE INDEX enc_patient_class_code_id_idx ON t_encounter 
USING BTREE 
(
     "patient_class_code_id"
)
;
--\echo Creating index 'enc_patient_condition_code_id_idx'...
CREATE INDEX enc_patient_condition_code_id_idx ON t_encounter 
USING BTREE 
(
     "patient_condition_code_id"
)
;
--\echo Creating index 'enc_patient_importance_code_id_idx'...
CREATE INDEX enc_patient_importance_code_id_idx ON t_encounter 
USING BTREE 
(
     "patient_importance_code_id"
)
;
--\echo Creating index 'rfl_primary_reason_code_idx'...
CREATE INDEX rfl_primary_reason_code_idx ON t_referral_source 
USING BTREE 
(
     "primary_reason_code_id"
)
;
--\echo Creating index 'rfl_refer_to_specialty_code'...
CREATE INDEX rfl_refer_to_specialty_code ON t_referral_source 
USING BTREE 
(
     "refer_to_specialty_code_id"
)
;
--\echo Creating index 'rfl_referral_class_code_idx'...
CREATE INDEX rfl_referral_class_code_idx ON t_referral_source 
USING BTREE 
(
     "referral_class_code_id"
)
;
--\echo Creating index 'rfl_referral_priority_code_idx'...
CREATE INDEX rfl_referral_priority_code_idx ON t_referral_source 
USING BTREE 
(
     "referral_priority_code_id"
)
;
--\echo Creating index 'rfl_referral_status_code_idx'...
CREATE INDEX rfl_referral_status_code_idx ON t_referral_source 
USING BTREE 
(
     "referral_status_code_id"
)
;
--\echo Creating index 'enc_recurring_service_code_id_idx'...
CREATE INDEX enc_recurring_service_code_id_idx ON t_encounter 
USING BTREE 
(
     "recurring_service_code_id"
)
;
--\echo Creating index 'rfl_referral_type_code_idx'...
CREATE INDEX rfl_referral_type_code_idx ON t_referral_source 
USING BTREE 
(
     "referral_type_code_id"
)
;
--\echo Creating index 'enc_risk_of_mortality_code_id_idx'...
CREATE INDEX enc_risk_of_mortality_code_id_idx ON t_encounter 
USING BTREE 
(
     "risk_of_mortality_code_id"
)
;
--\echo Creating index 'spe_appropriateness_code_idx'...
CREATE INDEX spe_appropriateness_code_idx ON t_specimen 
USING BTREE 
(
     "appropriateness_code_id"
)
;
--\echo Creating index 'pwl_visit_type_code_idx'...
CREATE INDEX pwl_visit_type_code_idx ON t_patient_wait_list 
USING BTREE 
(
     "visit_type_code_id"
)
;
--\echo Creating index 'rfl_nonpref_provider_reason_code_idx'...
CREATE INDEX rfl_nonpref_provider_reason_code_idx ON t_referral_source 
USING BTREE 
(
     "nonpref_provider_reason_code_id"
)
;
--\echo Creating index 'pwl_wait_list_status_code_idx'...
CREATE INDEX pwl_wait_list_status_code_idx ON t_patient_wait_list 
USING BTREE 
(
     "wait_list_status_code_id"
)
;
--\echo Creating index 'enc_parent_publicity_code_id_idx'...
CREATE INDEX enc_parent_publicity_code_id_idx ON t_encounter 
USING BTREE 
(
     "publicity_code_id"
)
;
--\echo Creating index 'enc_parent_recurring_service_code_id_idx'...
CREATE INDEX enc_parent_recurring_service_code_id_idx ON t_encounter 
USING BTREE 
(
     "recurring_service_code_id"
)
;
--\echo Creating index 'enc_parent_precaution_code_id_idx'...
CREATE INDEX enc_parent_precaution_code_id_idx ON t_encounter 
USING BTREE 
(
     "precaution_code_id"
)
;
--\echo Creating index 'enc_parent_priority_code_id_idx'...
CREATE INDEX enc_parent_priority_code_id_idx ON t_encounter 
USING BTREE 
(
     "priority_code_id"
)
;
--\echo Creating index 'enc_parent_patient_importance_code_id_idx'...
CREATE INDEX enc_parent_patient_importance_code_id_idx ON t_encounter 
USING BTREE 
(
     "patient_importance_code_id"
)
;
--\echo Creating index 'enc_parent_patient_type_code_id_idx'...
CREATE INDEX enc_parent_patient_type_code_id_idx ON t_encounter 
USING BTREE 
(
     "patient_type_code_id"
)
;
--\echo Creating index 'enc_parent_patient_condition_code_id_idx'...
CREATE INDEX enc_parent_patient_condition_code_id_idx ON t_encounter 
USING BTREE 
(
     "patient_condition_code_id"
)
;
--\echo Creating index 'pas_unavailable_indicator_code_idx'...
CREATE INDEX pas_unavailable_indicator_code_idx ON t_provider_availability_slot 
USING BTREE 
(
     "unavailable_indicator_code_id"
)
;
--\echo Creating index 'pas_unavailable_reason_code_idx'...
CREATE INDEX pas_unavailable_reason_code_idx ON t_provider_availability_slot 
USING BTREE 
(
     "unavailable_reason_code_id"
)
;
--\echo Creating index 'pas_held_reason_code_idx'...
CREATE INDEX pas_held_reason_code_idx ON t_provider_availability_slot 
USING BTREE 
(
     "held_reason_code_id"
)
;
--\echo Creating index 'pas_private_slot_code_idx'...
CREATE INDEX pas_private_slot_code_idx ON t_provider_availability_slot 
USING BTREE 
(
     "private_slot_code_id"
)
;
--\echo Creating index 'pwl_removal_reason_code_idx'...
CREATE INDEX pwl_removal_reason_code_idx ON t_patient_wait_list 
USING BTREE 
(
     "removal_reason_code_id"
)
;
--\echo Creating index 'enc_parent_special_program_code_id_idx'...
CREATE INDEX enc_parent_special_program_code_id_idx ON t_encounter 
USING BTREE 
(
     "special_program_code_id"
)
;
--\echo Creating index 'pwl_treatment_code_idx'...
CREATE INDEX pwl_treatment_code_idx ON t_patient_wait_list 
USING BTREE 
(
     "treatment_code_id"
)
;
--\echo Creating index 'prt_overbooking_allowed_code_idx'...
CREATE INDEX prt_overbooking_allowed_code_idx ON t_provider_template 
USING BTREE 
(
     "overbooking_allowed_code_id"
)
;
--\echo Creating index 'enc_parent_risk_of_mortality_code_id_idx'...
CREATE INDEX enc_parent_risk_of_mortality_code_id_idx ON t_encounter 
USING BTREE 
(
     "risk_of_mortality_code_id"
)
;
--\echo Creating index 'pwl_priority_code_idx'...
CREATE INDEX pwl_priority_code_idx ON t_patient_wait_list 
USING BTREE 
(
     "priority_code_id"
)
;
--\echo Creating index 'enc_parent_severity_of_illness_code_id_idx'...
CREATE INDEX enc_parent_severity_of_illness_code_id_idx ON t_encounter 
USING BTREE 
(
     "severity_of_illness_code_id"
)
;
--\echo Creating index 'pas_held_indicator_code_idx'...
CREATE INDEX pas_held_indicator_code_idx ON t_provider_availability_slot 
USING BTREE 
(
     "held_indicator_code_id"
)
;
--\echo Creating index 'pas_blocked_reason_code_idx'...
CREATE INDEX pas_blocked_reason_code_idx ON t_provider_availability_slot 
USING BTREE 
(
     "blocked_reason_code_id"
)
;
--\echo Creating index 'idx_fk_expiration_date_t_specimen'...
CREATE INDEX idx_fk_expiration_date_t_specimen ON t_specimen 
USING BTREE 
(
     "expiration_date"
)
;
--\echo Creating index 'idx_fk_expiration_time_t_specimen'...
CREATE INDEX idx_fk_expiration_time_t_specimen ON t_specimen 
USING BTREE 
(
     "expiration_time"
)
;
--\echo Creating index 'idx_fk_external_referral_date_t_referral_source'...
CREATE INDEX idx_fk_external_referral_date_t_referral_source ON t_referral_source 
USING BTREE 
(
     "referral_date"
)
;
--\echo Creating index 'idx_fk_external_referral_time_t_referral_source'...
CREATE INDEX idx_fk_external_referral_time_t_referral_source ON t_referral_source 
USING BTREE 
(
     "referral_time"
)
;
--\echo Creating index 'idx_fk_end_time_t_provider_template_schedule'...
CREATE INDEX idx_fk_end_time_t_provider_template_schedule ON t_provider_template_schedule 
USING BTREE 
(
     "end_time"
)
;
--\echo Creating index 'app_warning_overridden_code_idx'...
CREATE INDEX app_warning_overridden_code_idx ON t_appointment 
USING BTREE 
(
     "warning_overridden_code_id"
)
;
--\echo Creating index 'bil_category_code_idx'...
CREATE INDEX bil_category_code_idx ON t_bill 
USING BTREE 
(
     "category_code_id"
)
;
--\echo Creating index 'bil_currency_code_idx'...
CREATE INDEX bil_currency_code_idx ON t_bill 
USING BTREE 
(
     "currency_code_id"
)
;
--\echo Creating index 'bil_status_code_idx'...
CREATE INDEX bil_status_code_idx ON t_bill 
USING BTREE 
(
     "status_code_id"
)
;
--\echo Creating index 'spe_availability_indicator_code_idx'...
CREATE INDEX spe_availability_indicator_code_idx ON t_specimen 
USING BTREE 
(
     "availability_indicator_code_id"
)
;
--\echo Creating index 'spe_child_role_code_idx'...
CREATE INDEX spe_child_role_code_idx ON t_specimen 
USING BTREE 
(
     "role_code_id"
)
;
--\echo Creating index 'spe_collection_amount_uom_code_idx'...
CREATE INDEX spe_collection_amount_uom_code_idx ON t_specimen 
USING BTREE 
(
     "collection_amount"
)
;
--\echo Creating index 'spe_collection_body_site_code_idx'...
CREATE INDEX spe_collection_body_site_code_idx ON t_specimen 
USING BTREE 
(
     "collection_body_site_code_id"
)
;
--\echo Creating index 'spe_condition_code_idx'...
CREATE INDEX spe_condition_code_idx ON t_specimen 
USING BTREE 
(
     "condition_code_id"
)
;
--\echo Creating index 'spe_collection_method_code_idx'...
CREATE INDEX spe_collection_method_code_idx ON t_specimen 
USING BTREE 
(
     "collection_method_code_id"
)
;
--\echo Creating index 'spe_container_type_code_idx'...
CREATE INDEX spe_container_type_code_idx ON t_specimen 
USING BTREE 
(
     "type_code_id"
)
;
--\echo Creating index 'app_same_day_code_idx'...
CREATE INDEX app_same_day_code_idx ON t_appointment 
USING BTREE 
(
     "same_day_code_id"
)
;
--\echo Creating index 'spe_container_condition_code_idx'...
CREATE INDEX spe_container_condition_code_idx ON t_specimen 
USING BTREE 
(
     "condition_code_id"
)
;
--\echo Creating index 'app_referral_code_idx'...
CREATE INDEX app_referral_code_idx ON t_appointment 
USING BTREE 
(
     "referral_code_id"
)
;
--\echo Creating index 'spe_handling_code_idx'...
CREATE INDEX spe_handling_code_idx ON t_specimen 
USING BTREE 
(
     "handling_code_id"
)
;
--\echo Creating index 'app_time_unavailable_code_idx'...
CREATE INDEX app_time_unavailable_code_idx ON t_appointment 
USING BTREE 
(
     "time_unavailable_code_id"
)
;
--\echo Creating index 'spe_current_quantity_uom_code_idx'...
CREATE INDEX spe_current_quantity_uom_code_idx ON t_specimen 
USING BTREE 
(
     "current_quantity"
)
;
--\echo Creating index 'app_sequential_appointment_code_idx'...
CREATE INDEX app_sequential_appointment_code_idx ON t_appointment 
USING BTREE 
(
     "sequential_appointment_code_id"
)
;
--\echo Creating index 'app_walk_in_code_idx'...
CREATE INDEX app_walk_in_code_idx ON t_appointment 
USING BTREE 
(
     "walk_in_code_id"
)
;
--\echo Creating index 'app_visit_type_code_idx'...
CREATE INDEX app_visit_type_code_idx ON t_appointment 
USING BTREE 
(
     "visit_type_code_id"
)
;
--\echo Creating index 'idx_fk_from_facility_location_id_t_referral_source'...
CREATE INDEX idx_fk_from_facility_location_id_t_referral_source ON t_referral_source 
USING BTREE 
(
     "from_facility_location_id"
)
;
--\echo Creating index 'idx_fk_facility_location_id_t_patient_wait_list_preference'...
CREATE INDEX idx_fk_facility_location_id_t_patient_wait_list_preference ON t_patient_wait_list_preference 
USING BTREE 
(
     "facility_location_id"
)
;
--\echo Creating index 'idx_fk_facility_location_id_t_appointment'...
CREATE INDEX idx_fk_facility_location_id_t_appointment ON t_appointment 
USING BTREE 
(
     "facility_location_id"
)
;
--\echo Creating index 'idx_fk_facility_location_id_t_provider_template'...
CREATE INDEX idx_fk_facility_location_id_t_provider_template ON t_provider_template 
USING BTREE 
(
     "facility_location_id"
)
;
--\echo Creating index 'idx_fk_facility_location_id_t_provider_availability_slot'...
CREATE INDEX idx_fk_facility_location_id_t_provider_availability_slot ON t_provider_availability_slot 
USING BTREE 
(
     "facility_location_id"
)
;
--\echo Creating index 'idx_fk_arrival_list_removal_time_t_appointment'...
CREATE INDEX idx_fk_arrival_list_removal_time_t_appointment ON t_appointment 
USING BTREE 
(
     "arrival_list_removal_time"
)
;
--\echo Creating index 'idx_fk_arrival_time_t_encounter'...
CREATE INDEX idx_fk_arrival_time_t_encounter ON t_encounter 
USING BTREE 
(
     "arrival_time"
)
;
--\echo Creating index 'idx_fk_bill_id_t_bill_line_item'...
CREATE INDEX idx_fk_bill_id_t_bill_line_item ON t_bill_line_item 
USING BTREE 
(
     "bill_id"
)
;
--\echo Creating index 'idx_fk_cancelled_time_t_appointment'...
CREATE INDEX idx_fk_cancelled_time_t_appointment ON t_appointment 
USING BTREE 
(
     "cancelled_time"
)
;
--\echo Creating index 'idx_fk_cancelled_date_t_appointment'...
CREATE INDEX idx_fk_cancelled_date_t_appointment ON t_appointment 
USING BTREE 
(
     "cancelled_date"
)
;
--\echo Creating index 'idx_fk_charge_time_t_charge'...
CREATE INDEX idx_fk_charge_time_t_charge ON t_charge 
USING BTREE 
(
     "charge_time"
)
;
--\echo Creating index 'idx_fk_charge_date_t_charge'...
CREATE INDEX idx_fk_charge_date_t_charge ON t_charge 
USING BTREE 
(
     "charge_date"
)
;
--\echo Creating index 'idx_fk_check_in_time_t_appointment'...
CREATE INDEX idx_fk_check_in_time_t_appointment ON t_appointment 
USING BTREE 
(
     "check_in_time"
)
;
--\echo Creating index 'idx_fk_check_in_date_t_appointment'...
CREATE INDEX idx_fk_check_in_date_t_appointment ON t_appointment 
USING BTREE 
(
     "check_in_date"
)
;
--\echo Creating index 'idx_fk_check_out_date_t_appointment'...
CREATE INDEX idx_fk_check_out_date_t_appointment ON t_appointment 
USING BTREE 
(
     "check_out_date"
)
;
--\echo Creating index 'idx_fk_claim_time_t_claim'...
CREATE INDEX idx_fk_claim_time_t_claim ON t_claim 
USING BTREE 
(
     "claim_time"
)
;
--\echo Creating index 'idx_fk_collection_date_t_specimen'...
CREATE INDEX idx_fk_collection_date_t_specimen ON t_specimen 
USING BTREE 
(
     "collection_date"
)
;
--\echo Creating index 'idx_fk_check_out_time_t_appointment'...
CREATE INDEX idx_fk_check_out_time_t_appointment ON t_appointment 
USING BTREE 
(
     "check_out_time"
)
;
--\echo Creating index 'idx_fk_claim_date_t_claim'...
CREATE INDEX idx_fk_claim_date_t_claim ON t_claim 
USING BTREE 
(
     "claim_date"
)
;
--\echo Creating index 'idx_fk_departure_date_t_encounter'...
CREATE INDEX idx_fk_departure_date_t_encounter ON t_encounter 
USING BTREE 
(
     "departure_date"
)
;
--\echo Creating index 'idx_fk_confirmed_time_t_appointment'...
CREATE INDEX idx_fk_confirmed_time_t_appointment ON t_appointment 
USING BTREE 
(
     "confirmed_time"
)
;
--\echo Creating index 'idx_fk_confirmed_date_t_appointment'...
CREATE INDEX idx_fk_confirmed_date_t_appointment ON t_appointment 
USING BTREE 
(
     "confirmed_date"
)
;
--\echo Creating index 'idx_fk_collection_time_t_specimen'...
CREATE INDEX idx_fk_collection_time_t_specimen ON t_specimen 
USING BTREE 
(
     "collection_time"
)
;
--\echo Creating index 'idx_fk_encounter_id_t_patient_encounter_diagnosis'...
CREATE INDEX idx_fk_encounter_id_t_patient_encounter_diagnosis ON t_patient_encounter_diagnosis 
USING BTREE 
(
     "encounter_id"
)
;
--\echo Creating index 'idx_fk_departure_time_t_encounter'...
CREATE INDEX idx_fk_departure_time_t_encounter ON t_encounter 
USING BTREE 
(
     "departure_time"
)
;
--\echo Creating index 'spe_risk_code_idx'...
CREATE INDEX spe_risk_code_idx ON t_specimen 
USING BTREE 
(
     "risk_code_id"
)
;
--\echo Creating index 'spe_role_code_idx'...
CREATE INDEX spe_role_code_idx ON t_specimen 
USING BTREE 
(
     "role_code_id"
)
;
--\echo Creating index 'spe_source_body_site_code_idx'...
CREATE INDEX spe_source_body_site_code_idx ON t_specimen 
USING BTREE 
(
     "source_body_site_code_id"
)
;
--\echo Creating index 'spe_source_body_site_modifier_code_idx'...
CREATE INDEX spe_source_body_site_modifier_code_idx ON t_specimen 
USING BTREE 
(
     "source_body_site_modifier_code_id"
)
;
--\echo Creating index 'spe_specimen_id_idx'...
CREATE INDEX spe_specimen_id_idx ON t_specimen 
USING BTREE 
(
     "specimen_id"
)
;
--\echo Creating index 'spe_type_code_idx'...
CREATE INDEX spe_type_code_idx ON t_specimen 
USING BTREE 
(
     "type_code_id"
)
;
--\echo Creating index 'spe_type_modifier_code_idx'...
CREATE INDEX spe_type_modifier_code_idx ON t_specimen 
USING BTREE 
(
     "type_modifier_code_id"
)
;
--\echo Creating index 'tacc_account_balance_currency_code_idx'...
CREATE INDEX tacc_account_balance_currency_code_idx ON t_account 
USING BTREE 
(
     "account_balance_currency_code_id"
)
;
--\echo Creating index 'spe_quality_code_idx'...
CREATE INDEX spe_quality_code_idx ON t_specimen 
USING BTREE 
(
     "quality_code_id"
)
;
--\echo Creating index 'spe_reject_reason_code_idx'...
CREATE INDEX spe_reject_reason_code_idx ON t_specimen 
USING BTREE 
(
     "reject_reason_code_id"
)
;
--\echo Creating index 'app_appointment_status_code_idx'...
CREATE INDEX app_appointment_status_code_idx ON t_appointment 
USING BTREE 
(
     "appointment_status_code_id"
)
;
--\echo Creating index 'apn_notification_reason_code_idx'...
CREATE INDEX apn_notification_reason_code_idx ON t_appointment_notification 
USING BTREE 
(
     "notification_reason_code_id"
)
;
--\echo Creating index 'act_transaction_type_code_idx'...
CREATE INDEX act_transaction_type_code_idx ON t_account_transaction 
USING BTREE 
(
     "transaction_type_code_id"
)
;
--\echo Creating index 'act_transaction_currency_code_idx'...
CREATE INDEX act_transaction_currency_code_idx ON t_account_transaction 
USING BTREE 
(
     "transaction_currency_code_id"
)
;
--\echo Creating index 'apn_notification_mode_code_idx'...
CREATE INDEX apn_notification_mode_code_idx ON t_appointment_notification 
USING BTREE 
(
     "notification_mode_code_id"
)
;
--\echo Creating index 'ahp_insurance_coverage_type_code_idx'...
CREATE INDEX ahp_insurance_coverage_type_code_idx ON t_account_health_plan_coverage 
USING BTREE 
(
     "insurance_coverage_type_code_id"
)
;
--\echo Creating index 'idx_fk_location_id_t_account_transaction'...
CREATE INDEX idx_fk_location_id_t_account_transaction ON t_account_transaction 
USING BTREE 
(
     "location_id"
)
;
--\echo Creating index 'tchg_drug_code_idx'...
CREATE INDEX tchg_drug_code_idx ON t_charge 
USING BTREE 
(
     "drug_code_id"
)
;
--\echo Creating index 'idx_fk_location_id_t_charge'...
CREATE INDEX idx_fk_location_id_t_charge ON t_charge 
USING BTREE 
(
     "location_id"
)
;
--\echo Creating index 'idx_fk_initial_check_in_time_t_appointment'...
CREATE INDEX idx_fk_initial_check_in_time_t_appointment ON t_appointment 
USING BTREE 
(
     "initial_check_in_time"
)
;
--\echo Creating index 'tchg_diagnosis_code_idx'...
CREATE INDEX tchg_diagnosis_code_idx ON t_charge 
USING BTREE 
(
     "diagnosis_code_id"
)
;
--\echo Creating index 'tchg_diagnosis_related_group_code_idx'...
CREATE INDEX tchg_diagnosis_related_group_code_idx ON t_charge 
USING BTREE 
(
     "diagnosis_related_group_code_id"
)
;
--\echo Creating index 'idx_fk_living_will_date_t_encounter'...
CREATE INDEX idx_fk_living_will_date_t_encounter ON t_encounter 
USING BTREE 
(
     "living_will"
)
;
--\echo Creating index 'tchg_amt_currency_code_idx'...
CREATE INDEX tchg_amt_currency_code_idx ON t_charge 
USING BTREE 
(
     "amt_currency_code_id"
)
;
--\echo Creating index 'idx_fk_med_taxonomy_id_t_med_code'...
CREATE INDEX idx_fk_med_taxonomy_id_t_med_code ON t_med_code 
USING BTREE 
(
     "med_taxonomy_id"
)
;
--\echo Creating index 'tchg_charge_code_idx'...
CREATE INDEX tchg_charge_code_idx ON t_charge 
USING BTREE 
(
     "charge_code_id"
)
;
--\echo Creating index 'tbli_bill_line_type_code_idx'...
CREATE INDEX tbli_bill_line_type_code_idx ON t_bill_line_item 
USING BTREE 
(
     "bill_line_type_code_id"
)
;
--\echo Creating index 'idx_fk_med_code_id_t_med_concept_code_xref'...
CREATE INDEX idx_fk_med_code_id_t_med_concept_code_xref ON t_med_concept_code_xref 
USING BTREE 
(
     "med_code_id"
)
;
--\echo Creating index 'tchg_ambulatory_payment_class_code_idx'...
CREATE INDEX tchg_ambulatory_payment_class_code_idx ON t_charge 
USING BTREE 
(
     "ambulatory_payment_class_code_id"
)
;
--\echo Creating index 'idx_fk_med_concept_id_t_med_concept_code_xref'...
CREATE INDEX idx_fk_med_concept_id_t_med_concept_code_xref ON t_med_concept_code_xref 
USING BTREE 
(
     "med_concept_id"
)
;
--\echo Creating index 'tacc_financial_class_code_idx'...
CREATE INDEX tacc_financial_class_code_idx ON t_account 
USING BTREE 
(
     "financial_class_code_id"
)
;
--\echo Creating index 'tacc_financial_status_code_idx'...
CREATE INDEX tacc_financial_status_code_idx ON t_account 
USING BTREE 
(
     "financial_status_code_id"
)
;
--\echo Creating index 'act_payment_adjustment_code_idx'...
CREATE INDEX act_payment_adjustment_code_idx ON t_account_transaction 
USING BTREE 
(
     "payment_adjustment_code_id"
)
;
--\echo Creating index 'tacc_account_type_code_idx'...
CREATE INDEX tacc_account_type_code_idx ON t_account 
USING BTREE 
(
     "account_type_code_id"
)
;
--\echo Creating index 'idx_fk_guarantor_account_id_t_account_guarantor'...
CREATE INDEX idx_fk_guarantor_account_id_t_account_guarantor ON t_account_guarantor 
USING BTREE 
(
     "account_id"
)
;
--\echo Creating index 'idx_fk_initial_check_in_date_t_appointment'...
CREATE INDEX idx_fk_initial_check_in_date_t_appointment ON t_appointment 
USING BTREE 
(
     "initial_check_in_date"
)
;
--\echo Creating index 'idx_fk_from_provider_id_t_referral_source'...
CREATE INDEX idx_fk_from_provider_id_t_referral_source ON t_referral_source 
USING BTREE 
(
     "from_provider_id"
)
;
--\echo Creating index 'app_override_code_idx'...
CREATE INDEX app_override_code_idx ON t_appointment 
USING BTREE 
(
     "override_code_id"
)
;
--\echo Creating index 'app_overbook_code_idx'...
CREATE INDEX app_overbook_code_idx ON t_appointment 
USING BTREE 
(
     "overbook_code_id"
)
;
--\echo Creating index 'app_language_interpreter_code_idx'...
CREATE INDEX app_language_interpreter_code_idx ON t_appointment 
USING BTREE 
(
     "language_interpreter_code_id"
)
;
--\echo Creating index 'app_joint_appointment_code_idx'...
CREATE INDEX app_joint_appointment_code_idx ON t_appointment 
USING BTREE 
(
     "joint_appointment_code_id"
)
;
--\echo Creating index 'app_confirmation_status_code_idx'...
CREATE INDEX app_confirmation_status_code_idx ON t_appointment 
USING BTREE 
(
     "confirmation_status_code_id"
)
;
--\echo Creating index 'tclm_diagnosis_code_idx'...
CREATE INDEX tclm_diagnosis_code_idx ON t_claim 
USING BTREE 
(
     "diagnosis_code_id"
)
;
--\echo Creating index 'tclm_procedure_code_idx'...
CREATE INDEX tclm_procedure_code_idx ON t_claim 
USING BTREE 
(
     "procedure_code_id"
)
;
--\echo Creating index 'tclm_status_code_idx'...
CREATE INDEX tclm_status_code_idx ON t_claim 
USING BTREE 
(
     "status_code_id"
)
;
--\echo Creating index 'app_cancelled_sameday_code_idx'...
CREATE INDEX app_cancelled_sameday_code_idx ON t_appointment 
USING BTREE 
(
     "cancelled_sameday_code_id"
)
;
--\echo Creating index 'tchg_revenue_code_idx'...
CREATE INDEX tchg_revenue_code_idx ON t_charge 
USING BTREE 
(
     "revenue_code_id"
)
;
--\echo Creating index 'app_change_reason_code_idx'...
CREATE INDEX app_change_reason_code_idx ON t_appointment 
USING BTREE 
(
     "change_reason_code_id"
)
;
--\echo Creating index 'tchg_transaction_type_code_idx'...
CREATE INDEX tchg_transaction_type_code_idx ON t_charge 
USING BTREE 
(
     "transaction_type_code_id"
)
;
--\echo Creating index 'app_block_category_code_idx'...
CREATE INDEX app_block_category_code_idx ON t_appointment 
USING BTREE 
(
     "block_category_code_id"
)
;
--\echo Creating index 'tclm_amt_currency_code_idx'...
CREATE INDEX tclm_amt_currency_code_idx ON t_claim 
USING BTREE 
(
     "amt_currency_code_id"
)
;
--\echo Creating index 'app_cancellation_reason_code_idx'...
CREATE INDEX app_cancellation_reason_code_idx ON t_appointment 
USING BTREE 
(
     "cancellation_reason_code_id"
)
;
--\echo Creating index 'tclm_denial_reason_code_idx'...
CREATE INDEX tclm_denial_reason_code_idx ON t_claim 
USING BTREE 
(
     "denial_reason_code_id"
)
;
--\echo Creating index 'app_automated_reminder_status_code_idx'...
CREATE INDEX app_automated_reminder_status_code_idx ON t_appointment 
USING BTREE 
(
     "automated_reminder_status_code_id"
)
;
--\echo Creating Primary Key constraint 'pk_t_dim_time' on table 't_dim_time'
ALTER TABLE "t_dim_time" ADD CONSTRAINT "pk_t_dim_time" 
 PRIMARY KEY 
      ("time_of_day")
;
--\echo Creating Primary Key constraint 'pk_t_dim_date' on table 't_dim_date'
ALTER TABLE "t_dim_date" ADD CONSTRAINT "pk_t_dim_date" 
 PRIMARY KEY 
      ("calendar_date")
;
--\echo Creating Primary Key constraint 'pk_t_referral_source' on table 't_referral_source'
ALTER TABLE "t_referral_source" ADD CONSTRAINT "pk_t_referral_source" 
 PRIMARY KEY 
      ("referral_source_id")
;
--\echo Creating Primary Key constraint 'pk_t_appointment' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "pk_t_appointment" 
 PRIMARY KEY 
      ("appointment_id")
;
--\echo Creating Primary Key constraint 'pk_t_account' on table 't_account'
ALTER TABLE "t_account" ADD CONSTRAINT "pk_t_account" 
 PRIMARY KEY 
      ("account_id")
;
--\echo Creating Primary Key constraint 'pk_t_patient_wait_list' on table 't_patient_wait_list'
ALTER TABLE "t_patient_wait_list" ADD CONSTRAINT "pk_t_patient_wait_list" 
 PRIMARY KEY 
      ("patient_wait_list_id")
;
--\echo Creating Primary Key constraint 'pk_t_dim_encounter' on table 't_encounter'
ALTER TABLE "t_encounter" ADD CONSTRAINT "pk_t_dim_encounter" 
 PRIMARY KEY 
      ("encounter_id")
;
--\echo Creating Primary Key constraint 'pk_t_provider_availability_slot' on table 't_provider_availability_slot'
ALTER TABLE "t_provider_availability_slot" ADD CONSTRAINT "pk_t_provider_availability_slot" 
 PRIMARY KEY 
      ("provider_availability_slot_id")
;
--\echo Creating Primary Key constraint 'pk_t_specimen' on table 't_specimen'
ALTER TABLE "t_specimen" ADD CONSTRAINT "pk_t_specimen" 
 PRIMARY KEY 
      ("clinical_event_id"
      ,"specimen_id")
;
--\echo Creating Primary Key constraint 'pk_t_dim_patient_master' on table 't_dim_patient_master'
ALTER TABLE "t_dim_patient_master" ADD CONSTRAINT "pk_t_dim_patient_master" 
 PRIMARY KEY 
      ("patient_m_id")
;
--\echo Creating Primary Key constraint 'pk_t_dim_organization_master' on table 't_dim_organization_master'
ALTER TABLE "t_dim_organization_master" ADD CONSTRAINT "pk_t_dim_organization_master" 
 PRIMARY KEY 
      ("l0_organization_unit_m_id")
;
--\echo Creating Primary Key constraint 'pk_t_dim_facility_master' on table 't_dim_facility_master'
ALTER TABLE "t_dim_facility_master" ADD CONSTRAINT "pk_t_dim_facility_master" 
 PRIMARY KEY 
      ("l0_facility_location_m_id")
;
--\echo Creating Primary Key constraint 'pk_t_dim_codeset' on table 't_dim_codeset'
ALTER TABLE "t_dim_codeset" ADD CONSTRAINT "pk_t_dim_codeset" 
 PRIMARY KEY 
      ("source_code_id")
;
--\echo Creating Primary Key constraint 'pk_t_provider_template' on table 't_provider_template'
ALTER TABLE "t_provider_template" ADD CONSTRAINT "pk_t_provider_template" 
 PRIMARY KEY 
      ("provider_template_id")
;
--\echo Creating Primary Key constraint 'pk_t_provider_template_schedule' on table 't_provider_template_schedule'
ALTER TABLE "t_provider_template_schedule" ADD CONSTRAINT "pk_t_provider_template_schedule" 
 PRIMARY KEY 
      ("provider_template_schedule_id")
;
--\echo Creating Primary Key constraint 'pk_t_provider_availability_appt' on table 't_provider_availability_appt'
ALTER TABLE "t_provider_availability_appt" ADD CONSTRAINT "pk_t_provider_availability_appt" 
 PRIMARY KEY 
      ("provider_availability_appt_id")
;
--\echo Creating Primary Key constraint 'pk_t_patient_wait_list_preference' on table 't_patient_wait_list_preference'
ALTER TABLE "t_patient_wait_list_preference" ADD CONSTRAINT "pk_t_patient_wait_list_preference" 
 PRIMARY KEY 
      ("patient_wait_list_preference_id")
;
--\echo Creating Primary Key constraint 'pk_t_med_taxonomy' on table 't_med_taxonomy'
ALTER TABLE "t_med_taxonomy" ADD CONSTRAINT "pk_t_med_taxonomy" 
 PRIMARY KEY 
      ("med_taxonomy_id")
;
--\echo Creating Primary Key constraint 'pk_t_med_code' on table 't_med_code'
ALTER TABLE "t_med_code" ADD CONSTRAINT "pk_t_med_code" 
 PRIMARY KEY 
      ("med_code_id")
;
--\echo Creating Primary Key constraint 'pk_t_med_concept' on table 't_med_concept'
ALTER TABLE "t_med_concept" ADD CONSTRAINT "pk_t_med_concept" 
 PRIMARY KEY 
      ("med_concept_id")
;
--\echo Creating Primary Key constraint 'pk_t_med_code_concept_xref' on table 't_med_concept_code_xref'
ALTER TABLE "t_med_concept_code_xref" ADD CONSTRAINT "pk_t_med_code_concept_xref" 
 PRIMARY KEY 
      ("med_concept_id"
      ,"med_code_id")
;
--\echo Creating Primary Key constraint 'pk_t_patient_encounter_diagnosis' on table 't_patient_encounter_diagnosis'
ALTER TABLE "t_patient_encounter_diagnosis" ADD CONSTRAINT "pk_t_patient_encounter_diagnosis" 
 PRIMARY KEY 
      ("patient_id"
      ,"encounter_id"
      ,"encounter_date_time")
;
--\echo Creating Primary Key constraint 'pk_t_bill' on table 't_bill'
ALTER TABLE "t_bill" ADD CONSTRAINT "pk_t_bill" 
 PRIMARY KEY 
      ("bill_id")
;
--\echo Creating Primary Key constraint 'pk_t_dim_provider_master' on table 't_dim_provider_master'
ALTER TABLE "t_dim_provider_master" ADD CONSTRAINT "pk_t_dim_provider_master" 
 PRIMARY KEY 
      ("provider_m_id")
;
--\echo Creating Primary Key constraint 'pk_t_account_transaction' on table 't_account_transaction'
ALTER TABLE "t_account_transaction" ADD CONSTRAINT "pk_t_account_transaction" 
 PRIMARY KEY 
      ("account_transaction_id")
;
--\echo Creating Primary Key constraint 'pk_t_charge' on table 't_charge'
ALTER TABLE "t_charge" ADD CONSTRAINT "pk_t_charge" 
 PRIMARY KEY 
      ("charge_id")
;
--\echo Creating Primary Key constraint 'pk_t_bill_line_item' on table 't_bill_line_item'
ALTER TABLE "t_bill_line_item" ADD CONSTRAINT "pk_t_bill_line_item" 
 PRIMARY KEY 
      ("bill_line_item_id")
;
--\echo Creating Primary Key constraint 'pk_t_appointment_notification' on table 't_appointment_notification'
ALTER TABLE "t_appointment_notification" ADD CONSTRAINT "pk_t_appointment_notification" 
 PRIMARY KEY 
      ("appointment_notification_id")
;
--\echo Creating Primary Key constraint 'pk_t_claim' on table 't_claim'
ALTER TABLE "t_claim" ADD CONSTRAINT "pk_t_claim" 
 PRIMARY KEY 
      ("claim_id")
;
--\echo Creating Primary Key constraint 'pk_t_account_health_plan_coverage' on table 't_account_health_plan_coverage'
ALTER TABLE "t_account_health_plan_coverage" ADD CONSTRAINT "pk_t_account_health_plan_coverage" 
 PRIMARY KEY 
      ("account_health_plan_coverage_id")
;
--\echo Creating Primary Key constraint 'pk_t_account_guarantor' on table 't_account_guarantor'
ALTER TABLE "t_account_guarantor" ADD CONSTRAINT "pk_t_account_guarantor" 
 PRIMARY KEY 
      ("account_guarantor_id")
;
--\echo Creating Foreign Key constraint 'fk_specimen__received_time' on table 't_specimen'
ALTER TABLE "t_specimen" ADD CONSTRAINT "fk_specimen__received_time" 
 FOREIGN KEY 
      ("received_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_specimen__received_date' on table 't_specimen'
ALTER TABLE "t_specimen" ADD CONSTRAINT "fk_specimen__received_date" 
 FOREIGN KEY 
      ("received_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_specimen__expiration_time' on table 't_specimen'
ALTER TABLE "t_specimen" ADD CONSTRAINT "fk_specimen__expiration_time" 
 FOREIGN KEY 
      ("expiration_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_specimen__expiration_date' on table 't_specimen'
ALTER TABLE "t_specimen" ADD CONSTRAINT "fk_specimen__expiration_date" 
 FOREIGN KEY 
      ("expiration_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_specimen__collection_time' on table 't_specimen'
ALTER TABLE "t_specimen" ADD CONSTRAINT "fk_specimen__collection_time" 
 FOREIGN KEY 
      ("collection_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_specimen__collection_date' on table 't_specimen'
ALTER TABLE "t_specimen" ADD CONSTRAINT "fk_specimen__collection_date" 
 FOREIGN KEY 
      ("collection_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk2_t_transfer_event__t_encounter' on table 't_transfer_event'
ALTER TABLE "t_transfer_event" ADD CONSTRAINT "fk2_t_transfer_event__t_encounter" 
 FOREIGN KEY 
      ("encounter_id") REFERENCES "t_encounter"
      ("encounter_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_transfer_event__t_dim_time' on table 't_transfer_event'
ALTER TABLE "t_transfer_event" ADD CONSTRAINT "fk2_t_transfer_event__t_dim_time" 
 FOREIGN KEY 
      ("event_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk2_t_transfer_event__t_dim_patient_master' on table 't_transfer_event'
ALTER TABLE "t_transfer_event" ADD CONSTRAINT "fk2_t_transfer_event__t_dim_patient_master" 
 FOREIGN KEY 
      ("patient_m_id") REFERENCES "t_dim_patient_master"
      ("patient_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_transfer_event__t_dim_organization_master' on table 't_transfer_event'
ALTER TABLE "t_transfer_event" ADD CONSTRAINT "fk2_t_transfer_event__t_dim_organization_master" 
 FOREIGN KEY 
      ("l0_organization_unit_m_id") REFERENCES "t_dim_organization_master"
      ("l0_organization_unit_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_transfer_event__t_dim_facility_master' on table 't_transfer_event'
ALTER TABLE "t_transfer_event" ADD CONSTRAINT "fk2_t_transfer_event__t_dim_facility_master" 
 FOREIGN KEY 
      ("l0_facility_location_m_id") REFERENCES "t_dim_facility_master"
      ("l0_facility_location_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_transfer_event__t_dim_date' on table 't_transfer_event'
ALTER TABLE "t_transfer_event" ADD CONSTRAINT "fk2_t_transfer_event__t_dim_date" 
 FOREIGN KEY 
      ("event_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk2_t_radiology_order_event__t_encounter' on table 't_radiology_order_event'
ALTER TABLE "t_radiology_order_event" ADD CONSTRAINT "fk2_t_radiology_order_event__t_encounter" 
 FOREIGN KEY 
      ("encounter_id") REFERENCES "t_encounter"
      ("encounter_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_radiology_order_event__t_dim_time' on table 't_radiology_order_event'
ALTER TABLE "t_radiology_order_event" ADD CONSTRAINT "fk2_t_radiology_order_event__t_dim_time" 
 FOREIGN KEY 
      ("event_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk2_t_radiology_order_event__t_dim_patient_master' on table 't_radiology_order_event'
ALTER TABLE "t_radiology_order_event" ADD CONSTRAINT "fk2_t_radiology_order_event__t_dim_patient_master" 
 FOREIGN KEY 
      ("patient_m_id") REFERENCES "t_dim_patient_master"
      ("patient_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_radiology_order_event__t_dim_organization_master' on table 't_radiology_order_event'
ALTER TABLE "t_radiology_order_event" ADD CONSTRAINT "fk2_t_radiology_order_event__t_dim_organization_master" 
 FOREIGN KEY 
      ("l0_organization_unit_m_id") REFERENCES "t_dim_organization_master"
      ("l0_organization_unit_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_radiology_order_event__t_dim_facility_master' on table 't_radiology_order_event'
ALTER TABLE "t_radiology_order_event" ADD CONSTRAINT "fk2_t_radiology_order_event__t_dim_facility_master" 
 FOREIGN KEY 
      ("l0_facility_location_m_id") REFERENCES "t_dim_facility_master"
      ("l0_facility_location_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_radiology_order_event__t_dim_date' on table 't_radiology_order_event'
ALTER TABLE "t_radiology_order_event" ADD CONSTRAINT "fk2_t_radiology_order_event__t_dim_date" 
 FOREIGN KEY 
      ("event_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk2_t_referral_order_event__t_encounter' on table 't_referral_order_event'
ALTER TABLE "t_referral_order_event" ADD CONSTRAINT "fk2_t_referral_order_event__t_encounter" 
 FOREIGN KEY 
      ("encounter_id") REFERENCES "t_encounter"
      ("encounter_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_referral_order_event__t_dim_time' on table 't_referral_order_event'
ALTER TABLE "t_referral_order_event" ADD CONSTRAINT "fk2_t_referral_order_event__t_dim_time" 
 FOREIGN KEY 
      ("event_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk2_t_referral_order_event__t_dim_patient_master' on table 't_referral_order_event'
ALTER TABLE "t_referral_order_event" ADD CONSTRAINT "fk2_t_referral_order_event__t_dim_patient_master" 
 FOREIGN KEY 
      ("patient_m_id") REFERENCES "t_dim_patient_master"
      ("patient_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_referral_order_event__t_dim_organization_master' on table 't_referral_order_event'
ALTER TABLE "t_referral_order_event" ADD CONSTRAINT "fk2_t_referral_order_event__t_dim_organization_master" 
 FOREIGN KEY 
      ("l0_organization_unit_m_id") REFERENCES "t_dim_organization_master"
      ("l0_organization_unit_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_referral_order_event__t_dim_facility_master' on table 't_referral_order_event'
ALTER TABLE "t_referral_order_event" ADD CONSTRAINT "fk2_t_referral_order_event__t_dim_facility_master" 
 FOREIGN KEY 
      ("l0_facility_location_m_id") REFERENCES "t_dim_facility_master"
      ("l0_facility_location_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_referral_order_event__t_dim_date' on table 't_referral_order_event'
ALTER TABLE "t_referral_order_event" ADD CONSTRAINT "fk2_t_referral_order_event__t_dim_date" 
 FOREIGN KEY 
      ("event_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_referral_source__referral_time' on table 't_referral_source'
ALTER TABLE "t_referral_source" ADD CONSTRAINT "fk_referral_source__referral_time" 
 FOREIGN KEY 
      ("referral_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_referral_source__referral_date' on table 't_referral_source'
ALTER TABLE "t_referral_source" ADD CONSTRAINT "fk_referral_source__referral_date" 
 FOREIGN KEY 
      ("referral_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_referral_source__external_referral_time' on table 't_referral_source'
ALTER TABLE "t_referral_source" ADD CONSTRAINT "fk_referral_source__external_referral_time" 
 FOREIGN KEY 
      ("external_referral_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_referral_source__external_referral_date' on table 't_referral_source'
ALTER TABLE "t_referral_source" ADD CONSTRAINT "fk_referral_source__external_referral_date" 
 FOREIGN KEY 
      ("external_referral_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_provider_template__release_time' on table 't_provider_template'
ALTER TABLE "t_provider_template" ADD CONSTRAINT "fk_provider_template__release_time" 
 FOREIGN KEY 
      ("release_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_provider_template__release_date' on table 't_provider_template'
ALTER TABLE "t_provider_template" ADD CONSTRAINT "fk_provider_template__release_date" 
 FOREIGN KEY 
      ("release_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 't_provider_template_schedule__template_id' on table 't_provider_template_schedule'
ALTER TABLE "t_provider_template_schedule" ADD CONSTRAINT "t_provider_template_schedule__template_id" 
 FOREIGN KEY 
      ("provider_template_id") REFERENCES "t_provider_template"
      ("provider_template_id")
;
--\echo Creating Foreign Key constraint 'fk_provider_template_schedule__start_time' on table 't_provider_template_schedule'
ALTER TABLE "t_provider_template_schedule" ADD CONSTRAINT "fk_provider_template_schedule__start_time" 
 FOREIGN KEY 
      ("start_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_provider_template_schedule__schedule_start_time' on table 't_provider_template_schedule'
ALTER TABLE "t_provider_template_schedule" ADD CONSTRAINT "fk_provider_template_schedule__schedule_start_time" 
 FOREIGN KEY 
      ("schedule_start_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_provider_template_schedule__schedule_start_date' on table 't_provider_template_schedule'
ALTER TABLE "t_provider_template_schedule" ADD CONSTRAINT "fk_provider_template_schedule__schedule_start_date" 
 FOREIGN KEY 
      ("schedule_start_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_provider_template_schedule__schedule_end_time' on table 't_provider_template_schedule'
ALTER TABLE "t_provider_template_schedule" ADD CONSTRAINT "fk_provider_template_schedule__schedule_end_time" 
 FOREIGN KEY 
      ("schedule_end_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_provider_template_schedule__schedule_end_date' on table 't_provider_template_schedule'
ALTER TABLE "t_provider_template_schedule" ADD CONSTRAINT "fk_provider_template_schedule__schedule_end_date" 
 FOREIGN KEY 
      ("schedule_end_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_provider_template_schedule__end_time' on table 't_provider_template_schedule'
ALTER TABLE "t_provider_template_schedule" ADD CONSTRAINT "fk_provider_template_schedule__end_time" 
 FOREIGN KEY 
      ("end_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_provider_availability_appt__slot' on table 't_provider_availability_appt'
ALTER TABLE "t_provider_availability_appt" ADD CONSTRAINT "fk_provider_availability_appt__slot" 
 FOREIGN KEY 
      ("provider_availability_slot_id") REFERENCES "t_provider_availability_slot"
      ("provider_availability_slot_id")
;
--\echo Creating Foreign Key constraint 'fk_provider_availability_appt__apppointment' on table 't_provider_availability_appt'
ALTER TABLE "t_provider_availability_appt" ADD CONSTRAINT "fk_provider_availability_appt__apppointment" 
 FOREIGN KEY 
      ("appointment_id") REFERENCES "t_appointment"
      ("appointment_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_procedure_event__t_encounter' on table 't_procedure_event'
ALTER TABLE "t_procedure_event" ADD CONSTRAINT "fk2_t_procedure_event__t_encounter" 
 FOREIGN KEY 
      ("encounter_id") REFERENCES "t_encounter"
      ("encounter_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_procedure_event__t_dim_time' on table 't_procedure_event'
ALTER TABLE "t_procedure_event" ADD CONSTRAINT "fk2_t_procedure_event__t_dim_time" 
 FOREIGN KEY 
      ("event_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk2_t_procedure_event__t_dim_organization_master' on table 't_procedure_event'
ALTER TABLE "t_procedure_event" ADD CONSTRAINT "fk2_t_procedure_event__t_dim_organization_master" 
 FOREIGN KEY 
      ("l0_organization_unit_m_id") REFERENCES "t_dim_organization_master"
      ("l0_organization_unit_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_procedure_event__t_dim_facility_master' on table 't_procedure_event'
ALTER TABLE "t_procedure_event" ADD CONSTRAINT "fk2_t_procedure_event__t_dim_facility_master" 
 FOREIGN KEY 
      ("l0_facility_location_m_id") REFERENCES "t_dim_facility_master"
      ("l0_facility_location_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_procedure_event__t_dim_date' on table 't_procedure_event'
ALTER TABLE "t_procedure_event" ADD CONSTRAINT "fk2_t_procedure_event__t_dim_date" 
 FOREIGN KEY 
      ("event_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk2_t_procedure_order_event__t_encounter' on table 't_procedure_order_event'
ALTER TABLE "t_procedure_order_event" ADD CONSTRAINT "fk2_t_procedure_order_event__t_encounter" 
 FOREIGN KEY 
      ("encounter_id") REFERENCES "t_encounter"
      ("encounter_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_procedure_order_event__t_dim_time' on table 't_procedure_order_event'
ALTER TABLE "t_procedure_order_event" ADD CONSTRAINT "fk2_t_procedure_order_event__t_dim_time" 
 FOREIGN KEY 
      ("event_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk2_t_procedure_order_event__t_dim_patient_master' on table 't_procedure_order_event'
ALTER TABLE "t_procedure_order_event" ADD CONSTRAINT "fk2_t_procedure_order_event__t_dim_patient_master" 
 FOREIGN KEY 
      ("patient_m_id") REFERENCES "t_dim_patient_master"
      ("patient_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_procedure_order_event__t_dim_organization_master' on table 't_procedure_order_event'
ALTER TABLE "t_procedure_order_event" ADD CONSTRAINT "fk2_t_procedure_order_event__t_dim_organization_master" 
 FOREIGN KEY 
      ("l0_organization_unit_m_id") REFERENCES "t_dim_organization_master"
      ("l0_organization_unit_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_procedure_order_event__t_dim_facility_master' on table 't_procedure_order_event'
ALTER TABLE "t_procedure_order_event" ADD CONSTRAINT "fk2_t_procedure_order_event__t_dim_facility_master" 
 FOREIGN KEY 
      ("l0_facility_location_m_id") REFERENCES "t_dim_facility_master"
      ("l0_facility_location_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_procedure_order_event__t_dim_date' on table 't_procedure_order_event'
ALTER TABLE "t_procedure_order_event" ADD CONSTRAINT "fk2_t_procedure_order_event__t_dim_date" 
 FOREIGN KEY 
      ("event_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_patient_wait_list_preference__waitlist' on table 't_patient_wait_list_preference'
ALTER TABLE "t_patient_wait_list_preference" ADD CONSTRAINT "fk_patient_wait_list_preference__waitlist" 
 FOREIGN KEY 
      ("patient_wait_list_id") REFERENCES "t_patient_wait_list"
      ("patient_wait_list_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_pharmacy_prescription_order_event__t_encounter' on table 't_pharmacy_prescription_order_event'
ALTER TABLE "t_pharmacy_prescription_order_event" ADD CONSTRAINT "fk2_t_pharmacy_prescription_order_event__t_encounter" 
 FOREIGN KEY 
      ("encounter_id") REFERENCES "t_encounter"
      ("encounter_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_pharmacy_prescription_order_event__t_dim_time' on table 't_pharmacy_prescription_order_event'
ALTER TABLE "t_pharmacy_prescription_order_event" ADD CONSTRAINT "fk2_t_pharmacy_prescription_order_event__t_dim_time" 
 FOREIGN KEY 
      ("event_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk2_t_pharmacy_prescription_order_event__t_dim_patient_master' on table 't_pharmacy_prescription_order_event'
ALTER TABLE "t_pharmacy_prescription_order_event" ADD CONSTRAINT "fk2_t_pharmacy_prescription_order_event__t_dim_patient_master" 
 FOREIGN KEY 
      ("patient_m_id") REFERENCES "t_dim_patient_master"
      ("patient_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_pharmacy_prescription_order_event__t_dim_organization_mas' on table 't_pharmacy_prescription_order_event'
ALTER TABLE "t_pharmacy_prescription_order_event" ADD CONSTRAINT "fk2_t_pharmacy_prescription_order_event__t_dim_organization_mas" 
 FOREIGN KEY 
      ("l0_organization_unit_m_id") REFERENCES "t_dim_organization_master"
      ("l0_organization_unit_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_pharmacy_prescription_order_event__t_dim_facility_master' on table 't_pharmacy_prescription_order_event'
ALTER TABLE "t_pharmacy_prescription_order_event" ADD CONSTRAINT "fk2_t_pharmacy_prescription_order_event__t_dim_facility_master" 
 FOREIGN KEY 
      ("l0_facility_location_m_id") REFERENCES "t_dim_facility_master"
      ("l0_facility_location_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_pharmacy_prescription_order_event__t_dim_date' on table 't_pharmacy_prescription_order_event'
ALTER TABLE "t_pharmacy_prescription_order_event" ADD CONSTRAINT "fk2_t_pharmacy_prescription_order_event__t_dim_date" 
 FOREIGN KEY 
      ("event_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_patient_wait_list__referralsource' on table 't_patient_wait_list'
ALTER TABLE "t_patient_wait_list" ADD CONSTRAINT "fk_patient_wait_list__referralsource" 
 FOREIGN KEY 
      ("referral_id") REFERENCES "t_referral_source"
      ("referral_source_id")
;
--\echo Creating Foreign Key constraint 'fk_patient_wait_list__prefered_end_time' on table 't_patient_wait_list'
ALTER TABLE "t_patient_wait_list" ADD CONSTRAINT "fk_patient_wait_list__prefered_end_time" 
 FOREIGN KEY 
      ("prefered_end_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_patient_wait_list__prefered_end_date' on table 't_patient_wait_list'
ALTER TABLE "t_patient_wait_list" ADD CONSTRAINT "fk_patient_wait_list__prefered_end_date" 
 FOREIGN KEY 
      ("prefered_end_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_patient_wait_list__prefered_begin_time' on table 't_patient_wait_list'
ALTER TABLE "t_patient_wait_list" ADD CONSTRAINT "fk_patient_wait_list__prefered_begin_time" 
 FOREIGN KEY 
      ("prefered_begin_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_patient_wait_list__prefered_begin_date' on table 't_patient_wait_list'
ALTER TABLE "t_patient_wait_list" ADD CONSTRAINT "fk_patient_wait_list__prefered_begin_date" 
 FOREIGN KEY 
      ("prefered_begin_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_patient_wait_list__appointment' on table 't_patient_wait_list'
ALTER TABLE "t_patient_wait_list" ADD CONSTRAINT "fk_patient_wait_list__appointment" 
 FOREIGN KEY 
      ("appointment_id") REFERENCES "t_appointment"
      ("appointment_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_discharge_event__t_encounter' on table 't_discharge_event'
ALTER TABLE "t_discharge_event" ADD CONSTRAINT "fk2_t_discharge_event__t_encounter" 
 FOREIGN KEY 
      ("encounter_id") REFERENCES "t_encounter"
      ("encounter_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_discharge_event__t_dim_organization_master' on table 't_discharge_event'
ALTER TABLE "t_discharge_event" ADD CONSTRAINT "fk2_t_discharge_event__t_dim_organization_master" 
 FOREIGN KEY 
      ("l0_organization_unit_m_id") REFERENCES "t_dim_organization_master"
      ("l0_organization_unit_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_discharge_event__t_dim_facility_master' on table 't_discharge_event'
ALTER TABLE "t_discharge_event" ADD CONSTRAINT "fk2_t_discharge_event__t_dim_facility_master" 
 FOREIGN KEY 
      ("l0_facility_location_m_id") REFERENCES "t_dim_facility_master"
      ("l0_facility_location_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_discharge_event__t_dim_date' on table 't_discharge_event'
ALTER TABLE "t_discharge_event" ADD CONSTRAINT "fk2_t_discharge_event__t_dim_date" 
 FOREIGN KEY 
      ("event_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_med_code__med_taxononmy' on table 't_med_code'
ALTER TABLE "t_med_code" ADD CONSTRAINT "fk_med_code__med_taxononmy" 
 FOREIGN KEY 
      ("med_taxonomy_id") REFERENCES "t_med_taxonomy"
      ("med_taxonomy_id")
;
--\echo Creating Foreign Key constraint 'fk_encounter__triage_start_time' on table 't_encounter'
ALTER TABLE "t_encounter" ADD CONSTRAINT "fk_encounter__triage_start_time" 
 FOREIGN KEY 
      ("triage_start_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_encounter__triage_start_date' on table 't_encounter'
ALTER TABLE "t_encounter" ADD CONSTRAINT "fk_encounter__triage_start_date" 
 FOREIGN KEY 
      ("triage_start_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_encounter__triage_end_time' on table 't_encounter'
ALTER TABLE "t_encounter" ADD CONSTRAINT "fk_encounter__triage_end_time" 
 FOREIGN KEY 
      ("triage_end_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_encounter__triage_end_date' on table 't_encounter'
ALTER TABLE "t_encounter" ADD CONSTRAINT "fk_encounter__triage_end_date" 
 FOREIGN KEY 
      ("triage_end_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_encounter__living_will_date' on table 't_encounter'
ALTER TABLE "t_encounter" ADD CONSTRAINT "fk_encounter__living_will_date" 
 FOREIGN KEY 
      ("living_will_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_encounter__departure_time' on table 't_encounter'
ALTER TABLE "t_encounter" ADD CONSTRAINT "fk_encounter__departure_time" 
 FOREIGN KEY 
      ("departure_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_encounter__departure_date' on table 't_encounter'
ALTER TABLE "t_encounter" ADD CONSTRAINT "fk_encounter__departure_date" 
 FOREIGN KEY 
      ("departure_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_encounter__arrival_time' on table 't_encounter'
ALTER TABLE "t_encounter" ADD CONSTRAINT "fk_encounter__arrival_time" 
 FOREIGN KEY 
      ("arrival_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_encounter__arrival_date' on table 't_encounter'
ALTER TABLE "t_encounter" ADD CONSTRAINT "fk_encounter__arrival_date" 
 FOREIGN KEY 
      ("arrival_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_encounter__adv_dir_last_verif_time' on table 't_encounter'
ALTER TABLE "t_encounter" ADD CONSTRAINT "fk_encounter__adv_dir_last_verif_time" 
 FOREIGN KEY 
      ("adv_dir_last_verif_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_encounter__adv_dir_last_verif_date' on table 't_encounter'
ALTER TABLE "t_encounter" ADD CONSTRAINT "fk_encounter__adv_dir_last_verif_date" 
 FOREIGN KEY 
      ("adv_dir_last_verif_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_med_concept_code_xref__concept_id' on table 't_med_concept_code_xref'
ALTER TABLE "t_med_concept_code_xref" ADD CONSTRAINT "fk_med_concept_code_xref__concept_id" 
 FOREIGN KEY 
      ("med_concept_id") REFERENCES "t_med_concept"
      ("med_concept_id")
;
--\echo Creating Foreign Key constraint 'fk_med_concept_code_xref__code_id' on table 't_med_concept_code_xref'
ALTER TABLE "t_med_concept_code_xref" ADD CONSTRAINT "fk_med_concept_code_xref__code_id" 
 FOREIGN KEY 
      ("med_code_id") REFERENCES "t_med_code"
      ("med_code_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_medical_supply_order_event__t_encounter' on table 't_medical_supply_order_event'
ALTER TABLE "t_medical_supply_order_event" ADD CONSTRAINT "fk2_t_medical_supply_order_event__t_encounter" 
 FOREIGN KEY 
      ("encounter_id") REFERENCES "t_encounter"
      ("encounter_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_medical_supply_order_event__t_dim_time' on table 't_medical_supply_order_event'
ALTER TABLE "t_medical_supply_order_event" ADD CONSTRAINT "fk2_t_medical_supply_order_event__t_dim_time" 
 FOREIGN KEY 
      ("event_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk2_t_medical_supply_order_event__t_dim_patient_master' on table 't_medical_supply_order_event'
ALTER TABLE "t_medical_supply_order_event" ADD CONSTRAINT "fk2_t_medical_supply_order_event__t_dim_patient_master" 
 FOREIGN KEY 
      ("patient_m_id") REFERENCES "t_dim_patient_master"
      ("patient_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_medical_supply_order_event__t_dim_organization_master' on table 't_medical_supply_order_event'
ALTER TABLE "t_medical_supply_order_event" ADD CONSTRAINT "fk2_t_medical_supply_order_event__t_dim_organization_master" 
 FOREIGN KEY 
      ("l0_organization_unit_m_id") REFERENCES "t_dim_organization_master"
      ("l0_organization_unit_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_medical_supply_order_event__t_dim_facility_master' on table 't_medical_supply_order_event'
ALTER TABLE "t_medical_supply_order_event" ADD CONSTRAINT "fk2_t_medical_supply_order_event__t_dim_facility_master" 
 FOREIGN KEY 
      ("l0_facility_location_m_id") REFERENCES "t_dim_facility_master"
      ("l0_facility_location_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_medical_supply_order_event__t_dim_date' on table 't_medical_supply_order_event'
ALTER TABLE "t_medical_supply_order_event" ADD CONSTRAINT "fk2_t_medical_supply_order_event__t_dim_date" 
 FOREIGN KEY 
      ("event_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk2_t_observation_event__t_encounter' on table 't_observation_event'
ALTER TABLE "t_observation_event" ADD CONSTRAINT "fk2_t_observation_event__t_encounter" 
 FOREIGN KEY 
      ("encounter_id") REFERENCES "t_encounter"
      ("encounter_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_observation_event__t_dim_time' on table 't_observation_event'
ALTER TABLE "t_observation_event" ADD CONSTRAINT "fk2_t_observation_event__t_dim_time" 
 FOREIGN KEY 
      ("event_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk2_t_observation_event__t_dim_patient_master' on table 't_observation_event'
ALTER TABLE "t_observation_event" ADD CONSTRAINT "fk2_t_observation_event__t_dim_patient_master" 
 FOREIGN KEY 
      ("patient_m_id") REFERENCES "t_dim_patient_master"
      ("patient_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_observation_event__t_dim_organization_master' on table 't_observation_event'
ALTER TABLE "t_observation_event" ADD CONSTRAINT "fk2_t_observation_event__t_dim_organization_master" 
 FOREIGN KEY 
      ("l0_organization_unit_m_id") REFERENCES "t_dim_organization_master"
      ("l0_organization_unit_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_observation_event__t_dim_facility_master' on table 't_observation_event'
ALTER TABLE "t_observation_event" ADD CONSTRAINT "fk2_t_observation_event__t_dim_facility_master" 
 FOREIGN KEY 
      ("l0_facility_location_m_id") REFERENCES "t_dim_facility_master"
      ("l0_facility_location_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_observation_event__t_dim_date' on table 't_observation_event'
ALTER TABLE "t_observation_event" ADD CONSTRAINT "fk2_t_observation_event__t_dim_date" 
 FOREIGN KEY 
      ("event_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk2_t_movement_event__t_encounter' on table 't_movement_event'
ALTER TABLE "t_movement_event" ADD CONSTRAINT "fk2_t_movement_event__t_encounter" 
 FOREIGN KEY 
      ("encounter_id") REFERENCES "t_encounter"
      ("encounter_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_movement_event__t_dim_time' on table 't_movement_event'
ALTER TABLE "t_movement_event" ADD CONSTRAINT "fk2_t_movement_event__t_dim_time" 
 FOREIGN KEY 
      ("event_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk2_t_movement_event__t_dim_patient_master' on table 't_movement_event'
ALTER TABLE "t_movement_event" ADD CONSTRAINT "fk2_t_movement_event__t_dim_patient_master" 
 FOREIGN KEY 
      ("patient_m_id") REFERENCES "t_dim_patient_master"
      ("patient_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_movement_event__t_dim_organization_master' on table 't_movement_event'
ALTER TABLE "t_movement_event" ADD CONSTRAINT "fk2_t_movement_event__t_dim_organization_master" 
 FOREIGN KEY 
      ("l0_organization_unit_m_id") REFERENCES "t_dim_organization_master"
      ("l0_organization_unit_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_movement_event__t_dim_facility_master' on table 't_movement_event'
ALTER TABLE "t_movement_event" ADD CONSTRAINT "fk2_t_movement_event__t_dim_facility_master" 
 FOREIGN KEY 
      ("l0_facility_location_m_id") REFERENCES "t_dim_facility_master"
      ("l0_facility_location_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_movement_event__t_dim_date' on table 't_movement_event'
ALTER TABLE "t_movement_event" ADD CONSTRAINT "fk2_t_movement_event__t_dim_date" 
 FOREIGN KEY 
      ("event_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_t_patient_encounter_diagnosis__encounter' on table 't_patient_encounter_diagnosis'
ALTER TABLE "t_patient_encounter_diagnosis" ADD CONSTRAINT "fk_t_patient_encounter_diagnosis__encounter" 
 FOREIGN KEY 
      ("encounter_id") REFERENCES "t_encounter"
      ("encounter_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_diagnostic_test_order_event__t_encounter' on table 't_diagnostic_test_order_event'
ALTER TABLE "t_diagnostic_test_order_event" ADD CONSTRAINT "fk2_t_diagnostic_test_order_event__t_encounter" 
 FOREIGN KEY 
      ("encounter_id") REFERENCES "t_encounter"
      ("encounter_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_diagnostic_test_order_event__t_dim_time' on table 't_diagnostic_test_order_event'
ALTER TABLE "t_diagnostic_test_order_event" ADD CONSTRAINT "fk2_t_diagnostic_test_order_event__t_dim_time" 
 FOREIGN KEY 
      ("event_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk2_t_diagnostic_test_order_event__t_dim_patient_master' on table 't_diagnostic_test_order_event'
ALTER TABLE "t_diagnostic_test_order_event" ADD CONSTRAINT "fk2_t_diagnostic_test_order_event__t_dim_patient_master" 
 FOREIGN KEY 
      ("patient_m_id") REFERENCES "t_dim_patient_master"
      ("patient_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_diagnostic_test_order_event__t_dim_organization_master' on table 't_diagnostic_test_order_event'
ALTER TABLE "t_diagnostic_test_order_event" ADD CONSTRAINT "fk2_t_diagnostic_test_order_event__t_dim_organization_master" 
 FOREIGN KEY 
      ("l0_organization_unit_m_id") REFERENCES "t_dim_organization_master"
      ("l0_organization_unit_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_diagnostic_test_order_event__t_dim_facility_master' on table 't_diagnostic_test_order_event'
ALTER TABLE "t_diagnostic_test_order_event" ADD CONSTRAINT "fk2_t_diagnostic_test_order_event__t_dim_facility_master" 
 FOREIGN KEY 
      ("l0_facility_location_m_id") REFERENCES "t_dim_facility_master"
      ("l0_facility_location_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_diagnostic_test_order_event__t_dim_date' on table 't_diagnostic_test_order_event'
ALTER TABLE "t_diagnostic_test_order_event" ADD CONSTRAINT "fk2_t_diagnostic_test_order_event__t_dim_date" 
 FOREIGN KEY 
      ("event_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk2_t_diagnosis_event__t_encounter' on table 't_diagnosis_event'
ALTER TABLE "t_diagnosis_event" ADD CONSTRAINT "fk2_t_diagnosis_event__t_encounter" 
 FOREIGN KEY 
      ("encounter_id") REFERENCES "t_encounter"
      ("encounter_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_diagnosis_event__t_dim_time' on table 't_diagnosis_event'
ALTER TABLE "t_diagnosis_event" ADD CONSTRAINT "fk2_t_diagnosis_event__t_dim_time" 
 FOREIGN KEY 
      ("event_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk2_t_diagnosis_event__t_dim_organization_master' on table 't_diagnosis_event'
ALTER TABLE "t_diagnosis_event" ADD CONSTRAINT "fk2_t_diagnosis_event__t_dim_organization_master" 
 FOREIGN KEY 
      ("l0_organization_unit_m_id") REFERENCES "t_dim_organization_master"
      ("l0_organization_unit_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_diagnosis_event__t_dim_facility_master' on table 't_diagnosis_event'
ALTER TABLE "t_diagnosis_event" ADD CONSTRAINT "fk2_t_diagnosis_event__t_dim_facility_master" 
 FOREIGN KEY 
      ("l0_facility_location_m_id") REFERENCES "t_dim_facility_master"
      ("l0_facility_location_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_diagnosis_event__t_dim_date' on table 't_diagnosis_event'
ALTER TABLE "t_diagnosis_event" ADD CONSTRAINT "fk2_t_diagnosis_event__t_dim_date" 
 FOREIGN KEY 
      ("event_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_codeset_parent_code' on table 't_dim_codeset'
ALTER TABLE "t_dim_codeset" ADD CONSTRAINT "fk_codeset_parent_code" 
 FOREIGN KEY 
      ("parent_code_id") REFERENCES "t_dim_codeset"
      ("source_code_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_diet_order_event__t_encounter' on table 't_diet_order_event'
ALTER TABLE "t_diet_order_event" ADD CONSTRAINT "fk2_t_diet_order_event__t_encounter" 
 FOREIGN KEY 
      ("encounter_id") REFERENCES "t_encounter"
      ("encounter_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_diet_order_event__t_dim_time' on table 't_diet_order_event'
ALTER TABLE "t_diet_order_event" ADD CONSTRAINT "fk2_t_diet_order_event__t_dim_time" 
 FOREIGN KEY 
      ("event_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk2_t_diet_order_event__t_dim_patient_master' on table 't_diet_order_event'
ALTER TABLE "t_diet_order_event" ADD CONSTRAINT "fk2_t_diet_order_event__t_dim_patient_master" 
 FOREIGN KEY 
      ("patient_m_id") REFERENCES "t_dim_patient_master"
      ("patient_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_diet_order_event__t_dim_organization_master' on table 't_diet_order_event'
ALTER TABLE "t_diet_order_event" ADD CONSTRAINT "fk2_t_diet_order_event__t_dim_organization_master" 
 FOREIGN KEY 
      ("l0_organization_unit_m_id") REFERENCES "t_dim_organization_master"
      ("l0_organization_unit_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_diet_order_event__t_dim_facility_master' on table 't_diet_order_event'
ALTER TABLE "t_diet_order_event" ADD CONSTRAINT "fk2_t_diet_order_event__t_dim_facility_master" 
 FOREIGN KEY 
      ("l0_facility_location_m_id") REFERENCES "t_dim_facility_master"
      ("l0_facility_location_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_diet_order_event__t_dim_date' on table 't_diet_order_event'
ALTER TABLE "t_diet_order_event" ADD CONSTRAINT "fk2_t_diet_order_event__t_dim_date" 
 FOREIGN KEY 
      ("event_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_appointment_sign_in_time_time' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_sign_in_time_time" 
 FOREIGN KEY 
      ("sign_in_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_appointment_sign_in_date_date' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_sign_in_date_date" 
 FOREIGN KEY 
      ("sign_in_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_appointment_roomed_time_time' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_roomed_time_time" 
 FOREIGN KEY 
      ("roomed_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_appointment_roomed_date_date' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_roomed_date_date" 
 FOREIGN KEY 
      ("roomed_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_appointment_room_assigned_time_time' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_room_assigned_time_time" 
 FOREIGN KEY 
      ("room_assigned_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_appointment_room_assigned_date_date' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_room_assigned_date_date" 
 FOREIGN KEY 
      ("room_assigned_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_appointment_provider_entered_room_time_time' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_provider_entered_room_time_time" 
 FOREIGN KEY 
      ("provider_entered_room_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_appointment_provider_entered_room_date_date' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_provider_entered_room_date_date" 
 FOREIGN KEY 
      ("provider_entered_room_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_appointment_paged_time_time' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_paged_time_time" 
 FOREIGN KEY 
      ("paged_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_appointment_paged_date_date' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_paged_date_date" 
 FOREIGN KEY 
      ("paged_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_appointment_nurse_left_room_time_time' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_nurse_left_room_time_time" 
 FOREIGN KEY 
      ("nurse_left_room_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_appointment_nurse_left_room_date_date' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_nurse_left_room_date_date" 
 FOREIGN KEY 
      ("nurse_left_room_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_appointment_initial_check_in_time_time' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_initial_check_in_time_time" 
 FOREIGN KEY 
      ("initial_check_in_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_appointment_initial_check_in_date_date' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_initial_check_in_date_date" 
 FOREIGN KEY 
      ("initial_check_in_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_appointment_confirmed_time_time' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_confirmed_time_time" 
 FOREIGN KEY 
      ("confirmed_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_appointment_confirmed_date_date' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_confirmed_date_date" 
 FOREIGN KEY 
      ("confirmed_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_appointment_check_out_time_time' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_check_out_time_time" 
 FOREIGN KEY 
      ("check_out_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_appointment_check_out_date_date' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_check_out_date_date" 
 FOREIGN KEY 
      ("check_out_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_appointment_check_in_time_time' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_check_in_time_time" 
 FOREIGN KEY 
      ("check_in_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_appointment_check_in_date_date' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_check_in_date_date" 
 FOREIGN KEY 
      ("check_in_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_appointment_cancelled_time_time' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_cancelled_time_time" 
 FOREIGN KEY 
      ("cancelled_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_appointment_cancelled_date_date' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_cancelled_date_date" 
 FOREIGN KEY 
      ("cancelled_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_appointment_arrival_list_removal_time_time' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_arrival_list_removal_time_time" 
 FOREIGN KEY 
      ("arrival_list_removal_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_appointment_arrival_list_removal_date_date' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_arrival_list_removal_date_date" 
 FOREIGN KEY 
      ("arrival_list_removal_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_appointment_appointment_start_time_time' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_appointment_start_time_time" 
 FOREIGN KEY 
      ("appointment_start_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_appointment_appointment_start_date_date' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_appointment_start_date_date" 
 FOREIGN KEY 
      ("appointment_start_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_appointment_appointment_end_time_time' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_appointment_end_time_time" 
 FOREIGN KEY 
      ("appointment_end_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_appointment_appointment_end_date_date' on table 't_appointment'
ALTER TABLE "t_appointment" ADD CONSTRAINT "fk_appointment_appointment_end_date_date" 
 FOREIGN KEY 
      ("appointment_end_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk2_t_admission_event__t_encounter' on table 't_admission_event'
ALTER TABLE "t_admission_event" ADD CONSTRAINT "fk2_t_admission_event__t_encounter" 
 FOREIGN KEY 
      ("encounter_id") REFERENCES "t_encounter"
      ("encounter_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_admission_event__t_dim_time' on table 't_admission_event'
ALTER TABLE "t_admission_event" ADD CONSTRAINT "fk2_t_admission_event__t_dim_time" 
 FOREIGN KEY 
      ("event_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk2_t_admission_event__t_dim_organization_master' on table 't_admission_event'
ALTER TABLE "t_admission_event" ADD CONSTRAINT "fk2_t_admission_event__t_dim_organization_master" 
 FOREIGN KEY 
      ("l0_organization_unit_m_id") REFERENCES "t_dim_organization_master"
      ("l0_organization_unit_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_admission_event__t_dim_facility_master' on table 't_admission_event'
ALTER TABLE "t_admission_event" ADD CONSTRAINT "fk2_t_admission_event__t_dim_facility_master" 
 FOREIGN KEY 
      ("l0_facility_location_m_id") REFERENCES "t_dim_facility_master"
      ("l0_facility_location_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_admission_event__t_dim_date' on table 't_admission_event'
ALTER TABLE "t_admission_event" ADD CONSTRAINT "fk2_t_admission_event__t_dim_date" 
 FOREIGN KEY 
      ("event_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_account_transaction__time' on table 't_account_transaction'
ALTER TABLE "t_account_transaction" ADD CONSTRAINT "fk_account_transaction__time" 
 FOREIGN KEY 
      ("transaction_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_account_transaction__date' on table 't_account_transaction'
ALTER TABLE "t_account_transaction" ADD CONSTRAINT "fk_account_transaction__date" 
 FOREIGN KEY 
      ("transaction_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_account_transaction__account' on table 't_account_transaction'
ALTER TABLE "t_account_transaction" ADD CONSTRAINT "fk_account_transaction__account" 
 FOREIGN KEY 
      ("account_id") REFERENCES "t_account"
      ("account_id")
;
--\echo Creating Foreign Key constraint 'fk_charge__service_time' on table 't_charge'
ALTER TABLE "t_charge" ADD CONSTRAINT "fk_charge__service_time" 
 FOREIGN KEY 
      ("service_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_charge__service_date' on table 't_charge'
ALTER TABLE "t_charge" ADD CONSTRAINT "fk_charge__service_date" 
 FOREIGN KEY 
      ("service_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_charge__charge_time' on table 't_charge'
ALTER TABLE "t_charge" ADD CONSTRAINT "fk_charge__charge_time" 
 FOREIGN KEY 
      ("charge_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_charge__charge_date' on table 't_charge'
ALTER TABLE "t_charge" ADD CONSTRAINT "fk_charge__charge_date" 
 FOREIGN KEY 
      ("charge_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_charge__account' on table 't_charge'
ALTER TABLE "t_charge" ADD CONSTRAINT "fk_charge__account" 
 FOREIGN KEY 
      ("account_id") REFERENCES "t_account"
      ("account_id")
;
--\echo Creating Foreign Key constraint 'fk_bill_line_item__bill' on table 't_bill_line_item'
ALTER TABLE "t_bill_line_item" ADD CONSTRAINT "fk_bill_line_item__bill" 
 FOREIGN KEY 
      ("bill_id") REFERENCES "t_bill"
      ("bill_id")
;
--\echo Creating Foreign Key constraint 'fk_bill__account' on table 't_bill'
ALTER TABLE "t_bill" ADD CONSTRAINT "fk_bill__account" 
 FOREIGN KEY 
      ("account_id") REFERENCES "t_account"
      ("account_id")
;
--\echo Creating Foreign Key constraint 'fk_appointment_notification_time' on table 't_appointment_notification'
ALTER TABLE "t_appointment_notification" ADD CONSTRAINT "fk_appointment_notification_time" 
 FOREIGN KEY 
      ("notification_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_appointment_notification_date' on table 't_appointment_notification'
ALTER TABLE "t_appointment_notification" ADD CONSTRAINT "fk_appointment_notification_date" 
 FOREIGN KEY 
      ("notification_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_appointment_notification__appointment' on table 't_appointment_notification'
ALTER TABLE "t_appointment_notification" ADD CONSTRAINT "fk_appointment_notification__appointment" 
 FOREIGN KEY 
      ("appointment_id") REFERENCES "t_appointment"
      ("appointment_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_death_event__t_encounter' on table 't_death_event'
ALTER TABLE "t_death_event" ADD CONSTRAINT "fk2_t_death_event__t_encounter" 
 FOREIGN KEY 
      ("encounter_id") REFERENCES "t_encounter"
      ("encounter_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_death_event__t_dim_time' on table 't_death_event'
ALTER TABLE "t_death_event" ADD CONSTRAINT "fk2_t_death_event__t_dim_time" 
 FOREIGN KEY 
      ("event_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk2_t_death_event__t_dim_patient_master' on table 't_death_event'
ALTER TABLE "t_death_event" ADD CONSTRAINT "fk2_t_death_event__t_dim_patient_master" 
 FOREIGN KEY 
      ("patient_m_id") REFERENCES "t_dim_patient_master"
      ("patient_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_death_event__t_dim_organization_master' on table 't_death_event'
ALTER TABLE "t_death_event" ADD CONSTRAINT "fk2_t_death_event__t_dim_organization_master" 
 FOREIGN KEY 
      ("l0_organization_unit_m_id") REFERENCES "t_dim_organization_master"
      ("l0_organization_unit_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_death_event__t_dim_facility_master' on table 't_death_event'
ALTER TABLE "t_death_event" ADD CONSTRAINT "fk2_t_death_event__t_dim_facility_master" 
 FOREIGN KEY 
      ("l0_facility_location_m_id") REFERENCES "t_dim_facility_master"
      ("l0_facility_location_m_id")
;
--\echo Creating Foreign Key constraint 'fk2_t_death_event__t_dim_date' on table 't_death_event'
ALTER TABLE "t_death_event" ADD CONSTRAINT "fk2_t_death_event__t_dim_date" 
 FOREIGN KEY 
      ("event_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_claim__claim_time' on table 't_claim'
ALTER TABLE "t_claim" ADD CONSTRAINT "fk_claim__claim_time" 
 FOREIGN KEY 
      ("claim_time") REFERENCES "t_dim_time"
      ("time_of_day")
;
--\echo Creating Foreign Key constraint 'fk_claim__claim_date' on table 't_claim'
ALTER TABLE "t_claim" ADD CONSTRAINT "fk_claim__claim_date" 
 FOREIGN KEY 
      ("claim_date") REFERENCES "t_dim_date"
      ("calendar_date")
;
--\echo Creating Foreign Key constraint 'fk_claim__account' on table 't_claim'
ALTER TABLE "t_claim" ADD CONSTRAINT "fk_claim__account" 
 FOREIGN KEY 
      ("account_id") REFERENCES "t_account"
      ("account_id")
;
--\echo Creating Foreign Key constraint 'fk_account_health_plan_coverage' on table 't_account_health_plan_coverage'
ALTER TABLE "t_account_health_plan_coverage" ADD CONSTRAINT "fk_account_health_plan_coverage" 
 FOREIGN KEY 
      ("account_id") REFERENCES "t_account"
      ("account_id")
;
--\echo Creating Foreign Key constraint 'fk_account_guarantor__account' on table 't_account_guarantor'
ALTER TABLE "t_account_guarantor" ADD CONSTRAINT "fk_account_guarantor__account" 
 FOREIGN KEY 
      ("account_id") REFERENCES "t_account"
      ("account_id")
;
--\echo Creating view 'v_account_health_plan_coverage'...
CREATE OR REPLACE VIEW v_account_health_plan_coverage AS 
SELECT t_account_health_plan_coverage.account_health_plan_coverage_id,
    t_account_health_plan_coverage.account_id,
    t_account_health_plan_coverage.insurance_coverage_type_code_id,
    t_account_health_plan_coverage.insurance_coverage_type_code,
    t_account_health_plan_coverage.parent_insurance_coverage_type_code_id,
    t_account_health_plan_coverage.parent_insurance_coverage_type_code,
    t_account_health_plan_coverage.sequence,
    t_account_health_plan_coverage.patient_health_plan_id
   FROM t_account_health_plan_coverage;
--\echo Creating view 'v_account_transaction'...
CREATE OR REPLACE VIEW v_account_transaction AS 
SELECT t_account_transaction.account_transaction_id,
    t_account_transaction.account_id,
    t_account_transaction.remitter_id,
    t_account_transaction.l0_organization_unit_m_id,
    t_account_transaction.service_line_id,
    t_account_transaction.l0_facility_location_m_id,
    t_account_transaction.location_id,
    t_account_transaction.transaction_type_code_id,
    t_account_transaction.transaction_type_code,
    t_account_transaction.parent_transaction_type_code_id,
    t_account_transaction.parent_transaction_type_code,
    t_account_transaction.transaction_currency_code_id,
    t_account_transaction.transaction_currency_code,
    t_account_transaction.parent_transaction_currency_code_id,
    t_account_transaction.parent_transaction_currency_code,
    t_account_transaction.payment_adjustment_code_id,
    t_account_transaction.payment_adjustment_code,
    t_account_transaction.parent_payment_adjustment_code_id,
    t_account_transaction.parent_payment_adjustment_code,
    t_account_transaction.transaction_date_time,
    t_account_transaction.transaction_time,
    t_account_transaction.transaction_date,
    t_account_transaction.transaction_amount,
    t_account_transaction.transaction_description,
    t_account_transaction.patient_health_plan_id
   FROM t_account_transaction;
--\echo Creating view 'v_bill'...
CREATE OR REPLACE VIEW v_bill AS 
SELECT t_bill.bill_id,
    t_bill.bill_number,
    t_bill.account_id,
    t_bill.type_code_id,
    t_bill.type_code,
    t_bill.parent_type_code_id,
    t_bill.parent_type_code,
    t_bill.category_code_id,
    t_bill.category_code,
    t_bill.parent_category_code_id,
    t_bill.parent_category_code,
    t_bill.pay_to_location_id,
    t_bill.status_code_id,
    t_bill.status_code,
    t_bill.parent_status_code_id,
    t_bill.parent_status_code,
    t_bill.bill_to_party_id,
    t_bill.bill_date_time,
    t_bill.bill_time,
    t_bill.bill_date,
    t_bill.amount_due,
    t_bill.currency_code_id,
    t_bill.currency_code,
    t_bill.parent_currency_code_id,
    t_bill.parent_currency_code
   FROM t_bill;
--\echo Creating view 'v_account'...
CREATE OR REPLACE VIEW v_account AS 
SELECT t_account.account_id,
    t_account.account_number,
    t_account.account_type_code_id,
    t_account.account_type_code,
    t_account.parent_account_type_code_id,
    t_account.parent_account_type_code,
    t_account.patient_m_id,
    t_account.patient_id,
    t_account.financial_class_code_id,
    t_account.financial_class_code,
    t_account.parent_financial_class_code_id,
    t_account.parent_financial_class_code,
    t_account.financial_status_code_id,
    t_account.financial_status_code,
    t_account.parent_financial_status_code_id,
    t_account.parent_financial_status_code,
    t_account.account_balance_amount,
    t_account.account_balance_currency_code_id,
    t_account.account_balance_currency_code,
    t_account.parent_account_balance_currency_code_id,
    t_account.parent_account_balance_currency_code,
    t_account.account_balance_date_time,
    t_account.account_balance_time,
    t_account.account_balance_date
   FROM t_account;
--\echo Creating view 'v_account_guarantor'...
CREATE OR REPLACE VIEW v_account_guarantor AS 
SELECT t_account_guarantor.account_guarantor_id,
    t_account_guarantor.account_id,
    t_account_guarantor.sequence,
    t_account_guarantor.guarantor_account_id
   FROM t_account_guarantor;
--\echo Creating view 'v_medical_supply_order_event'...
CREATE OR REPLACE VIEW v_medical_supply_order_event AS 
SELECT t_medical_supply_order_event.clinical_event_id,
    t_medical_supply_order_event.source_name,
    t_medical_supply_order_event.event_type_id,
    t_medical_supply_order_event.event_type,
    t_medical_supply_order_event.parent_event_id,
    t_medical_supply_order_event.encounter_id,
    t_medical_supply_order_event.encounter_type_code_id,
    t_medical_supply_order_event.encounter_type_code,
    t_medical_supply_order_event.parent_encounter_type_code_id,
    t_medical_supply_order_event.parent_encounter_type_code,
    t_medical_supply_order_event.patient_m_id,
    t_medical_supply_order_event.patient_id,
    t_medical_supply_order_event.l0_organization_unit_m_id,
    t_medical_supply_order_event.service_line_id,
    t_medical_supply_order_event.event_date_time,
    t_medical_supply_order_event.event_time,
    t_medical_supply_order_event.event_date,
    t_medical_supply_order_event.l0_facility_location_m_id,
    t_medical_supply_order_event.location_id,
    t_medical_supply_order_event.care_plan_id,
    t_medical_supply_order_event.order_number,
    t_medical_supply_order_event.order_type_code_id,
    t_medical_supply_order_event.parent_order_type_code_id,
    t_medical_supply_order_event.order_priority_code_id,
    t_medical_supply_order_event.parent_order_priority_code_id,
    t_medical_supply_order_event.order_reason,
    t_medical_supply_order_event.order_outcome_status_code_id,
    t_medical_supply_order_event.parent_order_outcome_status_code_id,
    t_medical_supply_order_event.order_detail_number,
    t_medical_supply_order_event.order_sequence_nbr,
    t_medical_supply_order_event.order_detail_status_code_id,
    t_medical_supply_order_event.parent_order_detail_status_code_id,
    t_medical_supply_order_event.order_set_number,
    t_medical_supply_order_event.order_set_name,
    t_medical_supply_order_event.mso_part_number_code_id,
    t_medical_supply_order_event.mso_parent_part_number_code_id,
    t_medical_supply_order_event.mso_quantity,
    t_medical_supply_order_event.mso_quantity_uom_code_id,
    t_medical_supply_order_event.mso_parent_quantity_uom_code_id
   FROM t_medical_supply_order_event;
--\echo Creating view 'v_clinical_event_provider'...
CREATE OR REPLACE VIEW v_clinical_event_provider AS 
SELECT t_clinical_event_provider.clinical_event_id,
    t_clinical_event_provider.provider_m_id,
    t_clinical_event_provider.provider_id,
    t_clinical_event_provider.provider_role_code_id,
    t_clinical_event_provider.provider_role_code,
    t_clinical_event_provider.parent_provider_role_code_id,
    t_clinical_event_provider.parent_provider_role_code
   FROM t_clinical_event_provider;
--\echo Creating view 'v_movement_event'...
CREATE OR REPLACE VIEW v_movement_event AS 
SELECT t_movement_event.clinical_event_id,
    t_movement_event.source_name,
    t_movement_event.event_type_id,
    t_movement_event.event_type,
    t_movement_event.parent_event_id,
    t_movement_event.encounter_id,
    t_movement_event.encounter_type_code_id,
    t_movement_event.encounter_type_code,
    t_movement_event.parent_encounter_type_code_id,
    t_movement_event.parent_encounter_type_code,
    t_movement_event.patient_m_id,
    t_movement_event.patient_id,
    t_movement_event.l0_organization_unit_m_id,
    t_movement_event.service_line_id,
    t_movement_event.event_date_time,
    t_movement_event.event_time,
    t_movement_event.event_date,
    t_movement_event.l0_facility_location_m_id,
    t_movement_event.location_id,
    t_movement_event.care_plan_id,
    t_movement_event.mvm_type_code_id,
    t_movement_event.mvm_parent_type_code_id
   FROM t_movement_event;
--\echo Creating view 'v_observation_event'...
CREATE OR REPLACE VIEW v_observation_event AS 
SELECT t_observation_event.clinical_event_id,
    t_observation_event.source_name,
    t_observation_event.event_type_id,
    t_observation_event.event_type,
    t_observation_event.parent_event_id,
    t_observation_event.encounter_id,
    t_observation_event.encounter_type_code_id,
    t_observation_event.encounter_type_code,
    t_observation_event.parent_encounter_type_code_id,
    t_observation_event.parent_encounter_type_code,
    t_observation_event.patient_m_id,
    t_observation_event.patient_id,
    t_observation_event.l0_organization_unit_m_id,
    t_observation_event.service_line_id,
    t_observation_event.event_date_time,
    t_observation_event.event_time,
    t_observation_event.event_date,
    t_observation_event.l0_facility_location_m_id,
    t_observation_event.location_id,
    t_observation_event.care_plan_id,
    t_observation_event.event_end_date_time,
    t_observation_event.event_end_time,
    t_observation_event.event_end_date,
    t_observation_event.obs_location_id,
    t_observation_event.batch_number,
    t_observation_event.observation_number,
    t_observation_event.obs_sequence,
    t_observation_event.obs_sub_sequence,
    t_observation_event.result_type_code_id,
    t_observation_event.parent_result_type_code_id,
    t_observation_event.text_result,
    t_observation_event.ratio_numerator,
    t_observation_event.ratio_denominator,
    t_observation_event.quantity_value,
    t_observation_event.quantity_value_uom_code_id,
    t_observation_event.parent_quantity_value_uom_code_id,
    t_observation_event.quantity_value_comp_code_id,
    t_observation_event.parent_quantity_value_comp_code_id,
    t_observation_event.sample_origin_value,
    t_observation_event.sample_origin_uom_code_id,
    t_observation_event.parent_sample_origin_uom_code_id,
    t_observation_event.sample_result_period,
    t_observation_event.sample_result_factor,
    t_observation_event.sample_result_lower_limit,
    t_observation_event.sample_result_upper_limit,
    t_observation_event.sample_result_dimensions,
    t_observation_event.sample_result_data,
    t_observation_event.observation_code_id,
    t_observation_event.parent_observation_code_id,
    t_observation_event.status_code_id,
    t_observation_event.parent_status_code_id,
    t_observation_event.reliability_code_id,
    t_observation_event.parent_reliability_code_id,
    t_observation_event.method_code_id,
    t_observation_event.parent_method_code_id,
    t_observation_event.interpretation_code_id,
    t_observation_event.parent_interpretation_code_id,
    t_observation_event.body_site_code_id,
    t_observation_event.parent_body_site_code_id,
    t_observation_event.commnt,
    t_observation_event.device,
    t_observation_event.vital_sign_indicator_code_id,
    t_observation_event.parent_vital_sign_indicator_code_id,
    t_observation_event.specimen_id
   FROM t_observation_event;
--\echo Creating view 'v_pharmacy_presciption_order_event'...
CREATE OR REPLACE VIEW v_pharmacy_presciption_order_event AS 
SELECT t_pharmacy_prescription_order_event.clinical_event_id,
    t_pharmacy_prescription_order_event.source_name,
    t_pharmacy_prescription_order_event.event_type_id,
    t_pharmacy_prescription_order_event.event_type,
    t_pharmacy_prescription_order_event.parent_event_id,
    t_pharmacy_prescription_order_event.encounter_id,
    t_pharmacy_prescription_order_event.encounter_type_code_id,
    t_pharmacy_prescription_order_event.encounter_type_code,
    t_pharmacy_prescription_order_event.parent_encounter_type_code_id,
    t_pharmacy_prescription_order_event.parent_encounter_type_code,
    t_pharmacy_prescription_order_event.patient_m_id,
    t_pharmacy_prescription_order_event.patient_id,
    t_pharmacy_prescription_order_event.l0_organization_unit_m_id,
    t_pharmacy_prescription_order_event.service_line_id,
    t_pharmacy_prescription_order_event.event_date_time,
    t_pharmacy_prescription_order_event.event_time,
    t_pharmacy_prescription_order_event.event_date,
    t_pharmacy_prescription_order_event.l0_facility_location_m_id,
    t_pharmacy_prescription_order_event.location_id,
    t_pharmacy_prescription_order_event.care_plan_id,
    t_pharmacy_prescription_order_event.order_number,
    t_pharmacy_prescription_order_event.order_type_code_id,
    t_pharmacy_prescription_order_event.parent_order_type_code_id,
    t_pharmacy_prescription_order_event.order_priority_code_id,
    t_pharmacy_prescription_order_event.parent_order_priority_code_id,
    t_pharmacy_prescription_order_event.order_reason,
    t_pharmacy_prescription_order_event.order_outcome_status_code_id,
    t_pharmacy_prescription_order_event.parent_order_outcome_status_code_id,
    t_pharmacy_prescription_order_event.order_detail_number,
    t_pharmacy_prescription_order_event.order_sequence_nbr,
    t_pharmacy_prescription_order_event.order_detail_status_code_id,
    t_pharmacy_prescription_order_event.parent_order_detail_status_code_id,
    t_pharmacy_prescription_order_event.order_set_number,
    t_pharmacy_prescription_order_event.order_set_name,
    t_pharmacy_prescription_order_event.substance_code_id,
    t_pharmacy_prescription_order_event.parent_substance_code_id,
    t_pharmacy_prescription_order_event.phr_order_type_code_id,
    t_pharmacy_prescription_order_event.parent_phr_order_type_code_id,
    t_pharmacy_prescription_order_event.provid_admin_instruct_code_id,
    t_pharmacy_prescription_order_event.parent_provid_admin_instruct_code_id,
    t_pharmacy_prescription_order_event.provid_admin_instructions,
    t_pharmacy_prescription_order_event.req_min_amount,
    t_pharmacy_prescription_order_event.req_max_amount,
    t_pharmacy_prescription_order_event.req_amount_uom_code_id,
    t_pharmacy_prescription_order_event.parent_req_amount_uom_code_id,
    t_pharmacy_prescription_order_event.req_amount_per_time_code_id,
    t_pharmacy_prescription_order_event.parent_req_amount_per_time_code_id,
    t_pharmacy_prescription_order_event.req_dosage_form_code_id,
    t_pharmacy_prescription_order_event.parent_req_dosage_form_code_id,
    t_pharmacy_prescription_order_event.req_stgth,
    t_pharmacy_prescription_order_event.stgth_uom_code_id,
    t_pharmacy_prescription_order_event.parent_req_stgth_uom_code_id,
    t_pharmacy_prescription_order_event.req_drug_stgth_vol,
    t_pharmacy_prescription_order_event.req_drug_stgth_vol_uom_code_id,
    t_pharmacy_prescription_order_event.parent_req_drug_stgth_vol_uom_code_id,
    t_pharmacy_prescription_order_event.req_rate_amount,
    t_pharmacy_prescription_order_event.req_rate_amount_uom_code_id,
    t_pharmacy_prescription_order_event.dsp_amount,
    t_pharmacy_prescription_order_event.dsp_amount_uom_code_id,
    t_pharmacy_prescription_order_event.parent_dsp_amount_uom_code_id,
    t_pharmacy_prescription_order_event.dsp_dispense_code_id,
    t_pharmacy_prescription_order_event.parent_dsp_dispense_code_id,
    t_pharmacy_prescription_order_event.dsp_number_of_refills,
    t_pharmacy_prescription_order_event.dsp_dispense_interval,
    t_pharmacy_prescription_order_event.dsp_needs_human_review_code_id,
    t_pharmacy_prescription_order_event.parent_dsp_needs_human_review_code_id,
    t_pharmacy_prescription_order_event.dsp_dispensing_pharmacy_id,
    t_pharmacy_prescription_order_event.dsp_total_daily_dose,
    t_pharmacy_prescription_order_event.dsp_total_daily_dose_uom_code_id,
    t_pharmacy_prescription_order_event.parent_dsp_total_daily_dose_uom_code_id,
    t_pharmacy_prescription_order_event.dsp_prov_pharm_treat_inst_code_id,
    t_pharmacy_prescription_order_event.parent_dsp_prov_pharm_treat_inst_code_id,
    t_pharmacy_prescription_order_event.dsp_prov_pharm_treat_inst,
    t_pharmacy_prescription_order_event.dsp_allow_substitutions_code_id,
    t_pharmacy_prescription_order_event.parent_dsp_allow_substitutions_code_id,
    t_pharmacy_prescription_order_event.pful_substance_code_id,
    t_pharmacy_prescription_order_event.parent_pful_substance_code_id,
    t_pharmacy_prescription_order_event.pful_admin_start_date_time,
    t_pharmacy_prescription_order_event.pful_admin_start_time,
    t_pharmacy_prescription_order_event.pful_admin_start_date,
    t_pharmacy_prescription_order_event.pful_admin_end_date_time,
    t_pharmacy_prescription_order_event.pful_admin_end_time,
    t_pharmacy_prescription_order_event.pful_admin_end_date,
    t_pharmacy_prescription_order_event.pful_amount,
    t_pharmacy_prescription_order_event.pful_amount_uom_code_id,
    t_pharmacy_prescription_order_event.parent_pful_amount_uom_code_id,
    t_pharmacy_prescription_order_event.pful_amount_per_time_code_id,
    t_pharmacy_prescription_order_event.parent_pful_amount_per_time_code_id,
    t_pharmacy_prescription_order_event.pful_dosage_form_code_id,
    t_pharmacy_prescription_order_event.parent_pful_dosage_form_code_id,
    t_pharmacy_prescription_order_event.pful_stgth,
    t_pharmacy_prescription_order_event.pful_stgth_uom_code_id,
    t_pharmacy_prescription_order_event.parent_pful_stgth_uom_code_id,
    t_pharmacy_prescription_order_event.pful_drug_stgth_vol,
    t_pharmacy_prescription_order_event.pful_drug_stgth_vol_uom_code_id,
    t_pharmacy_prescription_order_event.parent_pful_drug_stgth_vol_uom_code_id,
    t_pharmacy_prescription_order_event.pful_barcode_identifier,
    t_pharmacy_prescription_order_event.pful_substance_lot_number,
    t_pharmacy_prescription_order_event.pful_substance_expiration_date,
    t_pharmacy_prescription_order_event.pful_substance_manuf_code_id,
    t_pharmacy_prescription_order_event.parent_pful_substance_manuf_code_id,
    t_pharmacy_prescription_order_event.pful_administered_location_id,
    t_pharmacy_prescription_order_event.pful_substance_refusal_code_id,
    t_pharmacy_prescription_order_event.parent_pful_substance_refusal_code_id,
    t_pharmacy_prescription_order_event.pful_completion_status_code_id,
    t_pharmacy_prescription_order_event.parent_pful_completion_status_code_id,
    t_pharmacy_prescription_order_event.pful_administration_note_code_id,
    t_pharmacy_prescription_order_event.parent_pful_administration_note_code_id,
    t_pharmacy_prescription_order_event.pful_administration_notes,
    t_pharmacy_prescription_order_event.vful_vaccine_code_id,
    t_pharmacy_prescription_order_event.parent_vful_vaccine_code_id,
    t_pharmacy_prescription_order_event.vful_admin_start_date_time,
    t_pharmacy_prescription_order_event.vful_admin_start_time,
    t_pharmacy_prescription_order_event.vful_admin_start_date,
    t_pharmacy_prescription_order_event.vful_admin_end_date_time,
    t_pharmacy_prescription_order_event.vful_admin_end_time,
    t_pharmacy_prescription_order_event.vful_admin_end_date,
    t_pharmacy_prescription_order_event.vful_amount,
    t_pharmacy_prescription_order_event.vful_amount_uom_code_id,
    t_pharmacy_prescription_order_event.parent_vful_amount_uom_code_id,
    t_pharmacy_prescription_order_event.vful_amount_per_time_code_id,
    t_pharmacy_prescription_order_event.parent_vful_amount_per_time_code_id,
    t_pharmacy_prescription_order_event.vful_dosage_form_code_id,
    t_pharmacy_prescription_order_event.parent_vful_dosage_form_code_id,
    t_pharmacy_prescription_order_event.vful_stgth,
    t_pharmacy_prescription_order_event.vful_stgth_uom_code_id,
    t_pharmacy_prescription_order_event.parent_vful_stgth_uom_code_id,
    t_pharmacy_prescription_order_event.vful_drug_stgth_vol,
    t_pharmacy_prescription_order_event.vful_drug_stgth_vol_uom_code_id,
    t_pharmacy_prescription_order_event.parent_vful_drug_stgth_vol_uom_code_id,
    t_pharmacy_prescription_order_event.vful_barcode_identifier,
    t_pharmacy_prescription_order_event.vful_vaccine_lot_number,
    t_pharmacy_prescription_order_event.vful_vaccine_expiration_date,
    t_pharmacy_prescription_order_event.vful_vaccine_manuf_code_id,
    t_pharmacy_prescription_order_event.parent_vful_vaccine_manuf_code_id,
    t_pharmacy_prescription_order_event.vful_administered_location_id,
    t_pharmacy_prescription_order_event.vful_vaccine_refusal_code_id,
    t_pharmacy_prescription_order_event.parent_vful_vaccine_refusal_code_id,
    t_pharmacy_prescription_order_event.vful_completion_status_code_id,
    t_pharmacy_prescription_order_event.parent_vful_completion_status_code_id,
    t_pharmacy_prescription_order_event.vful_administration_note_code_id,
    t_pharmacy_prescription_order_event.parent_vful_administration_note_code_id,
    t_pharmacy_prescription_order_event.vful_administration_notes
   FROM t_pharmacy_prescription_order_event;
--\echo Creating view 'v_procedure_event'...
CREATE OR REPLACE VIEW v_procedure_event AS 
SELECT t_procedure_event.clinical_event_id,
    t_procedure_event.source_name,
    t_procedure_event.event_type_id,
    t_procedure_event.event_type,
    t_procedure_event.parent_event_id,
    t_procedure_event.encounter_id,
    t_procedure_event.encounter_type_code_id,
    t_procedure_event.encounter_type_code,
    t_procedure_event.parent_encounter_type_code_id,
    t_procedure_event.parent_encounter_type_code,
    t_procedure_event.patient_m_id,
    t_procedure_event.patient_id,
    t_procedure_event.l0_organization_unit_m_id,
    t_procedure_event.service_line_id,
    t_procedure_event.event_date_time,
    t_procedure_event.event_time,
    t_procedure_event.event_date,
    t_procedure_event.l0_facility_location_m_id,
    t_procedure_event.location_id,
    t_procedure_event.care_plan_id,
    t_procedure_event.event_end_date_time,
    t_procedure_event.event_end_time,
    t_procedure_event.event_end_date,
    t_procedure_event.procedure_service_line_id,
    t_procedure_event.procedure_code_id,
    t_procedure_event.parent_procedure_code_id,
    t_procedure_event.provided_counseling_ind_code_id,
    t_procedure_event.parent_provided_counseling_ind_code_id,
    t_procedure_event.outcome,
    t_procedure_event.anesthesia_type_code_id,
    t_procedure_event.parent_anesthesia_type_code_id,
    t_procedure_event.anesthetic_type_code_id,
    t_procedure_event.parent_anesthetic_type_code_id,
    t_procedure_event.anesthesia_minutes,
    t_procedure_event.anesthesia_hold_end_date_time,
    t_procedure_event.anesthesia_hold_end_time,
    t_procedure_event.anesthesia_hold_end_date
   FROM t_procedure_event;
--\echo Creating view 'v_procedure_order_event'...
CREATE OR REPLACE VIEW v_procedure_order_event AS 
SELECT t_procedure_order_event.clinical_event_id,
    t_procedure_order_event.source_name,
    t_procedure_order_event.event_type_id,
    t_procedure_order_event.event_type,
    t_procedure_order_event.parent_event_id,
    t_procedure_order_event.encounter_id,
    t_procedure_order_event.encounter_type_code_id,
    t_procedure_order_event.encounter_type_code,
    t_procedure_order_event.parent_encounter_type_code_id,
    t_procedure_order_event.parent_encounter_type_code,
    t_procedure_order_event.patient_m_id,
    t_procedure_order_event.patient_id,
    t_procedure_order_event.l0_organization_unit_m_id,
    t_procedure_order_event.service_line_id,
    t_procedure_order_event.event_date_time,
    t_procedure_order_event.event_time,
    t_procedure_order_event.event_date,
    t_procedure_order_event.l0_facility_location_m_id,
    t_procedure_order_event.location_id,
    t_procedure_order_event.care_plan_id,
    t_procedure_order_event.order_number,
    t_procedure_order_event.order_type_code_id,
    t_procedure_order_event.parent_order_type_code_id,
    t_procedure_order_event.order_priority_code_id,
    t_procedure_order_event.parent_order_priority_code_id,
    t_procedure_order_event.order_reason,
    t_procedure_order_event.order_outcome_status_code_id,
    t_procedure_order_event.parent_order_outcome_status_code_id,
    t_procedure_order_event.order_detail_number,
    t_procedure_order_event.order_sequence_nbr,
    t_procedure_order_event.order_detail_status_code_id,
    t_procedure_order_event.parent_order_detail_status_code_id,
    t_procedure_order_event.order_set_number,
    t_procedure_order_event.order_set_name,
    t_procedure_order_event.procedure_code_id,
    t_procedure_order_event.parent_procedure_code_id
   FROM t_procedure_order_event;
--\echo Creating view 'v_radiology_order_event'...
CREATE OR REPLACE VIEW v_radiology_order_event AS 
SELECT t_radiology_order_event.clinical_event_id,
    t_radiology_order_event.source_name,
    t_radiology_order_event.event_type_id,
    t_radiology_order_event.event_type,
    t_radiology_order_event.parent_event_id,
    t_radiology_order_event.encounter_id,
    t_radiology_order_event.encounter_type_code_id,
    t_radiology_order_event.encounter_type_code,
    t_radiology_order_event.parent_encounter_type_code_id,
    t_radiology_order_event.parent_encounter_type_code,
    t_radiology_order_event.patient_m_id,
    t_radiology_order_event.patient_id,
    t_radiology_order_event.l0_organization_unit_m_id,
    t_radiology_order_event.service_line_id,
    t_radiology_order_event.event_date_time,
    t_radiology_order_event.event_time,
    t_radiology_order_event.event_date,
    t_radiology_order_event.l0_facility_location_m_id,
    t_radiology_order_event.location_id,
    t_radiology_order_event.care_plan_id,
    t_radiology_order_event.order_number,
    t_radiology_order_event.order_type_code_id,
    t_radiology_order_event.parent_order_type_code_id,
    t_radiology_order_event.order_priority_code_id,
    t_radiology_order_event.parent_order_priority_code_id,
    t_radiology_order_event.order_reason,
    t_radiology_order_event.order_outcome_status_code_id,
    t_radiology_order_event.parent_order_outcome_status_code_id,
    t_radiology_order_event.order_detail_number,
    t_radiology_order_event.order_sequence_nbr,
    t_radiology_order_event.order_detail_status_code_id,
    t_radiology_order_event.parent_order_detail_status_code_id,
    t_radiology_order_event.order_set_number,
    t_radiology_order_event.order_set_name,
    t_radiology_order_event.modality_code_id,
    t_radiology_order_event.parent_modality_code_id,
    t_radiology_order_event.body_site_code_id,
    t_radiology_order_event.parent_body_site_code_id,
    t_radiology_order_event.device_id
   FROM t_radiology_order_event;
--\echo Creating view 'v_referral_order_event'...
CREATE OR REPLACE VIEW v_referral_order_event AS 
SELECT t_referral_order_event.clinical_event_id,
    t_referral_order_event.source_name,
    t_referral_order_event.event_type_id,
    t_referral_order_event.event_type,
    t_referral_order_event.parent_event_id,
    t_referral_order_event.encounter_id,
    t_referral_order_event.encounter_type_code_id,
    t_referral_order_event.encounter_type_code,
    t_referral_order_event.parent_encounter_type_code_id,
    t_referral_order_event.parent_encounter_type_code,
    t_referral_order_event.patient_m_id,
    t_referral_order_event.patient_id,
    t_referral_order_event.l0_organization_unit_m_id,
    t_referral_order_event.service_line_id,
    t_referral_order_event.event_date_time,
    t_referral_order_event.event_time,
    t_referral_order_event.event_date,
    t_referral_order_event.l0_facility_location_m_id,
    t_referral_order_event.location_id,
    t_referral_order_event.care_plan_id,
    t_referral_order_event.order_number,
    t_referral_order_event.order_type_code_id,
    t_referral_order_event.parent_order_type_code_id,
    t_referral_order_event.order_priority_code_id,
    t_referral_order_event.parent_order_priority_code_id,
    t_referral_order_event.order_reason,
    t_referral_order_event.order_outcome_status_code_id,
    t_referral_order_event.parent_order_outcome_status_code_id,
    t_referral_order_event.order_detail_number,
    t_referral_order_event.order_sequence_nbr,
    t_referral_order_event.order_detail_status_code_id,
    t_referral_order_event.parent_order_detail_status_code_id,
    t_referral_order_event.order_set_number,
    t_referral_order_event.order_set_name,
    t_referral_order_event.refer_to_location_id
   FROM t_referral_order_event;
--\echo Creating view 'v_transfer_event'...
CREATE OR REPLACE VIEW v_transfer_event AS 
SELECT t_transfer_event.clinical_event_id,
    t_transfer_event.source_name,
    t_transfer_event.event_type_id,
    t_transfer_event.event_type,
    t_transfer_event.parent_event_id,
    t_transfer_event.encounter_id,
    t_transfer_event.encounter_type_code_id,
    t_transfer_event.encounter_type_code,
    t_transfer_event.parent_encounter_type_code_id,
    t_transfer_event.parent_encounter_type_code,
    t_transfer_event.patient_m_id,
    t_transfer_event.patient_id,
    t_transfer_event.l0_organization_unit_m_id,
    t_transfer_event.service_line_id,
    t_transfer_event.event_date_time,
    t_transfer_event.event_time,
    t_transfer_event.event_date,
    t_transfer_event.l0_facility_location_m_id,
    t_transfer_event.location_id,
    t_transfer_event.care_plan_id,
    t_transfer_event.to_location_id,
    t_transfer_event.external_to_location,
    t_transfer_event.type_code_id,
    t_transfer_event.parent_type_code_id,
    t_transfer_event.method_code_id,
    t_transfer_event.parent_method_code_id,
    t_transfer_event.reason
   FROM t_transfer_event;
--\echo Creating view 'v_diet_order_event'...
CREATE OR REPLACE VIEW v_diet_order_event AS 
SELECT t_diet_order_event.clinical_event_id,
    t_diet_order_event.source_name,
    t_diet_order_event.event_type_id,
    t_diet_order_event.event_type,
    t_diet_order_event.parent_event_id,
    t_diet_order_event.encounter_id,
    t_diet_order_event.encounter_type_code_id,
    t_diet_order_event.encounter_type_code,
    t_diet_order_event.parent_encounter_type_code_id,
    t_diet_order_event.parent_encounter_type_code,
    t_diet_order_event.patient_m_id,
    t_diet_order_event.patient_id,
    t_diet_order_event.l0_organization_unit_m_id,
    t_diet_order_event.service_line_id,
    t_diet_order_event.event_date_time,
    t_diet_order_event.event_time,
    t_diet_order_event.event_date,
    t_diet_order_event.l0_facility_location_m_id,
    t_diet_order_event.location_id,
    t_diet_order_event.care_plan_id,
    t_diet_order_event.order_number,
    t_diet_order_event.order_type_code_id,
    t_diet_order_event.parent_order_type_code_id,
    t_diet_order_event.order_priority_code_id,
    t_diet_order_event.parent_order_priority_code_id,
    t_diet_order_event.order_reason,
    t_diet_order_event.order_outcome_status_code_id,
    t_diet_order_event.parent_order_outcome_status_code_id,
    t_diet_order_event.order_detail_number,
    t_diet_order_event.order_sequence_nbr,
    t_diet_order_event.order_detail_status_code_id,
    t_diet_order_event.parent_order_detail_status_code_id,
    t_diet_order_event.order_set_number,
    t_diet_order_event.order_set_name,
    t_diet_order_event.diet_specification_code_id,
    t_diet_order_event.parent_diet_specification_code_id,
    t_diet_order_event.service_period_code_id,
    t_diet_order_event.parent_service_period_code_id,
    t_diet_order_event.product_code_id,
    t_diet_order_event.parent_product_code_id,
    t_diet_order_event.text_instruction
   FROM t_diet_order_event;
--\echo Creating view 'v_discharge_event'...
CREATE OR REPLACE VIEW v_discharge_event AS 
SELECT t_discharge_event.clinical_event_id,
    t_discharge_event.source_name,
    t_discharge_event.event_type_id,
    t_discharge_event.event_type,
    t_discharge_event.parent_event_id,
    t_discharge_event.encounter_id,
    t_discharge_event.encounter_type_code_id,
    t_discharge_event.encounter_type_code,
    t_discharge_event.parent_encounter_type_code_id,
    t_discharge_event.parent_encounter_type_code,
    t_discharge_event.patient_m_id,
    t_discharge_event.patient_id,
    t_discharge_event.l0_organization_unit_m_id,
    t_discharge_event.service_line_id,
    t_discharge_event.event_date_time,
    t_discharge_event.event_time,
    t_discharge_event.event_date,
    t_discharge_event.l0_facility_location_m_id,
    t_discharge_event.location_id,
    t_discharge_event.care_plan_id,
    t_discharge_event.disposition_code_id,
    t_discharge_event.parent_disposition_code_id,
    t_discharge_event.to_location,
    t_discharge_event.to_location_type_code_id,
    t_discharge_event.parent_to_location_type_code_id,
    t_discharge_event.baby_detained_indicator,
    t_discharge_event.elec_institut_req_code_id,
    t_discharge_event.parent_elec_institut_req_code_id,
    t_discharge_event.elect_copy_hlth_info_req_code_id,
    t_discharge_event.parent_elect_copy_hlth_info_req_code_id
   FROM t_discharge_event;
--\echo Creating view 'v_claim'...
CREATE OR REPLACE VIEW v_claim AS 
SELECT t_claim.claim_id,
    t_claim.claim_number,
    t_claim.account_id,
    t_claim.pay_to_l0_facility_location_m_id,
    t_claim.pay_to_location_id,
    t_claim.procedure_code_id,
    t_claim.procedure_code,
    t_claim.parent_procedure_code_id,
    t_claim.parent_procedure_code,
    t_claim.diagnosis_code_id,
    t_claim.diagnosis_code,
    t_claim.parent_diagnosis_code_id,
    t_claim.parent_diagnosis_code,
    t_claim.status_code_id,
    t_claim.status_code,
    t_claim.parent_status_code_id,
    t_claim.parent_status_code,
    t_claim.denial_reason_code_id,
    t_claim.denial_reason_code,
    t_claim.parent_denial_reason_code_id,
    t_claim.parent_denial_reason_code,
    t_claim.claim_date_time,
    t_claim.claim_time,
    t_claim.claim_date,
    t_claim.amt_currency_code_id,
    t_claim.amt_currency_code,
    t_claim.parent_amt_currency_code_id,
    t_claim.parent_amt_currency_code,
    t_claim.amt_claim_amount,
    t_claim.amt_room_and_bed_amount,
    t_claim.amt_ancillary_amount,
    t_claim.amt_professional_fee_amount,
    t_claim.amt_adjustment_amount,
    t_claim.amt_paid_amount,
    t_claim.amt_copay_amount,
    t_claim.amt_coinsurance_amount,
    t_claim.amt_denied_amount,
    t_claim.patient_health_plan_id
   FROM t_claim;
--\echo Creating view 'v_patient_health_plan'...
CREATE OR REPLACE VIEW v_patient_health_plan AS 
SELECT t_patient_health_plan.patient_health_plan_id,
    t_patient_health_plan.transaction_id,
    t_patient_health_plan.version,
    t_patient_health_plan.source_name,
    t_patient_health_plan.source_instance_id,
    t_patient_health_plan.source_instance_id_name,
    t_patient_health_plan.status,
    t_patient_health_plan.status_reason,
    t_patient_health_plan.effective_date,
    t_patient_health_plan.expiration_date,
    t_patient_health_plan.patient_m_id,
    t_patient_health_plan.patient_id,
    t_patient_health_plan.health_plan_id,
    t_patient_health_plan.policy_number,
    t_patient_health_plan.policy_scope_code_id,
    t_patient_health_plan.policy_scope_code,
    t_patient_health_plan.parent_policy_scope_code_id,
    t_patient_health_plan.parent_policy_scope_code,
    t_patient_health_plan.plan_effective_date,
    t_patient_health_plan.plan_expiration_date,
    t_patient_health_plan.termination_reason_code_id,
    t_patient_health_plan.termination_reason_code,
    t_patient_health_plan.parent_termination_reason_code_id,
    t_patient_health_plan.parent_termination_reason_code,
    t_patient_health_plan.subscrib_rel_to_patient_code_id,
    t_patient_health_plan.subscrib_rel_to_patient_code,
    t_patient_health_plan.parent_subscrib_rel_to_patient_code_id,
    t_patient_health_plan.parent_subscrib_rel_to_patient_code,
    t_patient_health_plan.subscriber_id,
    t_patient_health_plan.source_modified_by,
    t_patient_health_plan.source_modified_date,
    t_patient_health_plan.source_created_by,
    t_patient_health_plan.source_created_date,
    t_patient_health_plan.omni_created_date,
    t_patient_health_plan.omni_modified_date
   FROM t_patient_health_plan;
--\echo Creating view 'v_bill_line_item'...
CREATE OR REPLACE VIEW v_bill_line_item AS 
SELECT t_bill_line_item.bill_line_item_id,
    t_bill_line_item.bill_id,
    t_bill_line_item.bill_line_number,
    t_bill_line_item.bill_line_type_code_id,
    t_bill_line_item.bill_line_type_code,
    t_bill_line_item.parent_bill_line_type_code_id,
    t_bill_line_item.parent_bill_line_type_code,
    t_bill_line_item.bill_line_amount
   FROM t_bill_line_item;
--\echo Creating view 'v_charge'...
CREATE OR REPLACE VIEW v_charge AS 
SELECT t_charge.charge_id,
    t_charge.charge_number,
    t_charge.account_id,
    t_charge.provider_m_id,
    t_charge.provider_id,
    t_charge.l0_organization_unit_m_id,
    t_charge.service_line_id,
    t_charge.l0_facility_location_m_id,
    t_charge.location_id,
    t_charge.transaction_type_code_id,
    t_charge.transaction_type_code,
    t_charge.parent_transaction_type_code_id,
    t_charge.parent_transaction_type_code,
    t_charge.chargeable_event_id,
    t_charge.charge_code_id,
    t_charge.charge_code,
    t_charge.parent_charge_code_id,
    t_charge.parent_charge_code,
    t_charge.diagnosis_code_id,
    t_charge.diagnosis_code,
    t_charge.parent_diagnosis_code_id,
    t_charge.parent_diagnosis_code,
    t_charge.diagnosis_related_group_code_id,
    t_charge.diagnosis_related_group_code,
    t_charge.parent_diagnosis_related_group_code_id,
    t_charge.parent_diagnosis_related_group_code,
    t_charge.ambulatory_payment_class_code_id,
    t_charge.ambulatory_payment_class_code,
    t_charge.parent_ambulatory_payment_class_code_id,
    t_charge.parent_ambulatory_payment_class_code,
    t_charge.revenue_code_id,
    t_charge.revenue_code,
    t_charge.parent_revenue_code_id,
    t_charge.parent_revenue_code,
    t_charge.drug_code_id,
    t_charge.drug_code,
    t_charge.parent_drug_code_id,
    t_charge.parent_drug_code,
    t_charge.pharmacy_dea_number,
    t_charge.ncpdp_number,
    t_charge.item_number,
    t_charge.model_number,
    t_charge.service_date_time,
    t_charge.service_time,
    t_charge.service_date,
    t_charge.charge_date_time,
    t_charge.charge_time,
    t_charge.charge_date,
    t_charge.charge_description,
    t_charge.amt_currency_code_id,
    t_charge.amt_currency_code,
    t_charge.parent_amt_currency_code_id,
    t_charge.parent_amt_currency_code,
    t_charge.amt_charge_quantity,
    t_charge.amt_charge_amount,
    t_charge.amt_actual_cost_amount,
    t_charge.amt_charge_master_cost_amount
   FROM t_charge;
--\echo Creating view 'v_diagnosis_event'...
CREATE OR REPLACE VIEW v_diagnosis_event AS 
SELECT t_diagnosis_event.clinical_event_id,
    t_diagnosis_event.source_name,
    t_diagnosis_event.event_type_id,
    t_diagnosis_event.event_type,
    t_diagnosis_event.parent_event_id,
    t_diagnosis_event.encounter_id,
    t_diagnosis_event.encounter_type_code_id,
    t_diagnosis_event.encounter_type_code,
    t_diagnosis_event.parent_encounter_type_code_id,
    t_diagnosis_event.parent_encounter_type_code,
    t_diagnosis_event.patient_m_id,
    t_diagnosis_event.patient_id,
    t_diagnosis_event.l0_organization_unit_m_id,
    t_diagnosis_event.service_line_id,
    t_diagnosis_event.event_date_time,
    t_diagnosis_event.event_time,
    t_diagnosis_event.event_date,
    t_diagnosis_event.l0_facility_location_m_id,
    t_diagnosis_event.location_id,
    t_diagnosis_event.care_plan_id,
    t_diagnosis_event.diagnosis_code_id,
    t_diagnosis_event.parent_diagnosis_code_id,
    t_diagnosis_event.present_on_admission_code_id,
    t_diagnosis_event.parent_present_on_admission_code_id,
    t_diagnosis_event.type_code_id,
    t_diagnosis_event.parent_type_code_id,
    t_diagnosis_event.primary_diagnosis_ind_code_id,
    t_diagnosis_event.parent_primary_diagnosis_ind_code_id,
    t_diagnosis_event.condition_category_code_id,
    t_diagnosis_event.parent_condition_category_code_id,
    t_diagnosis_event.condition_status_code_id,
    t_diagnosis_event.parent_condition_status_code_id,
    t_diagnosis_event.condition_severity_code_id,
    t_diagnosis_event.parent_condition_severity_code_id,
    t_diagnosis_event.onset_date,
    t_diagnosis_event.assertion_date,
    t_diagnosis_event.abatement_date
   FROM t_diagnosis_event;
--\echo Creating view 'v_diagnostic_test_order_event'...
CREATE OR REPLACE VIEW v_diagnostic_test_order_event AS 
SELECT t_diagnostic_test_order_event.clinical_event_id,
    t_diagnostic_test_order_event.source_name,
    t_diagnostic_test_order_event.event_type_id,
    t_diagnostic_test_order_event.event_type,
    t_diagnostic_test_order_event.parent_event_id,
    t_diagnostic_test_order_event.encounter_id,
    t_diagnostic_test_order_event.encounter_type_code_id,
    t_diagnostic_test_order_event.encounter_type_code,
    t_diagnostic_test_order_event.parent_encounter_type_code_id,
    t_diagnostic_test_order_event.parent_encounter_type_code,
    t_diagnostic_test_order_event.patient_m_id,
    t_diagnostic_test_order_event.patient_id,
    t_diagnostic_test_order_event.l0_organization_unit_m_id,
    t_diagnostic_test_order_event.service_line_id,
    t_diagnostic_test_order_event.event_date_time,
    t_diagnostic_test_order_event.event_time,
    t_diagnostic_test_order_event.event_date,
    t_diagnostic_test_order_event.l0_facility_location_m_id,
    t_diagnostic_test_order_event.location_id,
    t_diagnostic_test_order_event.care_plan_id,
    t_diagnostic_test_order_event.order_number,
    t_diagnostic_test_order_event.order_type_code_id,
    t_diagnostic_test_order_event.parent_order_type_code_id,
    t_diagnostic_test_order_event.order_priority_code_id,
    t_diagnostic_test_order_event.parent_order_priority_code_id,
    t_diagnostic_test_order_event.order_reason,
    t_diagnostic_test_order_event.order_outcome_status_code_id,
    t_diagnostic_test_order_event.parent_order_outcome_status_code_id,
    t_diagnostic_test_order_event.order_detail_number,
    t_diagnostic_test_order_event.order_sequence_nbr,
    t_diagnostic_test_order_event.order_detail_status_code_id,
    t_diagnostic_test_order_event.parent_order_detail_status_code_id,
    t_diagnostic_test_order_event.order_set_number,
    t_diagnostic_test_order_event.order_set_name,
    t_diagnostic_test_order_event.diagnostic_test_code_id,
    t_diagnostic_test_order_event.parent_diagnostic_test_code_id
   FROM t_diagnostic_test_order_event;
--\echo Creating view 'v_admission_event'...
CREATE OR REPLACE VIEW v_admission_event AS 
SELECT t_admission_event.clinical_event_id,
    t_admission_event.source_name,
    t_admission_event.event_type_id,
    t_admission_event.event_type,
    t_admission_event.parent_event_id,
    t_admission_event.encounter_id,
    t_admission_event.encounter_type_code_id,
    t_admission_event.encounter_type_code,
    t_admission_event.parent_encounter_type_code_id,
    t_admission_event.parent_encounter_type_code,
    t_admission_event.patient_m_id,
    t_admission_event.patient_id,
    t_admission_event.l0_organization_unit_m_id,
    t_admission_event.service_line_id,
    t_admission_event.event_date_time,
    t_admission_event.event_time,
    t_admission_event.event_date,
    t_admission_event.l0_facility_location_m_id,
    t_admission_event.location_id,
    t_admission_event.care_plan_id,
    t_admission_event.type_code_id,
    t_admission_event.parent_type_code_id,
    t_admission_event.admit_source_code_id,
    t_admission_event.parent_admit_source_code_id,
    t_admission_event.readmit_code_id,
    t_admission_event.parent_readmit_code_id,
    t_admission_event.admit_reason,
    t_admission_event.patient_valuables,
    t_admission_event.patient_valuables_location,
    t_admission_event.estimated_length_of_stay,
    t_admission_event.expected_event_date_time,
    t_admission_event.expected_event_time,
    t_admission_event.expected_event_date
   FROM t_admission_event;
--\echo Creating view 'v_death_event'...
CREATE OR REPLACE VIEW v_death_event AS 
SELECT t_death_event.clinical_event_id,
    t_death_event.source_name,
    t_death_event.event_type_id,
    t_death_event.event_type,
    t_death_event.parent_event_id,
    t_death_event.encounter_id,
    t_death_event.encounter_type_code_id,
    t_death_event.encounter_type_code,
    t_death_event.parent_encounter_type_code_id,
    t_death_event.parent_encounter_type_code,
    t_death_event.patient_m_id,
    t_death_event.patient_id,
    t_death_event.l0_organization_unit_m_id,
    t_death_event.service_line_id,
    t_death_event.event_date_time,
    t_death_event.event_time,
    t_death_event.event_date,
    t_death_event.l0_facility_location_m_id,
    t_death_event.location_id,
    t_death_event.care_plan_id,
    t_death_event.dead_on_arrival_indicator_code_id,
    t_death_event.parent_dead_on_arrival_indicator_code_id,
    t_death_event.manner_of_death_code_id,
    t_death_event.parent_manner_of_death_code_id,
    t_death_event.tobacco_use_contrib_death_code_id,
    t_death_event.parent_tobacco_use_contrib_death_code_id,
    t_death_event.pregnancy_status_code_id,
    t_death_event.parent_pregnancy_status_code_id,
    t_death_event.injury_indicator_code_id,
    t_death_event.parent_injury_indicator_code_id,
    t_death_event.injury_date_time,
    t_death_event.injury_time,
    t_death_event.injury_date,
    t_death_event.injury_at_work_indicator_code_id,
    t_death_event.parent_injury_at_work_indicator_code_id,
    t_death_event.injury_transportation_code_id,
    t_death_event.parent_injury_transportation_code_id,
    t_death_event.injury_place_occured,
    t_death_event.injury_how_occured,
    t_death_event.autopsy_indicator_code_id,
    t_death_event.parent_autopsy_indicator_code_id,
    t_death_event.autopsy_start_date_time,
    t_death_event.autopsy_start_time,
    t_death_event.autopsy_start_date,
    t_death_event.autopsy_end_date_time,
    t_death_event.autopsy_end_time,
    t_death_event.autopsy_end_date,
    t_death_event.autopsy_performed_by_name,
    t_death_event.autopsy_performed_by_title,
    t_death_event.autopsy_coroner_indicator_code_id,
    t_death_event.parent_autopsy_coroner_indicator_code_id,
    t_death_event.certif_death_indicator_code_id,
    t_death_event.parent_certif_death_indicator_code_id,
    t_death_event.certif_death_signed_date_time,
    t_death_event.certif_death_signed_time,
    t_death_event.certif_death_signed_date,
    t_death_event.certif_death_by_name,
    t_death_event.certif_death_by_title
   FROM t_death_event;
--\echo Creating view 'v_dim_facility'...
CREATE OR REPLACE VIEW v_dim_facility AS 
SELECT t_dim_facility_master.facility_m_id,
    t_dim_facility_master.facility_type_code_id,
    t_dim_facility_master.facility_type_code,
    t_dim_facility_master.facility_type_descr,
    t_dim_facility_master.parent_facility_type_code_id,
    t_dim_facility_master.parent_facility_type_code,
    t_dim_facility_master.parent_facility_type_descr,
    t_dim_facility_master.facility_name,
    t_dim_facility_master.l4_facility_location_m_id,
    t_dim_facility_master.l4_facility_location_descr,
    t_dim_facility_master.l4_type_code_id,
    t_dim_facility_master.l4_type_code,
    t_dim_facility_master.l4_type_code_descr,
    t_dim_facility_master.l3_facility_location_m_id,
    t_dim_facility_master.l3_facility_location_descr,
    t_dim_facility_master.l3_type_code_id,
    t_dim_facility_master.l3_type_code,
    t_dim_facility_master.l3_type_code_descr,
    t_dim_facility_master.l2_facility_location_m_id,
    t_dim_facility_master.l2_facility_location_descr,
    t_dim_facility_master.l2_type_code_id,
    t_dim_facility_master.l2_type_code,
    t_dim_facility_master.l2_type_code_descr,
    t_dim_facility_master.l1_facility_location_m_id,
    t_dim_facility_master.l1_facility_location_descr,
    t_dim_facility_master.l1_type_code_id,
    t_dim_facility_master.l1_type_code,
    t_dim_facility_master.l1_type_code_descr,
    t_dim_facility_master.l0_facility_location_m_id,
    t_dim_facility_master.l0_facility_location_descr,
    t_dim_facility_master.l0_type_code_id,
    t_dim_facility_master.l0_type_code,
    t_dim_facility_master.l0_type_code_descr
   FROM t_dim_facility_master;
--\echo Creating view 'v_dim_provider'...
CREATE OR REPLACE VIEW v_dim_provider AS 
SELECT t_dim_provider_master.provider_m_id,
    t_dim_provider_master.provider_master_id,
    t_dim_provider_master.person_m_id,
    t_dim_provider_master.provider_type_code_id,
    t_dim_provider_master.provider_typecode,
    t_dim_provider_master.provider_type_code_sdescr,
    t_dim_provider_master.parent_provider_type_code_id,
    t_dim_provider_master.parent_provider_typecode,
    t_dim_provider_master.parent_provider_type_code_sdescr,
    t_dim_provider_master.active_code_id,
    t_dim_provider_master.activecode,
    t_dim_provider_master.active_code_sdescr,
    t_dim_provider_master.parent_active_code_id,
    t_dim_provider_master.parent_activecode,
    t_dim_provider_master.parent_active_code_sdescr,
    t_dim_provider_master.inactive_reason_code_id,
    t_dim_provider_master.inactive_reasoncode,
    t_dim_provider_master.inactive_reason_code_sdescr,
    t_dim_provider_master.parent_inactive_reason_code_id,
    t_dim_provider_master.parent_inactive_reasoncode,
    t_dim_provider_master.parent_inactive_reason_code_sdescr,
    t_dim_provider_master.expected_return_date,
    t_dim_provider_master.practitioner_category_code_id,
    t_dim_provider_master.practitioner_categorycode,
    t_dim_provider_master.practitioner_category_code_sdescr,
    t_dim_provider_master.parent_practitioner_category_code_id,
    t_dim_provider_master.parent_practitioner_categorycode,
    t_dim_provider_master.parent_practitioner_category_code_sdescr,
    t_dim_provider_master.photo_url,
    t_dim_provider_master.per_protection_code_id,
    t_dim_provider_master.per_protectioncode,
    t_dim_provider_master.per_protection_code_sdescr,
    t_dim_provider_master.per_parent_protection_code_id,
    t_dim_provider_master.per_parent_protectioncode,
    t_dim_provider_master.per_parent_protection_code_sdescr,
    t_dim_provider_master.per_publicity_code_id,
    t_dim_provider_master.per_publicitycode,
    t_dim_provider_master.per_publicity_code_sdescr,
    t_dim_provider_master.per_parent_publicity_code_id,
    t_dim_provider_master.per_parent_publicitycode,
    t_dim_provider_master.per_parent_publicity_code_sdescr,
    t_dim_provider_master.per_birth_date,
    t_dim_provider_master.per_deceased_code_id,
    t_dim_provider_master.per_deceasedcode,
    t_dim_provider_master.per_deceased_code_sdescr,
    t_dim_provider_master.per_parent_deceased_code_id,
    t_dim_provider_master.per_parent_deceasedcode,
    t_dim_provider_master.per_parent_deceased_code_sdescr,
    t_dim_provider_master.per_death_date,
    t_dim_provider_master.per_cause_of_death,
    t_dim_provider_master.per_gender_code_id,
    t_dim_provider_master.per_gendercode,
    t_dim_provider_master.per_gender_code_sdescr,
    t_dim_provider_master.per_parent_gender_code_id,
    t_dim_provider_master.per_parent_gendercode,
    t_dim_provider_master.per_parent_gender_code_sdescr,
    t_dim_provider_master.per_ethnic_group_code_id,
    t_dim_provider_master.per_ethnic_groupcode,
    t_dim_provider_master.per_ethnic_group_code_sdescr,
    t_dim_provider_master.per_parent_ethnic_group_code_id,
    t_dim_provider_master.per_parent_ethnic_groupcode,
    t_dim_provider_master.per_parent_ethnic_group_code_sdescr,
    t_dim_provider_master.per_marital_status_code_id,
    t_dim_provider_master.per_marital_statuscode,
    t_dim_provider_master.per_marital_status_code_sdescr,
    t_dim_provider_master.per_parent_marital_status_code_id,
    t_dim_provider_master.per_parent_marital_statuscode,
    t_dim_provider_master.per_parent_marital_status_code_sdescr,
    t_dim_provider_master.per_race_code_id,
    t_dim_provider_master.per_racecode,
    t_dim_provider_master.per_race_code_sdescr,
    t_dim_provider_master.per_parent_race_code_id,
    t_dim_provider_master.per_parent_racecode,
    t_dim_provider_master.per_parent_race_code_sdescr,
    t_dim_provider_master.per_citizenship_code_id,
    t_dim_provider_master.per_citizenshipcode,
    t_dim_provider_master.per_citizenship_code_sdescr,
    t_dim_provider_master.per_parent_citizenship_code_id,
    t_dim_provider_master.per_parent_citizenshipcode,
    t_dim_provider_master.per_parent_citizenship_code_sdescr,
    t_dim_provider_master.per_religion_code_id,
    t_dim_provider_master.per_religioncode,
    t_dim_provider_master.per_religion_code_sdescr,
    t_dim_provider_master.per_parent_religion_code_id,
    t_dim_provider_master.per_parent_religioncode,
    t_dim_provider_master.per_parent_religion_code_sdescr,
    t_dim_provider_master.per_place_of_worship,
    t_dim_provider_master.per_mother_maiden_name,
    t_dim_provider_master.per_ambulatory_status_code_id,
    t_dim_provider_master.per_ambulatory_statuscode,
    t_dim_provider_master.per_ambulatory_status_code_sdescr,
    t_dim_provider_master.per_parent_ambulatory_status_code_id,
    t_dim_provider_master.per_parent_ambulatory_statuscode,
    t_dim_provider_master.per_parent_ambulatory_status_code_sdescr,
    t_dim_provider_master.per_english_fluency_code_id,
    t_dim_provider_master.per_english_fluency_code,
    t_dim_provider_master.per_english_fluency_code_sdescr,
    t_dim_provider_master.per_parent_english_fluency_code_id,
    t_dim_provider_master.per_parent_english_fluencycode,
    t_dim_provider_master.per_parent_english_fluency_code_sdescr,
    t_dim_provider_master.per_language_code_id,
    t_dim_provider_master.per_languagecode,
    t_dim_provider_master.per_language_code_sdescr,
    t_dim_provider_master.per_parent_language_code_id,
    t_dim_provider_master.per_parent_languagecode,
    t_dim_provider_master.per_parent_language_code_sdescr,
    t_dim_provider_master.per_intepreter_required_code_id,
    t_dim_provider_master.per_intepreter_requiredcode,
    t_dim_provider_master.per_intepreter_required_code_sdescr,
    t_dim_provider_master.per_parent_interpreter_required_code_id,
    t_dim_provider_master.per_parent_interpreter_requiredcode,
    t_dim_provider_master.per_parent_interpreter_required_code_sdescr,
    t_dim_provider_master.per_care_language_code_id,
    t_dim_provider_master.per_care_languagecode,
    t_dim_provider_master.per_care_language_code_sdescr,
    t_dim_provider_master.per_parent_care_language_code_id,
    t_dim_provider_master.per_parent_care_languagecode,
    t_dim_provider_master.per_parent_care_language_code_sdescr,
    t_dim_provider_master.per_written_language_code_id,
    t_dim_provider_master.per_written_languagecode,
    t_dim_provider_master.per_written_language_code_sdescr,
    t_dim_provider_master.per_parent_written_language_code_id,
    t_dim_provider_master.per_parent_written_languagecode,
    t_dim_provider_master.per_parent_written_language_code_sdescr,
    t_dim_provider_master.per_handicap_code_id,
    t_dim_provider_master.per_handicapcode,
    t_dim_provider_master.per_handicap_code_sdescr,
    t_dim_provider_master.per_parent_handicap_code_id,
    t_dim_provider_master.per_parent_handicapcode,
    t_dim_provider_master.per_parent_handicap_code_sdescr,
    t_dim_provider_master.per_hearing_impaired_code_id,
    t_dim_provider_master.per_hearing_impairedcode,
    t_dim_provider_master.per_hearing_impaired_code_sdescr,
    t_dim_provider_master.per_parent_hearing_impaired_code_id,
    t_dim_provider_master.per_parent_hearing_impairedcode,
    t_dim_provider_master.per_parent_hearing_impaired_code_sdescr,
    t_dim_provider_master.per_deaf_code_id,
    t_dim_provider_master.per_deafcode,
    t_dim_provider_master.per_deaf_code_sdescr,
    t_dim_provider_master.per_parent_deaf_code_id,
    t_dim_provider_master.per_parent_deafcode,
    t_dim_provider_master.per_parent_deaf_code_sdescr,
    t_dim_provider_master.per_visually_impaired_code_id,
    t_dim_provider_master.per_visually_impairedcode,
    t_dim_provider_master.per_visually_impaired_code_sdescr,
    t_dim_provider_master.per_parent_visually_impaired_code_id,
    t_dim_provider_master.per_parent_visually_impairedcode,
    t_dim_provider_master.per_parent_visually_impaired_code_sdescr,
    t_dim_provider_master.per_blind_code_id,
    t_dim_provider_master.per_blindcode,
    t_dim_provider_master.per_blind_code_sdescr,
    t_dim_provider_master.per_parent_blind_code_id,
    t_dim_provider_master.per_parent_blindcode,
    t_dim_provider_master.per_parent_blind_code_sdescr,
    t_dim_provider_master.per_mil_veteran_status_code_id,
    t_dim_provider_master.per_mil_veteran_statuscode,
    t_dim_provider_master.per_mil_veteran_status_code_sdescr,
    t_dim_provider_master.per_parent_mil_veteran_status_code_id,
    t_dim_provider_master.per_parent_mil_veteran_statuscode,
    t_dim_provider_master.per_parent_mil_veteran_status_code_sdescr,
    t_dim_provider_master.per_mil_pay_grade,
    t_dim_provider_master.per_mil_unit,
    t_dim_provider_master.per_mil_branch_code_id,
    t_dim_provider_master.per_mil_branchcode,
    t_dim_provider_master.per_mil_branch_code_sdescr,
    t_dim_provider_master.per_parent_mil_branch_code_id,
    t_dim_provider_master.per_parent_mil_branchcode,
    t_dim_provider_master.per_parent_mil_branch_code_sdescr,
    t_dim_provider_master.per_mil_category_code_id,
    t_dim_provider_master.per_mil_categorycode,
    t_dim_provider_master.per_mil_category_code_sdescr,
    t_dim_provider_master.per_parent_mil_category_code_id,
    t_dim_provider_master.per_parent_mil_categorycode,
    t_dim_provider_master.per_parent_mil_category_code_sdescr,
    t_dim_provider_master.per_mil_component_code_id,
    t_dim_provider_master.per_mil_componentcode,
    t_dim_provider_master.per_mil_component_code_sdescr,
    t_dim_provider_master.per_parent_mil_component_code_id,
    t_dim_provider_master.per_parent_mil_componentcode,
    t_dim_provider_master.per_parent_mil_component_code_sdescr,
    t_dim_provider_master.per_mil_rank_code_id,
    t_dim_provider_master.per_mil_rankcode,
    t_dim_provider_master.per_mil_rank_code_sdescr,
    t_dim_provider_master.per_parent_mil_rank_code_id,
    t_dim_provider_master.per_parent_mil_rankcode,
    t_dim_provider_master.per_parent_mil_rank_code_sdescr,
    t_dim_provider_master.per_address_line1,
    t_dim_provider_master.per_address_line2,
    t_dim_provider_master.per_address_line3,
    t_dim_provider_master.per_address_line4,
    t_dim_provider_master.per_city,
    t_dim_provider_master.per_state_province_code_id,
    t_dim_provider_master.per_state_provincecode,
    t_dim_provider_master.per_state_province_code_sdescr,
    t_dim_provider_master.per_parent_state_province_code_id,
    t_dim_provider_master.per_parent_state_provincecode,
    t_dim_provider_master.per_parent_state_province_code_sdescr,
    t_dim_provider_master.per_postalcode,
    t_dim_provider_master.per_country_code_id,
    t_dim_provider_master.per_countrycode,
    t_dim_provider_master.per_country_code_sdescr,
    t_dim_provider_master.per_parent_country_code_id,
    t_dim_provider_master.per_parent_countrycode,
    t_dim_provider_master.per_parent_country_code_sdescr,
    t_dim_provider_master.per_county_region_code_id,
    t_dim_provider_master.per_county_regioncode,
    t_dim_provider_master.per_county_region_code_sdescr,
    t_dim_provider_master.per_parent_county_region_code_id,
    t_dim_provider_master.per_parent_county_regioncode,
    t_dim_provider_master.per_parent_county_region_code_sdescr,
    t_dim_provider_master.per_address_usage_comment,
    t_dim_provider_master.per_full_name,
    t_dim_provider_master.per_prefix,
    t_dim_provider_master.per_first_name,
    t_dim_provider_master.per_middle_name,
    t_dim_provider_master.per_last_name,
    t_dim_provider_master.per_suffix,
    t_dim_provider_master.per_degree,
    t_dim_provider_master.per_title,
    t_dim_provider_master.per_ssn,
    t_dim_provider_master.per_mrn
   FROM t_dim_provider_master;
--\echo Creating view 'v_dim_patient'...
CREATE OR REPLACE VIEW v_dim_patient AS 
SELECT t_dim_patient_master.patient_m_id,
    t_dim_patient_master.patient_master_id,
    t_dim_patient_master.person_m_id,
    t_dim_patient_master.patient_type_code_id,
    t_dim_patient_master.patient_typecode,
    t_dim_patient_master.patient_type_code_sdescr,
    t_dim_patient_master.parent_patient_type_code_id,
    t_dim_patient_master.parent_patient_typecode,
    t_dim_patient_master.parent_patient_type_code_sdescr,
    t_dim_patient_master.identity_unknown_code_id,
    t_dim_patient_master.identity_unknowncode,
    t_dim_patient_master.identity_unknown_code_sdescr,
    t_dim_patient_master.parent_identity_unknown_code_id,
    t_dim_patient_master.parent_identity_unknowncode,
    t_dim_patient_master.parent_identity_unknown_code_sdescr,
    t_dim_patient_master.living_arrangement_code_id,
    t_dim_patient_master.living_arrangementcode,
    t_dim_patient_master.living_arrangement_code_sdescr,
    t_dim_patient_master.parent_living_arrangement_code_id,
    t_dim_patient_master.parent_living_arrangementcode,
    t_dim_patient_master.parent_living_arrangement_code_sdescr,
    t_dim_patient_master.living_dependancy_code_id,
    t_dim_patient_master.living_dependancycode,
    t_dim_patient_master.living_dependancy_code_sdescr,
    t_dim_patient_master.parent_living_dependancy_code_id,
    t_dim_patient_master.parent_living_dependancycode,
    t_dim_patient_master.parent_living_dependancy_code_sdescr,
    t_dim_patient_master.living_will_code_id,
    t_dim_patient_master.living_willcode,
    t_dim_patient_master.living_will_code_sdescr,
    t_dim_patient_master.parent_living_will_code_id,
    t_dim_patient_master.parent_living_willcode,
    t_dim_patient_master.parent_living_will_code_sdescr,
    t_dim_patient_master.occupation_code_id,
    t_dim_patient_master.occupationcode,
    t_dim_patient_master.occupation_code_sdescr,
    t_dim_patient_master.parent_occupation_code_id,
    t_dim_patient_master.parent_occupationcode,
    t_dim_patient_master.parent_occupation_code_sdescr,
    t_dim_patient_master.organ_donor_code_id,
    t_dim_patient_master.organ_donorcode,
    t_dim_patient_master.organ_donor_code_sdescr,
    t_dim_patient_master.parent_organ_donor_code_id,
    t_dim_patient_master.parent_organ_donorcode,
    t_dim_patient_master.parent_organ_donor_code_sdescr,
    t_dim_patient_master.family_group_identifier,
    t_dim_patient_master.living_will_date,
    t_dim_patient_master.multiple_birth_code_id,
    t_dim_patient_master.multiple_birthcode,
    t_dim_patient_master.multiple_birth_code_sdescr,
    t_dim_patient_master.parent_multiple_birth_code_id,
    t_dim_patient_master.parent_multiple_birthcode,
    t_dim_patient_master.parent_multiple_birth_code_sdescr,
    t_dim_patient_master.multiple_birth_total,
    t_dim_patient_master.birth_order,
    t_dim_patient_master.mychart_signedup_date,
    t_dim_patient_master.adopted_code_id,
    t_dim_patient_master.adoptedcode,
    t_dim_patient_master.adopted_code_sdescr,
    t_dim_patient_master.parent_adopted_code_id,
    t_dim_patient_master.bad_debt_code_id,
    t_dim_patient_master.bad_debtcode,
    t_dim_patient_master.bad_debt_code_sdescr,
    t_dim_patient_master.parent_bad_debt_code_id,
    t_dim_patient_master.disability_code_id,
    t_dim_patient_master.disabilitycode,
    t_dim_patient_master.disability_code_sdescr,
    t_dim_patient_master.parent_disability_code_id,
    t_dim_patient_master.parent_disabilitycode,
    t_dim_patient_master.parent_disability_code_sdescr,
    t_dim_patient_master.disease_alert_code_id,
    t_dim_patient_master.disease_alertcode,
    t_dim_patient_master.disease_alert_code_sdescr,
    t_dim_patient_master.parent_disease_alert_code_id,
    t_dim_patient_master.parent_disease_alertcode,
    t_dim_patient_master.parent_disease_alert_code_sdescr,
    t_dim_patient_master.drug_allergies_code_id,
    t_dim_patient_master.drug_allergies_alertcode,
    t_dim_patient_master.drug_allergies_alert_code_sdescr,
    t_dim_patient_master.parent_drug_allergies_code_id,
    t_dim_patient_master.parent_drug_allergiescode,
    t_dim_patient_master.parent_drug_allergies_code_sdescr,
    t_dim_patient_master.foster_child_code_id,
    t_dim_patient_master.foster_childcode,
    t_dim_patient_master.foster_child_code_sdescr,
    t_dim_patient_master.parent_foster_child_code_id,
    t_dim_patient_master.parent_foster_childcode,
    t_dim_patient_master.parent_foster_child_code_sdescr,
    t_dim_patient_master.edu_level_code_id,
    t_dim_patient_master.edu_levelcode,
    t_dim_patient_master.edu_level_code_sdescr,
    t_dim_patient_master.parent_edu_level_code_id,
    t_dim_patient_master.parent_edu_levelcode,
    t_dim_patient_master.parent_edu_level_code_sdescr,
    t_dim_patient_master.edu_student_code_id,
    t_dim_patient_master.edu_studentcode,
    t_dim_patient_master.edu_student_code_sdescr,
    t_dim_patient_master.parent_edu_student_code_id,
    t_dim_patient_master.parent_edu_studentcode,
    t_dim_patient_master.parent_edu_student_code_sdescr,
    t_dim_patient_master.edu_degree_complete,
    t_dim_patient_master.edu_attending_school,
    t_dim_patient_master.gyn_age_at_first_pregnancy,
    t_dim_patient_master.gyn_age_at_menarche,
    t_dim_patient_master.gyn_age_at_menopause,
    t_dim_patient_master.gyn_expected_deliv_date,
    t_dim_patient_master.gyn_expected_deliv_date_note,
    t_dim_patient_master.gyn_expected_deliv_entry_date,
    t_dim_patient_master.gyn_note,
    t_dim_patient_master.gyn_months_breastfeeding,
    t_dim_patient_master.hab_alcohol_ounces,
    t_dim_patient_master.hab_illicit_frequency,
    t_dim_patient_master.hab_smoking_quit_date,
    t_dim_patient_master.hab_smoking_start_date,
    t_dim_patient_master.hab_tobacco_pk_per_day,
    t_dim_patient_master.hab_tobacco_years,
    t_dim_patient_master.hab_alcohol_use_code_id,
    t_dim_patient_master.hab_alcohol_usecode,
    t_dim_patient_master.hab_alcohol_use_code_sdescr,
    t_dim_patient_master.parent_hab_alcohol_use_code_id,
    t_dim_patient_master.parent_hab_alcohol_usecode,
    t_dim_patient_master.parent_hab_alcohol_use_code_sdescr,
    t_dim_patient_master.hab_use_chew_code_id,
    t_dim_patient_master.hab_use_chewcode,
    t_dim_patient_master.hab_use_chew_code_sdescr,
    t_dim_patient_master.parent_hab_use_chew_code_id,
    t_dim_patient_master.parent_hab_use_chewcode,
    t_dim_patient_master.parent_hab_use_chew_code_sdescr,
    t_dim_patient_master.hab_cigar_use_code_id,
    t_dim_patient_master.hab_cigar_usecode,
    t_dim_patient_master.hab_cigar_use_code_sdescr,
    t_dim_patient_master.parent_hab_cigar_use_code_id,
    t_dim_patient_master.parent_hab_cigar_usecode,
    t_dim_patient_master.parent_hab_cigar_use_code_sdescr,
    t_dim_patient_master.hab_cigarette_use_code_id,
    t_dim_patient_master.hab_cigarette_usecode,
    t_dim_patient_master.hab_cigarette_use_code_sdescr,
    t_dim_patient_master.parent_hab_cigarette_use_code_id,
    t_dim_patient_master.parent_hab_cigarette_usecode,
    t_dim_patient_master.parent_hab_cigarette_use_code_sdescr,
    t_dim_patient_master.hab_iv_drug_use_code_id,
    t_dim_patient_master.hab_iv_drug_usecode,
    t_dim_patient_master.hab_iv_drug_use_code_sdescr,
    t_dim_patient_master.parent_hab_iv_drug_use_code_id,
    t_dim_patient_master.parent_hab_iv_drug_usecode,
    t_dim_patient_master.parent_hab_iv_drug_use_code_sdescr,
    t_dim_patient_master.hab_illicit_drug_use_code_id,
    t_dim_patient_master.hab_illicit_drug_usecode,
    t_dim_patient_master.hab_illicit_drug_use_code_sdescr,
    t_dim_patient_master.parent_hab_illicit_drug_use_code_id,
    t_dim_patient_master.parent_hab_illicit_drug_usecode,
    t_dim_patient_master.parent_hab_illicit_drug_use_code_sdescr,
    t_dim_patient_master.hab_pipe_use_code_id,
    t_dim_patient_master.hab_pipe_usecode,
    t_dim_patient_master.hab_pipe_use_code_sdescr,
    t_dim_patient_master.parent_hab_pipe_use_code_id,
    t_dim_patient_master.parent_hab_pipe_usecode,
    t_dim_patient_master.parent_hab_pipe_use_code_sdescr,
    t_dim_patient_master.hab_snuff_use_code_id,
    t_dim_patient_master.hab_snuff_usecode,
    t_dim_patient_master.hab_snuff_use_code_sdescr,
    t_dim_patient_master.parent_hab_snuff_use_code_id,
    t_dim_patient_master.parent_hab_snuff_usecode,
    t_dim_patient_master.parent_hab_snuff_use_code_sdescr,
    t_dim_patient_master.hab_tobacco_use_code_id,
    t_dim_patient_master.hab_tobacco_usecode,
    t_dim_patient_master.hab_tobacco_use_code_sdescr,
    t_dim_patient_master.parent_hab_tobacco_use_code_id,
    t_dim_patient_master.parent_hab_tobacco_usecode,
    t_dim_patient_master.parent_hab_tobacco_use_code_sdescr,
    t_dim_patient_master.pref_provider_gender_code_id,
    t_dim_patient_master.pref_provider_gendercode,
    t_dim_patient_master.pref_provider_gender_code_sdescr,
    t_dim_patient_master.parent_pref_provider_gender_code_id,
    t_dim_patient_master.parent_pref_provider_gendercode,
    t_dim_patient_master.parent_pref_provider_gender_code_sdescr,
    t_dim_patient_master.pref_provider_language_code_id,
    t_dim_patient_master.pref_provider_languagecode,
    t_dim_patient_master.pref_provider_language_code_sdescr,
    t_dim_patient_master.parent_pref_provider_language_code_id,
    t_dim_patient_master.parent_pref_provider_languagecode,
    t_dim_patient_master.parent_pref_provider_language_code_sdescr,
    t_dim_patient_master.pref_provider_speciality_code_id,
    t_dim_patient_master.pref_provider_specialitycode,
    t_dim_patient_master.pref_provider_speciality_code_sdescr,
    t_dim_patient_master.parent_pref_provider_speciality_code_id,
    t_dim_patient_master.parent_pref_provider_specialitycode,
    t_dim_patient_master.parent_pref_provider_speciality_code_sdescr,
    t_dim_patient_master.per_protection_code_id,
    t_dim_patient_master.per_protectioncode,
    t_dim_patient_master.per_protection_code_sdescr,
    t_dim_patient_master.per_parent_protection_code_id,
    t_dim_patient_master.per_parent_protectioncode,
    t_dim_patient_master.per_parent_protection_code_sdescr,
    t_dim_patient_master.per_publicity_code_id,
    t_dim_patient_master.per_publicitycode,
    t_dim_patient_master.per_publicity_code_sdescr,
    t_dim_patient_master.per_parent_publicity_code_id,
    t_dim_patient_master.per_parent_publicitycode,
    t_dim_patient_master.per_parent_publicity_code_sdescr,
    t_dim_patient_master.per_birth_date,
    t_dim_patient_master.per_deceased_code_id,
    t_dim_patient_master.per_deceasedcode,
    t_dim_patient_master.per_deceased_code_sdescr,
    t_dim_patient_master.per_parent_deceased_code_id,
    t_dim_patient_master.per_parent_deceasedcode,
    t_dim_patient_master.per_parent_deceased_code_sdescr,
    t_dim_patient_master.per_death_date,
    t_dim_patient_master.per_cause_of_death,
    t_dim_patient_master.per_gender_code_id,
    t_dim_patient_master.per_gendercode,
    t_dim_patient_master.per_gender_code_sdescr,
    t_dim_patient_master.per_parent_gender_code_id,
    t_dim_patient_master.per_parent_gendercode,
    t_dim_patient_master.per_parent_gender_code_sdescr,
    t_dim_patient_master.per_ethnic_group_code_id,
    t_dim_patient_master.per_ethnic_groupcode,
    t_dim_patient_master.per_ethnic_group_code_sdescr,
    t_dim_patient_master.per_parent_ethnic_group_code_id,
    t_dim_patient_master.per_parent_ethnic_groupcode,
    t_dim_patient_master.per_parent_ethnic_group_code_sdescr,
    t_dim_patient_master.per_marital_status_code_id,
    t_dim_patient_master.per_marital_statuscode,
    t_dim_patient_master.per_marital_status_code_sdescr,
    t_dim_patient_master.per_parent_marital_status_code_id,
    t_dim_patient_master.per_parent_marital_statuscode,
    t_dim_patient_master.per_parent_marital_status_code_sdescr,
    t_dim_patient_master.per_race_code_id,
    t_dim_patient_master.per_racecode,
    t_dim_patient_master.per_race_code_sdescr,
    t_dim_patient_master.per_parent_race_code_id,
    t_dim_patient_master.per_parent_racecode,
    t_dim_patient_master.per_parent_race_code_sdescr,
    t_dim_patient_master.per_citizenship_code_id,
    t_dim_patient_master.per_citizenshipcode,
    t_dim_patient_master.per_citizenship_code_sdescr,
    t_dim_patient_master.per_parent_citizenship_code_id,
    t_dim_patient_master.per_parent_citizenshipcode,
    t_dim_patient_master.per_parent_citizenship_code_sdescr,
    t_dim_patient_master.per_religion_code_id,
    t_dim_patient_master.per_religioncode,
    t_dim_patient_master.per_religion_code_sdescr,
    t_dim_patient_master.per_parent_religion_code_id,
    t_dim_patient_master.per_parent_religioncode,
    t_dim_patient_master.per_parent_religion_code_sdescr,
    t_dim_patient_master.per_place_of_worship,
    t_dim_patient_master.per_mother_maiden_name,
    t_dim_patient_master.per_ambulatory_status_code_id,
    t_dim_patient_master.per_ambulatory_statuscode,
    t_dim_patient_master.per_ambulatory_status_code_sdescr,
    t_dim_patient_master.per_parent_ambulatory_status_code_id,
    t_dim_patient_master.per_parent_ambulatory_statuscode,
    t_dim_patient_master.per_parent_ambulatory_status_code_sdescr,
    t_dim_patient_master.per_english_fluency_code_id,
    t_dim_patient_master.per_english_fluency_code,
    t_dim_patient_master.per_english_fluency_code_sdescr,
    t_dim_patient_master.per_parent_english_fluency_code_id,
    t_dim_patient_master.per_parent_english_fluencycode,
    t_dim_patient_master.per_parent_english_fluency_code_sdescr,
    t_dim_patient_master.per_language_code_id,
    t_dim_patient_master.per_languagecode,
    t_dim_patient_master.per_language_code_sdescr,
    t_dim_patient_master.per_parent_language_code_id,
    t_dim_patient_master.per_parent_languagecode,
    t_dim_patient_master.per_parent_language_code_sdescr,
    t_dim_patient_master.per_intepreter_required_code_id,
    t_dim_patient_master.per_intepreter_requiredcode,
    t_dim_patient_master.per_intepreter_required_code_sdescr,
    t_dim_patient_master.per_parent_interpreter_required_code_id,
    t_dim_patient_master.per_parent_interpreter_requiredcode,
    t_dim_patient_master.per_parent_interpreter_required_code_sdescr,
    t_dim_patient_master.per_care_language_code_id,
    t_dim_patient_master.per_care_languagecode,
    t_dim_patient_master.per_care_language_code_sdescr,
    t_dim_patient_master.per_parent_care_language_code_id,
    t_dim_patient_master.per_parent_care_languagecode,
    t_dim_patient_master.per_parent_care_language_code_sdescr,
    t_dim_patient_master.per_written_language_code_id,
    t_dim_patient_master.per_written_languagecode,
    t_dim_patient_master.per_written_language_code_sdescr,
    t_dim_patient_master.per_parent_written_language_code_id,
    t_dim_patient_master.per_parent_written_languagecode,
    t_dim_patient_master.per_parent_written_language_code_sdescr,
    t_dim_patient_master.per_handicap_code_id,
    t_dim_patient_master.per_handicapcode,
    t_dim_patient_master.per_handicap_code_sdescr,
    t_dim_patient_master.per_parent_handicap_code_id,
    t_dim_patient_master.per_parent_handicapcode,
    t_dim_patient_master.per_parent_handicap_code_sdescr,
    t_dim_patient_master.per_hearing_impaired_code_id,
    t_dim_patient_master.per_hearing_impairedcode,
    t_dim_patient_master.per_hearing_impaired_code_sdescr,
    t_dim_patient_master.per_parent_hearing_impaired_code_id,
    t_dim_patient_master.per_parent_hearing_impairedcode,
    t_dim_patient_master.per_parent_hearing_impaired_code_sdescr,
    t_dim_patient_master.per_deaf_code_id,
    t_dim_patient_master.per_deafcode,
    t_dim_patient_master.per_deaf_code_sdescr,
    t_dim_patient_master.per_parent_deaf_code_id,
    t_dim_patient_master.per_parent_deafcode,
    t_dim_patient_master.per_parent_deaf_code_sdescr,
    t_dim_patient_master.per_visually_impaired_code_id,
    t_dim_patient_master.per_visually_impairedcode,
    t_dim_patient_master.per_visually_impaired_code_sdescr,
    t_dim_patient_master.per_parent_visually_impaired_code_id,
    t_dim_patient_master.per_parent_visually_impairedcode,
    t_dim_patient_master.per_parent_visually_impaired_code_sdescr,
    t_dim_patient_master.per_blind_code_id,
    t_dim_patient_master.per_blindcode,
    t_dim_patient_master.per_blind_code_sdescr,
    t_dim_patient_master.per_parent_blind_code_id,
    t_dim_patient_master.per_parent_blindcode,
    t_dim_patient_master.per_parent_blind_code_sdescr,
    t_dim_patient_master.per_mil_veteran_status_code_id,
    t_dim_patient_master.per_mil_veteran_statuscode,
    t_dim_patient_master.per_mil_veteran_status_code_sdescr,
    t_dim_patient_master.per_parent_mil_veteran_status_code_id,
    t_dim_patient_master.per_parent_mil_veteran_statuscode,
    t_dim_patient_master.per_parent_mil_veteran_status_code_sdescr,
    t_dim_patient_master.per_mil_pay_grade,
    t_dim_patient_master.per_mil_unit,
    t_dim_patient_master.per_mil_branch_code_id,
    t_dim_patient_master.per_mil_branchcode,
    t_dim_patient_master.per_mil_branch_code_sdescr,
    t_dim_patient_master.per_parent_mil_branch_code_id,
    t_dim_patient_master.per_parent_mil_branchcode,
    t_dim_patient_master.per_parent_mil_branch_code_sdescr,
    t_dim_patient_master.per_mil_category_code_id,
    t_dim_patient_master.per_mil_categorycode,
    t_dim_patient_master.per_mil_category_code_sdescr,
    t_dim_patient_master.per_parent_mil_category_code_id,
    t_dim_patient_master.per_parent_mil_categorycode,
    t_dim_patient_master.per_parent_mil_category_code_sdescr,
    t_dim_patient_master.per_mil_component_code_id,
    t_dim_patient_master.per_mil_componentcode,
    t_dim_patient_master.per_mil_component_code_sdescr,
    t_dim_patient_master.per_parent_mil_component_code_id,
    t_dim_patient_master.per_parent_mil_componentcode,
    t_dim_patient_master.per_parent_mil_component_code_sdescr,
    t_dim_patient_master.per_mil_rank_code_id,
    t_dim_patient_master.per_mil_rankcode,
    t_dim_patient_master.per_mil_rank_code_sdescr,
    t_dim_patient_master.per_parent_mil_rank_code_id,
    t_dim_patient_master.per_parent_mil_rankcode,
    t_dim_patient_master.per_parent_mil_rank_code_sdescr,
    t_dim_patient_master.per_address_line1,
    t_dim_patient_master.per_address_line2,
    t_dim_patient_master.per_address_line3,
    t_dim_patient_master.per_address_line4,
    t_dim_patient_master.per_city,
    t_dim_patient_master.per_state_province_code_id,
    t_dim_patient_master.per_state_provincecode,
    t_dim_patient_master.per_state_province_code_sdescr,
    t_dim_patient_master.per_parent_state_province_code_id,
    t_dim_patient_master.per_parent_state_provincecode,
    t_dim_patient_master.per_parent_state_province_code_sdescr,
    t_dim_patient_master.per_postalcode,
    t_dim_patient_master.per_country_code_id,
    t_dim_patient_master.per_countrycode,
    t_dim_patient_master.per_country_code_sdescr,
    t_dim_patient_master.per_parent_country_code_id,
    t_dim_patient_master.per_parent_countrycode,
    t_dim_patient_master.per_parent_country_code_sdescr,
    t_dim_patient_master.per_county_region_code_id,
    t_dim_patient_master.per_county_regioncode,
    t_dim_patient_master.per_county_region_code_sdescr,
    t_dim_patient_master.per_parent_county_region_code_id,
    t_dim_patient_master.per_parent_county_regioncode,
    t_dim_patient_master.per_parent_county_region_code_sdescr,
    t_dim_patient_master.per_address_usage_comment,
    t_dim_patient_master.per_full_name,
    t_dim_patient_master.per_prefix,
    t_dim_patient_master.per_first_name,
    t_dim_patient_master.per_middle_name,
    t_dim_patient_master.per_last_name,
    t_dim_patient_master.per_suffix,
    t_dim_patient_master.per_degree,
    t_dim_patient_master.per_title
   FROM t_dim_patient_master;
--\echo Creating view 'v_dim_organization'...
CREATE OR REPLACE VIEW v_dim_organization AS 
SELECT t_dim_organization_master.organization_m_id,
    t_dim_organization_master.organization_type_code_id,
    t_dim_organization_master.organization_type_code,
    t_dim_organization_master.organization_type_descr,
    t_dim_organization_master.parent_organization_type_code_id,
    t_dim_organization_master.parent_organization_type_code,
    t_dim_organization_master.parent_organization_type_descr,
    t_dim_organization_master.l4_organization_unit_m_id,
    t_dim_organization_master.l4_organization_unit_descr,
    t_dim_organization_master.l4_type_code_id,
    t_dim_organization_master.l4_type_code,
    t_dim_organization_master.l3_organization_unit_m_id,
    t_dim_organization_master.l3_organization_unit_descr,
    t_dim_organization_master.l3_type_code_id,
    t_dim_organization_master.l3_type_code,
    t_dim_organization_master.l2_organization_unit_m_id,
    t_dim_organization_master.l2_organization_unit_descr,
    t_dim_organization_master.l2_type_code_id,
    t_dim_organization_master.l2_type_code,
    t_dim_organization_master.l1_organization_unit_m_id,
    t_dim_organization_master.l1_organization_unit_descr,
    t_dim_organization_master.l1_type_code_id,
    t_dim_organization_master.l1_type_code,
    t_dim_organization_master.l0_organization_unit_m_id,
    t_dim_organization_master.l0_organization_unit_descr,
    t_dim_organization_master.l0_type_code_id,
    t_dim_organization_master.l0_type_code
   FROM t_dim_organization_master;
--\echo Creating view 'v_dim_date'...
CREATE OR REPLACE VIEW v_dim_date AS 
SELECT t_dim_date.calendar_date,
    t_dim_date.calendar_date_nbr,
    t_dim_date.calendar_yr_month_nbr,
    t_dim_date.day_of_week_nbr,
    t_dim_date.day_of_week_full_name,
    t_dim_date.day_of_week_short_name,
    t_dim_date.calendar_week,
    t_dim_date.calendar_month,
    t_dim_date.calendar_month_full_name,
    t_dim_date.calendar_month_short_name,
    t_dim_date.calendar_yr_qtr_nbr,
    t_dim_date.calendar_qtr_nbr,
    t_dim_date.calendar_qtr_text,
    t_dim_date.calendar_yr,
    t_dim_date.calendar_qtr_text_short,
    t_dim_date.calendar_qtr_text_long,
    t_dim_date.fiscal_week,
    t_dim_date.fiscal_month,
    t_dim_date.fiscal_yr_qtr_nbr,
    t_dim_date.fiscal_qtr_nbr,
    t_dim_date.fiscal_qtr_text,
    t_dim_date.fiscal_yr,
    t_dim_date.fiscal_qtr_text_short,
    t_dim_date.fiscal_qtr_text_long,
    t_dim_date.holiday_flag,
    t_dim_date.weekday_flag,
    t_dim_date.weekend_flag,
    t_dim_date.season,
    t_dim_date.national_event,
    t_dim_date.days_in_month
   FROM t_dim_date;
--\echo Creating view 'v_dim_codeset_lookup'...
CREATE OR REPLACE VIEW v_dim_codeset_lookup AS 
SELECT t_dim_codeset.source_code_id,
    t_dim_codeset.source_name,
    t_dim_codeset.source_instance_id,
    t_dim_codeset.source_code,
    t_dim_codeset.descr,
    t_dim_codeset.short_descr,
    t_dim_codeset.source_code_set_id,
    t_dim_codeset.source_code_set_name,
    t_dim_codeset.parent_code_id,
    t_dim_codeset.parent_source_name,
    t_dim_codeset.parent_source_instance_id,
    t_dim_codeset.parent_source_code,
    t_dim_codeset.parent_descr,
    t_dim_codeset.parent_short_descr,
    t_dim_codeset.parent_source_code_set_id,
    t_dim_codeset.parent_source_code_set_name
   FROM t_dim_codeset;
--\echo Creating view 'v_appointment'...
CREATE OR REPLACE VIEW v_appointment AS 
SELECT t_appointment.appointment_id,
    t_appointment.appointment_number,
    t_appointment.patient_m_id,
    t_appointment.patient_id,
    t_appointment.provider_m_id,
    t_appointment.provider_id,
    t_appointment.facility_location_id,
    t_appointment.language_interpreter_code_id,
    t_appointment.language_interpreter_code,
    t_appointment.parent_language_interpreter_code_id,
    t_appointment.parent_language_interpreter_code,
    t_appointment.shadow_provider_id,
    t_appointment.referral_source_id,
    t_appointment.visit_type_code_id,
    t_appointment.visit_type_code,
    t_appointment.parent_visit_type_code_id,
    t_appointment.parent_visit_type_code,
    t_appointment.block_category_code_id,
    t_appointment.block_category_code,
    t_appointment.parent_block_category_code_id,
    t_appointment.parent_block_category_code,
    t_appointment.number_of_calls,
    t_appointment.number_of_changes,
    t_appointment.change_reason_code_id,
    t_appointment.change_reason_code,
    t_appointment.parent_change_reason_code_id,
    t_appointment.parent_change_reason_code,
    t_appointment.appointment_status_code_id,
    t_appointment.appointment_status_code,
    t_appointment.parent_appointment_status_code_id,
    t_appointment.parent_appointment_status_code,
    t_appointment.automated_reminder_status_code_id,
    t_appointment.automated_reminder_status_code,
    t_appointment.parent_automated_reminder_status_code_id,
    t_appointment.parent_automated_reminder_status_code,
    t_appointment.confirmation_status_code_id,
    t_appointment.confirmation_status_code,
    t_appointment.parent_confirmation_status_code_id,
    t_appointment.parent_confirmation_status_code,
    t_appointment.cancellation_reason_code_id,
    t_appointment.cancellation_reason_code,
    t_appointment.parent_cancellation_reason_code_id,
    t_appointment.parent_cancellation_reason_code,
    t_appointment.rescheduled_appointment_id,
    t_appointment.appointment_length,
    t_appointment.appointment_start_date_time,
    t_appointment.appointment_start_time,
    t_appointment.appointment_start_date,
    t_appointment.appointment_end_date_time,
    t_appointment.appointment_end_time,
    t_appointment.appointment_end_date,
    t_appointment.scheduled_from_kiosk,
    t_appointment.confirmed_date_time,
    t_appointment.confirmed_time,
    t_appointment.confirmed_date,
    t_appointment.cancelled_date_time,
    t_appointment.cancelled_time,
    t_appointment.cancelled_date,
    t_appointment.sign_in_date_time,
    t_appointment.sign_in_time,
    t_appointment.sign_in_date,
    t_appointment.initial_check_in_date_time,
    t_appointment.initial_check_in_time,
    t_appointment.initial_check_in_date,
    t_appointment.check_in_kiosk,
    t_appointment.check_in_date_time,
    t_appointment.check_in_time,
    t_appointment.check_in_date,
    t_appointment.arrival_list_removal_date_time,
    t_appointment.arrival_list_removal_time,
    t_appointment.arrival_list_removal_date,
    t_appointment.paged_date_time,
    t_appointment.paged_time,
    t_appointment.paged_date,
    t_appointment.room_assigned_date_time,
    t_appointment.room_assigned_time,
    t_appointment.room_assigned_date,
    t_appointment.roomed_date_time,
    t_appointment.roomed_time,
    t_appointment.roomed_date,
    t_appointment.nurse_left_room_date_time,
    t_appointment.nurse_left_room_time,
    t_appointment.nurse_left_room_date,
    t_appointment.provider_entered_room_date_time,
    t_appointment.provider_entered_room_time,
    t_appointment.provider_entered_room_date,
    t_appointment.check_out_kiosk,
    t_appointment.check_out_date_time,
    t_appointment.check_out_time,
    t_appointment.check_out_date,
    t_appointment.referral_code_id,
    t_appointment.referral_code,
    t_appointment.parent_referral_code_id,
    t_appointment.parent_referral_code,
    t_appointment.overbook_code_id,
    t_appointment.overbook_code,
    t_appointment.parent_overbook_code_id,
    t_appointment.parent_overbook_code,
    t_appointment.override_code_id,
    t_appointment.override_code,
    t_appointment.parent_override_code_id,
    t_appointment.parent_override_code,
    t_appointment.time_unavailable_code_id,
    t_appointment.time_unavailable_code,
    t_appointment.parent_time_unavailable_code_id,
    t_appointment.parent_time_unavailable_code,
    t_appointment.walk_in_code_id,
    t_appointment.walk_in_code,
    t_appointment.parent_walk_in_code_id,
    t_appointment.parent_walk_in_code,
    t_appointment.sequential_appointment_code_id,
    t_appointment.sequential_appointment_code,
    t_appointment.parent_sequential_appointment_code_id,
    t_appointment.parent_sequential_appointment_code,
    t_appointment.warning_overridden_code_id,
    t_appointment.warning_overridden_code,
    t_appointment.parent_warning_overridden_code_id,
    t_appointment.parent_warning_overridden_code,
    t_appointment.same_day_code_id,
    t_appointment.same_day_code,
    t_appointment.parent_same_day_code_id,
    t_appointment.parent_same_day_code,
    t_appointment.joint_appointment_code_id,
    t_appointment.joint_appointment_code,
    t_appointment.parent_joint_appointment_code_id,
    t_appointment.parent_joint_appointment_code,
    t_appointment.cancelled_sameday_code_id,
    t_appointment.cancelled_sameday_code,
    t_appointment.parent_cancelled_sameday_code_id,
    t_appointment.parent_cancelled_sameday_code
   FROM t_appointment;
--\echo Creating view 'v_dim_time'...
CREATE OR REPLACE VIEW v_dim_time AS 
SELECT t_dim_time.time_of_day,
    t_dim_time.am_pm,
    t_dim_time.hour_24,
    t_dim_time.hour_12,
    t_dim_time.shift_nbr,
    t_dim_time.shift_name
   FROM t_dim_time;
--\echo Creating view 'v_encounter'...
CREATE OR REPLACE VIEW v_encounter AS 
SELECT t_encounter.encounter_id,
    t_encounter.source_name,
    t_encounter.encounter_number,
    t_encounter.encounter_type_code_id,
    t_encounter.encounter_type_code,
    t_encounter.encounter_type_code_sdescr,
    t_encounter.parent_encounter_type_code_id,
    t_encounter.parent_encounter_type_code,
    t_encounter.parent_encounter_type_code_sdescr,
    t_encounter.encounter_sub_type_code_id,
    t_encounter.encounter_sub_type_code,
    t_encounter.encounter_sub_type_code_sdescr,
    t_encounter.parent_encounter_sub_type_code_id,
    t_encounter.parent_encounter_sub_type_code,
    t_encounter.parent_encounter_sub_type_code_sdescr,
    t_encounter.description,
    t_encounter.episode_id,
    t_encounter.facility_id,
    t_encounter.facility_m_id,
    t_encounter.patient_m_id,
    t_encounter.patient_id,
    t_encounter.l0_organization_unit_m_id,
    t_encounter.service_line_id,
    t_encounter.patient_class_code_id,
    t_encounter.patient_class_code,
    t_encounter.patient_class_code_sdescr,
    t_encounter.parent_patient_class_code_id,
    t_encounter.parent_patient_class_code,
    t_encounter.parent_patient_class_code_sdescr,
    t_encounter.patient_type_code_id,
    t_encounter.patient_type_code,
    t_encounter.patient_type_code_sdescr,
    t_encounter.parent_patient_type_code_id,
    t_encounter.parent_patient_type_code,
    t_encounter.parent_patient_type_code_sdescr,
    t_encounter.patient_condition_code_id,
    t_encounter.patient_condition_code,
    t_encounter.patient_condition_code_sdescr,
    t_encounter.parent_patient_condition_code_id,
    t_encounter.parent_patient_condition_code,
    t_encounter.parent_patient_condition_code_sdescr,
    t_encounter.employment_related_indicator,
    t_encounter.hospital_service_code_id,
    t_encounter.hospital_service_code,
    t_encounter.hospital_service_code_sdescr,
    t_encounter.parent_hospital_service_code_id,
    t_encounter.parent_hospital_service_code,
    t_encounter.parent_hospital_service_code_sdescr,
    t_encounter.recurring_service_code_id,
    t_encounter.recurring_service_code,
    t_encounter.recurring_service_code_sdescr,
    t_encounter.parent_recurring_service_code_id,
    t_encounter.parent_recurring_service_code,
    t_encounter.parent_recurring_service_code_sdescr,
    t_encounter.encounter_user_code_id,
    t_encounter.encounter_user_code,
    t_encounter.encounter_user_code_sdescr,
    t_encounter.parent_encounter_user_code_id,
    t_encounter.parent_encounter_user_code,
    t_encounter.parent_encounter_user_code_sdescr,
    t_encounter.special_program_code_id,
    t_encounter.special_program_code,
    t_encounter.special_program_code_sdescr,
    t_encounter.parent_special_program_code_id,
    t_encounter.parent_special_program_code,
    t_encounter.parent_special_program_code_sdescr,
    t_encounter.admission_level_of_care_code_id,
    t_encounter.admission_level_of_care_code,
    t_encounter.admission_level_of_care_code_sdescr,
    t_encounter.parent_admission_level_of_care_code_id,
    t_encounter.parent_admission_level_of_care_code,
    t_encounter.parent_admission_level_of_care_code_sdescr,
    t_encounter.arrival_date_time,
    t_encounter.arrival_time,
    t_encounter.arrival_date,
    t_encounter.mode_of_arrival_code_id,
    t_encounter.mode_of_arrival_code,
    t_encounter.mode_of_arrival_code_sdescr,
    t_encounter.parent_mode_of_arrival_code_id,
    t_encounter.parent_mode_of_arrival_code,
    t_encounter.parent_mode_of_arrival_code_sdescr,
    t_encounter.departure_date_time,
    t_encounter.departure_time,
    t_encounter.departure_date,
    t_encounter.length_of_stay,
    t_encounter.triage_severity_code_id,
    t_encounter.triage_severity_code,
    t_encounter.triage_severity_code_sdescr,
    t_encounter.parent_triage_severity_code_id,
    t_encounter.parent_triage_severity_code,
    t_encounter.parent_triage_severity_code_sdescr,
    t_encounter.triage_start_date_time,
    t_encounter.triage_start_time,
    t_encounter.triage_start_date,
    t_encounter.triage_end_date_time,
    t_encounter.triage_end_time,
    t_encounter.triage_end_date,
    t_encounter.major_diagnostic_category_code_id,
    t_encounter.major_diagnostic_category_code,
    t_encounter.major_diagnostic_category_code_sdescr,
    t_encounter.parent_major_diagnostic_category_code_id,
    t_encounter.parent_major_diagnostic_category_code,
    t_encounter.parent_major_diagnostic_category_code_sdescr,
    t_encounter.diagnosis_related_group_code_id,
    t_encounter.diagnosis_related_group_code,
    t_encounter.diagnosis_related_group_code_sdescr,
    t_encounter.parent_diagnosis_related_group_code_id,
    t_encounter.parent_diagnosis_related_group_code,
    t_encounter.parent_diagnosis_related_group_code_sdescr,
    t_encounter.risk_of_mortality_code_id,
    t_encounter.risk_of_mortality_code,
    t_encounter.risk_of_mortality_code_sdescr,
    t_encounter.parent_risk_of_mortality_code_id,
    t_encounter.parent_risk_of_mortality_code,
    t_encounter.parent_risk_of_mortality_code_sdescr,
    t_encounter.severity_of_illness_code_id,
    t_encounter.severity_of_illness_code,
    t_encounter.severity_of_illness_code_sdescr,
    t_encounter.parent_severity_of_illness_code_id,
    t_encounter.parent_severity_of_illness_code,
    t_encounter.parent_severity_of_illness_code_sdescr,
    t_encounter.diet_restriction_code_id,
    t_encounter.diet_restriction_code,
    t_encounter.diet_restriction_code_sdescr,
    t_encounter.parent_diet_restriction_code_id,
    t_encounter.parent_diet_restriction_code,
    t_encounter.parent_diet_restriction_code_sdescr,
    t_encounter.courtesy_code_id,
    t_encounter.courtesy_code,
    t_encounter.courtesy_code_sdescr,
    t_encounter.parent_courtesy_code_id,
    t_encounter.parent_courtesy_code,
    t_encounter.parent_courtesy_code_sdescr,
    t_encounter.patient_importance_code_id,
    t_encounter.patient_importance_code,
    t_encounter.patient_importance_code_sdescr,
    t_encounter.parent_patient_importance_code_id,
    t_encounter.parent_patient_importance_code,
    t_encounter.parent_patient_importance_code_sdescr,
    t_encounter.accommodation_code_id,
    t_encounter.accommodation_code,
    t_encounter.accommodation_code_sdescr,
    t_encounter.parent_accommodation_code_id,
    t_encounter.parent_accommodation_code,
    t_encounter.parent_accommodation_code_sdescr,
    t_encounter.publicity_code_id,
    t_encounter.publicity_code,
    t_encounter.publicity_code_sdescr,
    t_encounter.parent_publicity_code_id,
    t_encounter.parent_publicity_code,
    t_encounter.parent_publicity_code_sdescr,
    t_encounter.priority_code_id,
    t_encounter.priority_code,
    t_encounter.priority_code_sdescr,
    t_encounter.parent_priority_code_id,
    t_encounter.parent_priority_code,
    t_encounter.parent_priority_code_sdescr,
    t_encounter.precaution_code_id,
    t_encounter.precaution_code,
    t_encounter.precaution_code_sdescr,
    t_encounter.parent_precaution_code_id,
    t_encounter.parent_precaution_code,
    t_encounter.parent_precaution_code_sdescr,
    t_encounter.notify_clergy_code_id,
    t_encounter.notify_clergy_code,
    t_encounter.notify_clergy_code_sdescr,
    t_encounter.parent_notify_clergy_code_id,
    t_encounter.parent_notify_clergy_code,
    t_encounter.parent_notify_clergy_code_sdescr,
    t_encounter.gender,
    t_encounter.race,
    t_encounter.age,
    t_encounter.age_units_code_id,
    t_encounter.age_units_code,
    t_encounter.age_units_code_sdescr,
    t_encounter.parent_age_units_code_id,
    t_encounter.parent_age_units_code,
    t_encounter.parent_age_units_code_sdescr,
    t_encounter.ambulatory_status,
    t_encounter.organ_donor,
    t_encounter.living_will,
    t_encounter.living_will_date,
    t_encounter.advance_directive_code_id,
    t_encounter.advance_directive_code,
    t_encounter.advance_directive_code_sdescr,
    t_encounter.parent_advance_directive_code_id,
    t_encounter.parent_advance_directive_code,
    t_encounter.parent_advance_directive_code_sdescr,
    t_encounter.adv_dir_last_verif_date_time,
    t_encounter.adv_dir_last_verif_time,
    t_encounter.adv_dir_last_verif_date,
    t_encounter.admission_event_ind,
    t_encounter.death_event_ind,
    t_encounter.diagnosis_event_ind,
    t_encounter.discharge_event_ind,
    t_encounter.movement_event_ind,
    t_encounter.observation_event_ind,
    t_encounter.procedure_event_ind,
    t_encounter.transfer_event_ind,
    t_encounter.diagnostic_test_order_event_ind,
    t_encounter.diet_order_event_ind,
    t_encounter.med_supply_order_event_ind,
    t_encounter.pharma_prescr_order_event_ind,
    t_encounter.procedure_order_event_ind,
    t_encounter.referral_order_event_ind,
    t_encounter.transfusion_order_event_ind
   FROM t_encounter;
--\echo Creating view 'v_specimen'...
CREATE OR REPLACE VIEW v_specimen AS 
SELECT t_specimen.clinical_event_id,
    t_specimen.specimen_id,
    t_specimen.specimen_number,
    t_specimen.type_code_id,
    t_specimen.type_code,
    t_specimen.parent_type_code_id,
    t_specimen.parent_type_code,
    t_specimen.type_modifier_code_id,
    t_specimen.type_modifier_code,
    t_specimen.parent_type_modifier_code_id,
    t_specimen.parent_type_modifier_code,
    t_specimen.collection_method_code_id,
    t_specimen.collection_method_code,
    t_specimen.parent_collection_method_code_id,
    t_specimen.parent_collection_method_code,
    t_specimen.source_body_site_code_id,
    t_specimen.source_body_site_code,
    t_specimen.parent_source_body_site_code_id,
    t_specimen.parent_source_body_site_code,
    t_specimen.source_body_site_modifier_code_id,
    t_specimen.source_body_site_modifier_code,
    t_specimen.parent_source_body_site_modifier_code_id,
    t_specimen.parent_source_body_site_modifier_code,
    t_specimen.collection_body_site_code_id,
    t_specimen.collection_body_site_code,
    t_specimen.parent_collection_body_site_code_id,
    t_specimen.parent_collection_body_site_code,
    t_specimen.role_code_id,
    t_specimen.role_code,
    t_specimen.parent_role_code_id,
    t_specimen.parent_role_code,
    t_specimen.collection_amount,
    t_specimen.collection_amount_uom_code_id,
    t_specimen.collection_amount_uom_code,
    t_specimen.parent_collection_amount_uom_code_id,
    t_specimen.parent_collection_amount_uom_code,
    t_specimen.grouped_specimen_count,
    t_specimen.description,
    t_specimen.handling_code_id,
    t_specimen.handling_code,
    t_specimen.parent_handling_code_id,
    t_specimen.parent_handling_code,
    t_specimen.risk_code_id,
    t_specimen.risk_code,
    t_specimen.parent_risk_code_id,
    t_specimen.parent_risk_code,
    t_specimen.collection_date_time,
    t_specimen.collection_time,
    t_specimen.collection_date,
    t_specimen.received_date_time,
    t_specimen.received_time,
    t_specimen.received_date,
    t_specimen.expiration_date_time,
    t_specimen.expiration_time,
    t_specimen.expiration_date,
    t_specimen.availability_indicator_code_id,
    t_specimen.availability_indicator_code,
    t_specimen.parent_availability_indicator_code_id,
    t_specimen.parent_availability_indicator_code,
    t_specimen.reject_reason_code_id,
    t_specimen.reject_reason_code,
    t_specimen.parent_reject_reason_code_id,
    t_specimen.parent_reject_reason_code,
    t_specimen.quality_code_id,
    t_specimen.quality_code,
    t_specimen.parent_quality_code_id,
    t_specimen.parent_quality_code,
    t_specimen.appropriateness_code_id,
    t_specimen.appropriateness_code,
    t_specimen.parent_appropriateness_code_id,
    t_specimen.parent_appropriateness_code,
    t_specimen.condition_code_id,
    t_specimen.condition_code,
    t_specimen.parent_condition_code_id,
    t_specimen.parent_condition_code,
    t_specimen.current_quantity,
    t_specimen.current_quantity_uom_code_id,
    t_specimen.current_quantity_uom_code,
    t_specimen.parent_current_quantity_uom_code_id,
    t_specimen.parent_current_quantity_uom_code,
    t_specimen.nbr_specimen_containers,
    t_specimen.container_type_code_id,
    t_specimen.container_type_code,
    t_specimen.parent_container_type_code_id,
    t_specimen.parent_container_type_code,
    t_specimen.container_condition_code_id,
    t_specimen.container_condition_code,
    t_specimen.parent_container_condition_code_id,
    t_specimen.parent_container_condition_code,
    t_specimen.parent_specimen_id,
    t_specimen.child_role_code_id,
    t_specimen.child_role_code,
    t_specimen.parent_child_role_code_id,
    t_specimen.parent_child_role_code
   FROM t_specimen;
--\echo Creating view 'v_provider_template_schedule'...
CREATE OR REPLACE VIEW v_provider_template_schedule AS 
SELECT t_provider_template_schedule.provider_template_schedule_id,
    t_provider_template_schedule.provider_template_id,
    t_provider_template_schedule.schedule_start_date_time,
    t_provider_template_schedule.schedule_start_time,
    t_provider_template_schedule.schedule_start_date,
    t_provider_template_schedule.schedule_end_date_time,
    t_provider_template_schedule.schedule_end_time,
    t_provider_template_schedule.schedule_end_date,
    t_provider_template_schedule.day_of_week,
    t_provider_template_schedule.start_time,
    t_provider_template_schedule.end_time,
    t_provider_template_schedule.slot_length,
    t_provider_template_schedule.openings_per_slot,
    t_provider_template_schedule.nbr_overbooks_allowed,
    t_provider_template_schedule.private_slot_code_id,
    t_provider_template_schedule.private_slot_code,
    t_provider_template_schedule.parent_private_slot_code_id,
    t_provider_template_schedule.parent_private_slot_code,
    t_provider_template_schedule.modification_reason_code_id,
    t_provider_template_schedule.modification_reason_code,
    t_provider_template_schedule.parent_modification_reason_code_id,
    t_provider_template_schedule.parent_modification_reason_code
   FROM t_provider_template_schedule;
--\echo Creating view 'v_appointment_notification'...
CREATE OR REPLACE VIEW v_appointment_notification AS 
SELECT t_appointment_notification.appointment_notification_id,
    t_appointment_notification.appointment_id,
    t_appointment_notification.notification_mode_code_id,
    t_appointment_notification.notification_mode_code,
    t_appointment_notification.parent_notification_mode_code_id,
    t_appointment_notification.parent_notification_mode_code,
    t_appointment_notification.notification_reason_code_id,
    t_appointment_notification.notification_reason_code,
    t_appointment_notification.parent_notification_reason_code_id,
    t_appointment_notification.parent_notification_reason_code,
    t_appointment_notification.notification_datetime,
    t_appointment_notification.notification_time,
    t_appointment_notification.notification_date
   FROM t_appointment_notification;
--\echo Creating view 'v_referral_source'...
CREATE OR REPLACE VIEW v_referral_source AS 
SELECT t_referral_source.referral_source_id,
    t_referral_source.referral_number,
    t_referral_source.patient_m_id,
    t_referral_source.patient_id,
    t_referral_source.from_provider_m_id,
    t_referral_source.from_provider_id,
    t_referral_source.to_provider_m_id,
    t_referral_source.to_provider_id,
    t_referral_source.from_l0_facility_location_m_id,
    t_referral_source.from_facility_location_id,
    t_referral_source.to_l0_facility_location_m_id,
    t_referral_source.to_facility_location_id,
    t_referral_source.referral_date_time,
    t_referral_source.referral_time,
    t_referral_source.referral_date,
    t_referral_source.external_referral_date_time,
    t_referral_source.external_referral_time,
    t_referral_source.external_referral_date,
    t_referral_source.referral_status_code_id,
    t_referral_source.referral_status_code,
    t_referral_source.parent_referral_status_code_id,
    t_referral_source.parent_referral_status_code,
    t_referral_source.referral_type_code_id,
    t_referral_source.referral_type_code,
    t_referral_source.parent_referral_type_code_id,
    t_referral_source.parent_referral_type_code,
    t_referral_source.referral_class_code_id,
    t_referral_source.referral_class_code,
    t_referral_source.parent_referral_class_code_id,
    t_referral_source.parent_referral_class_code,
    t_referral_source.referral_priority_code_id,
    t_referral_source.referral_priority_code,
    t_referral_source.parent_referral_priority_code_id,
    t_referral_source.parent_referral_priority_code,
    t_referral_source.primary_reason_code_id,
    t_referral_source.primary_reason_code,
    t_referral_source.parent_primary_reason_code_id,
    t_referral_source.parent_primary_reason_code,
    t_referral_source.nonpref_provider_reason_code_id,
    t_referral_source.nonpref_provider_reason_code,
    t_referral_source.parent_nonpref_provider_reason_code_id,
    t_referral_source.parent_nonpref_provider_reason_code,
    t_referral_source.refer_to_specialty_code_id,
    t_referral_source.refer_to_specialty_code,
    t_referral_source.parent_refer_to_specialty_code_id,
    t_referral_source.parent_refer_to_specialty_code
   FROM t_referral_source;
--\echo Creating view 'v_provider_template'...
CREATE OR REPLACE VIEW v_provider_template AS 
SELECT t_provider_template.provider_template_id,
    t_provider_template.provider_m_id,
    t_provider_template.provider_id,
    t_provider_template.l0_facility_location_m_id,
    t_provider_template.facility_location_id,
    t_provider_template.release_date_time,
    t_provider_template.release_time,
    t_provider_template.release_date,
    t_provider_template.default_slot_length,
    t_provider_template.overbooking_allowed_code_id,
    t_provider_template.overbooking_allowed_code,
    t_provider_template.parent_overbooking_allowed_code_id,
    t_provider_template.parent_overbooking_allowed_code
   FROM t_provider_template;
--\echo Creating view 'v_med_concept'...
CREATE OR REPLACE VIEW v_med_concept AS 
SELECT t_med_concept.med_concept_id,
    t_med_concept.med_concept_name,
    t_med_concept.med_concept_measure_group,
    t_med_concept.med_concept_category,
    t_med_concept.med_concept_full_name
   FROM t_med_concept;
--\echo Creating view 'v_med_code'...
CREATE OR REPLACE VIEW v_med_code AS 
SELECT t_med_code.med_code_id,
    t_med_code.med_taxonomy_id,
    t_med_code.med_code_actual,
    t_med_code.med_code_name,
    t_med_code.med_code_full_name
   FROM t_med_code;
--\echo Creating view 'v_provider_availability_appt'...
CREATE OR REPLACE VIEW v_provider_availability_appt AS 
SELECT t_provider_availability_appt.provider_availability_appt_id,
    t_provider_availability_appt.provider_availability_slot_id,
    t_provider_availability_appt.appointment_id
   FROM t_provider_availability_appt;
--\echo Creating view 'v_patient_wait_list_preference'...
CREATE OR REPLACE VIEW v_patient_wait_list_preference AS 
SELECT t_patient_wait_list_preference.patient_wait_list_preference_id,
    t_patient_wait_list_preference.patient_wait_list_id,
    t_patient_wait_list_preference.provider_m_id,
    t_patient_wait_list_preference.provider_id,
    t_patient_wait_list_preference.l0_facility_location_m_id,
    t_patient_wait_list_preference.facility_location_id
   FROM t_patient_wait_list_preference;
--\echo Creating view 'v_provider_availability_slot'...
CREATE OR REPLACE VIEW v_provider_availability_slot AS 
SELECT t_provider_availability_slot.provider_availability_slot_id,
    t_provider_availability_slot.provider_m_id,
    t_provider_availability_slot.provider_id,
    t_provider_availability_slot.facility_location_id,
    t_provider_availability_slot.slot_begin_date_time,
    t_provider_availability_slot.slot_begin_time,
    t_provider_availability_slot.slot_begin_date,
    t_provider_availability_slot.slot_length,
    t_provider_availability_slot.nbr_scheduled_appointments,
    t_provider_availability_slot.orig_openings_per_slot,
    t_provider_availability_slot.orig_nbr_overbooks_allowed,
    t_provider_availability_slot.private_slot_code_id,
    t_provider_availability_slot.private_slot_code,
    t_provider_availability_slot.parent_private_slot_code_id,
    t_provider_availability_slot.parent_private_slot_code,
    t_provider_availability_slot.unavailable_indicator_code_id,
    t_provider_availability_slot.unavailable_indicator_code,
    t_provider_availability_slot.parent_unavailable_indicator_code_id,
    t_provider_availability_slot.parent_unavailable_indicator_code,
    t_provider_availability_slot.unavailable_reason_code_id,
    t_provider_availability_slot.unavailable_reason_code,
    t_provider_availability_slot.parent_unavailable_reason_code_id,
    t_provider_availability_slot.parent_unavailable_reason_code,
    t_provider_availability_slot.held_indicator_code_id,
    t_provider_availability_slot.held_indicator_code,
    t_provider_availability_slot.parent_held_indicator_code_id,
    t_provider_availability_slot.parent_held_indicator_code,
    t_provider_availability_slot.held_reason_code_id,
    t_provider_availability_slot.held_reason_code,
    t_provider_availability_slot.parent_held_reason_code_id,
    t_provider_availability_slot.parent_held_reason_code,
    t_provider_availability_slot.blocked_indicator_code_id,
    t_provider_availability_slot.blocked_indicator_code,
    t_provider_availability_slot.parent_blocked_indicator_code_id,
    t_provider_availability_slot.parent_blocked_indicator_code,
    t_provider_availability_slot.blocked_reason_code_id,
    t_provider_availability_slot.blocked_reason_code,
    t_provider_availability_slot.parent_blocked_reason_code_id,
    t_provider_availability_slot.parent_blocked_reason_code
   FROM t_provider_availability_slot;
--\echo Creating view 'v_patient_wait_list'...
CREATE OR REPLACE VIEW v_patient_wait_list AS 
SELECT t_patient_wait_list.patient_wait_list_id,
    t_patient_wait_list.patient_m_id,
    t_patient_wait_list.patient_id,
    t_patient_wait_list.referral_id,
    t_patient_wait_list.appointment_id,
    t_patient_wait_list.wait_list_status_code_id,
    t_patient_wait_list.wait_list_status_code,
    t_patient_wait_list.parent_wait_list_status_code_id,
    t_patient_wait_list.parent_wait_list_status_code,
    t_patient_wait_list.removal_reason_code_id,
    t_patient_wait_list.removal_reason_code,
    t_patient_wait_list.parent_removal_reason_code_id,
    t_patient_wait_list.parent_removal_reason_code,
    t_patient_wait_list.visit_type_code_id,
    t_patient_wait_list.visit_type_code,
    t_patient_wait_list.parent_visit_type_code_id,
    t_patient_wait_list.parent_visit_type_code,
    t_patient_wait_list.treatment_code_id,
    t_patient_wait_list.treatment_code,
    t_patient_wait_list.parent_treatment_code_id,
    t_patient_wait_list.parent_treatment_code,
    t_patient_wait_list.priority_code_id,
    t_patient_wait_list.priority_code,
    t_patient_wait_list.parent_priority_code_id,
    t_patient_wait_list.parent_priority_code,
    t_patient_wait_list.appointment_length,
    t_patient_wait_list.scheduling_preference,
    t_patient_wait_list.prefered_begin_date_time,
    t_patient_wait_list.prefered_begin_time,
    t_patient_wait_list.prefered_begin_date,
    t_patient_wait_list.prefered_end_date_time,
    t_patient_wait_list.prefered_end_time,
    t_patient_wait_list.prefered_end_date
   FROM t_patient_wait_list;
--\echo Creating view 'v_med_concept_code_xref'...
CREATE OR REPLACE VIEW v_med_concept_code_xref AS 
SELECT t_med_concept_code_xref.med_concept_id,
    t_med_concept_code_xref.med_code_id
   FROM t_med_concept_code_xref;
--\echo Creating view 'v_med_taxonomy'...
CREATE OR REPLACE VIEW v_med_taxonomy AS 
SELECT t_med_taxonomy.med_taxonomy_id,
    t_med_taxonomy.med_taxonomy_name,
    t_med_taxonomy.med_taxonomy_version
   FROM t_med_taxonomy;
--\echo Creating view 'v_patient_encounter_diagnosis'...
CREATE OR REPLACE VIEW v_patient_encounter_diagnosis AS 
SELECT t_patient_encounter_diagnosis.patient_m_id,
    t_patient_encounter_diagnosis.patient_id,
    t_patient_encounter_diagnosis.encounter_id,
    t_patient_encounter_diagnosis.encounter_date_time,
    t_patient_encounter_diagnosis.encounter_date,
    t_patient_encounter_diagnosis.encounter_time,
    t_patient_encounter_diagnosis.d001,
    t_patient_encounter_diagnosis.d002,
    t_patient_encounter_diagnosis.d003,
    t_patient_encounter_diagnosis.d004,
    t_patient_encounter_diagnosis.d005,
    t_patient_encounter_diagnosis.d006,
    t_patient_encounter_diagnosis.d007,
    t_patient_encounter_diagnosis.d008,
    t_patient_encounter_diagnosis.d009,
    t_patient_encounter_diagnosis.d010,
    t_patient_encounter_diagnosis.d011,
    t_patient_encounter_diagnosis.d012,
    t_patient_encounter_diagnosis.d013,
    t_patient_encounter_diagnosis.d014,
    t_patient_encounter_diagnosis.d015,
    t_patient_encounter_diagnosis.d016,
    t_patient_encounter_diagnosis.d017,
    t_patient_encounter_diagnosis.d018,
    t_patient_encounter_diagnosis.d019,
    t_patient_encounter_diagnosis.d021,
    t_patient_encounter_diagnosis.d022,
    t_patient_encounter_diagnosis.d023,
    t_patient_encounter_diagnosis.d024,
    t_patient_encounter_diagnosis.d025,
    t_patient_encounter_diagnosis.d026,
    t_patient_encounter_diagnosis.d027,
    t_patient_encounter_diagnosis.d028,
    t_patient_encounter_diagnosis.d029,
    t_patient_encounter_diagnosis.d030,
    t_patient_encounter_diagnosis.d031,
    t_patient_encounter_diagnosis.d032,
    t_patient_encounter_diagnosis.d033,
    t_patient_encounter_diagnosis.d034,
    t_patient_encounter_diagnosis.d035,
    t_patient_encounter_diagnosis.d036,
    t_patient_encounter_diagnosis.d037,
    t_patient_encounter_diagnosis.d038,
    t_patient_encounter_diagnosis.d039,
    t_patient_encounter_diagnosis.d040,
    t_patient_encounter_diagnosis.d041,
    t_patient_encounter_diagnosis.d042,
    t_patient_encounter_diagnosis.d043,
    t_patient_encounter_diagnosis.d044,
    t_patient_encounter_diagnosis.d045,
    t_patient_encounter_diagnosis.d046,
    t_patient_encounter_diagnosis.d047,
    t_patient_encounter_diagnosis.d048,
    t_patient_encounter_diagnosis.d049,
    t_patient_encounter_diagnosis.d050,
    t_patient_encounter_diagnosis.d051,
    t_patient_encounter_diagnosis.d052,
    t_patient_encounter_diagnosis.d053,
    t_patient_encounter_diagnosis.d054,
    t_patient_encounter_diagnosis.d055,
    t_patient_encounter_diagnosis.d056,
    t_patient_encounter_diagnosis.d057,
    t_patient_encounter_diagnosis.d058,
    t_patient_encounter_diagnosis.d059,
    t_patient_encounter_diagnosis.d060,
    t_patient_encounter_diagnosis.d061,
    t_patient_encounter_diagnosis.d062,
    t_patient_encounter_diagnosis.d063,
    t_patient_encounter_diagnosis.d064,
    t_patient_encounter_diagnosis.d065,
    t_patient_encounter_diagnosis.d066,
    t_patient_encounter_diagnosis.d067,
    t_patient_encounter_diagnosis.d068,
    t_patient_encounter_diagnosis.d069,
    t_patient_encounter_diagnosis.d070
   FROM t_patient_encounter_diagnosis;

