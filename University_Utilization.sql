-- Create Database and Table structure

Create Database University_Utilization;

Use University_Utilization;

Create Table RoomData (
    Department_Assignment Varchar(50),
    Room_Number Varchar(10) Primary Key,
    Room_Capacity Int,
    Room_Configuration Varchar(50),
    Room_Condition_Score Int
);

CREATE TABLE RoomUseData (
    Room_Number Varchar(10) Primary Key,
    Hours_In_Use_Per_Week Int,
    Average_Occupancy_Percentage Decimal(5,2)
);

-- Note: Loaded data using Excel CSV via Import funtion in both the tables

-- 1. View all records From Table 1 and 2

Select * 
From RoomData;

Select * 
From RoomUseData;

-- 2. Combined both the tables on Room Number which is Common Indentifier using Inner join

Select 
RD.Department_Assignment, 
RD.Room_Capacity, 
RD.Room_Configuration, 
RD.Room_Condition_Score, 
RUD. Hours_In_Use_Per_Week, 
RUD. Average_Occupancy_Percentage
From  RoomData RD
Join RoomUseData RUD
on RD.Room_Number = RUD. Room_Number;

-- 3. Count of rooms by department

Select Department_Assignment, COUNT(*) as Room_Count
From RoomData
Group by Department_Assignment;

-- 4. Count of rooms from Highest condition score to lowest

Select Room_Condition_Score, COUNT(*) as Room_Count
From RoomData
Group by Room_Condition_Score
Order by Room_Condition_Score Desc;

-- 5. Average utilization per department

Select 
RD.Department_Assignment, 
Avg(RUD.Hours_In_Use_Per_Week) as Avg_Hours_Used, 
Avg(RUD.Average_Occupancy_Percentage*100) as Avg_Occupancy_Percent
From RoomData RD
join RoomUseData RUD
on RD.Room_Number = RUD. Room_Number
Group by RD.Department_Assignment
Order by RD.Department_Assignment;

-- 6. Add Utilization % = (Hours Used / 40) * 100
Select 
RD.Room_Number, 
RD.Department_Assignment, 
RUD.Hours_In_Use_Per_Week, 
Round((RUD.Hours_In_Use_Per_Week/40.00)*100,2) as Utilization_Percent
From RoomData RD
join RoomUseData RUD
on RD.Room_Number = RUD. Room_Nu$mber
Group by RD.Room_Number
Order by RD.Room_Number;

-- 7.Calculate actual headcount when in use
Select 
RD.Room_Number, 
RD.Department_Assignment, 
RD.Room_Capacity,
RUD.Average_Occupancy_Percentage*100 as Average_Occupancy_Percentage, 
Round(RD.Room_Capacity * RUD.Average_Occupancy_Percentage, 0) AS Avg_Headcount
From RoomData RD
join RoomUseData RUD
on RD.Room_Number = RUD. Room_Number
Group by RD.Room_Number
Order by RD.Room_Number;

-- 8. Calculate Total Weekly Usage Hours by Department

Select RD.Department_Assignment, Sum(Hours_In_Use_Per_Week) as Total_Weekly_Hours
From RoomData RD
Join RoomUseData RUD
on RD.Room_Number = RUD.Room_Number
Group by RD.Department_Assignment
Order by Total_Weekly_Hours DESC;

-- 9. Identify Underutilized Rooms

Select 
RD.Room_Number,
RD.Department_Assignment,
RD.Room_Capacity,
RUD.Average_Occupancy_Percentage,
Round(RD.Room_Capacity * RUD.Average_Occupancy_Percentage,0) AS Avg_Headcount
From RoomData RD
Join RoomUseData RUD
On RD.Room_Number = RUD.Room_Number
Where RUD.Average_Occupancy_Percentage < 0.4
Order By Avg_Headcount;

-- 10. Categorise room based on their usage capacity 
-- Utilization levels are categorized as:Underutilized: < 40% , Optimal:40% to 80%, Overutilized: > 80%

Select 
RD.Room_Number,
RD.Department_Assignment,
RD.Room_Capacity,
RUD.Hours_In_Use_Per_Week/40 as Weekly_Utilization_Percent,
Case
   When RUD.Hours_In_Use_Per_Week/40 < 0.4 Then 'Under_Utilized_Room'
   When RUD.Hours_In_Use_Per_Week/40 Between 0.4 And 0.8 Then 'Optimal_Room'
   Else 'Over_Utilized_Room'
End as Utilization_Categories
From RoomData RD
Join RoomUseData RUD
On RD.Room_Number = RUD.Room_Number;
