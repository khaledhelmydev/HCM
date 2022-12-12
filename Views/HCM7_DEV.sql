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

>>>>>>>>>>



