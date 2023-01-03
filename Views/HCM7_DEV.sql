--> update AMS_ABSENCE_MGT_HEADER_V
--> update AMS_ABSENCE_MGT_REASONS_V
--> update TAT_BASE_LINE_PLAN_INFO_V
--> CREATE OR REPLACE FORCE VIEW "HCM7_DEV"."GN_SESSIONS_V" ("SESSION_ID", "EFFECTIVE_DATE", "USER_ID", "USER_NAME", "EMPLOYEE_NUMBER", "EMPLOYEE_NAME", "SITE_NAME", "SESSION_EXPIRED", "URL_DOMAIN", "LAST_UPDATED_DATE",SESSION_IP) AS 
--   SELECT SESSION_ID,
--           EFFECTIVE_DATE,
--           GS.USER_ID,
--           USER_NAME,
--           GU.EMPLOYEE_NUMBER,
--           GN_REPORTS_PKG.GET_PERSON_NAME (GU.PERSON_ID, TRUNC (SYSDATE))
--              EMPLOYEE_NAME,
--           HS.SITE_NAME,
--           GS.SESSION_EXPIRED,
--           S.URL_DOMAIN,
--           GS.LAST_UPDATED_DATE,
--           SESSION_IP
--      FROM GN_SESSIONS_T GS,
--           GN_USERS_T    GU,
--           HR_SITES_TL   HS,
--           HR_SITES_T    S
--     WHERE     GS.USER_ID = GU.USER_ID
--           AND GS.SITE_ID = GU.SITE_ID
--           AND GS.SITE_ID = HS.SITE_ID
--           AND GS.SITE_ID = S.SITE_ID
--           AND GU.SITE_ID = S.SITE_ID
--           AND HS.SITE_ID = S.SITE_Id
--           AND HS.LANGUAGE = 'US';
>>>>>>>>>>>>>>>>>>>>>>>
/* Formatted on 12/6/2022 1:42:49 PM (QP5 v5.294) */
CREATE OR REPLACE FORCE VIEW SS_INTEGRATIONS_V
(
   INTEGRATION_ID,
   INTEGRATION_NAME,
   ENTITY_ID,
   ENTITY_NAME,
   INTEGRATION_TYPE,
   STATUS_DESC,
   PHASE_DESC,
   STATUS,
   PHASE,
   ERROR_MSG,
   CREATED_BY,
   CREATED_BY_NAME,
   CREATION_DATE,
   LAST_UPDATED_BY,
   LAST_UPDATE_DATE,
   ACTUAL_START_DATE,
   ACTUAL_COMPLETION_DATE,
   PAYROLL_ID,
   PAYROLL_NAME
)
AS
   SELECT INTEGRATION_ID,
          INTEGRATION_NAME,
          ENTITY_ID,
          HR_GENERAL_PKG.DECODE_ENTITY (ENTITY_ID, 'US')  ENTITY_NAME,
          INTEGRATION_TYPE,
          DECODE (STATUS,  'N', 'Normal',  'C', 'Succeeded',  'Error')
             STATUS_DESC,
          DECODE (PHASE,  'D', 'Done',  'P', 'Pending',  'Running')
             PHASE_DESC,
          STATUS,
          PHASE,
          ERROR_MSG,
          CREATED_BY,
          GN_GLOBAL_PKG.USER_NAME (CREATED_BY, ENTITY_ID) CREATED_BY_NAME,
          CREATION_DATE,
          LAST_UPDATED_BY,
          LAST_UPDATE_DATE,
          ACTUAL_START_DATE,
          ACTUAL_COMPLETION_DATE,
          PAYROLL_ID,
          GN_TRANSLATION_PKG.DECODE_PAY_PAYROLL_TL(PAYROLL_ID) PAYROLL_NAME
     FROM GN_FUSION_INTEGRATION_T;


>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

DROP VIEW HCM7_DEV.GN_DASHBOARD_WIDGETS_PRIV_V;

/* Formatted on 12/7/2022 3:29:22 PM (QP5 v5.294) */
CREATE OR REPLACE FORCE VIEW HCM7_DEV.GN_DASHBOARD_WIDGETS_PRIV_V
(
   RCD_ID,
   CODE,
   WIDGET_DESC,
   PRIV_ID,
   TYPE,
   TYPE_DESC,
   RIV_NAME,
   ENTITY_ID,
   EFFECTIVE_START_DATE
)
AS
   SELECT RCD_ID,
          CODE,
          HR_GENERAL_PKG.DECODE_LOOKUP ('GN_DASHBOARD_WIDGET',
                                        CODE,
                                        GN_GLOBAL_PKG.USER_LANG)
             WIDGET_DESC,
          PRIV_ID,
          GW.TYPE,
          HR_GENERAL_PKG.DECODE_LOOKUP ('GN_DASHBOARD_RULE_TYPE',
                                        GW.TYPE,
                                        GN_GLOBAL_PKG.USER_LANG)
             TYPE_DESC,
          CASE GW.TYPE
             WHEN 'U'
             THEN
                (SELECT nvl(GN_GLOBAL_PKG.GET_FULLNAME (GT.PERSON_ID),gt.USER_NAME)
                   FROM GN_USERS_T GT
                  WHERE GT.USER_ID = GW.PRIV_ID)
             WHEN 'R'
             THEN
                (SELECT GP.GRP_NAME
                   FROM GN_PRIV_GROUPS_T GP
                  WHERE GP.GRP_ID = GW.PRIV_ID)
          END
             RIV_NAME,
          GW.ENTITY_ID,
          EFFECTIVE_START_DATE
     FROM GN_DASHBOARD_WIDGETS_PRIV_T GW
    WHERE TRUNC (SYSDATE) BETWEEN GW.EFFECTIVE_START_DATE
                              AND GW.EFFECTIVE_END_DATE;


CREATE OR REPLACE SYNONYM HCM7_DEV_TRN.GN_DASHBOARD_WIDGETS_PRIV_V FOR HCM7_DEV.GN_DASHBOARD_WIDGETS_PRIV_V;


GRANT SELECT ON HCM7_DEV.GN_DASHBOARD_WIDGETS_PRIV_V TO HCM7_DEV_TRN;


 >>>>>>>>>>>>>>>>>>>>> create this view

CREATE OR REPLACE FORCE VIEW HR_FILTERED_ORGANIZATIONS_V
(
   ORGANIZATION_ID,
   ORGANIZATION_NAME,
   ENTITY_ID,
   HR_ORGANIZATION_TREE,
   MASTER_ORG
)
AS
   SELECT organization_id,
          organization_name,
          entity_id,
          hr_organization_tree,
          master_org
     FROM (SELECT organization_id,
                  organization_name,
                  org.entity_id,
                  NULL  master_org,
                  'off' hr_organization_tree
             FROM hr_organizations_v org
            WHERE     type_code NOT IN ('BG', 'LE', 'BU')
                  AND gn_global_pkg.get_global_variable (
                         'HR_ORGANIZATION_TREE',
                         org.entity_id) = 'off'
           UNION
           SELECT organization_id,
                  organization_name,
                  org.entity_id,
                  tree.organization_parent_id master_org,
                  'on'                        hr_organization_tree
             FROM hr_organizations_v org, hr_org_tree_details_t tree
            WHERE     org.organization_id = tree.organization_child_id
                  AND type_code NOT IN ('BG', 'LE', 'BU')
                  AND gn_global_pkg.get_global_variable (
                         'HR_ORGANIZATION_TREE',
                         org.entity_id) = 'on'
           ORDER BY organization_name ASC);

 

 *************************** Saber *****************
 
CREATE OR REPLACE FORCE VIEW HCM7_QA.GN_COSTING_FLEX_FIELDS_V
(
   FLEX_STRUCTURE_NAME,
   FLEX_STRUCTURE_DESC,
   FLEX_LINE_ID,
   SEGMENT_NAME,
   COLUMN_NAME,
   LEFT_PROMPT,
   ENABLED_FLAG,
   DISPLAY_FLAG,
   FLEX_VALUE_SET,
   ENTITY_ID,
   LOV_COL1,
   LOV_COL2,
   LOV_TABLE,
   LOV_QUERY,
   SEGMENT_NUM,
   ELEMENT_ENTRY_Q,
   ELEMENT_LINKS_Q,
   LOCATION_Q,
   ORGANIZATION_Q,
   PAYROLL_Q,
   BALANCING_Q,
   ASSIGNMENT_Q
)
AS
     SELECT FLEX_STRUCTURE_NAME,
            FLEX_STRUCTURE_DESC,
            FLEX_LINE_ID,
            SEGMENT_NAME,
            COLUMN_NAME,
            LEFT_PROMPT,
            ENABLED_FLAG,
            DISPLAY_FLAG,
            FLEX_VALUE_SET,
            B.ENTITY_ID,
            lov.LOV_COL1,
            lov.LOV_COL2,
            lov.LOV_TABLE,
            lov.LOV_QUERY,
            SEGMENT_NUM,
            ELEMENT_ENTRY_Q,
            ELEMENT_LINKS_Q,
            LOCATION_Q,
            ORGANIZATION_Q,
            PAYROLL_Q,
            BALANCING_Q,
            ASSIGNMENT_Q
       FROM GN_FLEX_SEGMENTS_T A,
            GN_FLEX_STRUCTURES_T B,
            GN_LIST_OF_VALUES_T LOV
      WHERE     A.FLEX_VALUE_SET = LOV.LOV_NAME(+)
            AND A.FLEX_HEADER_ID = B.FLEX_HEADER_ID
            --   AND   B.ENTITY_ID=:pEntityId
            AND ENABLED_FLAG = 'Y'
            AND DISPLAY_FLAG = 'Y'
            AND B.FLEX_STRUCTURE_TYPE = 'COSTING'
   ORDER BY SEGMENT_NUM ASC;


>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

/* Formatted on 12/14/2022 11:48:22 AM (QP5 v5.294) */
CREATE OR REPLACE FORCE VIEW HR_ORGANIZATIONS_V
(
   ORGANIZATION_ID,
   ORGANIZATION_CODE,
   LOCATION_ID,
   TYPE_CODE,
   EFFECTIVE_START_DATE,
   EFFECTIVE_END_DATE,
   CREATED_BY,
   CREATION_DATE,
   LAST_UPDATED_BY,
   LAST_UPDATE_DATE,
   SITE_ID,
   ENTITY_ID,
   ORGANIZATION_NAME,
   ENTITY_NAME,
   LOCATION_NAME,
   ORGANIZATION_TYPE,
   LANGUAGE,
   EMPLOYEE_EXISTS,
   MANAGER_PERSON_ID,
   MANAGER_PERSON_NAME,
   ADMIN_PERSON_ID,
   ADMIN_PERSON_NAME,
   COORDINATOR_PERSON_ID,
   COORDINATOR_PERSON_NAME,
   LEAVE_ADMIN_PERSON_ID,
   LEAVE_ADMIN_PERSON_NAME,
   START_TIME,
   END_TIME,
   TOTAL_HOURS,
   FREQUENCY,
   FREQUENCY_DESC,
   FLEXI_TIME_ALLOWED,
   FLEXI_TIME_ALLOWED_DESC,
   FLEXI_HOURS,
   FLEXI_HOURS_DESC,
   EMP_MALE_COUNT,
   EMP_FEMALE_COUNT,
   EMP_COUNT,
   PARENT_ORGANIZATION_ID,
   PARENT_ORGANIZATION,
   PARENT_ORGANIZATION_CODE,
   PROBATION_PERIOD,
   PROBATION_UNIT_CODE,
   LEGISLATION_CON_SEGMENTS,
   PARENT_ID,
   PARENT_NAME,
   COST_ALLOCATION_KEYFLEX_ID,
   CONCATENATED_SEGMENTS
)
AS
   SELECT L.ORGANIZATION_ID,
          L.ORGANIZATION_CODE,
          L.LOCATION_ID,
          L.TYPE_CODE,
          L.EFFECTIVE_START_DATE,
          L.EFFECTIVE_END_DATE,
          L.CREATED_BY,
          L.CREATION_DATE,
          L.LAST_UPDATED_BY,
          L.LAST_UPDATE_DATE,
          L.SITE_ID,
          L.ENTITY_ID,
          LTL.ORGANIZATION_NAME,
          ETL.ENTITY_NAME,
          LV1.LOCATION_NAME,
          LV2.MEANING                ORGANIZATION_TYPE,
          LTL.LANGUAGE,
          DECODE (HR_GENERAL_PKG.EMP_COUNT_ORGANIZATION (L.ORGANIZATION_ID),
                  0, 'N',
                  'Y')
             EMPLOYEE_EXISTS,
          L.MANAGER_PERSON_ID,
          HR_GENERAL_PKG.EMPLOYEE_FULL_NAME (L.MANAGER_PERSON_ID)
             MANAGER_PERSON_NAME,
          ADMIN_PERSON_ID,
          HR_GENERAL_PKG.EMPLOYEE_FULL_NAME (L.ADMIN_PERSON_ID)
             MANAGER_PERSON_NAME,
          COORDINATOR_PERSON_ID,
          HR_GENERAL_PKG.EMPLOYEE_FULL_NAME (L.COORDINATOR_PERSON_ID)
             COORDINATOR_PERSON_NAME,
          LEAVE_ADMIN_PERSON_ID,
          HR_GENERAL_PKG.EMPLOYEE_FULL_NAME (L.LEAVE_ADMIN_PERSON_ID)
             LEAVE_ADMIN_PERSON_NAME,
          START_TIME,
          END_TIME,
          GET_TIME_STR1 (TOTAL_HOURS),
          FREQUENCY,
          HR_GENERAL_PKG.DECODE_LOOKUP ('HR_WORK_FREQUENCY', FREQUENCY)
             FREQUENCY_DESC,
          FLEXI_TIME_ALLOWED,
          HR_GENERAL_PKG.DECODE_LOOKUP ('HR_WORK_FLEX_TIME_ALOWED',
                                        FLEXI_TIME_ALLOWED)
             FLEXI_TIME_ALLOWED_DESC,
          FLEXI_HOURS,
          HR_GENERAL_PKG.DECODE_LOOKUP ('HR_WORK_FLEX_HOURS', FLEXI_HOURS)
             FLEXI_HOURS_DESC,
          NULL                       EMP_MALE_COUNT,
          NULL                       EMP_FEMALE_COUNT,
          NULL                       EMP_COUNT,
          (SELECT DISTINCT ORGANIZATION_ID_PARENT
             FROM HR_ORG_STRUCTURE_ELEMENTS_V
            WHERE     ORGANIZATION_ID_CHILD = L.ORGANIZATION_ID
                  AND ENTITY_ID = L.ENTITY_ID
                  AND ROWNUM < 2)
             PARENT_ORGANIZATION_ID,
          (SELECT DISTINCT PARENT_ORG_NAME
             FROM HR_ORG_STRUCTURE_ELEMENTS_V
            WHERE     ORGANIZATION_ID_CHILD = L.ORGANIZATION_ID
                  AND ENTITY_ID = L.ENTITY_ID
                  AND ROWNUM < 2)
             PARENT_ORGANIZATION,
          (SELECT DISTINCT PARENT_ORGANIZATION_CODE
             FROM HR_ORG_STRUCTURE_ELEMENTS_V
            WHERE     ORGANIZATION_ID_CHILD = L.ORGANIZATION_ID
                  AND ENTITY_ID = L.ENTITY_ID
                  AND ROWNUM < 2)
             PARENT_ORGANIZATION_CODE,
          L.PROBATION_PERIOD,
          L.PROBATION_UNIT_CODE,
          HLSD.CONCATENATED_SEGMENTS LEGISLATION_CON_SEGMENTS,
          L.PARENT_ID,
          NVL (
             GN_TRANSLATION_PKG.DECODE_ORGANIZATION_NAME (
                P_ORGANIZATION_ID   => L.PARENT_ID),
             '')
             PARENT_NAME,
             L.COST_ALLOCATION_KEYFLEX_ID,
             L.CONCATENATED_SEGMENTS
     FROM HR_ORGANIZATIONS_T             L,
          HR_ORGANIZATIONS_TL            LTL,
          HR_LOCATIONS_V                 LV1,
          GN_LOOKUP_VALUES_V             LV2,
          HR_ENTITIES_TL                 ETL,
          PAY_COST_ALLOCATION_KEYFLEX_T  PCAK,
          HR_LEGISLATION_SEGMENTS_DTLS_T HLSD
    WHERE     L.ORGANIZATION_ID = LTL.ORGANIZATION_ID
          AND LV2.LOOKUP_CODE = L.TYPE_CODE
          AND ETL.ENTITY_ID = L.ENTITY_ID
          AND LV2.LOOKUP_TYPE = 'HR_ORGANIZATION_TYPES'
          AND LV1.LOCATION_ID(+) = L.LOCATION_ID
          AND LTL.LANGUAGE = GN_GLOBAL_PKG.USER_LANG
          AND ETL.LANGUAGE = GN_GLOBAL_PKG.USER_LANG
          AND PCAK.COST_ALLOCATION_KEYFLEX_ID(+) =
                 L.COST_ALLOCATION_KEYFLEX_ID
          --          AND HLSD.CLASSIFICATION_TYPE = 'ORG'
          AND HLSD.OBJECT_ID(+) = L.ORGANIZATION_ID
          AND (   (    L.ENTITY_ID IN
                          (SELECT ENTITY_ID
                             FROM GN_USERS_PAYROLLS_T
                            WHERE USER_ID = GN_GLOBAL_PKG.USER_ID)
                   AND GN_GLOBAL_PKG.USER_ID <> 1)
               OR GN_GLOBAL_PKG.USER_ID = 1)
          AND NVL (GN_GLOBAL_PKG.USER_DATE, SYSDATE) BETWEEN L.EFFECTIVE_START_DATE
                                                         AND NVL (
                                                                L.EFFECTIVE_END_DATE,
                                                                NVL (
                                                                   GN_GLOBAL_PKG.USER_DATE,
                                                                   SYSDATE));


>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

CREATE OR REPLACE FORCE VIEW PCM_PAYROLL_PROCESSES_V
(
   PROCESS_ID,
   CREATION_DATE,
   CREATED_BY,
   STATUS,
   ENTITY_ID,
   PAYROLL_ID,
   PERIOD_ID,
   PAID_PERIOD_ID,
   LAST_ACTION_ID,
   ACTION_BFR_APPROVAL,
   CREATED_BY_EMPLOYEE,
   ENTITY_NAME,
   PAYROLL_NAME,
   PERIOD_NAME,
   PAID_PERIOD_NAME,
   RETRO_ACTION_ID,
   PAYROLL_ACTION_ID,
   PREPAYMENT_ACTION_ID,
   COSTING_ACTION_ID,
   ASSIGNMENT_SET_ID,
   ELEMENT_SET_ID,
   ACTION_TYPE,
   PROCESS_MODE,
   PROCESS_DATE,
   PAYSLIP_ACTION_ID,
   GL_ACTION_ID,
   INTERFACE_ACTION_ID
)
AS
   SELECT PCM_PP.PROCESS_ID,
          PCM_PP.CREATION_DATE,
          PCM_PP.CREATED_BY,
          PROCESS_STATUS,
          PCM_PP.ENTITY_ID,
          PCM_PP.PAYROLL_ID,
          PCM_PP.PERIOD_ID,
          PCM_PP.PAID_PERIOD_ID,
          PCM_PP.LAST_ACTION_ID,
          PCM_PP.ACTION_BFR_APPROVAL,
          HR_GENERAL_PKG.EMPLOYEE_FULL_NAME (PCM_PP.CREATED_BY)
             CREATED_BY_EMPLOYEE,
          HR_GENERAL_PKG.DECODE_ENTITY (PCM_PP.ENTITY_ID) ENTITY_NAME,
          HR_GENERAL_PKG.DECODE_PAYROLL (PCM_PP.ENTITY_ID, PCM_PP.PAYROLL_ID)
             PAYROLL_NAME,
          HR_GENERAL_PKG.DECODE_PERIOD (PCM_PP.ENTITY_ID, PCM_PP.PERIOD_ID)
             PERIOD_NAME,
          HR_GENERAL_PKG.DECODE_PERIOD (PCM_PP.ENTITY_ID,
                                        PCM_PP.PAID_PERIOD_ID)
             PAID_PERIOD_NAME,
             RETRO_ACTION_ID,
          PAYROLL_ACTION_ID,
          PREPAYMENT_ACTION_ID,
          COSTING_ACTION_ID,
          ASSIGNMENT_SET_ID,
          ELEMENT_SET_ID,
          ACTION_TYPE,
          PROCESS_MODE,
          PROCESS_DATE,
          PAYSLIP_ACTION_ID,
          GL_ACTION_ID,
          INTERFACE_ACTION_ID
     FROM PCM_PAYROLL_PROCESSES_T PCM_PP;
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

CREATE OR REPLACE FORCE VIEW HR_SITES_V
(
   SITE_ID,
   COUNTRY_CODE,
   EFFECTIVE_START_DATE,
   EFFECTIVE_END_DATE,
   SITE_LOGO,
   CREATED_BY,
   CREATION_DATE,
   LAST_UPDATED_BY,
   LAST_UPDATE_DATE,
   CURRENCY_CODE,
   SITE_NAME,
   COUNTRY,
   CURRENCY,
   URL_DOMAIN,
   FUSION_USERNAME,
   FUSION_PASSWORD,
   FUSION_ENDPOINT,
   SITE_TYPE,
   SYSADMIN_USER_ID,
   SITE_LOGO_NAME,
   REPORT_LOGO
)
AS
   SELECT s."SITE_ID",
          s."COUNTRY_CODE",
          s."EFFECTIVE_START_DATE",
          s."EFFECTIVE_END_DATE",
          s."SITE_LOGO",
          s."CREATED_BY",
          s."CREATION_DATE",
          s."LAST_UPDATED_BY",
          s."LAST_UPDATE_DATE",
          s."CURRENCY_CODE",
          st.site_name,
          GLV.MEANING  country,
          GLV1.MEANING CURRENCY,
          s.URL_DOMAIN,
          s.FUSION_USERNAME,
          s.FUSION_PASSWORD,
          s.FUSION_ENDPOINT,
          s.SITE_TYPE,
          s.SYSADMIN_USER_ID,
          s.SITE_LOGO_NAME,
          s.REPORT_LOGO
     FROM hr_sites_t         s,
          hr_sites_tl        st,
          gn_lookup_values_v glv,
          gn_lookup_values_v glv1
    WHERE     S.SITE_ID = ST.SITE_ID
          AND st.language = GN_GLOBAL_PKG.user_lang
          AND GLV.LOOKUP_CODE = S.COUNTRY_CODE
          AND glv.LOOKUP_TYPE = 'HR_COUNTRIES'
          AND GLV1.LOOKUP_CODE = S.CURRENCY_CODE
          AND glv1.LOOKUP_TYPE = 'HR_CURRENCIES';


>>>>>>>>>>>>>>>>>>> 
already done in QA

CREATE OR REPLACE FORCE VIEW TAT_BASE_LINE_PLAN_INFO_V
(
   PLAN_ID,
   PLAN_NAME,
   START_DATE,
   END_DATE,
   ACTIVE_FLAG,
   CREATION_DATE,
   LAST_UPDATE_DATE,
   CREATED_BY,
   LAST_UPDATED_BY,
   ENTITY_ID,
   ENTITY_NAME,
   CATEGORY_TYPE,
   CATEGORY_TYPE_NAME,
   CATEGORY_ID,
   CATEGORY_ID_NAME
)
AS
   SELECT "PLAN_ID",
          NVL (GN_TRANSLATION_PKG.DECODE_TAT_PLAN_NAME_TL (TT.PLAN_ID),
               TT.PLAN_NAME)
             "PLAN_NAME",
          "START_DATE",
          "END_DATE",
          "ACTIVE_FLAG",
          "CREATION_DATE",
          "LAST_UPDATE_DATE",
          "CREATED_BY",
          "LAST_UPDATED_BY",
          "ENTITY_ID",
          HR_GENERAL_PKG.DECODE_ENTITY (ENTITY_ID) ENTITY_NAME,
          "CATEGORY_TYPE",
          --          (SELECT MEANING
          --             FROM GN_LOOKUP_VALUES_V GV
          --            WHERE     GV.LOOKUP_TYPE = 'TAT_ATTENDANCE_GROUP_TYPES'
          --                  AND GV.LOOKUP_CODE = TT.CATEGORY_TYPE)
          (SELECT REPLACE (CATEGORY_TYPE, '_', ' ')
             FROM TAT_PERSONS_PER_CATEGORY_V
            WHERE CATEGORY_TYPE = TT.CATEGORY_TYPE AND ROWNUM < 2)
             CATEGIRY_NAME,
          "CATEGORY_ID",
          (SELECT CATEGORY_ID_DESC
             FROM TAT_PERSONS_PER_CATEGORY_V TV
            WHERE     TV.CATEGORY_TYPE = TT.CATEGORY_TYPE
                  AND TV.CATEGORY_ID = TT.CATEGORY_ID
                  AND ROWNUM < 2)
             CATEGORY_ID_NAME
     FROM TAT_BASE_LINE_PLAN_INFO_T TT
    WHERE ACTIVE_FLAG = 'Y'

>>>>>>>>>>>>>>>>>>>>>>>
/* Formatted on 12/29/2022 1:27:23 PM (QP5 v5.391) */
CREATE OR REPLACE FORCE VIEW HCM7_DEV.PCM_ACTIONS_V
(
    STEP_ID,
    STEP_NAME,
    STP_SEQUENCE,
    STP_ACTIVE,
    ACTION_ID,
    ENTITY_ID,
    ACTION_CODE,
    ACTION_NAME,
    ACTIVE,
    SEQUENCE,
    CONCURRENT_PROGRAM_ID,
    REPORT_PATH,
    REPORT_FILE_NAME,
    REPORT_FORMAT,
    VISIBLE_ACTIONS_IDS,
    APPROVERS,
    PROCESS_ID,
    REPORT_LOGO,
    PAYROLL_ID,
    FTP_SERVER_ID,
    ACTION,
    ACTION_TYPE,
    SHORT_NAME
)
AS
      SELECT STP.STEP_ID,
             STP.STEP_NAME,
             STP.SEQUENCE     STP_SEQUENCE,
             STP.ACTIVE STP_ACTIVE,
             ACT.ACTION_ID,
             ACT.ENTITY_ID,
             ACT.ACTION_CODE,
             ACTL.ACTION_NAME,
             ACT.ACTIVE,
             ACT.SEQUENCE,
             ACT.CONCURRENT_PROGRAM_ID,
             CONC.REPORT_PATH,
             CONC.REPORT_FILE_NAME,
             CONC.REPORT_FORMAT,
             ACT.VISIBLE_ACTIONS_IDS,
             ACT.APPROVERS,
             PPP.PROCESS_ID,
             CONC.REPORT_LOGO,
             ACT.PAYROLL_ID,
             ACT.FTP_SERVER_ID,
             ACT.ACTION,
             ACT.ACTION_TYPE,
             CONC.SHORT_NAME
        FROM PCM_STEPS_T              STP,
             PCM_ACTIONS_T            ACT,
             PCM_PAYROLL_PROCESSES_T  PPP,
             PCM_ACTIONS_T            VIS_ACT,
             GN_CONCURRENT_PROGRAMS_TL CONC,
             PCM_ACTIONS_TL           ACTL
       WHERE     STP.STEP_ID = ACT.STEP_ID
             AND STP.ENTITY_ID = ACT.ENTITY_ID
             AND ACT.ACTION_ID = ACTL.ACTION_ID
             AND ACTL.LANGUAGE = GN_GLOBAL_PKG.USER_LANG
             AND STP.ACTIVE = 1
             AND ACT.ACTIVE = 1
             AND ACT.CONCURRENT_PROGRAM_ID = CONC.CONCURRENT_PROGRAM_ID(+)
             AND PPP.LAST_ACTION_ID = VIS_ACT.ACTION_ID(+)
             AND (   (ACT.STEP_ID IN (1, 7))
                  OR (PPP.LAST_ACTION_ID IS NULL AND ACT.ACTION_CODE IN (2, 10))
                  OR (    PCM_GENERAL_API.GET_PCM_PROCESS_STEP_STATUS (
                              PPP.PROCESS_ID,
                              ACT.STEP_ID) =
                          'S'
                      AND ACT.ACTION_CODE IN (20,
                                              24,
                                              25,
                                              26)
                      AND PCM_GENERAL_API.GET_PCM_PROCESS_STEP_STATUS (
                              PPP.PROCESS_ID,
                              ACT.STEP_ID + 1) =
                          'C')
                  OR (    PCM_GENERAL_API.GET_PCM_PROCESS_STEP_STATUS (
                              PPP.PROCESS_ID,
                              ACT.STEP_ID) <>
                          'S'
                      AND ',' || VIS_ACT.VISIBLE_ACTIONS_IDS || ',' LIKE
                              '%,' || ACT.ACTION_CODE || ',%'))
             AND (   PPP.CONCURRENT_REQUEST_ID IS NULL
                  OR (    PPP.CONCURRENT_REQUEST_ID IS NOT NULL
                      AND NVL (ACT.HIDE_DURING_CONC, 0) = 0))
    ORDER BY STP.SEQUENCE, ACT.SEQUENCE;

    >>>>>>>>>>>>>>>>>

    /* Formatted on 12/29/2022 2:21:47 PM (QP5 v5.391) */
CREATE OR REPLACE FORCE VIEW HCM7_DEV.PCM_STEPS_V
(
    STEP_ID,
    STEP_NAME,
    SEQUENCE,
    ACTIVE,
    ENTITY_ID
)
AS
      SELECT ST.STEP_ID,
             TL.STEP_NAME,
             ST.SEQUENCE,
             ST.ACTIVE,
             ST.ENTITY_ID
        FROM PCM_STEPS_T ST, PCM_STEPS_TL TL
       WHERE     ACTIVE = 1
             AND ST.STEP_ID = TL.STEP_ID
             AND TL.LANGUAGE = GN_GLOBAL_PKG.USER_LANG
    ORDER BY sequence;


/* Formatted on 1/2/2023 12:49:52 PM (QP5 v5.294) */
CREATE OR REPLACE FORCE VIEW HCM7_DEV.PCM_STEPS_V
(
   STEP_ID,
   STEP_NAME,
   SEQUENCE,
   ACTIVE,
   ENTITY_ID
)
AS
     SELECT ST.STEP_ID,
            TL.STEP_NAME,
            ST.SEQUENCE,
            ST.ACTIVE,
            ST.ENTITY_ID
       FROM PCM_STEPS_T ST, PCM_STEPS_TL TL
      WHERE     ACTIVE = 1
            AND ST.STEP_ID = TL.STEP_ID AND  ST.ENTITY_ID = TL.ENTITY_ID 
            AND TL.LANGUAGE = GN_GLOBAL_PKG.USER_LANG
   ORDER BY sequence;

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> hazem functions


CREATE OR REPLACE FORCE VIEW GN_MAIN_MENU_FUNCTIONS_V
(
   RCD_ID,
   MAIN_MENU_ID,
   FUNCTION_ID,
   FUNCTION_NAME,
   DISPLAY_SEQUENCE,
   ACCESS_TYPE,
   ACCESS_TYPE_DESC,
   SELECTED,
   ACTIVE,
   ADF_FLAG,
   MAIN_MENU_NAME,
   TYPE,
   SYSTEM_FLAG,
   MAIN_MENU_ICON,
   FUNCTION_ICON,
   FUNCTION_ADF_FLAG
)
AS
     SELECT RCD_ID,
            MF.MAIN_MENU_ID,
            MF.FUNCTION_ID,
            NVL (
               GN_TRANSLATION_PKG.DECODE_GN_FUNCTIONS_NAME_TL (MF.FUNCTION_ID),
               (SELECT FUNCTION_NAME
                  FROM GN_FUNCTIONS_T
                 WHERE FUNCTION_ID = MF.FUNCTION_ID))
               FUNCTION_NAME,
            DISPLAY_SEQUENCE,
            MF.ACCESS_TYPE,
            HR_GENERAL_PKG.DECODE_LOOKUP ('GN_FUNCTIONS_ACCESS_TYPES',
                                          MF.ACCESS_TYPE)
               ACCESS_TYPE_DESC,
            'N' SELECTED,
            ACTIVE,
            (SELECT ADF_FLAG
               FROM GN_MAIN_MENUS_T
              WHERE MAIN_MENU_ID = MF.MAIN_MENU_ID)
               ADF_FLAG,
            NVL (
               GN_TRANSLATION_PKG.DECODE_GN_MAIN_MENU_NAME_TL (MF.MAIN_MENU_ID),
               (SELECT MAIN_MENU_NAME
                  FROM GN_MAIN_MENUS_T
                 WHERE MAIN_MENU_ID = MF.MAIN_MENU_ID))
               MAIN_MENU_NAME,
            FT.TYPE,
            SYSTEM_FLAG,
            (SELECT MENU_ICON
               FROM GN_MAIN_MENUS_T
              WHERE MAIN_MENU_ID = MF.MAIN_MENU_ID)
               MAIN_MENU_ICON,
            FT.FUNCTION_ICON,
            FT.ADF_FLAG
       FROM GN_MAIN_MENU_FUNCTIONS_T MF, GN_FUNCTIONS_T FT
      WHERE MF.FUNCTION_ID = FT.FUNCTION_ID
   ORDER BY MF.MAIN_MENU_ID;

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 
