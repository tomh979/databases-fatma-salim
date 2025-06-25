CREATE TABLE Servers ( 
server_id INT PRIMARY KEY, 
server_name VARCHAR(50), 
region VARCHAR(50) 
); 

INSERT INTO Servers VALUES 
(1, 'web-server-01', 'us-east'), 
(2, 'db-server-01', 'us-east'), 
(3, 'api-server-01', 'eu-west'), 
(4, 'cache-server-01', 'us-west');

select * from Servers

CREATE TABLE Alerts ( 
alert_id INT PRIMARY KEY, 
server_id INT, 
alert_type VARCHAR(50), 
severity VARCHAR(20) 
);

INSERT INTO Alerts VALUES
(101, 1, 'CPU Spike', 'High'), 
(102, 2, 'Disk Failure', 'Critical'), 
(103, 2, 'Memory Leak', 'Medium'), 
(104, 5, 'Network Latency', 'Low'); 

select * from Alerts

CREATE TABLE AI_Models ( 
model_id INT PRIMARY KEY, 
model_name VARCHAR(50), 
use_case VARCHAR(50) 
); 

INSERT INTO AI_Models VALUES 
(201, 'AnomalyDetector-v2', 'Alert Prediction'), 
(202, 'ResourceForecaster', 'Capacity Planning'), 
(203, 'LogParser-NLP', 'Log Analysis'); 

select * from AI_Models

CREATE TABLE ModelDeployments ( 
deployment_id INT PRIMARY KEY, 
server_id INT, 
model_id INT, 
deployed_on DATE 
);

INSERT INTO ModelDeployments VALUES 
(301, 1, 201, '2025-06-01'), 
(302, 2, 201, '2025-06-03'), 
(303, 2, 202, '2025-06-10'), 
(304, 3, 203, '2025-06-12'); 

select * from ModelDeployments

select a.alert_id , a.alert_type , a.severity , s.server_name
from Alerts a 
inner join Servers s on a.server_id = s.server_id;

select s.server_id , s.server_name , s.region , a.alert_type ,a.severity
from Servers s
left join Alerts a on s.server_id = a.server_id;

select a.alert_id , a.alert_type , a.severity , s.server_name
from Alerts a
left join Servers s on a.server_id = s.server_id;

select s.server_id , s.server_name , a.alert_type , a.severity
from Servers s
full outer join Alerts a on s.server_id =a.server_id;

 select m.model_name , s.server_name
 from AI_Models m
 cross join servers s ;



