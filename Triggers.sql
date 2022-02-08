--Example you have a table which stores some data
--If  condition is true, then trigger the excecution :
--Eg if there is a sale of $1000 of any date, there should be an automatic email send
--or if there is a sale of $1000000, there is an error ---> Rollback + Email + log,to check if there 
 -- is some hacking happpening
 -- If total sales > 5MM ---> log a event in table
 -- This is automated scripts, to be executed 
 -- state of statement that get autoatic fired when some of update or delete  is performed
-----------------------------------------------------------------------------------------
--What is a Trigger
--This are the SQL codes that are automatically executed in response to certain events on a particular table. 
--These are used to maintain the integrity of the data
-------SYNTAX OF A TRIGGER
Create Trigger Trigger_Name --this two block specifies that a trigger block is going to be created
(Before | After) -- when the trigger will be triggerd, tell us about the time and when the trigger will be initiated
           -- Before- used to update of validate record values before they are save in the database
           --Ufter are used to access field values that are send to the system and affect changes in other records
[Insert | Update | Delete]  --
on [Table_Name] -- mention the ta
[for each row | for each column] --before/after each row and column
[Trigger_body]


--Nested Triggers in SQL are the actions that are automatically executed when a certain database operation is performed
-------OPERATIONS IN TRIGGERS------


-------------------- DROP -

--- We can use DROP command to remove a trigger from the database
DROP TRIGGER trigger name;
Example
DROP TRIGGER calculate name;

------------------DISPLAY
--We can use SHOW command to display triggers from the database

--SYNTAX
SHOW trIGGERS 
IN database_name;

Example
SHOW TRIGGERS in table_name;

-----------------INSERT
-- Before Insert Triggers are used to update or validate record value before they are saved to the database

--SYNTAX
CREATE TRIGGER calculate
before INSERT
ON student
FOR EACH ROW 
SET new.marks = new.marks+100

---------------AFTER INSERT TRIGGER
-- After insert Trigger are used to access field values that are set by the system and to effect changes in
-- other records
SYNTAX
create Trigger total_mark
after insert
ON student
FOR EACH ROW
insert into Final_mark value(new.marks);


-------------------Advantages of triggers

--forcing security approvals on the table
--Triggers check the integrity of data
--Counteracting invalid exchanges
--triggers handle errors
--are usefull to inspect data changes in the table

-----------------DISSADVANTAGES
--Overhead -- trigger may increase the overhead of the database
--Validation -- Trigger can only provide extended validation, i.e not all kind validation
--Troubleshoot - trigger can be difficult to troubleshoot because they execute automatically in the database
 --Example HR table
 Select * FROM HR.Shift;
 
CREATE TRIGGER Demo_Trigger
ON HR.Shift
AFTER INSERT
AS
BEGIN
PRINT 'INSERT IS NOT ALLOWED. YOU NEED APPROVAL'
ROLLBACK TRANSACTION
END
GO 
---TEST THE TRIGGER
INSERT INTO HR.Shift
(name,startTime,endTime,..)
VALUES()


---------------Database level Triiger
Create trigger demo_table
ON database
after create 
AS
BEGIN
print"creation of new tables onnot allowes"
ROLLBACK TRANSACTION
END
GO