-- Below are SQL commands to perform simple descriptive analytics on the atopic dermatitis dataset

-- Summarising count of trials for each age cohort and % of trials for each age cohort
select age, count(*) As number, count(age) / sum(count(age)) over() * 100 as pct
from ad_trials
group by age
order by pct desc;

-- Summarising count of trials at each phase cohort and % of trials at each phase
select Phases, count(*) As number, count(Phases) / sum(count(Phases)) over() * 100 as pct
from ad_trials
group by Phases
order by Phases desc;

-- Standard deviation of overall enrollment 
select stddev(Enrollment) as Enroll_std_dev
from ad_trials;

-- Average enrollment number and standard deviation of enrollment per phase
select Phases, avg(Enrollment) as Enroll_avg, stddev(Enrollment) as Enroll_std_dev
from ad_trials
group by Phases
order by Phases;

-- Count of interventional trials per phase
select Phases, StudyType, count(*) As number
from ad_trials
where StudyType = "INTERVENTIONAL"
group by Phases
order by Phases;

-- Count of observational trials per phase, with column showing % of trials at each phase which are observational
select Phases, StudyType, count(*) As number
from ad_trials
where StudyType = "OBSERVATIONAL"
group by Phases
order by Phases;

-- Count of trials with results per phase, with column showing % of trials at each phase which have results
select Phases, StudyResults, count(*) As number, count(Phases) / sum(count(Phases)) over() * 100 as pct
from ad_trials
where StudyResults = "Yes"
group by Phases
order by Phases;

-- Count of trials without results per phase, with column showing % of trials at each phase which do not have results
select Phases, StudyResults, count(*) As number, count(Phases) / sum(count(Phases)) over() * 100 as pct
from ad_trials
where StudyResults = "NO"
group by Phases
order by Phases

