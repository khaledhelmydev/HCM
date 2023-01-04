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


>>>>>>>>>>>>>>>>>>>>>>> hazem

TAT_GENERAL_API.TAT_SCHEDULES_DEFINTION_T_DML >>>> update line 832 

    DATE_TO = DATE_TO, replaced by     DATE_TO = P_DATE_TO

>>>>>>>>>>>>>>>>>>

-- ADD  TRANSFER_STEPS_ENTITIES IN PCM_GENERAL_API

 PROCEDURE TRANSFER_STEPS_ENTITIES
 IS
   V_DUPLICATE_FLAG   VARCHAR2 (1) := 'N';
    L_MESSAGE VARCHAR2(1000);
     STEP_NAME varchar2(500); 
   CURSOR C_PCM_DEFAULT_ACTIONS_T (P_STEP_D VARCHAR2)
   IS
      SELECT *
        FROM PCM_DEFAULT_ACTIONS_T
       WHERE NVL (ACTIVE, 0) = 1 AND STEP_ID = P_STEP_D;
       
        CURSOR C_PCM_DEFAULT_STEPS_T 
   IS
       SELECT STEP_ID, STEP_NAME,  SEQUENCE,  ACTIVE FROM PCM_DEFAULT_STEPS_T ;

   CURSOR C_CHECK_DUPLICTE (P_ENTITY_ID VARCHAR2, P_STEP_ID VARCHAR2)
   IS
      SELECT 'Y'
        FROM PCM_STEPS_T
       WHERE STEP_ID = P_STEP_ID AND ENTITY_ID = P_ENTITY_ID;

   CURSOR ENTITIES_RECS
   IS
      SELECT ENTITY_ID FROM HR_ENTITIES_T;
BEGIN
   FOR REC IN ENTITIES_RECS
   LOOP
      FOR ITEM IN C_PCM_DEFAULT_STEPS_T
      LOOP
      V_DUPLICATE_FLAG:='N';
         OPEN C_CHECK_DUPLICTE (REC.ENTITY_ID, ITEM.STEP_ID);

         FETCH C_CHECK_DUPLICTE INTO V_DUPLICATE_FLAG;

         CLOSE C_CHECK_DUPLICTE;
 
         IF V_DUPLICATE_FLAG <> 'Y'
         THEN
          STEP_NAME:=ITEM.STEP_NAME;
            INSERT INTO PCM_STEPS_T (STEP_ID,
                                     STEP_NAME,
                                     SEQUENCE,
                                     ACTIVE,
                                     ENTITY_ID)
                 VALUES (ITEM.STEP_ID,
                         STEP_NAME,
                         ITEM.SEQUENCE,
                         ITEM.ACTIVE,
                         REC.ENTITY_ID); 
            FOR ACTION_REC IN C_PCM_DEFAULT_ACTIONS_T(ITEM.STEP_ID)
            LOOP
               INSERT INTO PCM_ACTIONS_T (ACTION_NAME,
                                          ACTIVE,
                                          STEP_ID,
                                          SEQUENCE,
                                          VISIBLE_ACTIONS_IDS,
                                          CURRENT_STEP_STATUS,
                                          ACTION,
                                          ACTION_CODE,
                                          CONCURRENT_PROGRAM_ID,
                                          ENTITY_ID)
                    VALUES (ACTION_REC.ACTION_NAME,
                            ACTION_REC.ACTIVE,
                            ACTION_REC.STEP_ID,
                            ACTION_REC.SEQUENCE,
                            ACTION_REC.VISIBLE_ACTIONS_IDS,
                            ACTION_REC.CURRENT_STEP_STATUS,
                            ACTION_REC.ACTION,
                            ACTION_REC.ACTION_CODE,
                            ACTION_REC.CONCURRENT_PROGRAM_ID,
                            REC.ENTITY_ID);
                             COMMIT;
            END LOOP;
         END IF;
      END LOOP;
   END LOOP;
  
 EXCEPTION
   WHEN OTHERS
   THEN
   L_MESSAGE := (
    SQLERRM || CHR (10) || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE ()
);
 DBMS_OUTPUT.PUT_LINE(L_MESSAGE);
 END TRANSFER_STEPS_ENTITIES;

 **********************
>>In  PCM_GENERAL_API
 PROCEDURE TRANSFER_STEPS_BY_ENTITY(P_ENTITY_ID VARCHAR2)
 IS
   V_DUPLICATE_FLAG   VARCHAR2 (1) := 'N';
    L_MESSAGE VARCHAR2(1000);
     STEP_NAME varchar2(500); 
   CURSOR C_PCM_DEFAULT_ACTIONS_T (P_STEP_D VARCHAR2)
   IS
      SELECT *
        FROM PCM_DEFAULT_ACTIONS_T
       WHERE NVL (ACTIVE, 0) = 1 AND STEP_ID = P_STEP_D;
       
  CURSOR C_PCM_DEFAULT_STEPS_T 
   IS
   SELECT STEP_ID, STEP_NAME,  SEQUENCE,  ACTIVE FROM PCM_DEFAULT_STEPS_T ;

   CURSOR C_CHECK_DUPLICTE (P_STEP_ID VARCHAR2)
   IS
      SELECT 'Y'
        FROM PCM_STEPS_T
       WHERE STEP_ID = P_STEP_ID AND ENTITY_ID = P_ENTITY_ID;
    CURSOR ENTITIES_RECS
   IS
      SELECT ENTITY_ID FROM HR_ENTITIES_T WHERE ENTITY_ID=P_ENTITY_ID;
    BEGIN
       FOR REC IN ENTITIES_RECS
       LOOP
    FOR ITEM IN C_PCM_DEFAULT_STEPS_T
      LOOP
      V_DUPLICATE_FLAG:='N';
      
         OPEN C_CHECK_DUPLICTE (ITEM.STEP_ID);
         FETCH C_CHECK_DUPLICTE INTO V_DUPLICATE_FLAG;
         CLOSE C_CHECK_DUPLICTE;
 
         IF V_DUPLICATE_FLAG <> 'Y'
         THEN
          STEP_NAME:=ITEM.STEP_NAME;
            INSERT INTO PCM_STEPS_TL (STEP_ID,
                                     STEP_NAME,
                                     SEQUENCE,
                                     ACTIVE,
                                     ENTITY_ID)
                 VALUES (ITEM.STEP_ID,
                         STEP_NAME,
                         ITEM.SEQUENCE,
                         ITEM.ACTIVE,
                         P_ENTITY_ID); 
            FOR ACTION_REC IN C_PCM_DEFAULT_ACTIONS_T(ITEM.STEP_ID)
            LOOP
               INSERT INTO PCM_ACTIONS_T (ACTION_NAME,
                                          ACTIVE,
                                          STEP_ID,
                                          SEQUENCE,
                                          VISIBLE_ACTIONS_IDS,
                                          CURRENT_STEP_STATUS,
                                          ACTION,
                                          ACTION_CODE,
                                          CONCURRENT_PROGRAM_ID,
                                          ENTITY_ID)
                    VALUES (ACTION_REC.ACTION_NAME,
                            ACTION_REC.ACTIVE,
                            ACTION_REC.STEP_ID,
                            ACTION_REC.SEQUENCE,
                            ACTION_REC.VISIBLE_ACTIONS_IDS,
                            ACTION_REC.CURRENT_STEP_STATUS,
                            ACTION_REC.ACTION,
                            ACTION_REC.ACTION_CODE,
                            ACTION_REC.CONCURRENT_PROGRAM_ID,
                            P_ENTITY_ID);
                             COMMIT;
            END LOOP;
         END IF;
      END LOOP;
 END LOOP;
 
 EXCEPTION
   WHEN OTHERS
   THEN
   L_MESSAGE := (
    SQLERRM || CHR (10) || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE ()
);
 DBMS_OUTPUT.PUT_LINE(L_MESSAGE);
 END TRANSFER_STEPS_BY_ENTITY;

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> hazem functions

GN_GENERAL_API.GN_FUNCTIONS_T_DML  update line 50

  WHERE     FUNCTION_NAME = P_FUNCTION_NAME AND TYPE=P_TYPE  AND ADF_FLAG =P_ADF_FLAG

>>>>>>>>>>>>>>>>>>>>>>>
 **********************
>>In  PCM_GENERAL_API
update HR_WORK_STRUCTURE_API.BUSINESS_GROUP_SETUP
