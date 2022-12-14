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



 