-- procedure to insert all information into customers table

DELIMITER //

CREATE PROCEDURE POPULATE_CUSTOMERS()
BEGIN
INSERT INTO CUSTOMERS (CUST_ID, CUST_NO, CUST_NM, CUST_STREET_AD, CUST_POST_CD, CUST_STATE_CD, CUST_PHN_NO, CUST_BIRTH_DT, CUST_INCOME_CD, CUST_LVL_CD)
SELECT DISTINCT oc.CUST_ID, os.CUST_NO, os.CUST_NM, os.CUST_STREET_AD, os.CUST_POST_CD, os.CUST_STATE_CD, os.CUST_PHN_NO, os.CUST_BIRTH_DT,
CASE
	WHEN CUST_INCOME_AM > 55000 THEN 'H'
    WHEN CUST_INCOME_AM <= 55000 AND CUST_INCOME_AM > 40000 THEN 'M'
    WHEN CUST_INCOME_AM <= 40000 AND CUST_INCOME_AM > 15000 THEN 'L'
    WHEN CUST_INCOME_AM < 15000 THEN 'P'
END AS CUST_INCOME_CD, 
CASE
	WHEN (SLS_QTY_NO * SLS_UNIT_PRC_AM) > 1000 THEN 'G'
    WHEN (SLS_QTY_NO * SLS_UNIT_PRC_AM) <= 1000 AND (SLS_QTY_NO * SLS_UNIT_PRC_AM) > 500 THEN 'S'
    WHEN (SLS_QTY_NO * SLS_UNIT_PRC_AM) <= 500 AND (SLS_QTY_NO * SLS_UNIT_PRC_AM) > 100 THEN 'B' 
END AS CUST_LVL_CD
FROM ODS_SALES_DATA_LARGE os
JOIN ODS_CUST_LOOKUP oc
ON os.CUST_NO = oc.CUST_NO
GROUP BY CUST_ID, CUST_NO;
END //

DELIMITER ;
