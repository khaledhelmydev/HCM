--> update SS_GENRAL_API.SS_PROFILE_NAME_TAB_T_DML 
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
