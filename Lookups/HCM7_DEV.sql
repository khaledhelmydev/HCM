SELECT   * from HR_persons_T  where 1 = 1  ORDER by person_id 

UPDATE GN_LOOKUP_VALUES_T SET EFFECTIVE_END_DATE = TO_DATE('31/12/4712','DD/MM/YYYY') WHERE LOOKUP_TYPE ='BALADIYA_CATEGORIES'; commit;
UPDATE  GN_LOOKUP_TYPES_T  SET CUSTOMIZATION_LEVEL ='S' WHERE LOOKUP_TYPE ='HR_TICKET_STATUS'; commit; 
UPDATE  GN_LOOKUP_TYPES_T  SET CUSTOMIZATION_LEVEL ='S' WHERE LOOKUP_TYPE ='HR_TICKET_TYPE'; commit; 
UPDATE  GN_LOOKUP_TYPES_T  SET CUSTOMIZATION_LEVEL ='S' WHERE LOOKUP_TYPE ='HR_TICKET_CLASS'; commit; 

>>>>>>>>>>>>>>>>>
BEGIN  GN_GENERAL_API.GN_LOOKUP_TYPES_T_JSON_DML('[{"LOOKUP_TYPE":"PAYROLL_TYPES","APPLICATION_CODE":"GN","DESCRIPTION":"","CUSTOMIZATION_LEVEL":"S","copyAsLov":"N","DELETE_FLAG":"N"}]', :1 ,:2); end;

BEGIN GN_GENERAL_API.GN_LOOKUP_VALUES_T_JSON_DML('PAYROLL_TYPES','[{"LOOKUP_CODE":"R","DESCRIPTION":"","MEANING":"Payroll Cycle","ENABLED_FLAG":"1","TAG":"","EFFECTIVE_START_DATE":"01-12-2022","EFFECTIVE_END_DATE":"31-12-4712","DELETE_FLAG":"N"}]',:1,:2);COMMIT;END;
 BEGIN GN_GENERAL_API.GN_LOOKUP_VALUES_T_JSON_DML('PAYROLL_TYPES','[{"LOOKUP_CODE":"Q","DESCRIPTION":"","MEANING":"Quick Pay Cycle","ENABLED_FLAG":"1","TAG":"","EFFECTIVE_START_DATE":"08-12-2022","EFFECTIVE_END_DATE":"31-12-4712","DELETE_FLAG":"N"}]',:1,:2);COMMIT;END;
>>>>>>>>>>>>>>>>>

Insert into GN_LOOKUP_TYPES_T
   (LOOKUP_TYPE, DESCRIPTION, CUSTOMIZATION_LEVEL, APPLICATION_CODE, CREATED_BY, 
    CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE, ENTITY_ID, SITE_ID)
 Values
   ('GN_FEEDS_SCAL', NULL, 'S', 'GN', 17, 
    TO_DATE('11/28/2022 4:30:04 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/28/2022 4:30:04 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, NULL);
Insert into GN_LOOKUP_TYPES_T
   (LOOKUP_TYPE, DESCRIPTION, CUSTOMIZATION_LEVEL, APPLICATION_CODE, CREATED_BY, 
    CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE, ENTITY_ID, SITE_ID)

   ('GENERATION_METHODS', NULL, 'S', 'GN', 17, 
    TO_DATE('11/14/2022 4:20:13 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 4:20:13 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, NULL);
>>>>>>> Stashed changes
Insert into GN_LOOKUP_VALUES_T
   (LOOKUP_TYPE, LOOKUP_CODE, ENABLED_FLAG, TAG, EFFECTIVE_START_DATE, 
    EFFECTIVE_END_DATE, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE, 
    ENTITY_ID, SITE_ID)
 Values
   ('GN_FEEDS_SCAL', '1', '0', NULL, TO_DATE('11/1/2022', 'MM/DD/YYYY'), 
    TO_DATE('12/31/4712', 'MM/DD/YYYY'), 17, TO_DATE('11/28/2022 4:30:29 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/28/2022 4:30:29 PM', 'MM/DD/YYYY HH:MI:SS AM'),  NULL, NULL);
   Insert into GN_LOOKUP_VALUES_T
   (LOOKUP_TYPE, LOOKUP_CODE, ENABLED_FLAG, TAG, EFFECTIVE_START_DATE, 
    EFFECTIVE_END_DATE, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE, 
    ENTITY_ID, SITE_ID)
    Values
    ('GENERATION_METHODS', 'P', '1', NULL, TO_DATE('11/1/2022', 'MM/DD/YYYY'), 
    TO_DATE('12/31/4712', 'MM/DD/YYYY'), 17, TO_DATE('11/14/2022 4:21:31 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 4:21:31 PM', 'MM/DD/YYYY HH:MI:SS AM'), 
    NULL, NULL);
Insert into GN_LOOKUP_VALUES_T
   (LOOKUP_TYPE, LOOKUP_CODE, ENABLED_FLAG, TAG, EFFECTIVE_START_DATE, 
    EFFECTIVE_END_DATE, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE, 
    ENTITY_ID, SITE_ID)
 Values
   ('GN_FEEDS_SCAL', '-1', '0', NULL, TO_DATE('11/1/2022', 'MM/DD/YYYY'), 
    TO_DATE('12/31/4712', 'MM/DD/YYYY'), 17, TO_DATE('11/28/2022 4:31:12 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/28/2022 4:31:12 PM', 'MM/DD/YYYY HH:MI:SS AM'), 
    NULL, NULL);
Insert into GN_LOOKUP_VALUES_T
   (LOOKUP_TYPE, LOOKUP_CODE, ENABLED_FLAG, TAG, EFFECTIVE_START_DATE, 
    EFFECTIVE_END_DATE, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE, 
    ENTITY_ID, SITE_ID)
 Values
   ('GENERATION_METHODS', 'B', '1', NULL, TO_DATE('11/1/2022', 'MM/DD/YYYY'), 
    TO_DATE('12/31/4712', 'MM/DD/YYYY'), 17, TO_DATE('11/14/2022 4:22:01 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 4:22:01 PM', 'MM/DD/YYYY HH:MI:SS AM'), 
    NULL, NULL);
>>>>>>> Stashed changes
Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values
   ('GN_FEEDS_SCAL', '1', 'Add', NULL, 'US', 
    17, TO_DATE('11/28/2022 4:30:29 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/28/2022 4:30:29 PM', 'MM/DD/YYYY HH:MI:SS AM'));
   Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values('GENERATION_METHODS', 'P', ' Parameter', NULL, 'US', 
    17, TO_DATE('11/14/2022 4:21:31 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 4:21:31 PM', 'MM/DD/YYYY HH:MI:SS AM'));
Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values
   ('GN_FEEDS_SCAL', '1', 'Add', NULL, 'AR', 
    17, TO_DATE('11/28/2022 4:30:29 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/28/2022 4:30:29 PM', 'MM/DD/YYYY HH:MI:SS AM'));
   Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values('GENERATION_METHODS', 'P', ' Parameter', NULL, 'AR', 
    17, TO_DATE('11/14/2022 4:21:31 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 4:21:31 PM', 'MM/DD/YYYY HH:MI:SS AM'));
Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values
   ('GN_FEEDS_SCAL', '1', 'Add', NULL, 'FR', 
    17, TO_DATE('11/28/2022 4:30:29 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/28/2022 4:30:29 PM', 'MM/DD/YYYY HH:MI:SS AM'));
   Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values('GENERATION_METHODS', 'P', ' Parameter', NULL, 'FR', 
    17, TO_DATE('11/14/2022 4:21:31 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 4:21:31 PM', 'MM/DD/YYYY HH:MI:SS AM'));
Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values
   ('GN_FEEDS_SCAL', '-1', 'Subtract', NULL, 'US', 
    17, TO_DATE('11/28/2022 4:31:12 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/28/2022 4:31:12 PM', 'MM/DD/YYYY HH:MI:SS AM'));
   Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values('GENERATION_METHODS', 'B', 'Batch', NULL, 'US', 
    17, TO_DATE('11/14/2022 4:22:01 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 4:22:01 PM', 'MM/DD/YYYY HH:MI:SS AM'));
Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values
   ('GN_FEEDS_SCAL', '-1', 'Subtract', NULL, 'AR', 
    17, TO_DATE('11/28/2022 4:31:12 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/28/2022 4:31:12 PM', 'MM/DD/YYYY HH:MI:SS AM'));
   Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values('GENERATION_METHODS', 'B', 'Batch', NULL, 'AR', 
    17, TO_DATE('11/14/2022 4:22:01 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 4:22:01 PM', 'MM/DD/YYYY HH:MI:SS AM'));
Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values
<<<<<<< Updated upstream
   ('GN_FEEDS_SCAL', '-1', 'Subtract', NULL, 'FR', 
    17, TO_DATE('11/28/2022 4:31:12 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/28/2022 4:31:12 PM', 'MM/DD/YYYY HH:MI:SS AM'));
COMMIT;end;

>>>>>>>>>>>>>>>>>>

=======
Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values
   ('GENERATION_METHODS', 'B', 'Batch', NULL, 'FR', 
    17, TO_DATE('11/14/2022 4:22:01 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 4:22:01 PM', 'MM/DD/YYYY HH:MI:SS AM'));
>>>>>>>>>>>>
SET DEFINE OFF;
Insert into GN_LOOKUP_TYPES_T
   (LOOKUP_TYPE, DESCRIPTION, CUSTOMIZATION_LEVEL, APPLICATION_CODE, CREATED_BY, 
    CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE, ENTITY_ID, SITE_ID)
 Values
   ('SEND_METHOD', NULL, 'S', 'GN', 17, 
    TO_DATE('11/14/2022 4:23:31 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 4:23:31 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, NULL);
COMMIT;
>>>>>>>>>>>>>>
SET DEFINE OFF;
Insert into GN_LOOKUP_VALUES_T
   (LOOKUP_TYPE, LOOKUP_CODE, ENABLED_FLAG, TAG, EFFECTIVE_START_DATE, 
    EFFECTIVE_END_DATE, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE, 
    ENTITY_ID, SITE_ID)
 Values
   ('SEND_METHOD', 'I', '1', NULL, TO_DATE('11/14/2022', 'MM/DD/YYYY'), 
    TO_DATE('12/31/4712', 'MM/DD/YYYY'), 17, TO_DATE('11/14/2022 4:25:06 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 4:25:06 PM', 'MM/DD/YYYY HH:MI:SS AM'), 
    NULL, NULL);
Insert into GN_LOOKUP_VALUES_T
   (LOOKUP_TYPE, LOOKUP_CODE, ENABLED_FLAG, TAG, EFFECTIVE_START_DATE, 
    EFFECTIVE_END_DATE, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE, 
    ENTITY_ID, SITE_ID)
 Values
   ('SEND_METHOD', 'B', '1', NULL, TO_DATE('11/1/2022', 'MM/DD/YYYY'), 
    TO_DATE('12/31/4712', 'MM/DD/YYYY'), 17, TO_DATE('11/14/2022 4:25:23 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 4:25:23 PM', 'MM/DD/YYYY HH:MI:SS AM'), 
    NULL, NULL);
COMMIT;
>>>>>>>>>>>>>>>>>
SET DEFINE OFF;
Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values
   ('SEND_METHOD', 'I', 'Individual', NULL, 'US', 
    17, TO_DATE('11/14/2022 4:25:06 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 4:25:06 PM', 'MM/DD/YYYY HH:MI:SS AM'));
Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values
   ('SEND_METHOD', 'I', 'Individual', NULL, 'AR', 
    17, TO_DATE('11/14/2022 4:25:06 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 4:25:06 PM', 'MM/DD/YYYY HH:MI:SS AM'));
Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values
   ('SEND_METHOD', 'I', 'Individual', NULL, 'FR', 
    17, TO_DATE('11/14/2022 4:25:06 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 4:25:06 PM', 'MM/DD/YYYY HH:MI:SS AM'));
Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values
   ('SEND_METHOD', 'B', 'BULK', NULL, 'US', 
    17, TO_DATE('11/14/2022 4:25:23 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 4:25:23 PM', 'MM/DD/YYYY HH:MI:SS AM'));
Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values
   ('SEND_METHOD', 'B', 'BULK', NULL, 'AR', 
    17, TO_DATE('11/14/2022 4:25:23 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 4:25:23 PM', 'MM/DD/YYYY HH:MI:SS AM'));
Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values
   ('SEND_METHOD', 'B', 'BULK', NULL, 'FR', 
    17, TO_DATE('11/14/2022 4:25:23 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 4:25:23 PM', 'MM/DD/YYYY HH:MI:SS AM'));
COMMIT;
>>>>>>>>>>>>>>>>>>
SET DEFINE OFF;
Insert into GN_LOOKUP_TYPES_T
   (LOOKUP_TYPE, DESCRIPTION, CUSTOMIZATION_LEVEL, APPLICATION_CODE, CREATED_BY, 
    CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE, ENTITY_ID, SITE_ID)
 Values
   ('SCOPE_PAYSLIP', NULL, 'S', 'GN', 17, 
    TO_DATE('11/14/2022 5:53:47 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 5:53:47 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, NULL);
COMMIT;
>>>>>>>>>>>>>>>>>>>
SET DEFINE OFF;
Insert into GN_LOOKUP_VALUES_T
   (LOOKUP_TYPE, LOOKUP_CODE, ENABLED_FLAG, TAG, EFFECTIVE_START_DATE, 
    EFFECTIVE_END_DATE, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE, 
    ENTITY_ID, SITE_ID)
 Values
   ('SCOPE_PAYSLIP', 'Period', '1', NULL, TO_DATE('11/1/2022', 'MM/DD/YYYY'), 
    TO_DATE('12/31/4712', 'MM/DD/YYYY'), 17, TO_DATE('11/14/2022 5:55:48 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 5:55:48 PM', 'MM/DD/YYYY HH:MI:SS AM'), 
    NULL, NULL);
Insert into GN_LOOKUP_VALUES_T
   (LOOKUP_TYPE, LOOKUP_CODE, ENABLED_FLAG, TAG, EFFECTIVE_START_DATE, 
    EFFECTIVE_END_DATE, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE, 
    ENTITY_ID, SITE_ID)
 Values
   ('SCOPE_PAYSLIP', 'Process', '1', NULL, TO_DATE('11/1/2022', 'MM/DD/YYYY'), 
    TO_DATE('12/31/4712', 'MM/DD/YYYY'), 17, TO_DATE('11/16/2022 12:50:08 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/16/2022 12:50:08 PM', 'MM/DD/YYYY HH:MI:SS AM'), 
    NULL, NULL);
COMMIT;
>>>>>>>>>>>>>>>>>>>>>>>>
SET DEFINE OFF;
Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values
   ('SCOPE_PAYSLIP', 'Period', 'Period', NULL, 'US', 
    17, TO_DATE('11/14/2022 5:55:48 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 5:55:48 PM', 'MM/DD/YYYY HH:MI:SS AM'));
Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values
   ('SCOPE_PAYSLIP', 'Period', 'Period', NULL, 'AR', 
    17, TO_DATE('11/14/2022 5:55:48 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 5:55:48 PM', 'MM/DD/YYYY HH:MI:SS AM'));
Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values
   ('SCOPE_PAYSLIP', 'Period', 'Period', NULL, 'FR', 
    17, TO_DATE('11/14/2022 5:55:48 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/14/2022 5:55:48 PM', 'MM/DD/YYYY HH:MI:SS AM'));
Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values
   ('SCOPE_PAYSLIP', 'Process', 'Process', NULL, 'US', 
    17, TO_DATE('11/16/2022 12:50:08 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/16/2022 12:52:38 PM', 'MM/DD/YYYY HH:MI:SS AM'));
Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values
   ('SCOPE_PAYSLIP', 'Process', 'Process', NULL, 'AR', 
    17, TO_DATE('11/16/2022 12:50:08 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/16/2022 12:52:38 PM', 'MM/DD/YYYY HH:MI:SS AM'));
Insert into GN_LOOKUP_VALUES_TL
   (LOOKUP_TYPE, LOOKUP_CODE, MEANING, DESCRIPTION, LANGUAGE, 
    CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE)
 Values
   ('SCOPE_PAYSLIP', 'Process', 'Process', NULL, 'FR', 
    17, TO_DATE('11/16/2022 12:50:08 PM', 'MM/DD/YYYY HH:MI:SS AM'), 17, TO_DATE('11/16/2022 12:52:38 PM', 'MM/DD/YYYY HH:MI:SS AM'));
COMMIT;
>>>>>>>>>>>>>>>>>>>>
>>>>>>> Stashed changes
