-- PROCEDURE TO UPDATE THE SALES FACTS

DELIMITER //

CREATE PROCEDURE UPDATE_DAILY_SALES_FACTS()
BEGIN 

	INSERT INTO SALES_FACTS(CUST_ID, PROD_ID, SLS_UNT_PRC_AM, SLS_QTY_NO, SLS_UNT_CST_AM, SLS_PROMO_IN, STR_ID, TME_DAY_ID)
	SELECT DISTINCT C.CUST_ID, P.PROD_ID, os.SLS_UNIT_PRC_AM, os.SLS_QTY_NO, op.SLS_UNIT_COST_AM, os.SLS_PROMO_IN, S.STR_ID, T.TME_DAY_ID
	FROM ODS_SALES_DATA_SMALL os
	JOIN CUSTOMERS C
	ON os.CUST_NO = C.CUST_NO
	JOIN PRODUCTS P
	ON os.PROD_NM = P.PROD_NM
	JOIN STORES S
	ON os.STR_ID = S.STR_ID
	JOIN TIMES T
	ON os.SLS_DT = T.TME_DSPL_DT
	JOIN ods_prod_lookup op
	ON os.PROD_NM = op.PROD_NM;
    
	UPDATE SALES_FACTS
	SET SLS_GRS_PFT_AM = (SLS_UNT_PRC_AM - SLS_UNT_CST_AM);
    
END //

DELIMITER ;