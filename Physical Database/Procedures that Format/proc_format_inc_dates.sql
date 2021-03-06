-- PROCEDURE THAT HANDLES ALL ODS DATE FORMATTING

DELIMITER // 

CREATE PROCEDURE FORMAT_INCOMING_DATE()
BEGIN

	-- HANDLE THE #VALUE! ERRORS
	UPDATE ODS_SALES_DATA_LARGE
	SET SLS_DT = '12/31/9999'
	WHERE SLS_DT = "#VALUE!";

	-- SET ALL TEXT COLUMNS TO PROPER DATE FORMAT
	UPDATE ODS_SALES_DATA_LARGE
	SET CUST_BIRTH_DT = STR_TO_DATE(CUST_BIRTH_DT, '%m/%d/%Y'),
		STR_EST_DT = STR_TO_DATE(STR_EST_DT, '%m/%d/%Y'),
		SLS_DT = STR_TO_DATE(SLS_DT, '%m/%d/%Y');

	-- CHANGE ALL TEXT COLUMNS TO DATE COLUMNS 
	ALTER TABLE `380-final-bv-2`.`ODS_SALES_DATA_LARGE` 
	CHANGE COLUMN `CUST_BIRTH_DT` `CUST_BIRTH_DT` DATE NULL DEFAULT NULL,
	CHANGE COLUMN `STR_EST_DT` `STR_EST_DT` DATE NULL DEFAULT NULL,
	CHANGE COLUMN `SLS_DT` `SLS_DT` DATE NULL DEFAULT NULL;

	###########################

	-- SET ALL TEXT COLUMNS TO PROPER DATE FORMAT
	UPDATE ODS_PROD_LOOKUP
	SET PROD_INTRO_DT = STR_TO_DATE(PROD_INTRO_DT, '%m/%d/%Y');

	-- CHANGE ALL TEXT COLUMNS TO DATE COLUMNS 
	ALTER TABLE `380-final-bv-2`.`ODS_PROD_LOOKUP`
	CHANGE COLUMN `PROD_INTRO_DT` `PROD_INTRO_DT` DATE NULL DEFAULT NULL; 

END //

DELIMITER ;
