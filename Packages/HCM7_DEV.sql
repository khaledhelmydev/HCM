--> update GN_GENERAL_API.GN_USERS_T_DML 
--> Add GN_TRANSLATION_API.PAY_ELEMENT_TYPES_JSON_TL 
--> Add GN_TRANSLATION_API.PAY_ELEMENT_TYPES_TL_DML 
--> update GN_SESSION_PKG.INIT_SESSION_FULL_INFO
--> Add GN_TRANSLATION_API.AMS_ABSENCE_MGT_HEADER_TL_DML 
--> Add GN_TRANSLATION_API.ABSENCE_TYPE_JSON_TL 
--> Add GN_TRANSLATION_API.AMS_ABSENCE_MGT_REASONS_TL_DML 
--> Add GN_TRANSLATION_API.AMS_ABSENCE_REASON_JSON_TL 
--> Add GN_TRANSLATION_API.PAY_BALANCE_TYPES_TL_DML 
--> Add GN_TRANSLATION_API.PAY_BALANCE_TYPE_JSON_TL 
--> Add GN_TRANSLATION_PKG.DECODE_AMS_ABSENCE_HEADER_TL 
--> Add GN_TRANSLATION_API.AMS_ACCRUAL_PLANS_TL_DML     
--> Add GN_TRANSLATION_API.AMS_ACCRUAL_PLANS_JSON_TL     
--> Add GN_TRANSLATION_PKG.DECODE_AMS_ACCRUAL_PLANS_TL 
--> update GN_GENERAL_API.GN_LOOKUP_TYPES_T_DML
--> update PAY_GENERAL_API.PAY_BANK_BRANCHES_T_DML


-->>  add  IS_SERVICE_ALLOWED  in GN_GLOBAL_PKG

FUNCTION IS_SERVICE_ALLOWED (P_SERVICE_NAME VARCHAR2)
   RETURN VARCHAR2
IS
   V_SERVICE_ALLOWED   VARCHAR2 (100) :='N';

   CURSOR C_SERVICE_ALLOWED
   IS
      SELECT 'Y'
        FROM GN_FUNCTIONS_T
       WHERE     ACTION = P_SERVICE_NAME
             AND (   FUNCTION_ID IN
                        (SELECT DISTINCT FUNCTION_ID
                           FROM GN_PRIV_GROUPS_FUNCTIONS_T
                          WHERE GRP_ID IN
                                   (SELECT DISTINCT GRP_ID
                                      FROM GN_USERS_PRIV_T
                                     WHERE     USER_ID =
                                                  GN_GLOBAL_PKG.USER_ID
                                           AND TRUNC (SYSDATE) BETWEEN EFFECTIVE_START_DATE
                                                                   AND EFFECTIVE_END_DATE))
                  OR PARENT_FUNCTION_ID IN
                        (SELECT DISTINCT FUNCTION_ID
                           FROM GN_PRIV_GROUPS_FUNCTIONS_T
                          WHERE GRP_ID IN
                                   (SELECT DISTINCT GRP_ID
                                      FROM GN_USERS_PRIV_T
                                     WHERE     USER_ID =
                                                  GN_GLOBAL_PKG.USER_ID
                                           AND TRUNC (SYSDATE) BETWEEN EFFECTIVE_START_DATE
                                                                   AND EFFECTIVE_END_DATE)));
BEGIN
   OPEN C_SERVICE_ALLOWED;

   FETCH C_SERVICE_ALLOWED INTO V_SERVICE_ALLOWED;

   CLOSE C_SERVICE_ALLOWED;

   RETURN V_SERVICE_ALLOWED;
END;

->>>>>>>>>>>>>>>
--> GN_SESSION_PKG.INIT_SESSION_FULL_INFO
--> GN_SESSION_PKG.SET_SESSION_ID
--> GN_GLOBAL_PKG.IS_SERVICE_ALLOWED

--------->
 GN_SESSION_PKG.INIT_SESSION_FULL_INFO   comment this part in
      CURSOR USER_CUR
        AND SYSDATE BETWEEN UT.EFFECTIVE_START_DATE
                                 AND UT.EFFECTIVE_END_DATE)
->>>>>>>>>>>>>>>

remove to_date function from below part
 GN_SESSION_PKG.SET_SESSION_VARIABLE  

IF P_NAME = 'EFFECTIVE_DATE'
      THEN
         UPDATE GN_SESSIONS_T
            SET EFFECTIVE_DATE = 
--            TO_DATE (
            P_VALUE
--            , 'dd-MM-yyyy')
          WHERE SESSION_ID = G_SESSION_ID;

->>>>>>>>>>>>>>>>


update 
HR_WORK_STRUCTURE_API.HR_ORGANIZATIONS_T_DML add CONCATENATED_SEGMENTS Field in insert query 
->>>>>>>>>>>>>>>>


--> update SS_GENRAL_API.SS_PROFILE_NAME_TAB_T_DML 

--->>>>>>>>>>>>>>>>>>>>>>>>>>.update 

HR_GENERAL_API.HR_PEOPLE_GROUPS_T_DML >>  LINE  8942
replace cursor CR query with new one below

      SELECT ROWNUM NUM, AB.COLUMN_NAME
           FROM (  SELECT COLUMN_NAME
                     FROM GN_FLEX_SEGMENTS_T GFS, GN_FLEX_STRUCTURES_T GFT
                    WHERE     GFS.FLEX_HEADER_ID = GFT.FLEX_HEADER_ID
                          AND GFT.ENTITY_ID = P_ENTITY_ID
                          AND FLEX_STRUCTURE_TYPE = 'PEOPLE_GROUP'  AND GFS.ASSIGNMENT_Q ='Y'
                 ORDER BY SEGMENT_NUM) AB;

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.

---- create PCM_GENERAL_API.PCM_ENTITTY_STEPS_T_DML

