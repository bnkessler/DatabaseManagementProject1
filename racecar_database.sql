CREATE DATABASE IF NOT EXISTS DBMP1;
USE DBMP1;

-- Creating the 'manufacturer' table
CREATE TABLE MANUFACTURER(
manufacturer_id INT,
component_id INT,
PRIMARY KEY(manufacturer_id)
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
PRIMARY KEY(skill_no)
);

-- Creating the 'employee_skills' linking table for the many-to-many relationship
CREATE TABLE EMPLOYEE_SKILLS (
skill_no INT,
emp_no INT,
skill_name VARCHAR(100),
PRIMARY KEY (skill_no, emp_no),
FOREIGN KEY (skill_no) REFERENCES skills(skill_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Creating the 'drivers' table
CREATE TABLE DRIVERS (
driver_no INT,
emp_no INT,
nationality VARCHAR(100),
age INT,
PRIMARY KEY(driver_no),
FOREIGN KEY(emp_no) REFERENCES employees(emp_no) ON UPDATE CASCADE
);

-- Creating the 'pitwall' table
CREATE TABLE PITWALL (
emp_no INT,
emp_role VARCHAR(200),
specialty VARCHAR(200),
FOREIGN KEY(emp_no) REFERENCES employees(emp_no) ON UPDATE CASCADE
);

-- Creating the 'pit_crew' table
CREATE TABLE PIT_CREW (
emp_no INT,
role VARCHAR(100),
FOREIGN KEY(emp_no) REFERENCES employees(emp_no) ON UPDATE CASCADE
);

-- Creating the 'engineers' table
CREATE TABLE ENGINEERS (
emp_no INT,
e_type VARCHAR(255),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON UPDATE CASCADE
);

-- Creating the 'in_house' table
CREATE TABLE IN_HOUSE (
company_no INT,
manufacturer_id INT,
emp_no INT,
PRIMARY KEY(company_no),
FOREIGN KEY(manufacturer_id) REFERENCES MANUFACTURER(manufacturer_id),
FOREIGN KEY(emp_no) REFERENCES ENGINEERS(emp_no)
);

-- Creating the '3rd_party' table
CREATE TABLE THIRD_PARTY (
company_no INT,
manufacturer_id INT,
company_name VARCHAR(255),
company_location VARCHAR(255),
PRIMARY KEY(company_no),
FOREIGN KEY(manufacturer_id) REFERENCES MANUFACTURER(manufacturer_id)
);

-- Creating the 'equipment' table
CREATE TABLE EQUIPMENT (
component_id INT,
component_name VARCHAR(100),
manufacturer_id INT,
PRIMARY KEY(component_id),
FOREIGN KEY(manufacturer_id) REFERENCES MANUFACTURER(manufacturer_id)
);

-- Creating the 'install' table
CREATE TABLE INSTALL (
install_id INT,
install_date DATE,
install_time TIME,
component_id INT,
emp_no INT,
PRIMARY KEY(install_id),
FOREIGN KEY (component_id) REFERENCES EQUIPMENT(component_id),
FOREIGN KEY(emp_no) REFERENCES ENGINEERS(emp_no)
);

-- Creating the 'logistics' table
CREATE TABLE LOGISTICS (
shipment_no INT,
race_id INT, 
emp_no INT,
transportation_type VARCHAR(100),
fuel_cost FLOAT,
transit_time FLOAT,
num_stops INT,
quantity INT,
PRIMARY KEY(shipment_no)
);

-- Creating the 'car' table
CREATE TABLE CAR (
car_id INT,
manufacturer_id INT,
install_id INT, 
race_id INT,
sponsor_id INT,
PRIMARY KEY (car_id),
FOREIGN KEY (manufacturer_id) REFERENCES manufacturer(manufacturer_id) ON UPDATE CASCADE,
FOREIGN KEY (install_id) REFERENCES install(install_id) ON UPDATE CASCADE
);

-- Creating the 'races' table
CREATE TABLE RACES (
race_id INT,
car_id INT,
shipment_no INT,
race_location VARCHAR(70),
race_length FlOAT,
PRIMARY KEY(race_id, car_id)
);

-- Creating the 'sponsors' table
CREATE TABLE SPONSORS(
sponsor_id INT,
emp_no INT,
car_id INT,
component_id INT,
sponsor_name VARCHAR(100),
contract_duration INT,
contract_terms TEXT,
PRIMARY KEY(sponsor_id),
FOREIGN KEY(emp_no) REFERENCES EMPLOYEES(emp_no),
FOREIGN KEY(car_id) REFERENCES CAR(car_id),
FOREIGN KEY(component_id) REFERENCES EQUIPMENT(component_id)
);

# Value Insertion

# car, races, manufacturer, in house, third party, equipment, install, employees, drivers, pitwall, pit crew, engineers (12)

# sponsors, employee skills, skills, logistics

INSERT INTO MANUFACTURER (manufacturer_id, component_id) VALUES
(01, 101),
(02, 102),
(03, 103),
(04, 104),
(05, 105),
(06, 106),
(07, 107),
(08, 108),
(09, 109),
(10, 110);

INSERT INTO EQUIPMENT (component_id, component_name, manufacturer_id) VALUES
(101, 'Front Wing', 01),
(102, 'Wheel Gun', 02),
(103, 'Rear Wing', 03),
(104, 'Floor', 04),
(105, 'Halo', 05),
(106, 'Wheel Rim', 06),
(107, 'Tire', 07),
(108, 'Steering Wheel', 08),
(109, 'Helmet', 09),
(110, 'Visor Tear-Off', 10);

insert into EMPLOYEES (emp_no, first_name, last_name, hire_date) values
(10001, 'Lewis', 'Hamilton', '2007-01-01'),
(10002, 'Sebastian', 'Vettel', '2008-01-15'),
(10003, 'Max', 'Verstappen', '2017-01-03'),
(10004, 'Valtteri', 'Bottas', '2012-01-09'),
(10005, 'Charles', 'Leclerc', '2017-12-28'),
(10006, 'Daniel', 'Ricciardo', '2010-01-10'),
(10007, 'Fernando', 'Alonso', '2005-01-02'),
(10008, 'Lando', 'Norris', '2019-01-17'),
(10009, 'Alex', 'Albon', '2019-07-09'),
(10010, 'Kimi', 'Räikkönen', '2004-11-19'),
(10011, 'Alice', 'Johnson', '2005-03-15'),
(10012, 'Bob', 'Smith', '2006-08-22'),
(10013, 'Charlie', 'Williams', '2003-11-10'),
(10014, 'David', 'Miller', '2004-05-28'),
(10015, 'Eva', 'Jones', '2008-02-17'),
(10016, 'Frank', 'Davis', '2006-04-09'),
(10017, 'Grace', 'Anderson', '2009-09-05'),
(10018, 'Henry', 'White', '2007-07-14'),
(10019, 'Ivy', 'Martin', '2005-12-03'),
(10020, 'Jack', 'Taylor', '2002-10-20'),
(10021, 'Katie', 'Brown', '2003-06-28'),
(10022, 'Leo', 'Moore', '2004-09-12'),
(10023, 'Mia', 'Clark', '2007-01-30'),
(10024, 'Noah', 'Hall', '2008-11-18'),
(10025, 'Olivia', 'Allen', '2006-07-25'),
(10026, 'Peter', 'Baker', '2004-03-02'),
(10027, 'Quinn', 'Carter', '2002-12-11'),
(10028, 'Ruby', 'Fisher', '2009-05-07'),
(10029, 'Sam', 'Green', '2007-08-14'),
(10030, 'Tyler', 'Harris', '2003-04-20'),
(10031, 'Ursula', 'Jackson', '2006-10-05'),
(10032, 'Victor', 'King', '2008-06-15'),
(10033, 'Wendy', 'Lee', '2005-01-22'),
(10034, 'Xander', 'Nelson', '2002-09-08'),
(10035, 'Yara', 'Owens', '2004-12-12'),
(10036, 'Zane', 'Perez', '2007-03-28'),
(10037, 'Ava', 'Reed', '2008-07-17'),
(10038, 'Ben', 'Simmons', '2009-02-03'),
(10039, 'Cora', 'Turner', '2006-06-10'),
(10040, 'Dylan', 'Ward', '2003-08-19');

insert into DRIVERS (driver_no, emp_no, nationality, age) values
(44, 10001, "English", 38),
(22, 10002, "German", 40),
(1, 10003, "Dutch", 27),
(77, 10004, "Finnish", 37),
(16, 10005, "Monagasque", 26),
(3, 10006, "Australian", 30),
(14, 10007, "Spanish", 42),
(4, 10008, "English", 24),
(23, 10009, "Thai", 26),
(10, 10010, "Finnish", 7);

insert into PITWALL (emp_no, emp_role, specialty) values
(10011, 'Engineer', 'Mechanical'),
(10012, 'Data Analyst', 'Tire Wear'),
(10013, 'Technician', 'Electrical Systems'),
(10014, 'Coordinator', 'Logistics'),
(10015, 'Designer', 'Aerodynamics'),
(10016, 'Strategist', 'Strategy'),
(10017, 'Technician', 'Software'),
(10018, 'Coordinator', 'Operations'),
(10019, 'Team Doctor', 'Medical'),
(10020, 'Analyst', 'Performance');

insert into PIT_CREW (emp_no, role) values
(10021, "Left Front Tire Changer"),
(10022, 'Left Rear Tire Changer'),
(10023, 'Front Jackman'),
(10024, 'Front Wing Adjuster'),
(10025, 'Rear Wing Adjuster'),
(10026, 'Brake Specialist'),
(10027, 'Rear Jackman'),
(10028, 'Right Front Tire Changer'),
(10029, 'Radio Communicator'),
(10030, 'Right Rear Tire Changer');

insert into ENGINEERS (emp_no, e_type) values
(10031, 'Mechanical Engineer'),
(10032, 'Structural Engineer'),
(10033, 'Electrical Engineer'),
(10034, 'Systems Engineer'),
(10035, 'Aerospace Engineer'),
(10036, 'Software Engineer'),
(10037, 'Quality Engineer'),
(10038, 'Process Engineer'),
(10039, 'Materials Engineer'),
(10040, 'Safety Engineer');

INSERT INTO INSTALL (install_id, install_date, install_time, component_id, emp_no) VALUES
(301, '2023-01-01', '12:00:00', 101, 10031),
(302, '2023-01-02', '13:30:00', 102, 10032),
(303, '2023-01-03', '14:45:00', 103, 10033),
(304, '2023-01-04', '16:00:00', 104, 10034),
(305, '2023-01-11', '17:15:00', 105, 10035),
(306, '2023-01-16', '18:30:00', 106, 10036),
(307, '2023-01-17', '19:45:00', 107, 10037),
(308, '2023-01-28', '21:00:00', 108, 10038),
(309, '2023-01-29', '22:15:00', 109, 10039),
(310, '2023-01-30', '23:30:00', 110, 10040);

INSERT INTO CAR (car_id, manufacturer_id, install_id, race_id, sponsor_id) VALUES
(501, 1, 301, 401, 501),
(502, 2, 302, 402, 502),
(503, 3, 303, 403, 503),
(504, 4, 304, 404, 504),
(505, 5, 305, 405, 505),
(506, 6, 306, 406, 506),
(507, 7, 307, 407, 507),
(508, 8, 308, 408, 508),
(509, 9, 309, 409, 509),
(510, 10, 310, 410, 510);

INSERT INTO LOGISTICS (shipment_no, race_id, emp_no, transportation_type, fuel_cost, transit_time, num_stops, quantity) VALUES
(601, 401, 10011, 'Truck', 1200.50, 15.5, 3, 100),
(602, 402, 10012, 'Airplane', 4500.75, 7.2, 1, 80),
(603, 403, 10013, 'Ship', 3200.20, 12.8, 2, 120),
(604, 401, 10014, 'Truck', 1100.25, 14.0, 2, 90),
(605, 402, 10015, 'Airplane', 4800.60, 6.5, 1, 75),
(606, 403, 10016, 'Ship', 3000.40, 13.2, 3, 110),
(607, 401, 10017, 'Truck', 1050.30, 16.3, 3, 95),
(608, 402, 10018, 'Airplane', 4700.90, 7.8, 1, 85),
(609, 403, 10019, 'Ship', 3300.15, 11.6, 2, 105),
(610, 401, 10020, 'Truck', 1150.80, 15.0, 2, 100);

INSERT INTO RACES (race_id, car_id, shipment_no, race_location, race_length)  VALUES
(401, 501, 601, 'Bahrain', 313.2),
(401, 502, 602, 'Bahrain', 313.2),
(401, 503, 603, 'Bahrain', 313.2),
(401, 504, 604, 'Bahrain', 313.2),
(401, 505, 605, 'Bahrain', 313.2),
(401, 506, 606, 'Bahrain', 313.2), 
(401, 507, 607, 'Bahrain', 313.2), 
(401, 508, 608, 'Bahrain', 313.2), 
(401, 509, 609, 'Bahrain', 313.2), 
(401, 510, 610, 'Bahrain', 313.2), 
(402, 501, 611, 'Australia', 302.7),
(402, 502, 612, 'Australia', 302.7),
(402, 503, 613, 'Australia', 302.7),
(402, 504, 614, 'Australia', 302.7),
(402, 505, 615, 'Australia', 302.7),
(402, 506, 616, 'Australia', 302.7),
(402, 507, 617, 'Australia', 302.7),
(402, 508, 618, 'Australia', 302.7),
(402, 509, 619, 'Australia', 302.7),
(402, 510, 620, 'Australia', 302.7),
(403, 501, 621, 'Spain', 300.1),
(403, 502, 622, 'Spain', 300.1),
(403, 503, 623, 'Spain', 300.1),
(403, 504, 624, 'Spain', 300.1),
(403, 505, 625, 'Spain', 300.1),
(403, 506, 626, 'Spain', 300.1),
(403, 507, 627, 'Spain', 300.1),
(403, 508, 628, 'Spain', 300.1),
(403, 509, 629, 'Spain', 300.1),
(403, 510, 630, 'Spain', 300.1);

INSERT INTO IN_HOUSE (company_no, manufacturer_id, emp_no) VALUES
(1, 01, 10031),
(2, 02, 10032),
(3, 03, 10033),
(4, 04, 10034),
(5, 05, 10035),
(6, 06, 10036),
(7, 07, 10037),
(8, 08, 10038),
(9, 09, 10039),
(10, 10, 10040);

INSERT INTO THIRD_PARTY (company_no, manufacturer_id, company_name, company_location)VALUES
(11, 01, 'Apple', 'California'),
(12, 02, 'Microsoft', 'Washington'),
(13, 03, 'Amazon', 'Washington'),
(14, 04, 'Google', 'California'),
(15, 05, 'Facebook', 'California'),
(16, 06, 'Oracle', 'California'),
(17, 07, 'IBM', 'New York'),
(18, 08, 'Samsung', 'South Korea'),
(19, 09, 'Intel', 'California'),
(20, 10, 'BWT', 'England');

INSERT INTO SKILLS (skill_no, emp_no) VALUES
(1, 10001),
(2, 10002),
(3, 10003),
(4, 10004),
(5, 10005),
(6, 10006),
(7, 10007),
(8, 10008),
(9, 10009),
(10, 10010);

INSERT INTO EMPLOYEE_SKILLS (skill_no, emp_no, skill_name) VALUES
(1, 10001, 'Java Programming'),
(2, 10002, 'Data Analysis'),
(3, 10003, 'Project Management'),
(4, 10004, 'Graphic Design'),
(5, 10005, 'Database Administration'),
(6, 10006, 'Network Security'),
(7, 10007, 'Digital Marketing'),
(8, 10008, 'Web Development'),
(9, 10009, 'Machine Learning'),
(10, 10010, 'Financial Analysis');

INSERT INTO SPONSORS (sponsor_id, emp_no, car_id, component_id, sponsor_name, contract_duration, contract_terms) VALUES
(701, 10021, 501, 101, 'Tech Innovations', 2, 'Digital advertising and event sponsorship'),
(702, 10022, 502, 102, 'Speed Gear Co.', 3, 'Logo placement on team uniforms and race cars'),
(703, 10023, 503, 103, 'FuelMax Energy', 2, 'Exclusive rights to advertise in fuel-related areas'),
(704, 10024, 504, 104, 'TechWheels Corp.', 1, 'Technology partnership and product integration'),
(705, 10025, 505, 105, 'DataDrive Solutions', 2, 'Data analytics support for racing strategies'),
(706, 10026, 506, 106, 'Secure Motors Insurance', 2, 'Insurance coverage for racing events'),
(707, 10027, 507, 107, 'Digital Boost Media', 3, 'Digital marketing and social media promotions'),
(708, 10028, 508, 108, 'WebSprint Technologies', 1, 'Web development services and online presence'),
(709, 10029, 509, 109, 'Green Energy Solutions', 2, 'Promotion of eco-friendly initiatives in racing'),
(710, 10030, 510, 110, 'SpeedTech Performance', 3, 'Performance optimization and technological support');
