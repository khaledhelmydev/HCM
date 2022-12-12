BEGIN 
    Insert into GN_LIST_OF_VALUES_T
    ( LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
        LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
        LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
        LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
    Values
    ( 'HR_CURRENCEY_VS', 'I', '1=1', 3, 
        'LOOKUP_CODE', 'MEANING', 'ENTITY_ID', NULL, NULL, 
        '(SELECT GV.LOOKUP_CODE AS LOOKUP_CODE,
        GV.MEANING     AS MEANING,
        HE.ENTITY_ID   AS ENTITY_ID
    FROM GN_LOOKUP_VALUES_VS GV, HR_ENTITIES_T HE
    WHERE GV.LOOKUP_CODE = HE.CURRENCY_CODE AND LOOKUP_TYPE = ''HR_CURRENCIES'')', 1, 17, TO_DATE('11/17/2022 8:18:39 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, 
        TO_DATE('11/17/2022 8:25:33 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
    Insert into GN_LIST_OF_VALUES_T
    (LOV_ID, LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
        LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
        LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
        LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
    Values
    (808, 'FORMULA_ED_VS', 'i', ' ACTIVE = ''A''             
    AND UPPER(FORMULA_TYPE)=UPPER(''payroll'')  ', 2, 
        'FORMULA_ID', 'FORMULA_NAME', NULL, NULL, NULL, 
        'PAY_FORMULAS_V', NULL, 17, TO_DATE('11/17/2022 7:09:32 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, 
        TO_DATE('11/17/2022 7:10:44 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
COMMIT;
END;

**************************************** SABER ***************************************
 Insert into GN_LIST_OF_VALUES_T
   (LOV_ID, LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
    LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
    LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
    LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
 Values
   (815, 'FORMULAS_PRCSROLES_VS', 'I', '1=1', 3, 
    'FORMULA_ID', 'FORMULA_NAME', 'ENTITY_ID', NULL, NULL, 
    '(SELECT FORMULA_ID, FORMULA_NAME,ENTITY_ID 
FROM PAY_FORMULAS_V 
WHERE ACTIVE IN (''A'', ''1'') 
AND FORMULA_TYPE IN (''Payroll'', ''Time Calculation'') 
ORDER BY FORMULA_NAME ASC)', 1, -1, TO_DATE('11/23/2022 3:40:17 PM', 'MM/DD/YYYY HH:MI:SS AM'), -1, 
    TO_DATE('11/23/2022 3:42:27 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
COMMIT;
**************************************** SABER ***************************************
 Insert into GN_LIST_OF_VALUES_T
   (LOV_ID, LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
    LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
    LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
    LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
 Values
   (811, 'HR_ALL_ORG_VS', 'I', '1=1', 3, 
    'ORGANIZATION_ID', 'ORGANIZATION_NAME', 'ENTITY_ID', NULL, NULL, 
    'HR_ORGANIZATIONS_V_A', NULL, -1, TO_DATE('11/22/2022 2:06:03 PM', 'MM/DD/YYYY HH:MI:SS AM'), -1, 
    TO_DATE('11/22/2022 2:06:03 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
 
Insert into GN_LIST_OF_VALUES_T
   (LOV_ID, LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
    LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
    LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
    LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
 Values
   (812, 'HR_PAY_BASES_VS', 'I', '1=1', 3, 
    'PAY_BASIS_ID', 'PAY_BASIS_NAME', 'ENTITY_ID', NULL, NULL, 
    'HR_PAY_BASES_V', NULL, -1, TO_DATE('11/22/2022 2:26:40 PM', 'MM/DD/YYYY HH:MI:SS AM'), -1, 
    TO_DATE('11/22/2022 2:35:19 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
COMMIT;



Insert into GN_LIST_OF_VALUES_T
   (LOV_ID, LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
    LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
    LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
    LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
 Values
   (805, 'FORMULAS_ABS_VS', 'I', ' ACTIVE = ''A''             
 AND FORMULA_TYPE=''Absence Validation''  ', 3, 
    'FORMULA_ID', 'FORMULA_NAME', 'ENTITY_ID', NULL, NULL, 
    'PAY_FORMULAS_V', NULL, -1, TO_DATE('11/16/2022 5:28:37 PM', 'MM/DD/YYYY HH:MI:SS AM'), -1, 
    TO_DATE('11/16/2022 7:41:50 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
COMMIT;

**************************************** SABER ***************************************
Insert into GN_LIST_OF_VALUES_T
   (LOV_ID, LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
    LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
    LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
    LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
 Values
   (903, 'HR_ELEMENT_TYPES_VS', 'I', '1=1', 3, 
    'ELEMENT_TYPE_ID', 'ELEMENT_NAME', 'ENTITY_ID', NULL, NULL, 
    'PAY_ELEMENT_TYPES_V', NULL, -1, TO_DATE('11/27/2022 7:22:12 PM', 'MM/DD/YYYY HH:MI:SS AM'), -1, 
    TO_DATE('11/27/2022 7:22:12 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
COMMIT;

   1/12 ************************************ SABER ***************************************
 Insert into GN_LIST_OF_VALUES_T
   (LOV_ID, LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
    LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
    LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
    LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
 Values
   (813, 'LOOKUPS_TYPS_VS', 'I', '1=1', 2, 
    'LOOKUP_TYPE', 'DESCRIPTION ', NULL, NULL, NULL, 
    'GN_LOOKUP_TYPES_V', 1, -1, TO_DATE('11/22/2022 5:10:24 PM', 'MM/DD/YYYY HH:MI:SS AM'), -1, 
    TO_DATE('11/22/2022 5:12:11 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
COMMIT;

   1/12 ************************************ SABER ***************************************
Insert into GN_LIST_OF_VALUES_T
   (LOV_ID, LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
    LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
    LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
    LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
 Values
   (814, 'FORMULAS_INPUTS_VS', 'I', ' ACTIVE = ''A''             
 AND FORMULA_TYPE=''Input Value''  ', 3, 
    'FORMULA_ID', 'FORMULA_NAME', 'ENTITY_ID', NULL, NULL, 
    'PAY_FORMULAS_V', NULL, -1, TO_DATE('11/22/2022 5:38:03 PM', 'MM/DD/YYYY HH:MI:SS AM'), -1, 
    TO_DATE('11/22/2022 5:38:03 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
COMMIT;


   1/12 ************************************ SABER ***************************************
 Insert into GN_LIST_OF_VALUES_T
   (LOV_ID, LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
    LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
    LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
    LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
 Values
   (817, 'OUTPUT_NAMES_PRC_RULES_VS', 'I', '1=1', 3, 
    'OUTPUT_ID', 'OUTPUT_VARIABLE_NAME', 'FORMULA_ID', NULL, NULL, 
    '(SELECT     
OUTPUT_ID,OUTPUT_VARIABLE_NAME,FORMULA_ID    
FROM PAY_FORMULA_OUTPUTS_T    
ORDER BY DISPLAY_SEQUENCE ASC)', 1, -1, TO_DATE('11/23/2022 6:46:02 PM', 'MM/DD/YYYY HH:MI:SS AM'), -1, 
    TO_DATE('11/23/2022 6:47:52 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
COMMIT;

   1/12 ************************************ SABER ***************************************
 Insert into GN_LIST_OF_VALUES_T
   (LOV_ID, LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
    LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
    LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
    LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
 Values
   (816, 'ELEMENT_NAMES_PRCROLES_VS', 'I', '1=1', 3, 
    'ELEMENT_TYPE_ID', 'ELEMENT_NAME', 'ENTITY_ID', NULL, NULL, 
    '(SELECT ELEMENT_TYPE_ID,   
       ELEMENT_NAME,   
        ENTITY_ID  
  FROM PAY_ELEMENT_TYPES_V             
ORDER BY ELEMENT_NAME)', 1, -1, TO_DATE('11/23/2022 6:36:42 PM', 'MM/DD/YYYY HH:MI:SS AM'), -1, 
    TO_DATE('11/23/2022 6:39:18 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
COMMIT;
   ************************************ SABER ***************************************
 Insert into GN_LIST_OF_VALUES_T
   (LOV_ID, LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
    LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
    LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
    LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
 Values
   (910, 'JOBS_VS', 'I', 'TO_DATE(''P_EFFECTIVE_DATE'',''YYYY-MM-DD'') BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE AND ENTITY_ID=P_ENTITY_ID', 2, 
    'JOB_ID', 'NAME', NULL, NULL, NULL, 
    'HR_JOBS_T', NULL, -1, TO_DATE('11/28/2022 5:47:32 PM', 'MM/DD/YYYY HH:MI:SS AM'), -1, 
    TO_DATE('11/28/2022 5:47:32 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
COMMIT;

    ************************************ SABER ***************************************
Insert into GN_LIST_OF_VALUES_T
   (LOV_ID, LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
    LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
    LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
    LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
 Values
   (1005, 'PAY_ELEMENTS_TYPES_VS', 'I', '1=1', 3, 
    'ELEMENT_TYPE_ID', 'ELEMENT_NAME', 'ENTITY_ID', NULL, NULL, 
    '(SELECT       
Distinct PETT.ELEMENT_NAME  ,    
PETT.ELEMENT_TYPE_ID,   
PETT.ENTITY_ID  
FROM PAY_ELEMENT_TYPES_T PETT   , PAY_ELEMENT_ENTRIES_T PEET  
where  PETT.ELEMENT_TYPE_ID =  PEET.ELEMENT_TYPE_ID  
AND NVL(RETROPAY,''N'') = ''N''  
ORDER BY 2)', NULL, -1, TO_DATE('11/23/2022 4:15:20 PM', 'MM/DD/YYYY HH:MI:SS AM'), -1, 
    TO_DATE('11/23/2022 4:15:20 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
COMMIT;
    ************************************ SABER ***************************************
SET DEFINE OFF;
Insert into GN_LIST_OF_VALUES_T
   (LOV_ID, LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
    LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
    LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
    LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
 Values
   (1006, 'PAY_EVENTS_TYPES_VS', 'I', 'LOOKUP_TYPE=''PAY_EVENTS_TYPES''', 2, 
    'MEANING', 'MEANING', NULL, NULL, NULL, 
    'GN_LOOKUP_VALUES_VS', NULL, 17, TO_DATE('11/24/2022 6:56:22 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, 
    TO_DATE('11/24/2022 6:58:57 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
COMMIT;

    ************************************ M.ibrahem ***************************************
UPDATE GN_LIST_OF_VALUES_T
SET LOV_QUERY = 'ENABLE_FLAG=''Y'''
WHERE LOV_NAME='AMS_ABSENCE_REASON_VS';
COMMIT;

    ************************************ M.ibrahem ***************************************
Insert into GN_LIST_OF_VALUES_T
   (LOV_ID, LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
    LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
    LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
    LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
 Values
   (905, 'HR_GRADES_VS', 'I', 'TO_DATE(''P_EFFECTIVE_DATE'',''YYYY-MM-DD'') BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE AND ENTITY_ID=P_ENTITY_ID', 2, 
    'GRADE_ID', 'GRADE_NAME', NULL, NULL, NULL, 
    'HR_GRADES_V_A', NULL, -1, TO_DATE('11/28/2022 5:16:14 PM', 'MM/DD/YYYY HH:MI:SS AM'), -1, 
    TO_DATE('11/28/2022 5:35:41 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
COMMIT;


Insert into GN_LIST_OF_VALUES_T
   (LOV_ID, LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
    LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
    LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
    LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
 Values
   (906, 'LOCATIONS_VS', 'I', 'TO_DATE(''P_EFFECTIVE_DATE'',''YYYY-MM-DD'') BETWEEN EFFECTIVE_START_DATE AND EFFECTIVE_END_DATE AND ENTITY_ID=P_ENTITY_ID', 2, 
    'LOCATION_ID', 'LOCATION_NAME', NULL, NULL, NULL, 
    'HR_LOCATIONS_V', NULL, -1, TO_DATE('11/28/2022 5:40:09 PM', 'MM/DD/YYYY HH:MI:SS AM'), -1, 
    TO_DATE('11/28/2022 5:40:09 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
COMMIT;

Insert into GN_LIST_OF_VALUES_T
   (LOV_ID, LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
    LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
    LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
    LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
 Values
   (908, 'NEW_ORGANIZATIONS_VS', 'I', 'TO_DATE(''P_EFFECTIVE_DATE'',''YYYY-MM-DD'') BETWEEN t.EFFECTIVE_START_DATE AND t.EFFECTIVE_END_DATE AND t.ENTITY_ID=P_ENTITY_ID AND TL.LANGUAGE = GN_GLOBAL_PKG.USER_LANG
AND T.TYPE_CODE NOT IN (''BG'',''BU'',''LE'',''HCM_PSU'', ''HCM_LEMP'', ''FUN_BUSINESS_UNIT'')', 2, 
    'tl.ORGANIZATION_ID', 'tl.ORGANIZATION_NAME', NULL, NULL, NULL, 
    'HR_ORGANIZATIONS_TL TL left join HR_ORGANIZATIONS_T T on TL.ORGANIZATION_ID = T.ORGANIZATION_ID ', NULL, -1, TO_DATE('11/28/2022 5:57:11 PM', 'MM/DD/YYYY HH:MI:SS AM'), -1, 
    TO_DATE('11/28/2022 6:03:24 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
COMMIT;

    ************************************ M.ibrahem ***************************************

UPDATE GN_LIST_OF_VALUES_T
SET LOV_COL2 = 'nvl(GN_GLOBAL_PKG.GET_FULLNAME (PERSON_ID),USER_NAME)'
WHERE LOV_NAME='USERS_VS';
COMMIT;


    ************************************ M.ibrahem ***************************************

UPDATE GN_LIST_OF_VALUES_T  SET LOV_QUERY='TYPE_CODE=''BU''
AND ENTITY_ID =P_ENTITY_ID' WHERE LOV_NAME='HR_LEGAL_EMPLOYERS_VS';
COMMIT;

UPDATE GN_LIST_OF_VALUES_T  SET LOV_NAME='ISG_BUSINESS_UNIT_NAMES_VS' WHERE LOV_NAME='ISG_BUSINESS_UNIT_NAME'


Insert into GN_LIST_OF_VALUES_T
   (LOV_ID, LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
    LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
    LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
    LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
 Values
   (910, 'EMPLOYEE_ASSIGNMENT_PAYROLL_VS', 'I', 'ENTITY_ID = P_ENTITY_ID
AND PAYROLL_ID = P_PAYROLL_ID
ORDER BY FULL_NAME', 3, 
    'ASSIGNMENT_ID', 'EMPLOYEE_NUMBER || '' '' || FULL_NAME', 'ENTITY_ID', NULL, NULL, 
    'HR_QUICK_PERSONS_V', 1, -1, TO_DATE('12/11/2022 4:13:44 PM', 'MM/DD/YYYY HH:MI:SS AM'), -1, 
    TO_DATE('12/11/2022 4:14:13 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
COMMIT;



>>>>>>>>>>>>>>>>>>>>

Insert into GN_LIST_OF_VALUES_T
   (LOV_ID, LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
    LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
    LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
    LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
 Values
   (911, 'HR_FILTERED_ORGANIZATIONS_VS', 'I', 'entity_id = P_ENTITY_ID AND ( ((MASTER_ORG = P_LEGAL_EMPLOYER)
           AND (UPPER (HR_ORGANIZATION_TREE) = UPPER (''on'')))
       OR (    (MASTER_ORG IS NULL)
           AND (UPPER (HR_ORGANIZATION_TREE) = UPPER (''off''))))', 2, 
    'organization_id', 'organization_name', NULL, NULL, NULL, 
    'HR_FILTERED_ORGANIZATIONS_V', NULL, 17, TO_DATE('12/12/2022 1:32:55 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, 
    TO_DATE('12/12/2022 1:45:29 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
COMMIT;



>>>>>>>>>>>>>>>


Insert into GN_LIST_OF_VALUES_T
   (LOV_ID, LOV_NAME, LOV_TYPE, LOV_QUERY, NO_OF_COL, 
    LOV_COL1, LOV_COL2, LOV_COL3, LOV_COL4, LOV_COL5, 
    LOV_TABLE, SITE_ID, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, 
    LAST_UPDATE_DATE, ACTIVE, ADF_FLAG, SORT_VALUE, CUSTOMIZATION_LEVEL)
 Values
   (912, 'HR_JOBS_GROUP_VS', 'I', '1=1', 2, 
    'GROUP_ID', 'GROUP_NAME', NULL, NULL, NULL, 
    'HR_JOBS_GROUP_T', NULL, -1, TO_DATE('12/12/2022 3:00:22 PM', 'MM/DD/YYYY HH:MI:SS AM'), -1, 
    TO_DATE('12/12/2022 3:00:22 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, 'Y', 'M', 'S');
COMMIT;
