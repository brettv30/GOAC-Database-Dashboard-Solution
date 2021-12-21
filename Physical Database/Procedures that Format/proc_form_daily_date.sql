-- PROCEDURE THAT LOADS UPDATES THE DAILY DATA DATE

DELIMITER //

CREATE PROCEDURE FORMAT_DAILY_DATE()
BEGIN
	-- SET ALL TEXT COLUMNS TO PROPER DATE FORMAT
	UPDATE ODS_SALES_DATA_SMALL
	SET CUST_BIRTH_DT = STR_TO_DATE(CUST_BIRTH_DT, '%m/%d/%Y'),
		STR_EST_DT = STR_TO_DATE(STR_EST_DT, '%m/%d/%Y'),
		SLS_DT = STR_TO_DATE(SLS_DT, '%m/%d/%Y');
		
	-- CHANGE ALL TEXT COLUMNS TO DATE COLUMNS 
	ALTER TABLE `380-final-bv-2`.`ODS_SALES_DATA_SMALL` 
	CHANGE COLUMN `CUST_BIRTH_DT` `CUST_BIRTH_DT` DATE NULL DEFAULT NULL,
	CHANGE COLUMN `STR_EST_DT` `STR_EST_DT` DATE NULL DEFAULT NULL,
	CHANGE COLUMN `SLS_DT` `SLS_DT` DATE NULL DEFAULT NULL;
    
END //

DELIMITER ;