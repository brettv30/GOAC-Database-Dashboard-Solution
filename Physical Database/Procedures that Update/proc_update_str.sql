-- PROCEDURE TO UPDATE THE STORE MANAGER 

DELIMITER //

CREATE PROCEDURE UPDATE_DAILY_STORES()
BEGIN

INSERT INTO STORES (STR_ID, STR_NO, STR_NM, STR_STREET_AD, STR_CTY_NM, STR_STATE_CD, STR_POST_CD, STR_MAN_NM, STR_MAN_PHN_NO, STR_LVL_CD, STR_START_DT)
SELECT DISTINCT os.STR_ID, os.STR_NO, os.STR_NM, os.STR_STREET_AD, os.STR_CITY_NM, os.STR_STATE_CD, os.STR_POST_CD, os.STR_MAN_NM, os.STR_MAN_PHONE_NO, os.STR_LVL_CD, os.STR_EST_DT
FROM ODS_SALES_DATA_SMALL os
JOIN STORES s
ON os.STR_ID = s.STR_ID
WHERE os.STR_MAN_NM != s.STR_MAN_NM
GROUP BY os.STR_ID;

END//

DELIMITER ;