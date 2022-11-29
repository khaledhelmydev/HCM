
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
