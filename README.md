# Optimizing-Classroom-Utilization-at-Local-University


**Purpose** : This case study offers recommendations for optimizing classroom portfolios at a local university. This university has diverse classrooms that vary in size, capacity, configuration, condition, and intended use. I analyzed the data using Excel and SQL and analyzed to examine the provided dataset to evaluate classroom utilization and provide insights for optimization.

**Dataset 1: (Room Data)**

1. Room Number
2. Department (this is the department that owns and manages the space)
3. Room capacity (the maximum number of student seats in the room)
4. Room configuration (fixed vs. flexible furniture)
5. Room condition score (values between 1 and 10; 1=poor; 10=great condition)

**Dataset 2: (Room Use Data)**

1. Room Number
2. Hours in use (number of hours this room is being scheduled per week)
3. Average occupancy when in use (average percent of seats that are occupied when the classroom is in use)


**Initial Analysis (Excel)**:

I created a consolidated sheet by merging the Room data and Room Use data using the common identifier, Room Number, to enable more effective analysis. During this process, I identified missing Room Use data for Room Numbers 296 and 364. As it was not possible to retrieve the missing data for these rooms, I filled the values with 0 to ensure accurate and consistent results during analysis.

**Data Analysis using SQL**:

-- Create Database and Table structure

**Query:** 

Create Database University_Utilization;

**Query:** 

Use University_Utilization;

**Query:** 

Create Table RoomData (
    Department_Assignment Varchar(50),
    Room_Number Varchar(10) Primary Key,
    Room_Capacity Int,
    Room_Configuration Varchar(50),
    Room_Condition_Score Int
);

**Query:**

Create Table RoomUseData (
    Room_Number Varchar(10) Primary Key,
    Hours_In_Use_Per_Week Int,
    Average_Occupancy_Percentage Decimal(5,2)


-- Note: Loaded data using Excel CSV via Import function in both the tables

**-- 1. View all records from Tables 1 and 2**

**Query:**

Select * 
From RoomData;

**Result:**

<img width="566" alt="Screenshot 2025-05-07 at 10 36 41 AM" src="https://github.com/user-attachments/assets/cfceccad-b852-4c7b-80de-2b6bb1365b5d" />

**Query:**

Select * 
From RoomUseData;

**Result:**

<img width="414" alt="Screenshot 2025-05-07 at 10 38 28 AM" src="https://github.com/user-attachments/assets/2cd7e473-9052-4bdf-8305-23ce9be2cec9" />


**-- 2. Combine both tables on Room Number ,which isa  Common identifier ,usingan  Inner join**

**Query:**

<img width="335" alt="Screenshot 2025-05-07 at 10 49 30 AM" src="https://github.com/user-attachments/assets/09fa2483-2caa-4859-acce-581309e1e961" />

**Result:**

<img width="793" alt="Screenshot 2025-05-07 at 10 39 13 AM" src="https://github.com/user-attachments/assets/8cb16c78-9928-4b7e-9e78-53c4ea69440a" />



**-- 3. Count of rooms by department**

**Query:**

<img width="495" alt="Screenshot 2025-05-07 at 10 50 29 AM" src="https://github.com/user-attachments/assets/88fec973-72d3-4fe5-af56-ec21bcde4fa6" />



**Result:**

<img width="248" alt="Screenshot 2025-05-07 at 10 39 40 AM" src="https://github.com/user-attachments/assets/3c3061bd-af52-45de-a391-7a73c15fe9a9" />


**-- 4. Count of rooms from the Highest condition score to the lowest**

**Query:**

<img width="462" alt="Screenshot 2025-05-07 at 10 51 44 AM" src="https://github.com/user-attachments/assets/007fb1e3-1a83-4bfd-bf63-2a689bc8fd5f" />


**Result:**

<img width="225" alt="Screenshot 2025-05-07 at 10 40 08 AM" src="https://github.com/user-attachments/assets/f54bfccb-27f9-473d-91cd-6f7725c82836" />


**-- 5. Average utilization per department**

**Query:**

<img width="572" alt="Screenshot 2025-05-07 at 10 52 45 AM" src="https://github.com/user-attachments/assets/5b10c2d0-d1b9-44b7-9bfc-5da00f412e83" />


**Result:**

<img width="427" alt="Screenshot 2025-05-07 at 10 40 47 AM" src="https://github.com/user-attachments/assets/cf360d4f-16e8-40d7-91c8-5347bde05e88" />



**-- 6. Add Utilization%  = (Hours Used / 40) * 100**

**Query:**

<img width="604" alt="Screenshot 2025-05-07 at 10 53 19 AM" src="https://github.com/user-attachments/assets/d27769a9-2385-4d5f-809e-b30cd95f9edc" />


**Result:**

<img width="475" alt="Screenshot 2025-05-07 at 10 41 30 AM" src="https://github.com/user-attachments/assets/ccacfd97-9513-4a4d-a30e-c38e1ad47688" />


**-- 7. Calculatethe  actual headcount when in use**

**Query:**

<img width="745" alt="Screenshot 2025-05-07 at 10 53 52 AM" src="https://github.com/user-attachments/assets/cefc3db7-66f3-4dcd-ab86-1ff414d45f28" />


**Result:**

<img width="611" alt="Screenshot 2025-05-07 at 10 42 01 AM" src="https://github.com/user-attachments/assets/a4738f75-bbcf-41fd-be17-ef29da92a434" />


**-- 8. Calculate Total Weekly Usage Hours by Department**

**Query:**

<img width="721" alt="Screenshot 2025-05-07 at 10 54 13 AM" src="https://github.com/user-attachments/assets/41a81878-6d22-47e3-bf76-9f306c84f94a" />


**Result:**

<img width="263" alt="Screenshot 2025-05-07 at 10 42 43 AM" src="https://github.com/user-attachments/assets/a7fb7c2a-1586-40d7-8184-ca7de1bff966" />


**-- 9. Identify Underutilized Rooms**

**Query:**

<img width="697" alt="Screenshot 2025-05-07 at 10 54 39 AM" src="https://github.com/user-attachments/assets/33e90645-7b2c-4077-8acb-9874ee50fd04" />


**Result:**

<img width="589" alt="Screenshot 2025-05-07 at 10 43 33 AM" src="https://github.com/user-attachments/assets/f403602f-b22a-4a75-8473-2b0234f065fb" />


**-- 10. Categorise rooms based on their usage capacity 
-- Utilization levels are categorized as:Underutilized: < 40% , Optimal:40% to 80%, Overutilized: > 80%**

**Query:**

<img width="689" alt="Screenshot 2025-05-07 at 10 55 20 AM" src="https://github.com/user-attachments/assets/59c3e057-65f6-4bdf-9047-aabbe8297ed3" />


**Result:**

<img width="625" alt="Screenshot 2025-05-07 at 10 44 08 AM" src="https://github.com/user-attachments/assets/5b3af1ac-252b-41f9-8b7a-49ce72a10cfa" />


**✅ Key Findings & Recommendations**

**1. Underutilized Classrooms (Occupancy < 40%)**

Finding: 

- Several rooms show low occupancy headcounts relative to their capacity.

Recommendation:

- Reassign smaller classes to smaller rooms to better match room size with actual attendance.

- Repurpose underutilized rooms (e.g., for meetings, study halls, or labs).

**2. Departments with Consistently Low Average Occupancy**
   
Finding: 

- Some departments have significantly lower average occupancy headcounts.

Recommendation:

- Conduct a curriculum review to see if class sizes or scheduling practices can be optimized.

- Encourage departments to offer fewer small in-person classes or bundle multiple small groups into shared sessions.

**3. High Weekly Usage but Low Headcount**
   
Finding: 

- Some rooms are used frequently (high weekly hours) but serve few students.

Recommendation:

- Investigate inefficient scheduling patterns (e.g., long class durations for small groups).

- Prioritize these rooms for reassignment or alternate use during off-peak times.

**4. Optimize Scheduling Based on Room Capacity & Demand**
   
Finding: 

- There’s a mismatch between room capacity and actual use.

Recommendation:

- Use the Average_Headcount metric to restructure the room assignment algorithm.

- Implement a centralized scheduling system to match class size with room size dynamically.

**5. Space Management Strategy**

Finding: 

- There’s a lack of uniformity in utilization.

Recommendation:

- Define a utilization threshold (e.g., ≥70% occupancy) and rotate low-performing rooms.

- Use these metrics to justify future investments or space reductions.


