# Great Outdoors Apparel Company Database / Dashboard Solution
For this final project, we were tasked with creating a database and dashboard solution for the Great Outdoors Apparel Company (GOAC). During this project we created model diagrams for Conceptual, Logical, and Physical Database Models using Erwin Data Modeler software. Then, we created the physical database and began the 9-step ETL processs (outlined below) using SQL within the mySQL Workbench. Upon completion of the ETL process, we created two Tableau Dashboards (shown below) that displayed information which was requested by the GOAC manager. To round out the entire process, we created a [PowerPoint](https://github.com/brettv30/GOAC-Database-Dashboard-Solution/blob/main/Documents/Final%20Presentation%20and%20Standard%20Operating%20Procedure/CSC-380%20Final%20presentation%20-%20Brett%20Vogelsang.pptx) presentation summarizing the entire project and a Standard Operating Procedure [document](https://github.com/brettv30/GOAC-Database-Dashboard-Solution/blob/main/Documents/Final%20Presentation%20and%20Standard%20Operating%20Procedure/GOAC%20Analytic%20Solutions%20SOP.docx) outlining how to use the Tableau Dashboards if  someone was a power user. 

## Model Diagrams
### Conceptual Data Model
![first image](https://github.com/brettv30/GOAC-Database-Dashboard-Solution/blob/main/images/CDM-View.png)

### Logical Data Model
![second image](https://github.com/brettv30/GOAC-Database-Dashboard-Solution/blob/main/images/LDM-View.png)

### Physical Data Model
![third image](https://github.com/brettv30/GOAC-Database-Dashboard-Solution/blob/main/images/PDM-View.png)

## ETL Jobs
### Job 1: Import Data
- Use the MySQL Workbench Import Wizard to import the data into the correct physical database tables

### Job 2: Create the Time Dimension File
- Use Excel to create the data that populates the Time table in Job 4

### Job 3: Load all Dimensions with Unique Observations
- Use DML to insert only the unique observations into each table within the database

### Job 4: Load Time Data via Import Wizard
- Use the Import Wizard to import the Time Dimension Data, that was created in Job 2, into the Time table

### Job 5: Load Sales Facts Table
- Pull information from all other tables into the Sales Facts table and populate observations

### Job 6: Load Customer Income to Customers Table
- Create the Customer Income Amount column and load that into the Customers table

### Job 7: Assign Income Level Code
- Assign an income level to each customer based on their income amount determined in Job 6

### Job 8: Assign the Product ID
- Assign the product ID to each unique product within the Product table

### Job 9: Create Calculate Key Figures
- Create the Sales Gross Profit Amount column within the Sales Facts table

## Tableau Dashboards
### Customer - Unit Analysis
![fourth image](https://github.com/brettv30/GOAC-Database-Dashboard-Solution/blob/main/images/Cust-Unit-Analysis.png)

### Store Profit Comparison
![fifth image](https://github.com/brettv30/GOAC-Database-Dashboard-Solution/blob/main/images/Store-Profit-Comp.png)
