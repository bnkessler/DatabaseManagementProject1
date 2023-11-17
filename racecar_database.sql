CREATE DATABASE IF NOT EXISTS DBMP1;
USE DBMP1;

-- Creating the 'manufacturer' table
CREATE TABLE MANUFACTURER(
manufacturer_id INT,
PRIMARY KEY(manufacturer_id)
);

DESCRIBE manufacturer; 

-- Creating the 'car' table
CREATE TABLE CAR (
CarID INT,
PRIMARY KEY (CarID),
manufacturer_id INT,
FOREIGN KEY (manufacturer_id) REFERENCES manufacturer(manufacturer_id)
);

DESCRIBE CAR; 

-- Creating the 'races' table
CREATE TABLE RACES (
race_id INT,
location VARCHAR(70),
length FlOAT,
PRIMARY KEY(race_id)
);

DESCRIBE RACES; 

-- Creating the 'logistics' table
CREATE TABLE LOGISTICS (
shipment_no INT,
transportation_type VARCHAR(100),
fuel_cost DECIMAL(10,2),
transit_time DECIMAL(10,2),
num_stops INT,
quantity INT,
PRIMARY KEY(shipment_no)
);

DESCRIBE LOGISTICS; 

-- Creating the 'sponsors' table
CREATE TABLE SPONSORS(
sponsor_id INT,
sponsor_name VARCHAR(100),
contract_duration INT,
contract_terms TEXT,
PRIMARY KEY(sponsor_id)
);

-- Creating the 'employees' table
CREATE TABLE EMPLOYEES (
emp_no INT,
first_name VARCHAR(50),
last_name VARCHAR(50),
hire_date DATE,
PRIMARY KEY(emp_no)
);

-- Creating the 'skills' table
CREATE TABLE SKILLS (
skill_no INT,
emp_no INT,
#skill_name VARCHAR(100),
PRIMARY KEY(skill_no)
);


-- Creating the 'employee_skills' linking table for the many-to-many relationship
CREATE TABLE EMPLOYEE_SKILLS (
skill_no INT,
emp_no INT,
PRIMARY KEY (skill_no, emp_no),
FOREIGN KEY (skill_no) REFERENCES skills(skill_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Creating the 'drivers' table
CREATE TABLE DRIVERS (
driver_no INT,
nationality VARCHAR(100),
age INT,
PRIMARY KEY(driver_no)
);

-- Creating the 'pitwall' table
CREATE TABLE pitwall (
role VARCHAR(200),
specialty VARCHAR(200)
-- Additional attributes as needed
);

-- Creating the 'pit_crew' table
CREATE TABLE pit_crew (
role VARCHAR(100),
PRIMARY KEY(role)
);

-- Creating the 'engineers' table
CREATE TABLE engineers (
emp_no INT,
type VARCHAR(255), -- Assuming type is VARCHAR, can be ENUM if limited options
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
PRIMARY KEY(emp_no)
    -- Additional attributes as needed
);

-- Creating the 'equipment' table
CREATE TABLE equipment (
component_id INT,
component_name VARCHAR(255),
PRIMARY KEY(component_id)

);

-- Creating the 'install' table
CREATE TABLE install (
install_id INT,
date DATE,
time TIME,
component_id INT,
FOREIGN KEY (component_id) REFERENCES equipment(component_id),
PRIMARY KEY(install_id)
);

-- Creating the 'in_house' table
CREATE TABLE in_house (
company_no INT,
PRIMARY KEY(company_no)
);

-- Creating the '3rd_party' table
CREATE TABLE third_party (
company_no INT,
company_name VARCHAR(255),
company_location VARCHAR(255),
PRIMARY KEY(company_no)
);

DESCRIBE third_party;
