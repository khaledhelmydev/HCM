
CREATE OR REPLACE TRIGGER HR_ORG_TREE_B_IU
BEFORE INSERT OR UPDATE ON HR_ORG_TREE_T FOR EACH ROW
DECLARE
 L_SYSDATE DATE := SYSDATE;
BEGIN

    IF INSERTING THEN
        :NEW.SITE_ID := GN_GLOBAL_PKG.USER_SITE_ID;
        :NEW.CREATED_BY := GN_GLOBAL_PKG.USER_ID;
        :NEW.CREATION_DATE := L_SYSDATE;
    END IF;
    
    :NEW.LAST_UPDATED_BY := GN_GLOBAL_PKG.USER_ID;
    :NEW.LAST_UPDATE_DATE := L_SYSDATE;
END;

CREATE OR REPLACE TRIGGER HR_ENTITIES_T_B_IU
BEFORE INSERT OR UPDATE ON HR_ENTITIES_T FOR EACH ROW
BEGIN
  
    IF INSERTING THEN
    
        :NEW.CREATION_DATE := SYSDATE;
        :NEW.CREATED_BY := GN_GLOBAL_PKG.USER_ID;
                
    END IF;
    
    :NEW.LAST_UPDATE_DATE := SYSDATE;
    :NEW.LAST_UPDATED_BY := GN_GLOBAL_PKG.USER_ID;
END;
 

 ******************************* SABER ********************
 /* Formatted on 11/30/2022 11:15:42 AM (QP5 v5.294) */
CREATE OR REPLACE TRIGGER HCM7_DEV.AMS_ABSENCE_MGT_HEADER_LANG
   AFTER INSERT OR DELETE
   ON HCM7_DEV.AMS_ABSENCE_MGT_HEADER_T
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
   DISABLE
DECLARE
   CURSOR C_LANG
   IS
      SELECT LOOKUP_CODE
        FROM GN_LOOKUP_VALUES_T
       WHERE LOOKUP_TYPE = 'SYSTEM_LANGUAGES';
BEGIN
   IF INSERTING
   THEN
      FOR REC IN C_LANG
      LOOP
         INSERT INTO AMS_ABSENCE_MGT_HEADER_TL
              VALUES (:NEW.ABSENCE_TYPE_ID,
                      :NEW.ENTITY_ID,
                      REC.LOOKUP_CODE,
                      :NEW.ABSENSE_TYPE,
                      :NEW.LAST_UPDATE_DATE,
                      :NEW.LAST_UPDATED_BY,
                      :NEW.CREATED_BY,
                      :NEW.CREATION_DATE);
      END LOOP;
   END IF;

   IF DELETING
   THEN
      DELETE AMS_ABSENCE_MGT_HEADER_TL
       WHERE ABSENCE_TYPE_ID = :OLD.ABSENCE_TYPE_ID;
   END IF;
END;
/

 ******************************* SABER ********************
 /* Formatted on 11/30/2022 11:15:42 AM (QP5 v5.294) */
CREATE OR REPLACE TRIGGER HCM7_DEV.AMS_ABSENCE_MGT_REASONS_LANG
   AFTER INSERT OR DELETE
   ON HCM7_DEV.AMS_ABSENCE_MGT_REASONS_T
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
   DISABLE
DECLARE
   CURSOR C_LANG
   IS
      SELECT LOOKUP_CODE
        FROM GN_LOOKUP_VALUES_T
       WHERE LOOKUP_TYPE = 'SYSTEM_LANGUAGES';
BEGIN
   IF INSERTING
   THEN
      FOR REC IN C_LANG
      LOOP
         INSERT INTO AMS_ABSENCE_MGT_REASONS_TL
              VALUES (:NEW.ABSENCE_TYPE_ID,
                      :NEW.AMR_ID,
                       REC.LOOKUP_CODE,
                      :NEW.REASON,
                      :NEW.LAST_UPDATE_DATE,
                      :NEW.LAST_UPDATED_BY,
                      :NEW.CREATED_BY,
                      :NEW.CREATION_DATE);
      END LOOP;
   END IF;

   IF DELETING
   THEN
      DELETE AMS_ABSENCE_MGT_REASONS_TL
       WHERE AMR_ID = :OLD.AMR_ID;
   END IF;
END;
/
 ******************************* SABER ********************
/* Formatted on 11/30/2022 11:15:42 AM (QP5 v5.294) */
CREATE OR REPLACE TRIGGER HCM7_DEV.AMS_ACCRUAL_PLANS_LANG
   AFTER INSERT OR DELETE
   ON HCM7_DEV.AMS_ACCRUAL_PLANS_T
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
   DISABLE
DECLARE
   CURSOR C_LANG
   IS
      SELECT LOOKUP_CODE
        FROM GN_LOOKUP_VALUES_T
       WHERE LOOKUP_TYPE = 'SYSTEM_LANGUAGES';
BEGIN
   IF INSERTING
   THEN
      FOR REC IN C_LANG
      LOOP
         INSERT INTO AMS_ACCRUAL_PLANS_TL
              VALUES (:NEW.ACCRUAL_PLAN_ID,
                      :NEW.ABSENCE_TYPE_ID,
                      :NEW.PLAN_NAME,
                      :NEW.CREATION_DATE,
                      :NEW.LAST_UPDATE_DATE,
                      :NEW.CREATED_BY,
                      :NEW.LAST_UPDATED_BY,
                       REC.LOOKUP_CODE
                      );
      END LOOP;
   END IF;

   IF DELETING
   THEN
      DELETE AMS_ACCRUAL_PLANS_TL
       WHERE ACCRUAL_PLAN_ID = :OLD.ACCRUAL_PLAN_ID;
   END IF;
END;
/
 ******************************* SABER ********************
/* Formatted on 12/4/2022 11:15:42 AM (QP5 v5.294) */
CREATE OR REPLACE TRIGGER REQUEST_GROUP_HEADERS_T_B_IU
BEFORE INSERT OR UPDATE
ON  GN_REQUEST_GROUP_HEADERS_T
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
BEGIN
    IF INSERTING THEN
        :NEW.CREATION_DATE := SYSDATE;
        :NEW.CREATED_BY := GN_GLOBAL_PKG.USER_ID;        

        IF :NEW.DESCRIPTION = 'AWM_SYSTEM' THEN
            :NEW.SYSTEM_FLAG := 'Y';
        ELSE
            :NEW.SYSTEM_FLAG := 'N';
--            :NEW.ENTITY_ID := 1;
        END IF;
                
    END IF;

    :NEW.LAST_UPDATE_DATE := SYSDATE;
    :NEW.LAST_UPDATED_BY := GN_GLOBAL_PKG.USER_ID;
END;
/

 ******************************* M.ibrahem ********************
CREATE OR REPLACE TRIGGER TAT_PROJECT_SETUP_B_IU
BEFORE INSERT OR UPDATE
ON TAT_PROJECT_SETUP_T
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN

    IF INSERTING THEN
        :NEW.CREATION_DATE := SYSDATE;
        :NEW.CREATED_BY := GN_GLOBAL_PKG.USER_ID;
--        :NEW.PARAM_ID := TAT_PROJECT_SETUP_S.NEXTVAL;        
    END IF;
  
    :NEW.LAST_UPDATE_DATE  := SYSDATE;
    :NEW.LAST_UPDATED_BY := GN_GLOBAL_PKG.USER_ID;

END;
/