# Optimizing-Classroom-Utilization-at-Local-University


**Purpose** : This case study offers recommendations for optimizing classroom portfolios at a local university in the Bay Area. This university has diverse classrooms that vary in size, capacity, configuration, condition, and intended use. I analyzed the data using Excel and conducted exploratory analysis, along with visualizations in Python, to examine the provided dataset. This analysis aims to uncover insights and develop strategies to enhance classroom utilization at the college.

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



**Initial Analysis**:

I created a consolidated sheet by merging the Room data and Room Use data using the common identifier, Room Number, to enable more effective analysis. During this process, I identified missing Room Use data for Room Numbers 296 and 364. As it was not possible to retrieve the missing data for these rooms, I filled the values with 0 to ensure accurate and consistent results during analysis.




